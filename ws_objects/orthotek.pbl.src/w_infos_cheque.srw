$PBExportHeader$w_infos_cheque.srw
forward
global type w_infos_cheque from w_child
end type
type st_5 from statictext within w_infos_cheque
end type
type st_4 from statictext within w_infos_cheque
end type
type st_3 from statictext within w_infos_cheque
end type
type st_2 from statictext within w_infos_cheque
end type
type st_1 from statictext within w_infos_cheque
end type
type cb_fermer from commandbutton within w_infos_cheque
end type
type rr_1 from roundrectangle within w_infos_cheque
end type
type ln_1 from line within w_infos_cheque
end type
type p_1 from picture within w_infos_cheque
end type
end forward

global type w_infos_cheque from w_child
integer x = 214
integer y = 221
integer width = 2519
integer height = 1676
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_fermer cb_fermer
rr_1 rr_1
ln_1 ln_1
p_1 p_1
end type
global w_infos_cheque w_infos_cheque

on w_infos_cheque.create
int iCurrent
call super::create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_fermer=create cb_fermer
this.rr_1=create rr_1
this.ln_1=create ln_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_fermer
this.Control[iCurrent+7]=this.rr_1
this.Control[iCurrent+8]=this.ln_1
this.Control[iCurrent+9]=this.p_1
end on

on w_infos_cheque.destroy
call super::destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_fermer)
destroy(this.rr_1)
destroy(this.ln_1)
destroy(this.p_1)
end on

type st_5 from statictext within w_infos_cheque
integer x = 23
integer y = 1528
integer width = 1975
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Veuillez note que ce format est valide pour toutes les institutions financières"
boolean focusrectangle = false
end type

type st_4 from statictext within w_infos_cheque
integer x = 82
integer y = 1364
integer width = 1161
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "C - Numéro du compte: 1234567"
boolean focusrectangle = false
end type

type st_3 from statictext within w_infos_cheque
integer x = 82
integer y = 1296
integer width = 1161
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "B - Numéro de l~'institution financière: 006"
boolean focusrectangle = false
end type

type st_2 from statictext within w_infos_cheque
integer x = 82
integer y = 1224
integer width = 1161
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "A - Numéro de la succursale: 12345"
boolean focusrectangle = false
end type

type st_1 from statictext within w_infos_cheque
integer x = 37
integer y = 32
integer width = 2441
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Informations à saisir"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_infos_cheque
integer x = 2071
integer y = 1476
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(w_infos_cheque)
end event

type rr_1 from roundrectangle within w_infos_cheque
integer linethickness = 4
long fillcolor = 15793151
integer x = 23
integer y = 20
integer width = 2469
integer height = 112
integer cornerheight = 40
integer cornerwidth = 46
end type

type ln_1 from line within w_infos_cheque
integer linethickness = 4
integer beginx = 183
integer beginy = 936
integer endx = 411
integer endy = 1136
end type

type p_1 from picture within w_infos_cheque
integer x = 59
integer y = 168
integer width = 2423
integer height = 1020
string picturename = "C:\ii4net\orthotek\images\chequeexemple.jpg"
boolean focusrectangle = false
end type

