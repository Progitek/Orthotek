$PBExportHeader$w_journaldepotcompact.srw
forward
global type w_journaldepotcompact from w_child
end type
type dw_jourdepot from u_dw within w_journaldepotcompact
end type
type em_fin from editmask within w_journaldepotcompact
end type
type em_debut from editmask within w_journaldepotcompact
end type
type st_2 from statictext within w_journaldepotcompact
end type
type st_1 from statictext within w_journaldepotcompact
end type
type cb_3 from commandbutton within w_journaldepotcompact
end type
type cb_find from commandbutton within w_journaldepotcompact
end type
type cb_print from commandbutton within w_journaldepotcompact
end type
end forward

global type w_journaldepotcompact from w_child
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
dw_jourdepot dw_jourdepot
em_fin em_fin
em_debut em_debut
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_find cb_find
cb_print cb_print
end type
global w_journaldepotcompact w_journaldepotcompact

on w_journaldepotcompact.create
int iCurrent
call super::create
this.dw_jourdepot=create dw_jourdepot
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_jourdepot
this.Control[iCurrent+2]=this.em_fin
this.Control[iCurrent+3]=this.em_debut
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cb_find
this.Control[iCurrent+8]=this.cb_print
end on

on w_journaldepotcompact.destroy
call super::destroy
destroy(this.dw_jourdepot)
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

type dw_jourdepot from u_dw within w_journaldepotcompact
integer width = 3584
integer height = 1896
integer taborder = 50
string dataobject = "d_journal_depot"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
//if v_langue = 'an' then
//dw_journal_depot.object.t_1.text = 'Cashing report for:'
//dw_journal_depot.object.t_3.text = 'to'
//dw_journal_depot.object.paiement_date_paiement_t.text = 'Payment date'
//dw_journal_depot.object.t_2.text = 'From'
//
//dw_journal_depot.object.patient_patient_nom_t.text = 'Patient name'
//dw_journal_depot.object.paiement_montant_recu_t.text = 'Amount recieved'
//dw_journal_depot.object.paiement_paiement_t.text = 'Payment'
////dw_journal_encaissements.object.t_2.text = 'From'
//end if
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

type em_fin from editmask within w_journaldepotcompact
integer x = 2651
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
string mask = "[date]"
boolean autoskip = true
end type

event constructor;em_fin.text = string(today())
end event

type em_debut from editmask within w_journaldepotcompact
integer x = 1847
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

type st_2 from statictext within w_journaldepotcompact
integer x = 2263
integer y = 1928
integer width = 361
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
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "Ending date"
end if
end event

type st_1 from statictext within w_journaldepotcompact
integer x = 1289
integer y = 1928
integer width = 530
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
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Starting date"
end if
end event

type cb_3 from commandbutton within w_journaldepotcompact
integer x = 3072
integer y = 1912
integer width = 512
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

type cb_find from commandbutton within w_journaldepotcompact
integer x = 622
integer y = 1912
integer width = 549
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
//dw_journal_depot.object.date_debut.text = string(debut)
//dw_journal_depot.object.date_fin.text = string(fin)
//dw_journal_depot.setfilter("paiement_paiement = '$' or paiement_paiement = 'C' or paiement_paiement = 'Visa' or paiement_paiement = 'MC' or paiement_paiement = 'PD' or paiement_paiement = 'P' or paiement_paiement = 'Amex'" )
dw_jourdepot.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_journaldepotcompact
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

event clicked;//date debut, fin
//
//debut = date(em_debut.text)
//fin = date(em_fin.text)
//if cbx_1.checked = true then
//	printsetup()
//	dw_journal_depot.SetRedraw(false)
//	dw_journal_depot.object.date_debut.text = string(debut)
//	dw_journal_depot.object.date_fin.text = string(fin)
//	dw_journal_depot.setfilter("paiement_paiement = '$' or paiement_paiement = 'C' or paiement_paiement = 'P'" )
//	dw_journal_depot.filter()
//	dw_journal_depot.print()
//	
//	datastore ds_journal_depot1
//	ds_journal_depot1 = create datastore
//	ds_journal_depot1.dataobject = "d_journal_depot_som1"
//	ds_journal_depot1.SetTransObject(SQLCA)
//	ds_journal_depot1.object.date_debut.text = string(debut)
//	ds_journal_depot1.object.date_fin.text = string(fin)
//	ds_journal_depot1.retrieve(v_no_ortho,debut,fin)
//	ds_journal_depot1.print()
//	destroy ds_journal_depot1
//	
//	dw_journal_depot.setfilter("paiement_paiement = 'Visa' or paiement_paiement = 'MC' or paiement_paiement = 'PD' or paiement_paiement = 'Amex'" )
//	dw_journal_depot.filter()
//	if dw_journal_depot.rowcount() > 0 then
//		dw_journal_depot.print()
//	end if
//	dw_journal_depot.setfilter("")
//	dw_journal_depot.retrieve(v_no_ortho,debut,fin)
//	dw_journal_depot.SetRedraw(true)
//else
//	printsetup()
//	dw_journal_depot.Modify("DataWindow.Print.Margin.Top=200")
//	dw_journal_depot.Modify("DataWindow.Print.Margin.left=200")
//	dw_journal_depot.print()
//end if
//
//datastore ds_journal_depot
//ds_journal_depot = create datastore
//ds_journal_depot.dataobject = "d_journal_depot_som"
//ds_journal_depot.SetTransObject(SQLCA)
//ds_journal_depot.object.date_debut.text = string(debut)
//ds_journal_depot.object.date_fin.text = string(fin)
//ds_journal_depot.retrieve(v_no_ortho,debut,fin)
//ds_journal_depot.print()
//destroy ds_journal_depot
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

