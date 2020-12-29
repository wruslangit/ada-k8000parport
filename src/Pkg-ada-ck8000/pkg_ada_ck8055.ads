-- File   : pkg_ada_ck8055.ads
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

-- TO INTERFACE TO C, just create the spec ads file, not the adb file, 
-- Otherwise, we have an infinite recursion. Just spec and no body.

-- ========================================================
package pkg_ada_ck8055 is
-- ========================================================

   package IFaceC  renames Interfaces.C; 
   package IFaceCE renames Interfaces.C.Extensions;
   
   -- Aspect specification only (ads file) and not body (adb file).
   -- Convention used in this specification
   -- (1) For Ada to call void C-function, use "ExeC_" as prefix 
   -- (2) For Ada to call return-value C-function, use "GetC_" prefix.
 
 -- SECTION ON ADA INTERFACE TO C-PROCEDURES 
 -- ======================================================
 
 -- void current_working_directory(void)  
-- procedure ExeC_ada_current_working_directory
--     with Import => True, Convention => C,
--     External_Name => "current_working_directory";    
 
 -- void display_date_only(void)  
 -- procedure ExeC_ada_display_date_only
 --    with Import => True, Convention => C,
 --    External_Name => "display_date_only";    
 
 
   
-- SECTION ON ADA INTERFACE TO C-FUNCTIONS
-- =====================================================
 
-- int crs232_open_device(int serialdev_num, int baudrate, const char *mode, int flowctrl);
-- function GetC_adars232_open_device(dev_num, baudrate : in IFaceC.int; mode : in IfaceC.char_array; flowctrl : in IFaceC.int) return --IFaceC.int    
--     with Import => True, Convention => C, 
--     External_Name => "crs232_open_device";   





-- ========================================================      
end pkg_ada_ck8055;
-- ======================================================== 
