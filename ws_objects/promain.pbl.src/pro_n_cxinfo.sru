﻿$PBExportHeader$pro_n_cxinfo.sru
$PBExportComments$(PRO) Extension ContextInformation class
forward
global type pro_n_cxinfo from pfc_n_cxinfo
end type
end forward

global type pro_n_cxinfo from pfc_n_cxinfo
end type
global pro_n_cxinfo pro_n_cxinfo

on pro_n_cxinfo.create
call contextinformation::create
TriggerEvent( this, "constructor" )
end on

on pro_n_cxinfo.destroy
call contextinformation::destroy
TriggerEvent( this, "destructor" )
end on

