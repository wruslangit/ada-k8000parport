-- File: pkg_aada_k8000.adb

-- ========================================================
package body pkg_aada_k8000 is
-- ========================================================

-- ========================================================
-- PROCEDURES
-- ========================================================
-- ========================================================
-- (1) Generic IC input/output procedures
-- ========================================================   
-- raised STORAGE_ERROR : s-intman.adb:136 explicit raise
procedure ExeA_ada_I2C_Send_Data (addr : AIFaceC.unsigned_char; data : ASU.Unbounded_String; len : AIFaceC.int) is
begin
    AATIO.Put ("EXECUTE: ExeA_ada_I2C_Send_Data(");
    AATIO.Put (AIFaceC.unsigned_char'Image(addr) & ", " );
    AATIO.Put (ASU.To_String(data) & ", " );
    AATIO.Put_Line (AIFaceC.int'Image(len) & ")" ); 
  
    -- UNCOMMENT BELOW FOR REAL RUN  
    -- PAK8000.ExeC_ada_I2C_Send_Data(addr, data, len);
end ExeA_ada_I2C_Send_Data;     

-- ========================================================   
-- raised STORAGE_ERROR : s-intman.adb:136 explicit raise  
procedure ExeA_ada_I2C_Read_Data (addr : AIFaceC.unsigned_char; data : ASU.Unbounded_String; len : AIFaceC.int) is
begin
    AATIO.Put ("EXECUTE: ExeA_ada_I2C_Read_Data(");
    AATIO.Put (AIFaceC.unsigned_char'Image(addr) & ", " );
    AATIO.Put (ASU.To_String(data) & ", " );
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
   --AATIO.Put (AIFaceC.unsigned_char'Image(addr) & ", " );
   --AATIO.Put (ASU.To_String(data) & ", " );
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_IO_chip(chip_no);
end ExeA_ada_read_IO_chip;

-- ========================================================   
procedure ExeA_ada_read_all_IO is
begin
   AATIO.Put_Line ("EXECUTE: ExeA_ada_read_all_IO");
   --AATIO.Put (AIFaceC.unsigned_char'Image(addr) & ", " );
   --AATIO.Put (ASU.To_String(data) & ", " );
   --AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ")" ); 
   
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeC_ada_read_all_IO;
end ExeA_ada_read_all_IO;

-- ========================================================   
procedure ExeA_ada_read_IO_channel (channel_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_read_IO_channel(");
   --AATIO.Put (AIFaceC.unsigned_char'Image(addr) & ", " );
   --AATIO.Put (ASU.To_String(data) & ", " );
   AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.Exec_ada_read_IO_channel (channel_no);
end ExeA_ada_read_IO_channel;

-- ========================================================
--  (3) IO output procedures                                       
-- ========================================================
procedure ExeA_ada_IO_output (chip_no : AIFaceC.int; data : AIFaceC.short) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_IO_output(");
   AATIO.Put (AIFaceC.int'Image(chip_no) & ", " );
   AATIO.Put_line (AIFaceC.short'Image(data) & ")" );
   --AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeA_ada_IO_output (chip_no, data); 
end ExeA_ada_IO_output;

-- ========================================================   
procedure ExeA_ada_clear_IO_chip (chip_no : AIFaceC.int) is
begin
   AATIO.Put ("EXECUTE: ExeA_ada_clear_IO_chip(");
   AATIO.Put_Line (AIFaceC.int'Image(chip_no) & ") " );
   --AATIO.Put_line (AIFaceC.short'Image(data) & ")" );
   --AATIO.Put_Line (AIFaceC.int'Image(channel_no) & ")" ); 
 
   -- UNCOMMENT BELOW FOR REAL RUN     
   -- PAK8000.ExeA_ada_IO_output (chip_no, data); 
end ExeA_ada_clear_IO_chip;

-- ========================================================   
   
--procedure ExeA_ada_set_IO_chip (chip_no : AIFaceC.int);
--procedure ExeA_ada_set_IO_channel (channel_no : AIFaceC.int);
--procedure ExeA_ada_clear_IO_channel (channel_no : AIFaceC.int);
--procedure ExeA_ada_clear_all_IO;
--procedure ExeA_ada_set_all_IO;
   
      


-- ========================================================  
-- FUNCTIONS 
-- ========================================================
--function GetC_select_I2C_printer_port (printer_no : in AIFaceC.int) return AIFaceC.int is
--begin

--      ret_printer_no := PAK8000.GetC_ada_select_I2C_printer_port (printer_no); 
--      if (ret_printer_no >= 0) then
--		  AATIO.Put ("SUCCESS. RETURN PRINTER_NO: ret_printer_no = ");
--		  AATIO.Put (AIFaceC.int'Image(ret_printer_no)); AATIO.New_Line;
--	   end if;

--      return ret_printer_no;
--end GetC_select_I2C_printer_port;

  -- ======================================================
  begin

    null;
-- ========================================================
end pkg_aada_k8000;
-- ========================================================


