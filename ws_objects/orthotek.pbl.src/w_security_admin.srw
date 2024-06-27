$PBExportHeader$w_security_admin.srw
forward
global type w_security_admin from window
end type
type cb_update2 from commandbutton within w_security_admin
end type
type cb_update1 from commandbutton within w_security_admin
end type
type dw_security_admin2 from u_dw within w_security_admin
end type
type dw_security_admin1 from u_dw within w_security_admin
end type
type cb_insert from commandbutton within w_security_admin
end type
type cb_delete from commandbutton within w_security_admin
end type
type cb_update from commandbutton within w_security_admin
end type
type dw_security_admin from u_dw within w_security_admin
end type
type cb_close from commandbutton within w_security_admin
end type
type gb_1 from groupbox within w_security_admin
end type
type gb_2 from groupbox within w_security_admin
end type
type gb_3 from groupbox within w_security_admin
end type
end forward

global type w_security_admin from window
integer width = 3643
integer height = 2044
windowtype windowtype = response!
long backcolor = 67108864
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean center = true
cb_update2 cb_update2
cb_update1 cb_update1
dw_security_admin2 dw_security_admin2
dw_security_admin1 dw_security_admin1
cb_insert cb_insert
cb_delete cb_delete
cb_update cb_update
dw_security_admin dw_security_admin
cb_close cb_close
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_security_admin w_security_admin

type variables
public int changement = 0
end variables

on w_security_admin.create
this.cb_update2=create cb_update2
this.cb_update1=create cb_update1
this.dw_security_admin2=create dw_security_admin2
this.dw_security_admin1=create dw_security_admin1
this.cb_insert=create cb_insert
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.dw_security_admin=create dw_security_admin
this.cb_close=create cb_close
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_update2,&
this.cb_update1,&
this.dw_security_admin2,&
this.dw_security_admin1,&
this.cb_insert,&
this.cb_delete,&
this.cb_update,&
this.dw_security_admin,&
this.cb_close,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_security_admin.destroy
destroy(this.cb_update2)
destroy(this.cb_update1)
destroy(this.dw_security_admin2)
destroy(this.dw_security_admin1)
destroy(this.cb_insert)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.dw_security_admin)
destroy(this.cb_close)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;dw_security_admin.retrieve()
end event

type cb_update2 from commandbutton within w_security_admin
integer x = 3008
integer y = 1720
integer width = 590
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;if dw_security_admin2.update() = 1 then
	commit;
else
	rollback;
end if
changement = 0
end event

type cb_update1 from commandbutton within w_security_admin
integer x = 3008
integer y = 1092
integer width = 590
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;if dw_security_admin1.update() = 1 then
	commit;
else
	rollback;
end if
changement = 0
end event

type dw_security_admin2 from u_dw within w_security_admin
integer x = 32
integer y = 1332
integer width = 2953
integer height = 608
integer taborder = 30
string title = "security_admin2"
string dataobject = "d_security_admin2"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
Retrieve()
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

type dw_security_admin1 from u_dw within w_security_admin
integer x = 32
integer y = 804
integer width = 2953
integer height = 424
integer taborder = 20
string title = "security_admin1"
string dataobject = "d_security_admin1"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
Retrieve()
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

type cb_insert from commandbutton within w_security_admin
integer x = 3008
integer y = 296
integer width = 590
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long ll_newrow

ll_newrow = dw_security_admin.InsertRow(0)
dw_security_admin.setitem(ll_newrow,'langue','fr')
dw_security_admin.ScrollToRow(ll_newrow)

changement = 1
end event

type cb_delete from commandbutton within w_security_admin
integer x = 3008
integer y = 412
integer width = 590
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_security_admin.DeleteRow(dw_security_admin.getrow())
if dw_security_admin.Update() = 1 then
	commit;
else
	rollback;
end if
end event

type cb_update from commandbutton within w_security_admin
integer x = 3008
integer y = 528
integer width = 590
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;if dw_security_admin.update() = 1 then
	commit;
else
	rollback;
end if
changement = 0
end event

type dw_security_admin from u_dw within w_security_admin
integer x = 32
integer y = 84
integer width = 2953
integer height = 624
integer taborder = 10
string title = "security_admin"
string dataobject = "d_security_admin"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_security_admin.SetTransObject(sqlca)
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

type cb_close from commandbutton within w_security_admin
integer x = 3008
integer y = 1836
integer width = 590
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type gb_1 from groupbox within w_security_admin
integer y = 1252
integer width = 2999
integer height = 704
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Personnel(s)"
end type

type gb_2 from groupbox within w_security_admin
integer y = 728
integer width = 2999
integer height = 524
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Orthodontiste(s)"
end type

type gb_3 from groupbox within w_security_admin
integer width = 2999
integer height = 720
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Fenetre de gestion de la securite systeme"
end type

