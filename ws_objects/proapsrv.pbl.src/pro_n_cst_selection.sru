﻿$PBExportHeader$pro_n_cst_selection.sru
$PBExportComments$(PRO) Extension Selection service
forward
global type pro_n_cst_selection from pfc_n_cst_selection
end type
end forward

global type pro_n_cst_selection from pfc_n_cst_selection
end type

on pro_n_cst_selection.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_selection.destroy
TriggerEvent( this, "destructor" )
end on

