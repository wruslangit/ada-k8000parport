-- File: pkg_aada_k8000.ads
-- Date: Fri 01 Jan 2021 09:11:26 AM +08
-- Author: WRY wruslandr@gmail.com

with Ada.Text_IO;
with Interfaces.C; use  Interfaces.C;
with Interfaces.C.Extensions; use  Interfaces.C.Extensions;
with Ada.Strings.Unbounded; 

with pkg_ada_k8000;  -- THIS IS C-CODE INTERFACED/TRANSFERRED TO ADA SPECIFICATIONS

--n========================================================
package pkg_aada_k8000 is
-- ========================================================

   package AATIO    renames Ada.Text_IO;
   package AIFaceC  renames Interfaces.C;
   package AIFaceCE renames Interfaces.C.Extensions;
   package ASU      renames Ada.Strings.Unbounded;  
   
   package PAK8000  renames pkg_ada_k8000;


   ret_printer_no : AIFaceC.int := 999;



-- ========================================================
-- LIST OF PROCEDURES FOR ADA_K8000   
-- ========================================================
-- ========================================================
-- (1) Generic IC input/output procedures
-- ========================================================   
procedure ExeA_ada_I2C_Send_Data (addr : AIFaceC.unsigned_char; data : ASU.Unbounded_String; len : AIFaceC.int);
procedure ExeA_ada_I2C_Read_Data (addr : AIFaceC.unsigned_char; data : ASU.Unbounded_String; len : AIFaceC.int);

-- ========================================================   
-- (2) IO input procedures        
-- ========================================================   
procedure ExeA_ada_read_IO_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_read_all_IO;
procedure ExeA_ada_read_IO_channel (channel_no : AIFaceC.int);

-- ==============================================================
--  (3) IO output procedures                                       
-- **************************************************************
procedure ExeA_ada_IO_output (chip_no : AIFaceC.int; data : AIFaceC.short);
procedure ExeA_ada_clear_IO_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_set_IO_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_set_IO_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_clear_IO_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_clear_all_IO;
procedure ExeA_ada_set_all_IO;

-- ========================================================
-- (4) IO data update procedures                                  
-- ========================================================
procedure ExeA_ada_update_IO_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_update_IO_data_array (chip_no : AIFaceC.int; data : AIFaceC.short);
procedure ExeA_ada_clear_IO_data_array (chip_no : AIFaceC.int);
procedure ExeA_ada_set_IO_data_array (chip_no : AIFaceC.int);
procedure ExeA_ada_set_IO_channel_array (channel_no : AIFaceC.int);
procedure ExeA_ada_clear_IO_channel_array (channel_no : AIFaceC.int);
procedure ExeA_ada_update_all_IO; 

-- ========================================================
-- (5) IO config procedures                                    
-- ========================================================
procedure ExeA_ada_configure_all_IO_as_input; 
procedure ExeA_ada_configure_all_IO_as_output; 
procedure ExeA_ada_configure_IO_chip_as_input (chip_no : AIFaceC.int);
procedure ExeA_ada_configure_IO_chip_as_output (chip_no : AIFaceC.int);
procedure ExeA_ada_configure_IO_channel_as_input (channel_no : AIFaceC.int);
procedure ExeA_ada_configure_IO_channel_as_output (channel_no : AIFaceC.int);

-- ========================================================
-- (6) DAC output procedures                                   
-- ========================================================
procedure ExeA_ada_output_DAC_channel (channel_no : AIFaceC.int; data : AIFaceC.short);
procedure ExeA_ada_update_DAC_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_clear_DAC_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_set_DAC_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_update_DAC_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_clear_DAC_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_set_DAC_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_update_all_DAC; 
procedure ExeA_ada_clear_all_DAC; 
procedure ExeA_ada_set_all_DAC; 

-- ========================================================
-- (7) DA output procedures                                    
-- ========================================================
procedure ExeA_ada_output_DA_channel (channel_no : AIFaceC.int; data : AIFaceC.short);
procedure ExeA_ada_update_DA_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_clear_DA_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_set_DA_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_update_all_DA;
procedure ExeA_ada_clear_all_DA;
procedure ExeA_ada_set_all_DA;

-- ========================================================
-- (8) AD input procedures                                         
-- ========================================================
procedure ExeA_ada_read_AD_channel (channel_no : AIFaceC.int);
procedure ExeA_ada_read_AD_chip (chip_no : AIFaceC.int);
procedure ExeA_ada_read_all_AD;

-- ========================================================
-- (9) Complete card and general procedures                    
-- ========================================================
procedure ExeA_ada_read_all;
procedure ExeA_ada_read_card (card_no : AIFaceC.int);
procedure ExeA_ada_update_all;
procedure ExeA_ada_update_card (card_no : AIFaceC.int);
procedure ExeA_ada_I2C_bus_not_busy;
procedure ExeA_ada_set_I2C_bus_delay (dbg : AIFaceC.int);
procedure ExeA_ada_select_chain (chain_no : AIFaceC.int);
procedure ExeA_ada_set_debug (dbg : AIFaceC.int);
procedure ExeA_ada_set_print_error (dbg : AIFaceC.int);
procedure ExeA_ada_set_auto_permission (set_perm : AIFaceC.int);

-- ========================================================
-- LIST OF FUNCTIONS FOR ADA_K8000
-- ========================================================
function GetA_ada_select_I2C_printer_port (printer_no : in AIFaceC.int) return AIFaceC.int; 
   
-- ========================================================
end pkg_aada_k8000;
-- ========================================================

