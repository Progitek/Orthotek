$PBExportHeader$w_patarchiver.srw
forward
global type w_patarchiver from w_child
end type
type rb_refuse from radiobutton within w_patarchiver
end type
type rb_termine from radiobutton within w_patarchiver
end type
type rb_tous from radiobutton within w_patarchiver
end type
type uo_calutil2 from u_calutil within w_patarchiver
end type
type uo_calutil1 from u_calutil within w_patarchiver
end type
type st_3 from statictext within w_patarchiver
end type
type sle_rech from singlelineedit within w_patarchiver
end type
type cb_update from commandbutton within w_patarchiver
end type
type dw_patarchiver from u_dw within w_patarchiver
end type
type em_fin from editmask within w_patarchiver
end type
type em_debut from editmask within w_patarchiver
end type
type st_2 from statictext within w_patarchiver
end type
type st_1 from statictext within w_patarchiver
end type
type cb_3 from commandbutton within w_patarchiver
end type
type cb_find from commandbutton within w_patarchiver
end type
type cb_print from commandbutton within w_patarchiver
end type
end forward

global type w_patarchiver from w_child
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
rb_refuse rb_refuse
rb_termine rb_termine
rb_tous rb_tous
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
st_3 st_3
sle_rech sle_rech
cb_update cb_update
dw_patarchiver dw_patarchiver
em_fin em_fin
em_debut em_debut
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_find cb_find
cb_print cb_print
end type
global w_patarchiver w_patarchiver

type variables
boolean change = false
end variables

on w_patarchiver.create
int iCurrent
call super::create
this.rb_refuse=create rb_refuse
this.rb_termine=create rb_termine
this.rb_tous=create rb_tous
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.st_3=create st_3
this.sle_rech=create sle_rech
this.cb_update=create cb_update
this.dw_patarchiver=create dw_patarchiver
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_refuse
this.Control[iCurrent+2]=this.rb_termine
this.Control[iCurrent+3]=this.rb_tous
this.Control[iCurrent+4]=this.uo_calutil2
this.Control[iCurrent+5]=this.uo_calutil1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.sle_rech
this.Control[iCurrent+8]=this.cb_update
this.Control[iCurrent+9]=this.dw_patarchiver
this.Control[iCurrent+10]=this.em_fin
this.Control[iCurrent+11]=this.em_debut
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_find
this.Control[iCurrent+16]=this.cb_print
end on

on w_patarchiver.destroy
call super::destroy
destroy(this.rb_refuse)
destroy(this.rb_termine)
destroy(this.rb_tous)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.st_3)
destroy(this.sle_rech)
destroy(this.cb_update)
destroy(this.dw_patarchiver)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type rb_refuse from radiobutton within w_patarchiver
integer x = 2848
integer y = 8
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Refusé"
end type

event constructor;if v_langue = 'an' then
	this.text = "Refused"
end if
end event

type rb_termine from radiobutton within w_patarchiver
integer x = 2418
integer y = 8
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Terminé"
end type

event constructor;if v_langue = 'an' then
	this.text = "Terminated"
end if
end event

type rb_tous from radiobutton within w_patarchiver
integer x = 1989
integer y = 8
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tous"
boolean checked = true
end type

event constructor;if v_langue = 'an' then
	this.text = "All"
end if
end event

type uo_calutil2 from u_calutil within w_patarchiver
boolean visible = false
integer x = 1829
integer y = 1360
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_patarchiver
boolean visible = false
integer x = 1074
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type st_3 from statictext within w_patarchiver
integer x = 27
integer y = 12
integer width = 1015
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrer le nom du patient à rechercher:"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Enter the name of a patient to search for:"
end if
end event

type sle_rech from singlelineedit within w_patarchiver
integer x = 1056
integer width = 869
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_dnom, ls_nom
integer no_row, v_nb

//pour regler le bug des apostrophes
ls_dnom = Trim(sle_rech.text)+'%'
ls_nom = Trim(sle_rech.text)
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if

if isnumber(left(ls_dnom,1)) then
	no_row = dw_patarchiver.Find("new_dossier = '" + ls_nom + "'",0,dw_patarchiver.rowcount())
	dw_patarchiver.scrolltorow(no_row)
	dw_patarchiver.setfocus()	
else
	no_row = dw_patarchiver.Find("upper(patient_nom) like '" +upper(ls_dnom)+"'",0,dw_patarchiver.rowcount())
	dw_patarchiver.scrolltorow(no_row)
	dw_patarchiver.setfocus()	
end if
end event

type cb_update from commandbutton within w_patarchiver
integer x = 2245
integer y = 1912
integer width = 608
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;if change then
	if dw_patarchiver.update() = 1 then
		commit using SQLCA;
		change = false
	else
		rollback using SQLCA;
		error_type(50)
	end if
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Update"
end if
end event

type dw_patarchiver from u_dw within w_patarchiver
integer y = 100
integer width = 3634
integer height = 1804
integer taborder = 60
string title = "patarchiver"
string dataobject = "d_patarchiver"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_null

setnull(ll_null)
SetTransObject(SQLCA)
SetRowFocusIndicator(focusrect!)
retrieve(v_no_ortho,date("1900-01-01"),today(),ll_null)

if v_langue = 'an' then
	this.object.t_1.text = 'Birth date'
	this.object.patient_prenom_t.text = 'Name'
	this.object.b_nom.text = 'Name'
	this.object.b_telmais.text = 'Tel. home'
	this.object.b_datenais.text = 'Birth date'
	this.object.t_lastapp.text = 'Last App.'
end if
end event

event clicked;choose case string(dwo.name)
	case 'b_nom'
		SetSort('patient_nom A')
		Sort()
	case 'b_datenais'
		SetSort('date_naissance A')
		Sort()
	case 'b_telmais'
		SetSort('tel_maison A')
		Sort()
	case 'b_datearch'
		SetSort('archivedate A')
		Sort()
	case 't_lastapp'
		SetSort('lastapp A')
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

event editchanged;call super::editchanged;change = true
end event

type em_fin from editmask within w_patarchiver
integer x = 1829
integer y = 1916
integer width = 389
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
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

type em_debut from editmask within w_patarchiver
integer x = 1280
integer y = 1916
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
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

type st_2 from statictext within w_patarchiver
integer x = 1678
integer y = 1928
integer width = 146
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
string text = "Fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "End"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type st_1 from statictext within w_patarchiver
integer x = 1056
integer y = 1928
integer width = 219
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
string text = "Début:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Start"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type cb_3 from commandbutton within w_patarchiver
integer x = 2853
integer y = 1912
integer width = 768
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if change then
	
	if error_type(200) = 1 then
		cb_update.event clicked()
	end if
	
end if

Close(parent)
w_patient.dw_patient_master.event ue_actualiser()
end event

event constructor;if v_langue = 'an' then
	cb_3.Text = "Close"
end if
end event

type cb_find from commandbutton within w_patarchiver
integer x = 539
integer y = 1912
integer width = 512
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin
long ll_typearchive

debut = date(string(em_debut.text))
fin = date(string(em_fin.text))
if rb_tous.checked then
	setnull(ll_typearchive)
elseif rb_termine.checked then
	ll_typearchive = 2
else
	ll_typearchive = 3
end if

//dw_patarchiver.object.date_debut.text = em_debut.text
//dw_patarchiver.object.date_fin.text = em_fin.text
dw_patarchiver.retrieve(v_no_ortho,debut,fin,ll_typearchive)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_patarchiver
integer x = 9
integer y = 1912
integer width = 530
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_patarchiver)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

