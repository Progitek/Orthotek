﻿$PBExportHeader$pro_n_cst_trregistrationattrib.sru
$PBExportComments$(PRO) Extension Transaction Registration attributes
forward
global type pro_n_cst_trregistrationattrib from pfc_n_cst_trregistrationattrib
end type
end forward

global type pro_n_cst_trregistrationattrib from pfc_n_cst_trregistrationattrib
end type

on pro_n_cst_trregistrationattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_trregistrationattrib.destroy
TriggerEvent( this, "destructor" )
end on

