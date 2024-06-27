$PBExportHeader$w_type_traitements.srw
forward
global type w_type_traitements from w_child
end type
type cb_1 from commandbutton within w_type_traitements
end type
type cb_print from commandbutton within w_type_traitements
end type
type st_title from statictext within w_type_traitements
end type
type cb_delete from commandbutton within w_type_traitements
end type
type cb_update from commandbutton within w_type_traitements
end type
type dw_enregistrement_traitements from u_dw within w_type_traitements
end type
type cb_close from commandbutton within w_type_traitements
end type
type cb_insert from commandbutton within w_type_traitements
end type
end forward

global type w_type_traitements from w_child
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
cb_print cb_print
st_title st_title
cb_delete cb_delete
cb_update cb_update
dw_enregistrement_traitements dw_enregistrement_traitements
cb_close cb_close
cb_insert cb_insert
end type
global w_type_traitements w_type_traitements

type variables
integer changement=0
end variables

forward prototypes
public subroutine maj ()
end prototypes

public subroutine maj ();if dw_enregistrement_traitements.Update() = 1 then
	commit using SQLCA;
	dw_enregistrement_traitements.retrieve(v_no_ortho)
	changement = 0
	if dw_enregistrement_traitements.rowcount() = 0 then
		cb_update.enabled = false
		cb_delete.enabled = false
	end if
else
	rollback using SQLCA;
	error_type(50)
end if

end subroutine

on w_type_traitements.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_print=create cb_print
this.st_title=create st_title
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.dw_enregistrement_traitements=create dw_enregistrement_traitements
this.cb_close=create cb_close
this.cb_insert=create cb_insert
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.st_title
this.Control[iCurrent+4]=this.cb_delete
this.Control[iCurrent+5]=this.cb_update
this.Control[iCurrent+6]=this.dw_enregistrement_traitements
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.cb_insert
end on

on w_type_traitements.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.st_title)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.dw_enregistrement_traitements)
destroy(this.cb_close)
destroy(this.cb_insert)
end on

event pfc_postopen;call super::pfc_postopen;// Ajuste la disponibilité des boutons
if dw_enregistrement_traitements.rowcount() = 0 then
	cb_update.enabled = false
	cb_delete.enabled = false
end if
end event

type cb_1 from commandbutton within w_type_traitements
integer x = 1829
integer y = 1924
integer width = 576
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Transfert"
end type

event clicked;open(w_typetraittransfert)
end event

type cb_print from commandbutton within w_type_traitements
integer x = 1221
integer y = 1924
integer width = 608
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
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

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event

type st_title from statictext within w_type_traitements
integer width = 1271
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
string text = "Liste des procédures"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Treatment type"
end if
end event

type cb_delete from commandbutton within w_type_traitements
integer x = 613
integer y = 1924
integer width = 608
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

event clicked;long ll_traitid,ll_nb

ll_traitid = dw_enregistrement_traitements.getitemnumber(dw_enregistrement_traitements.getrow(),'type_traitement_id')
select count(*) into :ll_nb from t_rdv where typetraitid = :ll_traitid and ortho_id = :v_no_ortho;
if ll_nb > 0 then
	messagebox("Avertissement!","Vous ne pouvez supprimer l'enregistrement car il est présentement utiliser pour un rdv?")
else
//	if messagebox("Suppression","Voulez-vous supprimer l'enregistrement?",Question!,YesNo!) =1 then
		dw_enregistrement_traitements.deleterow(dw_enregistrement_traitements.getrow())
		changement = 1
//	end if
end if
end event

event constructor;if v_langue = 'an' then
	cb_delete.Text = "Delete treatment"
end if
end event

type cb_update from commandbutton within w_type_traitements
integer x = 2405
integer y = 1924
integer width = 608
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

event clicked;maj()

end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Update"
end if
end event

type dw_enregistrement_traitements from u_dw within w_type_traitements
integer x = 5
integer y = 92
integer width = 3616
integer height = 1832
integer taborder = 10
string dataobject = "d_types_traitements"
boolean hscrollbar = true
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
//do not display the error message
RETURN 1

end event

event editchanged;changement = 1
end event

event itemchanged;changement = 1
end event

event constructor;long ll_horshareid
integer li_liste_trait_par_spec

dw_enregistrement_traitements.settransobject(SQLCA)
dw_enregistrement_traitements.setrowfocusindicator(hand!)

select horshareid,liste_trait_par_spec into :ll_horshareid,:li_liste_trait_par_spec from t_options where ortho_id = :v_no_ortho;
if li_liste_trait_par_spec = 1 then
	//probleme dr luc veilleux 2 ortho ds le meme horaire
	dw_enregistrement_traitements.retrieve(v_no_ortho)
else
	//probleme dr michel di battista 2 ortho ds le meme horaire
	if isnull(ll_horshareid) then ll_horshareid = v_no_ortho
	dw_enregistrement_traitements.retrieve(ll_horshareid)
end if

if v_langue = 'an' then
	this.object.nip_traitement_t.Text = "Code"
	this.object.nom_traitement_t.Text = "Treatment name"
	this.object.t_4.Text = "Time of doctor"
	this.object.t_2.Text = "Duration"
	this.object.t_1.Text = "Color"
	this.object.t_3.Text = "Order"
	this.object.t_9.Text = "File status"
	this.object.type_de_traitement_typetrait.values = 'Consultation~t1/Records~t2/Bond~t3/Initial~t5/Retainer Fee~t4/Recall~t6/Adjust,Control~t7/Urgency~t8/Print~t9/Replace~t10/Debond~t11/Laboratory ~t12/Administration~t13'
else
	this.object.type_de_traitement_typetrait.values = 'Consultation~t1/Diagnostic~t2/MEB~t3/Initial~t5/Rétention~t4/Rappel~t6/Ajustement,Controle~t7/Urgence~t8/Empreinte~t9/Remplacement~t10/Retrait appareil~t11/Laboratoire~t12/Administration~t13'
end if

end event

event clicked;call super::clicked;long ll_trait, ll_orthoid, ll_duree, ll_nbtd
string ls_nomtrait

if dwo.name = 'p_td' then

	this.acceptText()
		
	ll_trait = this.object.type_traitement_id[row]
	ls_nomtrait = this.object.nom_traitement[row]
	ll_orthoid = this.object.type_de_traitement_ortho_id[row]
	ll_duree = this.object.type_de_traitement_duree[row]
	
	if isNull(ll_trait) then
		error_type(1019)
		return 0
	end if
	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("Temps doc traitement", ll_trait)
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("Temps doc spec", ll_orthoid)
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("Temps doc nom trait", ls_nomtrait)
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("Temps doc duree trait", ll_duree)
	
	open(w_tempsdoc)
	
	select count(1)
	  into :ll_nbtd
	  from t_tempsdoc
	 where type_traitement_id = :ll_trait
		and ortho_id = :ll_orthoid;
	
	if ll_nbtd > 0 then
		this.object.atd[row] = 1
	else
		this.object.atd[row] = 0
	end if
	
end if
end event

type cb_close from commandbutton within w_type_traitements
integer x = 3013
integer y = 1924
integer width = 608
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

event clicked;if changement = 1 then
	if error_type(200) = 1 then
		maj()
	end if
end if
Close (parent)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_type_traitements
integer x = 5
integer y = 1924
integer width = 608
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

ll_newrow = dw_enregistrement_traitements.InsertRow(0)
dw_enregistrement_traitements.ScrollToRow(ll_newrow)
dw_enregistrement_traitements.setitem(ll_newrow,'color_id',1)
//dw_enregistrement_traitements.setitem(ll_newrow,'type_de_traitement_prixsugg',0)
dw_enregistrement_traitements.setitem(ll_newrow,'type_de_traitement_ortho_id',v_no_ortho)
select max(type_traitement_id) into :ll_maxid from type_de_traitement where ortho_id = :v_no_ortho;
if isnull(ll_maxid) then ll_maxid = 0
for i = 1 to dw_enregistrement_traitements.rowcount()
	ll_id = dw_enregistrement_traitements.getitemnumber(i,'type_traitement_id')
	if ll_id > ll_maxid then ll_maxid = ll_id
next
dw_enregistrement_traitements.setitem(ll_newrow,'type_traitement_id',ll_maxid + 1)
dw_enregistrement_traitements.setitem(ll_newrow,'type_de_traitement_orderapp',ll_maxid + 1)
dw_enregistrement_traitements.setitem(ll_newrow,'type_de_traitement_rap',1)
dw_enregistrement_traitements.setitem(ll_newrow,'type_de_traitement_addtocharge',1)
dw_enregistrement_traitements.setfocus()
//Ajuste ls disponibilité des boutons
if cb_update.enabled = false then cb_update.enabled = true
if cb_delete.enabled = false then cb_delete.enabled = true
end event

event constructor;if v_langue = 'an' then
	this.Text = "New treatment"
end if
end event

