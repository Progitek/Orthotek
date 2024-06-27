$PBExportHeader$w_statpatfilter.srw
forward
global type w_statpatfilter from window
end type
type ddlb_statuts from dropdownlistbox within w_statpatfilter
end type
type st_5 from statictext within w_statpatfilter
end type
type em_fin_1 from editmask within w_statpatfilter
end type
type em_dep_1 from editmask within w_statpatfilter
end type
type st_pre from statictext within w_statpatfilter
end type
type st_ouv from statictext within w_statpatfilter
end type
type ddlb_phase from dropdownlistbox within w_statpatfilter
end type
type st_1 from statictext within w_statpatfilter
end type
type st_activites from statictext within w_statpatfilter
end type
type ddlb_activites from dropdownlistbox within w_statpatfilter
end type
type st_2 from statictext within w_statpatfilter
end type
type ddlb_pers from dropdownlistbox within w_statpatfilter
end type
type st_satellite from statictext within w_statpatfilter
end type
type ddlb_satellite from dropdownlistbox within w_statpatfilter
end type
type st_etat from statictext within w_statpatfilter
end type
type ddlb_patstatus from dropdownlistbox within w_statpatfilter
end type
type st_end from statictext within w_statpatfilter
end type
type em_fin from editmask within w_statpatfilter
end type
type em_start from editmask within w_statpatfilter
end type
type cb_apply from commandbutton within w_statpatfilter
end type
type cb_cancel from commandbutton within w_statpatfilter
end type
type st_3 from statictext within w_statpatfilter
end type
type st_4 from statictext within w_statpatfilter
end type
type st_start from statictext within w_statpatfilter
end type
end forward

global type w_statpatfilter from window
integer width = 2098
integer height = 1632
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
ddlb_statuts ddlb_statuts
st_5 st_5
em_fin_1 em_fin_1
em_dep_1 em_dep_1
st_pre st_pre
st_ouv st_ouv
ddlb_phase ddlb_phase
st_1 st_1
st_activites st_activites
ddlb_activites ddlb_activites
st_2 st_2
ddlb_pers ddlb_pers
st_satellite st_satellite
ddlb_satellite ddlb_satellite
st_etat st_etat
ddlb_patstatus ddlb_patstatus
st_end st_end
em_fin em_fin
em_start em_start
cb_apply cb_apply
cb_cancel cb_cancel
st_3 st_3
st_4 st_4
st_start st_start
end type
global w_statpatfilter w_statpatfilter

on w_statpatfilter.create
this.ddlb_statuts=create ddlb_statuts
this.st_5=create st_5
this.em_fin_1=create em_fin_1
this.em_dep_1=create em_dep_1
this.st_pre=create st_pre
this.st_ouv=create st_ouv
this.ddlb_phase=create ddlb_phase
this.st_1=create st_1
this.st_activites=create st_activites
this.ddlb_activites=create ddlb_activites
this.st_2=create st_2
this.ddlb_pers=create ddlb_pers
this.st_satellite=create st_satellite
this.ddlb_satellite=create ddlb_satellite
this.st_etat=create st_etat
this.ddlb_patstatus=create ddlb_patstatus
this.st_end=create st_end
this.em_fin=create em_fin
this.em_start=create em_start
this.cb_apply=create cb_apply
this.cb_cancel=create cb_cancel
this.st_3=create st_3
this.st_4=create st_4
this.st_start=create st_start
this.Control[]={this.ddlb_statuts,&
this.st_5,&
this.em_fin_1,&
this.em_dep_1,&
this.st_pre,&
this.st_ouv,&
this.ddlb_phase,&
this.st_1,&
this.st_activites,&
this.ddlb_activites,&
this.st_2,&
this.ddlb_pers,&
this.st_satellite,&
this.ddlb_satellite,&
this.st_etat,&
this.ddlb_patstatus,&
this.st_end,&
this.em_fin,&
this.em_start,&
this.cb_apply,&
this.cb_cancel,&
this.st_3,&
this.st_4,&
this.st_start}
end on

on w_statpatfilter.destroy
destroy(this.ddlb_statuts)
destroy(this.st_5)
destroy(this.em_fin_1)
destroy(this.em_dep_1)
destroy(this.st_pre)
destroy(this.st_ouv)
destroy(this.ddlb_phase)
destroy(this.st_1)
destroy(this.st_activites)
destroy(this.ddlb_activites)
destroy(this.st_2)
destroy(this.ddlb_pers)
destroy(this.st_satellite)
destroy(this.ddlb_satellite)
destroy(this.st_etat)
destroy(this.ddlb_patstatus)
destroy(this.st_end)
destroy(this.em_fin)
destroy(this.em_start)
destroy(this.cb_apply)
destroy(this.cb_cancel)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_start)
end on

type ddlb_statuts from dropdownlistbox within w_statpatfilter
integer x = 901
integer y = 916
integer width = 850
integer height = 400
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;integer i
datastore ds_phase
ds_phase = create datastore
ds_phase.dataobject = "dddw_status"
ds_phase.SetTransObject(SQLCA)
ds_phase.SetFilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
ds_phase.retrieve()
if v_langue = 'an' then
	ddlb_statuts.Additem('All')
else
	ddlb_statuts.Additem('Tous')
end if
for i = 1 to ds_phase.rowcount()
	ddlb_statuts.Additem(ds_phase.getitemstring(i,'code'))
next
destroy ds_phase
Selectitem(1)
end event

type st_5 from statictext within w_statpatfilter
integer x = 27
integer y = 928
integer width = 837
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Statuts"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;OpenSheet(w_typephase,w_principal,2,layered!)
close(parent)
end event

type em_fin_1 from editmask within w_statpatfilter
integer x = 1243
integer y = 1276
integer width = 507
integer height = 92
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
boolean autoskip = true
boolean dropdowncalendar = true
end type

type em_dep_1 from editmask within w_statpatfilter
integer x = 581
integer y = 1276
integer width = 507
integer height = 92
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
boolean autoskip = true
boolean dropdowncalendar = true
end type

type st_pre from statictext within w_statpatfilter
integer y = 1280
integer width = 283
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Premier rdv"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'First app.'
end if
end event

type st_ouv from statictext within w_statpatfilter
integer y = 1140
integer width = 325
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ouverture"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'File open'
end if
end event

type ddlb_phase from dropdownlistbox within w_statpatfilter
integer x = 901
integer y = 756
integer width = 850
integer height = 400
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;integer i
datastore ds_phase
ds_phase = create datastore
ds_phase.dataobject = "dddw_phase"
ds_phase.SetTransObject(SQLCA)
ds_phase.SetFilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
ds_phase.retrieve()
if v_langue = 'an' then
	ddlb_phase.Additem('All')
else
	ddlb_phase.Additem('Tous')
end if
for i = 1 to ds_phase.rowcount()
	ddlb_phase.Additem(ds_phase.getitemstring(i,'phase'))
next
destroy ds_phase
Selectitem(1)
end event

type st_1 from statictext within w_statpatfilter
integer x = 27
integer y = 756
integer width = 837
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Phase"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;OpenSheet(w_typephase,w_principal,2,layered!)
close(parent)
end event

type st_activites from statictext within w_statpatfilter
integer x = 27
integer y = 596
integer width = 837
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
string text = "Activités"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Activity'
end if
end event

event clicked;OpenSheet(w_activites,w_principal,2,layered!)
close(parent)
end event

type ddlb_activites from dropdownlistbox within w_statpatfilter
integer x = 901
integer y = 596
integer width = 850
integer height = 400
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;integer i
datastore ds_activites
ds_activites = create datastore
ds_activites.dataobject = "dddw_activites"
ds_activites.SetTransObject(SQLCA)
ds_activites.SetFilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
ds_activites.retrieve()
if v_langue = 'an' then
	ddlb_activites.Additem('All')
else
	ddlb_activites.Additem('Tous')
end if
for i = 1 to ds_activites.rowcount()
	ddlb_activites.Additem(ds_activites.getitemstring(i,'activites'))
next
destroy ds_activites
Selectitem(1)
end event

type st_2 from statictext within w_statpatfilter
integer x = 27
integer y = 440
integer width = 837
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Attribué à"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Attributed to'
end if
end event

type ddlb_pers from dropdownlistbox within w_statpatfilter
integer x = 901
integer y = 424
integer width = 850
integer height = 400
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;integer i
datastore ds_personnel
ds_personnel = create datastore
ds_personnel.dataobject = "dddw_personnelactif"
ds_personnel.SetTransObject(SQLCA)
ds_personnel.SetFilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
ds_personnel.retrieve()
if v_langue = 'an' then
	ddlb_pers.Additem('All')
else
	ddlb_pers.Additem('Tous')
end if
for i = 1 to ds_personnel.rowcount()
	ddlb_pers.Additem(ds_personnel.getitemstring(i,'prenom'))
next
destroy ds_personnel
Selectitem(1)
end event

type st_satellite from statictext within w_statpatfilter
integer x = 27
integer y = 276
integer width = 837
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
string text = "Satellite"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;OpenSheet(w_satellites,w_principal,2,layered!)
close(parent)
end event

type ddlb_satellite from dropdownlistbox within w_statpatfilter
integer x = 901
integer y = 260
integer width = 850
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;integer i
datastore ds_satellite
ds_satellite = create datastore
ds_satellite.dataobject = "dddw_satellite"
ds_satellite.SetTransObject(SQLCA)
ds_satellite.SetFilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
ds_satellite.retrieve()
if v_langue = 'an' then
	ddlb_satellite.Additem('All')
else
	ddlb_satellite.Additem('Tous')
end if
for i = 1 to ds_satellite.rowcount()
	ddlb_satellite.Additem(ds_satellite.getitemstring(i,'lieu'))
next
destroy ds_satellite
Selectitem(1)
end event

type st_etat from statictext within w_statpatfilter
integer x = 27
integer y = 116
integer width = 837
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
string text = "État dossier"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'File status'
end if
end event

event clicked;opensheet(w_patstatus,w_principal,2,layered!)
close(parent)
end event

type ddlb_patstatus from dropdownlistbox within w_statpatfilter
integer x = 901
integer y = 104
integer width = 850
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;integer i
datastore ds_patstatus
ds_patstatus = create datastore
ds_patstatus.dataobject = "dddw_patstatus"
ds_patstatus.SetTransObject(SQLCA)
ds_patstatus.SetFilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
ds_patstatus.retrieve()
if v_langue = 'an' then
	ddlb_patstatus.Additem('All')
else
	ddlb_patstatus.Additem('Tous')
end if
for i = 1 to ds_patstatus.rowcount()
	ddlb_patstatus.Additem(ds_patstatus.getitemstring(i,'nom'))
next
destroy ds_patstatus
Selectitem(1)
end event

type st_end from statictext within w_statpatfilter
integer x = 1088
integer y = 1140
integer width = 128
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Au"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'to'
end if
end event

type em_fin from editmask within w_statpatfilter
integer x = 1243
integer y = 1124
integer width = 507
integer height = 92
integer taborder = 40
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
boolean dropdowncalendar = true
end type

type em_start from editmask within w_statpatfilter
integer x = 581
integer y = 1124
integer width = 507
integer height = 92
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
boolean dropdowncalendar = true
end type

type cb_apply from commandbutton within w_statpatfilter
integer x = 101
integer y = 1464
integer width = 809
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Appliquer"
boolean default = true
end type

event clicked;long ll_idphase
string ls_start, ls_end, ls_filtre,ls_phase, ls_start_1, ls_end_1
ls_filtre = ''
ls_start = em_start.text
ls_end = em_fin.text
ls_start_1 = em_dep_1.text
ls_end_1 = em_fin_1.text

if isvalid(w_statpat) then
	//date
	if not isnull(ls_start) and ls_start <> '' and not isnull(ls_end) and ls_end <> '' then
		ls_filtre = "patient_opendoss >= date('" + ls_start + "') and patient_opendoss <= date('" + ls_end + "')"
	end if
	
	//date 1er rdv
	if not isnull(ls_start_1) and ls_start_1 <> '' and not isnull(ls_end_1) and ls_end_1 <> '' then
		ls_filtre = "prem_rdv >= date('" + ls_start_1 + "') and prem_rdv <= date('" + ls_end_1 + "')"
	end if	
	
	//type de traitement
	if ddlb_patstatus.text <> 'Tous' and ddlb_patstatus.text <> 'All' then
		if ls_filtre <> '' then
			ls_filtre += " and t_patstatus_nom = '" + ddlb_patstatus.text + "'"
		else
			ls_filtre = "t_patstatus_nom = '" + ddlb_patstatus.text + "'"
		end if
	end if
	//phase
	if ddlb_phase.text <> 'Tous' and ddlb_phase.text <> 'All' then
		ls_phase = ddlb_phase.text
		select id_phase into :ll_idphase from t_phase where phase = :ls_phase and ortho_id = :v_no_ortho;
		if ls_filtre <> '' then
			ls_filtre += " and phase = " + string(ll_idphase)
		else
			ls_filtre = "phase = " + string(ll_idphase)
		end if
	end if
	//satellite
	if ddlb_satellite.text <> 'Tous' and ddlb_satellite.text <> 'All' then
		if ls_filtre <> '' then
			ls_filtre += " and t_satellites_lieu = '" + ddlb_satellite.text + "'"
		else
			ls_filtre = "t_satellites_lieu = '" + ddlb_satellite.text + "'"
		end if
	end if
	//pers
	if ddlb_pers.text <> 'Tous' and ddlb_pers.text <> 'All' then
		if ls_filtre <> '' then
			ls_filtre += " and t_personnels_prenom = '" + ddlb_pers.text + "'"
		else
			ls_filtre = "t_personnels_prenom = '" + ddlb_pers.text + "'"
		end if
	end if
	//activites
	if ddlb_activites.text <> 'Tous' and ddlb_activites.text <> 'All' then
		if ls_filtre <> '' then
			ls_filtre += " and t_activites_activites = '" + ddlb_activites.text + "'"
		else
			ls_filtre = "t_activites_activites = '" + ddlb_activites.text + "'"
		end if
	end if
	// Status
	if ddlb_statuts.text <> 'Tous' and ddlb_statuts.text <> 'All' then
		if ls_filtre <> '' then
			ls_filtre += " and patient_statut = '" + ddlb_statuts.text + "'"
		else
			ls_filtre = "patient_statut = '" + ddlb_statuts.text + "'"
		end if
	end if
	
end if
//Filtrer
//messagebox('FILTRE',ls_filtre)
w_statpat.dw_statpat.SetFilter(ls_filtre)
w_statpat.dw_statpat.Filter()
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Apply'
end if
end event

type cb_cancel from commandbutton within w_statpatfilter
integer x = 1120
integer y = 1464
integer width = 809
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type st_3 from statictext within w_statpatfilter
integer x = 366
integer y = 1280
integer width = 197
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'From:'
end if
end event

type st_4 from statictext within w_statpatfilter
integer x = 1088
integer y = 1280
integer width = 128
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Au"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'to'
end if
end event

type st_start from statictext within w_statpatfilter
integer x = 366
integer y = 1140
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'From:'
end if
end event

