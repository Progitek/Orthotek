$PBExportHeader$w_rotation.srw
forward
global type w_rotation from w_response
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_rotation
end type
type uo_toolbar from u_cst_toolbarstrip within w_rotation
end type
type cbx_redim from u_cbx within w_rotation
end type
type rb_antih from u_rb within w_rotation
end type
type rb_hor from u_rb within w_rotation
end type
type sle_angle from u_sle within w_rotation
end type
type rb_pers from u_rb within w_rotation
end type
type rb_180 from u_rb within w_rotation
end type
type rb_90ah from u_rb within w_rotation
end type
type rb_90h from u_rb within w_rotation
end type
type cb_ok from commandbutton within w_rotation
end type
type cb_annuler from commandbutton within w_rotation
end type
type gb_ang from u_gb within w_rotation
end type
type rr_1 from roundrectangle within w_rotation
end type
type gb_sta from u_gb within w_rotation
end type
end forward

global type w_rotation from w_response
integer width = 1449
integer height = 816
string title = "Rotation"
long backcolor = 15793151
boolean center = true
boolean ib_isupdateable = false
uo_toolbar2 uo_toolbar2
uo_toolbar uo_toolbar
cbx_redim cbx_redim
rb_antih rb_antih
rb_hor rb_hor
sle_angle sle_angle
rb_pers rb_pers
rb_180 rb_180
rb_90ah rb_90ah
rb_90h rb_90h
cb_ok cb_ok
cb_annuler cb_annuler
gb_ang gb_ang
rr_1 rr_1
gb_sta gb_sta
end type
global w_rotation w_rotation

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")

uo_toolbar.of_DisplayBorder(true)

uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)

if gs_langue = "an" THEN
	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Cancel", "C:\ii4net\imgpro\annuler.gif")
	
	rb_hor.text = "Clockwise"
	rb_antih.text = "Counter clockwise"
	cbx_redim.text = "Redimension"
	gb_ang.text = "Personnalized angle"
	gb_sta.text = "Standard angle"
	rb_90h.text = "90° clockwise"
	rb_90ah.text = "90° counter clockwise"
	rb_pers.text = "Personnalized"
	
	
ELSE
	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Annuler", "C:\ii4net\imgpro\annuler.gif")
END IF
uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)
end subroutine

on w_rotation.create
int iCurrent
call super::create
this.uo_toolbar2=create uo_toolbar2
this.uo_toolbar=create uo_toolbar
this.cbx_redim=create cbx_redim
this.rb_antih=create rb_antih
this.rb_hor=create rb_hor
this.sle_angle=create sle_angle
this.rb_pers=create rb_pers
this.rb_180=create rb_180
this.rb_90ah=create rb_90ah
this.rb_90h=create rb_90h
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.gb_ang=create gb_ang
this.rr_1=create rr_1
this.gb_sta=create gb_sta
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbar2
this.Control[iCurrent+2]=this.uo_toolbar
this.Control[iCurrent+3]=this.cbx_redim
this.Control[iCurrent+4]=this.rb_antih
this.Control[iCurrent+5]=this.rb_hor
this.Control[iCurrent+6]=this.sle_angle
this.Control[iCurrent+7]=this.rb_pers
this.Control[iCurrent+8]=this.rb_180
this.Control[iCurrent+9]=this.rb_90ah
this.Control[iCurrent+10]=this.rb_90h
this.Control[iCurrent+11]=this.cb_ok
this.Control[iCurrent+12]=this.cb_annuler
this.Control[iCurrent+13]=this.gb_ang
this.Control[iCurrent+14]=this.rr_1
this.Control[iCurrent+15]=this.gb_sta
end on

on w_rotation.destroy
call super::destroy
destroy(this.uo_toolbar2)
destroy(this.uo_toolbar)
destroy(this.cbx_redim)
destroy(this.rb_antih)
destroy(this.rb_hor)
destroy(this.sle_angle)
destroy(this.rb_pers)
destroy(this.rb_180)
destroy(this.rb_90ah)
destroy(this.rb_90h)
destroy(this.cb_ok)
destroy(this.cb_annuler)
destroy(this.gb_ang)
destroy(this.rr_1)
destroy(this.gb_sta)
end on

type uo_toolbar2 from u_cst_toolbarstrip within w_rotation
event destroy ( )
string tag = "resize=n"
integer x = 910
integer y = 608
integer width = 507
integer taborder = 20
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_annuler.event clicked( )
end event

type uo_toolbar from u_cst_toolbarstrip within w_rotation
event destroy ( )
string tag = "resize=n"
integer x = 27
integer y = 608
integer width = 507
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_ok.event clicked( )
end event

type cbx_redim from u_cbx within w_rotation
integer x = 791
integer y = 404
integer width = 407
integer height = 68
long backcolor = 15780518
boolean enabled = false
string text = "Redimensioner"
end type

event constructor;call super::constructor;if gs_langue = 'an' then
	text = "Resize"
end if

end event

type rb_antih from u_rb within w_rotation
integer x = 791
integer y = 200
integer width = 384
integer height = 68
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Antihoraire"
end type

event constructor;call super::constructor;if gs_langue = 'an' then
	text = "Counterclockwise"
end if

end event

type rb_hor from u_rb within w_rotation
integer x = 791
integer y = 140
integer width = 384
integer height = 68
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Horaire"
boolean checked = true
end type

event constructor;call super::constructor;if gs_langue = 'an' then
	text = "Clockwise"
end if

end event

type sle_angle from u_sle within w_rotation
integer x = 791
integer y = 312
integer width = 384
integer height = 76
integer taborder = 10
boolean enabled = false
end type

type rb_pers from u_rb within w_rotation
integer x = 160
integer y = 388
integer width = 462
integer height = 68
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
string text = "Personnalisé"
end type

event clicked;call super::clicked;gb_ang.enabled = true
rb_hor.enabled = true
rb_antih.enabled = true
sle_angle.enabled = true
cbx_redim.enabled = true

end event

event constructor;call super::constructor;if gs_langue = 'an' then
	text = "Custom"
end if

end event

type rb_180 from u_rb within w_rotation
integer x = 160
integer y = 320
integer width = 462
integer height = 68
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
string text = "180°"
end type

event clicked;call super::clicked;gb_ang.enabled = false
rb_hor.enabled = false
rb_antih.enabled = false
sle_angle.enabled = false
cbx_redim.enabled = false

end event

type rb_90ah from u_rb within w_rotation
integer x = 160
integer y = 252
integer width = 521
integer height = 68
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
string text = "90° antihoraire"
end type

event clicked;call super::clicked;gb_ang.enabled = false
rb_hor.enabled = false
rb_antih.enabled = false
sle_angle.enabled = false
cbx_redim.enabled = false

end event

event constructor;call super::constructor;if gs_langue = 'an' then
	text = "90° counterclockwise"
end if

end event

type rb_90h from u_rb within w_rotation
integer x = 160
integer y = 184
integer width = 462
integer height = 68
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
string text = "90° horaire"
boolean checked = true
end type

event clicked;call super::clicked;gb_ang.enabled = false
rb_hor.enabled = false
rb_antih.enabled = false
sle_angle.enabled = false
cbx_redim.enabled = false

end event

event constructor;call super::constructor;if gs_langue = 'an' then
	text = "90° clockwise"
end if

end event

type cb_ok from commandbutton within w_rotation
integer x = 87
integer y = 816
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
boolean default = true
end type

event clicked;long ll_angle
string ls_res = ""

choose case true
	case rb_90h.checked
		ll_angle = 90
	case rb_90ah.checked
		ll_angle = -90
	case rb_180.checked
		ll_angle = 180
	case rb_pers.checked
		if not isNumber(sle_angle.text) then
			IF gs_langue = "an" THEN
				Messagebox("Wasrning", "You must enter a numeric value.")
			ELSE
				Messagebox("Avertissement", "Veuillez entrer une valeur numérique.")
			END IF
			sle_angle.SetFocus()
			return 0
		end if
		ll_angle = mod(long(sle_angle.text), 360)
		if rb_antih.checked then ll_angle *= -1
		if cbx_redim.checked then ls_res = 'R'
end choose

closeWithReturn(parent, string(ll_angle) + ls_res)

end event

type cb_annuler from commandbutton within w_rotation
integer x = 571
integer y = 812
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event constructor;if gs_langue = 'an' then
	text = 'Cancel'
end if

end event

event clicked;closeWithReturn(parent, "")

end event

type gb_ang from u_gb within w_rotation
integer x = 750
integer y = 72
integer width = 581
integer height = 460
integer taborder = 10
long backcolor = 15780518
boolean enabled = false
string text = "Angle personnalisé"
end type

type rr_1 from roundrectangle within w_rotation
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 18
integer y = 32
integer width = 1399
integer height = 556
integer cornerheight = 40
integer cornerwidth = 46
end type

type gb_sta from u_gb within w_rotation
integer x = 96
integer y = 72
integer width = 594
integer height = 460
integer taborder = 10
long backcolor = 15780518
string text = "Angle standard"
end type

