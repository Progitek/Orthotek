﻿$PBExportHeader$pro_n_cst_calendarattrib.sru
$PBExportComments$(PRO) Extension Calendar constructor attributes
forward
global type pro_n_cst_calendarattrib from pfc_n_cst_calendarattrib
end type
end forward

global type pro_n_cst_calendarattrib from pfc_n_cst_calendarattrib
end type

on pro_n_cst_calendarattrib.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_calendarattrib.destroy
TriggerEvent( this, "destructor" )
end on

