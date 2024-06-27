$PBExportHeader$w_satellitedelete.srw
forward
global type w_satellitedelete from window
end type
type dw_satellite from u_dw within w_satellitedelete
end type
type st_1 from statictext within w_satellitedelete
end type
type cb_2 from commandbutton within w_satellitedelete
end type
type cb_1 from commandbutton within w_satellitedelete
end type
end forward

global type w_satellitedelete from window
integer width = 1531
integer height = 588
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_satellite dw_satellite
st_1 st_1
cb_2 cb_2
cb_1 cb_1
end type
global w_satellitedelete w_satellitedelete

on w_satellitedelete.create
this.dw_satellite=create dw_satellite
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_satellite,&
this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_satellitedelete.destroy
destroy(this.dw_satellite)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_satellite from u_dw within w_satellitedelete
integer x = 23
integer y = 72
integer width = 1417
integer height = 336
integer taborder = 10
string title = "satellite"
string dataobject = "dddw_satellite"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
Retrieve()
end event

event clicked;ScrollToRow(GetClickedRow())
end event

type st_1 from statictext within w_satellitedelete
integer x = 23
integer y = 4
integer width = 763
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choisir le satellite à annuler:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_satellitedelete
integer x = 745
integer y = 428
integer width = 699
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_satellitedelete
integer x = 23
integer y = 428
integer width = 699
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
end type

