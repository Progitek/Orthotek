$PBExportHeader$pro_n_cst_platformwin32.sru
$PBExportComments$(PRO) Extension Win32 Cross Platform service
forward
global type pro_n_cst_platformwin32 from pfc_n_cst_platformwin32
end type
end forward

global type pro_n_cst_platformwin32 from pfc_n_cst_platformwin32
end type
global pro_n_cst_platformwin32 pro_n_cst_platformwin32

on pro_n_cst_platformwin32.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_platformwin32.destroy
TriggerEvent( this, "destructor" )
end on

