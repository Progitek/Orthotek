﻿$PBExportHeader$pro_n_cst_tvsrvattrib.sru
$PBExportComments$(PRO) Extension TreeView datasource service attributes
forward
global type pro_n_cst_tvsrvattrib from pfc_n_cst_tvsrvattrib
end type
end forward

global type pro_n_cst_tvsrvattrib from pfc_n_cst_tvsrvattrib
end type

on pro_n_cst_tvsrvattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_tvsrvattrib.destroy
TriggerEvent( this, "destructor" )
end on

