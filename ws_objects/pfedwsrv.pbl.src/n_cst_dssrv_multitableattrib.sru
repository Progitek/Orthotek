﻿$PBExportHeader$n_cst_dssrv_multitableattrib.sru
$PBExportComments$Extension Datastore Multiple Table attributes
forward
global type n_cst_dssrv_multitableattrib from pro_n_cst_dssrv_multitableattrib
end type
end forward

global type n_cst_dssrv_multitableattrib from pro_n_cst_dssrv_multitableattrib
end type
global n_cst_dssrv_multitableattrib n_cst_dssrv_multitableattrib

on n_cst_dssrv_multitableattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dssrv_multitableattrib.destroy
TriggerEvent( this, "destructor" )
end on

