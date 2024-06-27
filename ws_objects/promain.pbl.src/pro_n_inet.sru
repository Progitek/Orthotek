﻿$PBExportHeader$pro_n_inet.sru
$PBExportComments$(PRO) Extension inet class
forward
global type pro_n_inet from pfc_n_inet
end type
end forward

global type pro_n_inet from pfc_n_inet
end type
global pro_n_inet pro_n_inet

on pro_n_inet.create
call inet::create
TriggerEvent( this, "constructor" )
end on

on pro_n_inet.destroy
call inet::destroy
TriggerEvent( this, "destructor" )
end on

