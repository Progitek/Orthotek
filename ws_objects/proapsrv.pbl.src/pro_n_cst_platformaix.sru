﻿$PBExportHeader$pro_n_cst_platformaix.sru
$PBExportComments$(PRO) Extension aix Cross Platform service
forward
global type pro_n_cst_platformaix from pfc_n_cst_platformaix
end type
end forward

global type pro_n_cst_platformaix from pfc_n_cst_platformaix
end type
global pro_n_cst_platformaix pro_n_cst_platformaix

on pro_n_cst_platformaix.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_platformaix.destroy
TriggerEvent( this, "destructor" )
end on

