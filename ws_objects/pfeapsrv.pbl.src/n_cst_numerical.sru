﻿$PBExportHeader$n_cst_numerical.sru
$PBExportComments$Extension Numerical service
forward
global type n_cst_numerical from pro_n_cst_numerical
end type
end forward

global type n_cst_numerical from pro_n_cst_numerical
end type
global n_cst_numerical n_cst_numerical

on n_cst_numerical.create
TriggerEvent( this, "constructor" )
end on

on n_cst_numerical.destroy
TriggerEvent( this, "destructor" )
end on

