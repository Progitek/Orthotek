﻿$PBExportHeader$pro_n_cst_filesrv.sru
$PBExportComments$(PRO) Extension File handler service
forward
global type pro_n_cst_filesrv from pfc_n_cst_filesrv
end type
end forward

global type pro_n_cst_filesrv from pfc_n_cst_filesrv
end type
global pro_n_cst_filesrv pro_n_cst_filesrv

on pro_n_cst_filesrv.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_filesrv.destroy
TriggerEvent( this, "destructor" )
end on

