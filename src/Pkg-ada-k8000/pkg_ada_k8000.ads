-- File   : pkg_ada_k8000.ads
-- Date   : Tue 29 Dec 2020 05:30:17 PM +08
-- Env	  : Linux HPEliteBook8470p-Ub2004-rt38 5.4.66-rt38
-- #1 SMP PREEMPT_RT Sat Sep 26 16:51:59 +08 2020 x86_64 x86_64 x86_64 GNU/Linux
-- Author: WRY wruslandr@gmail.com
-- ========================================================
-- GNAT Studio Community 2020 (20200427) hosted on x86_64-pc-linux-gnu
-- GNAT 9.3.1 targetting x86_64-linux-gnu
-- SPARK Community 2020 (20200818)
--
-- ========================================================
with Interfaces.C;
with Interfaces.C.Extensions;
with Ada.Strings.Unbounded;  

-- TO INTERFACE TO C, just create the spec ads file, not the adb file, 
-- Otherwise, we have an infinite recursion. Just spec and no body.

-- ========================================================
package pkg_ada_k8000 is
-- ========================================================

   package IFaceC  renames Interfaces.C; 
   package IFaceCE renames Interfaces.C.Extensions;
   package ASU      renames Ada.Strings.Unbounded; 
   -- Aspect specification only (ads file) and not body (adb file).
   -- Convention used in this specification
   -- (1) For Ada to call void C-function, use "ExeC_" as prefix 
   -- (2) For Ada to call return-value C-function, use "GetC_" prefix.

-- ========================================================   
-- SECTION ON ADA INTERFACE TO C-PROCEDURES 
-- ========================================================
 
-- ========================================================
-- (1) Generic IC input/output procedures
-- ========================================================   
-- extern void (*I2cSendData)(byte addr, byte *data, int len);
procedure ExeC_ada_I2C_Send_Data (addr : IFaceC.unsigned_char; data : ASU.Unbounded_String; len : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "*I2cSendData";    

-- extern void (*I2cReadData)(byte addr,byte *data,int len);
procedure ExeC_ada_I2C_Read_Data (addr : IFaceC.unsigned_char; data : ASU.Unbounded_String; len : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "*I2cReadData";    

-- ========================================================   
-- (2) IO input procedures        
-- ========================================================   
-- void ReadIOchip(int chip_no);
procedure ExeC_ada_read_IO_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ReadIOchip";    

-- void ReadAllIO(void);
procedure ExeC_ada_read_all_IO
    with Import => True, Convention => C,
    External_Name => "ReadAllIO";    

-- void ReadIOchannel(int channel_no);
procedure ExeC_ada_read_IO_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ReadIOchannel";    

-- ==============================================================
--  (3) IO output procedures                                       
-- **************************************************************
-- void IOoutput(int chip_no, short data);
procedure ExeC_ada_IO_output (chip_no : IFaceC.int; data : IFaceC.short)
    with Import => True, Convention => C,
    External_Name => "IOoutput";   

-- void ClearIOchip(int chip_no);
procedure ExeC_ada_clear_IO_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ClearIOchip";   
   
-- void SetIOchip(int chip_no);
procedure ExeC_ada_set_IO_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetIOchip";   
   
-- void SetIOchannel(int channel_no);
procedure ExeC_ada_set_IO_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetIOchannel";   
   
-- void ClearIOchannel(int channel_no);
procedure ExeC_ada_clear_IO_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ClearIOchannel";   
   
-- void ClearAllIO(void);
procedure ExeC_ada_clear_all_IO
    with Import => True, Convention => C,
    External_Name => "ClearAllIO";   
   
-- void SetAllIO(void);
procedure ExeC_ada_set_all_IO
    with Import => True, Convention => C,
    External_Name => "SetAllIO";   

-- ========================================================
-- (4) IO data update procedures                                  
-- ========================================================
-- void UpdateIOchip(int chip_no);
procedure ExeC_ada_update_IO_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "UpdateIOchip";   
   
-- void UpdateIOdataArray(int chip_no, short data);
procedure ExeC_ada_update_IO_data_array (chip_no : IFaceC.int; data : IFaceC.short)
    with Import => True, Convention => C,
    External_Name => "UpdateIOdataArray";   
   
-- void ClearIOdataArray(int chip_no);
procedure ExeC_ada_clear_IO_data_array (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ClearIOdataArray";   
   
-- void SetIOdataArray(int chip_no);
procedure ExeC_ada_set_IO_data_array (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetIOdataArray";   
   
-- void SetIOchArray(int channel_no);
procedure ExeC_ada_set_IO_channel_array (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetIOchArray";   
  
-- void ClearIOchArray(int channel_no);
procedure ExeC_ada_clear_IO_channel_array (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ClearIOchArray";  
   
-- void UpdateAllIO(void);
procedure ExeC_ada_update_all_IO 
    with Import => True, Convention => C,
    External_Name => "UpdateAllIO";  
   
-- ========================================================
-- (5) IO config procedures                                    
-- ========================================================
-- void ConfigAllIOasInput(void);
procedure ExeC_ada_configure_all_IO_as_input 
    with Import => True, Convention => C,
    External_Name => "ConfigAllIOasInput";  
   
-- void ConfigAllIOasOutput(void);
procedure ExeC_ada_configure_all_IO_as_output 
    with Import => True, Convention => C,
    External_Name => "ConfigAllIOasOutput";  
   
-- void ConfigIOchipAsInput(int chip_no);
procedure ExeC_ada_configure_IO_chip_as_input (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ConfigIOchipAsInput";   
   
-- void ConfigIOchipAsOutput(int chip_no);
procedure ExeC_ada_configure_IO_chip_as_output (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ConfigIOchipAsOutput";   
   
-- void ConfigIOchannelAsInput(int channel_no);
procedure ExeC_ada_configure_IO_channel_as_input (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ConfigIOchannelAsInput";   
   
-- void ConfigIOchannelAsOutput(int channel_no);
procedure ExeC_ada_configure_IO_channel_as_output (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ConfigIOchannelAsOutput";   
   
-- ========================================================
-- (6) DAC output procedures                                   
-- ========================================================
-- void OutputDACchannel(int channel_no, int data);
procedure ExeC_ada_output_DAC_channel (channel_no : IFaceC.int; data : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "OutputDACchannel";   
   
-- void UpdateDACchannel(int channel_no);
procedure ExeC_ada_update_DAC_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "UpdateDACchannel";   
   
-- void ClearDACchannel(int channel_no);
procedure ExeC_ada_clear_DAC_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ClearDACchannel";   
   
-- void SetDACchannel(int channel_no);
procedure ExeC_ada_set_DAC_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetDACchannel";   
   
-- void UpdateDACchip(int chip_no);
procedure ExeC_ada_update_DAC_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "UpdateDACchip";   

-- void ClearDACchip(int chip_no);
procedure ExeC_ada_clear_DAC_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ClearDACchip";   
   
-- void SetDACchip(int chip_no);
procedure ExeC_ada_set_DAC_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetDACchip";   
   
-- void UpdateAllDAC(void);
procedure ExeC_ada_update_all_DAC 
    with Import => True, Convention => C,
    External_Name => "UpdateAllDAC";  
   
-- void ClearAllDAC(void);
procedure ExeC_ada_clear_all_DAC 
    with Import => True, Convention => C,
    External_Name => "ClearAllDAC";  
   
-- void SetAllDAC(void);
procedure ExeC_ada_set_all_DAC 
    with Import => True, Convention => C,
    External_Name => "SetAllDAC";  
  
-- ========================================================
-- (7) DA output procedures                                    
-- ========================================================
-- void OutputDAchannel(int channel_no, int data);
procedure ExeC_ada_output_DA_channel (channel_no : IFaceC.int; data : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "OutputDAchannel";   
   
-- void UpdateDAchannel(int channel_no);
procedure ExeC_ada_update_DA_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "UpdateDAchannel";   
   
-- void ClearDAchannel(int channel_no);
procedure ExeC_ada_clear_DA_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ClearDAchannel";   
   
-- void SetDAchannel(int channel_no);
procedure ExeC_ada_set_DA_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetDAchannel";   
   
-- void UpdateAllDA(void);
procedure ExeC_ada_update_all_DA
    with Import => True, Convention => C,
    External_Name => "UpdateAllDA";   
   
-- void ClearAllDA(void);
procedure ExeC_ada_clear_all_DA
    with Import => True, Convention => C,
    External_Name => "ClearAllDA";   
   
-- void SetAllDA(void);
procedure ExeC_ada_set_all_DA
    with Import => True, Convention => C,
    External_Name => "SetAllDA";   
   
-- ========================================================
-- (8) AD input procedures                                         
-- ========================================================
-- void ReadADchannel(int channel_no);
procedure ExeC_ada_read_AD_channel (channel_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ReadADchannel";   
   
-- void ReadADchip(int chip_no);
procedure ExeC_ada_read_AD_chip (chip_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ReadADchip";   
   
-- void ReadAllAD(void);
procedure ExeC_ada_read_all_AD
    with Import => True, Convention => C,
    External_Name => "ReadAllAD";   
   
-- ========================================================
-- (9) Complete card and general procedures                    
-- ========================================================
-- void ReadAll(void);
procedure ExeC_ada_read_all
    with Import => True, Convention => C,
    External_Name => "ReadAll";   
   
-- void ReadCard(int card_no);
procedure ExeC_ada_read_card (card_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "ReadCard";   
   
-- void UpdateAll(void);
procedure ExeC_ada_update_all
    with Import => True, Convention => C,
    External_Name => "UpdateAll";   
   
-- void UpdateCard(int card_no);
procedure ExeC_ada_update_card (card_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "UpdateCard";   
   
-- void I2CBusNotBusy(void);
procedure ExeC_ada_I2C_bus_not_busy
    with Import => True, Convention => C,
    External_Name => "I2CBusNotBusy";   
   
-- void SetI2CBusdelay(int delay);
procedure ExeC_ada_set_I2C_bus_delay (d : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetI2CBusdelay";   

-- void SelectChain(int chain_no);
procedure ExeC_ada_select_chain (chain_no : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SelectChain";   
   
-- void SetDebug(int d);
procedure ExeC_ada_set_debug (d : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetDebug";   
   
-- void SetPrintError(int d);
procedure ExeC_ada_set_print_error (d : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetPrintError";   
   
-- void SetAutoPerm(int set);
procedure ExeC_ada_set_auto_permission (set : IFaceC.int)
    with Import => True, Convention => C,
    External_Name => "SetAutoPerm";  

-- =====================================================   
-- SECTION ON ADA INTERFACE TO C-FUNCTIONS
-- =====================================================
-- int  SelectI2CprinterPort(int Printer_no);
--function GetC_ada_select_I2C_printer_port (printer_no : in IFaceC.int) return IFaceC.int    
--     with Import => True, Convention => C, 
--     External_Name => "SelectI2CprinterPort";   

-- ========================================================      
end pkg_ada_k8000;
-- ======================================================== 
