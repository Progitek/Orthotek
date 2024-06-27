$PBExportHeader$pro_u_tabpg_dwproperty_srvfind.sru
$PBExportComments$(PRO) DataWindow Property - The Find service tabpage
forward
global type pro_u_tabpg_dwproperty_srvfind from pfc_u_tabpg_dwproperty_srvfind
end type
end forward

global type pro_u_tabpg_dwproperty_srvfind from pfc_u_tabpg_dwproperty_srvfind
end type
global pro_u_tabpg_dwproperty_srvfind pro_u_tabpg_dwproperty_srvfind

on pro_u_tabpg_dwproperty_srvfind.create
call super::create
end on

on pro_u_tabpg_dwproperty_srvfind.destroy
call super::destroy
end on

type cbx_allowfinddlg from pfc_u_tabpg_dwproperty_srvfind`cbx_allowfinddlg within pro_u_tabpg_dwproperty_srvfind
end type

type cbx_allowreplacedlg from pfc_u_tabpg_dwproperty_srvfind`cbx_allowreplacedlg within pro_u_tabpg_dwproperty_srvfind
end type

