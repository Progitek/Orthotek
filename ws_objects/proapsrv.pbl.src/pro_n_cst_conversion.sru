﻿$PBExportHeader$pro_n_cst_conversion.sru
$PBExportComments$(PRO) Extension Conversion service
forward
global type pro_n_cst_conversion from pfc_n_cst_conversion
end type
end forward

global type pro_n_cst_conversion from pfc_n_cst_conversion
end type

on pro_n_cst_conversion.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_conversion.destroy
TriggerEvent( this, "destructor" )
end on

