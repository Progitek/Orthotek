﻿$PBExportHeader$pro_n_cst_returnattrib.sru
$PBExportComments$(PRO) Extension Simple return attributes
forward
global type pro_n_cst_returnattrib from pfc_n_cst_returnattrib
end type
end forward

global type pro_n_cst_returnattrib from pfc_n_cst_returnattrib
end type

on pro_n_cst_returnattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_returnattrib.destroy
TriggerEvent( this, "destructor" )
end on

