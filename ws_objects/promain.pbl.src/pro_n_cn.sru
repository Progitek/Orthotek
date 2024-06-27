﻿$PBExportHeader$pro_n_cn.sru
$PBExportComments$(PRO) Extension Connection class
forward
global type pro_n_cn from pfc_n_cn
end type
end forward

global type pro_n_cn from pfc_n_cn
end type
global pro_n_cn pro_n_cn

on pro_n_cn.create
call connection::create
TriggerEvent( this, "constructor" )
end on

on pro_n_cn.destroy
call connection::destroy
TriggerEvent( this, "destructor" )
end on

