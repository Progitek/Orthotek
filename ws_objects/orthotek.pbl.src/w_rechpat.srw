$PBExportHeader$w_rechpat.srw
forward
global type w_rechpat from window
end type
type rb_prenomresp from radiobutton within w_rechpat
end type
type rb_nomresp from radiobutton within w_rechpat
end type
type sle_prenomresp from singlelineedit within w_rechpat
end type
type sle_nomresp from singlelineedit within w_rechpat
end type
type em_datenais from editmask within w_rechpat
end type
type rb_datenais from radiobutton within w_rechpat
end type
type sle_noboite from singlelineedit within w_rechpat
end type
type rb_noboite from radiobutton within w_rechpat
end type
type cb_1 from commandbutton within w_rechpat
end type
type st_1 from statictext within w_rechpat
end type
type sle_nodos from singlelineedit within w_rechpat
end type
type em_tel from editmask within w_rechpat
end type
type rb_nodos from radiobutton within w_rechpat
end type
type cb_apply from commandbutton within w_rechpat
end type
type cb_annule from commandbutton within w_rechpat
end type
type sle_prenom from singlelineedit within w_rechpat
end type
type sle_nom from singlelineedit within w_rechpat
end type
type rb_nom from radiobutton within w_rechpat
end type
type rb_prenom from radiobutton within w_rechpat
end type
type rb_tel from radiobutton within w_rechpat
end type
end forward

global type w_rechpat from window
integer width = 2062
integer height = 1116
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_prenomresp rb_prenomresp
rb_nomresp rb_nomresp
sle_prenomresp sle_prenomresp
sle_nomresp sle_nomresp
em_datenais em_datenais
rb_datenais rb_datenais
sle_noboite sle_noboite
rb_noboite rb_noboite
cb_1 cb_1
st_1 st_1
sle_nodos sle_nodos
em_tel em_tel
rb_nodos rb_nodos
cb_apply cb_apply
cb_annule cb_annule
sle_prenom sle_prenom
sle_nom sle_nom
rb_nom rb_nom
rb_prenom rb_prenom
rb_tel rb_tel
end type
global w_rechpat w_rechpat

forward prototypes
public subroutine applynom ()
public subroutine applyprenom ()
public subroutine applytel ()
public subroutine applynodos ()
public subroutine applynoboite ()
public subroutine applydatenais ()
public subroutine applynomresp ()
public subroutine applyprenomresp ()
end prototypes

public subroutine applynom ();w_patient.dw_patient_master.setFilter('')
w_patient.dw_patient_master.filter()
w_patient.dw_patient_master.setFilter("upper(patient_nom) like '" + upper(string(sle_nom.text)) + "%'")
w_patient.dw_patient_master.filter()
end subroutine

public subroutine applyprenom ();w_patient.dw_patient_master.setFilter('')
w_patient.dw_patient_master.filter()
w_patient.dw_patient_master.setFilter("upper(patient_prenom) like '" + upper(string(sle_prenom.text)) + "%'")
w_patient.dw_patient_master.filter()
end subroutine

public subroutine applytel ();string ls_tel

w_patient.dw_patient_master.setFilter('')
w_patient.dw_patient_master.filter()
ls_tel = em_tel.text
ls_tel = Replace(ls_tel, 1, 1, "")
ls_tel = Replace(ls_tel, 4, 1, "")
ls_tel = Replace(ls_tel, 4, 1, "")
ls_tel = Replace(ls_tel, 7, 1, "")
w_patient.dw_patient_master.setFilter("tel_maison = '" + string(ls_tel) + "'")
w_patient.dw_patient_master.filter()
end subroutine

public subroutine applynodos ();w_patient.dw_patient_master.setFilter('')
w_patient.dw_patient_master.filter()
w_patient.dw_patient_master.setFilter("trim(new_dossier) = '" + trim(string(sle_nodos.text)) + "'")
w_patient.dw_patient_master.filter()
end subroutine

public subroutine applynoboite ();w_patient.dw_patient_master.setFilter('')
w_patient.dw_patient_master.filter()
w_patient.dw_patient_master.setFilter("trim(no_boite) = '" + trim(string(sle_noboite.text)) + "'")
w_patient.dw_patient_master.filter()
end subroutine

public subroutine applydatenais ();date ldt_datenais

w_patient.dw_patient_master.setFilter('')
w_patient.dw_patient_master.filter()
em_datenais.getdata(ldt_datenais)
w_patient.dw_patient_master.setFilter("string(date_naissance,'dd-mm-yyyy') = '" + string(ldt_datenais,"dd-mm-yyyy") + "'")
w_patient.dw_patient_master.filter()
end subroutine

public subroutine applynomresp ();string ls_patid

select list(patient_id) into :ls_patid from t_contact where nom like :sle_nomresp.text || '%';

w_patient.dw_patient_master.setFilter("patient_id in (" + upper(string(ls_patid)) + ")")
w_patient.dw_patient_master.filter()
end subroutine

public subroutine applyprenomresp ();string ls_patid

select list(patient_id) into :ls_patid from t_contact where prenom like :sle_prenomresp.text || '%';

w_patient.dw_patient_master.setFilter("patient_id in (" + upper(string(ls_patid)) + ")")
w_patient.dw_patient_master.filter()
end subroutine

on w_rechpat.create
this.rb_prenomresp=create rb_prenomresp
this.rb_nomresp=create rb_nomresp
this.sle_prenomresp=create sle_prenomresp
this.sle_nomresp=create sle_nomresp
this.em_datenais=create em_datenais
this.rb_datenais=create rb_datenais
this.sle_noboite=create sle_noboite
this.rb_noboite=create rb_noboite
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_nodos=create sle_nodos
this.em_tel=create em_tel
this.rb_nodos=create rb_nodos
this.cb_apply=create cb_apply
this.cb_annule=create cb_annule
this.sle_prenom=create sle_prenom
this.sle_nom=create sle_nom
this.rb_nom=create rb_nom
this.rb_prenom=create rb_prenom
this.rb_tel=create rb_tel
this.Control[]={this.rb_prenomresp,&
this.rb_nomresp,&
this.sle_prenomresp,&
this.sle_nomresp,&
this.em_datenais,&
this.rb_datenais,&
this.sle_noboite,&
this.rb_noboite,&
this.cb_1,&
this.st_1,&
this.sle_nodos,&
this.em_tel,&
this.rb_nodos,&
this.cb_apply,&
this.cb_annule,&
this.sle_prenom,&
this.sle_nom,&
this.rb_nom,&
this.rb_prenom,&
this.rb_tel}
end on

on w_rechpat.destroy
destroy(this.rb_prenomresp)
destroy(this.rb_nomresp)
destroy(this.sle_prenomresp)
destroy(this.sle_nomresp)
destroy(this.em_datenais)
destroy(this.rb_datenais)
destroy(this.sle_noboite)
destroy(this.rb_noboite)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_nodos)
destroy(this.em_tel)
destroy(this.rb_nodos)
destroy(this.cb_apply)
destroy(this.cb_annule)
destroy(this.sle_prenom)
destroy(this.sle_nom)
destroy(this.rb_nom)
destroy(this.rb_prenom)
destroy(this.rb_tel)
end on

type rb_prenomresp from radiobutton within w_rechpat
integer x = 87
integer y = 860
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prénom responsable"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Responsible fristname'
end if
end event

type rb_nomresp from radiobutton within w_rechpat
integer x = 87
integer y = 764
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom responsable"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Responsible lastname'
end if
end event

event getfocus;rb_nomresp.checked = true
end event

type sle_prenomresp from singlelineedit within w_rechpat
integer x = 791
integer y = 860
integer width = 1111
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_prenomresp.checked = true
end event

type sle_nomresp from singlelineedit within w_rechpat
integer x = 791
integer y = 764
integer width = 1111
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_nomresp.checked = true
end event

type em_datenais from editmask within w_rechpat
integer x = 791
integer y = 664
integer width = 402
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd-MM-yyyy"
boolean dropdowncalendar = true
end type

event getfocus;rb_datenais.checked = true
end event

type rb_datenais from radiobutton within w_rechpat
integer x = 87
integer y = 664
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "# Date de naissance"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Birthdate'
end if
end event

type sle_noboite from singlelineedit within w_rechpat
integer x = 791
integer y = 564
integer width = 443
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_nodos.checked = true
end event

type rb_noboite from radiobutton within w_rechpat
integer x = 87
integer y = 572
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "# de boîte"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Box #'
end if
end event

type cb_1 from commandbutton within w_rechpat
integer x = 686
integer y = 984
integer width = 677
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Tous"
end type

event clicked;w_patient.dw_patient_master.setFilter('')
w_patient.dw_patient_master.filter()
w_patient.dw_patient_master.setSort("patient_nom A, patient_prenom A")
w_patient.dw_patient_master.sort()
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'All'
end if
end event

type st_1 from statictext within w_rechpat
integer x = 14
integer y = 12
integer width = 1861
integer height = 104
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Recherche de patient"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Advanced search'
end if
end event

type sle_nodos from singlelineedit within w_rechpat
integer x = 791
integer y = 464
integer width = 443
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_nodos.checked = true
end event

type em_tel from editmask within w_rechpat
integer x = 791
integer y = 364
integer width = 599
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

event getfocus;rb_tel.checked = true
end event

type rb_nodos from radiobutton within w_rechpat
integer x = 87
integer y = 468
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "# de dossier"
end type

event constructor;if v_langue = 'an' then
	this.text = 'File #'
end if
end event

type cb_apply from commandbutton within w_rechpat
integer x = 1362
integer y = 984
integer width = 677
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
end type

event clicked;if rb_nom.checked then
	// appliquer filtre nom
	applynom()
end if
if rb_prenom.checked then
	// appliquer filtre prenom
	applyprenom()
end if
if rb_tel.checked then
	// appliquer filtre téléphone
	applytel()
end if
if rb_nodos.checked then
	// appliquer filtre numéro dossier
	applynodos()
end if
if rb_nodos.checked then
	// appliquer filtre numéro de boite
	applynoboite()
end if
if rb_datenais.checked then
	applydatenais()
end if
if rb_nomresp.checked then
	applynomresp()
end if
if rb_prenomresp.checked then
	applyprenomresp()
end if

w_patient.dw_patient_master.setSort("patient_nom A, patient_prenom A")
w_patient.dw_patient_master.sort()
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Apply'
end if
end event

type cb_annule from commandbutton within w_rechpat
integer x = 9
integer y = 984
integer width = 677
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type sle_prenom from singlelineedit within w_rechpat
integer x = 791
integer y = 264
integer width = 1111
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_prenom.checked = true
end event

type sle_nom from singlelineedit within w_rechpat
integer x = 791
integer y = 164
integer width = 1111
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_nom.checked = true
end event

type rb_nom from radiobutton within w_rechpat
integer x = 87
integer y = 176
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom"
boolean checked = true
end type

event constructor;if v_langue = 'an' then
	this.text = 'Last Name'
end if

end event

type rb_prenom from radiobutton within w_rechpat
integer x = 87
integer y = 272
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prénom"
end type

event constructor;if v_langue = 'an' then
	this.text = 'First Name'
end if
end event

type rb_tel from radiobutton within w_rechpat
integer x = 87
integer y = 368
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Téléphone"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Phone'
end if
end event

