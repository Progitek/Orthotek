﻿$PBExportHeader$pro_n_cst_winsrv_statusbar.sru
$PBExportComments$(PRO) Extension Statusbar service
forward
global type pro_n_cst_winsrv_statusbar from pfc_n_cst_winsrv_statusbar
end type
end forward

global type pro_n_cst_winsrv_statusbar from pfc_n_cst_winsrv_statusbar
end type
global pro_n_cst_winsrv_statusbar pro_n_cst_winsrv_statusbar

on pro_n_cst_winsrv_statusbar.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_winsrv_statusbar.destroy
TriggerEvent( this, "destructor" )
end on

