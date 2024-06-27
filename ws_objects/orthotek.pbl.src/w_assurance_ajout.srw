$PBExportHeader$w_assurance_ajout.srw
forward
global type w_assurance_ajout from w_child
end type
type cb_print from commandbutton within w_assurance_ajout
end type
type st_title from statictext within w_assurance_ajout
end type
type dw_assurance_ajout from u_dw within w_assurance_ajout
end type
type cb_close from commandbutton within w_assurance_ajout
end type
type cb_update from commandbutton within w_assurance_ajout
end type
type cb_delete from commandbutton within w_assurance_ajout
end type
type cb_insert from commandbutton within w_assurance_ajout
end type
end forward

global type w_assurance_ajout from w_child
integer x = 5
integer y = 92
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
cb_print cb_print
st_title st_title
dw_assurance_ajout dw_assurance_ajout
cb_close cb_close
cb_update cb_update
cb_delete cb_delete
cb_insert cb_insert
end type
global w_assurance_ajout w_assurance_ajout

type variables
int vchange = 0
private int ii_modeajout = 0
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();//dw_assurance_ajout.AcceptText()
if dw_assurance_ajout.update() = 1 then
	ii_modeajout = 0
	commit;
else
	error_type(0)
	rollback;
end if
end subroutine

on w_assurance_ajout.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.st_title=create st_title
this.dw_assurance_ajout=create dw_assurance_ajout
this.cb_close=create cb_close
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.dw_assurance_ajout
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_update
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.cb_insert
end on

on w_assurance_ajout.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.st_title)
destroy(this.dw_assurance_ajout)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_insert)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_print from commandbutton within w_assurance_ajout
integer x = 1449
integer y = 1908
integer width = 722
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

event clicked;datastore ds_condass
ds_condass = create datastore
ds_condass.dataobject = "d_assurance_ajoutlistimp"
ds_condass.SetTransObject(SQLCA)
ds_condass.retrieve(v_no_ortho)
//printsetup()
//ds_condass.print()
gb_datawindow = false
openwithparm(w_print_options,ds_condass)
destroy ds_condass
	

end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type st_title from statictext within w_assurance_ajout
integer width = 1024
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Conditions de traitement"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Treatment Condition'
end if
end event

type dw_assurance_ajout from u_dw within w_assurance_ajout
integer x = 32
integer y = 88
integer width = 3589
integer height = 1804
integer taborder = 10
string title = "none"
string dataobject = "d_assurance_ajout"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;settransobject(SQLCA)
retrieve(v_no_ortho)
end event

event updateend;long ll_row, ll_assuranceid
integer test
if rowsinserted <> 0 then
	ll_row = dw_assurance_ajout.getrow()
	select max(id) into :ll_assuranceid from t_assurance;
	dw_assurance_ajout.setitem(ll_row,'id',ll_assuranceid)
	if ii_modeajout = 1 then   
     	test = dw_assurance_ajout.setitemstatus(ll_row,'id',primary!,notmodified!)
		test = dw_assurance_ajout.setitemstatus(ll_row,'code',primary!,notmodified!)
		test = dw_assurance_ajout.setitemstatus(ll_row,'description',primary!,notmodified!)
		test = dw_assurance_ajout.setitemstatus(ll_row,'langue',primary!,notmodified!)
      test = dw_assurance_ajout.setitemstatus(ll_row,'ortho_id',primary!,notmodified!)
	end if
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

type cb_close from commandbutton within w_assurance_ajout
integer x = 2898
integer y = 1908
integer width = 722
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if vchange = 1 then
   if error_type(200) = 1 then
	   sauve()
   end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_update from commandbutton within w_assurance_ajout
integer x = 2171
integer y = 1908
integer width = 722
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()
vchange = 0
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_delete from commandbutton within w_assurance_ajout
integer x = 727
integer y = 1908
integer width = 722
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;if messagebox('','Êtes-vous sûr de vouloir effacer cette condition?',QUESTION!,YESNO!) = 1 then
   dw_assurance_ajout.deleterow(dw_assurance_ajout.getrow())
	sauve()
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_insert from commandbutton within w_assurance_ajout
integer x = 5
integer y = 1908
integer width = 722
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long ll_row
ll_row = dw_assurance_ajout.insertrow(0)
dw_assurance_ajout.scrolltorow(ll_row)
dw_assurance_ajout.setfocus()
dw_assurance_ajout.setitem(ll_row,'ortho_id',v_no_ortho)
vchange = 1
ii_modeajout = 1
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

