$PBExportHeader$u_waitcomm.sru
forward
global type u_waitcomm from userobject
end type
type st_min from statictext within u_waitcomm
end type
type st_time from statictext within u_waitcomm
end type
type st_temp from statictext within u_waitcomm
end type
type st_title from statictext within u_waitcomm
end type
type p_line from picture within u_waitcomm
end type
type p_sat from picture within u_waitcomm
end type
end forward

global type u_waitcomm from userobject
integer width = 1545
integer height = 468
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_min st_min
st_time st_time
st_temp st_temp
st_title st_title
p_line p_line
p_sat p_sat
end type
global u_waitcomm u_waitcomm

on u_waitcomm.create
this.st_min=create st_min
this.st_time=create st_time
this.st_temp=create st_temp
this.st_title=create st_title
this.p_line=create p_line
this.p_sat=create p_sat
this.Control[]={this.st_min,&
this.st_time,&
this.st_temp,&
this.st_title,&
this.p_line,&
this.p_sat}
end on

on u_waitcomm.destroy
destroy(this.st_min)
destroy(this.st_time)
destroy(this.st_temp)
destroy(this.st_title)
destroy(this.p_line)
destroy(this.p_sat)
end on

type st_min from statictext within u_waitcomm
integer x = 1093
integer y = 176
integer width = 270
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "minutes"
boolean focusrectangle = false
end type

type st_time from statictext within u_waitcomm
integer x = 901
integer y = 180
integer width = 183
integer height = 72
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2:00"
boolean focusrectangle = false
end type

type st_temp from statictext within u_waitcomm
integer x = 434
integer y = 176
integer width = 462
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Temps estimé:"
boolean focusrectangle = false
end type

type st_title from statictext within u_waitcomm
integer x = 434
integer y = 32
integer width = 1079
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Communication en cours . . . . ."
boolean focusrectangle = false
end type

type p_line from picture within u_waitcomm
integer y = 380
integer width = 1550
integer height = 36
string picturename = "C:\ii4net\dentitek\images\line.gif"
boolean focusrectangle = false
end type

type p_sat from picture within u_waitcomm
integer x = 27
integer width = 311
integer height = 348
string picturename = "C:\ii4net\dentitek\images\satelite.gif"
boolean focusrectangle = false
boolean map3dcolors = true
end type

