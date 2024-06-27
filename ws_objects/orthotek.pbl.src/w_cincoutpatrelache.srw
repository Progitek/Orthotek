$PBExportHeader$w_cincoutpatrelache.srw
forward
global type w_cincoutpatrelache from window
end type
type pb_dossfin from picturebutton within w_cincoutpatrelache
end type
type pb_etiq from picturebutton within w_cincoutpatrelache
end type
type pb_rap from picturebutton within w_cincoutpatrelache
end type
type pb_hor from picturebutton within w_cincoutpatrelache
end type
type cb_close from commandbutton within w_cincoutpatrelache
end type
type dw_cincoutpatrelache from u_dw within w_cincoutpatrelache
end type
end forward

global type w_cincoutpatrelache from window
integer width = 2226
integer height = 1212
boolean titlebar = true
string title = "Patients relachés"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_dossfin pb_dossfin
pb_etiq pb_etiq
pb_rap pb_rap
pb_hor pb_hor
cb_close cb_close
dw_cincoutpatrelache dw_cincoutpatrelache
end type
global w_cincoutpatrelache w_cincoutpatrelache

on w_cincoutpatrelache.create
this.pb_dossfin=create pb_dossfin
this.pb_etiq=create pb_etiq
this.pb_rap=create pb_rap
this.pb_hor=create pb_hor
this.cb_close=create cb_close
this.dw_cincoutpatrelache=create dw_cincoutpatrelache
this.Control[]={this.pb_dossfin,&
this.pb_etiq,&
this.pb_rap,&
this.pb_hor,&
this.cb_close,&
this.dw_cincoutpatrelache}
end on

on w_cincoutpatrelache.destroy
destroy(this.pb_dossfin)
destroy(this.pb_etiq)
destroy(this.pb_rap)
destroy(this.pb_hor)
destroy(this.cb_close)
destroy(this.dw_cincoutpatrelache)
end on

type pb_dossfin from picturebutton within w_cincoutpatrelache
integer x = 329
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Compute5!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Dossier financier"
end type

type pb_etiq from picturebutton within w_cincoutpatrelache
integer x = 219
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Custom074!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Étiquettes"
end type

type pb_rap from picturebutton within w_cincoutpatrelache
integer x = 110
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Report5!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Rappel"
end type

type pb_hor from picturebutton within w_cincoutpatrelache
integer width = 101
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Custom023!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Horaire"
end type

type cb_close from commandbutton within w_cincoutpatrelache
integer y = 1004
integer width = 2190
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_cincoutpatrelache from u_dw within w_cincoutpatrelache
integer y = 92
integer width = 2190
integer height = 900
integer taborder = 10
string title = "cincoutpatrelache"
string dataobject = "d_cincoutpatrelache"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
Retrieve()
end event

