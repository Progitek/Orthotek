﻿$PBExportHeader$n_cst_dwsrv_multitableattrib.sru
$PBExportComments$Extension DataWindow Multiple Table attributes
forward
global type n_cst_dwsrv_multitableattrib from pro_n_cst_dwsrv_multitableattrib
end type
end forward

global type n_cst_dwsrv_multitableattrib from pro_n_cst_dwsrv_multitableattrib
end type
global n_cst_dwsrv_multitableattrib n_cst_dwsrv_multitableattrib

on n_cst_dwsrv_multitableattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_multitableattrib.destroy
TriggerEvent( this, "destructor" )
end on

