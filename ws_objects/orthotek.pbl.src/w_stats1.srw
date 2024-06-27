$PBExportHeader$w_stats1.srw
forward
global type w_stats1 from w_child
end type
type cb_search from commandbutton within w_stats1
end type
type uo_calutil2 from u_calutil within w_stats1
end type
type uo_calutil1 from u_calutil within w_stats1
end type
type st_start from statictext within w_stats1
end type
type em_debut from editmask within w_stats1
end type
type st_end from statictext within w_stats1
end type
type em_fin from editmask within w_stats1
end type
type cb_print from commandbutton within w_stats1
end type
type dw_stats1 from u_dw within w_stats1
end type
type cb_close from commandbutton within w_stats1
end type
end forward

global type w_stats1 from w_child
integer x = 214
integer y = 221
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
boolean ib_isupdateable = false
event ue_post_open ( )
cb_search cb_search
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
st_start st_start
em_debut em_debut
st_end st_end
em_fin em_fin
cb_print cb_print
dw_stats1 dw_stats1
cb_close cb_close
end type
global w_stats1 w_stats1

type variables
public boolean change = false
end variables

on w_stats1.create
int iCurrent
call super::create
this.cb_search=create cb_search
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.st_start=create st_start
this.em_debut=create em_debut
this.st_end=create st_end
this.em_fin=create em_fin
this.cb_print=create cb_print
this.dw_stats1=create dw_stats1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_search
this.Control[iCurrent+2]=this.uo_calutil2
this.Control[iCurrent+3]=this.uo_calutil1
this.Control[iCurrent+4]=this.st_start
this.Control[iCurrent+5]=this.em_debut
this.Control[iCurrent+6]=this.st_end
this.Control[iCurrent+7]=this.em_fin
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.dw_stats1
this.Control[iCurrent+10]=this.cb_close
end on

on w_stats1.destroy
call super::destroy
destroy(this.cb_search)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.st_start)
destroy(this.em_debut)
destroy(this.st_end)
destroy(this.em_fin)
destroy(this.cb_print)
destroy(this.dw_stats1)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

postevent('ue_post_open')
end event

type cb_search from commandbutton within w_stats1
integer x = 773
integer y = 1928
integer width = 773
integer height = 108
integer taborder = 3
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

event clicked;dw_stats1.event ue_retrieve()
end event

type uo_calutil2 from u_calutil within w_stats1
boolean visible = false
integer x = 2341
integer y = 1368
integer taborder = 70
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_stats1
boolean visible = false
integer x = 1618
integer y = 1368
integer taborder = 40
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type st_start from statictext within w_stats1
integer x = 1637
integer y = 1944
integer width = 187
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
	this.text = 'From:'
end if
end event

type em_debut from editmask within w_stats1
integer x = 1833
integer y = 1932
integer width = 389
integer height = 100
integer taborder = 1
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

type st_end from statictext within w_stats1
integer x = 2222
integer y = 1944
integer width = 110
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
string text = "au:"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'to:'
end if
end event

type em_fin from editmask within w_stats1
integer x = 2341
integer y = 1932
integer width = 389
integer height = 100
integer taborder = 2
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

type cb_print from commandbutton within w_stats1
integer y = 1928
integer width = 773
integer height = 108
integer taborder = 4
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_stats1)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event

type dw_stats1 from u_dw within w_stats1
event ue_retrieve ( )
integer x = 5
integer width = 3611
integer height = 1924
integer taborder = 10
string title = "salutation"
string dataobject = "d_stats1"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();date ldt1,ldt2

ldt1 = date(em_debut.text)
ldt2 = date(em_fin.text)

this.object.t_start.Text = em_debut.text
this.object.t_end.Text = em_fin.text

this.retrieve(v_no_ortho,ldt1,ldt2)
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
//do not display the eror message
RETURN 1

end event

event constructor;settransobject(SQLCA)

if v_langue = 'an' then
	this.object.t_du.Text = "From"
	this.object.t_au.Text = "to"
	this.object.t_title.Text = "Monthy Report"
	this.object.t_pat.Text = "Patient"
	this.object.t_statut.Text = "Status"
	this.object.t_etat.Text = "Status"
	this.object.t_phase.Text = "Phase"
	this.object.t_cons.Text = "# Consultation:"
	this.object.t_rap.Text = "# Recall:"
	this.object.t_totcons.Text = "Total Consultation:"
	this.object.t_totrap.Text = "Total Recall:"
	this.object.t_cancel.Text = "# Cancel:"
	this.object.t_manque.Text = "# Miss:"
	this.object.t_retard.Text = "# Late:"
	this.object.t_totcancel.Text = "Total Cancel app.:"
	this.object.t_totmanque.Text = "Total Miss app.:"
	this.object.t_totcaba.Text = "Total CABA:"
	this.object.t_totretard.Text = "Total Late:"
	
	this.object.c_month.expression = "case( month when 1 then 'January' when 2 then 'Febuary' when 3 then 'March' when 4 then 'April' &
	when 5 then 'May' when 6 then 'June' when 7 then 'July' when 8 then 'August' when 9 then 'September' when 10 then 'October' when 11 then 'November' when 12 then 'December' )"
	this.object.compute_month.expression = "if (  typetrait = 1 , 'Consultation' , 'Recall' )"
	this.object.t_rdv_rdvetat.values = 'Cancel Appointment~tc/Missed-Broken Appointment~tm/Late Appointment~tr/CABA~tb/Earlier~te/On time~to/Late Appointment~tl'
else
	this.object.t_rdv_rdvetat.values = 'Annulé~tc/Manqué~tm/Retard~tr/CABA~tb/Retard~tl/En avance~te/À temps~to'
	this.object.c_month.expression = "case( month when 1 then 'Janvier' when 2 then 'Février' when 3 then 'Mars' when 4 then 'Avril' &
	when 5 then 'Mai' when 6 then 'Juin' when 7 then 'Juillet' when 8 then 'Août' when 9 then 'Septembre' when 10 then 'Octobre' when 11 then 'Novembre' when 12 then 'Décembre' )"
	this.object.compute_month.expression = "if (  typetrait = 1 , 'Consultation' , 'Rappel' )"
end if

end event

event clicked;if dwo.name = 'c_pat' then
	Opensheetwithparm(w_dossier_patients,getitemnumber(row,'idpat'),w_principal,2,layered!)
end if
end event

type cb_close from commandbutton within w_stats1
integer x = 2875
integer y = 1928
integer width = 745
integer height = 108
integer taborder = 5
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close (parent)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Close"
end if
end event

