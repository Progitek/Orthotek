﻿$PBExportHeader$pro_n_cst_menu.sru
$PBExportComments$(PRO) Extension Menu service
forward
global type pro_n_cst_menu from pfc_n_cst_menu
end type
end forward

global type pro_n_cst_menu from pfc_n_cst_menu
end type

on pro_n_cst_menu.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_menu.destroy
TriggerEvent( this, "destructor" )
end on

