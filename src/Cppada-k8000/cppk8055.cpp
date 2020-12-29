/*
-- File	: cppk8055.cpp
-- Date	: Tue 29 Dec 2020 05:30:17 PM +08
-- Env	: Linux HPEliteBook8470p-Ub2004-rt38 5.4.66-rt38
-- #1 SMP PREEMPT_RT Sat Sep 26 16:51:59 +08 2020 x86_64 x86_64 x86_64 GNU/Linux
-- Author: WRY
-- ========================================================
-- GNAT Studio Community 2020 (20200427) hosted on x86_64-pc-linux-gnu
-- GNAT 9.3.1 targetting x86_64-linux-gnu
-- SPARK Community 2020 (20200818)
*/
// ========================================================
#include <usb.h>

#include "cppk8055.hpp"

k8055::k8055(unsigned char i = 0) {
	id     = i;
	ready  = false;
	input = false;
	output = false;
	device = 0;
	memset(treshold, 0, sizeof treshold);
	memset(&current, 0, sizeof current);
	memset(&previous, 0, sizeof previous);
}

k8055::~k8055() {
	close();
}

void k8055::open(char i = -1) {
	if (i > -1) id = i;
	short addr;
	switch (id) {
		case 0  : addr = K8055_DEVICE_0; break;
		case 1  : addr = K8055_DEVICE_1; break;
		case 2  : addr = K8055_DEVICE_2; break;
		case 3  : addr = K8055_DEVICE_3; break;
		default : addr = K8055_DEVICE_0; break;
	}
	ready = 0;
	device = 0;
	usb_init();
	struct usb_bus *bus;
	struct usb_device *dev;
	usb_find_busses();
	usb_find_devices();
 	for (bus = usb_busses; bus; bus = bus->next) {
		for (dev = bus->devices; dev; dev = dev->next) {
			if (dev->descriptor.idVendor == K8055_IDVENDOR and dev->descriptor.idProduct == addr) {
				device = usb_open(dev);
				#if defined(LIBUSB_HAS_DETACH_KERNEL_DRIVER_NP)
				usb_detach_kernel_driver_np(device, 0);
				#endif
 				usb_set_configuration(device, 1);
				if (usb_claim_interface(device, 0) < 0)
					throw error("Cannot claim device", 1);
				ready = true;
				exec(K8055_INIT);
				return;
			}
		}
	}
	throw error("No device found", 2);
}

void k8055::exec(unsigned char cmd) {
	if (!ready)
		throw error("Device not opened", 3);
	unsigned char data[K8055_SIZE] = { cmd, 0, 0, 0, 0, 0, 0, 0 };
	if (0 > usb_interrupt_write(device, K8055_WRITE, (char *)data, K8055_SIZE, K8055_TIMEOUT)) {
		ready = false;
		throw error("Command execution failed", 4);
	}
}

void k8055::debounce(unsigned char mode, char n = -1) {
	if (!ready)
		throw error("Device not opened", 5);
	switch (mode) {
		case 0  : mode = K8055_DBTC_0;    break;
		case 1  : mode = K8055_DBTC_2;    break;
		case 2  : mode = K8055_DBTC_10;   break;
		case 3  : mode = K8055_DBTC_1000; break;
		case 4  : mode = K8055_DBTC_5000; break;
		default : mode = K8055_DBTC_0;    break;
	}
	if (0 > n or n == 0) {
		unsigned char data[K8055_SIZE] = { K8055_SET_DBT_1, 0, 0, 0, 0, 0, mode, K8055_DBTC_KEEP };
		if (0 > usb_interrupt_write(device, K8055_WRITE, (char *)data, K8055_SIZE, K8055_TIMEOUT))
			throw error("Cannot set debounce time for digital input #1", 6);
	}
	if (0 > n or n == 1) {
		unsigned char data[K8055_SIZE] = { K8055_SET_DBT_2, 0, 0, 0, 0, 0, K8055_DBTC_KEEP, mode };
		if (0 > usb_interrupt_write(device, K8055_WRITE, (char *)data, K8055_SIZE, K8055_TIMEOUT))
			throw error("Cannot set debounce time for digital input #2", 7);
	}
}

void k8055::write(struct output *store = 0) {
	if (!ready)
		throw error("Device not opened", 8);
	if (store) current.output = *store;
	unsigned char data[K8055_SIZE] = { K8055_SET_OUTPUT, current.output.digital, current.output.analogue[0], current.output.analogue[1], 0, 0, 0, 0 };
	if (0 > usb_interrupt_write(device, K8055_WRITE, (char *)data, K8055_SIZE, K8055_TIMEOUT))
		throw error("Cannot write to device", 9);
	previous.output = current.output;
}

char k8055::apply(struct output *store = 0) {
	if (store) current.output = *store;
	for (int i = 0; i < K8055_COUNT_OA; ++i) {
		if (current.output.analogue[i] != previous.output.analogue[i]) {
			output = true;
			break;
		}
	}
	if (current.output.digital != previous.output.digital) output = true;
	if (output) {
		write();
		return true;
	}
	return false;
}

char k8055::read(char fix = true, struct input *store = 0) {
	if (!ready)
		throw error("Device not opened", 10);
	unsigned char data[K8055_SIZE] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	if (0 > usb_interrupt_read(device, K8055_READ, (char *)data, K8055_SIZE, K8055_TIMEOUT))
		throw error("Cannot read from device", 11);
	if (fix and 0 > usb_interrupt_read(device, K8055_READ, (char *)data, K8055_SIZE, K8055_TIMEOUT))
		throw error("Cannot fix reading from device", 12);
	current.input.analogue[0] = data[2];
	current.input.analogue[1] = data[3];
	current.input.digital     = ((data[0] & 0x10) >> 4) | ((data[0] & 0x20) >> 4) | ((data[0] & 0x01) << 2) | ((data[0] & 0x40) >> 3) | ((data[0] & 0x80) >> 3);
	current.input.counter[0]  = data[4] | data[5] << 8;
	current.input.counter[1]  = data[6] | data[7] << 8;
	if (store) *store = current.input;
	char changed = false;
	for (int i = 0; i < K8055_COUNT_IA; ++i) {
		if (current.input.analogue[i] < previous.input.analogue[i] - treshold[i] or current.input.analogue[i] > previous.input.analogue[i] + treshold[i]) {
			previous.input.analogue[i] = current.input.analogue[i];
			changed = true;
		}
	}
	if (current.input.digital != previous.input.digital) {
		previous.input.digital = current.input.digital;
		changed = true;
	}
	for (int i = 0; i < K8055_COUNT_CNT; ++i) {
		if (current.input.counter[i] != previous.input.counter[i]) {
			previous.input.counter[i] = current.input.counter[i];
			changed = true;
		}
	}
	if (changed) {
		return input = changed;
	}
	return false;
}

void k8055::reset(char n = -1) {
	if (0 > n or n == 0)
		exec(K8055_RESET_CNT_1);
	if (0 > n or n == 1)
		exec(K8055_RESET_CNT_2);
}

char k8055::changed() {
	if (input) {
		input = false;
		return true;
	}
	return false;
}

char k8055::applied() {
	if (output) {
		output = false;
		return true;
	}
	return false;
}

void k8055::close() {
	if (!ready) return;
	try {
		exec(K8055_INIT);
		usb_close(device);
	}
	catch (...) {}
	ready = false;
}
