﻿$PBExportHeader$pro_n_cst_tmgsingle.sru
$PBExportComments$(PRO) Extension timing single object service
forward
global type pro_n_cst_tmgsingle from pfc_n_cst_tmgsingle
end type
end forward

global type pro_n_cst_tmgsingle from pfc_n_cst_tmgsingle
end type
global pro_n_cst_tmgsingle pro_n_cst_tmgsingle

on pro_n_cst_tmgsingle.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_tmgsingle.destroy
TriggerEvent( this, "destructor" )
end on

