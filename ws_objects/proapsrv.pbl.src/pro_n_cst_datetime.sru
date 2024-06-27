$PBExportHeader$pro_n_cst_datetime.sru
$PBExportComments$(PRO) Extension Date and/or Datetime service
forward
global type pro_n_cst_datetime from pfc_n_cst_datetime
end type
end forward

global type pro_n_cst_datetime from pfc_n_cst_datetime
end type

on pro_n_cst_datetime.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_datetime.destroy
TriggerEvent( this, "destructor" )
end on

