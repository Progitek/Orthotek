﻿$PBExportHeader$pro_n_cst_lvsrvattrib.sru
$PBExportComments$(PRO) Extension ListView attributes
forward
global type pro_n_cst_lvsrvattrib from pfc_n_cst_lvsrvattrib
end type
end forward

global type pro_n_cst_lvsrvattrib from pfc_n_cst_lvsrvattrib
end type

on pro_n_cst_lvsrvattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_lvsrvattrib.destroy
TriggerEvent( this, "destructor" )
end on

