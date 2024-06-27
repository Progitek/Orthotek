$PBExportHeader$pro_inputbox.srw
forward
global type pro_inputbox from pfc_w_response
end type
type sle_input from singlelineedit within pro_inputbox
end type
type st_question from statictext within pro_inputbox
end type
type cb_3 from commandbutton within pro_inputbox
end type
type cb_2 from commandbutton within pro_inputbox
end type
type cb_1 from commandbutton within pro_inputbox
end type
end forward

global type pro_inputbox from pfc_w_response
integer x = 214
integer y = 221
integer width = 2199
integer height = 948
boolean controlmenu = false
boolean center = true
boolean ib_isupdateable = false
sle_input sle_input
st_question st_question
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global pro_inputbox pro_inputbox

on pro_inputbox.create
int iCurrent
call super::create
this.sle_input=create sle_input
this.st_question=create st_question
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_input
this.Control[iCurrent+2]=this.st_question
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_1
end on

on pro_inputbox.destroy
call super::destroy
destroy(this.sle_input)
destroy(this.st_question)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;call super::open;str_inputbox st_input
string ls_defaut

st_input = message.powerobjectparm

pro_inputbox.title =  st_input.as_title
st_question.text = st_input.as_question
ls_defaut = st_input.as_defautchaine
if isnull(ls_defaut) then ls_defaut = ""
sle_input.text = ls_defaut

if left(st_input.as_title,12) = 'Mot de passe' or left(st_input.as_title,8) = 'Password' then
	sle_input.password = true
end if
end event

type sle_input from singlelineedit within pro_inputbox
integer x = 18
integer y = 652
integer width = 2144
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_question from statictext within pro_inputbox
integer x = 14
integer y = 28
integer width = 2130
integer height = 592
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_3 from commandbutton within pro_inputbox
integer x = 503
integer y = 756
integer width = 1170
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_2 from commandbutton within pro_inputbox
integer x = 14
integer y = 756
integer width = 489
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;string ls_null

setnull(ls_null)

closewithreturn(parent,ls_null)
end event

type cb_1 from commandbutton within pro_inputbox
integer x = 1673
integer y = 756
integer width = 489
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
boolean default = true
end type

event clicked;closewithreturn(parent,sle_input.text)
end event

