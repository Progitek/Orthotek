﻿$PBExportHeader$pro_n_cst_textstyleattrib.sru
$PBExportComments$(PRO) Extension Text Style attributes
forward
global type pro_n_cst_textstyleattrib from pfc_n_cst_textstyleattrib
end type
end forward

global type pro_n_cst_textstyleattrib from pfc_n_cst_textstyleattrib
end type

on pro_n_cst_textstyleattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_textstyleattrib.destroy
TriggerEvent( this, "destructor" )
end on

