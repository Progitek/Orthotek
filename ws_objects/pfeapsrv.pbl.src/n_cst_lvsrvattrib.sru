﻿$PBExportHeader$n_cst_lvsrvattrib.sru
$PBExportComments$Extension ListView attributes
forward
global type n_cst_lvsrvattrib from pro_n_cst_lvsrvattrib
end type
end forward

global type n_cst_lvsrvattrib from pro_n_cst_lvsrvattrib
end type
global n_cst_lvsrvattrib n_cst_lvsrvattrib

on n_cst_lvsrvattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_lvsrvattrib.destroy
TriggerEvent( this, "destructor" )
end on

