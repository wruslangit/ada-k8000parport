/*************************************************************************************
 *   This file is part of k8055utils.                                                *
 *                                                                                   *
 *   Copyright (C) 2004              Nicolas Sutre     <nicolas.sutre@free.fr>       *
 *   Copyright (C) 2005              Bob Dempsey       <bdempsey_64@msn.com>         *
 *   Copyright (C) 2005              Julien Etelain    <julien.etelain@utbm.fr>      *
 *   Copyright (C) 2005              Edward Nys        <edward.ny@utbm.fr>           *
 *   Copyright (C) 2007, 2008, 2010  Rouven Spreckels  <qu1x@users.sourceforge.net>  *
 *                                                                                   *
 *   k8055utils is free software: you can redistribute it and/or modify              *
 *   it under the terms of the GNU General Public License as published by            *
 *   the Free Software Foundation, either version 3 of the License, or               *
 *   (at your option) any later version.                                             *
 *                                                                                   *
 *   k8055utils is distributed in the hope that it will be useful,                   *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of                  *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                   *
 *   GNU General Public License for more details.                                    *
 *                                                                                   *
 *   You should have received a copy of the GNU General Public License               *
 *   along with k8055utils.  If not, see <http://www.gnu.org/licenses/>.             *
 *************************************************************************************/

#ifndef _K8055_
#define _K8055_

#include <string>
#include <string.h>
#include <errno.h>

#define K8055_COUNT_DEV 4
#define K8055_COUNT_ID  5
#define K8055_COUNT_IA  2
#define K8055_COUNT_OD  8
#define K8055_COUNT_OA  2
#define K8055_COUNT_CNT 2

#define K8055_SIZE_IA   256
#define K8055_SIZE_OA   256
#define K8055_SIZE_DBT  5
#define K8055_SIZE_CNT  65536

#define K8055_TIMEOUT   200
#define K8055_DELAY     20

#define K8055_IDVENDOR    0x10cf

#define K8055_DEVICE_0    0x5500
#define K8055_DEVICE_1    0x5501
#define K8055_DEVICE_2    0x5502
#define K8055_DEVICE_3    0x5503

#define K8055_INIT        0x00
#define K8055_SET_DBT_1   0x01
#define K8055_SET_DBT_2   0x02
#define K8055_RESET_CNT_1 0x03
#define K8055_RESET_CNT_2 0x04
#define K8055_SET_OUTPUT  0x05

#define K8055_DBTC_0      1
#define K8055_DBTC_2      3
#define K8055_DBTC_10     8
#define K8055_DBTC_1000   88
#define K8055_DBTC_5000   255
#define K8055_DBTC_KEEP   0

#define K8055_WRITE       0x01
#define K8055_READ        0x81
#define K8055_SIZE        8

class k8055 {
	unsigned char id, ready, input, output;
	void exec(unsigned char);
	struct usb_dev_handle *device;
public:
	unsigned char treshold[K8055_COUNT_IA];
	struct input {
		unsigned char analogue[K8055_COUNT_IA];
		unsigned short counter[K8055_COUNT_CNT];
		unsigned char digital;
	};
	struct output {
		unsigned char analogue[K8055_COUNT_OA];
		unsigned char digital;
	};
	struct packet {
		struct input input;
		struct output output;
	} current, previous;
	struct error {
		std::string msg, err;
		int num;
		error(std::string m, int n) {
			msg = m;
			num = n;
			err = strerror(errno);
		}
	};
	k8055(unsigned char);
	~k8055();
	void open(char);
	void write(struct output *);
	char apply(struct output *);
	char read(char, struct input *);
	void debounce(unsigned char, char);
	void reset(char);
	char changed();
	char applied();
	void close();
};

#endif
