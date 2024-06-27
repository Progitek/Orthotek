$PBExportHeader$w_compteapercevoir.srw
forward
global type w_compteapercevoir from w_child
end type
type cb_1 from commandbutton within w_compteapercevoir
end type
type dw_compteapercevoir from u_dw within w_compteapercevoir
end type
type cb_close from commandbutton within w_compteapercevoir
end type
type cb_print from commandbutton within w_compteapercevoir
end type
end forward

global type w_compteapercevoir from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean ib_isupdateable = false
event ue_post_open ( )
cb_1 cb_1
dw_compteapercevoir dw_compteapercevoir
cb_close cb_close
cb_print cb_print
end type
global w_compteapercevoir w_compteapercevoir

type variables
public boolean change = false
end variables

on w_compteapercevoir.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_compteapercevoir=create dw_compteapercevoir
this.cb_close=create cb_close
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_compteapercevoir
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_print
end on

on w_compteapercevoir.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_compteapercevoir)
destroy(this.cb_close)
destroy(this.cb_print)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

postevent('ue_post_open')
end event

type cb_1 from commandbutton within w_compteapercevoir
integer x = 722
integer y = 1924
integer width = 2153
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type dw_compteapercevoir from u_dw within w_compteapercevoir
integer x = 5
integer width = 3616
integer height = 1924
integer taborder = 10
string title = "compteapercevoir"
string dataobject = "d_compteapercevoir"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the eror message
RETURN 1

end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event constructor;settransobject(SQLCA)
retrieve(v_no_ortho)
if v_langue = 'an' then
	this.object.t_title.Text = "To collect account"
	this.object.t_pat.Text = "Patient name"
	this.object.t_percevoir.Text = "To collect"
	this.object.t_qtycpd.Text = "PDC Qty"
	this.object.t_totcpd.Text = "PDC Amount"
	this.object.t_printedon.Text = "Printed on "
end if

end event

event rbuttondown;//long i
//
//if dwo.name = 'phase' then
//	if error_type(239) = 1 then
//		change = true
//		for i = 1 to dw_typephase.rowcount()
//			if i = row then
//				dw_typephase.setitem(i,'defo',1)
//			else
//				dw_typephase.setitem(i,'defo',0)
//			end if
//		next
//	end if
//end if
end event

event clicked;//ouvrir le dossier patient
if dwo.name = 'compute_1' then
	Opensheetwithparm(w_dossier_patients,getitemnumber(row,'patient_patient_id'),w_principal,2,layered! )
end if
end event

type cb_close from commandbutton within w_compteapercevoir
integer x = 2875
integer y = 1924
integer width = 745
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close (parent)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_print from commandbutton within w_compteapercevoir
integer x = 5
integer y = 1924
integer width = 718
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_compteapercevoir)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

