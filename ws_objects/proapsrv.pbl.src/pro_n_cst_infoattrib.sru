﻿$PBExportHeader$pro_n_cst_infoattrib.sru
$PBExportComments$(PRO) Extension Informational attributes
forward
global type pro_n_cst_infoattrib from pfc_n_cst_infoattrib
end type
end forward

global type pro_n_cst_infoattrib from pfc_n_cst_infoattrib
end type

on pro_n_cst_infoattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_infoattrib.destroy
TriggerEvent( this, "destructor" )
end on

