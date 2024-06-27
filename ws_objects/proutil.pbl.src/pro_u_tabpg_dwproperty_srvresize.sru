$PBExportHeader$pro_u_tabpg_dwproperty_srvresize.sru
$PBExportComments$(PRO) DataWindow Property - The Resize service tabpage
forward
global type pro_u_tabpg_dwproperty_srvresize from pfc_u_tabpg_dwproperty_srvresize
end type
end forward

global type pro_u_tabpg_dwproperty_srvresize from pfc_u_tabpg_dwproperty_srvresize
end type
global pro_u_tabpg_dwproperty_srvresize pro_u_tabpg_dwproperty_srvresize

on pro_u_tabpg_dwproperty_srvresize.create
call super::create
end on

on pro_u_tabpg_dwproperty_srvresize.destroy
call super::destroy
end on

type dw_register from pfc_u_tabpg_dwproperty_srvresize`dw_register within pro_u_tabpg_dwproperty_srvresize
end type

