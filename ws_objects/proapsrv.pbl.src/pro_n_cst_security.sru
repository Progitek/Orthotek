﻿$PBExportHeader$pro_n_cst_security.sru
$PBExportComments$(PRO) Extension Security Service
forward
global type pro_n_cst_security from pfc_n_cst_security
end type
end forward

global type pro_n_cst_security from pfc_n_cst_security
end type
global pro_n_cst_security pro_n_cst_security

on pro_n_cst_security.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_security.destroy
TriggerEvent( this, "destructor" )
end on

