﻿$PBExportHeader$pro_n_ostm.sru
$PBExportComments$(PRO) Extension OLEStream class
forward
global type pro_n_ostm from pfc_n_ostm
end type
end forward

global type pro_n_ostm from pfc_n_ostm
end type
global pro_n_ostm pro_n_ostm

on pro_n_ostm.create
call olestream::create
TriggerEvent( this, "constructor" )
end on

on pro_n_ostm.destroy
call olestream::destroy
TriggerEvent( this, "destructor" )
end on

