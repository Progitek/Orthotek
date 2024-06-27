$PBExportHeader$w_patsat.srw
forward
global type w_patsat from w_child
end type
type dw_sat from uo_sat within w_patsat
end type
type uo_calutil2 from u_calutil within w_patsat
end type
type uo_calutil1 from u_calutil within w_patsat
end type
type em_fin from editmask within w_patsat
end type
type em_debut from editmask within w_patsat
end type
type st_to from statictext within w_patsat
end type
type st_from from statictext within w_patsat
end type
type cb_find from commandbutton within w_patsat
end type
type cb_print from commandbutton within w_patsat
end type
type cb_close from commandbutton within w_patsat
end type
type dw_patsat from u_dw within w_patsat
end type
end forward

global type w_patsat from w_child
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
dw_sat dw_sat
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
em_fin em_fin
em_debut em_debut
st_to st_to
st_from st_from
cb_find cb_find
cb_print cb_print
cb_close cb_close
dw_patsat dw_patsat
end type
global w_patsat w_patsat

type variables
private long il_trait[]
private long il_indtrait
private long il_idsatellite
end variables

on w_patsat.create
int iCurrent
call super::create
this.dw_sat=create dw_sat
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_to=create st_to
this.st_from=create st_from
this.cb_find=create cb_find
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_patsat=create dw_patsat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sat
this.Control[iCurrent+2]=this.uo_calutil2
this.Control[iCurrent+3]=this.uo_calutil1
this.Control[iCurrent+4]=this.em_fin
this.Control[iCurrent+5]=this.em_debut
this.Control[iCurrent+6]=this.st_to
this.Control[iCurrent+7]=this.st_from
this.Control[iCurrent+8]=this.cb_find
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.dw_patsat
end on

on w_patsat.destroy
call super::destroy
destroy(this.dw_sat)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_to)
destroy(this.st_from)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_patsat)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today())
em_fin.text = string(today())
end event

type dw_sat from uo_sat within w_patsat
integer x = 2235
integer width = 1399
integer height = 88
integer taborder = 60
end type

event clicked;call super::clicked;il_idsatellite = this.il_idsat
dw_patsat.event ue_retrieve()

//if il_idsat = 0 then
//	dw_patsat.setFilter("")
//	dw_patsat.filter()
//	dw_patsat.object.t_sat.text = ""
//else
//	dw_patsat.setFilter("patient_id_satellite = " + string(il_idsat))
//	dw_patsat.filter()
//	dw_patsat.object.t_sat.text = "Satellite: " + getitemstring(getrow(),'lieu')
//end if
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type uo_calutil2 from u_calutil within w_patsat
boolean visible = false
integer x = 2267
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)

end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_patsat
boolean visible = false
integer x = 1554
integer y = 1360
integer taborder = 40
boolean border = true
end type

event constructor;call super::constructor;istr_calutil.caldate = date(today())
uf_InitCal(istr_calutil.caldate)
PostEvent("ue_aff_horaire")
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)

end event

type em_fin from editmask within w_patsat
integer x = 2263
integer y = 1928
integer width = 402
integer height = 96
integer taborder = 50
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

type em_debut from editmask within w_patsat
integer x = 1751
integer y = 1928
integer width = 402
integer height = 96
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

type st_to from statictext within w_patsat
integer x = 2171
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

event constructor;if v_langue = 'an' then
	this.Text = "to"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type st_from from statictext within w_patsat
integer x = 1609
integer y = 1940
integer width = 128
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

event constructor;if v_langue = 'an' then
	this.Text = "From"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type cb_find from commandbutton within w_patsat
integer x = 773
integer y = 1924
integer width = 818
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

event clicked;dw_patsat.event ue_retrieve()
end event

type cb_print from commandbutton within w_patsat
integer x = 9
integer y = 1924
integer width = 763
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;//dw_journal_honoraires.Modify("DataWindow.Print.Margin.Top=250")
//dw_journal_honoraires.Modify("DataWindow.Print.Margin.left=250")
gb_datawindow = true
openwithparm(w_print_options,dw_patsat)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type cb_close from commandbutton within w_patsat
integer x = 2702
integer y = 1924
integer width = 933
integer height = 108
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
	this.Text = "Close"
end if
end event

type dw_patsat from u_dw within w_patsat
event ue_retrieve ( )
integer width = 3634
integer height = 1912
integer taborder = 10
string dataobject = "d_patsat"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();date ldt_debut, ldt_fin
long ll_satid

ldt_debut = gf_emtodate(em_debut.text)
ldt_fin = gf_emtodate(em_fin.text)

if il_idsatellite = 0 then
	setnull(ll_satid)
else
	ll_satid = il_idsatellite
end if

dw_patsat.retrieve(ll_satid,ldt_debut,ldt_fin)
end event

event constructor;//if v_langue = 'an' then
//	dw_patsat.object.t_heure.text = 'Hour'
//	dw_patsat.object.t_trait.text = 'Treatment'
//	dw_patsat.object.t_duree.text = 'Length'
//	dw_patsat.object.t_etat.text = 'State'
//	dw_patsat.object.t_title.text = 'Patient by type of treatment'
//	dw_patsat.object.t_printon.text = 'Printed On'
//end if

dw_patsat.SetTransObject(SQLCA)
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

