﻿$PBExportHeader$pro_n_cst_tvsrv.sru
$PBExportComments$(PRO) Extension TreeView Base service
forward
global type pro_n_cst_tvsrv from pfc_n_cst_tvsrv
end type
end forward

global type pro_n_cst_tvsrv from pfc_n_cst_tvsrv
end type
global pro_n_cst_tvsrv pro_n_cst_tvsrv

on pro_n_cst_tvsrv.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_tvsrv.destroy
TriggerEvent( this, "destructor" )
end on

