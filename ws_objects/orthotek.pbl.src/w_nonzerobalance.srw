$PBExportHeader$w_nonzerobalance.srw
forward
global type w_nonzerobalance from w_child
end type
type cb_tous from commandbutton within w_nonzerobalance
end type
type dw_nonzerobalance from u_dw within w_nonzerobalance
end type
type cb_3 from commandbutton within w_nonzerobalance
end type
type cb_print from commandbutton within w_nonzerobalance
end type
end forward

global type w_nonzerobalance from w_child
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
cb_tous cb_tous
dw_nonzerobalance dw_nonzerobalance
cb_3 cb_3
cb_print cb_print
end type
global w_nonzerobalance w_nonzerobalance

type variables
//datastore ds_impsom, ds_implist, ds_impsom1

end variables

on w_nonzerobalance.create
int iCurrent
call super::create
this.cb_tous=create cb_tous
this.dw_nonzerobalance=create dw_nonzerobalance
this.cb_3=create cb_3
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_tous
this.Control[iCurrent+2]=this.dw_nonzerobalance
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_print
end on

on w_nonzerobalance.destroy
call super::destroy
destroy(this.cb_tous)
destroy(this.dw_nonzerobalance)
destroy(this.cb_3)
destroy(this.cb_print)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_tous from commandbutton within w_nonzerobalance
integer x = 1029
integer y = 1908
integer width = 1559
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type dw_nonzerobalance from u_dw within w_nonzerobalance
integer x = 27
integer width = 3579
integer height = 1904
integer taborder = 10
string title = "nonzerobalance"
string dataobject = "d_nonzerobalance"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;string ls_ortho

settransobject(SQLCA)
select dr_nom_complet into :ls_ortho from ortho_id where ortho_id = :v_no_ortho;
this.object.t_ortho.text = ls_ortho
if v_langue = 'an' then
	this.object.t_title.text = 'Aged accounts receivable report'
	this.object.t_pat.text = 'Patients name'
	this.object.t_totfact.text = 'Global cost'
	this.object.t_lastpaie.text = 'Last pay.'
	this.object.t_dueamount.text = 'Due amount'
	this.object.t_pdcnextdate.text = 'Next'
	this.object.t_pdconhand.text = 'On hand'
	this.object.t_balance.text = 'Balance'
	this.object.t_printedon.text = 'Printed on'
end if
retrieve()
end event

event doubleclicked;Opensheetwithparm(w_dossier_patients,getitemnumber(row,'patient_patient_id'),w_principal,2,layered!)
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

type cb_3 from commandbutton within w_nonzerobalance
integer x = 2587
integer y = 1908
integer width = 1019
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

event clicked;//destroy ds_impsom
//destroy ds_implist
//destroy ds_impsom1
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_print from commandbutton within w_nonzerobalance
integer x = 5
integer y = 1908
integer width = 1024
integer height = 112
integer taborder = 10
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
openwithparm(w_print_options,dw_nonzerobalance)

end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

