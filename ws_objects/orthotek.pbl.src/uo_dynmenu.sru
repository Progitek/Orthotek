$PBExportHeader$uo_dynmenu.sru
forward
global type uo_dynmenu from dyn_menu
end type
end forward

global type uo_dynmenu from dyn_menu
end type
global uo_dynmenu uo_dynmenu

on uo_dynmenu.create
call super::create
end on

on uo_dynmenu.destroy
call super::destroy
end on

event pro_clicked;call super::pro_clicked;string ls_text

if upperbound(m_dyn.item) = 0 then
	if isvalid(w_assurance) then
		ls_text = w_assurance.dw_assurance.getItemString(w_assurance.dw_assurance.getRow(),w_assurance.is_champ)
		if isnull(ls_text) then ls_text = "" 
		w_assurance.dw_assurance.setItem(w_assurance.dw_assurance.getRow(),w_assurance.is_champ,ls_text + ' ' + m_dyn.text)
	end if
end if
end event

