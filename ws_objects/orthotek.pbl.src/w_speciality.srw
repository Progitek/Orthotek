$PBExportHeader$w_speciality.srw
forward
global type w_speciality from w_child
end type
type dw_speciality from u_dw within w_speciality
end type
type st_title from statictext within w_speciality
end type
type cb_insert from commandbutton within w_speciality
end type
type cb_update from commandbutton within w_speciality
end type
type cb_delete from commandbutton within w_speciality
end type
type cb_2 from commandbutton within w_speciality
end type
type cb_close from commandbutton within w_speciality
end type
end forward

global type w_speciality from w_child
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
boolean ib_isupdateable = false
dw_speciality dw_speciality
st_title st_title
cb_insert cb_insert
cb_update cb_update
cb_delete cb_delete
cb_2 cb_2
cb_close cb_close
end type
global w_speciality w_speciality

type variables
private boolean change = false
end variables

on w_speciality.create
int iCurrent
call super::create
this.dw_speciality=create dw_speciality
this.st_title=create st_title
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_2=create cb_2
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_speciality
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.cb_insert
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.cb_delete
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_close
end on

on w_speciality.destroy
call super::destroy
destroy(this.dw_speciality)
destroy(this.st_title)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_2)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type dw_speciality from u_dw within w_speciality
event ue_insert ( )
event ue_update ( )
event ue_delete ( long row )
integer x = 14
integer y = 124
integer width = 3598
integer height = 1784
integer taborder = 10
string title = "speciality"
string dataobject = "d_speciality"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insert();long ll_row

ll_row = insertRow(0)
scrollToRow(ll_row)
change = true
end event

event ue_update();if change then
	if update() = 1 then
		commit using SQLCA;
		change = false
	else
		rollback using SQLCA;
		error_type(50)
	end if
end if
end event

event ue_delete(long row);deleteRow(row)
change = true
event ue_update()
end event

event constructor;setTransObject(SQLCA)
retrieve()
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

type st_title from statictext within w_speciality
integer width = 955
integer height = 84
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Liste des spécialités"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'List of speciality'
end if
end event

type cb_insert from commandbutton within w_speciality
integer x = 14
integer y = 1920
integer width = 617
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;dw_speciality.event ue_insert()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type cb_update from commandbutton within w_speciality
integer x = 2327
integer y = 1920
integer width = 635
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;dw_speciality.event ue_update()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_delete from commandbutton within w_speciality
integer x = 631
integer y = 1920
integer width = 617
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_speciality.event ue_delete(dw_speciality.getRow())
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_2 from commandbutton within w_speciality
integer x = 1248
integer y = 1920
integer width = 1079
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_close from commandbutton within w_speciality
integer x = 2962
integer y = 1920
integer width = 635
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;if change then
	if error_type(200) = 1 then
		dw_speciality.event ue_update()
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

