﻿$PBExportHeader$pro_n_cst_debug.sru
$PBExportComments$(PRO) Extension Debug service
forward
global type pro_n_cst_debug from pfc_n_cst_debug
end type
end forward

global type pro_n_cst_debug from pfc_n_cst_debug
end type
global pro_n_cst_debug pro_n_cst_debug

on pro_n_cst_debug.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_debug.destroy
TriggerEvent( this, "destructor" )
end on

