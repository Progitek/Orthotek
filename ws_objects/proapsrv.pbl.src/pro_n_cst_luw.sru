﻿$PBExportHeader$pro_n_cst_luw.sru
$PBExportComments$(PRO) Extension Logical Unit of Work Service
forward
global type pro_n_cst_luw from pfc_n_cst_luw
end type
end forward

global type pro_n_cst_luw from pfc_n_cst_luw
end type
global pro_n_cst_luw pro_n_cst_luw

on pro_n_cst_luw.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_luw.destroy
TriggerEvent( this, "destructor" )
end on

