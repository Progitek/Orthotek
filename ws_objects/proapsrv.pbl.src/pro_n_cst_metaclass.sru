﻿$PBExportHeader$pro_n_cst_metaclass.sru
$PBExportComments$(PRO) Extension Metaclass service
forward
global type pro_n_cst_metaclass from pfc_n_cst_metaclass
end type
end forward

global type pro_n_cst_metaclass from pfc_n_cst_metaclass
end type

on pro_n_cst_metaclass.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_metaclass.destroy
TriggerEvent( this, "destructor" )
end on

