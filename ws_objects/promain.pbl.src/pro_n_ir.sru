﻿$PBExportHeader$pro_n_ir.sru
$PBExportComments$(PRO) Extension InternetResult class
forward
global type pro_n_ir from pfc_n_ir
end type
end forward

global type pro_n_ir from pfc_n_ir
end type
global pro_n_ir pro_n_ir

on pro_n_ir.create
call internetresult::create
TriggerEvent( this, "constructor" )
end on

on pro_n_ir.destroy
call internetresult::destroy
TriggerEvent( this, "destructor" )
end on

