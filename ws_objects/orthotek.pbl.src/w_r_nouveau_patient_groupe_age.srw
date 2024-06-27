$PBExportHeader$w_r_nouveau_patient_groupe_age.srw
forward
global type w_r_nouveau_patient_groupe_age from w_child
end type
type cb_close from commandbutton within w_r_nouveau_patient_groupe_age
end type
type cb_print from commandbutton within w_r_nouveau_patient_groupe_age
end type
type cb_search from commandbutton within w_r_nouveau_patient_groupe_age
end type
type dw_r_nouveau_patient_groupe_age from u_dw within w_r_nouveau_patient_groupe_age
end type
type st_fin from statictext within w_r_nouveau_patient_groupe_age
end type
type st_debut from statictext within w_r_nouveau_patient_groupe_age
end type
type em_fin from editmask within w_r_nouveau_patient_groupe_age
end type
type em_debut from editmask within w_r_nouveau_patient_groupe_age
end type
type gb_1 from groupbox within w_r_nouveau_patient_groupe_age
end type
type rr_1 from roundrectangle within w_r_nouveau_patient_groupe_age
end type
end forward

global type w_r_nouveau_patient_groupe_age from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
cb_close cb_close
cb_print cb_print
cb_search cb_search
dw_r_nouveau_patient_groupe_age dw_r_nouveau_patient_groupe_age
st_fin st_fin
st_debut st_debut
em_fin em_fin
em_debut em_debut
gb_1 gb_1
rr_1 rr_1
end type
global w_r_nouveau_patient_groupe_age w_r_nouveau_patient_groupe_age

on w_r_nouveau_patient_groupe_age.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_search=create cb_search
this.dw_r_nouveau_patient_groupe_age=create dw_r_nouveau_patient_groupe_age
this.st_fin=create st_fin
this.st_debut=create st_debut
this.em_fin=create em_fin
this.em_debut=create em_debut
this.gb_1=create gb_1
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.cb_search
this.Control[iCurrent+4]=this.dw_r_nouveau_patient_groupe_age
this.Control[iCurrent+5]=this.st_fin
this.Control[iCurrent+6]=this.st_debut
this.Control[iCurrent+7]=this.em_fin
this.Control[iCurrent+8]=this.em_debut
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.rr_1
end on

on w_r_nouveau_patient_groupe_age.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.dw_r_nouveau_patient_groupe_age)
destroy(this.st_fin)
destroy(this.st_debut)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.gb_1)
destroy(this.rr_1)
end on

type cb_close from commandbutton within w_r_nouveau_patient_groupe_age
integer x = 3031
integer y = 1896
integer width = 599
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type cb_print from commandbutton within w_r_nouveau_patient_groupe_age
integer x = 626
integer y = 1900
integer width = 599
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_r_nouveau_patient_groupe_age)
end event

type cb_search from commandbutton within w_r_nouveau_patient_groupe_age
integer x = 27
integer y = 1900
integer width = 599
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;long ll_idspec, ll_actif, ll_fermer, ll_dossurg

ll_idspec = v_no_ortho
if ll_idspec = 0 then setnull(ll_idspec)

dw_r_nouveau_patient_groupe_age.retrieve(gf_emtoDate(em_debut.text),gf_emtoDate(em_fin.text),ll_idspec)

end event

type dw_r_nouveau_patient_groupe_age from u_dw within w_r_nouveau_patient_groupe_age
integer x = 46
integer y = 308
integer width = 3561
integer height = 1552
integer taborder = 30
string title = "none"
string dataobject = "d_r_nouveau_patient_groupe_age"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
end event

type st_fin from statictext within w_r_nouveau_patient_groupe_age
integer x = 82
integer y = 184
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin:"
boolean focusrectangle = false
end type

type st_debut from statictext within w_r_nouveau_patient_groupe_age
integer x = 82
integer y = 92
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Début:"
boolean focusrectangle = false
end type

type em_fin from editmask within w_r_nouveau_patient_groupe_age
string tag = "resize=frbsr"
integer x = 334
integer y = 168
integer width = 379
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event constructor;this.text = string(today())
end event

type em_debut from editmask within w_r_nouveau_patient_groupe_age
string tag = "resize=frbsr"
integer x = 334
integer y = 72
integer width = 379
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event constructor;this.text = string(today())
end event

type gb_1 from groupbox within w_r_nouveau_patient_groupe_age
integer x = 27
integer y = 12
integer width = 713
integer height = 256
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ouverture de dossier"
end type

type rr_1 from roundrectangle within w_r_nouveau_patient_groupe_age
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 16777215
integer x = 23
integer y = 276
integer width = 3593
integer height = 1608
integer cornerheight = 40
integer cornerwidth = 46
end type

