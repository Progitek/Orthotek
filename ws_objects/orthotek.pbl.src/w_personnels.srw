$PBExportHeader$w_personnels.srw
forward
global type w_personnels from w_child
end type
type rb_sign from radiobutton within w_personnels
end type
type rb_users from radiobutton within w_personnels
end type
type rb_all from radiobutton within w_personnels
end type
type cb_feuiltemps from commandbutton within w_personnels
end type
type dw_personnelshor from u_dw within w_personnels
end type
type dw_personnelsmaster from u_dw within w_personnels
end type
type cb_delete from commandbutton within w_personnels
end type
type dw_personnel from u_dw within w_personnels
end type
type st_title from statictext within w_personnels
end type
type cb_update from commandbutton within w_personnels
end type
type cb_insert from commandbutton within w_personnels
end type
type cb_droit from commandbutton within w_personnels
end type
type cb_close from commandbutton within w_personnels
end type
end forward

global type w_personnels from w_child
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
rb_sign rb_sign
rb_users rb_users
rb_all rb_all
cb_feuiltemps cb_feuiltemps
dw_personnelshor dw_personnelshor
dw_personnelsmaster dw_personnelsmaster
cb_delete cb_delete
dw_personnel dw_personnel
st_title st_title
cb_update cb_update
cb_insert cb_insert
cb_droit cb_droit
cb_close cb_close
end type
global w_personnels w_personnels

type variables
long il_persid
int ii_change = 0 , ii_cat
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();long ll_idpers, ll_row, ll_new

if dw_personnel.update(true,false) = 1 then
	if dw_personnelshor.update(true,false) = 1 then
		dw_personnel.resetupdate()
		dw_personnelshor.resetupdate()
		commit using sqlca;
		//capture le idpers
		ll_idpers = dw_personnel.getitemnumber(dw_personnel.getrow(),'id_personnel')
		if not ll_idpers > 0 then
			select max(id_personnel) into :ll_idpers from t_personnels;
		end if
		dw_personnelsmaster.setredraw(false)
		dw_personnelsmaster.retrieve(ii_cat)
		//retrouver le bon idpers
		ll_row = dw_personnelsmaster.find("string(id_personnel) = '" + string(ll_idpers) + "'",0,dw_personnelsmaster.rowcount())
		dw_personnelsmaster.scrolltorow(ll_row)
		dw_personnelsmaster.setredraw(true)
		//afficher horaire ou cree
		if dw_personnelshor.retrieve(ll_idpers) < 1 then
			ll_new = dw_personnelshor.insertrow(0)
			dw_personnelshor.setitem(ll_new,'id_personnel',ll_idpers)
		end if
		ii_change = 0
	else
		rollback using sqlca;
	end if
else
	rollback using sqlca;
end if
end subroutine

on w_personnels.create
int iCurrent
call super::create
this.rb_sign=create rb_sign
this.rb_users=create rb_users
this.rb_all=create rb_all
this.cb_feuiltemps=create cb_feuiltemps
this.dw_personnelshor=create dw_personnelshor
this.dw_personnelsmaster=create dw_personnelsmaster
this.cb_delete=create cb_delete
this.dw_personnel=create dw_personnel
this.st_title=create st_title
this.cb_update=create cb_update
this.cb_insert=create cb_insert
this.cb_droit=create cb_droit
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_sign
this.Control[iCurrent+2]=this.rb_users
this.Control[iCurrent+3]=this.rb_all
this.Control[iCurrent+4]=this.cb_feuiltemps
this.Control[iCurrent+5]=this.dw_personnelshor
this.Control[iCurrent+6]=this.dw_personnelsmaster
this.Control[iCurrent+7]=this.cb_delete
this.Control[iCurrent+8]=this.dw_personnel
this.Control[iCurrent+9]=this.st_title
this.Control[iCurrent+10]=this.cb_update
this.Control[iCurrent+11]=this.cb_insert
this.Control[iCurrent+12]=this.cb_droit
this.Control[iCurrent+13]=this.cb_close
end on

on w_personnels.destroy
call super::destroy
destroy(this.rb_sign)
destroy(this.rb_users)
destroy(this.rb_all)
destroy(this.cb_feuiltemps)
destroy(this.dw_personnelshor)
destroy(this.dw_personnelsmaster)
destroy(this.cb_delete)
destroy(this.dw_personnel)
destroy(this.st_title)
destroy(this.cb_update)
destroy(this.cb_insert)
destroy(this.cb_droit)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type rb_sign from radiobutton within w_personnels
integer x = 2670
integer width = 384
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Signature"
end type

event clicked;ii_cat = 2
dw_personnelsmaster.Retrieve(ii_cat)
end event

type rb_users from radiobutton within w_personnels
integer x = 2139
integer width = 384
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilisateurs"
end type

event clicked;ii_cat = 1
dw_personnelsmaster.Retrieve(ii_cat)
end event

type rb_all from radiobutton within w_personnels
integer x = 3246
integer width = 384
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tous"
boolean checked = true
end type

event clicked;setnull(ii_cat)

if gl_idpers <> 0 then dw_personnelsmaster.SetFilter('t_personnels.id_personnel > 0')
dw_personnelsmaster.Retrieve(ii_cat)
end event

type cb_feuiltemps from commandbutton within w_personnels
integer x = 1198
integer y = 1920
integer width = 649
integer height = 116
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Feuilles de temps"
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("idusermodfeuiltemps", il_persid)
opensheet(w_modfeuiltemps,w_principal,2,layered!)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Time sheet'
end if
end event

type dw_personnelshor from u_dw within w_personnels
boolean visible = false
integer y = 1700
integer width = 2130
integer height = 192
integer taborder = 100
string title = "personnelshor"
string dataobject = "d_personnelshor"
boolean border = false
end type

event constructor;SetTransObject(SQLCA)
end event

event editchanged;ii_change = 1
end event

event itemchanged;ii_change = 1
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

type dw_personnelsmaster from u_dw within w_personnels
integer x = 2139
integer y = 84
integer width = 1490
integer height = 1828
integer taborder = 80
string title = "personnelsmaster"
string dataobject = "d_personnelsmaster"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;integer li_null
setnull(li_null)

this.SetTransObject(SQLCA)
dw_personnel.SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
if gl_idpers <> 0 then SetFilter('t_personnels.id_personnel > 0')
this.Retrieve(li_null)

end event

event rowfocuschanged;long ll_new
string ls_pass

if currentrow > 0 then
	il_persid = this.getitemnumber(currentrow,'id_personnel')
	dw_personnel.retrieve(il_persid)
	dw_personnelshor.retrieve(il_persid)
	select password into :ls_pass from t_personnels where id_personnel = :il_persid;
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

type cb_delete from commandbutton within w_personnels
integer x = 1851
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;long ll_new, ll_idpers, ll_row

if error_type(240) = 1 then
	ll_row = dw_personnel.getrow()
	IF ll_row > 0 THEN
		if dw_personnel.deleterow(ll_row) = 1 then
			if dw_personnel.update() = 1 then
				IF dw_personnelshor.getrow() > 0 THEN
					dw_personnelshor.deleterow(dw_personnelshor.getrow())
					dw_personnelshor.update()
				END IF
				IF dw_personnelsmaster.getrow() > 0 THEN
					dw_personnelsmaster.deleterow(dw_personnelsmaster.getrow())
					ll_idpers = dw_personnelsmaster.getitemnumber(dw_personnelsmaster.getrow(),'id_personnel')
					dw_personnel.retrieve(ll_idpers)
					dw_personnelshor.retrieve(ll_idpers)
				END IF
				ii_change = 1
			else
				ll_idpers = dw_personnelsmaster.getitemnumber(dw_personnelsmaster.getrow(),'id_personnel')
				dw_personnel.retrieve(ll_idpers)
			end if
		end if
	END IF
end if
end event

event constructor;if v_langue = 'an' then
	this.text = "Delete"
end if
end event

type dw_personnel from u_dw within w_personnels
integer y = 96
integer width = 2130
integer height = 1596
integer taborder = 10
string title = "Gestion du personnel"
string dataobject = "d_personnels"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;ii_change = 1
end event

event editchanged;ii_change = 1
end event

event constructor;if v_langue = 'an' then
	dw_personnel.Object.initial.ValidationMsg = "One of the required fields is empty."
	dw_personnel.Object.nom.ValidationMsg = "One of the required fields is empty."
	dw_personnel.Object.prenom.ValidationMsg = "One of the required fields is empty."
	dw_personnel.Object.password.ValidationMsg = "One of the required fields is empty."	
	this.object.nom_t.text = "Last Name:"
	this.object.prenom_t.text = "First name:"
	this.object.adresse_t.text = "Address:"
	this.object.ville_t.text = "City:"
//	this.object.t_5.text = "* Required field"
	this.object.t_zip.text = 'Postal Code:'
	this.object.t_poste.text = 'Function:'
	this.object.acces_modif_corr.checkbox.text = "Has the right to modify secured correspondence sections"
else
	dw_personnel.Object.initial.ValidationMsg = "Un des champs obligatoire n'a pas été rempli."
	dw_personnel.Object.nom.ValidationMsg = "Un des champs obligatoire n'a pas été rempli."
	dw_personnel.Object.prenom.ValidationMsg = "Un des champs obligatoire n'a pas été rempli."
	dw_personnel.Object.password.ValidationMsg = "Un des champs obligatoire n'a pas été rempli."
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

//
//if sqldbcode = -198 then
//	Messagebox('Avertissement!','Cette employé est associé à un patient!')
//	ii_change = 0
//	return 1
//end if
end event

event retrieveend;//sle_pass1.text = getitemstring(1,'password')
//sle_pass2.text = getitemstring(1,'password')
end event

type st_title from statictext within w_personnels
integer width = 1207
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Gestion du personnel"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Staff management"
end if
end event

type cb_update from commandbutton within w_personnels
integer x = 2446
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 40
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
	this.text = "Update"
end if
end event

type cb_insert from commandbutton within w_personnels
integer x = 5
integer y = 1920
integer width = 594
integer height = 116
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long ll_newrow, ll_idpers
dw_personnelshor.reset()

ll_newrow = dw_personnel.insertrow(0)
dw_personnel.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_personnel.setItem(ll_newrow,'province','QC')
dw_personnel.setItem(ll_newrow,'categorie','0')
dw_personnel.scrolltorow(ll_newrow)
dw_personnel.SetFocus()

end event

event constructor;if v_langue = 'an' then
	this.text = "Add"
end if
end event

type cb_droit from commandbutton within w_personnels
integer x = 603
integer y = 1920
integer width = 594
integer height = 116
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Droits"
end type

event clicked;opensheetwithparm(w_personneldroits,il_persid,w_principal,2,layered!)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Right Policies'
end if
end event

type cb_close from commandbutton within w_personnels
integer x = 3040
integer y = 1924
integer width = 594
integer height = 112
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

event clicked;if ii_change = 1 then
	if error_type(200) = 1 then
		sauve()
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

