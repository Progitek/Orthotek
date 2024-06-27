﻿$PBExportHeader$pro_n_ms.sru
$PBExportComments$(PRO) Extension Mail Session class
forward
global type pro_n_ms from pfc_n_ms
end type
end forward

global type pro_n_ms from pfc_n_ms
end type
global pro_n_ms pro_n_ms

on pro_n_ms.create
call mailsession::create
TriggerEvent( this, "constructor" )
end on

on pro_n_ms.destroy
call mailsession::destroy
TriggerEvent( this, "destructor" )
end on

