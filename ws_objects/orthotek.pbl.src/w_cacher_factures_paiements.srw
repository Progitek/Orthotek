$PBExportHeader$w_cacher_factures_paiements.srw
forward
global type w_cacher_factures_paiements from w_child
end type
type st_3 from statictext within w_cacher_factures_paiements
end type
type cb_1 from commandbutton within w_cacher_factures_paiements
end type
type cb_close from commandbutton within w_cacher_factures_paiements
end type
type dw_cacher_factures_paiements from u_dw within w_cacher_factures_paiements
end type
end forward

global type w_cacher_factures_paiements from w_child
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
st_3 st_3
cb_1 cb_1
cb_close cb_close
dw_cacher_factures_paiements dw_cacher_factures_paiements
end type
global w_cacher_factures_paiements w_cacher_factures_paiements

type variables

end variables

on w_cacher_factures_paiements.create
int iCurrent
call super::create
this.st_3=create st_3
this.cb_1=create cb_1
this.cb_close=create cb_close
this.dw_cacher_factures_paiements=create dw_cacher_factures_paiements
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.dw_cacher_factures_paiements
end on

on w_cacher_factures_paiements.destroy
call super::destroy
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.dw_cacher_factures_paiements)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

dw_cacher_factures_paiements.retrieve(message.doubleparm)
end event

type st_3 from statictext within w_cacher_factures_paiements
integer x = 41
integer y = 36
integer width = 1019
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vérification des transactions"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_cacher_factures_paiements
integer x = 5
integer y = 1900
integer width = 2834
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_close from commandbutton within w_cacher_factures_paiements
integer x = 2843
integer y = 1900
integer width = 795
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type dw_cacher_factures_paiements from u_dw within w_cacher_factures_paiements
integer x = 59
integer y = 148
integer width = 3570
integer height = 1744
integer taborder = 20
string title = "cacher_factures_paiements"
string dataobject = "d_cacher_factures_paiements"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_cacher_factures_paiements.SetTransObject(SQLCA)


end event

event editchanged;int v_cache

v_cache = dw_cacher_factures_paiements.getitemnumber(dw_cacher_factures_paiements.getrow(),'factures_traitements_cache')
dw_cacher_factures_paiements.setitem(dw_cacher_factures_paiements.getrow(),'paiement_cache',v_cache)
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

