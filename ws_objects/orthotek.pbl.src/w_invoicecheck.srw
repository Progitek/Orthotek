$PBExportHeader$w_invoicecheck.srw
forward
global type w_invoicecheck from w_child
end type
type cb_print from commandbutton within w_invoicecheck
end type
type dw_factures_check from u_dw within w_invoicecheck
end type
type cb_close from commandbutton within w_invoicecheck
end type
end forward

global type w_invoicecheck from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_print cb_print
dw_factures_check dw_factures_check
cb_close cb_close
end type
global w_invoicecheck w_invoicecheck

type variables
private long il_idtrait
end variables

on w_invoicecheck.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.dw_factures_check=create dw_factures_check
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.dw_factures_check
this.Control[iCurrent+3]=this.cb_close
end on

on w_invoicecheck.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.dw_factures_check)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_print from commandbutton within w_invoicecheck
integer x = 1920
integer y = 1900
integer width = 832
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Aperçu"
end type

event clicked;if dw_factures_check.update() = 1 then
	commit using sqlca;
	Opensheetwithparm(w_invoice,il_idtrait,w_principal,2,layered!)
else
	error_type(50)
	rollback;
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Preview'
end if
end event

type dw_factures_check from u_dw within w_invoicecheck
integer x = 800
integer width = 1888
integer height = 1892
integer taborder = 20
string title = "factures_check"
string dataobject = "d_factures_check"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
il_idtrait = message.doubleparm
retrieve(il_idtrait)
if v_langue = 'an' then
	this.object.t_datefact.text = 'Invoice date'
	this.object.t_montant.text = 'Amount'
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

type cb_close from commandbutton within w_invoicecheck
integer x = 2757
integer y = 1900
integer width = 832
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

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

