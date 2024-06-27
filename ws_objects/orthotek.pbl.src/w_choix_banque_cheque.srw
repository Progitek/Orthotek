$PBExportHeader$w_choix_banque_cheque.srw
forward
global type w_choix_banque_cheque from w_child
end type
type rb_bs from radiobutton within w_choix_banque_cheque
end type
type rb_bn from radiobutton within w_choix_banque_cheque
end type
type cb_annuler from commandbutton within w_choix_banque_cheque
end type
type cb_valider from commandbutton within w_choix_banque_cheque
end type
type rb_rbs from radiobutton within w_choix_banque_cheque
end type
type rb_td from radiobutton within w_choix_banque_cheque
end type
type st_title from statictext within w_choix_banque_cheque
end type
type rr_1 from roundrectangle within w_choix_banque_cheque
end type
end forward

global type w_choix_banque_cheque from w_child
integer x = 214
integer y = 221
integer width = 1806
integer height = 1152
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
rb_bs rb_bs
rb_bn rb_bn
cb_annuler cb_annuler
cb_valider cb_valider
rb_rbs rb_rbs
rb_td rb_td
st_title st_title
rr_1 rr_1
end type
global w_choix_banque_cheque w_choix_banque_cheque

on w_choix_banque_cheque.create
int iCurrent
call super::create
this.rb_bs=create rb_bs
this.rb_bn=create rb_bn
this.cb_annuler=create cb_annuler
this.cb_valider=create cb_valider
this.rb_rbs=create rb_rbs
this.rb_td=create rb_td
this.st_title=create st_title
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_bs
this.Control[iCurrent+2]=this.rb_bn
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_valider
this.Control[iCurrent+5]=this.rb_rbs
this.Control[iCurrent+6]=this.rb_td
this.Control[iCurrent+7]=this.st_title
this.Control[iCurrent+8]=this.rr_1
end on

on w_choix_banque_cheque.destroy
call super::destroy
destroy(this.rb_bs)
destroy(this.rb_bn)
destroy(this.cb_annuler)
destroy(this.cb_valider)
destroy(this.rb_rbs)
destroy(this.rb_td)
destroy(this.st_title)
destroy(this.rr_1)
end on

type rb_bs from radiobutton within w_choix_banque_cheque
integer x = 119
integer y = 576
integer width = 1006
integer height = 96
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Banque scotia"
end type

type rb_bn from radiobutton within w_choix_banque_cheque
integer x = 119
integer y = 452
integer width = 1006
integer height = 96
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Banque nationale du Canada"
end type

type cb_annuler from commandbutton within w_choix_banque_cheque
integer x = 1266
integer y = 932
integer width = 517
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;close(w_choix_banque_cheque)
end event

type cb_valider from commandbutton within w_choix_banque_cheque
integer x = 9
integer y = 932
integer width = 517
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Valider"
end type

event clicked;long ll_banquechoisie

if rb_td.checked = true then
	ll_banquechoisie = 1
elseif rb_rbs.checked = true then
	ll_banquechoisie = 2
elseif rb_bn.checked = true then
	ll_banquechoisie = 3
elseif rb_bs.checked = true then
	ll_banquechoisie = 4
end if

gnv_app.inv_entrepotglobal.of_ajoutedonnee( "banquechoisie", ll_banquechoisie)
close(w_choix_banque_cheque)
end event

type rb_rbs from radiobutton within w_choix_banque_cheque
integer x = 119
integer y = 328
integer width = 1006
integer height = 96
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Banque royale du Canada"
end type

type rb_td from radiobutton within w_choix_banque_cheque
integer x = 119
integer y = 204
integer width = 613
integer height = 96
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "TD Canada Trust"
end type

type st_title from statictext within w_choix_banque_cheque
integer x = 27
integer y = 36
integer width = 1737
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Choix de la banque"
alignment alignment = center!
boolean focusrectangle = false
end type

type rr_1 from roundrectangle within w_choix_banque_cheque
integer linethickness = 4
long fillcolor = 15793151
integer x = 14
integer y = 20
integer width = 1769
integer height = 120
integer cornerheight = 40
integer cornerwidth = 46
end type

