$PBExportHeader$w_patdouble.srw
forward
global type w_patdouble from w_response
end type
type st_title from statictext within w_patdouble
end type
type cb_1 from commandbutton within w_patdouble
end type
type cb_continue from commandbutton within w_patdouble
end type
type dw_patdouble from u_dw within w_patdouble
end type
end forward

global type w_patdouble from w_response
integer width = 2254
boolean center = true
st_title st_title
cb_1 cb_1
cb_continue cb_continue
dw_patdouble dw_patdouble
end type
global w_patdouble w_patdouble

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	cb_continue.text = "Continue"
	st_title.text = "Conflict patient's list"
	dw_patdouble.object.patient_nom_t.text = "Patient's name"
	dw_patdouble.object.new_dossier_t.text = "File"
end if
end subroutine

on w_patdouble.create
int iCurrent
call super::create
this.st_title=create st_title
this.cb_1=create cb_1
this.cb_continue=create cb_continue
this.dw_patdouble=create dw_patdouble
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_title
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_continue
this.Control[iCurrent+4]=this.dw_patdouble
end on

on w_patdouble.destroy
call super::destroy
destroy(this.st_title)
destroy(this.cb_1)
destroy(this.cb_continue)
destroy(this.dw_patdouble)
end on

event open;call super::open;s_pat st_pat

st_pat = message.powerobjectparm
dw_patdouble.retrieve(st_pat.patnom,st_pat.patprenom,st_pat.col)
end event

type st_title from statictext within w_patdouble
integer x = 23
integer y = 28
integer width = 901
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Liste des patients en conflit"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_patdouble
integer x = 5
integer y = 1292
integer width = 1728
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_continue from commandbutton within w_patdouble
integer x = 1737
integer y = 1292
integer width = 498
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Continuer"
end type

event clicked;close(parent)
end event

type dw_patdouble from u_dw within w_patdouble
integer y = 124
integer width = 2226
integer height = 1152
integer taborder = 10
string dataobject = "d_patdouble"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

