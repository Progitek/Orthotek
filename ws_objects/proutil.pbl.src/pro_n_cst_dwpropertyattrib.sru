﻿$PBExportHeader$pro_n_cst_dwpropertyattrib.sru
$PBExportComments$(PRO) Extension DataWindow Property - attributes
forward
global type pro_n_cst_dwpropertyattrib from pfc_n_cst_dwpropertyattrib
end type
end forward

global type pro_n_cst_dwpropertyattrib from pfc_n_cst_dwpropertyattrib
end type

on pro_n_cst_dwpropertyattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwpropertyattrib.destroy
TriggerEvent( this, "destructor" )
end on

