﻿$PBExportHeader$pro_n_cst_winsrv_sheetmanagerattrib.sru
$PBExportComments$(PRO) Extension Window  Sheet Manager attributes
forward
global type pro_n_cst_winsrv_sheetmanagerattrib from pfc_n_cst_winsrv_sheetmanagerattrib
end type
end forward

global type pro_n_cst_winsrv_sheetmanagerattrib from pfc_n_cst_winsrv_sheetmanagerattrib
end type

on pro_n_cst_winsrv_sheetmanagerattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_winsrv_sheetmanagerattrib.destroy
TriggerEvent( this, "destructor" )
end on

