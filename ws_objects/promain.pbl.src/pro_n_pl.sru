﻿$PBExportHeader$pro_n_pl.sru
$PBExportComments$(PRO) Extension PIpeline class
forward
global type pro_n_pl from pfc_n_pl
end type
end forward

global type pro_n_pl from pfc_n_pl
end type
global pro_n_pl pro_n_pl

on pro_n_pl.create
call pipeline::create
TriggerEvent( this, "constructor" )
end on

on pro_n_pl.destroy
call pipeline::destroy
TriggerEvent( this, "destructor" )
end on

