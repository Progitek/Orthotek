﻿$PBExportHeader$pro_n_base.sru
$PBExportComments$(PRO) Extension NonVisual Base class
forward
global type pro_n_base from pfc_n_base
end type
end forward

global type pro_n_base from pfc_n_base
end type
global pro_n_base pro_n_base

on pro_n_base.create
TriggerEvent( this, "constructor" )
end on

on pro_n_base.destroy
TriggerEvent( this, "destructor" )
end on

