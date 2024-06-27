$PBExportHeader$w_listedentopendoss.srw
forward
global type w_listedentopendoss from w_child
end type
type uo_calutil2 from u_calutil within w_listedentopendoss
end type
type uo_calutil1 from u_calutil within w_listedentopendoss
end type
type st_2 from statictext within w_listedentopendoss
end type
type st_1 from statictext within w_listedentopendoss
end type
type em_fin from editmask within w_listedentopendoss
end type
type em_debut from editmask within w_listedentopendoss
end type
type cb_close from commandbutton within w_listedentopendoss
end type
type cb_find from commandbutton within w_listedentopendoss
end type
type cb_print from commandbutton within w_listedentopendoss
end type
type dw_listerefopendoss from u_dw within w_listedentopendoss
end type
end forward

global type w_listedentopendoss from w_child
integer x = 5
integer y = 4
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
st_2 st_2
st_1 st_1
em_fin em_fin
em_debut em_debut
cb_close cb_close
cb_find cb_find
cb_print cb_print
dw_listerefopendoss dw_listerefopendoss
end type
global w_listedentopendoss w_listedentopendoss

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

string ls_ortho
date debut , fin

debut = date('01/01/1900')
fin = today()
select dr_nom_complet into :ls_ortho from ortho_id where ortho_id = :v_no_ortho;
dw_listerefopendoss.object.t_title.text = ls_ortho
dw_listerefopendoss.SetTransObject(SQLCA)
dw_listerefopendoss.retrieve(v_no_ortho,debut,fin)
end event

on w_listedentopendoss.create
int iCurrent
call super::create
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.st_2=create st_2
this.st_1=create st_1
this.em_fin=create em_fin
this.em_debut=create em_debut
this.cb_close=create cb_close
this.cb_find=create cb_find
this.cb_print=create cb_print
this.dw_listerefopendoss=create dw_listerefopendoss
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_calutil2
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.em_fin
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.cb_find
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.dw_listerefopendoss
end on

on w_listedentopendoss.destroy
call super::destroy
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.cb_close)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.dw_listerefopendoss)
end on

type uo_calutil2 from u_calutil within w_listedentopendoss
boolean visible = false
integer x = 2469
integer y = 1364
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_listedentopendoss
boolean visible = false
integer x = 1595
integer y = 1364
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type st_2 from statictext within w_listedentopendoss
integer x = 2213
integer y = 1936
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'to:'
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type st_1 from statictext within w_listedentopendoss
integer x = 1326
integer y = 1936
integer width = 471
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date du début:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'From:'
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type em_fin from editmask within w_listedentopendoss
integer x = 2469
integer y = 1924
integer width = 402
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
end type

type em_debut from editmask within w_listedentopendoss
integer x = 1801
integer y = 1924
integer width = 393
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
end type

type cb_close from commandbutton within w_listedentopendoss
integer x = 2935
integer y = 1916
integer width = 654
integer height = 124
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_find from commandbutton within w_listedentopendoss
integer x = 658
integer y = 1916
integer width = 631
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_listerefopendoss.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type cb_print from commandbutton within w_listedentopendoss
integer y = 1916
integer width = 658
integer height = 124
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_listerefopendoss)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_listerefopendoss from u_dw within w_listedentopendoss
integer x = 23
integer width = 3561
integer height = 1916
integer taborder = 50
string dataobject = "d_listerefopendoss"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;choose case string(dwo.name)
	case 'b_startphase'
		SetSort('patient_opendoss A')
		Sort()
	case 'b_nom'
		SetSort('patnom A')
		Sort()
	case 'b_ref'
		SetSort('t_referents_ref_nom A, t_referents_ref_prenom A')
		Sort()
end choose
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

event constructor;SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.b_startphase.text = 'Starting date'
	this.object.b_nom.text = 'Last name'
	this.object.b_ref.text = 'Referral name'
	this.object.t_printedon.text = 'Printed on'
	this.object.t_titre.text = 'REFERRAL LIST FOR :'
	this.object.t_startphase.text = 'Starting date'
	this.object.t_nom.text = 'Last name'
	this.object.t_ref.text = 'Referral name'
end if
end event

