﻿$PBExportHeader$pro_n_cst_color.sru
$PBExportComments$(PRO) Extension Color service
forward
global type pro_n_cst_color from pfc_n_cst_color
end type
end forward

global type pro_n_cst_color from pfc_n_cst_color
end type

on pro_n_cst_color.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_color.destroy
TriggerEvent( this, "destructor" )
end on

