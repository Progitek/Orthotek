$PBExportHeader$w_statpatcons.srw
forward
global type w_statpatcons from w_child
end type
type ddlb_status from u_ddlb within w_statpatcons
end type
type uo_calutil2 from u_calutil within w_statpatcons
end type
type uo_calutil1 from u_calutil within w_statpatcons
end type
type cb_print from commandbutton within w_statpatcons
end type
type em_fin from editmask within w_statpatcons
end type
type st_2 from statictext within w_statpatcons
end type
type em_debut from editmask within w_statpatcons
end type
type st_1 from statictext within w_statpatcons
end type
type cb_find from commandbutton within w_statpatcons
end type
type dw_statpatcons from u_dw within w_statpatcons
end type
type cb_close from commandbutton within w_statpatcons
end type
end forward

global type w_statpatcons from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
boolean ib_isupdateable = false
ddlb_status ddlb_status
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cb_print cb_print
em_fin em_fin
st_2 st_2
em_debut em_debut
st_1 st_1
cb_find cb_find
dw_statpatcons dw_statpatcons
cb_close cb_close
end type
global w_statpatcons w_statpatcons

type variables
DataWindowChild dddwin
end variables

on w_statpatcons.create
int iCurrent
call super::create
this.ddlb_status=create ddlb_status
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cb_print=create cb_print
this.em_fin=create em_fin
this.st_2=create st_2
this.em_debut=create em_debut
this.st_1=create st_1
this.cb_find=create cb_find
this.dw_statpatcons=create dw_statpatcons
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_status
this.Control[iCurrent+2]=this.uo_calutil2
this.Control[iCurrent+3]=this.uo_calutil1
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.em_fin
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_find
this.Control[iCurrent+10]=this.dw_statpatcons
this.Control[iCurrent+11]=this.cb_close
end on

on w_statpatcons.destroy
call super::destroy
destroy(this.ddlb_status)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cb_print)
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.em_debut)
destroy(this.st_1)
destroy(this.cb_find)
destroy(this.dw_statpatcons)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type ddlb_status from u_ddlb within w_statpatcons
integer x = 1431
integer y = 1916
integer width = 430
integer taborder = 40
end type

event constructor;call super::constructor;long ll_statusid
string ls_code

of_addItem("Tous",0)

DECLARE liststatus CURSOR FOR
	select	status_id, 
				code
	from t_status
	where ortho_id = :v_no_ortho;
	
OPEN liststatus;

FETCH liststatus INTO :ll_statusid, :ls_code;

DO WHILE SQLCA.SQLCode = 0
	
	
	of_addItem(ls_code,ll_statusid)
	FETCH liststatus INTO :ll_statusid, :ls_code;
	
LOOP

CLOSE liststatus;

of_selectItem(1)
end event

type uo_calutil2 from u_calutil within w_statpatcons
boolean visible = false
integer x = 2505
integer y = 1360
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_statpatcons
boolean visible = false
integer x = 1783
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type cb_print from commandbutton within w_statpatcons
integer x = 27
integer y = 1912
integer width = 677
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
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_statpatcons)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type em_fin from editmask within w_statpatcons
integer x = 2505
integer y = 1920
integer width = 389
integer height = 100
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

type st_2 from statictext within w_statpatcons
integer x = 2386
integer y = 1932
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

event constructor;if v_langue = 'an' then
	this.text = 'to:'
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type em_debut from editmask within w_statpatcons
integer x = 1998
integer y = 1920
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
string mask = "[date]"
boolean autoskip = true
end type

type st_1 from statictext within w_statpatcons
integer x = 1801
integer y = 1932
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

type cb_find from commandbutton within w_statpatcons
integer x = 704
integer y = 1912
integer width = 677
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin
//string v_status
long ll_statusid

debut = date(em_debut.text)
fin = date(em_fin.text)
ll_statusid = long(ddlb_status.of_getselecteddata())
if ll_statusid = 0 then setnull(ll_statusid)

dw_statpatcons.object.date_debut.text = em_debut.text
dw_statpatcons.object.date_fin.text = em_fin.text
//v_status = dddwin.getitemstring(dddwin.getrow(),'code')
dw_statpatcons.retrieve(v_no_ortho,debut,fin,ll_statusid)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type dw_statpatcons from u_dw within w_statpatcons
integer width = 3598
integer height = 1888
integer taborder = 70
string title = "statpatcons"
string dataobject = "d_statpatcons"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_titre.text = 'STATS CONSULT'
	this.object.t_du.text = 'From:'
	this.object.t_au.text = 'to:'
	this.object.t_status.text = 'Status'
	this.object.t_pat.text = 'Patient name'
	this.object.t_datefact.text = 'Billing date'
	this.object.t_hor.text = 'Schedule'
	this.object.t_rap.text = 'Recall'
	this.object.t_printedon.text = 'Printed on'
	this.object.t_patvu.text = 'Client seen in consultation:'
	this.object.t_patcom.text = 'Client that have started the treatment:'
	this.object.t_patnoncom.text = 'Client that have not started the treatment:'
	this.object.t_nbcom.text = 'Nb. of patient started:'
	this.object.t_nbnoncom.text = 'Nb. of patient unstarted:'
	this.object.t_nbrap.text = 'Nb. of patient that are in recall:'
end if
SetTransObject(sqlca)

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

type cb_close from commandbutton within w_statpatcons
integer x = 2949
integer y = 1912
integer width = 677
integer height = 112
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

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

