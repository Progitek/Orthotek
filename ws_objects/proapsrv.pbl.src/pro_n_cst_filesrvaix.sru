﻿$PBExportHeader$pro_n_cst_filesrvaix.sru
$PBExportComments$(PRO) Extension aix File handler service
forward
global type pro_n_cst_filesrvaix from pfc_n_cst_filesrvaix
end type
end forward

global type pro_n_cst_filesrvaix from pfc_n_cst_filesrvaix
end type
global pro_n_cst_filesrvaix pro_n_cst_filesrvaix

on pro_n_cst_filesrvaix.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_filesrvaix.destroy
TriggerEvent( this, "destructor" )
end on

