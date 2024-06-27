﻿$PBExportHeader$pro_n_dsa.sru
$PBExportComments$(PRO) Extension DynamicStagingArea class
forward
global type pro_n_dsa from pfc_n_dsa
end type
end forward

global type pro_n_dsa from pfc_n_dsa
end type
global pro_n_dsa pro_n_dsa

on pro_n_dsa.create
call dynamicstagingarea::create
TriggerEvent( this, "constructor" )
end on

on pro_n_dsa.destroy
call dynamicstagingarea::destroy
TriggerEvent( this, "destructor" )
end on

