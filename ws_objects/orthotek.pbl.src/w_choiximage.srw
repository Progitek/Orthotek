$PBExportHeader$w_choiximage.srw
forward
global type w_choiximage from window
end type
type rb_progress2 from radiobutton within w_choiximage
end type
type cb_cancel from commandbutton within w_choiximage
end type
type st_1 from statictext within w_choiximage
end type
type rb_final from radiobutton within w_choiximage
end type
type rb_progress1 from radiobutton within w_choiximage
end type
type rb_init from radiobutton within w_choiximage
end type
type cb_1 from commandbutton within w_choiximage
end type
end forward

global type w_choiximage from window
integer width = 1577
integer height = 844
boolean titlebar = true
string title = "IMAGING SYSTEM"
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
boolean center = true
rb_progress2 rb_progress2
cb_cancel cb_cancel
st_1 st_1
rb_final rb_final
rb_progress1 rb_progress1
rb_init rb_init
cb_1 cb_1
end type
global w_choiximage w_choiximage

on w_choiximage.create
this.rb_progress2=create rb_progress2
this.cb_cancel=create cb_cancel
this.st_1=create st_1
this.rb_final=create rb_final
this.rb_progress1=create rb_progress1
this.rb_init=create rb_init
this.cb_1=create cb_1
this.Control[]={this.rb_progress2,&
this.cb_cancel,&
this.st_1,&
this.rb_final,&
this.rb_progress1,&
this.rb_init,&
this.cb_1}
end on

on w_choiximage.destroy
destroy(this.rb_progress2)
destroy(this.cb_cancel)
destroy(this.st_1)
destroy(this.rb_final)
destroy(this.rb_progress1)
destroy(this.rb_init)
destroy(this.cb_1)
end on

type rb_progress2 from radiobutton within w_choiximage
integer x = 41
integer y = 384
integer width = 448
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Progression 2"
end type

type cb_cancel from commandbutton within w_choiximage
integer x = 50
integer y = 628
integer width = 645
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event

type st_1 from statictext within w_choiximage
integer x = 32
integer y = 36
integer width = 1399
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Veiillez choisir la série de photos qui vous conviens?"
boolean focusrectangle = false
end type

type rb_final from radiobutton within w_choiximage
integer x = 41
integer y = 480
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Final"
end type

type rb_progress1 from radiobutton within w_choiximage
integer x = 41
integer y = 288
integer width = 448
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Progression 1"
end type

type rb_init from radiobutton within w_choiximage
integer x = 41
integer y = 192
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Initial"
boolean checked = true
end type

type cb_1 from commandbutton within w_choiximage
integer x = 864
integer y = 628
integer width = 645
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Start imaging"
boolean default = true
end type

event clicked;int choix, ll_typeimg

select typeimaging into :ll_typeimg from t_options where ortho_id = :v_no_ortho;
if rb_init.checked then
	choix = 1
elseif rb_progress1.checked then
	choix = 2
elseif rb_progress2.checked then
	if ll_typeimg = 1 then
		choix = 4
	else
		choix = 3
	end if
elseif rb_final.checked then
	if ll_typeimg = 1 then
		choix = 3
	else
		choix = 4
	end if		
end if

closewithreturn(parent,choix)
end event

