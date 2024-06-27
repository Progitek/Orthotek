$PBExportHeader$w_statuslist.srw
forward
global type w_statuslist from window
end type
type dw_statuslist from u_dw within w_statuslist
end type
type cb_cancel from commandbutton within w_statuslist
end type
type cb_apply from commandbutton within w_statuslist
end type
end forward

global type w_statuslist from window
integer width = 1445
integer height = 912
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_statuslist dw_statuslist
cb_cancel cb_cancel
cb_apply cb_apply
end type
global w_statuslist w_statuslist

on w_statuslist.create
this.dw_statuslist=create dw_statuslist
this.cb_cancel=create cb_cancel
this.cb_apply=create cb_apply
this.Control[]={this.dw_statuslist,&
this.cb_cancel,&
this.cb_apply}
end on

on w_statuslist.destroy
destroy(this.dw_statuslist)
destroy(this.cb_cancel)
destroy(this.cb_apply)
end on

type dw_statuslist from u_dw within w_statuslist
integer x = 9
integer width = 1408
integer height = 772
integer taborder = 10
string title = "none"
string dataobject = "dw_statuslist"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
Retrieve(v_no_ortho)
end event

type cb_cancel from commandbutton within w_statuslist
integer x = 759
integer y = 780
integer width = 658
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_apply from commandbutton within w_statuslist
integer x = 9
integer y = 780
integer width = 658
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
boolean default = true
end type

event clicked;long row
string ls_status

dw_statuslist.accepttext()
row = dw_statuslist.getrow()
ls_status = dw_statuslist.getitemstring(row,'description')
Clipboard(ls_status)
Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Apply'
end if
end event

