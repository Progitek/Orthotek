﻿$PBExportHeader$pro_n_ostg.sru
$PBExportComments$(PRO) Extension OLEStorage class
forward
global type pro_n_ostg from pfc_n_ostg
end type
end forward

global type pro_n_ostg from pfc_n_ostg
end type
global pro_n_ostg pro_n_ostg

on pro_n_ostg.create
call olestorage::create
TriggerEvent( this, "constructor" )
end on

on pro_n_ostg.destroy
call olestorage::destroy
TriggerEvent( this, "destructor" )
end on

