$PBExportHeader$w_choixlangue.srw
forward
global type w_choixlangue from window
end type
type st_4 from statictext within w_choixlangue
end type
type st_3 from statictext within w_choixlangue
end type
type st_2 from statictext within w_choixlangue
end type
type st_1 from statictext within w_choixlangue
end type
type cb_2 from commandbutton within w_choixlangue
end type
type cb_1 from commandbutton within w_choixlangue
end type
end forward

global type w_choixlangue from window
integer width = 1385
integer height = 700
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
end type
global w_choixlangue w_choixlangue

on w_choixlangue.create
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_choixlangue.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;this.move(1000,600)
end event

type st_4 from statictext within w_choixlangue
integer x = 55
integer y = 412
integer width = 782
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "correspondre ?"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "like to correspond ?"
end if
end event

type st_3 from statictext within w_choixlangue
integer x = 55
integer y = 324
integer width = 1271
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dans quelle langue désirez-vous"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "In which language would you"
end if

end event

type st_2 from statictext within w_choixlangue
integer x = 32
integer y = 124
integer width = 1307
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "figure pas dans son dossier."
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "patient doesn't appear in his file."
end if

end event

type st_1 from statictext within w_choixlangue
integer x = 32
integer y = 24
integer width = 1312
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "La langue de ce patient ne"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "The language spoken by this"
end if

end event

type cb_2 from commandbutton within w_choixlangue
integer x = 681
integer y = 540
integer width = 677
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Anglais"
end type

event clicked;w_patient.vi_langage = 'A'
closewithreturn(parent,'A')

end event

event constructor;if v_langue = 'an' then
	this.text = "English"
end if

end event

type cb_1 from commandbutton within w_choixlangue
integer x = 27
integer y = 540
integer width = 649
integer height = 112
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Français"
end type

event clicked;w_patient.vi_langage = 'F'
closewithreturn(parent,'F')

end event

event constructor;if v_langue = 'an' then
	this.text = "French"
end if

end event

