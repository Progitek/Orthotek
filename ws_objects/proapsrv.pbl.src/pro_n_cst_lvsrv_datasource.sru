﻿$PBExportHeader$pro_n_cst_lvsrv_datasource.sru
$PBExportComments$(PRO) Extension ListView Datasource service
forward
global type pro_n_cst_lvsrv_datasource from pfc_n_cst_lvsrv_datasource
end type
end forward

global type pro_n_cst_lvsrv_datasource from pfc_n_cst_lvsrv_datasource
end type
global pro_n_cst_lvsrv_datasource pro_n_cst_lvsrv_datasource

on pro_n_cst_lvsrv_datasource.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_lvsrv_datasource.destroy
TriggerEvent( this, "destructor" )
end on

