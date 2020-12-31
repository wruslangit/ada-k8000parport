-- File   : main_ada_k8000.adb
-- Date   : Tue 29 Dec 2020 05:30:17 PM +08
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
   -- package PAK8000  renames pkg_ada_k8000;
   package PAAK8000 renames pkg_aada_k8000;
   
   -- FOR ADA STRING PRINT MANIPULATION
   -- Introduced because we are interfacing C-code "IFaceC.char_array"
   -- with Ada strings in Ada-code. Ha ha ha.
   -- Where no string initialization is needed, created default empty
   
   UBdata : ASU.Unbounded_String; -- no initialization needed, default empty
   -- UBdata := ASU.To_Unbounded_String("Bismillah");      -- TESTING ONLY
   -- PADTS.dtstamp; ATIO.Put_Line(ASU.To_String(UBdata)); -- TESTING ONLY
   addr : IFaceC.unsigned_char := 5;
   len  : IFaceC.int := 8;
   
   chip_no    : IFaceC.int    := 1;
   channel_no : IFaceC.int    := 2;
   data       : IFaceC.short  := 200;  -- MAX 200 array index
   
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
--procedure ExeA_ada_set_IO_chip (chip_no : AIFaceC.int);
--procedure ExeA_ada_set_IO_channel (channel_no : AIFaceC.int);
--procedure ExeA_ada_clear_IO_channel (channel_no : AIFaceC.int);
--procedure ExeA_ada_clear_all_IO;
--procedure ExeA_ada_set_all_IO;
   
   
   
   
   
   
   -- =====================================================   
   ATIO.New_Line;
   PADTS.dtstamp; ATIO.Put_Line ("Ended main_ada_k8000.adb program.");
   PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");

-- ========================================================
end main_ada_k8000;
-- ========================================================

