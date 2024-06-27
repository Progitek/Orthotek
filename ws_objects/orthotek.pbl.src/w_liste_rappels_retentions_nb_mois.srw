$PBExportHeader$w_liste_rappels_retentions_nb_mois.srw
forward
global type w_liste_rappels_retentions_nb_mois from window
end type
type st_sem from statictext within w_liste_rappels_retentions_nb_mois
end type
type em_nb_sem from editmask within w_liste_rappels_retentions_nb_mois
end type
type pb_upsem from picturebutton within w_liste_rappels_retentions_nb_mois
end type
type pb_downsem from picturebutton within w_liste_rappels_retentions_nb_mois
end type
type st_mois from statictext within w_liste_rappels_retentions_nb_mois
end type
type cb_close from commandbutton within w_liste_rappels_retentions_nb_mois
end type
type cb_apply from commandbutton within w_liste_rappels_retentions_nb_mois
end type
type em_nb_mois from editmask within w_liste_rappels_retentions_nb_mois
end type
type pb_down from picturebutton within w_liste_rappels_retentions_nb_mois
end type
type pb_up from picturebutton within w_liste_rappels_retentions_nb_mois
end type
end forward

global type w_liste_rappels_retentions_nb_mois from window
integer x = 823
integer y = 360
integer width = 1614
integer height = 692
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
boolean center = true
st_sem st_sem
em_nb_sem em_nb_sem
pb_upsem pb_upsem
pb_downsem pb_downsem
st_mois st_mois
cb_close cb_close
cb_apply cb_apply
em_nb_mois em_nb_mois
pb_down pb_down
pb_up pb_up
end type
global w_liste_rappels_retentions_nb_mois w_liste_rappels_retentions_nb_mois

type variables

end variables

on w_liste_rappels_retentions_nb_mois.create
this.st_sem=create st_sem
this.em_nb_sem=create em_nb_sem
this.pb_upsem=create pb_upsem
this.pb_downsem=create pb_downsem
this.st_mois=create st_mois
this.cb_close=create cb_close
this.cb_apply=create cb_apply
this.em_nb_mois=create em_nb_mois
this.pb_down=create pb_down
this.pb_up=create pb_up
this.Control[]={this.st_sem,&
this.em_nb_sem,&
this.pb_upsem,&
this.pb_downsem,&
this.st_mois,&
this.cb_close,&
this.cb_apply,&
this.em_nb_mois,&
this.pb_down,&
this.pb_up}
end on

on w_liste_rappels_retentions_nb_mois.destroy
destroy(this.st_sem)
destroy(this.em_nb_sem)
destroy(this.pb_upsem)
destroy(this.pb_downsem)
destroy(this.st_mois)
destroy(this.cb_close)
destroy(this.cb_apply)
destroy(this.em_nb_mois)
destroy(this.pb_down)
destroy(this.pb_up)
end on

event open;em_nb_mois.text = "0"
em_nb_sem.text = "0"
end event

type st_sem from statictext within w_liste_rappels_retentions_nb_mois
integer y = 292
integer width = 1591
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dans combien de semaines voulez-vous revoir ce patient ?"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'In how many weeks do you want to see this patient again?'
end if
end event

type em_nb_sem from editmask within w_liste_rappels_retentions_nb_mois
integer x = 677
integer y = 388
integer width = 247
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "##"
string displaydata = "0~t0/"
double increment = 1
string minmax = "0~~99"
end type

type pb_upsem from picturebutton within w_liste_rappels_retentions_nb_mois
integer x = 1024
integer y = 376
integer width = 242
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicatr.bmp"
alignment htextalign = left!
end type

event clicked;if Integer(em_nb_sem.text) < 99 then
	em_nb_sem.text = string(Integer(em_nb_sem.text) + 1)
end if
end event

type pb_downsem from picturebutton within w_liste_rappels_retentions_nb_mois
integer x = 325
integer y = 376
integer width = 242
integer height = 124
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicat2.bmp"
alignment htextalign = left!
end type

event clicked;if Integer(em_nb_sem.text) > 0 then
	em_nb_sem.text = string(Integer(em_nb_sem.text) - 1)
end if
end event

type st_mois from statictext within w_liste_rappels_retentions_nb_mois
integer y = 72
integer width = 1591
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Dans combien de mois voulez-vous revoir ce patient ?"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'In how many months do you want to see this patient again?'
end if
end event

type cb_close from commandbutton within w_liste_rappels_retentions_nb_mois
integer x = 805
integer y = 516
integer width = 782
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
boolean cancel = true
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_apply from commandbutton within w_liste_rappels_retentions_nb_mois
integer x = 9
integer y = 516
integer width = 795
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Appliquer"
boolean default = true
end type

event clicked;integer v_jour,jour,mois,annee,li_nb
date ldt_due

ldt_due = w_liste_des_rappels_retentions.idt_due
li_nb = Integer(em_nb_mois.Text)
if li_nb <> 0 and isnull(li_nb) = false then
	jour = day(ldt_due)
	annee = year(ldt_due)
	mois = month(ldt_due) + li_nb
	do while (mois / 12) > 1 or (mois / 12) <= 0
		if (mois / 12) > 1 then
			annee = annee + 1
			mois = mois - 12
		else
			annee = annee - 1
			mois = mois + 12
		end if
	loop
	v_jour = correction_jour(jour,mois,annee)
	ldt_due = date(annee,mois,v_jour)
end if
li_nb = Integer(em_nb_sem.Text)
if li_nb <> 0 and isnull(li_nb) = false then
	li_nb = li_nb * 7
	ldt_due = relativedate(ldt_due,li_nb)
end if
w_liste_des_rappels_retentions.idt_due = ldt_due
Close(Parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Apply'
end if
end event

type em_nb_mois from editmask within w_liste_rappels_retentions_nb_mois
integer x = 677
integer y = 172
integer width = 247
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "##"
string displaydata = "0~t0/"
double increment = 1
string minmax = "0~~99"
end type

type pb_down from picturebutton within w_liste_rappels_retentions_nb_mois
integer x = 325
integer y = 152
integer width = 242
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicat2.bmp"
alignment htextalign = left!
end type

event clicked;if Integer(em_nb_mois.text) > 0 then
	em_nb_mois.text = string(Integer(em_nb_mois.text) - 1)
end if
end event

type pb_up from picturebutton within w_liste_rappels_retentions_nb_mois
integer x = 1024
integer y = 152
integer width = 242
integer height = 124
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicatr.bmp"
alignment htextalign = left!
end type

event clicked;if Integer(em_nb_mois.text) < 99 then
	em_nb_mois.text = string(Integer(em_nb_mois.text) + 1)
end if
end event

