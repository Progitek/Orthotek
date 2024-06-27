$PBExportHeader$w_typeodonto.srw
forward
global type w_typeodonto from w_child
end type
type cb_deselect from commandbutton within w_typeodonto
end type
type cb_exit from commandbutton within w_typeodonto
end type
type st_1 from statictext within w_typeodonto
end type
type dw_odonto from u_dw within w_typeodonto
end type
type cb_add from commandbutton within w_typeodonto
end type
type cb_delete from commandbutton within w_typeodonto
end type
type cb_save from commandbutton within w_typeodonto
end type
end forward

global type w_typeodonto from w_child
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
cb_deselect cb_deselect
cb_exit cb_exit
st_1 st_1
dw_odonto dw_odonto
cb_add cb_add
cb_delete cb_delete
cb_save cb_save
end type
global w_typeodonto w_typeodonto

type variables
private long il_changement
end variables

forward prototypes
public subroutine of_save ()
end prototypes

public subroutine of_save ();if dw_odonto.Update() = 1 then
	commit using SQLCA;
	dw_odonto.retrieve()
	il_changement = 0
else
	rollback using SQLCA;
end if
end subroutine

on w_typeodonto.create
int iCurrent
call super::create
this.cb_deselect=create cb_deselect
this.cb_exit=create cb_exit
this.st_1=create st_1
this.dw_odonto=create dw_odonto
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.cb_save=create cb_save
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_deselect
this.Control[iCurrent+2]=this.cb_exit
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_odonto
this.Control[iCurrent+5]=this.cb_add
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.cb_save
end on

on w_typeodonto.destroy
call super::destroy
destroy(this.cb_deselect)
destroy(this.cb_exit)
destroy(this.st_1)
destroy(this.dw_odonto)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.cb_save)
end on

event open;call super::open;Long ll_row

if dw_odonto.retrieve( ) = 0 then
	ll_row = dw_odonto.insertRow(0)
	dw_odonto.scrollToRow(ll_row)
end if
end event

type cb_deselect from commandbutton within w_typeodonto
integer x = 1024
integer y = 1912
integer width = 439
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Décoché"
end type

event clicked;Long ll_row, ll_dent

ll_row = dw_odonto.getrow()
dw_odonto.setredraw(false)
if ll_row > 0 then
	for ll_dent = 1 to 8
	dw_odonto.setitem( ll_row, "d1"+string(ll_dent), 0)
	dw_odonto.setitem( ll_row, "d2"+string(ll_dent), 0)
	dw_odonto.setitem( ll_row, "d3"+string(ll_dent), 0)
	dw_odonto.setitem( ll_row, "d4"+string(ll_dent), 0)
	if ll_dent < 6 then
		dw_odonto.setitem( ll_row, "d5"+string(ll_dent), 0)
		dw_odonto.setitem( ll_row, "d6"+string(ll_dent), 0)
		dw_odonto.setitem( ll_row, "d7"+string(ll_dent), 0)
		dw_odonto.setitem( ll_row, "d8"+string(ll_dent), 0)
	end if
	il_changement = 1
next
end if
dw_odonto.setredraw(true)

end event

type cb_exit from commandbutton within w_typeodonto
integer x = 3227
integer y = 1916
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Quitter"
end type

event clicked;if il_changement = 1 then
	if error_type(200) = 1 then
		of_save()
	end if
end if
close(w_typeodonto)
end event

type st_1 from statictext within w_typeodonto
integer x = 1271
integer y = 44
integer width = 887
integer height = 100
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Odontogramme type"
boolean focusrectangle = false
end type

type dw_odonto from u_dw within w_typeodonto
integer x = 9
integer y = 164
integer width = 3621
integer height = 1732
integer taborder = 10
string title = "none"
string dataobject = "d_typeodontogramme"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;String ls_name, ls_column
dw_odonto.setredraw( false)
il_changement = 1
ls_name = dwo.name
ls_column = right(ls_name,3)
if left(ls_name,3) = 't_d' then
	if getitemnumber(row,ls_column) = 0 or isnull(getitemnumber(row,ls_column)) then
		setitem(row,ls_column,1)
	else
		setitem(row,ls_column,0)
	end if
end if
dw_odonto.setredraw( true)
end event

event constructor;setTransObject(SQLCA)
end event

event itemchanged;call super::itemchanged;il_changement = 1
end event

event itemfocuschanged;call super::itemfocuschanged;il_changement = 1
end event

type cb_add from commandbutton within w_typeodonto
integer x = 9
integer y = 1912
integer width = 530
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long ll_row

ll_row = dw_odonto.insertRow(0)
dw_odonto.scrollToRow(ll_row)

il_changement = 1
end event

type cb_delete from commandbutton within w_typeodonto
integer x = 539
integer y = 1912
integer width = 485
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

event clicked;dw_odonto.deleteRow(dw_odonto.getRow())
il_changement = 1
end event

type cb_save from commandbutton within w_typeodonto
integer x = 2798
integer y = 1916
integer width = 430
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;of_save()
end event

