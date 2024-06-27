$PBExportHeader$pro_u_tabpg_dwproperty_srvreport.sru
$PBExportComments$(PRO) DataWindow Property - The Report service tabpage
forward
global type pro_u_tabpg_dwproperty_srvreport from pfc_u_tabpg_dwproperty_srvreport
end type
end forward

global type pro_u_tabpg_dwproperty_srvreport from pfc_u_tabpg_dwproperty_srvreport
end type
global pro_u_tabpg_dwproperty_srvreport pro_u_tabpg_dwproperty_srvreport

on pro_u_tabpg_dwproperty_srvreport.create
call super::create
end on

on pro_u_tabpg_dwproperty_srvreport.destroy
call super::destroy
end on

type mle_notice from pfc_u_tabpg_dwproperty_srvreport`mle_notice within pro_u_tabpg_dwproperty_srvreport
end type

