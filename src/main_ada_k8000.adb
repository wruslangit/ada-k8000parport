-- File   : main_ada_k8000.adb
-- Date   : Fri 01 Jan 2021 09:11:26 AM +08
-- Env    : Linux HPEliteBook8470p-Ub2004-rt38 5.4.66-rt38
-- #1 SMP PREEMPT_RT Sat Sep 26 16:51:59 +08 2020 x86_64 x86_64 x86_64 GNU/Linux
-- Author: WRY wruslandr@gmail.com
-- ========================================================
-- GNAT Studio Community 2020 (20200427) hosted on x86_64-pc-linux-gnu
-- GNAT 9.3.1 targetting x86_64-linux-gnu
-- SPARK Community 2020 (20200818)
--
-- 
-- ==========================================================
-- ADA STANDARD PACKAGES
with Ada.Text_IO;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions; use Interfaces.c.Extensions;
with Ada.Strings.Unbounded;

-- USER CREATED PACKAGES
with pkg_ada_dtstamp;
-- with pkg_ada_k8000;
with pkg_aada_k8000;

-- ========================================================
procedure main_ada_k8000 is
-- ========================================================
   package ATIO    renames Ada.Text_IO;
   package IFaceC  renames Interfaces.C; 
   package IFaceCE renames Interfaces.C.Extensions;
   package ASU     renames Ada.Strings.Unbounded;  

   package PADTS    renames pkg_ada_dtstamp;
   -- package PAK8000  renames pkg_ada_k8000;  -- K8000 Access direct to C-Code
   package PAAK8000 renames pkg_aada_k8000;    -- K8000 Access via Ada Code
   
   -- FOR ADA STRING PRINT MANIPULATION
   -- Introduced because we are interfacing C-code "IFaceC.char_array"
   -- with Ada strings in Ada-code. Ha ha ha.
   -- Where no string initialization is needed, created default empty
   
   UBdata : ASU.Unbounded_String; -- no initialization needed, default empty
   -- UBdata := ASU.To_Unbounded_String("Bismillah");      -- TESTING ONLY
   -- PADTS.dtstamp; ATIO.Put_Line(ASU.To_String(UBdata)); -- TESTING ONLY
   addr : IFaceC.unsigned_char := 5;
   len  : IFaceC.int := 8;
   
   card_no    : IFaceC.int    := 3;
   chip_no    : IFaceC.int    := 1;
   channel_no : IFaceC.int    := 2;
   data       : IFaceC.short  := 200;  -- MAX 200 array index
   dbg        : IFaceC.int    := 4;
   chain_no   : IFaceC.int    := 5;
   set_perm   : IFaceC.int    := 6;
   
   printer_no     : IFaceC.int    := 7;
   ret_printer_no : IFaceC.int    := 999;
   
begin

   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   -- PADTS.dtstamp; PARS232.ExeC_ada_current_working_directory;
   -- PADTS.dtstamp; PARS232.ExeC_ada_display_date_only;
   PADTS.dtstamp; ATIO.Put_Line ("Started main_ada_k8000.adb program.");
   ATIO.New_Line;
   -- =====================================================
   
   UBdata := ASU.To_Unbounded_String("Bismillah Alhamdulillah 3 times WRY.");  
   
   -- UNLESS K8000 BOARD IS CONNECTED, ALL BELOW IS JUST TESTING ONLY
-- ========================================================   
-- (1) Generic IC input/output procedures      
-- ========================================================   
   PADTS.dtstamp; PAAK8000.ExeA_ada_I2C_Send_Data(addr, UBdata, len); 
   PADTS.dtstamp; PAAK8000.ExeA_ada_I2C_Read_Data(addr, UBdata, len); 
   ATIO.New_Line;
-- ========================================================   
-- (2) IO input procedures        
-- ========================================================   
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_IO_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_all_IO;
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_IO_channel (channel_no);
   ATIO.New_Line;
-- ==============================================================
--  (3) IO output procedures                                       
-- **************************************************************
   PADTS.dtstamp; PAAK8000.ExeA_ada_IO_output (chip_no, data);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_IO_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_IO_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_IO_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_IO_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_all_IO;
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_all_IO;
   ATIO.New_Line;
-- ========================================================
-- (4) IO data update procedures                                  
-- ========================================================
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_IO_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_IO_data_array (chip_no, data);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_IO_data_array (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_IO_data_array (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_IO_channel_array (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_IO_channel_array (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_all_IO; 
   ATIO.New_Line;
-- ========================================================
-- (5) IO config procedures                                    
-- ========================================================
   PADTS.dtstamp; PAAK8000.ExeA_ada_configure_all_IO_as_input; 
   PADTS.dtstamp; PAAK8000.ExeA_ada_configure_all_IO_as_output; 
   PADTS.dtstamp; PAAK8000.ExeA_ada_configure_IO_chip_as_input (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_configure_IO_chip_as_output (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_configure_IO_channel_as_input (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_configure_IO_channel_as_output (channel_no);
   ATIO.New_Line;
-- ========================================================
-- (6) DAC output procedures                                   
-- ========================================================
   PADTS.dtstamp; PAAK8000.ExeA_ada_output_DAC_channel (channel_no, data);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_DAC_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_DAC_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_DAC_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_DAC_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_DAC_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_DAC_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_all_DAC; 
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_all_DAC; 
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_all_DAC; 
   ATIO.New_Line;
-- ========================================================
-- (7) DA output procedures                                    
-- ========================================================
   PADTS.dtstamp; PAAK8000.ExeA_ada_output_DA_channel (channel_no, data);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_DA_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_DA_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_DA_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_all_DA;
   PADTS.dtstamp; PAAK8000.ExeA_ada_clear_all_DA;
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_all_DA;
   ATIO.New_Line;
-- ========================================================
-- (8) AD input procedures                                         
-- ========================================================
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_AD_channel (channel_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_AD_chip (chip_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_all_AD;
   ATIO.New_Line;
-- ========================================================
-- (9) Complete card and general procedures                    
-- ========================================================
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_all;
   PADTS.dtstamp; PAAK8000.ExeA_ada_read_card (card_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_all;
   PADTS.dtstamp; PAAK8000.ExeA_ada_update_card (card_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_I2C_bus_not_busy;
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_I2C_bus_delay (dbg);
   PADTS.dtstamp; PAAK8000.ExeA_ada_select_chain (chain_no);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_debug (dbg);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_print_error (dbg);
   PADTS.dtstamp; PAAK8000.ExeA_ada_set_auto_permission (set_perm);
   ATIO.New_Line;   

   PADTS.dtstamp;
   ret_printer_no :=  PAAK8000.GetA_ada_select_I2C_printer_port (printer_no); 

   -- =====================================================   
   ATIO.New_Line;
   PADTS.dtstamp; ATIO.Put_Line ("Ended main_ada_k8000.adb program.");
   PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");

-- ========================================================
end main_ada_k8000;
-- ========================================================

