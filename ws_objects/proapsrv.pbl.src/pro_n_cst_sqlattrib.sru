﻿$PBExportHeader$pro_n_cst_sqlattrib.sru
$PBExportComments$(PRO) Extension SQL attributes
forward
global type pro_n_cst_sqlattrib from pfc_n_cst_sqlattrib
end type
end forward

global type pro_n_cst_sqlattrib from pfc_n_cst_sqlattrib
end type

on pro_n_cst_sqlattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_sqlattrib.destroy
TriggerEvent( this, "destructor" )
end on

