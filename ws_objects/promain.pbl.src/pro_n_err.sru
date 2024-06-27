﻿$PBExportHeader$pro_n_err.sru
$PBExportComments$(PRO) Extension Error class
forward
global type pro_n_err from pfc_n_err
end type
end forward

global type pro_n_err from pfc_n_err
end type
global pro_n_err pro_n_err

on pro_n_err.create
call error::create
TriggerEvent( this, "constructor" )
end on

on pro_n_err.destroy
call error::destroy
TriggerEvent( this, "destructor" )
end on

