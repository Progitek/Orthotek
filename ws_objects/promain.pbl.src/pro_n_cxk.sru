﻿$PBExportHeader$pro_n_cxk.sru
$PBExportComments$(PRO) Extension ContextKeyword class
forward
global type pro_n_cxk from pfc_n_cxk
end type
end forward

global type pro_n_cxk from pfc_n_cxk
end type
global pro_n_cxk pro_n_cxk

on pro_n_cxk.create
call contextkeyword::create
TriggerEvent( this, "constructor" )
end on

on pro_n_cxk.destroy
call contextkeyword::destroy
TriggerEvent( this, "destructor" )
end on

