﻿$PBExportHeader$pro_n_cst_tvsrv_print.sru
$PBExportComments$(PRO) Extension TreeView Print service
forward
global type pro_n_cst_tvsrv_print from pfc_n_cst_tvsrv_print
end type
end forward

global type pro_n_cst_tvsrv_print from pfc_n_cst_tvsrv_print
end type
global pro_n_cst_tvsrv_print pro_n_cst_tvsrv_print

on pro_n_cst_tvsrv_print.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_tvsrv_print.destroy
TriggerEvent( this, "destructor" )
end on

