﻿$PBExportHeader$pro_n_cst_winsrv_preference.sru
$PBExportComments$(PRO) Extension Window Preferences service
forward
global type pro_n_cst_winsrv_preference from pfc_n_cst_winsrv_preference
end type
end forward

global type pro_n_cst_winsrv_preference from pfc_n_cst_winsrv_preference
end type
global pro_n_cst_winsrv_preference pro_n_cst_winsrv_preference

on pro_n_cst_winsrv_preference.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_winsrv_preference.destroy
TriggerEvent( this, "destructor" )
end on

