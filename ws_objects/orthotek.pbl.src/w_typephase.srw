$PBExportHeader$w_typephase.srw
forward
global type w_typephase from w_child
end type
type cb_print from commandbutton within w_typephase
end type
type st_title from statictext within w_typephase
end type
type cb_delete from commandbutton within w_typephase
end type
type cb_update from commandbutton within w_typephase
end type
type dw_typephase from u_dw within w_typephase
end type
type cb_close from commandbutton within w_typephase
end type
type cb_insert from commandbutton within w_typephase
end type
end forward

global type w_typephase from w_child
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
cb_print cb_print
st_title st_title
cb_delete cb_delete
cb_update cb_update
dw_typephase dw_typephase
cb_close cb_close
cb_insert cb_insert
end type
global w_typephase w_typephase

type variables
public boolean change = false
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();if dw_typephase.Update() = 1 then
	commit using SQLCA;
	dw_typephase.retrieve(v_no_ortho)
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if

end subroutine

on w_typephase.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.st_title=create st_title
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.dw_typephase=create dw_typephase
this.cb_close=create cb_close
this.cb_insert=create cb_insert
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.dw_typephase
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_insert
end on

on w_typephase.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.st_title)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.dw_typephase)
destroy(this.cb_close)
destroy(this.cb_insert)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

postevent('ue_post_open')
end event

type cb_print from commandbutton within w_typephase
integer x = 1422
integer y = 1924
integer width = 718
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

event clicked;datastore ds_typestraitimp
ds_typestraitimp = create datastore
ds_typestraitimp.dataobject = "d_typestraitimp"
ds_typestraitimp.SetTransObject(SQLCA)
ds_typestraitimp.retrieve(v_no_ortho)
gb_datawindow = false
openwithparm(w_print_options,ds_typestraitimp)
destroy ds_typestraitimp
end event

type st_title from statictext within w_typephase
integer width = 1271
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = " Types de phase"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Phase type"
end if
end event

type cb_delete from commandbutton within w_typephase
integer x = 727
integer y = 1924
integer width = 695
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;long ll_idphase,ll_nb

ll_idphase = dw_typephase.getitemnumber(dw_typephase.getrow(),'id_phase')
select count(*) into :ll_nb from traitements where id_phase = :ll_idphase;
if ll_nb > 0 then
	error_type(150)
else
	if error_type(240) =1 then
		dw_typephase.deleterow(dw_typephase.getrow())
		change = true
	end if
end if
end event

event constructor;if v_langue = 'an' then
	cb_delete.Text = "Delete treatment"
end if
end event

type cb_update from commandbutton within w_typephase
integer x = 2139
integer y = 1924
integer width = 736
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()

end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type dw_typephase from u_dw within w_typephase
integer x = 5
integer y = 84
integer width = 3616
integer height = 1840
integer taborder = 10
string title = "typephase"
string dataobject = "d_typephase"
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

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

settransobject(SQLCA)
//setrowfocusindicator(hand!)
retrieve(v_no_ortho)
//if v_langue = 'an' then
//	dw_enregistrement_traitements.object.nip_traitement_t.Text = "Code"
//	dw_enregistrement_traitements.object.nom_traitement_t.Text = "Treatment name"
//	dw_enregistrement_traitements.object.t_1.Text = "Color"
//end if

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

type cb_close from commandbutton within w_typephase
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

event clicked;if change then
	if error_type(200) = 1 then
		sauve()
	end if
end if
Close (parent)
if isvalid(w_dossier_patients) then
	w_dossier_patients.dddw_phase.SetTransObject(SQLCA)
	w_dossier_patients.dddw_phase.retrieve()
end if
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_typephase
integer x = 5
integer y = 1924
integer width = 722
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long i,ll_newrow, ll_maxid, ll_id

ll_newrow = dw_typephase.InsertRow(0)
dw_typephase.ScrollToRow(ll_newrow)
dw_typephase.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_typephase.SetFocus()
end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "New phase"
end if
end event

