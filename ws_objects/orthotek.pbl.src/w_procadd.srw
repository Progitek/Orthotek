$PBExportHeader$w_procadd.srw
forward
global type w_procadd from window
end type
type cb_cancel from commandbutton within w_procadd
end type
type cb_add from commandbutton within w_procadd
end type
type sle_proc from singlelineedit within w_procadd
end type
type st_1 from statictext within w_procadd
end type
end forward

global type w_procadd from window
integer width = 1787
integer height = 476
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_add cb_add
sle_proc sle_proc
st_1 st_1
end type
global w_procadd w_procadd

on w_procadd.create
this.cb_cancel=create cb_cancel
this.cb_add=create cb_add
this.sle_proc=create sle_proc
this.st_1=create st_1
this.Control[]={this.cb_cancel,&
this.cb_add,&
this.sle_proc,&
this.st_1}
end on

on w_procadd.destroy
destroy(this.cb_cancel)
destroy(this.cb_add)
destroy(this.sle_proc)
destroy(this.st_1)
end on

type cb_cancel from commandbutton within w_procadd
integer x = 965
integer y = 312
integer width = 731
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_add from commandbutton within w_procadd
integer x = 50
integer y = 312
integer width = 731
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
boolean default = true
end type

event clicked;string ls_proc
ls_proc = sle_proc.text

if isnull(ls_proc) = false and ls_proc <> '' then
	insert into t_procedure(procnom,ortho_id) values(:ls_proc,:v_no_ortho);
	error_type(-1)
end if
close(parent)
end event

type sle_proc from singlelineedit within w_procadd
integer x = 69
integer y = 172
integer width = 1550
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_procadd
integer x = 32
integer y = 36
integer width = 1641
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Indiquez le nom de la nouvelle procédure:"
boolean focusrectangle = false
end type

