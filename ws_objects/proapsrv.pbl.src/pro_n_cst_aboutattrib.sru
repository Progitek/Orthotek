﻿$PBExportHeader$pro_n_cst_aboutattrib.sru
$PBExportComments$(PRO) Extension About window attributes
forward
global type pro_n_cst_aboutattrib from pfc_n_cst_aboutattrib
end type
end forward

global type pro_n_cst_aboutattrib from pfc_n_cst_aboutattrib
end type

on pro_n_cst_aboutattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_aboutattrib.destroy
TriggerEvent( this, "destructor" )
end on

