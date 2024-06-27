$PBExportHeader$w_patactifsansrdvrap.srw
forward
global type w_patactifsansrdvrap from w_child
end type
type cb_retrieve from commandbutton within w_patactifsansrdvrap
end type
type st_2 from statictext within w_patactifsansrdvrap
end type
type em_mois from editmask within w_patactifsansrdvrap
end type
type st_1 from statictext within w_patactifsansrdvrap
end type
type st_status from statictext within w_patactifsansrdvrap
end type
type st_act from statictext within w_patactifsansrdvrap
end type
type st_phase from statictext within w_patactifsansrdvrap
end type
type dw_phase from u_dw within w_patactifsansrdvrap
end type
type dw_activites from u_dw within w_patactifsansrdvrap
end type
type cb_print from commandbutton within w_patactifsansrdvrap
end type
type dw_patstatus from u_dw within w_patactifsansrdvrap
end type
type cb_close from commandbutton within w_patactifsansrdvrap
end type
type dw_patactifsansrdvrap from u_dw within w_patactifsansrdvrap
end type
end forward

global type w_patactifsansrdvrap from w_child
integer x = 5
integer y = 4
integer width = 3648
integer height = 2052
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
cb_retrieve cb_retrieve
st_2 st_2
em_mois em_mois
st_1 st_1
st_status st_status
st_act st_act
st_phase st_phase
dw_phase dw_phase
dw_activites dw_activites
cb_print cb_print
dw_patstatus dw_patstatus
cb_close cb_close
dw_patactifsansrdvrap dw_patactifsansrdvrap
end type
global w_patactifsansrdvrap w_patactifsansrdvrap

type variables
private long il_phase
private long il_patstat
private long il_idactivite
end variables

on w_patactifsansrdvrap.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.st_2=create st_2
this.em_mois=create em_mois
this.st_1=create st_1
this.st_status=create st_status
this.st_act=create st_act
this.st_phase=create st_phase
this.dw_phase=create dw_phase
this.dw_activites=create dw_activites
this.cb_print=create cb_print
this.dw_patstatus=create dw_patstatus
this.cb_close=create cb_close
this.dw_patactifsansrdvrap=create dw_patactifsansrdvrap
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_mois
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_status
this.Control[iCurrent+6]=this.st_act
this.Control[iCurrent+7]=this.st_phase
this.Control[iCurrent+8]=this.dw_phase
this.Control[iCurrent+9]=this.dw_activites
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.dw_patstatus
this.Control[iCurrent+12]=this.cb_close
this.Control[iCurrent+13]=this.dw_patactifsansrdvrap
end on

on w_patactifsansrdvrap.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.st_2)
destroy(this.em_mois)
destroy(this.st_1)
destroy(this.st_status)
destroy(this.st_act)
destroy(this.st_phase)
destroy(this.dw_phase)
destroy(this.dw_activites)
destroy(this.cb_print)
destroy(this.dw_patstatus)
destroy(this.cb_close)
destroy(this.dw_patactifsansrdvrap)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

setnull(il_phase)
setnull(il_patstat)
setnull(il_idactivite)

dw_patstatus.SetTransObject(SQLCA)
dw_activites.setTransObject(SQLCA)
dw_phase.setTransObject(SQLCA)

dw_patstatus.event ue_retrieve()
dw_activites.event ue_retrieve()
dw_phase.event ue_retrieve()
end event

type cb_retrieve from commandbutton within w_patactifsansrdvrap
integer x = 677
integer y = 1920
integer width = 672
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;dw_patactifsansrdvrap.event ue_retrieve()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type st_2 from statictext within w_patactifsansrdvrap
integer x = 2747
integer y = 1944
integer width = 229
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "mois"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Month'
end if
end event

type em_mois from editmask within w_patactifsansrdvrap
integer x = 2414
integer y = 1932
integer width = 306
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "0~~999"
end type

type st_1 from statictext within w_patactifsansrdvrap
integer x = 1394
integer y = 1944
integer width = 1006
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sans rendez-vous depuis "
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'No appointment in the last'
end if
end event

type st_status from statictext within w_patactifsansrdvrap
integer y = 60
integer width = 480
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Statuts"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Status'
end if
end event

type st_act from statictext within w_patactifsansrdvrap
integer y = 680
integer width = 480
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activité"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Activity'
end if
end event

type st_phase from statictext within w_patactifsansrdvrap
integer y = 1312
integer width = 480
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Phase"
boolean focusrectangle = false
end type

type dw_phase from u_dw within w_patactifsansrdvrap
event type string ue_getfilter ( )
event ue_retrieve ( )
integer y = 1384
integer width = 480
integer height = 528
integer taborder = 70
string title = "Phase"
string dataobject = "dddw_phase"
end type

event type string ue_getfilter();long row,ll_idphase
string ls_Filter
row = getrow()
if row > 0 then
	ll_idphase = getitemnumber(row,'id_phase')
	if getitemstring(row,'phase') <> 'Tous' and getitemstring(row,'phase') <> 'All' then
		ls_Filter = "idphase = " + string(ll_idphase)
	else
		ls_Filter = ""
	end if
else
	ls_Filter = ""
end if
return ls_Filter
end event

event ue_retrieve();long ll_newrow

SetFilter("ortho_id = " + string(v_no_ortho))
Retrieve()

ll_newrow = insertrow(1)
if v_langue = 'an' then
	setitem(ll_newrow,'phase','All')
else
	setitem(ll_newrow,'phase','Tous')
end if

event rowfocuschanged(1)




end event

event constructor;SetRowFocusIndicator(FocusRect!)
end event

event rowfocuschanged;long ll_phase
string ls_phase

if currentrow > 0 then
	ls_phase = getItemString(currentrow,'phase')
	
	if ls_phase = 'All' or ls_phase = 'Tous' then
		setnull(ll_phase)
		setnull(il_phase)
	else
		ll_phase = getItemNumber(currentrow,'id_phase')
		il_phase = ll_phase
	end if
end if
end event

type dw_activites from u_dw within w_patactifsansrdvrap
event type string ue_getfilter ( )
event ue_retrieve ( )
integer y = 756
integer width = 480
integer height = 528
integer taborder = 20
string title = "activites"
string dataobject = "dddw_activites"
end type

event type string ue_getfilter();long row,ll_idactivite
string ls_Filter
row = getrow()
if row > 0 then
	ll_idactivite = getitemnumber(row,'id_activite')
	if getitemstring(row,'activites') <> 'Tous' and getitemstring(row,'activites') <> 'All' then
		ls_Filter = "id_activite = " + string(ll_idactivite)
	else
		ls_Filter = ""
	end if
else
	ls_Filter = ""
end if
return ls_Filter
end event

event ue_retrieve();long ll_newrow

SetFilter("ortho_id = " + string(v_no_ortho))
Retrieve()

ll_newrow = insertrow(1)
if v_langue = 'an' then
	setitem(ll_newrow,'activites','All')
else
	setitem(ll_newrow,'activites','Tous')
end if

event rowfocuschanged(1)

end event

event constructor;SetRowFocusIndicator(FocusRect!)
end event

event rowfocuschanged;string ls_idactivite
long ll_idactivite

if currentrow > 0 then
	ls_idactivite = getItemString(currentrow,"activites")
	
	if ls_idactivite = 'All' or ls_idactivite = 'Tous' then
		setnull(ll_idactivite)
		setnull(il_idactivite)
	else
		ll_idactivite = getItemNumber(currentrow,"id_activite")
		il_idactivite = ll_idactivite
	end if
end if
end event

type cb_print from commandbutton within w_patactifsansrdvrap
integer y = 1920
integer width = 672
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
openwithparm(w_print_options,dw_patactifsansrdvrap)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_patstatus from u_dw within w_patactifsansrdvrap
event type string ue_getfilter ( )
event ue_retrieve ( )
integer y = 132
integer width = 480
integer height = 528
integer taborder = 10
string title = "patstatus"
string dataobject = "dddw_patstatus"
end type

event type string ue_getfilter();long row,ll_idpatstatus
string ls_filter
row = getrow()
if row > 0 then
	ll_idpatstatus = getitemnumber(row,'id_patstatus')
	if getitemstring(row,'nom') <> 'Tous' and getitemstring(row,'nom') <> 'All' then
		ls_filter = "id_patstatus = " + string(ll_idpatstatus)
	else
		ls_filter = ""
	end if
else
	ls_filter = ""
end if
return ls_filter
end event

event ue_retrieve();long ll_newrow

SetFilter("ortho_id = " + string(v_no_ortho))
Retrieve()

ll_newrow = insertrow(1)
if v_langue = 'an' then
	setitem(ll_newrow,'nom','All')
else
	setitem(ll_newrow,'nom','Tous')
end if
event rowfocuschanged(1)

end event

event rowfocuschanged;long ll_idpatstatus
string ls_idpatstatus

if currentrow > 0 then
	ls_idpatstatus = getItemString(currentrow,'nom')
	if ls_idpatstatus = 'All' or ls_idpatstatus = 'Tous' then
		setnull(ll_idpatstatus)
		setnull(il_patstat)
	else
		ll_idpatstatus = getItemNumber(currentrow,'id_patstatus')
		il_patstat = ll_idpatstatus
	end if
end if

end event

event constructor;call super::constructor;SetRowFocusIndicator(FocusRect!)
end event

type cb_close from commandbutton within w_patactifsansrdvrap
integer x = 3008
integer y = 1924
integer width = 617
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

type dw_patactifsansrdvrap from u_dw within w_patactifsansrdvrap
event ue_retrieve ( )
integer x = 498
integer width = 3127
integer height = 1912
integer taborder = 50
string title = "patactifsansrdvrap"
string dataobject = "d_patactifsansrdvrap"
boolean hscrollbar = true
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();integer li_month

li_month = integer(em_mois.text)
retrieve(v_no_ortho,il_phase,il_patstat,il_idactivite,li_month)
end event

event buttonclicked;choose case dwo.name
	case 'b_patnom'
		this.setsort("patient_nom A, patient_prenom A")
		this.sort()
	case 'b_etat'
		this.setsort("patstat A")
		this.sort()
	case 'b_activite'
		this.setsort("activit A")
		this.sort()
	case 'b_phase'
		this.setSort("phase A")
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

event doubleclicked;if dwo.name = 'compute_1' then
	Opensheetwithparm(w_dossier_patients,getitemnumber(row,'idpat'),w_principal,2,layered!)
end if

end event

event constructor;call super::constructor;SetTransObject(Sqlca)
if v_langue = 'an' then
	this.object.t_title.text = 'No appointment list'
	this.object.t_patnom.text = 'Patient name'
	this.object.b_patnom.text = 'Patient name'
	this.object.t_etat.text = 'File Status'
	this.object.b_etat.text = 'File Status'
	this.object.t_activite.text = 'Activity'
	this.object.b_activite.text = 'Activity'
	this.object.t_qty.text = 'Qty:'
	this.object.t_printedon.text = 'Printed on'
end if
end event

