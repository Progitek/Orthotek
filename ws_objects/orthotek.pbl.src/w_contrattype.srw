$PBExportHeader$w_contrattype.srw
forward
global type w_contrattype from w_child
end type
type cb_1 from commandbutton within w_contrattype
end type
type dw_contrattype from u_dw within w_contrattype
end type
type cb_word from commandbutton within w_contrattype
end type
type cb_update from commandbutton within w_contrattype
end type
type cb_delete from commandbutton within w_contrattype
end type
type cb_insert from commandbutton within w_contrattype
end type
type cb_close from commandbutton within w_contrattype
end type
type st_title from statictext within w_contrattype
end type
end forward

global type w_contrattype from w_child
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
cb_1 cb_1
dw_contrattype dw_contrattype
cb_word cb_word
cb_update cb_update
cb_delete cb_delete
cb_insert cb_insert
cb_close cb_close
st_title st_title
end type
global w_contrattype w_contrattype

type variables
public boolean change = false
public string is_filename
private string is_corrpath
end variables

on w_contrattype.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_contrattype=create dw_contrattype
this.cb_word=create cb_word
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.cb_close=create cb_close
this.st_title=create st_title
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_contrattype
this.Control[iCurrent+3]=this.cb_word
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.cb_delete
this.Control[iCurrent+6]=this.cb_insert
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.st_title
end on

on w_contrattype.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_contrattype)
destroy(this.cb_word)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.cb_close)
destroy(this.st_title)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

if v_langue = 'an' then
	st_title.text = "Contract type list" 
end if
end event

type cb_1 from commandbutton within w_contrattype
integer x = 1193
integer y = 1924
integer width = 645
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Edition"
end type

event clicked;//is_filename = dw_contrattype.getItemString(dw_contrattype.getRow(),'filename')
//opensheet(w_ententeedit,w_principal,2,layered!)
//w_ententeedit.title = "Entente financière"
//w_ententeedit.il_prov = 1
//// Pour permettre de faire un apercu il faut passer un patient a la fenetre
//long ll_idcontact
//integer li_phase
//
//
//dw_contrattype.event ue_update()
//select id_contact into :ll_idcontact from t_contact where patient_id = :w_patient.il_patid and pat = 1;
//w_ententeedit.il_patid = w_patient.il_patid
//w_ententeedit.il_idphase = 1
//w_ententeedit.il_idcontact = ll_idcontact
//
//w_ententeedit.event ue_post_open()
//w_ententeedit.st_title.event ue_title()
end event

type dw_contrattype from u_dw within w_contrattype
event addrow ( )
event delrow ( long al_row )
event ue_update ( )
integer x = 5
integer y = 92
integer width = 3607
integer height = 1832
integer taborder = 10
string title = "none"
string dataobject = "d_contrattype"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event addrow();long ll_row 

ll_row = insertRow(0)
scrollToRow(ll_row)
setItem(ll_row,'ortho_id',v_no_ortho)
dw_contrattype.setFocus()
change = true
end event

event delrow(long al_row);deleteRow(al_row)
event ue_update()
end event

event ue_update();if update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if
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

event clicked;if dwo.name = 'p_folder' then
	string ls_docpath, ls_docname[]
	
	ChangeDirectory ( is_corrpath )
	if v_langue = 'an' then
		GetFileOpenName("Choose a document file", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC")
	else
		GetFileOpenName("Choisir un document", ls_docpath, ls_docname[], "DOC", "Text Files (*.doc),*.DOC")
	end if
	ChangeDirectory ( "c:\ii4net\orthotek" )
	setItem(row,'filename',ls_docname[1])
	change = true
end if
end event

type cb_word from commandbutton within w_contrattype
integer x = 1842
integer y = 1924
integer width = 576
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_update from commandbutton within w_contrattype
integer x = 2423
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event constructor;if v_langue = 'an' then
	this.text = "Save" 
end if
end event

event clicked;dw_contrattype.event ue_update()
end event

type cb_delete from commandbutton within w_contrattype
integer x = 599
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event constructor;if v_langue = 'an' then
	this.text = "Delete" 
end if
end event

event clicked;dw_contrattype.event delRow(dw_contrattype.getRow())
end event

type cb_insert from commandbutton within w_contrattype
integer x = 5
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event constructor;if v_langue = 'an' then
	this.text = "Add" 
end if
end event

event clicked;dw_contrattype.event addRow()
end event

type cb_close from commandbutton within w_contrattype
integer x = 3017
integer y = 1924
integer width = 594
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

event constructor;if v_langue = 'an' then
	this.text = "Close" 
end if
end event

event clicked;if change then
	if error_type(200) = 1 then
		dw_contrattype.event ue_update()
	end if
end if
close(parent)
end event

type st_title from statictext within w_contrattype
integer width = 1189
integer height = 112
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Liste des types de contrat"
boolean focusrectangle = false
end type

