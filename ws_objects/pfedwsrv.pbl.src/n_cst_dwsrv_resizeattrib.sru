﻿$PBExportHeader$n_cst_dwsrv_resizeattrib.sru
$PBExportComments$Extension DataWindow Resize attributes
forward
global type n_cst_dwsrv_resizeattrib from pro_n_cst_dwsrv_resizeattrib
end type
end forward

global type n_cst_dwsrv_resizeattrib from pro_n_cst_dwsrv_resizeattrib
end type
global n_cst_dwsrv_resizeattrib n_cst_dwsrv_resizeattrib

on n_cst_dwsrv_resizeattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_resizeattrib.destroy
TriggerEvent( this, "destructor" )
end on

