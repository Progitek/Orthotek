﻿$PBExportHeader$pro_n_cst_tvsrv_levelsource.sru
$PBExportComments$(PRO) Extension Treeview Level Based service
forward
global type pro_n_cst_tvsrv_levelsource from pfc_n_cst_tvsrv_levelsource
end type
end forward

global type pro_n_cst_tvsrv_levelsource from pfc_n_cst_tvsrv_levelsource
end type
global pro_n_cst_tvsrv_levelsource pro_n_cst_tvsrv_levelsource

on pro_n_cst_tvsrv_levelsource.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_tvsrv_levelsource.destroy
TriggerEvent( this, "destructor" )
end on

