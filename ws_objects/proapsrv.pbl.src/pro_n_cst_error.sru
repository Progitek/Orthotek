$PBExportHeader$pro_n_cst_error.sru
$PBExportComments$(PRO) Extension Message (error) service
forward
global type pro_n_cst_error from pfc_n_cst_error
end type
end forward

global type pro_n_cst_error from pfc_n_cst_error
end type
global pro_n_cst_error pro_n_cst_error

on pro_n_cst_error.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_error.destroy
TriggerEvent( this, "destructor" )
end on

