$PBExportHeader$w_journaldepotcpd.srw
forward
global type w_journaldepotcpd from w_child
end type
type dw_sat from uo_sat within w_journaldepotcpd
end type
type dw_journaldepotcpd from u_dw within w_journaldepotcpd
end type
type em_fin from editmask within w_journaldepotcpd
end type
type em_debut from editmask within w_journaldepotcpd
end type
type st_2 from statictext within w_journaldepotcpd
end type
type st_1 from statictext within w_journaldepotcpd
end type
type cb_3 from commandbutton within w_journaldepotcpd
end type
type cb_find from commandbutton within w_journaldepotcpd
end type
type cb_print from commandbutton within w_journaldepotcpd
end type
end forward

global type w_journaldepotcpd from w_child
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
dw_sat dw_sat
dw_journaldepotcpd dw_journaldepotcpd
em_fin em_fin
em_debut em_debut
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_find cb_find
cb_print cb_print
end type
global w_journaldepotcpd w_journaldepotcpd

on w_journaldepotcpd.create
int iCurrent
call super::create
this.dw_sat=create dw_sat
this.dw_journaldepotcpd=create dw_journaldepotcpd
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sat
this.Control[iCurrent+2]=this.dw_journaldepotcpd
this.Control[iCurrent+3]=this.em_fin
this.Control[iCurrent+4]=this.em_debut
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_find
this.Control[iCurrent+9]=this.cb_print
end on

on w_journaldepotcpd.destroy
call super::destroy
destroy(this.dw_sat)
destroy(this.dw_journaldepotcpd)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

dw_journaldepotcpd.SetTransObject(SQLCA)
end event

type dw_sat from uo_sat within w_journaldepotcpd
integer x = 2107
integer taborder = 10
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_journaldepotcpd.setFilter("")
	dw_journaldepotcpd.filter()
else
	dw_journaldepotcpd.setFilter("patient_id_satellite = " + string(il_idsat))
	dw_journaldepotcpd.filter()
end if
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type dw_journaldepotcpd from u_dw within w_journaldepotcpd
integer y = 88
integer width = 3584
integer height = 1808
integer taborder = 50
string dataobject = "d_journaldepotcpd"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_bank.text = 'Bank'
	this.object.t_compte.text = 'Current account'
	this.object.t_para.text = 'Search parameter'
	this.object.t_from.text = 'From'
	this.object.t_to.text = 'to'
	this.object.t_nom.text = 'Patient name'
	this.object.t_check.text = 'Check #'
	this.object.t_date.text = 'Date'
	this.object.t_montant.text = 'Amount'
	this.object.t_printedon.text = 'Printed on'
end if
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

type em_fin from editmask within w_journaldepotcpd
integer x = 2441
integer y = 1916
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
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

event constructor;em_fin.text = string(today())
end event

type em_debut from editmask within w_journaldepotcpd
integer x = 1733
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
string mask = "[date]"
boolean autoskip = true
end type

event constructor;em_debut.text = string(today())
end event

type st_2 from statictext within w_journaldepotcpd
integer x = 2158
integer y = 1928
integer width = 256
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Date fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "Ending date"
end if
end event

type st_1 from statictext within w_journaldepotcpd
integer x = 1266
integer y = 1928
integer width = 439
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Date du début:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Starting date"
end if
end event

type cb_3 from commandbutton within w_journaldepotcpd
integer x = 2976
integer y = 1912
integer width = 608
integer height = 108
integer taborder = 60
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
	cb_3.Text = "Close"
end if
end event

type cb_find from commandbutton within w_journaldepotcpd
integer x = 622
integer y = 1912
integer width = 521
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
string ls_comptant

debut = date(em_debut.text)
fin = date(em_fin.text)
//dw_jour_depot.object.dw_journal_depot_comptant.object.date_debut.text = em_debut.text
//dw_jour_depot.object.dw_journal_depot_comptant.object.date_debut.text = em_fin.text
//dw_jour_depot.setsort("patient_patient_nom A, patient_patient_prenom A")
dw_journaldepotcpd.object.date_debut.text = string(debut)
dw_journaldepotcpd.object.date_fin.text = string(fin)
//dw_journaldepotcpd.setfilter("paiement_paiement = '$' or paiement_paiement = 'C' or paiement_paiement = 'Visa' or paiement_paiement = 'MC' or paiement_paiement = 'PD' or paiement_paiement = 'P' or paiement_paiement = 'Amex'" )
dw_journaldepotcpd.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_journaldepotcpd
integer x = 23
integer y = 1912
integer width = 599
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

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)

printsetup()
dw_journaldepotcpd.print()
datastore ds_journaldepotsomcpd
ds_journaldepotsomcpd = create datastore
ds_journaldepotsomcpd.dataobject = "d_journaldepotsomcpd"
ds_journaldepotsomcpd.SetTransObject(SQLCA)
ds_journaldepotsomcpd.object.date_debut.text = string(debut)
ds_journaldepotsomcpd.object.date_fin.text = string(fin)
ds_journaldepotsomcpd.retrieve(v_no_ortho,debut,fin)
ds_journaldepotsomcpd.print()
destroy ds_journaldepotsomcpd
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

