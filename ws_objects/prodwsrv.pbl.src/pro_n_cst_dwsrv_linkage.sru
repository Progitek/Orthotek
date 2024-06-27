$PBExportHeader$pro_n_cst_dwsrv_linkage.sru
$PBExportComments$(PRO) Extension DataWindow Linkage service
forward
global type pro_n_cst_dwsrv_linkage from pfc_n_cst_dwsrv_linkage
end type
end forward

global type pro_n_cst_dwsrv_linkage from pfc_n_cst_dwsrv_linkage
end type
global pro_n_cst_dwsrv_linkage pro_n_cst_dwsrv_linkage

on pro_n_cst_dwsrv_linkage.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv_linkage.destroy
TriggerEvent( this, "destructor" )
end on

