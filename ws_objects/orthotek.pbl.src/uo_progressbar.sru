$PBExportHeader$uo_progressbar.sru
forward
global type uo_progressbar from userobject
end type
type st_2 from statictext within uo_progressbar
end type
type st_label from statictext within uo_progressbar
end type
type hpb_progressbar from hprogressbar within uo_progressbar
end type
end forward

global type uo_progressbar from userobject
integer width = 1541
integer height = 324
long backcolor = 67108864
string text = "ProgressBar"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_2 st_2
st_label st_label
hpb_progressbar hpb_progressbar
end type
global uo_progressbar uo_progressbar

type variables

end variables

forward prototypes
public subroutine f_max (integer f_max)
public subroutine f_position (long f_pos)
public subroutine f_tache (string fs_tache)
end prototypes

public subroutine f_max (integer f_max);hpb_progressbar.SetRange(0,f_max)
end subroutine

public subroutine f_position (long f_pos);hpb_progressbar.Position = f_pos
end subroutine

public subroutine f_tache (string fs_tache);st_label.text = fs_tache
end subroutine

on uo_progressbar.create
this.st_2=create st_2
this.st_label=create st_label
this.hpb_progressbar=create hpb_progressbar
this.Control[]={this.st_2,&
this.st_label,&
this.hpb_progressbar}
end on

on uo_progressbar.destroy
destroy(this.st_2)
destroy(this.st_label)
destroy(this.hpb_progressbar)
end on

type st_2 from statictext within uo_progressbar
integer x = 1125
integer y = 244
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ii4net inc."
alignment alignment = right!
boolean focusrectangle = false
end type

type st_label from statictext within uo_progressbar
integer x = 18
integer y = 24
integer width = 1504
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please wait ..."
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_progressbar from hprogressbar within uo_progressbar
integer x = 18
integer y = 120
integer width = 1504
integer height = 64
unsignedinteger maxposition = 1000
integer setstep = 1
boolean smoothscroll = true
end type

