$PBExportHeader$w_liste_anniversaires.srw
forward
global type w_liste_anniversaires from w_child
end type
type st_4 from statictext within w_liste_anniversaires
end type
type st_3 from statictext within w_liste_anniversaires
end type
type dw_patstatus from u_dw within w_liste_anniversaires
end type
type pb_right from picturebutton within w_liste_anniversaires
end type
type pb_left from picturebutton within w_liste_anniversaires
end type
type pb_aleft from picturebutton within w_liste_anniversaires
end type
type dw_activites from u_dw within w_liste_anniversaires
end type
type pb_aright from picturebutton within w_liste_anniversaires
end type
type cb_2 from commandbutton within w_liste_anniversaires
end type
type cb_selectall from commandbutton within w_liste_anniversaires
end type
type st_2 from statictext within w_liste_anniversaires
end type
type em_fin from editmask within w_liste_anniversaires
end type
type em_debut from editmask within w_liste_anniversaires
end type
type st_1 from statictext within w_liste_anniversaires
end type
type cb_close from commandbutton within w_liste_anniversaires
end type
type cb_find from commandbutton within w_liste_anniversaires
end type
type cb_print from commandbutton within w_liste_anniversaires
end type
type dw_anniversaires from u_dw within w_liste_anniversaires
end type
end forward

global type w_liste_anniversaires from w_child
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
st_4 st_4
st_3 st_3
dw_patstatus dw_patstatus
pb_right pb_right
pb_left pb_left
pb_aleft pb_aleft
dw_activites dw_activites
pb_aright pb_aright
cb_2 cb_2
cb_selectall cb_selectall
st_2 st_2
em_fin em_fin
em_debut em_debut
st_1 st_1
cb_close cb_close
cb_find cb_find
cb_print cb_print
dw_anniversaires dw_anniversaires
end type
global w_liste_anniversaires w_liste_anniversaires

on w_liste_anniversaires.create
int iCurrent
call super::create
this.st_4=create st_4
this.st_3=create st_3
this.dw_patstatus=create dw_patstatus
this.pb_right=create pb_right
this.pb_left=create pb_left
this.pb_aleft=create pb_aleft
this.dw_activites=create dw_activites
this.pb_aright=create pb_aright
this.cb_2=create cb_2
this.cb_selectall=create cb_selectall
this.st_2=create st_2
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_find=create cb_find
this.cb_print=create cb_print
this.dw_anniversaires=create dw_anniversaires
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.dw_patstatus
this.Control[iCurrent+4]=this.pb_right
this.Control[iCurrent+5]=this.pb_left
this.Control[iCurrent+6]=this.pb_aleft
this.Control[iCurrent+7]=this.dw_activites
this.Control[iCurrent+8]=this.pb_aright
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_selectall
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.em_fin
this.Control[iCurrent+13]=this.em_debut
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.cb_close
this.Control[iCurrent+16]=this.cb_find
this.Control[iCurrent+17]=this.cb_print
this.Control[iCurrent+18]=this.dw_anniversaires
end on

on w_liste_anniversaires.destroy
call super::destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_patstatus)
destroy(this.pb_right)
destroy(this.pb_left)
destroy(this.pb_aleft)
destroy(this.dw_activites)
destroy(this.pb_aright)
destroy(this.cb_2)
destroy(this.cb_selectall)
destroy(this.st_2)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.dw_anniversaires)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type st_4 from statictext within w_liste_anniversaires
integer x = 1806
integer y = 1832
integer width = 663
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrer par activités:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Filter by activities:'
end if
end event

type st_3 from statictext within w_liste_anniversaires
integer y = 1832
integer width = 635
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrer par état dossier:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Filter by file status:'
end if
end event

type dw_patstatus from u_dw within w_liste_anniversaires
event type string ue_getfilter ( )
integer x = 823
integer y = 1816
integer width = 773
integer height = 104
integer taborder = 40
string title = "patstatus"
string dataobject = "dddw_patstatus"
end type

event type string ue_getfilter();long row,ll_idpatstatus, ll_debut, ll_fin
string ls_filter,debut_mois, debut_jour, fin_mois, fin_jour
date ldt_naisstart,ldt_naisend

debut_mois = right(em_debut.text,2)
debut_jour = left(em_debut.text,2)
fin_mois = right(em_fin.text,2)
fin_jour = left(em_fin.text,2)
ldt_naisstart = date(debut_jour + '-' + debut_mois + '-2000')
ldt_naisend = date(fin_jour + '-' + fin_mois + '-2000')
ll_debut = daysafter(date('01-01-2000'),ldt_naisstart)
ll_fin = daysafter(date('01-01-2000'),ldt_naisend)
row = getrow()
if row > 0 then
	ll_idpatstatus = getitemnumber(row,'id_patstatus')
	if getitemstring(row,'nom') <> 'Tous' and getitemstring(row,'nom') <> 'All' then
//		ls_filter = "patient_date_naissance >= "+ string(ldt_naisstart) + &
//						" and patient_date_naissance <= "+ string(ldt_naisend) + &
//						" and patient_id_patstatus = " + string(ll_idpatstatus)
		ls_filter = "compute_jul between " + string(ll_debut) + " and " + string(ll_fin) + " and patient_id_patstatus = " + string(ll_idpatstatus)
	else
	//	ls_filter = "patient_date_naissance between "+ ldt_naisstart + &
	//					" and "+ ldt_naisend
	
		ls_filter = "compute_jul between " + string(ll_debut) + " and " + string(ll_fin)
	end if
else
	ls_filter = ""
end if
return ls_filter
end event

event constructor;long ll_newrow
string ls_mois, ls_jour, ls_date

ls_mois = string(month(today()),"00")
ls_jour = string(day(today()),"00")
ls_date = ls_jour + ls_mois
em_debut.text = ls_date
em_fin.text = ls_date

SetTransObject(SQLCA)
SetFilter("ortho_id = " + string(v_no_ortho))
Retrieve()
ll_newrow = insertrow(0)
if v_langue = 'an' then
	setitem(ll_newrow,'nom','All')
else
	setitem(ll_newrow,'nom','Tous')
end if
scrolltorow(ll_newrow)
end event

event rowfocuschanged;string ls_filter,ls_afilter,ls_sfilter

ls_afilter = dw_activites.event ue_getfilter()
ls_sfilter = dw_patstatus.event ue_getfilter()
if ls_afilter <> '' and ls_sfilter <> '' then
	ls_filter = ls_afilter + ' and ' + ls_sfilter
elseif ls_afilter <> '' and ls_sfilter = '' then
	ls_filter = ls_afilter
elseif ls_afilter = '' and ls_sfilter <> '' then
	ls_filter = ls_sfilter
else
	ls_filter = ''
end if
//messagebox('filter',ls_filter)
dw_anniversaires.SetFilter(ls_filter)
dw_anniversaires.Filter()

end event

type pb_right from picturebutton within w_liste_anniversaires
integer x = 1595
integer y = 1812
integer width = 178
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\Indicatr.bmp"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_patstatus.scrollnextrow()
end event

type pb_left from picturebutton within w_liste_anniversaires
integer x = 645
integer y = 1812
integer width = 178
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\Indicat2.bmp"
alignment htextalign = left!
end type

event clicked;dw_patstatus.scrollpriorrow()
end event

type pb_aleft from picturebutton within w_liste_anniversaires
integer x = 2487
integer y = 1812
integer width = 178
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\Indicat2.bmp"
alignment htextalign = left!
end type

event clicked;dw_activites.scrollpriorrow()
end event

type dw_activites from u_dw within w_liste_anniversaires
event type string ue_getfilter ( )
integer x = 2665
integer y = 1816
integer width = 773
integer height = 104
integer taborder = 30
string title = "activites"
string dataobject = "dddw_activites"
end type

event type string ue_getfilter();long row,ll_idactivite
string ls_Filter,debut_mois, debut_jour, fin_mois, fin_jour

//debut_mois = right(em_debut.text,2)
//debut_jour = left(em_debut.text,2)
//fin_mois = right(em_fin.text,2)
//fin_jour = left(em_fin.text,2)

row = getrow()
if row > 0 then
	ll_idactivite = getitemnumber(row,'id_activite')
	if getitemstring(row,'activites') <> 'Tous' and getitemstring(row,'activites') <> 'All' then
		ls_Filter = "patient_id_activite = " + string(ll_idactivite)
	else
		ls_Filter = ""
	end if
else
	ls_Filter = ""
end if
return ls_Filter
end event

event constructor;long ll_newrow
string ls_mois, ls_jour, ls_date

ls_mois = string(month(today()),"00")
ls_jour = string(day(today()),"00")
ls_date = ls_jour + ls_mois
em_debut.text = ls_date
em_fin.text = ls_date

SetTransObject(SQLCA)
SetFilter("ortho_id = " + string(v_no_ortho))
Retrieve()
ll_newrow = insertrow(0)
if v_langue = 'an' then
	setitem(ll_newrow,'activites','All')
else
	setitem(ll_newrow,'activites','Tous')
end if
scrolltorow(ll_newrow)
end event

event rowfocuschanged;string ls_filter,ls_afilter,ls_sfilter

ls_afilter = dw_activites.event ue_getfilter()
ls_sfilter = dw_patstatus.event ue_getfilter()
if ls_afilter <> '' and ls_sfilter <> '' then
	ls_filter = ls_afilter + ' and ' + ls_sfilter
elseif ls_afilter <> '' and ls_sfilter = '' then
	ls_filter = ls_afilter
elseif ls_afilter = '' and ls_sfilter <> '' then
	ls_filter = ls_sfilter
else
	ls_filter = ''
end if
//messagebox('filter',ls_filter)
dw_anniversaires.SetFilter(ls_filter)
dw_anniversaires.Filter()
end event

type pb_aright from picturebutton within w_liste_anniversaires
integer x = 3438
integer y = 1812
integer width = 178
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\Indicatr.bmp"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_activites.scrollnextrow()
end event

type cb_2 from commandbutton within w_liste_anniversaires
integer x = 448
integer y = 1928
integer width = 466
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Étiquette"
end type

event clicked;integer i
long ll_patid
datastore ds_etiquette
printsetup()
ds_etiquette = create datastore
ds_etiquette.dataobject = "d_etiquette_patient"
ds_etiquette.SetTransObject(SQLCA)
for i = 1 to dw_anniversaires.rowcount()
	if dw_anniversaires.IsSelected(i) then
		ll_patid = dw_anniversaires.getItemNumber(i,"patient_patient_id")
		ds_etiquette.retrieve(ll_patid)
		ds_etiquette.print()
	end if
next
destroy ds_etiquette

end event

event constructor;if v_langue = 'an' then
	this.text = "Label"
end if
end event

type cb_selectall from commandbutton within w_liste_anniversaires
integer x = 914
integer y = 1928
integer width = 576
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sélectionner tout"
end type

event clicked;long i,nbrow

nbrow = dw_anniversaires.rowcount()
for i = 1 to nbrow
	dw_anniversaires.SelectRow(i,true)
next
end event

event constructor;if v_langue = 'an' then
	this.text = "Select all"
end if
end event

type st_2 from statictext within w_liste_anniversaires
integer x = 2610
integer y = 1944
integer width = 114
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "au"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "to"
end if
end event

type em_fin from editmask within w_liste_anniversaires
integer x = 2729
integer y = 1932
integer width = 247
integer height = 100
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
string mask = "##/##"
end type

type em_debut from editmask within w_liste_anniversaires
integer x = 2363
integer y = 1932
integer width = 242
integer height = 100
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
string mask = "##/##"
end type

type st_1 from statictext within w_liste_anniversaires
integer x = 2002
integer y = 1944
integer width = 352
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Du ( jj/mm )"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "From (d/m)"
end if
end event

type cb_close from commandbutton within w_liste_anniversaires
integer x = 3008
integer y = 1928
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
	cb_close.Text = "Close"
end if
end event

type cb_find from commandbutton within w_liste_anniversaires
integer x = 1490
integer y = 1928
integer width = 485
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

event clicked;string ls_filter,ls_afilter,ls_sfilter

ls_afilter = dw_activites.event ue_getfilter()
ls_sfilter = dw_patstatus.event ue_getfilter()
if ls_afilter <> '' and ls_sfilter <> '' then
	ls_filter = ls_afilter + ' and ' + ls_sfilter
elseif ls_afilter <> '' and ls_sfilter = '' then
	ls_filter = ls_afilter
elseif ls_afilter = '' and ls_sfilter <> '' then
	ls_filter = ls_sfilter
else
	ls_filter = ''
end if

//messagebox('filter',ls_filter)
dw_anniversaires.SetFilter(ls_filter)
dw_anniversaires.Filter()
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_liste_anniversaires
integer x = 5
integer y = 1928
integer width = 443
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;dw_anniversaires.Modify("DataWindow.Print.Margin.Top=500")
dw_anniversaires.Modify("DataWindow.Print.Margin.left=500")
gb_datawindow = true
openwithparm(w_print_options,dw_anniversaires)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type dw_anniversaires from u_dw within w_liste_anniversaires
integer x = 18
integer width = 3570
integer height = 1808
integer taborder = 10
string dataobject = "d_anniversaires"
boolean hscrollbar = true
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;string ls_mois, ls_jour, ls_date

ls_mois = string(month(today()),"00")
ls_jour = string(day(today()),"00")
ls_date = ls_jour + ls_mois
em_debut.text = ls_date
em_fin.text = ls_date
SetTransObject(SQLCA)
dw_anniversaires.setfilter("month(patient_date_naissance) = "+ ls_mois + &
" and day(patient_date_naissance) = "+ ls_jour)
dw_anniversaires.retrieve(v_no_ortho)
if v_langue = 'an' then
	this.object.t_1.text = 'File #'
	this.object.t_2.text = 'Birthday list for'
	this.object.patient_date_naissance_t.text = 'Birth date'
	this.object.patient_patient_prenom_t.text = 'Patient name'
	this.object.b_patnom.text = 'Patient name'
	this.object.b_nodoss.text = 'File #'
	this.object.b_nais.text = 'Birth date'
	this.object.t_rdv.text = 'Next App.'
	this.object.b_rdv.text = 'Next App.'
	this.object.t_printedon.text = 'Printed on '
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

event clicked;ScrollToRow(GetClickedRow())
Choose case dwo.name
	case 'b_patnom'
		SetSort('patient_patient_nom A')
		Sort()
	case 'b_nodoss'
		SetSort('patient_new_dossier A')
		Sort()
	case 'b_nais'
		SetSort('patient_date_naissance A')
		Sort()
	case 'b_prrdv'
		SetSort('nextrdv A')
		Sort()		
end choose
if row > 0 then
	if IsSelected(row) then
		SelectRow(row,false)
	else
		SelectRow(row,true)
	end if
end if
end event

