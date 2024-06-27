$PBExportHeader$w_etatcompte.srw
forward
global type w_etatcompte from w_child
end type
type cb_3 from commandbutton within w_etatcompte
end type
type cb_2 from commandbutton within w_etatcompte
end type
type cb_1 from commandbutton within w_etatcompte
end type
type dw_etatcomptepat from u_dw within w_etatcompte
end type
end forward

global type w_etatcompte from w_child
integer width = 3648
integer height = 2044
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
dw_etatcomptepat dw_etatcomptepat
end type
global w_etatcompte w_etatcompte

type variables
public long  il_patid
end variables

on w_etatcompte.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_etatcomptepat=create dw_etatcomptepat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_etatcomptepat
end on

on w_etatcompte.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_etatcomptepat)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_patid = message.doubleparm
dw_etatcomptepat.retrieve(il_patid)
end event

type cb_3 from commandbutton within w_etatcompte
integer x = 599
integer y = 1928
integer width = 2368
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

type cb_2 from commandbutton within w_etatcompte
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

event clicked;if dw_etatcomptepat.update() = 1 then
	commit;
	datastore ds_etatcomptepat
	ds_etatcomptepat = create datastore
	ds_etatcomptepat.dataobject = "d_etatcomptepat"
	ds_etatcomptepat.SetTransObject(SQLCA)
	ds_etatcomptepat.retrieve(il_patid)
	gb_datawindow = false
	openwithparm(w_print_options,ds_etatcomptepat)
	destroy ds_etatcomptepat
else
	error_type(50)
end if
end event

type cb_1 from commandbutton within w_etatcompte
integer x = 2967
integer y = 1928
integer width = 658
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

type dw_etatcomptepat from u_dw within w_etatcompte
integer x = 23
integer width = 3625
integer height = 1924
integer taborder = 20
string title = "etatcomptepat"
string dataobject = "d_etatcomptepat1"
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

