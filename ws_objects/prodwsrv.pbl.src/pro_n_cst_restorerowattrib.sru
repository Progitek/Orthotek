﻿$PBExportHeader$pro_n_cst_restorerowattrib.sru
$PBExportComments$(PRO) Extension Attributes for DataWindow Undelete Window
forward
global type pro_n_cst_restorerowattrib from pfc_n_cst_restorerowattrib
end type
end forward

global type pro_n_cst_restorerowattrib from pfc_n_cst_restorerowattrib
end type

on pro_n_cst_restorerowattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_restorerowattrib.destroy
TriggerEvent( this, "destructor" )
end on

