$PBExportHeader$pro_u_tabpg_dwproperty_srvsyntax.sru
$PBExportComments$(PRO) DataWindow Property - The Syntax tabpage
forward
global type pro_u_tabpg_dwproperty_srvsyntax from pfc_u_tabpg_dwproperty_srvsyntax
end type
end forward

global type pro_u_tabpg_dwproperty_srvsyntax from pfc_u_tabpg_dwproperty_srvsyntax
end type
global pro_u_tabpg_dwproperty_srvsyntax pro_u_tabpg_dwproperty_srvsyntax

on pro_u_tabpg_dwproperty_srvsyntax.create
call super::create
end on

on pro_u_tabpg_dwproperty_srvsyntax.destroy
call super::destroy
end on

type mle_syntax from pfc_u_tabpg_dwproperty_srvsyntax`mle_syntax within pro_u_tabpg_dwproperty_srvsyntax
end type

type cb_save from pfc_u_tabpg_dwproperty_srvsyntax`cb_save within pro_u_tabpg_dwproperty_srvsyntax
end type

