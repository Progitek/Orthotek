$PBExportHeader$w_sujet.srw
forward
global type w_sujet from w_child
end type
type dw_sujet from u_dw within w_sujet
end type
type st_title from statictext within w_sujet
end type
type cb_insert from commandbutton within w_sujet
end type
type cb_update from commandbutton within w_sujet
end type
type cb_delete from commandbutton within w_sujet
end type
type cb_2 from commandbutton within w_sujet
end type
type cb_close from commandbutton within w_sujet
end type
end forward

global type w_sujet from w_child
integer x = 214
integer y = 221
integer width = 3630
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
dw_sujet dw_sujet
st_title st_title
cb_insert cb_insert
cb_update cb_update
cb_delete cb_delete
cb_2 cb_2
cb_close cb_close
end type
global w_sujet w_sujet

type variables
private boolean change = false
private string is_corrpath
end variables

on w_sujet.create
int iCurrent
call super::create
this.dw_sujet=create dw_sujet
this.st_title=create st_title
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_2=create cb_2
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sujet
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.cb_insert
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.cb_delete
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_close
end on

on w_sujet.destroy
call super::destroy
destroy(this.dw_sujet)
destroy(this.st_title)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_2)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type dw_sujet from u_dw within w_sujet
event ue_insert ( )
event ue_update ( )
event ue_delete ( long row )
integer x = 14
integer y = 96
integer width = 3598
integer height = 1812
integer taborder = 10
string title = "Sujets"
string dataobject = "d_sujetenter"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insert();long ll_row

ll_row = insertRow(0)
scrollToRow(ll_row)
setItem(ll_row,'ortho_id',v_no_ortho)
change = true
end event

event ue_update();if change then
	if update() = 1 then
		commit using SQLCA;
		change = false
	else
		rollback using SQLCA;
		error_type(50)
	end if
end if
end event

event ue_delete(long row);deleteRow(row)
change = true
event ue_update()
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

select corrpath into :is_corrpath from t_options where ortho_id = :v_no_ortho;

setTransObject(SQLCA)
setRowFocusINdicator(hand!)
retrieve(v_no_ortho)
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

event clicked;string ls_docpath, ls_docname[]

change = true
AcceptText()

CHOOSE CASE dwo.name 
		
	CASE 'p_folder' 
	
		ChangeDirectory ( is_corrpath )
		if v_langue = 'an' then
			if GetFileOpenName("Choose a document file", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		else
			if GetFileOpenName("Choisir un document", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		end if
		ChangeDirectory ( "c:\ii4net\orthotek" )
		setItem(row,'filename',ls_docpath)
		
	CASE 'p_folder2'
		
		ChangeDirectory ( is_corrpath )
		if v_langue = 'an' then
			if GetFileOpenName("Choose a document file", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		else
			if GetFileOpenName("Choisir un document", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		end if
		ChangeDirectory ( "c:\ii4net\orthotek" )
		setItem(row,'filenamean', ls_docpath)
	
	CASE 'p_folder3'
		
		ChangeDirectory ( is_corrpath )
		if v_langue = 'an' then
			if GetFileOpenName("Choose a document file", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		else
			if GetFileOpenName("Choisir un document", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		end if
		ChangeDirectory ( "c:\ii4net\orthotek" )
		setItem(row,'filename_patient', ls_docpath)
		
	CASE 'p_folder4'
		
		ChangeDirectory ( is_corrpath )
		if v_langue = 'an' then
			if GetFileOpenName("Choose a document file", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		else
			if GetFileOpenName("Choisir un document", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC") <= 0 then return 0
		end if
		ChangeDirectory ( "c:\ii4net\orthotek" )
		setItem(row,'filename_patient_an', ls_docpath)
	
END CHOOSE
end event

type st_title from statictext within w_sujet
integer width = 983
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Liste des sujets"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'List of subjects'
end if
end event

type cb_insert from commandbutton within w_sujet
integer x = 14
integer y = 1920
integer width = 617
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;dw_sujet.event ue_insert()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type cb_update from commandbutton within w_sujet
integer x = 2327
integer y = 1920
integer width = 635
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;//dw_sujet.AcceptText()
dw_sujet.event ue_update()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_delete from commandbutton within w_sujet
integer x = 631
integer y = 1920
integer width = 617
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_sujet.event ue_delete(dw_sujet.getRow())
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_2 from commandbutton within w_sujet
integer x = 1248
integer y = 1920
integer width = 1079
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_close from commandbutton within w_sujet
integer x = 2962
integer y = 1920
integer width = 635
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

event clicked;if change then
	if error_type(200) = 1 then
		dw_sujet.event ue_update()
	end if
end if
close(parent)
if isvalid(w_description) then
	w_description.dddw_sujet.settransobject(sqlca)
	w_description.dddw_sujet.retrieve(v_no_ortho)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

