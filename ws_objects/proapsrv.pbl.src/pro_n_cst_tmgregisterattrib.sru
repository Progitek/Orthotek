﻿$PBExportHeader$pro_n_cst_tmgregisterattrib.sru
$PBExportComments$(PRO) Extension timing register attributes
forward
global type pro_n_cst_tmgregisterattrib from pfc_n_cst_tmgregisterattrib
end type
end forward

global type pro_n_cst_tmgregisterattrib from pfc_n_cst_tmgregisterattrib
end type

on pro_n_cst_tmgregisterattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_tmgregisterattrib.destroy
TriggerEvent( this, "destructor" )
end on

