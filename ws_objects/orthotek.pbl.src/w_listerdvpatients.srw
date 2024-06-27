$PBExportHeader$w_listerdvpatients.srw
forward
global type w_listerdvpatients from w_child
end type
type ddlb_trait from dropdownlistbox within w_listerdvpatients
end type
type uo_calutil2 from u_calutil within w_listerdvpatients
end type
type uo_calutil1 from u_calutil within w_listerdvpatients
end type
type st_from from statictext within w_listerdvpatients
end type
type st_to from statictext within w_listerdvpatients
end type
type em_debut from editmask within w_listerdvpatients
end type
type em_fin from editmask within w_listerdvpatients
end type
type cb_retrieve from commandbutton within w_listerdvpatients
end type
type cb_print from commandbutton within w_listerdvpatients
end type
type cb_close from commandbutton within w_listerdvpatients
end type
type dw_listerdvpat from u_dw within w_listerdvpatients
end type
end forward

global type w_listerdvpatients from w_child
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
event ue_export ( datawindow f_dwo )
ddlb_trait ddlb_trait
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
st_from st_from
st_to st_to
em_debut em_debut
em_fin em_fin
cb_retrieve cb_retrieve
cb_print cb_print
cb_close cb_close
dw_listerdvpat dw_listerdvpat
end type
global w_listerdvpatients w_listerdvpatients

type variables
private long il_ddlbtraitid[]
end variables

on w_listerdvpatients.create
int iCurrent
call super::create
this.ddlb_trait=create ddlb_trait
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.st_from=create st_from
this.st_to=create st_to
this.em_debut=create em_debut
this.em_fin=create em_fin
this.cb_retrieve=create cb_retrieve
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_listerdvpat=create dw_listerdvpat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_trait
this.Control[iCurrent+2]=this.uo_calutil2
this.Control[iCurrent+3]=this.uo_calutil1
this.Control[iCurrent+4]=this.st_from
this.Control[iCurrent+5]=this.st_to
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.em_fin
this.Control[iCurrent+8]=this.cb_retrieve
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.dw_listerdvpat
end on

on w_listerdvpatients.destroy
call super::destroy
destroy(this.ddlb_trait)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.st_from)
destroy(this.st_to)
destroy(this.em_debut)
destroy(this.em_fin)
destroy(this.cb_retrieve)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_listerdvpat)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type ddlb_trait from dropdownlistbox within w_listerdvpatients
integer x = 2350
integer width = 951
integer height = 1916
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;long i = 1
string ls_traitnom

if v_langue = 'an' then
	ddlb_trait.AddItem ('All')
else
	ddlb_trait.AddItem ('Tous')
end if

DECLARE cur CURSOR FOR

	select type_traitement_id,nom_traitement
	from type_de_traitement
	where ortho_id = :v_no_ortho;

OPEN cur;

FETCH cur INTO :il_ddlbtraitid[i],:ls_traitnom;

DO WHILE SQLCA.SQLCODE = 0
	i++
	ddlb_trait.AddItem (ls_traitnom)
	FETCH cur INTO :il_ddlbtraitid[i],:ls_traitnom;
LOOP

CLOSE cur;

ddlb_trait.SelectItem(1)

end event

event selectionchanged;if index = 1 then 
	dw_listerdvpat.SetFilter('')
else
	dw_listerdvpat.SetFilter("traitnom = '" + ddlb_trait.text(index) + "'")
end if
dw_listerdvpat.Filter()
end event

type uo_calutil2 from u_calutil within w_listerdvpatients
event destroy ( )
boolean visible = false
integer x = 1920
integer y = 1368
integer taborder = 60
boolean border = true
end type

on uo_calutil2.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)

end event

type uo_calutil1 from u_calutil within w_listerdvpatients
event destroy ( )
boolean visible = false
integer x = 1207
integer y = 1368
integer taborder = 50
boolean border = true
end type

on uo_calutil1.destroy
call u_calutil::destroy
end on

event constructor;call super::constructor;istr_calutil.caldate = date(today())
uf_InitCal(istr_calutil.caldate)
PostEvent("ue_aff_horaire")
end event

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)

end event

type st_from from statictext within w_listerdvpatients
integer x = 1531
integer y = 1940
integer width = 187
integer height = 64
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
string text = "Du:"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "From"
end if
end event

type st_to from statictext within w_listerdvpatients
integer x = 2153
integer y = 1940
integer width = 78
integer height = 64
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
string text = "au"
boolean focusrectangle = false
end type

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "to"
end if
end event

type em_debut from editmask within w_listerdvpatients
integer x = 1733
integer y = 1928
integer width = 402
integer height = 96
integer taborder = 90
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
end type

type em_fin from editmask within w_listerdvpatients
integer x = 2245
integer y = 1928
integer width = 402
integer height = 96
integer taborder = 90
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
end type

type cb_retrieve from commandbutton within w_listerdvpatients
integer x = 704
integer y = 1920
integer width = 704
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date ldt_start,ldt_end

ldt_start = date(em_debut.text)
ldt_end = date(em_fin.text)


dw_listerdvpat.retrieve(v_no_ortho,ldt_start,ldt_end)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type cb_print from commandbutton within w_listerdvpatients
integer y = 1920
integer width = 704
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_listerdvpat)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_close from commandbutton within w_listerdvpatients
integer x = 2830
integer y = 1924
integer width = 731
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
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
	this.Text = "Close"
end if
end event

type dw_listerdvpat from u_dw within w_listerdvpatients
integer x = 18
integer width = 3538
integer height = 1912
integer taborder = 50
string title = "listerdvpat"
string dataobject = "d_listerdvpat"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(Sqlca)

if v_langue = 'an' then
	this.object.t_title.text = 'Appointment list'
	this.object.t_patnom.text = 'Patient name'
	this.object.b_patnom.text = 'Patient name'
	this.object.t_trait.text = 'Treatment'
	this.object.b_trait.text = 'Treatment'
	this.object.t_rdv.text = 'Appointment'
	this.object.b_rdv.text = 'Appointment'
	this.object.t_etat.text = 'App. Status'
	this.object.b_etat.text = 'App. Status'
	this.object.t_qty.text = 'Qty:'
	this.object.t_printedon.text = 'Printed on'
	object.rdvetat.values = 'Miss~tm/Cancel~tc/Late~tl/Early~te/On Time~to/On Deck~td'
else
	object.rdvetat.values = 'Manqué~tm/Annulé~tc/Retard~tl/Avance~te/À Temps~to/On Deck~td'
end if
end event

event buttonclicked;choose case dwo.name
	case 'b_patnom'
		this.setsort("patnom A")
		this.sort()
	case 'b_rdv'
		this.setsort("rdvdate A, rdvheure A")
		this.sort()
	case 'b_trait'
		this.setsort("traitnom A")
		this.sort()
	case 'b_etat'
		this.setsort("rdvetat A")
		this.sort()
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

