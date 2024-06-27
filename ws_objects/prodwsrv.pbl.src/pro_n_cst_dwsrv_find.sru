$PBExportHeader$pro_n_cst_dwsrv_find.sru
$PBExportComments$(PRO) Extension DataWindow Find/Replace service
forward
global type pro_n_cst_dwsrv_find from pfc_n_cst_dwsrv_find
end type
end forward

global type pro_n_cst_dwsrv_find from pfc_n_cst_dwsrv_find
end type
global pro_n_cst_dwsrv_find pro_n_cst_dwsrv_find

on pro_n_cst_dwsrv_find.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv_find.destroy
TriggerEvent( this, "destructor" )
end on

