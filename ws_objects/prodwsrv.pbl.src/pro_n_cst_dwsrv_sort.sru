$PBExportHeader$pro_n_cst_dwsrv_sort.sru
$PBExportComments$(PRO) Extension DataWindow Sort service
forward
global type pro_n_cst_dwsrv_sort from pfc_n_cst_dwsrv_sort
end type
end forward

global type pro_n_cst_dwsrv_sort from pfc_n_cst_dwsrv_sort
end type
global pro_n_cst_dwsrv_sort pro_n_cst_dwsrv_sort

on pro_n_cst_dwsrv_sort.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv_sort.destroy
TriggerEvent( this, "destructor" )
end on

