$PBExportHeader$w_agedescomptes.srw
forward
global type w_agedescomptes from w_child
end type
type cb_3 from commandbutton within w_agedescomptes
end type
type cb_2 from commandbutton within w_agedescomptes
end type
type cb_1 from commandbutton within w_agedescomptes
end type
type dw_etatcompte from u_dw within w_agedescomptes
end type
end forward

global type w_agedescomptes from w_child
integer width = 3611
integer height = 2012
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
boolean ib_isupdateable = false
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_etatcompte dw_etatcompte
end type
global w_agedescomptes w_agedescomptes

type variables
public long  il_patid
end variables

on w_agedescomptes.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_etatcompte=create dw_etatcompte
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_etatcompte
end on

on w_agedescomptes.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_etatcompte)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_patid = message.doubleparm
dw_etatcompte.retrieve(il_patid)
end event

type cb_3 from commandbutton within w_agedescomptes
integer x = 599
integer y = 1928
integer width = 2505
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_2 from commandbutton within w_agedescomptes
integer x = 14
integer y = 1928
integer width = 585
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_etatcompte)
end event

type cb_1 from commandbutton within w_agedescomptes
integer x = 3104
integer y = 1928
integer width = 503
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type dw_etatcompte from u_dw within w_agedescomptes
integer width = 3598
integer height = 1920
integer taborder = 20
string dataobject = "d_etatcompte"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;settransobject(SQLCA)
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

