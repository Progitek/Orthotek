$PBExportHeader$w_cacher_factures_rapport.srw
forward
global type w_cacher_factures_rapport from w_child
end type
type cb_retrieve from commandbutton within w_cacher_factures_rapport
end type
type st_3 from statictext within w_cacher_factures_rapport
end type
type st_2 from statictext within w_cacher_factures_rapport
end type
type em_fin from editmask within w_cacher_factures_rapport
end type
type em_debut from editmask within w_cacher_factures_rapport
end type
type cb_print from commandbutton within w_cacher_factures_rapport
end type
type dw_cacher_factures_rapport from u_dw within w_cacher_factures_rapport
end type
type st_1 from statictext within w_cacher_factures_rapport
end type
type cb_close from commandbutton within w_cacher_factures_rapport
end type
end forward

global type w_cacher_factures_rapport from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_retrieve cb_retrieve
st_3 st_3
st_2 st_2
em_fin em_fin
em_debut em_debut
cb_print cb_print
dw_cacher_factures_rapport dw_cacher_factures_rapport
st_1 st_1
cb_close cb_close
end type
global w_cacher_factures_rapport w_cacher_factures_rapport

on w_cacher_factures_rapport.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.st_3=create st_3
this.st_2=create st_2
this.em_fin=create em_fin
this.em_debut=create em_debut
this.cb_print=create cb_print
this.dw_cacher_factures_rapport=create dw_cacher_factures_rapport
this.st_1=create st_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_fin
this.Control[iCurrent+5]=this.em_debut
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.dw_cacher_factures_rapport
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_close
end on

on w_cacher_factures_rapport.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.cb_print)
destroy(this.dw_cacher_factures_rapport)
destroy(this.st_1)
destroy(this.cb_close)
end on

event open;date debut, fin

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

debut = date('01-01-1900')
fin = date('31-12-3000')
dw_cacher_factures_rapport.retrieve(v_no_ortho,debut,fin)
end event

type cb_retrieve from commandbutton within w_cacher_factures_rapport
integer x = 773
integer y = 1888
integer width = 777
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)
dw_cacher_factures_rapport.retrieve(v_no_ortho,debut,fin)
end event

type st_3 from statictext within w_cacher_factures_rapport
integer x = 1605
integer y = 1904
integer width = 91
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cacher_factures_rapport
integer x = 2249
integer y = 1904
integer width = 101
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "au:"
boolean focusrectangle = false
end type

type em_fin from editmask within w_cacher_factures_rapport
integer x = 2363
integer y = 1884
integer width = 480
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

type em_debut from editmask within w_cacher_factures_rapport
integer x = 1723
integer y = 1884
integer width = 480
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

type cb_print from commandbutton within w_cacher_factures_rapport
integer x = 9
integer y = 1888
integer width = 763
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_cacher_factures_rapport)

end event

type dw_cacher_factures_rapport from u_dw within w_cacher_factures_rapport
integer x = 18
integer y = 96
integer width = 3589
integer height = 1776
integer taborder = 10
string title = "cacher_factures_rapport"
string dataobject = "d_cacher_factures_rapport"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_cacher_factures_rapport.SetTransObject(SQLCA)

if v_langue = 'an' then
dw_cacher_factures_rapport.object.date_paiement_t.text = 'Payment date'
dw_cacher_factures_rapport.object.montant_recu_t.text = 'Amount'
dw_cacher_factures_rapport.object.t_3.text = 'Quantity'
end if
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

type st_1 from statictext within w_cacher_factures_rapport
integer y = 4
integer width = 1221
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Compte spéciaux rapport"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_cacher_factures_rapport
integer x = 2853
integer y = 1884
integer width = 754
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

