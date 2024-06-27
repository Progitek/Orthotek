$PBExportHeader$w_activites.srw
forward
global type w_activites from w_child
end type
type cb_print from commandbutton within w_activites
end type
type st_title from statictext within w_activites
end type
type cb_delete from commandbutton within w_activites
end type
type cb_update from commandbutton within w_activites
end type
type dw_activites from u_dw within w_activites
end type
type cb_close from commandbutton within w_activites
end type
type cb_insert from commandbutton within w_activites
end type
end forward

global type w_activites from w_child
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
dw_activites dw_activites
cb_close cb_close
cb_insert cb_insert
end type
global w_activites w_activites

type variables
integer changement=0
end variables

forward prototypes
public subroutine maj ()
end prototypes

event ue_post_open();// Ajuste la disponibilité des boutons
if dw_activites.rowcount() = 0 then
	cb_update.enabled = false
	cb_delete.enabled = false
end if
end event

public subroutine maj ();if dw_activites.Update() = 1 then
	commit using SQLCA;
	dw_activites.retrieve(v_no_ortho)
	changement = 0
	if dw_activites.rowcount() = 0 then
		cb_update.enabled = false
		cb_delete.enabled = false
	end if
else
	rollback using SQLCA;
	error_type(50)
end if

end subroutine

on w_activites.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.st_title=create st_title
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.dw_activites=create dw_activites
this.cb_close=create cb_close
this.cb_insert=create cb_insert
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.dw_activites
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_insert
end on

on w_activites.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.st_title)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.dw_activites)
destroy(this.cb_close)
destroy(this.cb_insert)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

w_activites.postevent('ue_post_open')
end event

type cb_print from commandbutton within w_activites
integer x = 1422
integer y = 1908
integer width = 718
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Imprimer"
end type

event clicked;//datastore ds_typestraitimp
//ds_typestraitimp = create datastore
//ds_typestraitimp.dataobject = "d_typestraitimp"
//ds_typestraitimp.SetTransObject(SQLCA)
//ds_typestraitimp.retrieve(v_no_ortho)
//printsetup()
//ds_typestraitimp.print()
//destroy ds_typestraitimp
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event

type st_title from statictext within w_activites
integer width = 1271
integer height = 80
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Activités"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Activities"
end if
end event

type cb_delete from commandbutton within w_activites
integer x = 727
integer y = 1908
integer width = 695
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;if messagebox("Suppression","Voulez-vous supprimer l'enregistrement?",Question!,YesNo!) = 1 then
	dw_activites.deleterow(dw_activites.getrow())
	changement = 1
end if

end event

event constructor;if v_langue = 'an' then
	cb_delete.Text = "Delete"
end if
end event

type cb_update from commandbutton within w_activites
integer x = 2139
integer y = 1908
integer width = 736
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;maj()

end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Update"
end if
end event

type dw_activites from u_dw within w_activites
integer x = 5
integer y = 92
integer width = 3611
integer height = 1804
integer taborder = 10
string dataobject = "d_activites"
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

event editchanged;changement = 1
end event

event itemchanged;changement = 1
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

settransobject(SQLCA)
setrowfocusindicator(hand!)
retrieve(v_no_ortho)
//if v_langue = 'an' then
//	dw_enregistrement_traitements.object.nip_traitement_t.Text = "Code"
//	dw_enregistrement_traitements.object.nom_traitement_t.Text = "Treatment name"
//	dw_enregistrement_traitements.object.t_1.Text = "Color"
//end if

end event

event rbuttondown;long i

if dwo.name = 'activites' then
	if messagebox('Question','Voulez-vous définir ce choix par défaut?',Question!,OkCancel!,2) = 1 then
		changement = 1
		for i = 1 to dw_activites.rowcount()
			if i = row then
				dw_activites.setitem(i,'defo',1)
			else
				dw_activites.setitem(i,'defo',0)
			end if
		next
	end if
end if
end event

type cb_close from commandbutton within w_activites
integer x = 2875
integer y = 1908
integer width = 745
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;if changement = 1 then
	if error_type(200) = 1 then
		maj()
	end if
end if
Close (parent)
if isvalid(w_dossier_patients) then
	w_dossier_patients.dddw_activite.SetTransObject(SQLCA)
	w_dossier_patients.dddw_activite.retrieve()
end if
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_activites
integer x = 5
integer y = 1908
integer width = 722
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long i,ll_newrow, ll_maxid, ll_id

ll_newrow = dw_activites.InsertRow(0)
dw_activites.ScrollToRow(ll_newrow)
dw_activites.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_activites.setfocus()
//Ajuste ls disponibilité des boutons
if cb_update.enabled = false then cb_update.enabled = true
if cb_delete.enabled = false then cb_delete.enabled = true
end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "Add"
end if
end event

