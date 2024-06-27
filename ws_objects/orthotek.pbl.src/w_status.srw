$PBExportHeader$w_status.srw
forward
global type w_status from w_child
end type
type cb_print from commandbutton within w_status
end type
type cb_transfert from commandbutton within w_status
end type
type cb_delete from commandbutton within w_status
end type
type dw_status from u_dw within w_status
end type
type cb_insert from commandbutton within w_status
end type
type cb_update from commandbutton within w_status
end type
type cb_close from commandbutton within w_status
end type
end forward

global type w_status from w_child
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
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean ib_isupdateable = false
cb_print cb_print
cb_transfert cb_transfert
cb_delete cb_delete
dw_status dw_status
cb_insert cb_insert
cb_update cb_update
cb_close cb_close
end type
global w_status w_status

type variables
int changement=0
private int ii_modeajout = 0 
end variables

forward prototypes
public subroutine save ()
end prototypes

public subroutine save ();if dw_status.update() = 1 then
	commit using SQLCA;
	changement = 0
	ii_modeajout = 0
else
	rollback using SQLCA;
	messagebox("Information","Aucune modification n'a été enregistrée!",information!)
end if
end subroutine

on w_status.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_transfert=create cb_transfert
this.cb_delete=create cb_delete
this.dw_status=create dw_status
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_transfert
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.dw_status
this.Control[iCurrent+5]=this.cb_insert
this.Control[iCurrent+6]=this.cb_update
this.Control[iCurrent+7]=this.cb_close
end on

on w_status.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_transfert)
destroy(this.cb_delete)
destroy(this.dw_status)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_print from commandbutton within w_status
integer x = 1234
integer y = 1920
integer width = 599
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;dw_status.setRedraw(false)
dw_status.object.code.border = 0
dw_status.object.description.border = 0
dw_status.object.prixsugg.border = 0
gb_datawindow = true
openwithparm(w_print_options,dw_status)
dw_status.setRedraw(false)

end event

type cb_transfert from commandbutton within w_status
integer x = 1833
integer y = 1920
integer width = 553
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Transfert"
end type

event clicked;open(w_statustransfert)
end event

type cb_delete from commandbutton within w_status
integer x = 635
integer y = 1920
integer width = 599
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;long row,v_code

row = dw_status.getrow()
v_code = dw_status.getitemnumber(row,'status_id')
if v_code <> 1 then
	dw_status.DeleteRow(row)
	changement = 1
else
	error_type(108)
end if

end event

type dw_status from u_dw within w_status
integer width = 3634
integer height = 1904
integer taborder = 10
string title = "STATUS"
string dataobject = "d_status"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
retrieve(v_no_ortho)
SetRowFocusIndicator(Hand!)
if v_langue = "an" then
	cb_insert.text = "Add"
	cb_delete.text = "Delete"
	cb_update.text = "Update"
	cb_close.text = "Close"
	cb_print.text = "Print"
	dw_status.object.t_1.text = "Suggested price"
	dw_status.object.t_affect.text = "Affects treatment cost"
	this.object.ordrepaie.values = 'Consultation~t1/Records~t2/Bond~t3/Initial~t5/Retainer Fee~t4/Recall~t6/Monthly charge~t7/Consultation 2~t8'
else
	this.object.ordrepaie.values = 'Consultation~t1/Diagnostic~t2/MEB~t3/Initial~t5/Rétention~t4/Rappel~t6/Mensualité~t7/Consultation 2~t8'
end if
end event

event editchanged;changement=1
end event

event itemchanged;changement = 1
end event

event rowfocuschanged;long row,v_code

row = dw_status.getrow()
v_code = dw_status.getitemnumber(row,'status_id')
if v_code = 1 then
	dw_status.modify("code.edit.displayonly = yes")
	dw_status.modify("description.edit.displayonly = yes")
else
	dw_status.modify("code.edit.displayonly = no")
	dw_status.modify("description.edit.displayonly = no")
end if
end event

event updateend;long ll_row, ll_statusid
integer test
if rowsinserted <> 0 then
	ll_row = dw_status.getrow()
	select max(status_id) into :ll_statusid from t_status;
	dw_status.setitem(ll_row,'status_id',ll_statusid)
	if ii_modeajout = 1 then   
     	test = dw_status.setitemstatus(ll_row,'status_id',primary!,notmodified!)
		test = dw_status.setitemstatus(ll_row,'code',primary!,notmodified!)
		test = dw_status.setitemstatus(ll_row,'description',primary!,notmodified!)
		test = dw_status.setitemstatus(ll_row,'affect',primary!,notmodified!)
      test = dw_status.setitemstatus(ll_row,'prixsugg',primary!,notmodified!)
	end if
end if
end event

type cb_insert from commandbutton within w_status
integer x = 14
integer y = 1920
integer width = 622
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long ll_newrow

ll_newrow = dw_status.InsertRow(0)
dw_status.ScrollToRow(ll_newrow)
dw_status.setitem(ll_newrow,'affect',1)
dw_status.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_status.SetFocus()
changement=1
ii_modeajout = 1
end event

type cb_update from commandbutton within w_status
integer x = 2386
integer y = 1920
integer width = 622
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;save()
end event

type cb_close from commandbutton within w_status
integer x = 3008
integer y = 1920
integer width = 622
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;dw_status.AcceptText()
if changement=1 then
	if error_type(200) = 1 then
		save()
	end if
end if
close(parent)
if isvalid(w_dossier_patients) then
	w_dossier_patients.dddw_statut.SetTransObject(SQLCA)
	w_dossier_patients.dddw_statut.retrieve()
end if
end event

