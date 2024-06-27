$PBExportHeader$pro_n_cst_dwsrv.sru
$PBExportComments$(PRO) Extension Base DataWindow service
forward
global type pro_n_cst_dwsrv from pfc_n_cst_dwsrv
end type
end forward

global type pro_n_cst_dwsrv from pfc_n_cst_dwsrv
end type
global pro_n_cst_dwsrv pro_n_cst_dwsrv

on pro_n_cst_dwsrv.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv.destroy
TriggerEvent( this, "destructor" )
end on

