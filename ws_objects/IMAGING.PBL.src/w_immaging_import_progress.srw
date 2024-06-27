$PBExportHeader$w_immaging_import_progress.srw
forward
global type w_immaging_import_progress from window
end type
type st_1 from statictext within w_immaging_import_progress
end type
type rr_1 from roundrectangle within w_immaging_import_progress
end type
end forward

global type w_immaging_import_progress from window
integer width = 2066
integer height = 384
boolean titlebar = true
string title = "Importing ..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 15793151
string icon = "AppIcon!"
boolean center = true
st_1 st_1
rr_1 rr_1
end type
global w_immaging_import_progress w_immaging_import_progress

on w_immaging_import_progress.create
this.st_1=create st_1
this.rr_1=create rr_1
this.Control[]={this.st_1,&
this.rr_1}
end on

on w_immaging_import_progress.destroy
destroy(this.st_1)
destroy(this.rr_1)
end on

type st_1 from statictext within w_immaging_import_progress
integer x = 87
integer y = 96
integer width = 1874
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Importing Progress"
boolean focusrectangle = false
end type

type rr_1 from roundrectangle within w_immaging_import_progress
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 18
integer y = 8
integer width = 2016
integer height = 264
integer cornerheight = 40
integer cornerwidth = 46
end type

