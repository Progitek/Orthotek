﻿$PBExportHeader$uo_hyperlink_transparent.sru
forward
global type uo_hyperlink_transparent from statichyperlink
end type
end forward

global type uo_hyperlink_transparent from statichyperlink
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 16777215
string text = "none"
boolean focusrectangle = false
event ue_paint pbm_paint
event ue_vrai_clicked pbm_lbuttonup
end type
global uo_hyperlink_transparent uo_hyperlink_transparent

type variables
boolean ib_Painting
end variables

event ue_paint;if IsValid(this) then

	if ib_Painting then return 0
	ib_Painting = TRUE
	this.visible = false
	do while yield() ; loop
	this.visible = true
	ib_painting=false

end if

return 0
end event

event ue_vrai_clicked;//Event du vrai clicked
end event

on uo_hyperlink_transparent.create
end on

on uo_hyperlink_transparent.destroy
end on

event constructor;call super::constructor;this.BackColor = 2^29
end event

