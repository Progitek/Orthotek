﻿$PBExportHeader$pro_n_cst_dwsrv_printpreview.sru
$PBExportComments$(PRO) Extension DataWindow  PrintPreview service
forward
global type pro_n_cst_dwsrv_printpreview from pfc_n_cst_dwsrv_printpreview
end type
end forward

global type pro_n_cst_dwsrv_printpreview from pfc_n_cst_dwsrv_printpreview
end type
global pro_n_cst_dwsrv_printpreview pro_n_cst_dwsrv_printpreview

on pro_n_cst_dwsrv_printpreview.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv_printpreview.destroy
TriggerEvent( this, "destructor" )
end on

