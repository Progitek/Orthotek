﻿$PBExportHeader$pro_n_cst_toolbarattrib.sru
$PBExportComments$(PRO) Extension Toolbar attributes used by the Toolbar window.
forward
global type pro_n_cst_toolbarattrib from pfc_n_cst_toolbarattrib
end type
end forward

global type pro_n_cst_toolbarattrib from pfc_n_cst_toolbarattrib
end type

on pro_n_cst_toolbarattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_toolbarattrib.destroy
TriggerEvent( this, "destructor" )
end on

