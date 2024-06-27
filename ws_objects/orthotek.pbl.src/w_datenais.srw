$PBExportHeader$w_datenais.srw
forward
global type w_datenais from window
end type
type cb_cancel from commandbutton within w_datenais
end type
type st_9 from statictext within w_datenais
end type
type st_8 from statictext within w_datenais
end type
type st_7 from statictext within w_datenais
end type
type st_6 from statictext within w_datenais
end type
type st_5 from statictext within w_datenais
end type
type st_4 from statictext within w_datenais
end type
type p_1 from picture within w_datenais
end type
type cb_supp from commandbutton within w_datenais
end type
type cb_10 from commandbutton within w_datenais
end type
type cb_bnt0 from commandbutton within w_datenais
end type
type cb_bnt9 from commandbutton within w_datenais
end type
type cb_bnt8 from commandbutton within w_datenais
end type
type cb_bnt7 from commandbutton within w_datenais
end type
type cb_bnt6 from commandbutton within w_datenais
end type
type cb_bnt5 from commandbutton within w_datenais
end type
type cb_bnt4 from commandbutton within w_datenais
end type
type cb_bnt3 from commandbutton within w_datenais
end type
type cb_bnt2 from commandbutton within w_datenais
end type
type st_3 from statictext within w_datenais
end type
type st_nom from statictext within w_datenais
end type
type em_datenais from editmask within w_datenais
end type
type cb_bnt1 from commandbutton within w_datenais
end type
type st_datenais from statictext within w_datenais
end type
type rr_1 from roundrectangle within w_datenais
end type
type rr_2 from roundrectangle within w_datenais
end type
end forward

global type w_datenais from window
integer width = 3666
integer height = 2300
windowtype windowtype = response!
long backcolor = 15780518
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
cb_cancel cb_cancel
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
p_1 p_1
cb_supp cb_supp
cb_10 cb_10
cb_bnt0 cb_bnt0
cb_bnt9 cb_bnt9
cb_bnt8 cb_bnt8
cb_bnt7 cb_bnt7
cb_bnt6 cb_bnt6
cb_bnt5 cb_bnt5
cb_bnt4 cb_bnt4
cb_bnt3 cb_bnt3
cb_bnt2 cb_bnt2
st_3 st_3
st_nom st_nom
em_datenais em_datenais
cb_bnt1 cb_bnt1
st_datenais st_datenais
rr_1 rr_1
rr_2 rr_2
end type
global w_datenais w_datenais

type variables
public s_cincout istr_cincout
end variables

on w_datenais.create
this.cb_cancel=create cb_cancel
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.p_1=create p_1
this.cb_supp=create cb_supp
this.cb_10=create cb_10
this.cb_bnt0=create cb_bnt0
this.cb_bnt9=create cb_bnt9
this.cb_bnt8=create cb_bnt8
this.cb_bnt7=create cb_bnt7
this.cb_bnt6=create cb_bnt6
this.cb_bnt5=create cb_bnt5
this.cb_bnt4=create cb_bnt4
this.cb_bnt3=create cb_bnt3
this.cb_bnt2=create cb_bnt2
this.st_3=create st_3
this.st_nom=create st_nom
this.em_datenais=create em_datenais
this.cb_bnt1=create cb_bnt1
this.st_datenais=create st_datenais
this.rr_1=create rr_1
this.rr_2=create rr_2
this.Control[]={this.cb_cancel,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.p_1,&
this.cb_supp,&
this.cb_10,&
this.cb_bnt0,&
this.cb_bnt9,&
this.cb_bnt8,&
this.cb_bnt7,&
this.cb_bnt6,&
this.cb_bnt5,&
this.cb_bnt4,&
this.cb_bnt3,&
this.cb_bnt2,&
this.st_3,&
this.st_nom,&
this.em_datenais,&
this.cb_bnt1,&
this.st_datenais,&
this.rr_1,&
this.rr_2}
end on

on w_datenais.destroy
destroy(this.cb_cancel)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.p_1)
destroy(this.cb_supp)
destroy(this.cb_10)
destroy(this.cb_bnt0)
destroy(this.cb_bnt9)
destroy(this.cb_bnt8)
destroy(this.cb_bnt7)
destroy(this.cb_bnt6)
destroy(this.cb_bnt5)
destroy(this.cb_bnt4)
destroy(this.cb_bnt3)
destroy(this.cb_bnt2)
destroy(this.st_3)
destroy(this.st_nom)
destroy(this.em_datenais)
destroy(this.cb_bnt1)
destroy(this.st_datenais)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;string ls_nom, ls_prenom, ls_langue

istr_cincout = message.powerObjectParm
select patient_nom, patient_prenom, langue into :ls_nom, :ls_prenom, :ls_langue from patient where patient_id = :istr_cincout.patient_id;
st_nom.text = ls_prenom + ' ' + ls_nom
if ls_langue = 'A' then
	st_datenais.text = "Birthdate of"
	cb_supp.text = "Back"
	st_3.text = "( DD/MM/YYYY )"
	st_4.text = "Please enter your "
	st_5.text = "birthdate using the "
	st_6.text = 'digital keyboard. The'
	st_7.text = '"back" key deletes the'
	st_8.text = "last character entered"
	st_9.text = ""
	cb_cancel.text = "Cancel"
end if

end event

type cb_cancel from commandbutton within w_datenais
integer x = 2075
integer y = 2052
integer width = 768
integer height = 216
integer taborder = 120
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;close(parent)
end event

type st_9 from statictext within w_datenais
integer x = 1806
integer y = 1360
integer width = 1915
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "dernier caractère entré."
boolean focusrectangle = false
end type

type st_8 from statictext within w_datenais
integer x = 1806
integer y = 1192
integer width = 1847
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "met de supprimer le"
boolean focusrectangle = false
end type

type st_7 from statictext within w_datenais
integer x = 1806
integer y = 1024
integer width = 1929
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "La touche ~"Effacer~" per-"
boolean focusrectangle = false
end type

type st_6 from statictext within w_datenais
integer x = 1806
integer y = 856
integer width = 1810
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "clavier numérique."
boolean focusrectangle = false
end type

type st_5 from statictext within w_datenais
integer x = 1806
integer y = 688
integer width = 1810
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "de naissance à l~'aide du"
boolean focusrectangle = false
end type

type st_4 from statictext within w_datenais
integer x = 1806
integer y = 520
integer width = 1819
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Veuillez entrer votre date"
boolean focusrectangle = false
end type

type p_1 from picture within w_datenais
integer x = 1774
integer y = 16
integer width = 1856
integer height = 420
string picturename = "C:\ii4net\orthotek\images\PROGITEK V1 (1).jpg"
boolean focusrectangle = false
end type

type cb_supp from commandbutton within w_datenais
integer x = 645
integer y = 1920
integer width = 713
integer height = 296
integer taborder = 10
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Effacer"
end type

event clicked;em_datenais.selectText(em_datenais.position() - 1 ,1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		//em_datenais.selectText(em_datenais.position() - 1,1)
	else
		em_datenais.ReplaceText("0")
	end if
end if
em_datenais.selectText(em_datenais.position() - 1,0)
em_datenais.setfocus()

end event

type cb_10 from commandbutton within w_datenais
integer x = 2857
integer y = 2052
integer width = 768
integer height = 216
integer taborder = 110
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;date ldt_datenaisenter, ldt_datenais
string ls_langue
time lt_check
long ll_count

lt_check = now()
ldt_datenaisenter = gf_emtodate((em_datenais.text))
select date_naissance, langue  into :ldt_datenais, :ls_langue from patient where patient_id = :istr_cincout.patient_id;
if ldt_datenaisenter = ldt_datenais then
	
	update t_rdv set heurearr = now(), rdvetat = :istr_cincout.status where patient_id = :istr_cincout.patient_id and rdvheure = :istr_cincout.heure and rdvdate = today();
	if error_type(-1) = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	
	if istr_cincout.status = 'l' then
		update patient set retards = retards - 1 where patient_id = :istr_cincout.patient_id;
		commit using SQLCA;
	end if
	
//	w_cincoutreg.dw_cincoutreg.event ue_retrieve()
	insert into t_horlogrefresh(rdvdate,rdvheure,updateheure) 
	values(today(),now(),current timestamp);

//	if ls_langue = 'A' then
//		messagebox("Information!","Thank you. You are now registered",Information!,Ok!)
//	else
//		messagebox("Information!","Merci de vous être enregistré(e)",Information!,Ok!)
//	end if
	openwithparm(w_msgcincout,ls_langue)
	close(parent)
else
	if ls_langue = 'A' then
		messagebox("Avertissement","The birthdate is invalid")
	else
		messagebox("Avertissement","La date de naissance est invalide")
	end if
//	close(parent)
end if
end event

type cb_bnt0 from commandbutton within w_datenais
integer x = 274
integer y = 1920
integer width = 343
integer height = 296
integer taborder = 100
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "0"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("0")
end if
em_datenais.setfocus()
end event

type cb_bnt9 from commandbutton within w_datenais
integer x = 1015
integer y = 1604
integer width = 343
integer height = 296
integer taborder = 90
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "9"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("9")
end if
em_datenais.setfocus()
end event

type cb_bnt8 from commandbutton within w_datenais
integer x = 645
integer y = 1604
integer width = 343
integer height = 296
integer taborder = 80
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "8"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("8")
end if
em_datenais.setfocus()
end event

type cb_bnt7 from commandbutton within w_datenais
integer x = 274
integer y = 1604
integer width = 343
integer height = 296
integer taborder = 70
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "7"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("7")
end if
em_datenais.setfocus()
end event

type cb_bnt6 from commandbutton within w_datenais
integer x = 1015
integer y = 1288
integer width = 343
integer height = 296
integer taborder = 60
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "6"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("6")
end if
em_datenais.setfocus()
end event

type cb_bnt5 from commandbutton within w_datenais
integer x = 645
integer y = 1288
integer width = 343
integer height = 296
integer taborder = 50
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "5"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("5")
end if
em_datenais.setfocus()
end event

type cb_bnt4 from commandbutton within w_datenais
integer x = 274
integer y = 1288
integer width = 343
integer height = 296
integer taborder = 40
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "4"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("4")
end if
em_datenais.setfocus()
end event

type cb_bnt3 from commandbutton within w_datenais
integer x = 1015
integer y = 972
integer width = 343
integer height = 296
integer taborder = 30
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "3"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("3")
end if
em_datenais.setfocus()
end event

type cb_bnt2 from commandbutton within w_datenais
integer x = 645
integer y = 972
integer width = 343
integer height = 296
integer taborder = 20
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "2"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("2")
end if
em_datenais.setfocus()
end event

type st_3 from statictext within w_datenais
integer x = 297
integer y = 556
integer width = 1001
integer height = 140
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "( JJ/MM/AAAA )"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = '(dd/mm/yyyy)'
end if
end event

type st_nom from statictext within w_datenais
integer x = 37
integer y = 188
integer width = 1714
integer height = 324
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = center!
boolean focusrectangle = false
end type

type em_datenais from editmask within w_datenais
integer x = 366
integer y = 704
integer width = 873
integer height = 208
integer taborder = 10
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type cb_bnt1 from commandbutton within w_datenais
integer x = 274
integer y = 972
integer width = 343
integer height = 296
integer taborder = 10
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1"
end type

event clicked;em_datenais.selectText(em_datenais.position(),1)
if em_datenais.selectedText() <> '' then
	if em_datenais.selectedText() = '/' then
		em_datenais.ReplaceText("/")
		em_datenais.selectText(em_datenais.position(),1)
	end if
	em_datenais.ReplaceText("1")
end if
em_datenais.setfocus()
end event

type st_datenais from statictext within w_datenais
integer x = 37
integer width = 1714
integer height = 164
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date de naissance de"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Enter your Birthdate'
end if
end event

type rr_1 from roundrectangle within w_datenais
integer linethickness = 4
long fillcolor = 134217752
integer x = 27
integer y = 952
integer width = 1723
integer height = 1292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_datenais
integer linethickness = 4
long fillcolor = 134217752
integer x = 27
integer y = 520
integer width = 1723
integer height = 420
integer cornerheight = 40
integer cornerwidth = 46
end type

type dw_1 from datawindow within w_datenais
integer x = 87
integer y = 152
integer width = 2661
integer height = 720
integer taborder = 10
string title = "none"
string dataobject = "d_test1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;insertRow(0)
end event

