﻿$PBExportHeader$pro_n_cst_lvsrv_sort.sru
$PBExportComments$(PRO) Extension ListView Sort service
forward
global type pro_n_cst_lvsrv_sort from pfc_n_cst_lvsrv_sort
end type
end forward

global type pro_n_cst_lvsrv_sort from pfc_n_cst_lvsrv_sort
end type
global pro_n_cst_lvsrv_sort pro_n_cst_lvsrv_sort

on pro_n_cst_lvsrv_sort.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_lvsrv_sort.destroy
TriggerEvent( this, "destructor" )
end on

