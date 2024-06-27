$PBExportHeader$w_about.srw
$PBExportComments$Extension About window
forward
global type w_about from pro_w_about
end type
type mle_copyright from multilineedit within w_about
end type
end forward

global type w_about from pro_w_about
string title = "À propos"
boolean ib_isupdateable = false
mle_copyright mle_copyright
end type
global w_about w_about

on w_about.create
int iCurrent
call super::create
this.mle_copyright=create mle_copyright
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_copyright
end on

on w_about.destroy
call super::destroy
destroy(this.mle_copyright)
end on

event open;call super::open;// Display the appropriate application name.
If Len(inv_aboutattrib.is_application) > 0 Then
	st_application.text = inv_aboutattrib.is_application
	this.Title = 'À propos de ' + inv_aboutattrib.is_application
Else
	st_application.text = ''
	this.Title = 'À propos'
End If

// Display the appropriate copyright message.
If Len(inv_aboutattrib.is_copyright) > 0 Then
	mle_copyright.text = inv_aboutattrib.is_copyright
Else
	mle_copyright.text = ''
End If

end event

type p_about from pro_w_about`p_about within w_about
end type

type st_application from pro_w_about`st_application within w_about
end type

type st_version from pro_w_about`st_version within w_about
end type

type cb_ok from pro_w_about`cb_ok within w_about
end type

type st_copyright from pro_w_about`st_copyright within w_about
integer height = 392
end type

type mle_copyright from multilineedit within w_about
integer x = 402
integer y = 200
integer width = 1216
integer height = 392
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copyright message..."
boolean border = false
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

