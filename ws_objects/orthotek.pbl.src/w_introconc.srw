$PBExportHeader$w_introconc.srw
forward
global type w_introconc from w_child
end type
type cb_5 from commandbutton within w_introconc
end type
type cb_4 from commandbutton within w_introconc
end type
type cb_3 from commandbutton within w_introconc
end type
type cb_2 from commandbutton within w_introconc
end type
type cb_insert from commandbutton within w_introconc
end type
type dw_introconcl from u_dw within w_introconc
end type
type st_title from statictext within w_introconc
end type
end forward

global type w_introconc from w_child
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
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_insert cb_insert
dw_introconcl dw_introconcl
st_title st_title
end type
global w_introconc w_introconc

type variables
public boolean change = false
end variables

forward prototypes
public subroutine save ()
end prototypes

public subroutine save ();if dw_introconcl.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
end if
end subroutine

on w_introconc.create
int iCurrent
call super::create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_insert=create cb_insert
this.dw_introconcl=create dw_introconcl
this.st_title=create st_title
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_5
this.Control[iCurrent+2]=this.cb_4
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_insert
this.Control[iCurrent+6]=this.dw_introconcl
this.Control[iCurrent+7]=this.st_title
end on

on w_introconc.destroy
call super::destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_insert)
destroy(this.dw_introconcl)
destroy(this.st_title)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

title = "Introduction - Conclusion"
end event

type cb_5 from commandbutton within w_introconc
integer x = 3095
integer y = 1920
integer width = 517
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

event clicked;if change then
	if error_type(200) = 1 then
		save()
	end if
end if
close(parent)
if isvalid(w_description) then
	w_description.dddw_intro.settransobject(sqlca)
	w_description.dddw_intro.retrieve(v_no_ortho)
	w_description.dddw_intro.setFilter("ortho_id = " + string(v_no_ortho) + " and typetexte = 'i'")
	w_description.dddw_intro.filter()
	w_description.dddw_concl.settransobject(sqlca)
	w_description.dddw_concl.retrieve(v_no_ortho)
	w_description.dddw_concl.setFilter("ortho_id = " + string(v_no_ortho) + " and typetexte = 'c'")
	w_description.dddw_concl.filter()
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_4 from commandbutton within w_introconc
integer x = 2578
integer y = 1920
integer width = 512
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;save()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_3 from commandbutton within w_introconc
integer x = 1079
integer y = 1920
integer width = 1495
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
end type

type cb_2 from commandbutton within w_introconc
integer x = 549
integer y = 1920
integer width = 530
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

event clicked;dw_introconcl.deleteRow(dw_introconcl.getRow())
if dw_introconcl.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_insert from commandbutton within w_introconc
integer x = 18
integer y = 1920
integer width = 530
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter "
end type

event clicked;long ll_row

ll_row = dw_introconcl.insertRow(0)
dw_introconcl.scrollToRow(ll_row)
dw_introconcl.setItem(ll_row,'ortho_id',v_no_ortho)
change = true
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type dw_introconcl from u_dw within w_introconc
integer x = 14
integer y = 96
integer width = 3593
integer height = 1812
integer taborder = 10
string title = "none"
string dataobject = "d_introconcl"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

setTransObject(SQLCA)
retrieve(v_no_ortho)
end event

event editchanged;change = true
end event

event itemchanged;change = true
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

event rbuttondown;scrolltorow(row)
if row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
end if

end event

type st_title from statictext within w_introconc
integer width = 1371
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
string text = "Introductions - Conclusions"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Introductions and conclusions'
end if
end event

