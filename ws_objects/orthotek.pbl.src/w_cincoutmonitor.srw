$PBExportHeader$w_cincoutmonitor.srw
forward
global type w_cincoutmonitor from w_child
end type
type cb_3 from commandbutton within w_cincoutmonitor
end type
type cb_1 from commandbutton within w_cincoutmonitor
end type
type cb_2 from commandbutton within w_cincoutmonitor
end type
type st_heure from statictext within w_cincoutmonitor
end type
type st_4 from statictext within w_cincoutmonitor
end type
type cb_close from commandbutton within w_cincoutmonitor
end type
type st_2 from statictext within w_cincoutmonitor
end type
type dw_cincoutmonitorarr from u_dw within w_cincoutmonitor
end type
type st_title from statictext within w_cincoutmonitor
end type
end forward

global type w_cincoutmonitor from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 16777215
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_3 cb_3
cb_1 cb_1
cb_2 cb_2
st_heure st_heure
st_4 st_4
cb_close cb_close
st_2 st_2
dw_cincoutmonitorarr dw_cincoutmonitorarr
st_title st_title
end type
global w_cincoutmonitor w_cincoutmonitor

type variables
private long il_row = 0
private integer t = 5,ii_edit = 0
end variables

forward prototypes
public subroutine affichedata ()
end prototypes

public subroutine affichedata ();/* Copyright II4net Inc.
   créer le: 13-04-2003
	modifier le: 13-04-2003
	Auteur dernière modif: Dave Tremblay
*/

long ll_duree1, ll_duree2, ll_duree3, ll_duree4, ll_duree5
long ll_patid1, ll_patid2, ll_patid3, ll_patid4, ll_patid5
long ll_row, ll_timervm, ll_timeret
date ldt_today
string ls_nom1, ls_nom2, ls_nom3, ls_nom4, ls_nom5
string ls_trait1, ls_trait2, ls_trait3, ls_trait4, ls_trait5
time lt_today, lt_time

select temporvm, temporet into :ll_timervm, :ll_timeret from t_options where ortho_id = :v_no_ortho;

lt_time = relativeTime(now(),(ll_timervm * -60))



end subroutine

on w_cincoutmonitor.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_heure=create st_heure
this.st_4=create st_4
this.cb_close=create cb_close
this.st_2=create st_2
this.dw_cincoutmonitorarr=create dw_cincoutmonitorarr
this.st_title=create st_title
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_heure
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.dw_cincoutmonitorarr
this.Control[iCurrent+9]=this.st_title
end on

on w_cincoutmonitor.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_heure)
destroy(this.st_4)
destroy(this.cb_close)
destroy(this.st_2)
destroy(this.dw_cincoutmonitorarr)
destroy(this.st_title)
end on

event timer;boolean lb_sel = false
long ll_row, ll_ret, ll_manq
time lt_ret, lt_manq

st_heure.text = string(now())

// Effacer les patients qui ne doive plus être dans la liste
//select temporet, temporvm into :ll_ret, :ll_manq from t_options where ortho_id = :v_no_ortho;
//lt_manq = relativeTime(now(), (ll_manq * -60))
//lt_ret = relativeTime(now(), (ll_ret * -60))

//update t_rdv set rdvetat = 'm' where (heurearr is null or heurearr = '00:00:00') and (rdvetat is null or rdvetat = '' or rdvetat = 'l') and rdvdate = today() and rdvheure < :lt_manq;
//update t_rdv set rdvetat = 'l' where (heurearr is null or heurearr = '00:00:00') and (rdvetat is null or rdvetat = '') and rdvdate = today() and rdvheure < :lt_ret;
//commit using sqlca;
//dw_cincoutmonitorarr.setredraw(true)
//ll_row = dw_cincoutmonitorarr.getrow()
//if dw_cincoutmonitorarr.isSelected(ll_row) then lb_sel = true

// faire un master refresh au 5 seconde
if t >= 5 then
	dw_cincoutmonitorarr.event ue_retrieve()
	t = 0
else
	t++
end if

end event

event open;//afficheData()

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

timer(1)
end event

type cb_3 from commandbutton within w_cincoutmonitor
integer x = 631
integer y = 1944
integer width = 626
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CHECK OUT"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 30-05-2005
	modifié le: 30-05-2005
	Auteur dernière modif: Sébastien Tremblay
*/

// Procédure CHECK-OUT

long ll_idrdv, ll_row

// Mise-à-jour de la table rendez-vous

ll_row = dw_cincoutmonitorarr.getRow()
ll_idrdv = dw_cincoutmonitorarr.getItemNumber(ll_row,'t_rdv_id_rdv')
update t_rdv set released = now() where id_rdv = :ll_idrdv;
commit using SQLCA;
dw_cincoutmonitorarr.event ue_retrieve()
end event

type cb_1 from commandbutton within w_cincoutmonitor
integer x = 5
integer y = 1944
integer width = 626
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "CHECK IN"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
	modifier le: 30-05-2005
	Auteur dernière modif: Sébastien Tremblay
*/

// Procédure CHECK-IN

long ll_idrdv, ll_row

// Mise-à-jour de la table rendez-vous

ll_row = dw_cincoutmonitorarr.getRow()
ll_idrdv = dw_cincoutmonitorarr.getItemNumber(ll_row,'t_rdv_id_rdv')
update t_rdv set seated = now() where id_rdv = :ll_idrdv;
commit using SQLCA;
dw_cincoutmonitorarr.event ue_retrieve()

end event

type cb_2 from commandbutton within w_cincoutmonitor
integer x = 1257
integer y = 1944
integer width = 1760
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type st_heure from statictext within w_cincoutmonitor
integer x = 3232
integer y = 20
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean focusrectangle = false
end type

type st_4 from statictext within w_cincoutmonitor
integer x = 2875
integer y = 20
integer width = 370
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "Heure locale"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Local time"
end if
end event

type cb_close from commandbutton within w_cincoutmonitor
integer x = 3017
integer y = 1944
integer width = 626
integer height = 104
integer taborder = 30
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
	this.text = "Close"
end if
end event

type st_2 from statictext within w_cincoutmonitor
integer x = 1088
integer y = 16
integer width = 1413
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "Liste des patients ayant rendez-vous aujourd~'hui"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "List of arrivals"
end if
end event

type dw_cincoutmonitorarr from u_dw within w_cincoutmonitor
event ue_cincout ( long row )
event ue_retrieve ( )
integer x = 5
integer y = 88
integer width = 3639
integer height = 1852
integer taborder = 20
string dataobject = "d_monitorliste"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();string ls_vscrollpos

if ii_edit <= 0 then
	setredraw(false)
	ls_vscrollpos = describe("DataWindow.VerticalScrollPosition")
	if this.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		error_type(50)
	end if
	Retrieve(v_no_ortho)
	object.DataWindow.VerticalScrollPosition = long(ls_vscrollpos)
	setredraw(true)
	ii_edit = 0
else
	ii_edit = ii_edit - 1
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

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
setRowFocusIndicator(FocusRect!)
if v_langue = 'an' then
	object.nom_t.text = "Name"
	object.heure_t.text = "TimeAp"
	object.t_1.text = "TimeArr"	
	object.duree_t.text = "Length"
	object.t_3.text = "Waiting"
	object.t_4.text = "Chair"
//	object.t_5.text = "Staff"
	object.t_6.text = "Treatment"
	object.t_rdv_rdvetat.values = "On time~to/Late~tl/Missed~tm/Cancelled~tc/Early~te/Waiting~w/On Desk~d"
else
	object.t_rdv_rdvetat.values = "À temps~to/En retard~tl/Manqué~tm/Annulé~tc/En avance~te/En attente~w/On Desk~d"
end if
end event

event clicked;//if isSelected(row) then
//	selectRow(row,false)
//else
//	selectRow(0,false)
//	selectRow(row,true)
//end if
//if row > 0 then
//	SelectRow(row,true)
//	setredraw(false)
//	il_row = row
//end if
scrollToRow(getClickedRow())
//timer(0)
if dwo.name = 'rdvetat' then
	ii_edit = 1
end if
end event

type st_title from statictext within w_cincoutmonitor
integer x = 9
integer width = 558
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 16777215
string text = "Moniteur"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Monitor"
end if
end event

