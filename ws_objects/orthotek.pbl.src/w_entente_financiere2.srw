$PBExportHeader$w_entente_financiere2.srw
forward
global type w_entente_financiere2 from w_child
end type
type pb_4 from picturebutton within w_entente_financiere2
end type
type pb_3 from picturebutton within w_entente_financiere2
end type
type st_title from statictext within w_entente_financiere2
end type
type pb_1 from picturebutton within w_entente_financiere2
end type
type pb_2 from picturebutton within w_entente_financiere2
end type
type st_patnom from statictext within w_entente_financiere2
end type
type cb_next from commandbutton within w_entente_financiere2
end type
type cb_print from commandbutton within w_entente_financiere2
end type
type cb_prev from commandbutton within w_entente_financiere2
end type
type cb_update from commandbutton within w_entente_financiere2
end type
type dw_entente_financiere from u_dw within w_entente_financiere2
end type
type cb_close from commandbutton within w_entente_financiere2
end type
end forward

global type w_entente_financiere2 from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
pb_4 pb_4
pb_3 pb_3
st_title st_title
pb_1 pb_1
pb_2 pb_2
st_patnom st_patnom
cb_next cb_next
cb_print cb_print
cb_prev cb_prev
cb_update cb_update
dw_entente_financiere dw_entente_financiere
cb_close cb_close
end type
global w_entente_financiere2 w_entente_financiere2

type variables
int changement = 0
private int ii_modeajout = 0
private long il_patid = 0, il_idcontact,il_entente[]
private string is_langue
end variables

forward prototypes
public subroutine sauve ()
public subroutine uf_setentente ()
end prototypes

public subroutine sauve ();if dw_entente_financiere.update() = 1 then
	commit using sqlca;
	ii_modeajout = 0
else
	rollback using sqlca;
	error_type(50)
end if
changement = 0
cb_print.enabled = true
end subroutine

public subroutine uf_setentente ();long ll_identente,ll_entente[],i=1

il_entente[] = ll_entente[]

DECLARE cur CURSOR FOR

	select entente_id
	from t_entente
	where patient_id = :il_patid;

OPEN cur;

FETCH cur INTO :ll_identente;

DO WHILE SQLCA.SQLCODE = 0
	il_entente[i] = ll_identente
	i++
	FETCH cur INTO :ll_identente;
LOOP

CLOSE cur;
end subroutine

on w_entente_financiere2.create
int iCurrent
call super::create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_title=create st_title
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_patnom=create st_patnom
this.cb_next=create cb_next
this.cb_print=create cb_print
this.cb_prev=create cb_prev
this.cb_update=create cb_update
this.dw_entente_financiere=create dw_entente_financiere
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_4
this.Control[iCurrent+2]=this.pb_3
this.Control[iCurrent+3]=this.st_title
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.pb_2
this.Control[iCurrent+6]=this.st_patnom
this.Control[iCurrent+7]=this.cb_next
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.cb_prev
this.Control[iCurrent+10]=this.cb_update
this.Control[iCurrent+11]=this.dw_entente_financiere
this.Control[iCurrent+12]=this.cb_close
end on

on w_entente_financiere2.destroy
call super::destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_title)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_patnom)
destroy(this.cb_next)
destroy(this.cb_print)
destroy(this.cb_prev)
destroy(this.cb_update)
destroy(this.dw_entente_financiere)
destroy(this.cb_close)
end on

event open;/////////////////////
// 
// Créé par: Eric Vezina
// Créé le: 24-11-2004
// Demande: 
// Version: 7.8.6
// Modifié par: 
// Modifié le: 
//
// Le paramètre passé est le patient_id qui ne doit pas être null.
// Chaque patient peut avoir plusieurs entente financiere.
// Pour changer d'entente financiere, il faut utiliser les flèches en haut de la fenêtre.
//
//////////////////////

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

long ll_nbrow,ll_findrow,ll_lastid

// Initialiser les variables d'instances
il_patid = message.doubleparm
select patient_prenom + ' ' + patient_nom into :st_patnom.text from patient where patient_id = :il_patid;
select id_contact into :il_idcontact from t_contact where patient_id = :il_patid and pat = 1;
select langue into :is_langue from patient where patient_id = :il_patid;

dw_entente_financiere.event ue_retrieve()
//dw_entente_financiere.event ue_langue()

//long row, ll_orthoid
//string ls_nom_ortho,ls_nom,ls_prenom, ls_adresse, ls_code_postal, ls_province, ls_ville, ls_tel_bur
//
//il_patid = message.doubleparm
//select id_contact into :il_idcontact from t_contact where patient_id = :il_patid and pat = 1;
//if dw_entente_financiere.retrieve(il_idcontact) = 0 then
//	row = dw_entente_financiere.insertrow(0)
//	dw_entente_financiere.scrolltorow(row)
//	SELECT patient_nom, patient_prenom, no_ortho into :ls_nom, :ls_prenom , :ll_orthoid FROM patient WHERE patient_id = :il_patid;
//	SELECT dr_nom_complet,dr_adresse, dr_code_postal, dr_province, dr_ville, dr_tel_bur 
//	       into :ls_nom_ortho, :ls_adresse, :ls_code_postal, :ls_province, :ls_ville, :ls_tel_bur FROM ortho_id WHERE ortho_id = :ll_orthoid;
//   dw_entente_financiere.setitem(row,"t_contact_nom",ls_nom)
//	dw_entente_financiere.setitem(row,"t_contact_prenom",ls_prenom)
////	dw_entente_financiere.setitem(row,"ortho_id_dr_nom_complet",ls_nom_ortho)
////	dw_entente_financiere.setitem(row,"ortho_id_dr_adresse",ls_adresse)
////	dw_entente_financiere.setitem(row,"ortho_id_dr_code_postal",ls_code_postal)
////	dw_entente_financiere.setitem(row,"ortho_id_dr_ville",ls_ville)
////	dw_entente_financiere.setitem(row,"ortho_id_dr_province",ls_province)
////	dw_entente_financiere.setitem(row,"ortho_id_dr_tel_bur",ls_tel_bur)
//	dw_entente_financiere.setitem(row,"t_entente_id_contact",il_idcontact)
//	dw_entente_financiere.setitem(row,"t_entente_patient_id",il_patid)
//	dw_entente_financiere.setitem(row,"traitement",1)
//	dw_entente_financiere.setitem(row,"debut",today())
//	dw_entente_financiere.setitem(row,"cout_total1",0)
//	dw_entente_financiere.setitem(row,"diag_anal1",0)
//	dw_entente_financiere.setitem(row,"paiement_init1",0)
//	dw_entente_financiere.setitem(row,"mensualite1",0)
//	dw_entente_financiere.setitem(row,"t_entente_duree1",0)
//	dw_entente_financiere.setitem(row,"paiement_fin1",0)
//	ii_modeajout = 1
//end if
//dw_entente_financiere.SetFocus()
//changement = 0
end event

type pb_4 from picturebutton within w_entente_financiere2
integer x = 3525
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRLast!"
alignment htextalign = left!
end type

event clicked;dw_entente_financiere.ScrollToRow(upperbound(il_entente[])) 
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type pb_3 from picturebutton within w_entente_financiere2
integer x = 3424
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRNext!"
alignment htextalign = left!
end type

event clicked;dw_entente_financiere.ScrollNextRow()
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type st_title from statictext within w_entente_financiere2
event ue_title ( )
integer x = 2103
integer y = 8
integer width = 1321
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Entente financière"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_title();integer i,li_nbass,z = 0
long ll_idass

li_nbass = upperbound(il_entente[])
ll_idass = dw_entente_financiere.getitemnumber(dw_entente_financiere.getrow(),'entente_id')
for i = 1 to li_nbass
	if il_entente[i] = ll_idass then
		z = i
	end if
next
if v_langue = 'an' then
	this.text = 'Financial agreement ' + string(z) + ' of ' + string(li_nbass)
else
	this.text = 'Entente financière ' + string(z) + ' de ' + string(li_nbass)
end if
end event

type pb_1 from picturebutton within w_entente_financiere2
integer x = 2002
integer width = 101
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRPrior!"
alignment htextalign = left!
end type

event clicked;dw_entente_financiere.ScrollPriorRow()
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type pb_2 from picturebutton within w_entente_financiere2
integer x = 1902
integer width = 101
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRFirst!"
alignment htextalign = left!
end type

event clicked;dw_entente_financiere.ScrollToRow(1)
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type st_patnom from statictext within w_entente_financiere2
integer width = 1897
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "ENTENTE FINANCIERE"
boolean focusrectangle = false
end type

type cb_next from commandbutton within w_entente_financiere2
integer x = 791
integer y = 1904
integer width = 768
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Suivant"
end type

event clicked;dw_entente_financiere.scrollnextrow()
end event

type cb_print from commandbutton within w_entente_financiere2
integer x = 1559
integer y = 1904
integer width = 640
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Imprimer"
end type

event clicked;long ll_id
string v_langue_pat

ll_id = dw_entente_financiere.getitemnumber(dw_entente_financiere.getrow(),'entente_id')
select langue into :v_langue_pat from t_contact where id_contact = :il_idcontact;
CHOOSE CASE v_langue_pat
	CASE 'A'
		datastore ds_entente
		ds_entente = create datastore
		ds_entente.dataobject = "d_entente_financiere2"
		ds_entente.SetTransObject(SQLCA)
		ds_entente.retrieve(ll_id)
		ds_entente.Modify("DataWindow.Print.Margin.Top=400")
		ds_entente.Modify("DataWindow.Print.Margin.left=400")
		gb_datawindow = false
		openwithparm(w_print_options,ds_entente)
  		destroy ds_entente
	CASE 'F'
		datastore ds_entente_fr
		ds_entente_fr = create datastore
		ds_entente_fr.dataobject = "d_entente_financiere2fr"
		ds_entente_fr.SetTransObject(SQLCA)
		ds_entente_fr.retrieve(ll_id)
		ds_entente_fr.Modify("DataWindow.Print.Margin.Top=400")
		ds_entente_fr.Modify("DataWindow.Print.Margin.left=400")
		gb_datawindow = false
		openwithparm(w_print_options,ds_entente_fr)
		destroy ds_entente_fr
	CASE ELSE
			error_type(0)
END CHOOSE

end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type cb_prev from commandbutton within w_entente_financiere2
integer x = 41
integer y = 1904
integer width = 745
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Précédent"
end type

event clicked;dw_entente_financiere.scrollpriorrow()
end event

type cb_update from commandbutton within w_entente_financiere2
integer x = 2199
integer y = 1904
integer width = 745
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
end event

event constructor;if v_langue = 'an' then
	this.text = "Update"
end if
end event

type dw_entente_financiere from u_dw within w_entente_financiere2
event ue_retrieve ( )
event ue_insert ( )
integer x = 46
integer y = 92
integer width = 3538
integer height = 1792
integer taborder = 10
string title = "entente_financiere"
string dataobject = "d_entente_financiere1"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_nbrow,ll_lastid,ll_findrow

ll_nbrow = dw_entente_financiere.retrieve(il_patid)
// si aucun formulaire, en ajoute un nouveau
if ll_nbrow = 0 then
	dw_entente_financiere.event ue_insert()
	dw_entente_financiere.retrieve(il_patid)
end if
// construit la table des assurances
uf_setentente()
// focus sur le dernier fomulaire
select max(entente_id) into :ll_lastid from t_entente where patient_id = :il_patid;
ll_findrow = dw_entente_financiere.find('entente_id = ' + string(ll_lastid),1,ll_nbrow)
dw_entente_financiere.scrolltorow(ll_findrow)
// inscrit le titre
st_title.event ue_title()
//dw_assurance.event ue_langue()
end event

event ue_insert();insert into t_entente(patient_id,id_contact,traitement,debut,cout_total1,diag_anal1,paiement_init1,mensualite1,duree1,paiement_fin1)
values(:il_patid,:il_idcontact,1,today(),0,0,0,0,0,0);
error_type(-1)

ii_modeajout = 1
changement = 1
end event

event constructor;SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_8.text = 'Financial agreement for'
//	this.object.traitement_t.text = 'Treatment:'
//	this.object.cout_total_t.text = 'Total treatment cost:'
	this.object.debut_t.text = 'Treatment beginning:'
	this.object.t_1.text = 'to'
	this.object.cout_total2_t.text = 'Case analysis and diagnostic'
	this.object.t_3.text = 'Initial payment date'
	this.object.cout_total3_t.text = 'Initial payment:'
	this.object.diag_anal1_t.text = 'Balance:'
	this.object.paiement_init1_t.text = 'Final payment:'
	this.object.t_2.text = 'monthly during'
	this.object.t_4.text = 'Agreement lenght:'
end if
end event

event itemchanged;changement = 1
cb_print.enabled = false
end event

event editchanged;decimal{2} v_phase, v_mens, v_final, v_init, v_diag_anal
int v_duree, li_duree_reel

if isnull(data) = false then
	CHOOSE CASE getcolumnname()
		CASE "mensualite1"
				dw_entente_financiere.accepttext()
				v_phase = dw_entente_financiere.getitemnumber(row,'cout_total1')
				v_mens = dw_entente_financiere.getitemnumber(row,'mensualite1')
				v_init = dw_entente_financiere.getitemnumber(row,'paiement_init1')
				v_diag_anal = dw_entente_financiere.getitemnumber(row,'diag_anal1')
				if v_mens <> 0 and isnull(v_mens) = false then
					v_duree = (v_phase - v_init - v_diag_anal) / v_mens
					dw_entente_financiere.setitem(row, "t_entente_duree1", v_duree)
					v_final = v_phase - (v_duree * v_mens + v_init + v_diag_anal)
					dw_entente_financiere.setitem(row, "paiement_fin1", v_final)
				end if
				changement = 1
		CASE "mensualite2"
				dw_entente_financiere.accepttext()
				v_phase = dw_entente_financiere.getitemnumber(row,'cout_total2')
				v_mens = dw_entente_financiere.getitemnumber(row,'mensualite2')
				v_init = dw_entente_financiere.getitemnumber(row,'paiement_init2')
				v_diag_anal = dw_entente_financiere.getitemnumber(row,'diag_anal2')
				if v_mens <> 0 and isnull(v_mens) = false then
					v_duree = (v_phase - v_init - v_diag_anal) / v_mens
					dw_entente_financiere.setitem(row, "t_entente_duree2", v_duree)
					v_final = v_phase - (v_duree * v_mens + v_init + v_diag_anal)
					dw_entente_financiere.setitem(row, "paiement_fin2", v_final)
				end if
				changement = 1
		CASE "mensualite3"
				dw_entente_financiere.accepttext()
				v_phase = dw_entente_financiere.getitemnumber(row,'cout_total3')
				v_mens = dw_entente_financiere.getitemnumber(row,'mensualite3')
				v_init = dw_entente_financiere.getitemnumber(row,'paiement_init3')
				v_diag_anal = dw_entente_financiere.getitemnumber(row,'diag_anal3')
				if v_mens <> 0 and isnull(v_mens) = false then
					v_duree = (v_phase - v_init - v_diag_anal) / v_mens
					dw_entente_financiere.setitem(row, "t_entente_duree3", v_duree)
					v_final = v_phase - (v_duree * v_mens + v_init + v_diag_anal)
					dw_entente_financiere.setitem(row, "paiement_fin3", v_final)
				end if
				changement = 1
		CASE "t_entente_duree1"
			v_phase = dw_entente_financiere.getitemnumber(row,'cout_total1')
			v_mens = dw_entente_financiere.getitemnumber(row,'mensualite1')
			v_init = dw_entente_financiere.getitemnumber(row,'paiement_init1')
			v_diag_anal = dw_entente_financiere.getitemnumber(row,'diag_anal1')
			li_duree_reel = integer(data)
			if v_mens <> 0 and isnull(v_mens) = false then
		 	   v_final = v_phase - (li_duree_reel * v_mens + v_init + v_diag_anal)
			   dw_entente_financiere.setitem(row, "paiement_fin1", v_final)
		   end if
			changement = 1
		CASE "t_entente_duree2"
			v_phase = dw_entente_financiere.getitemnumber(row,'cout_total2')
			v_mens = dw_entente_financiere.getitemnumber(row,'mensualite2')
			v_init = dw_entente_financiere.getitemnumber(row,'paiement_init2')
			v_diag_anal = dw_entente_financiere.getitemnumber(row,'diag_anal2')
			li_duree_reel = integer(data)
			if v_mens <> 0 and isnull(v_mens) = false then
		 	   v_final = v_phase - (li_duree_reel * v_mens + v_init + v_diag_anal)
			   dw_entente_financiere.setitem(row, "paiement_fin2", v_final)
		   end if
			changement = 1
		CASE "t_entente_duree3"
			v_phase = dw_entente_financiere.getitemnumber(row,'cout_total3')
			v_mens = dw_entente_financiere.getitemnumber(row,'mensualite3')
			v_init = dw_entente_financiere.getitemnumber(row,'paiement_init3')
			v_diag_anal = dw_entente_financiere.getitemnumber(row,'diag_anal3')
			li_duree_reel = integer(data)
			if v_mens <> 0 and isnull(v_mens) = false then
		 	   v_final = v_phase - (li_duree_reel * v_mens + v_init + v_diag_anal)
			   dw_entente_financiere.setitem(row, "paiement_fin3", v_final)
		   end if
			changement = 1
	END CHOOSE
end if
cb_print.enabled = false
end event

event updateend;long ll_row, ll_ententeid
integer test
if rowsinserted <> 0 then
	ll_row = dw_entente_financiere.getrow()
	select max(entente_id) into :ll_ententeid from t_entente;
	dw_entente_financiere.setitem(ll_row,'entente_id',ll_ententeid)
	if ii_modeajout = 1 then   
     	test = dw_entente_financiere.setitemstatus(ll_row,'entente_id',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'traitement',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'debut',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'fin',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'cout_total',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'cout_total1',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'cout_total2',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'cout_total3',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'diag_anal1',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'diag_anal2',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'diag_anal3',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'paiement_init1',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'paiement_init2',primary!,notmodified!)
	   test = dw_entente_financiere.setitemstatus(ll_row,'paiement_init3',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'paiement_fin1',primary!,notmodified!) 
		test = dw_entente_financiere.setitemstatus(ll_row,'paiement_fin2',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'paiement_fin3',primary!,notmodified!)
		test = dw_entente_financiere.setitemstatus(ll_row,'mensualite1',primary!,notmodified!)  
		test = dw_entente_financiere.setitemstatus(ll_row,'mensualite2',primary!,notmodified!) 
		test = dw_entente_financiere.setitemstatus(ll_row,'mensualite3',primary!,notmodified!) 
		test = dw_entente_financiere.setitemstatus(ll_row,'t_entente_duree1',primary!,notmodified!) 
		test = dw_entente_financiere.setitemstatus(ll_row,'t_entente_duree2',primary!,notmodified!) 
		test = dw_entente_financiere.setitemstatus(ll_row,'t_entente_duree3',primary!,notmodified!) 
		test = dw_entente_financiere.setitemstatus(ll_row,'t_entente_patient_id',primary!,notmodified!) 
		test = dw_entente_financiere.setitemstatus(ll_row,'t_entente_id_contact',primary!,notmodified!) 
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

type cb_close from commandbutton within w_entente_financiere2
integer x = 2944
integer y = 1904
integer width = 640
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if changement = 1 then
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

