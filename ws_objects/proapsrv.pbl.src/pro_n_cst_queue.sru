﻿$PBExportHeader$pro_n_cst_queue.sru
$PBExportComments$(PRO) Extension Queue List service
forward
global type pro_n_cst_queue from pfc_n_cst_queue
end type
end forward

global type pro_n_cst_queue from pfc_n_cst_queue
end type

on pro_n_cst_queue.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_queue.destroy
TriggerEvent( this, "destructor" )
end on

