﻿$PBExportHeader$pro_n_cst_trregistration.sru
$PBExportComments$(PRO) Extension Transaction Registration service
forward
global type pro_n_cst_trregistration from pfc_n_cst_trregistration
end type
end forward

global type pro_n_cst_trregistration from pfc_n_cst_trregistration
end type
global pro_n_cst_trregistration pro_n_cst_trregistration

on pro_n_cst_trregistration.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_trregistration.destroy
TriggerEvent( this, "destructor" )
end on

