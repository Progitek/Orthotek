$PBExportHeader$w_contgroup.srw
forward
global type w_contgroup from window
end type
type dw_contgroup from u_dw within w_contgroup
end type
type cb_close from commandbutton within w_contgroup
end type
type cb_insert from commandbutton within w_contgroup
end type
end forward

global type w_contgroup from window
integer width = 1797
integer height = 1332
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
dw_contgroup dw_contgroup
cb_close cb_close
cb_insert cb_insert
end type
global w_contgroup w_contgroup

type variables
boolean change = false
end variables

on w_contgroup.create
this.dw_contgroup=create dw_contgroup
this.cb_close=create cb_close
this.cb_insert=create cb_insert
this.Control[]={this.dw_contgroup,&
this.cb_close,&
this.cb_insert}
end on

on w_contgroup.destroy
destroy(this.dw_contgroup)
destroy(this.cb_close)
destroy(this.cb_insert)
end on

type dw_contgroup from u_dw within w_contgroup
integer x = 18
integer y = 12
integer width = 1714
integer height = 1140
integer taborder = 10
string title = "contgroup"
string dataobject = "d_contgroup"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
Retrieve(v_no_ortho)
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

type cb_close from commandbutton within w_contgroup
integer x = 937
integer y = 1176
integer width = 800
integer height = 112
integer taborder = 10
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
	if dw_contgroup.update() = 1 then
		commit;
		change = false
	else
		rollback;
		error_type(50)
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_insert from commandbutton within w_contgroup
integer x = 18
integer y = 1176
integer width = 800
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

ll_newrow = dw_contgroup.InsertRow(0)
dw_contgroup.ScrollToRow(ll_newrow)
dw_contgroup.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_contgroup.SetFocus()
change = true
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add Group'
end if
end event

