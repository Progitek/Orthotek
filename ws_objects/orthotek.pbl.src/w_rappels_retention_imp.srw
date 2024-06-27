$PBExportHeader$w_rappels_retention_imp.srw
forward
global type w_rappels_retention_imp from window
end type
type uo_calutil2 from u_calutil within w_rappels_retention_imp
end type
type uo_calutil1 from u_calutil within w_rappels_retention_imp
end type
type cbx_printonlabel from checkbox within w_rappels_retention_imp
end type
type dw_raptrait from u_dw within w_rappels_retention_imp
end type
type st_au from statictext within w_rappels_retention_imp
end type
type st_periode from statictext within w_rappels_retention_imp
end type
type em_fin from editmask within w_rappels_retention_imp
end type
type em_debut from editmask within w_rappels_retention_imp
end type
type cb_print from commandbutton within w_rappels_retention_imp
end type
type cb_close from commandbutton within w_rappels_retention_imp
end type
end forward

global type w_rappels_retention_imp from window
integer x = 498
integer y = 500
integer width = 1755
integer height = 1224
boolean titlebar = true
string title = "Impression des rappels"
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
boolean center = true
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cbx_printonlabel cbx_printonlabel
dw_raptrait dw_raptrait
st_au st_au
st_periode st_periode
em_fin em_fin
em_debut em_debut
cb_print cb_print
cb_close cb_close
end type
global w_rappels_retention_imp w_rappels_retention_imp

on w_rappels_retention_imp.create
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cbx_printonlabel=create cbx_printonlabel
this.dw_raptrait=create dw_raptrait
this.st_au=create st_au
this.st_periode=create st_periode
this.em_fin=create em_fin
this.em_debut=create em_debut
this.cb_print=create cb_print
this.cb_close=create cb_close
this.Control[]={this.uo_calutil2,&
this.uo_calutil1,&
this.cbx_printonlabel,&
this.dw_raptrait,&
this.st_au,&
this.st_periode,&
this.em_fin,&
this.em_debut,&
this.cb_print,&
this.cb_close}
end on

on w_rappels_retention_imp.destroy
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cbx_printonlabel)
destroy(this.dw_raptrait)
destroy(this.st_au)
destroy(this.st_periode)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.cb_print)
destroy(this.cb_close)
end on

event open;if v_langue = 'an' then
	this.title = 'Printing of the recalls'
end if
em_debut.text = string("01-01-1900")
em_fin.text = string("31-12-2999")
end event

type uo_calutil2 from u_calutil within w_rappels_retention_imp
boolean visible = false
integer x = 1088
integer y = 352
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_rappels_retention_imp
boolean visible = false
integer x = 453
integer y = 352
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type cbx_printonlabel from checkbox within w_rappels_retention_imp
integer x = 27
integer y = 816
integer width = 1691
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimer sur des étiquettes"
end type

event constructor;if v_langue = 'an' then
	this.text = 'To print on labels'
end if
end event

type dw_raptrait from u_dw within w_rappels_retention_imp
integer x = 82
integer width = 1586
integer height = 804
integer taborder = 10
string title = "raptrait"
string dataobject = "dddw_horraptrait"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_newrow

SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
Retrieve(v_no_ortho)
ll_newrow = InsertRow(1)
if v_langue = 'an' then
	SetItem(ll_newrow,'nom','All')
else
	SetItem(ll_newrow,'nom','Tous')
end if
SetFocus()
end event

type st_au from statictext within w_rappels_retention_imp
integer x = 1074
integer y = 908
integer width = 151
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "au"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'To'
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type st_periode from statictext within w_rappels_retention_imp
integer x = 23
integer y = 912
integer width = 576
integer height = 64
integer textsize = -10
integer weight = 700
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
	this.text = 'From:'
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type em_fin from editmask within w_rappels_retention_imp
integer x = 1239
integer y = 904
integer width = 453
integer height = 84
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
boolean autoskip = true
end type

type em_debut from editmask within w_rappels_retention_imp
integer x = 603
integer y = 904
integer width = 453
integer height = 84
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

type cb_print from commandbutton within w_rappels_retention_imp
integer x = 14
integer y = 1012
integer width = 622
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
boolean default = true
end type

event clicked;int nb_row,i
long v_patient_id
w_progressbar iw_progressbar

w_liste_des_rappels_retentions.idt_debut = date(em_debut.text)
w_liste_des_rappels_retentions.idt_fin = date(em_fin.text)
w_liste_des_rappels_retentions.il_idraptrait = dw_raptrait.getitemnumber(dw_raptrait.getrow(),'id_raptrait')
w_liste_des_rappels_retentions.is_raptype = dw_raptrait.getitemstring(dw_raptrait.getrow(),'nom')
datastore ds_listerapimp
ds_listerapimp = create datastore
ds_listerapimp.dataobject = "d_listerapimp"
if v_langue = 'an' then
	ds_listerapimp.object.t_title.text = 'RECALL LIST'
	ds_listerapimp.object.t_patientname.text = 'Patient name'
	ds_listerapimp.object.t_nodoss.text = 'File number'
	ds_listerapimp.object.t_age.text = 'Age'
	ds_listerapimp.object.t_datevenu.text = 'Visit date'
	ds_listerapimp.object.t_datedu.text = 'Due date'
	ds_listerapimp.object.t_duree.text = 'Lenght'
	ds_listerapimp.object.t_trait.text = 'Treatment:'
	ds_listerapimp.object.t_telmais.text = 'Phone (home):'
	ds_listerapimp.object.t_telbur.text = 'Phone (office):'
	ds_listerapimp.object.t_telcell.text = 'Cell phone:'
	ds_listerapimp.object.t_telautre.text = 'Other:'
	ds_listerapimp.object.t_fathername.text = 'Father:'
	ds_listerapimp.object.t_mothername.text = 'Mother:'
	ds_listerapimp.object.t_printedon.text = 'Printed on'
end if
ds_listerapimp.SetTransObject(SQLCA)
ds_listerapimp.Retrieve(v_no_ortho,w_liste_des_rappels_retentions.idt_debut,w_liste_des_rappels_retentions.idt_fin)

if cbx_printonlabel.checked then
	datastore ds_etiquette_patient
	ds_etiquette_patient = create datastore
	ds_etiquette_patient.dataobject = "d_etiquette_patient"
	ds_etiquette_patient.SetTransObject(SQLCA)
	
	gb_datawindow = false
	gb_imp = false
	gi_imp = 2
	openwithparm(w_print_options,ds_etiquette_patient)
	ds_etiquette_patient = message.powerObjectParm
	if not isNull(ds_etiquette_patient) then
		open(iw_progressbar)
		SetPointer(HourGlass!)
		iw_progressbar.of_tache("En attente d'impression")
		if w_liste_des_rappels_retentions.is_raptype <> 'Tous' and w_liste_des_rappels_retentions.is_raptype <> 'All' then
			ds_listerapimp.SetFilter("rendezvous_prochain_rv >= date('" + string(w_liste_des_rappels_retentions.idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(w_liste_des_rappels_retentions.idt_fin) + "') and rendezvous_id_raptrait = " + string(w_liste_des_rappels_retentions.il_idraptrait))
		else
			ds_listerapimp.SetFilter("rendezvous_prochain_rv >= date('" + string(w_liste_des_rappels_retentions.idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(w_liste_des_rappels_retentions.idt_fin) + "')")
		end if
		ds_listerapimp.Filter()
		nb_row = ds_listerapimp.rowcount()
		iw_progressbar.of_max(nb_row)
		iw_progressbar.of_position(0)
		for i =1 to nb_row
			v_patient_id = ds_listerapimp.getitemnumber(i,'rendezvous_patient_id')
			ds_etiquette_patient.retrieve(v_patient_id)
			ds_etiquette_patient.print(false)
			iw_progressbar.of_position(i)
		next
		close(iw_progressbar)
	end if
	destroy ds_etiquette_patient
	SetPointer(Arrow!)
else
	if w_liste_des_rappels_retentions.is_raptype <> 'Tous' and w_liste_des_rappels_retentions.is_raptype <> 'All' then
		ds_listerapimp.SetFilter("rendezvous_prochain_rv >= date('" + string(w_liste_des_rappels_retentions.idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(w_liste_des_rappels_retentions.idt_fin) + "') and rendezvous_id_raptrait = " + string(w_liste_des_rappels_retentions.il_idraptrait))
	else
		ds_listerapimp.SetFilter("rendezvous_prochain_rv >= date('" + string(w_liste_des_rappels_retentions.idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(w_liste_des_rappels_retentions.idt_fin) + "')")
	end if
	ds_listerapimp.Filter()
	gb_datawindow = false
	openwithparm(w_print_options,ds_listerapimp)
end if
destroy ds_listerapimp
close(parent)
end event

event constructor;if v_langue = 'an' then
	This.text = 'Print'
end if
end event

type cb_close from commandbutton within w_rappels_retention_imp
integer x = 1079
integer y = 1012
integer width = 640
integer height = 112
integer taborder = 50
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

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	This.text = 'Close'
end if
end event

