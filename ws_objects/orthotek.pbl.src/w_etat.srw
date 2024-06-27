$PBExportHeader$w_etat.srw
forward
global type w_etat from window
end type
type st_verbd from u_statictext within w_etat
end type
type st_verprog from u_statictext within w_etat
end type
type p_1 from picture within w_etat
end type
type cb_update from commandbutton within w_etat
end type
type sle_pass1 from singlelineedit within w_etat
end type
type sle_pass2 from singlelineedit within w_etat
end type
type st_conf from statictext within w_etat
end type
type st_pass from statictext within w_etat
end type
type sle_status from singlelineedit within w_etat
end type
type dw_entrer_ortho from datawindow within w_etat
end type
end forward

global type w_etat from window
string tag = "w_etat"
integer x = 251
integer y = 252
integer width = 3662
integer height = 2396
windowtype windowtype = popup!
long backcolor = 16777215
string pointer = "Arrow!"
boolean toolbarvisible = false
boolean center = true
st_verbd st_verbd
st_verprog st_verprog
p_1 p_1
cb_update cb_update
sle_pass1 sle_pass1
sle_pass2 sle_pass2
st_conf st_conf
st_pass st_pass
sle_status sle_status
dw_entrer_ortho dw_entrer_ortho
end type
global w_etat w_etat

type variables
int change = 0
end variables

forward prototypes
public subroutine new_ortho ()
public function integer sauve ()
end prototypes

public subroutine new_ortho ();int new_row

st_pass.visible = true
st_conf.visible = true
sle_pass1.visible = true
sle_pass2.visible = true
dw_entrer_ortho.visible = true
dw_entrer_ortho.enabled = true
cb_update.visible = true
cb_update.enabled = true
dw_entrer_ortho.SetTransObject(SQLCA)
new_row = dw_entrer_ortho.insertrow(0)
dw_entrer_ortho.scrolltorow(new_row)
dw_entrer_ortho.SetItem(new_row,'ortho_id',1)
dw_entrer_ortho.setcolumn(0)
dw_entrer_ortho.setfocus()
change = 1
end subroutine

public function integer sauve ();long ortho

if dw_entrer_ortho.Update() = 1 then
	commit using SQLCA;
	select max(ortho_id) into :ortho from ortho_id;
	if ortho > 0 then
		insert into password (password, ortho_id,typepass) values ('ortho', :ortho,'user');
		change=0
		return 1
	end if
else
	rollback using SQLCA;
//	error_type(50)
end if

return 0

end function

on w_etat.create
this.st_verbd=create st_verbd
this.st_verprog=create st_verprog
this.p_1=create p_1
this.cb_update=create cb_update
this.sle_pass1=create sle_pass1
this.sle_pass2=create sle_pass2
this.st_conf=create st_conf
this.st_pass=create st_pass
this.sle_status=create sle_status
this.dw_entrer_ortho=create dw_entrer_ortho
this.Control[]={this.st_verbd,&
this.st_verprog,&
this.p_1,&
this.cb_update,&
this.sle_pass1,&
this.sle_pass2,&
this.st_conf,&
this.st_pass,&
this.sle_status,&
this.dw_entrer_ortho}
end on

on w_etat.destroy
destroy(this.st_verbd)
destroy(this.st_verprog)
destroy(this.p_1)
destroy(this.cb_update)
destroy(this.sle_pass1)
destroy(this.sle_pass2)
destroy(this.st_conf)
destroy(this.st_pass)
destroy(this.sle_status)
destroy(this.dw_entrer_ortho)
end on

type st_verbd from u_statictext within w_etat
integer x = 3063
integer y = 120
integer width = 544
integer height = 64
long backcolor = 16777215
boolean #transparent = true
end type

on st_verbd.destroy
call u_statictext::destroy
end on

type st_verprog from u_statictext within w_etat
integer x = 3063
integer y = 48
integer width = 544
integer height = 64
long backcolor = 16777215
boolean #transparent = true
end type

on st_verprog.destroy
call u_statictext::destroy
end on

type p_1 from picture within w_etat
integer width = 3657
integer height = 2400
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "C:\ii4net\orthotek\images\Orthotek_Banner.png"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_update from commandbutton within w_etat
boolean visible = false
integer x = 1577
integer y = 2088
integer width = 901
integer height = 168
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
boolean enabled = false
string text = "Enregistrement"
end type

event clicked;if sle_pass1.text = sle_pass2.text then
	if len(sle_pass1.text) >= 3 then
		dw_entrer_ortho.setitem(1,'password',sle_pass2.text)
		if change=1 then
			if sauve() = 1 then
				error_type(107)
			else
				error_type(50)
			end if
			close(w_etat)
		else
			error_type(106)
		end if
	else
		messagebox ("Avertissement!","Le mot de passe doit contenir au moins 3 caractères",Information!,OK!)
	end if
else
	messagebox ("Avertissement!","Le mot de passe inscrit ne conrrespond pas à la confirmation",Information!,OK!)
end if
end event

type sle_pass1 from singlelineedit within w_etat
boolean visible = false
integer x = 2862
integer y = 2088
integer width = 567
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_pass2 from singlelineedit within w_etat
boolean visible = false
integer x = 2862
integer y = 2176
integer width = 567
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_conf from statictext within w_etat
boolean visible = false
integer x = 2533
integer y = 2180
integer width = 315
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long backcolor = 12632256
string text = "Confirm :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_pass from statictext within w_etat
boolean visible = false
integer x = 2528
integer y = 2096
integer width = 320
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long backcolor = 12632256
string text = "Password :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_status from singlelineedit within w_etat
integer x = 27
integer y = 1740
integer width = 2889
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "status"
boolean border = false
boolean displayonly = true
end type

type dw_entrer_ortho from datawindow within w_etat
boolean visible = false
integer x = 640
integer y = 164
integer width = 2555
integer height = 1884
integer taborder = 10
boolean bringtotop = true
boolean enabled = false
boolean titlebar = true
string title = "Enregistrement"
string dataobject = "dw_entrer_ortho"
boolean border = false
borderstyle borderstyle = styleraised!
end type

event itemchanged;change = 1
end event

event editchanged;change = 1
end event

event constructor;SetTransObject(SQLCA)
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

