﻿$PBExportHeader$pro_n_cst_dwsrv_resizeattrib.sru
$PBExportComments$(PRO) Extension DataWindow Resize attributes
forward
global type pro_n_cst_dwsrv_resizeattrib from pfc_n_cst_dwsrv_resizeattrib
end type
end forward

global type pro_n_cst_dwsrv_resizeattrib from pfc_n_cst_dwsrv_resizeattrib
end type

on pro_n_cst_dwsrv_resizeattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv_resizeattrib.destroy
TriggerEvent( this, "destructor" )
end on

