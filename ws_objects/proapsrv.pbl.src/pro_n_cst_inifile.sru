﻿$PBExportHeader$pro_n_cst_inifile.sru
$PBExportComments$(PRO) Extension INIFile service
forward
global type pro_n_cst_inifile from pfc_n_cst_inifile
end type
end forward

global type pro_n_cst_inifile from pfc_n_cst_inifile
end type

on pro_n_cst_inifile.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_inifile.destroy
TriggerEvent( this, "destructor" )
end on

