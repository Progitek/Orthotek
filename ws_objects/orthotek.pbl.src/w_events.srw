$PBExportHeader$w_events.srw
forward
global type w_events from w_child
end type
type uo_1 from u_calendarhor within w_events
end type
type cb_supprimer from commandbutton within w_events
end type
type st_title from statictext within w_events
end type
type dw_events from u_dw within w_events
end type
type em_qte from editmask within w_events
end type
type st_2 from statictext within w_events
end type
type cb_close from commandbutton within w_events
end type
type cb_save from commandbutton within w_events
end type
type cb_traiter from commandbutton within w_events
end type
type cb_print from commandbutton within w_events
end type
type cb_insert from commandbutton within w_events
end type
end forward

global type w_events from w_child
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
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean ib_isupdateable = false
uo_1 uo_1
cb_supprimer cb_supprimer
st_title st_title
dw_events dw_events
em_qte em_qte
st_2 st_2
cb_close cb_close
cb_save cb_save
cb_traiter cb_traiter
cb_print cb_print
cb_insert cb_insert
end type
global w_events w_events

type variables
boolean change = false
int vi_day, vi_month, vi_year
end variables

forward prototypes
public subroutine save ()
end prototypes

public subroutine save ();if dw_events.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
end if
end subroutine

on w_events.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.cb_supprimer=create cb_supprimer
this.st_title=create st_title
this.dw_events=create dw_events
this.em_qte=create em_qte
this.st_2=create st_2
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_traiter=create cb_traiter
this.cb_print=create cb_print
this.cb_insert=create cb_insert
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.cb_supprimer
this.Control[iCurrent+3]=this.st_title
this.Control[iCurrent+4]=this.dw_events
this.Control[iCurrent+5]=this.em_qte
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.cb_save
this.Control[iCurrent+9]=this.cb_traiter
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_insert
end on

on w_events.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.cb_supprimer)
destroy(this.st_title)
destroy(this.dw_events)
destroy(this.em_qte)
destroy(this.st_2)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_traiter)
destroy(this.cb_print)
destroy(this.cb_insert)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_qte.text = '1'
istr_cal.caldate = date(string(Today()))
uo_1.uf_InitCal(istr_cal.caldate)
uo_1.PostEvent("ue_aff_horaire")
end event

type uo_1 from u_calendarhor within w_events
integer x = 2935
integer y = 1108
integer taborder = 20
boolean border = true
string pointer = "Arrow!"
end type

on uo_1.destroy
call u_calendarhor::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;string ls_date

istr_cal.caldate = id_date_selected
vi_day = ii_day
vi_month = ii_month
vi_year = ii_year
ls_date = string(istr_cal.caldate)
dw_events.setFilter("eventdate = date('" +  ls_date + "')")
dw_events.filter()
end event

type cb_supprimer from commandbutton within w_events
integer x = 759
integer y = 1916
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;dw_events.deleteRow(dw_events.getRow())
if dw_events.update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Delete"
end if
end event

type st_title from statictext within w_events
integer width = 965
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Journal des événements"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Event report"
end if
end event

type dw_events from u_dw within w_events
integer x = 18
integer y = 128
integer width = 2880
integer height = 1756
integer taborder = 10
string title = "none"
string dataobject = "d_events"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setRowFocusIndicator(hand!)
setTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_event.Text = "Event description"
end if
retrieve(v_no_ortho)
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

event clicked;dw_events.ScrollToRow(dw_events.GetClickedRow())
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

type em_qte from editmask within w_events
integer x = 1582
integer y = 1916
integer width = 270
integer height = 112
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
double increment = 1
string minmax = "1~~100"
end type

type st_2 from statictext within w_events
integer x = 1243
integer y = 1940
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "QUANTITE"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Quantity"
end if
end event

type cb_close from commandbutton within w_events
integer x = 3003
integer y = 1916
integer width = 603
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if change then
	if error_type(200) = 1  then
		save()
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Close"
end if
end event

type cb_save from commandbutton within w_events
integer x = 2400
integer y = 1916
integer width = 603
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarder"
end type

event clicked;save()
end event

event constructor;if v_langue = 'an' then
	this.Text = "Save"
end if
end event

type cb_traiter from commandbutton within w_events
integer x = 1874
integer y = 1916
integer width = 521
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Traiter"
end type

event clicked;long ll_qte
int i, li_year, li_month, li_day
string ls_text, ls_date, ls_jour, ls_mois, ls_annee
date ldt_date

li_year = vi_year
li_month = vi_month
li_day = vi_day
ll_qte = long(em_qte.text)
ls_text = dw_events.getItemString(dw_events.getRow(),'eventdet')

for i = 1 to ll_qte
	if li_day <= 28 then
		if li_month = 12 then
			li_month = 1
			li_year = li_year + 1
		else
			li_month = li_month + 1
		end if
		ls_date = string(li_day) + '-' + string(li_month) + '-' + string(li_year)
	else
		if li_month = 12 then
			li_month = 1
			li_year = li_year + 1
		else
			li_month = li_month + 1 
			if li_month = 2 then
				ls_jour = "28"
			else
				ls_jour = string(li_day)
			end if
		end if
		ls_date = ls_jour + '-' + string(li_month) + '-' + string(li_year)
	end if
	ldt_date = date(ls_date)
	insert into t_events(eventdate,eventdet,ortho_id) values(:ldt_date,:ls_text,:v_no_ortho);
next
dw_events.retrieve(v_no_ortho)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Done"
end if
end event

type cb_print from commandbutton within w_events
integer x = 389
integer y = 1916
integer width = 366
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;open(w_intervaldate)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event

type cb_insert from commandbutton within w_events
integer x = 9
integer y = 1916
integer width = 379
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long ll_newrow

ll_newrow = dw_events.insertRow(0)
dw_events.scrolltorow(ll_newrow)
dw_events.setItem(ll_newrow,'ortho_id',v_no_ortho)
dw_events.setItem(ll_newrow,'eventdate',istr_cal.caldate)
change = true

end event

event constructor;if v_langue = 'an' then
	this.Text = "Add"
end if
end event

