$PBExportHeader$w_proctrait.srw
forward
global type w_proctrait from w_child
end type
type pb_proclast from picturebutton within w_proctrait
end type
type pb_procnext from picturebutton within w_proctrait
end type
type pb_procfirst from picturebutton within w_proctrait
end type
type pb_procprior from picturebutton within w_proctrait
end type
type dw_procedure from u_dw within w_proctrait
end type
type st_removeall from statictext within w_proctrait
end type
type st_include from statictext within w_proctrait
end type
type st_remove from statictext within w_proctrait
end type
type dw_typetraitproc from u_dw within w_proctrait
end type
type pb_removeall from picturebutton within w_proctrait
end type
type pb_include from picturebutton within w_proctrait
end type
type pb_remove from picturebutton within w_proctrait
end type
type dw_proctrait from u_dw within w_proctrait
end type
type st_title from statictext within w_proctrait
end type
type cb_insert from commandbutton within w_proctrait
end type
type cb_update from commandbutton within w_proctrait
end type
type cb_delete from commandbutton within w_proctrait
end type
type cb_close from commandbutton within w_proctrait
end type
end forward

global type w_proctrait from w_child
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
string icon = "AppIcon!"
boolean ib_isupdateable = false
pb_proclast pb_proclast
pb_procnext pb_procnext
pb_procfirst pb_procfirst
pb_procprior pb_procprior
dw_procedure dw_procedure
st_removeall st_removeall
st_include st_include
st_remove st_remove
dw_typetraitproc dw_typetraitproc
pb_removeall pb_removeall
pb_include pb_include
pb_remove pb_remove
dw_proctrait dw_proctrait
st_title st_title
cb_insert cb_insert
cb_update cb_update
cb_delete cb_delete
cb_close cb_close
end type
global w_proctrait w_proctrait

type variables
private long il_idproc
public boolean change = false
end variables

on w_proctrait.create
int iCurrent
call super::create
this.pb_proclast=create pb_proclast
this.pb_procnext=create pb_procnext
this.pb_procfirst=create pb_procfirst
this.pb_procprior=create pb_procprior
this.dw_procedure=create dw_procedure
this.st_removeall=create st_removeall
this.st_include=create st_include
this.st_remove=create st_remove
this.dw_typetraitproc=create dw_typetraitproc
this.pb_removeall=create pb_removeall
this.pb_include=create pb_include
this.pb_remove=create pb_remove
this.dw_proctrait=create dw_proctrait
this.st_title=create st_title
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_proclast
this.Control[iCurrent+2]=this.pb_procnext
this.Control[iCurrent+3]=this.pb_procfirst
this.Control[iCurrent+4]=this.pb_procprior
this.Control[iCurrent+5]=this.dw_procedure
this.Control[iCurrent+6]=this.st_removeall
this.Control[iCurrent+7]=this.st_include
this.Control[iCurrent+8]=this.st_remove
this.Control[iCurrent+9]=this.dw_typetraitproc
this.Control[iCurrent+10]=this.pb_removeall
this.Control[iCurrent+11]=this.pb_include
this.Control[iCurrent+12]=this.pb_remove
this.Control[iCurrent+13]=this.dw_proctrait
this.Control[iCurrent+14]=this.st_title
this.Control[iCurrent+15]=this.cb_insert
this.Control[iCurrent+16]=this.cb_update
this.Control[iCurrent+17]=this.cb_delete
this.Control[iCurrent+18]=this.cb_close
end on

on w_proctrait.destroy
call super::destroy
destroy(this.pb_proclast)
destroy(this.pb_procnext)
destroy(this.pb_procfirst)
destroy(this.pb_procprior)
destroy(this.dw_procedure)
destroy(this.st_removeall)
destroy(this.st_include)
destroy(this.st_remove)
destroy(this.dw_typetraitproc)
destroy(this.pb_removeall)
destroy(this.pb_include)
destroy(this.pb_remove)
destroy(this.dw_proctrait)
destroy(this.st_title)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type pb_proclast from picturebutton within w_proctrait
integer x = 1536
integer y = 160
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRLast!"
alignment htextalign = left!
end type

event clicked;dw_procedure.ScrollToRow(dw_procedure.rowcount())
end event

type pb_procnext from picturebutton within w_proctrait
integer x = 1413
integer y = 160
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRNext!"
alignment htextalign = left!
end type

event clicked;dw_procedure.ScrollNextRow()
end event

type pb_procfirst from picturebutton within w_proctrait
integer x = 18
integer y = 160
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "VCRFirst!"
alignment htextalign = left!
end type

event clicked;dw_procedure.ScrollToRow(1)
end event

type pb_procprior from picturebutton within w_proctrait
integer x = 137
integer y = 160
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRPrior!"
alignment htextalign = left!
end type

event clicked;dw_procedure.scrollpriorrow()
end event

type dw_procedure from u_dw within w_proctrait
event ue_insert ( )
integer x = 270
integer y = 156
integer width = 1115
integer height = 92
integer taborder = 30
string title = "procedure"
string dataobject = "d_procedure"
end type

event ue_insert();open(w_procadd)
retrieve(v_no_ortho)
SetFocus()
end event

event constructor;SetTransObject(SQLCA)
dw_proctrait.setTransObject(SQLCA)
Retrieve(v_no_ortho)
SetRowFocusIndicator(FocusRect!)
end event

event rowfocuschanged;il_idproc = getitemnumber(currentrow,'id_proc')
//messagebox('il_idproc',string(il_idproc))
dw_proctrait.event ue_retrieve()
end event

type st_removeall from statictext within w_proctrait
integer x = 1701
integer y = 772
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Enlever tout"
boolean focusrectangle = false
end type

type st_include from statictext within w_proctrait
integer x = 1701
integer y = 276
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Inclure"
boolean focusrectangle = false
end type

type st_remove from statictext within w_proctrait
integer x = 1701
integer y = 520
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Enlever"
boolean focusrectangle = false
end type

type dw_typetraitproc from u_dw within w_proctrait
integer x = 2103
integer y = 116
integer width = 1486
integer height = 1788
integer taborder = 20
string title = "typetraitproc"
string dataobject = "d_typetraitproc"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
Retrieve(v_no_ortho)
SetRowFocusIndicator(FocusRect!)
end event

type pb_removeall from picturebutton within w_proctrait
integer x = 1760
integer y = 852
integer width = 224
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Custom094!"
alignment htextalign = left!
end type

event clicked;dw_proctrait.event ue_deleteall()
end event

type pb_include from picturebutton within w_proctrait
integer x = 1760
integer y = 356
integer width = 224
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
alignment htextalign = left!
end type

event clicked;dw_proctrait.event ue_insert()
end event

type pb_remove from picturebutton within w_proctrait
integer x = 1760
integer y = 608
integer width = 224
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
alignment htextalign = left!
end type

event clicked;dw_proctrait.event ue_delete()
end event

type dw_proctrait from u_dw within w_proctrait
event ue_insert ( )
event ue_delete ( )
event ue_retrieve ( )
event ue_deleteall ( )
integer x = 14
integer y = 276
integer width = 1623
integer height = 1632
integer taborder = 10
string title = "proctrait"
string dataobject = "d_proctrait"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insert();long ll_row,ll_idtrait

ll_idtrait = dw_typetraitproc.getitemnumber(dw_typetraitproc.getrow(),'type_traitement_id')
if ll_idtrait > 0 then
	Insert Into t_proctrait(type_traitement_id,id_proc) values(:ll_idtrait,:il_idproc);
	error_type(-1)
	event ue_retrieve()
end if
end event

event ue_delete();long ll_idtrait

ll_idtrait = getitemnumber(getrow(),'type_traitement_id')
if ll_idtrait > 0 then
	delete from t_proctrait where type_traitement_id = :ll_idtrait;
	if error_type(-1) = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
	event ue_retrieve()
end if
end event

event ue_retrieve();Retrieve(il_idproc)
end event

event ue_deleteall();if il_idproc > 0 then
	delete from t_proctrait where id_proc = :il_idproc;
	if error_type(-1) = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
	event ue_retrieve()
end if
end event

event constructor;SetRowFocusIndicator(FocusRect!)
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

type st_title from statictext within w_proctrait
integer width = 3589
integer height = 84
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Traitements prévus pour la procédure:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'List of subjects'
end if
end event

type cb_insert from commandbutton within w_proctrait
integer x = 14
integer y = 1920
integer width = 1093
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter une nouvelle procédure"
end type

event clicked;dw_procedure.event ue_insert()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type cb_update from commandbutton within w_proctrait
integer x = 1979
integer y = 1920
integer width = 846
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

event clicked;//dw_sujet.event ue_update()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_delete from commandbutton within w_proctrait
integer x = 1111
integer y = 1920
integer width = 869
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Éliminer la procédure"
end type

event clicked;//dw_sujet.event ue_delete(dw_sujet.getRow())
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_close from commandbutton within w_proctrait
integer x = 2825
integer y = 1920
integer width = 773
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;//if change then
//	if error_type(200) = 1 then
//		dw_sujet.event ue_update()
//	end if
//end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

