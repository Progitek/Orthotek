﻿$PBExportHeader$pro_n_cst_platformhpux.sru
$PBExportComments$(PRO) Extension hpux Cross Platform service
forward
global type pro_n_cst_platformhpux from pfc_n_cst_platformhpux
end type
end forward

global type pro_n_cst_platformhpux from pfc_n_cst_platformhpux
end type
global pro_n_cst_platformhpux pro_n_cst_platformhpux

on pro_n_cst_platformhpux.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_platformhpux.destroy
TriggerEvent( this, "destructor" )
end on

