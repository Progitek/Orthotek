﻿$PBExportHeader$pro_n_tmg.sru
$PBExportComments$(PRO) Extension Timing Class
forward
global type pro_n_tmg from pfc_n_tmg
end type
end forward

global type pro_n_tmg from pfc_n_tmg
end type
global pro_n_tmg pro_n_tmg

on pro_n_tmg.create
call timing::create
TriggerEvent( this, "constructor" )
end on

on pro_n_tmg.destroy
call timing::destroy
TriggerEvent( this, "destructor" )
end on

