$PBExportHeader$pro_n_cst_dwsrv_dropdownsearch.sru
$PBExportComments$(PRO) Extension DataWindow DropDownSearch service
forward
global type pro_n_cst_dwsrv_dropdownsearch from pfc_n_cst_dwsrv_dropdownsearch
end type
end forward

global type pro_n_cst_dwsrv_dropdownsearch from pfc_n_cst_dwsrv_dropdownsearch
end type
global pro_n_cst_dwsrv_dropdownsearch pro_n_cst_dwsrv_dropdownsearch

on pro_n_cst_dwsrv_dropdownsearch.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwsrv_dropdownsearch.destroy
TriggerEvent( this, "destructor" )
end on

