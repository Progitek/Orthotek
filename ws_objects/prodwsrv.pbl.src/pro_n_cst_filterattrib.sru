﻿$PBExportHeader$pro_n_cst_filterattrib.sru
$PBExportComments$(PRO) Extension Attributes for the DataWindow Filter service
forward
global type pro_n_cst_filterattrib from pfc_n_cst_filterattrib
end type
end forward

global type pro_n_cst_filterattrib from pfc_n_cst_filterattrib
end type

on pro_n_cst_filterattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_filterattrib.destroy
TriggerEvent( this, "destructor" )
end on

