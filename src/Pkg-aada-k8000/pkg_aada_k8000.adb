-- File: pkg_aada_k8000.adb
-- Date: Fri 01 Jan 2021 09:11:26 AM +08
-- Author: WRY wruslandr@gmail.com

-- ========================================================
package body pkg_aada_k8000 is
-- ========================================================
-- PROCEDURES

-- ========================================================
-- (1) Generic IC input/output procedures
-- ========================================================   
-- raised STORAGE_ERROR : s-intman.adb:136 explicit raise
procedure ExeA_ada_I2C_Send_Data (addr : AIFaceC.unsigned_char; data : ASU.Unbounded_String; len : AIFaceC.int) is
begin
    AATIO.Put ("EXECUTE: ExeA_ada_I2C_Send_Data(");
    AATIO.Put (AIFaceC.unsigned_char'Image(addr) & "," );
    AATIO.Put (ASU.To_String(data) & "," );
    AATIO.Put_Line (AIFaceC.int'Image(len) & ")" ); 
  
    -- UNCOMMENT BELOW FOR REAL RUN  
    -- PAK8000.ExeC_ada_I2C_Send_Data(addr, data, len);
end ExeA_ada_I2C_Send_Data;     

-- ========================================================   
-- raised STORAGE_ERROR : s-intman.adb:136 explicit raise  
procedure ExeA_ada_I2C_Read_Data (addr : AIFaceC.unsigned_char; data : ASU.Unbounded_String; len : AIFaceC.int) is
begin
    AATIO.Put ("EXECUTE: ExeA_ada_I2C_Read_Data(");
    AATIO.Put (AIFaceC.unsigned_char'Image(addr) & "," );
    AATIO.Put (ASU.To_String(data) & "," );
    AATIO.Put_Line (AIFaceC.int'Image(len) & ")" ); 
      
    -- UNCOMMENT BELOW FOR REAL RUN  
    -- PAK8000.ExeC_ada_I2C_Read_Data(addr, data, len);
end ExeA_ada_I2C_Read_Data;

-- ========================================================   
-- (2) IO input procedures        
-- ========================================================   
procedure ExeA_ada_read_IO_chip (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_read_IO_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_IO_chip(chip_no);
end ExeA_ada_read_IO_chip;

-- ========================================================   
procedure ExeA_ada_read_all_IO is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_read_all_IO");

   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_all_IO;
end ExeA_ada_read_all_IO;

-- ========================================================   
procedure ExeA_ada_read_IO_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_read_IO_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_IO_channel (channel_no);
end ExeA_ada_read_IO_channel;

-- ========================================================
--  (3) IO output procedures                                       
-- ========================================================
procedure ExeA_ada_IO_output (chip_no : AIFaceC.int; data : AIFaceC.short) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_IO_output(");
   AATIO.Put (AIFaceC.int'Image(chip_no) & "," );
   AATIO.Put_line (AIFaceC.short'Image(data) & ")" );
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_IO_output (chip_no, data); 
end ExeA_ada_IO_output;

-- ========================================================   
procedure ExeA_ada_clear_IO_chip (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_IO_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_IO_chip (chip_no); 
end ExeA_ada_clear_IO_chip;

-- ========================================================   
procedure ExeA_ada_set_IO_chip (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_IO_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_IO_chip (chip_no);
end ExeA_ada_set_IO_chip;

-- ========================================================   
procedure ExeA_ada_set_IO_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_IO_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_IO_channel(channel_no);
end ExeA_ada_set_IO_channel ;
   
-- ========================================================   
procedure ExeA_ada_clear_IO_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_IO_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_IO_channel(channel_no);
end ExeA_ada_clear_IO_channel ;
   
-- ========================================================   
procedure ExeA_ada_clear_all_IO is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_clear_all_IO");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_all_IO;
end ExeA_ada_clear_all_IO;
   
-- ========================================================   
procedure ExeA_ada_set_all_IO is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_set_all_IO");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_all_IO;
end ExeA_ada_set_all_IO;   

-- ========================================================
-- (4) IO data update procedures                                  
-- ========================================================
procedure ExeA_ada_update_IO_chip (chip_no : AIFaceC.int) is 
begin
   AATIO.Put ("EXECUTE: ExeA_ada_update_IO_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_IO_chip (chip_no);
end ExeA_ada_update_IO_chip ;

-- ========================================================
procedure ExeA_ada_update_IO_data_array (chip_no : AIFaceC.int; data : AIFaceC.short) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_update_IO_data_array(");
   AATIO.Put (AIFaceC.int'Image(chip_no) & "," );
   AATIO.Put_line (AIFaceC.short'Image(data) & ")" );
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_IO_data_array (chip_no, data); 
end ExeA_ada_update_IO_data_array ;
  
-- ========================================================   
procedure ExeA_ada_clear_IO_data_array (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_IO_data_array(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_IO_data_array (chip_no);
end ExeA_ada_clear_IO_data_array ;
   
-- =======================================================   
procedure ExeA_ada_set_IO_data_array (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_IO_data_array(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_IO_data_array (chip_no);
end ExeA_ada_set_IO_data_array ;
      
-- ========================================================      
procedure ExeA_ada_set_IO_channel_array (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_IO_channel_array(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_IO_channel_array(channel_no);
end ExeA_ada_set_IO_channel_array ;
   
-- ========================================================   
procedure ExeA_ada_clear_IO_channel_array (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_IO_channel_array(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_IO_channel_array(channel_no);
end ExeA_ada_clear_IO_channel_array ;
   
-- ========================================================   
procedure ExeA_ada_update_all_IO is 
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_update_all_IO");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_all_IO;
end ExeA_ada_update_all_IO;   
     
-- ========================================================
-- (5) IO config procedures                                    
-- ========================================================
procedure ExeA_ada_configure_all_IO_as_input is 
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_configure_all_IO_as_input");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_configure_all_IO_as_input;
end ExeA_ada_configure_all_IO_as_input;   

-- ========================================================
procedure ExeA_ada_configure_all_IO_as_output is 
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_configure_all_IO_as_output");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_configure_all_IO_as_output;
end ExeA_ada_configure_all_IO_as_output;   

-- ========================================================   
procedure ExeA_ada_configure_IO_chip_as_input (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_configure_IO_chip_as_input(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_configure_IO_chip_as_input (chip_no);
end ExeA_ada_configure_IO_chip_as_input ;
   
-- ========================================================   
procedure ExeA_ada_configure_IO_chip_as_output (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_configure_IO_chip_as_output(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_configure_IO_chip_as_output (chip_no);
end ExeA_ada_configure_IO_chip_as_output ;
   
-- ========================================================   
procedure ExeA_ada_configure_IO_channel_as_input (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_configure_IO_channel_as_input(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_configure_IO_channel_as_input(channel_no);
end ExeA_ada_configure_IO_channel_as_input ;

-- ========================================================
procedure ExeA_ada_configure_IO_channel_as_output (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_configure_IO_channel_as_output(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_configure_IO_channel_as_output (channel_no);
end ExeA_ada_configure_IO_channel_as_output ;

-- ========================================================
-- (6) DAC output procedures                                   
-- ========================================================
procedure ExeA_ada_output_DAC_channel (channel_no : AIFaceC.int; data : AIFaceC.short) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_output_DAC_channel(");
   AATIO.Put (AIFaceC.int'Image(channel_no) & "," );
   AATIO.Put_line (AIFaceC.short'Image(data) & ")" );
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_output_DAC_channel (channel_no, data); 
end ExeA_ada_output_DAC_channel ;

-- ========================================================   
procedure ExeA_ada_update_DAC_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_update_DAC_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_DAC_channel (channel_no);
end ExeA_ada_update_DAC_channel;

-- ========================================================   
procedure ExeA_ada_clear_DAC_channel (channel_no : AIFaceC.int) is 
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_DAC_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_DAC_channel (channel_no);
end ExeA_ada_clear_DAC_channel;
   
-- ========================================================   
procedure ExeA_ada_set_DAC_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_DAC_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_DAC_channel (channel_no);
end ExeA_ada_set_DAC_channel;
   
-- ========================================================   
procedure ExeA_ada_update_DAC_chip (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_update_DAC_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_DAC_chip (chip_no);
end ExeA_ada_update_DAC_chip ;
   
-- ========================================================   
procedure ExeA_ada_clear_DAC_chip (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_DAC_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_DAC_chip (chip_no);
end ExeA_ada_clear_DAC_chip ;
   
-- ========================================================   
procedure ExeA_ada_set_DAC_chip (chip_no : AIFaceC.int) is 
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_DAC_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_DAC_chip (chip_no);
end ExeA_ada_set_DAC_chip ;
   
-- ========================================================   
procedure ExeA_ada_update_all_DAC is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_update_all_DAC");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_all_DAC;
end ExeA_ada_update_all_DAC;   

-- ========================================================   
procedure ExeA_ada_clear_all_DAC is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_clear_all_DAC");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_all_DAC;
end ExeA_ada_clear_all_DAC;   

-- ========================================================   
procedure ExeA_ada_set_all_DAC is 
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_set_all_DAC");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_all_DAC;
end ExeA_ada_set_all_DAC;               

-- ========================================================
-- (7) DA output procedures                                    
-- ========================================================
procedure ExeA_ada_output_DA_channel (channel_no : AIFaceC.int; data : AIFaceC.short) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_output_DA_channel(");
   AATIO.Put (AIFaceC.int'Image(channel_no) & "," );
   AATIO.Put_line (AIFaceC.short'Image(data) & ")" );
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_output_DA_channel (channel_no, data); 
end ExeA_ada_output_DA_channel ;

-- ========================================================   
procedure ExeA_ada_update_DA_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_update_DA_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_DA_channel (channel_no);
end ExeA_ada_update_DA_channel;

-- ========================================================   
procedure ExeA_ada_clear_DA_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_DA_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_DA_channel (channel_no);
end ExeA_ada_clear_DA_channel;

-- ========================================================   
procedure ExeA_ada_set_DA_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_DA_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_DA_channel (channel_no);
end ExeA_ada_set_DA_channel;

-- ========================================================
procedure ExeA_ada_update_all_DA is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_update_all_DA");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_all_DA;
end ExeA_ada_update_all_DA;     

-- ========================================================   
procedure ExeA_ada_clear_all_DA is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_clear_all_DA");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_clear_all_DA;
end ExeA_ada_clear_all_DA;        

-- ========================================================   
procedure ExeA_ada_set_all_DA is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_set_all_DA");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_all_DA;
end ExeA_ada_set_all_DA;     
           
-- ========================================================
-- (8) AD input procedures                                         
-- ========================================================
procedure ExeA_ada_read_AD_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_read_AD_channel(");
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_AD_channel (channel_no);
end ExeA_ada_read_AD_channel ;
   
-- ========================================================
procedure ExeA_ada_read_AD_chip (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_read_AD_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
  
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_AD_chip (chip_no);
end ExeA_ada_read_AD_chip ;
   
-- ========================================================   
procedure ExeA_ada_read_all_AD is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_read_all_AD");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_all_AD;
end ExeA_ada_read_all_AD;     
  
-- ========================================================
-- (9) Complete card and general procedures                    
-- ========================================================
procedure ExeA_ada_read_all is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_read_all");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_all;
end ExeA_ada_read_all;     
   
-- ========================================================   
procedure ExeA_ada_read_card (card_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_read_card(");
   AATIO.Put_Line (AIFaceC.int'Image(card_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_card (card_no);
end ExeA_ada_read_card ;
   
-- ========================================================   
procedure ExeA_ada_update_all is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_update_all");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_all;
end ExeA_ada_update_all;     
   
-- ========================================================   
procedure ExeA_ada_update_card (card_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_update_card(");
   AATIO.Put_Line (AIFaceC.int'Image(card_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_update_card (card_no);
end ExeA_ada_update_card ;
   
-- ========================================================   
procedure ExeA_ada_I2C_bus_not_busy is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_I2C_bus_not_busy");
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_I2C_bus_not_busy;
end ExeA_ada_I2C_bus_not_busy;     
   
-- ========================================================   
procedure ExeA_ada_set_I2C_bus_delay (dbg : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_I2C_bus_delay(");
   AATIO.Put_Line (AIFaceC.int'Image(dbg) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_I2C_bus_delay (dbg);
end ExeA_ada_set_I2C_bus_delay ;
      
-- ========================================================      
procedure ExeA_ada_select_chain (chain_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_select_chain(");
   AATIO.Put_Line (AIFaceC.int'Image(chain_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_select_chain (chain_no);
end ExeA_ada_select_chain ;
      
-- ========================================================      
procedure ExeA_ada_set_debug (dbg : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_debug(");
   AATIO.Put_Line (AIFaceC.int'Image(dbg) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_debug (dbg);
end ExeA_ada_set_debug ;

-- ========================================================      
procedure ExeA_ada_set_print_error (dbg : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_print_error(");
   AATIO.Put_Line (AIFaceC.int'Image(dbg) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_print_error (dbg);
end ExeA_ada_set_print_error ;

-- ========================================================      
procedure ExeA_ada_set_auto_permission (set_perm : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_set_auto_permission(");
   AATIO.Put_Line (AIFaceC.int'Image(set_perm) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_set_auto_permission (set_perm);
end ExeA_ada_set_auto_permission ;      

-- ========================================================  
-- FUNCTIONS 
-- ========================================================
function GetA_ada_select_I2C_printer_port (printer_no : in AIFaceC.int) return AIFaceC.int is
begin

     -- ret_printer_no := PAK8000.GetC_ada_select_I2C_printer_port (printer_no); 
     if (ret_printer_no >= 0) then
         AATIO.Put ("SUCCESS: GetA_ada_select_I2C_printer_port(");
         AATIO.Put (AIFaceC.int'Image(printer_no) & ") = ");
         AATIO.Put_Line (AIFaceC.int'Image(ret_printer_no));
     end if;

     return ret_printer_no;
end GetA_ada_select_I2C_printer_port;

-- ======================================================
begin

    null;
-- ========================================================
end pkg_aada_k8000;
-- ========================================================

