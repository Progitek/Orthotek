﻿$PBExportHeader$pro_n_cst_dwsrv_multitable.sru
$PBExportComments$(PRO) Extension DataWindow Multiple Table service
forward
global type pro_n_cst_dwsrv_multitable from pfc_n_cst_dwsrv_multitable
end type
end forward

global type pro_n_cst_dwsrv_multitable from pfc_n_cst_dwsrv_multitable
end type
global pro_n_cst_dwsrv_multitable pro_n_cst_dwsrv_multitable

on pro_n_cst_dwsrv_multitable.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv_multitable.destroy
TriggerEvent( this, "destructor" )
end on

