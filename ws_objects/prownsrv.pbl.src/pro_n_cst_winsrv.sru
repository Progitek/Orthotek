﻿$PBExportHeader$pro_n_cst_winsrv.sru
$PBExportComments$(PRO) Extension Base Window Service class
forward
global type pro_n_cst_winsrv from pfc_n_cst_winsrv
end type
end forward

global type pro_n_cst_winsrv from pfc_n_cst_winsrv
end type
global pro_n_cst_winsrv pro_n_cst_winsrv

on pro_n_cst_winsrv.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_winsrv.destroy
TriggerEvent( this, "destructor" )
end on

