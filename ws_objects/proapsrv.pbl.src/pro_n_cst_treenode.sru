﻿$PBExportHeader$pro_n_cst_treenode.sru
$PBExportComments$(PRO) Extension tree node
forward
global type pro_n_cst_treenode from pfc_n_cst_treenode
end type
end forward

global type pro_n_cst_treenode from pfc_n_cst_treenode
end type
global pro_n_cst_treenode pro_n_cst_treenode

on pro_n_cst_treenode.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_treenode.destroy
TriggerEvent( this, "destructor" )
end on

