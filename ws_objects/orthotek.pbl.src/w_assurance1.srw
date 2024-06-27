$PBExportHeader$w_assurance1.srw
forward
global type w_assurance1 from w_child
end type
type cb_2 from commandbutton within w_assurance1
end type
type st_patnom from statictext within w_assurance1
end type
type cb_add from commandbutton within w_assurance1
end type
type pb_4 from picturebutton within w_assurance1
end type
type pb_3 from picturebutton within w_assurance1
end type
type pb_2 from picturebutton within w_assurance1
end type
type pb_1 from picturebutton within w_assurance1
end type
type st_title from statictext within w_assurance1
end type
type cb_1 from commandbutton within w_assurance1
end type
type cb_delete from commandbutton within w_assurance1
end type
type cb_print from commandbutton within w_assurance1
end type
type cb_transfert from commandbutton within w_assurance1
end type
type cb_update from commandbutton within w_assurance1
end type
type cb_close from commandbutton within w_assurance1
end type
type dw_assurance from u_dw within w_assurance1
end type
end forward

global type w_assurance1 from w_child
integer x = 5
integer y = 4
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
boolean toolbarvisible = false
boolean ib_isupdateable = false
cb_2 cb_2
st_patnom st_patnom
cb_add cb_add
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_title st_title
cb_1 cb_1
cb_delete cb_delete
cb_print cb_print
cb_transfert cb_transfert
cb_update cb_update
cb_close cb_close
dw_assurance dw_assurance
end type
global w_assurance1 w_assurance1

type variables
private boolean ib_entente
public boolean change
datawindowchild dass
private int ii_modeajout = 0
private long il_idpat,il_ass[]
private string is_langue
public string is_champ
DataWindowChild dddw_phase
end variables

forward prototypes
public function boolean valid_desc (string comment)
public function string traitement_annexe (string comment, string langue)
public subroutine sauve ()
public subroutine uf_setcontrat (long al_row)
public subroutine uf_langue (datastore dwo)
public subroutine uf_estlangue (ref datastore dwo)
public subroutine uf_setass ()
public subroutine uf_hideheader (datastore dwo)
end prototypes

public function boolean valid_desc (string comment);boolean isvalid = true

int indicateur = 0, i = 1, nb_digit = 0
string tempo


Do while indicateur = 0 and isvalid = true
   tempo = mid(comment, i, 1)
		if tempo = '' then
			indicateur = 1
		else
			indicateur = 0
		end if
	if isnumber(tempo) = false and tempo <> ' ' and indicateur = 0 then
		isvalid = false
	else
		if isnumber(tempo) then
			nb_digit = nb_digit + 1
		end if
	end if
	if mod(i,3) = 0 and indicateur = 0 then
		nb_digit = 0
		if tempo <> ' ' then
			isvalid = false
		end if
	else
		if tempo = ' ' then
			isvalid = false
		end if
	end if
	i = i + 1
Loop

if mod(nb_digit,2) <> 0 then
   isvalid = false
end if

return isvalid
end function

public function string traitement_annexe (string comment, string langue);int indicateur = 0, i = 1, nombre = 0, flag = 0
string tempo, tempo2, isfilter

isfilter = "(langue = '" + langue + "') and (code = "
Do until indicateur = 2
   tempo = mid(comment, i, 1)
	if (isnumber(tempo) = true) and (nombre <= 2) then
		nombre = nombre + 1
		tempo2 += tempo
		indicateur = 0
	else
		indicateur = indicateur + 1
	end if
	if nombre = 2 then
		if flag = 0 then
		   isfilter += tempo2
			flag = 1
		else
		   isfilter += ' or code = '
			isfilter += tempo2
		end if
		nombre = 0
		tempo2 = ''
	end if
	i = i + 1
Loop
isfilter += ")"
return isfilter
end function

public subroutine sauve ();if dw_assurance.Update() = 1 then
   commit using SQLCA;
	ii_modeajout = 0
else
	rollback using SQLCA;
	error_type(50)
end if
change = false
end subroutine

public subroutine uf_setcontrat (long al_row);//long row, ll_qty
//dec{2} ld_couttrait,ld_cons,ld_diag,ld_meb,ld_initial,ld_mmontant,ld_paiefin,ld_retfee
//date ldt_trait, ldt_mdate
////messagebox('il_idcontact',string(il_idcontact))
//SELECT t_contrats.date1,   
//		 t_contrats.cons,
//		 t_contrats.diag,
//		 t_contrats.meb,
//		 t_contrats.initial,   
//		 t_contrats.mqty,   
//		 t_contrats.mdate1,   
//		 t_contrats.mmontant,   
//		 t_contrats.paiefinal,
//		 t_contrats.retfee
// INTO  :ldt_trait,:ld_cons,:ld_diag,:ld_meb,:ld_initial,:ll_qty,:ldt_mdate,:ld_mmontant,:ld_paiefin,:ld_retfee
// FROM  t_contrats
//WHERE  t_contrats.id_contact = :il_idcontact;
//
//dw_assurance.setitem(al_row,'date_debut_traitement',ldt_trait)
//dw_assurance.setitem(al_row,'montant_1',ld_cons)
//dw_assurance.setitem(al_row,'montant_2',ld_diag)
//dw_assurance.setitem(al_row,'montant_3',ld_initial)
//dw_assurance.setitem(al_row,'versement',ll_qty)
//dw_assurance.setitem(al_row,'montant_4',ld_mmontant)
//dw_assurance.setitem(al_row,'montant_5',ld_paiefin)
//dw_assurance.setitem(al_row,'montant_6',ld_retfee)
end subroutine

public subroutine uf_langue (datastore dwo);if is_langue = 'A' then
	dwo.object.traitement_c_l.values = 'Full Treatment case~tc/Limited Treatment case~tl'
	dwo.object.t_desc.text = 'BRIEF DESCRIPTION OF CONDITION:'
	dwo.object.t_dateeff.text = 'STARTING DATE OF ACTIVE TREATMENT:'
	dwo.object.t_arrangement.text = 'FINANCIAL ARRANGEMENTS:'
	dwo.object.t_travail.text = 'Preparatory Procedures'
	dwo.object.t_firstexam.text = 'Initial examination:'
	dwo.object.t_diag.text = 'Diagnostic phase:'
	dwo.object.t_trait.text = 'Treatment Procedures'
	dwo.object.t_paieinit.text = 'Initial payment:'
	dwo.object.t_versement.text = 'monthly payment of'
	dwo.object.t_lastpaie.text = 'One last payment of:'
	dwo.object.t_hono.text = 'Retention / Observation Fee:'
	dwo.object.t_estime.text = 'Estimated Total Fee (if applicable):'
	dwo.object.t_dateapp.text = 'Approximate duration of the treatment:'
	dwo.object.t_remarque1.text = 'This is a fee estimate for recommended orthodontic services.'
	dwo.object.t_remarque2.text = 'These services and fees may vary during treatment.'
	dwo.object.t_commentaire.text = 'ADDITIONAL EXPLANATORY COMMENTS:'
	dwo.object.t_nbmois.text = 'The information on this Insurance form is valid'
	dwo.object.t_9.text = 'for :'
	dwo.object.t_8.text = 'months from above date.'
	
	dwo.object.t_signature.text = 'SIGNATURE OF CERTIFIED ORTHODONTIST'
	dwo.object.t_1.text = 'CERTIFIED SPECIALIST IN ORTHODONTICS'
//	dwo.object.t_24.text = 'STANDARD INFORMATION FORM'
	dwo.object.t_23.text = 'Approved by'
//	dwo.object.t_25.text = "The Canadian Association of Orthodontists"
	dwo.object.t_specnom.text = "NAME"
	dwo.object.t_specadd.text = "ADDRESS"
	dwo.object.t_specvilleprov.text = "CITY / PROV."
	dwo.object.t_speczip.text = "POSTAL CODE"
	dwo.object.t_specnumero.text = "NUMBER"
	dwo.object.t_patnom.text = "NAME OF PATIENT:"
	dwo.object.t_autorisation.text = "Authorization number: ____________________"
	dwo.object.t_usage.text = "For Patient use only"
	dwo.object.t_datenais.text = "Patient's Birth date                     -                       Person in charge of patient"
	dwo.object.t_group.text = " Group policy no.            Certificat number             Soc. Ins. Number"
	dwo.object.t_empladd.text = "Address :"
	dwo.object.t_assempl.text = "Employer :"
	dwo.object.t_assadd.text = "Address :"
	dwo.object.t_assnom.text = "Name :"
	dwo.object.t_4.text = "Insurance Carrier"
	dwo.object.t_3.text = "This section to be completed by  'patient / parent / guardian' "
	dwo.object.t_identification.text = "SUBSCRIBER IDENTIFICATION"
	dwo.object.t_traitement.text = "TREATMENT:"
	dwo.object.t_adeterminer.text = "To be determined"
//else
//	dwo.object.traitement_c_l.values = 'Traitement complet~tc/Traitement limité~tl'
end if
end subroutine

public subroutine uf_estlangue (ref datastore dwo);if is_langue = 'A' then
	dwo.object.t_date.text = datean(today())
	dwo.object.t_1.text = 'ESTIMATE'
	dwo.object.t_patnom.text = "NAME OF PATIENT:"
	dwo.object.t_traitement.text = "TREATMENT:"
	dwo.object.t_desc.text = 'BRIEF DESCRIPTION OF CONDITION:'
	dwo.object.t_dateeff.text = 'STARTING DATE OF ACTIVE TREATMENT:'
	dwo.object.t_arrangement.text = 'FINANCIAL ARRANGEMENTS:'
	dwo.object.t_travail.text = 'Preparatory Procedures'
	dwo.object.t_firstexam.text = 'Initial examination:'
	dwo.object.t_diag.text = 'Diagnostic phase:'
	dwo.object.t_trait.text = 'Treatment Procedures'
	dwo.object.t_paieinit.text = 'Initial payment:'
	dwo.object.t_versement.text = 'monthly payment of'
	dwo.object.t_lastpaie.text = 'One last payment of:'
	dwo.object.t_hono.text = 'Retention / Observation Fee:'
	dwo.object.t_estime.text = 'Estimated Total Fee (if applicable):'
	dwo.object.t_dateapp.text = 'Approximate duration of the treatment:'
	dwo.object.t_remarque1.text = 'This is a fee estimate for recommended orthodontic services.'
	dwo.object.t_remarque2.text = 'These services and fees may vary during treatment.'
	dwo.object.t_commentaire.text = 'ADDITIONAL EXPLANATORY COMMENTS:'
	dwo.object.t_nbmois.text = 'The information on this Insurance form is valid for :            months from above date.'
	dwo.object.t_signature.text = 'SIGNATURE OF CERTIFIED ORTHODONTIST'
	dwo.object.t_adeterminer.text = 'To be determinated'
else
	dwo.object.t_date.text = datefr(today())
end if
end subroutine

public subroutine uf_setass ();long ll_idass,ll_ass[],i=1

il_ass[] = ll_ass[]

DECLARE cur CURSOR FOR

	select assurance_id
	from assurance_formulaire
	where patient_id = :il_idpat;

OPEN cur;

FETCH cur INTO :ll_idass;

DO WHILE SQLCA.SQLCODE = 0
	il_ass[i] = ll_idass
	i++
	FETCH cur INTO :ll_idass;
LOOP

CLOSE cur;
end subroutine

public subroutine uf_hideheader (datastore dwo);dwo.object.t_1.visible = 0
//dwo.object.t_24.visible = 0
dwo.object.t_23.visible = 0
//dwo.object.t_25.visible = 0
dwo.object.t_specnom.visible = 0
dwo.object.cp_ortho.visible = 0
dwo.object.t_specadd.visible = 0
dwo.object.ortho_id_dr_adresse.visible = 0
dwo.object.t_specvilleprov.visible = 0
dwo.object.compute_1.visible = 0
dwo.object.t_speczip.visible = 0
dwo.object.ortho_id_dr_code_postal.visible = 0
dwo.object.ortho_id_telephone_t.visible = 0
dwo.object.ortho_id_dr_tel_bur.visible = 0
dwo.object.t_specnumero.visible = 0
dwo.object.ortho_id_dr_numero.visible = 0
end subroutine

on w_assurance1.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.st_patnom=create st_patnom
this.cb_add=create cb_add
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_title=create st_title
this.cb_1=create cb_1
this.cb_delete=create cb_delete
this.cb_print=create cb_print
this.cb_transfert=create cb_transfert
this.cb_update=create cb_update
this.cb_close=create cb_close
this.dw_assurance=create dw_assurance
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.st_patnom
this.Control[iCurrent+3]=this.cb_add
this.Control[iCurrent+4]=this.pb_4
this.Control[iCurrent+5]=this.pb_3
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.st_title
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_delete
this.Control[iCurrent+11]=this.cb_print
this.Control[iCurrent+12]=this.cb_transfert
this.Control[iCurrent+13]=this.cb_update
this.Control[iCurrent+14]=this.cb_close
this.Control[iCurrent+15]=this.dw_assurance
end on

on w_assurance1.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.st_patnom)
destroy(this.cb_add)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_title)
destroy(this.cb_1)
destroy(this.cb_delete)
destroy(this.cb_print)
destroy(this.cb_transfert)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.dw_assurance)
end on

event open;/////////////////////
// 
// Créé par: Eric Vezina
// Créé le: 04-08-2004
// Demande: 
// Version: 7.8.4
// Modifié par: Eric Vezina
// Modifié le: 21-10-2004
//
// Le paramètre passé est le patient_id qui ne doit pas être null.
// Chaque patient peut avoir plusieurs formulaires d'assurances.
// Pour changer de formulaire d'assurance, il faut utiliser les flèches en haut de la fenêtre.
//
//////////////////////

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

long ll_nbrow,ll_findrow,ll_lastid

// Initialiser les variables d'instances
il_idpat = message.doubleparm
select patient_prenom + ' ' + patient_nom into :st_patnom.text from patient where patient_id = :il_idpat;

select langue into :is_langue from patient where patient_id = :il_idpat;

dw_assurance.event ue_retrieve()

dw_assurance.event ue_langue()
end event

type cb_2 from commandbutton within w_assurance1
integer x = 2272
integer y = 1928
integer width = 398
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copier"
end type

event clicked;string ls_desc1, ls_desc2, ls_desch = "", ls_descb = ""
long ll_idcontact
boolean lb_h, lb_b
n_cst_fusion luo_fusion


select id_contact into :ll_idcontact from patient where patient_id = :il_idpat;

DECLARE listinfo CURSOR FOR
	select isnull(t_plans.description,'') as desc1,
			 isnull(t_plantrait.description,'') as desc2,
			 ISNULL(t_catplans.haut, 0),
			 ISNULL(t_catplans.bas, 0)
	from t_plantrait inner join t_plans on t_plantrait.id_plan = t_plans.id_plan
						  inner join t_catplans on t_plans.id_catplan = t_catplans.id_catplan
	where present = 1 and patient_id = :il_idpat
	order by t_plans.id_catplan ASC, t_plans.ordre ASC;
	
OPEN listinfo;

FETCH listinfo INTO :ls_desc1, :ls_desc2, :lb_h, :lb_b;

DO WHILE SQLCA.SQLCode = 0
	
	if lb_h then ls_desch += luo_fusion.of_fusion(ls_desc1, ll_idcontact, 0) + ' ' + ls_desc2 + '. '
	if lb_b then ls_descb += luo_fusion.of_fusion(ls_desc1, ll_idcontact, 0) + ' ' + ls_desc2 + '. '
	FETCH listinfo INTO :ls_desc1, :ls_desc2, :lb_h, :lb_b;
	
LOOP

CLOSE listinfo;

dw_assurance.setItem(dw_assurance.getRow(),'description',ls_desch)
dw_assurance.setItem(dw_assurance.getRow(),'commentaire',ls_descb)

end event

type st_patnom from statictext within w_assurance1
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
string text = "FORMULAIRE D~'ASSURANCE"
boolean focusrectangle = false
end type

type cb_add from commandbutton within w_assurance1
integer y = 1928
integer width = 439
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;if change then
	sauve()
end if
dw_assurance.event ue_insert()
dw_assurance.event ue_retrieve()
end event

type pb_4 from picturebutton within w_assurance1
integer x = 3525
integer width = 110
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "VCRLast!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_assurance.ScrollToRow(upperbound(il_ass[])) 
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type pb_3 from picturebutton within w_assurance1
integer x = 3424
integer width = 110
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "VCRNext!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_assurance.ScrollNextRow()
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type pb_2 from picturebutton within w_assurance1
integer x = 1902
integer width = 110
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "VCRFirst!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_assurance.ScrollToRow(1)
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type pb_1 from picturebutton within w_assurance1
integer x = 2002
integer width = 110
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "VCRPrior!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_assurance.ScrollPriorRow()
//il_idcontact = dw_assurance.getitemnumber(dw_assurance.getrow(),'id_contact')
st_title.event ue_title()
end event

type st_title from statictext within w_assurance1
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
string text = "Formulaire d~'assurance"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_title();integer i,li_nbass,z = 0
long ll_idass

li_nbass = upperbound(il_ass[])
ll_idass = dw_assurance.getitemnumber(dw_assurance.getrow(),'assurance_id')
for i = 1 to li_nbass
	if il_ass[i] = ll_idass then
		z = i
	end if
next
if v_langue = 'an' then
	this.text = 'Insurance Form ' + string(z) + ' of ' + string(li_nbass)
else
	this.text = 'Formulaire ' + string(z) + ' de ' + string(li_nbass)
end if
end event

type cb_1 from commandbutton within w_assurance1
integer x = 1312
integer y = 1928
integer width = 521
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer estimé"
end type

event clicked;/////////////////////////////////////
// Créé par: Dave tremblay
// Créé le: 19-12-2003
// Demande: LR
// Version: 7.6.1
// Modifié par: Sébastien Tremblay
// Modifié le: 27-10-2003
/////////////////////////////////////

long ll_idass
string comment, comment2, is_filter, is_filter1, ls_premiercaract,ls_premiercaract2,patnom,patprenom, ls_courriel_destinataire
boolean isvalid, isvalid2
int ok,li_header

select email into :ls_courriel_destinataire from patient where patient_id = :il_idpat;
gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail", ls_courriel_destinataire)

ll_idass = dw_assurance.getitemnumber(dw_assurance.getrow(),'assurance_id')
datastore ds_assurance
datastore ds_assurance2
datastore ds_estime
select estdelheader into :li_header from t_options where ortho_id = :v_no_ortho;

ds_estime = create datastore
ds_estime.dataobject = 'd_assestime'
if change then 
	sauve()
else	
	ds_estime.SetTransObject(SQLCA)
	ds_estime.retrieve(ll_idass)
	uf_estlangue(ds_estime)
	dw_assurance.object.t_firstexam.visible = false
	dw_assurance.object.date_premier_examen.visible = false
	dw_assurance.object.montant_1.visible = false
//	dw_assurance.object.t_hono.visible = false
//	dw_assurance.object.montant_6.visible = false
	ds_estime.object.t_firstexam.visible = false
	ds_estime.object.date_premier_examen.visible = false
	ds_estime.object.montant_1.visible = false
//	ds_estime.object.dw_ass.object.t_hono.visible = false
//	ds_estime.object.dw_ass.object.montant_6.visible = false

	left(dw_assurance.getItemString(dw_assurance.getRow(),'description'),1)
	ls_premiercaract2 = left(dw_assurance.getItemString(dw_assurance.getRow(),'commentaire'),1)
	if isnumber(ls_premiercaract) then
		comment = dw_assurance.getItemString(dw_assurance.getRow(),'description')
		isvalid = valid_desc(comment)
	else
		isvalid = false
	end if
	if isnumber(ls_premiercaract2) then
		comment2 = dw_assurance.getItemString(dw_assurance.getRow(),'commentaire')
		isvalid2 = valid_desc(comment2)
	else 
		isvalid2 = false
	end if
	// signature electronique
	if isvalid = false and isvalid2 = false then
		//a determiner
		if isnull(ds_estime.getItemDate(ds_estime.getRow(),'assurance_formulaire_datetrait')) then
			ds_estime.object.assurance_formulaire_datetrait.visible = false
			if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_premier_examen')) then
				ds_estime.object.date_premier_examen.visible = false
			end if
			if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_phase')) then
				ds_estime.object.date_phase.visible = false
			end if
			ds_estime.object.date_paiement_initial.visible = false
			ds_estime.object.t_adeterminer.visible = true
		end if
		gb_datawindow = false
		
		if li_header = 1 then
			ds_estime.object.rr_1.visible = false
			ds_estime.object.ortho_id_dr_nom_complet.visible = false
			ds_estime.object.ortho_id_dr_adresse.visible = false
			ds_estime.object.compute_1.visible = false
			ds_estime.object.ortho_id_dr_code_postal.visible = false
			ds_estime.object.ortho_id_dr_tel_bur.visible = false
		end if
		
		openwithparm(w_print_options,ds_estime)
	else
		if isvalid = true and isvalid2 = false then
		   ds_estime.setItem(ds_estime.getRow(),'description','Voir Annexe 1')
			//a determiner
			if isnull(ds_estime.getItemDate(ds_estime.getRow(),'assurance_formulaire_datetrait')) then
				ds_estime.object.assurance_formulaire_datetrait.visible = false
				if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_premier_examen')) then
					ds_estime.object.date_premier_examen.visible = false
				end if
				if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_phase')) then
					ds_estime.object.date_phase.visible = false
				end if
				ds_estime.object.date_paiement_initial.visible = false
				ds_estime.object.t_adeterminer.visible = true
			end if
			gb_datawindow = false
			if li_header = 1 then
				ds_estime.object.rr_1.visible = false
				ds_estime.object.ortho_id_dr_nom_complet.visible = false
				ds_estime.object.ortho_id_dr_adresse.visible = false
				ds_estime.object.compute_1.visible = false
				ds_estime.object.ortho_id_dr_code_postal.visible = false
				ds_estime.object.ortho_id_dr_tel_bur.visible = false
			end if
			openwithparm(w_print_options,ds_estime)
		   ds_assurance = create datastore
		   ds_assurance.dataobject = "d_assuranceajoutimp"
		   ds_assurance.SetTransObject(SQLCA)
		   is_filter = traitement_annexe(comment, w_patient.vi_langage)
		   ds_assurance.setfilter(is_filter)
		   ds_assurance.retrieve()
			select patient_nom,patient_prenom into :patnom, :patprenom from patient where patient_id = :il_idpat;
			ds_assurance.object.t_pat.text = patnom + ' ' + patprenom
			ds_assurance.print()
		   destroy ds_assurance
	   else
			if isvalid = false and isvalid2 = true then
		      ds_estime.setItem(ds_estime.getRow(),'commentaire','Voir Annexe 2')
				//a determiner
				if isnull(ds_estime.getItemDate(ds_estime.getRow(),'assurance_formulaire_datetrait')) then
					ds_estime.object.assurance_formulaire_datetrait.visible = false
					if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_premier_examen')) then
						ds_estime.object.date_premier_examen.visible = false
					end if
					if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_phase')) then
						ds_estime.object.date_phase.visible = false
					end if
					ds_estime.object.date_paiement_initial.visible = false
					ds_estime.object.t_adeterminer.visible = true
				end if
				gb_datawindow = false
				if li_header = 1 then
					ds_estime.object.rr_1.visible = false
					ds_estime.object.ortho_id_dr_nom_complet.visible = false
					ds_estime.object.ortho_id_dr_adresse.visible = false
					ds_estime.object.compute_1.visible = false
					ds_estime.object.ortho_id_dr_code_postal.visible = false
					ds_estime.object.ortho_id_dr_tel_bur.visible = false
				end if
				openwithparm(w_print_options,ds_estime)
				ds_assurance = create datastore
				ds_assurance.dataobject = "d_assuranceajoutimp1"
				ds_assurance.SetTransObject(SQLCA)
				is_filter1 = traitement_annexe(comment2, w_patient.vi_langage)
				ds_assurance.setfilter(is_filter1)
				ds_assurance.retrieve()
				select patient_nom,patient_prenom into :patnom, :patprenom from patient where patient_id = :il_idpat;
				ds_assurance.object.t_pat.text = patnom + ' ' + patprenom
				ds_assurance.print()
				destroy ds_assurance
			else
				ds_estime.setItem(ds_estime.getRow(),'description','Voir Annexe 1')
			   ds_estime.setItem(ds_estime.getRow(),'commentaire','Voir Annexe 2')
				//a determiner
				if isnull(ds_estime.getItemDate(ds_estime.getRow(),'assurance_formulaire_datetrait')) then
					ds_estime.object.assurance_formulaire_datetrait.visible = false
					if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_premier_examen')) then
						ds_estime.object.date_premier_examen.visible = false
					end if
					if isnull(ds_estime.getItemDate(ds_estime.getRow(),'date_phase')) then
						ds_estime.object.date_phase.visible = false
					end if
					ds_estime.object.date_paiement_initial.visible = false
					ds_estime.object.t_adeterminer.visible = true
				end if
				gb_datawindow = false
				if li_header = 1 then
					ds_estime.object.rr_1.visible = false
					ds_estime.object.ortho_id_dr_nom_complet.visible = false
					ds_estime.object.ortho_id_dr_adresse.visible = false
					ds_estime.object.compute_1.visible = false
					ds_estime.object.ortho_id_dr_code_postal.visible = false
					ds_estime.object.ortho_id_dr_tel_bur.visible = false
				end if
				openwithparm(w_print_options,ds_estime)
				ds_assurance = create datastore
				ds_assurance2 = create datastore
				ds_assurance.dataobject = "d_assuranceajoutimp"
				ds_assurance2.dataobject = "d_assuranceajoutimp1"
				ds_assurance.SetTransObject(SQLCA)
				ds_assurance2.SetTransObject(SQLCA)
				is_filter = traitement_annexe(comment, w_patient.vi_langage)
				is_filter1 = traitement_annexe(comment2, w_patient.vi_langage)
				ds_assurance.setfilter(is_filter)
				ds_assurance.retrieve()
				ds_assurance2.setfilter(is_filter1)
				ds_assurance2.retrieve()
				select patient_nom,patient_prenom into :patnom, :patprenom from patient where patient_id = :il_idpat;
				ds_assurance.object.t_pat.text = patnom + ' ' + patprenom
				ds_assurance2.object.t_pat.text = patnom + ' ' + patprenom
				ds_assurance.print()
				ds_assurance2.Print()
				destroy ds_assurance
				destroy ds_assurance2
			end if
	   end if
	end if
end if

end event

event constructor;if v_langue = 'an' then
	this.text = "Print estimate"
end if
end event

type cb_delete from commandbutton within w_assurance1
integer x = 434
integer y = 1928
integer width = 439
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;/////////////////////
// 
// Créé par: Sebastien Tremblay
// Créé le: 27-10-2003
// Demande: 
// Version:
// Modifié par: 
// Modifié le:
//
//////////////////////
long ll_assid

ll_assid = dw_assurance.getitemnumber(dw_assurance.getrow(),'assurance_id')
delete from assurance_formulaire where assurance_id = :ll_assid;
dw_assurance.event ue_retrieve()

st_title.event ue_title()
end event

event constructor;if v_langue = 'an' then
	this.text = "Delete"
end if
end event

type cb_print from commandbutton within w_assurance1
integer x = 873
integer y = 1928
integer width = 439
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;/////////////////////
// Créé par: Dave tremblay
// Créé le: 20-01-2001
// Demande: DP
// Version: 7.8.4
// Modifié par: Dave Tremblay
// Modifié le: 06-08-2004
//////////////////////


// Cette fonction permet d'imprimer les rapports d'assurance pour le contact en
// question
long ll_idass, ll_hideinsuranceheader
string comment, comment2, is_filter, is_filter1, ls_premiercaract,ls_premiercaract2
string patnom,patprenom,ls_annexe1,ls_annexe2, ls_msg, ls_email, ls_email2, ls_email3, ls_courriel
boolean isvalid, isvalid2, lb_estdelheader
long ll_row, ll_nbrow
int ok,li_hidetobedetermined
date ldt
datastore ds_ass, ds_assurance, ds_assurance2

ll_idass = dw_assurance.getitemnumber(dw_assurance.getrow(),'assurance_id')
select asshidetobedetermined into :li_hidetobedetermined from t_options where ortho_id = :v_no_ortho;

// Le traduire si la langue du patient est anglais
if is_langue = 'A' then
	ls_annexe1 = 'See Annex 1'
	ls_annexe2 = 'See Annex 2'
else
	ls_annexe1 = 'Voir Annexe 1'
	ls_annexe2 = 'Voir Annexe 2'
end if
//dw_assurance_entete.event ue_langue()

if change then 
	sauve()
else
	ds_ass = create datastore
	ds_ass.dataobject = 'd_assurance_entete'
	ds_ass.setTransObject(SQLCA)
	ll_nbrow = ds_ass.retrieve(ll_idass)
	if ll_nbrow > 0 then
		if is_langue = 'A' then
			uf_langue(ds_ass)
		end if
		
		lb_estdelheader = false
		select isnull(hideinsuranceheader,0) into :ll_hideinsuranceheader from t_options where ortho_id = :v_no_ortho;
		
		
		
		if ll_hideinsuranceheader = 1 then
			uf_hideheader(ds_ass)
		end if
		
		ls_premiercaract = left(dw_assurance.getItemString(dw_assurance.getRow(),'description'),1)
		ls_premiercaract2 = left(dw_assurance.getItemString(dw_assurance.getRow(),'commentaire'),1)
		if isnumber(ls_premiercaract) then
			comment = dw_assurance.getItemString(dw_assurance.getRow(),'description')
			isvalid = valid_desc(comment)
		else
			isvalid = false
		end if
		if isnumber(ls_premiercaract2) then
			comment2 = dw_assurance.getItemString(dw_assurance.getRow(),'commentaire')
			isvalid2 = valid_desc(comment2)
		else 
			isvalid2 = false
		end if

		// Imprimer le cas ou il n'y a pas d'annexe
		if isvalid = false and isvalid2 = false then
			if isnull(ds_ass.getItemDate(ds_ass.getRow(),'assurance_formulaire_datetrait')) then
				ds_ass.object.assurance_formulaire_datetrait.visible = false
				if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_premier_examen')) then
					ds_ass.object.date_premier_examen.visible = false
				end if
				if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_phase')) then
					ds_ass.object.date_phase.visible = false
				end if
				ds_ass.object.date_paiement_initial.visible = false
				if li_hidetobedetermined = 1 then
					ds_ass.object.t_adeterminer.visible = false
				else
					ds_ass.object.t_adeterminer.visible = true
				end if
			end if
			
			select isnull(email,''), isnull(email2,''), isnull(email3,'') 
			into :ls_email, :ls_email2,:ls_email3 
			from patient where patient_id = :il_idpat;
			
			ls_courriel = ls_email
			if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
			if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)
			gb_datawindow = false
			openwithparm(w_print_options,ds_ass)
		else
			if isvalid = true and isvalid2 = false then
				ds_ass.setItem(ds_ass.getRow(),'description',ls_annexe1)	
				if isnull(ds_ass.getItemDate(ds_ass.getRow(),'assurance_formulaire_datetrait')) then
					ds_ass.object.assurance_formulaire_datetrait.visible = false
					if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_premier_examen')) then
						ds_ass.object.date_premier_examen.visible = false
					end if
					if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_phase')) then
						ds_ass.object.date_phase.visible = false
					end if
					ds_ass.object.date_paiement_initial.visible = false
					if li_hidetobedetermined = 1 then
						ds_ass.object.t_adeterminer.visible = false
					else
						ds_ass.object.t_adeterminer.visible = true
					end if
				end if
				select isnull(email,''), isnull(email2,''), isnull(email3,'') 
				into :ls_email, :ls_email2,:ls_email3 
				from patient where patient_id = :il_idpat;
				
				ls_courriel = ls_email
				if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
				if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
				gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)
				gb_datawindow = false
				openwithparm(w_print_options,ds_ass)
				ds_assurance = create datastore
				ds_assurance.dataobject = "d_assuranceajoutimp"
				ds_assurance.SetTransObject(SQLCA)
				is_filter = traitement_annexe(comment, is_langue)
				ds_assurance.setfilter(is_filter)
				ds_assurance.retrieve(v_no_ortho)
				select patient_nom,patient_prenom into :patnom, :patprenom from patient where patient_id = :il_idpat;
				ds_assurance.object.t_pat.text = patnom + ' ' + patprenom
				ds_assurance.print()
				destroy ds_assurance
			else
				if isvalid = false and isvalid2 = true then
					ds_ass.setItem(ds_ass.getRow(),'commentaire',ls_annexe2)
					if isnull(ds_ass.getItemDate(ds_ass.getRow(),'assurance_formulaire_datetrait')) then
						ds_ass.object.assurance_formulaire_datetrait.visible = false
						if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_premier_examen')) then
							ds_ass.object.date_premier_examen.visible = false
						end if
						if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_phase')) then
							ds_ass.object.date_phase.visible = false
						end if
						ds_ass.object.date_paiement_initial.visible = false
						if li_hidetobedetermined = 1 then
							ds_ass.object.t_adeterminer.visible = false
						else
							ds_ass.object.t_adeterminer.visible = true
						end if
					end if
					select isnull(email,''), isnull(email2,''), isnull(email3,'') 
					into :ls_email, :ls_email2,:ls_email3 
					from patient where patient_id = :il_idpat;
					
					ls_courriel = ls_email
					if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
					if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
					gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)
					gb_datawindow = false
					openwithparm(w_print_options,ds_ass)
					ds_assurance = create datastore
					ds_assurance.dataobject = "d_assuranceajoutimp1"
					ds_assurance.SetTransObject(SQLCA)
					is_filter1 = traitement_annexe(comment2, is_langue)
					ds_assurance.setfilter(is_filter1)
					ds_assurance.retrieve(v_no_ortho)
					select patient_nom,patient_prenom into :patnom, :patprenom from patient where patient_id = :il_idpat;
					ds_assurance.object.t_pat.text = patnom + ' ' + patprenom
					ds_assurance.print()
					destroy ds_assurance
				else
					ds_ass.setItem(ds_ass.getRow(),'description',ls_annexe1)
					ds_ass.setItem(ds_ass.getRow(),'commentaire',ls_annexe2)
					if isnull(ds_ass.getItemDate(ds_ass.getRow(),'assurance_formulaire_datetrait')) then
						ds_ass.object.assurance_formulaire_datetrait.visible = false
						if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_premier_examen')) then
							ds_ass.object.date_premier_examen.visible = false
						end if
						if isnull(ds_ass.getItemDate(ds_ass.getRow(),'date_phase')) then
							ds_ass.object.date_phase.visible = false
						end if
						ds_ass.object.date_paiement_initial.visible = false
						if li_hidetobedetermined = 1 then
							ds_ass.object.t_adeterminer.visible = false
						else
							ds_ass.object.t_adeterminer.visible = true
						end if
					end if
					select isnull(email,''), isnull(email2,''), isnull(email3,'') 
					into :ls_email, :ls_email2,:ls_email3 
					from patient where patient_id = :il_idpat;
					
					ls_courriel = ls_email
					if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
					if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
					gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)
					gb_datawindow = false
					openwithparm(w_print_options,ds_ass)
					ds_assurance = create datastore
					ds_assurance2 = create datastore
					ds_assurance.dataobject = "d_assuranceajoutimp"
					ds_assurance2.dataobject = "d_assuranceajoutimp1"
					ds_assurance.SetTransObject(SQLCA)
					ds_assurance2.SetTransObject(SQLCA)
					is_filter = traitement_annexe(comment, is_langue)
					is_filter1 = traitement_annexe(comment2, is_langue)
					ds_assurance.setfilter(is_filter)
					ds_assurance.retrieve(v_no_ortho)
					ds_assurance2.setfilter(is_filter1)
					ds_assurance2.retrieve(v_no_ortho)
					select patient_nom,patient_prenom into :patnom, :patprenom from patient where patient_id = :il_idpat;
					ds_assurance.object.t_pat.text = patnom + ' ' + patprenom
					ds_assurance2.object.t_pat.text = patnom + ' ' + patprenom
					ds_assurance.print()
					ds_assurance2.Print()
					destroy ds_assurance
					destroy ds_assurance2
				end if
			end if
		end if
		
		// Logguer l'envoi d'un état de compte
		
		if v_langue = 'an' then
			insert into t_histonote(datehisto,histonote,id_personnel,patient_id)
			values(current timestamp, 'Insurance form has been printed',:gl_idpers,:il_idpat);
		else
			ls_msg = "Impression du formulaire d'assurance"
			insert into t_histonote(datehisto,histonote,id_personnel,patient_id)
			values(current timestamp, :ls_msg,:gl_idpers,:il_idpat);
		end if
		if error_type(-1) = 1 then
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
		
	else
		messagebox("Problème",string(ll_nbrow))
	end if
end if

end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type cb_transfert from commandbutton within w_assurance1
integer x = 1833
integer y = 1928
integer width = 439
integer height = 108
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Transfert"
end type

event clicked;dw_assurance.event ue_setformulaire()
end event

type cb_update from commandbutton within w_assurance1
integer x = 2670
integer y = 1928
integer width = 439
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;/* Cette procédure permet de sauver les modifications apportées à la datawindow
   Auteur: Dave Tremblay
	Compagnie: II4NET Inc.
	Date: 03-05-2002
	modifié le: 03-05-2002
*/

sauve()
end event

event constructor;if v_langue = 'an' then
	this.text = "Update"
end if
end event

type cb_close from commandbutton within w_assurance1
integer x = 3109
integer y = 1928
integer width = 439
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;// Fermeture propre de la fenêtre w_assurance

if change then 
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

type dw_assurance from u_dw within w_assurance1
event ue_insert ( )
event ue_langue ( )
event ue_setformulaire ( )
event ue_retrieve ( )
integer y = 96
integer width = 3630
integer height = 1828
integer taborder = 10
string dataobject = "d_assurance"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insert();integer li_duree

select isnull(defdurformass, 0) into :li_duree from t_options where ortho_id = :v_no_ortho;

insert into assurance_formulaire(patient_id,montant_1,montant_2,montant_3,montant_4,montant_5,montant_6,dernpaie,versement,nb_mois,dateassurance)
values(:il_idpat,0,0,0,0,0,0,0,0,:li_duree,today());
if error_type(-1) = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if

ii_modeajout = 1
change = true
end event

event ue_langue();if is_langue = 'A' then
	object.t_desc.text = 'BRIEF DESCRIPTION OF CONDITION:'
	object.t_dateeff.text = 'STARTING DATE OF ACTIVE TREATMENT:'
	object.t_arrangement.text = 'FINANCIAL ARRANGEMENTS:'
	object.t_travail.text = 'Preparatory Procedures'
	object.t_firstexam.text = 'Initial examination:'
	object.t_diag.text = 'Diagnostic phase:'
	object.t_trait.text = 'Treatment Procedures'
	object.t_paieinit.text = 'Initial payment:'
	object.t_versement.text = 'monthly payment of'
	object.t_lastpaie.text = 'One last payment of:'
	object.t_hono.text = 'Retention / Observation Fee:'
	object.t_estime.text = 'Estimated Total Fee (if applicable):'
	object.t_dateapp.text = 'Approximate duration of the treatment:'
	object.t_remarque1.text = 'This is a fee estimate for recommended orthodontic services.'
	object.t_remarque2.text = 'These services and fees may vary during treatment.'
	object.t_commentaire.text = 'ADDITIONAL EXPLANATORY COMMENTS:'
	object.t_nbmois.text = 'The information on this Insurance form is valid for :            months from above date.'
	object.t_signature.text = 'SIGNATURE OF CERTIFIED ORTHODONTIST'
	object.t_adeterminer.text = 'To be determined'
end if
end event

event ue_setformulaire();long row,ll_phase,ll_cnt,ll_contact
integer li_duree1,li_duree2
dec{2} ld_cons,ld_diag,ld_meb,ld_retfee,ld_paiefinal,ld_mmontant,ld_mqty,ld_initial
date ldt_date1,ldt_mdate1, ldt_diag, ldt_meb

row = getrow()

ll_phase = getItemNumber(row,'id_phase')

select count(1)
into :ll_cnt
from t_contrats
where patient_id = :il_idpat and 
		id_phase = :ll_phase;

if ll_cnt > 1 then
	openwithparm(w_chcontact, string(il_idpat) + '~t' + string(ll_phase))
	
	ll_contact = message.doubleParm
	
	if ll_contact = -1 then return
	
	if ll_contact = 0 then
		select sum(isnull(cons, 0)),
				 sum(isnull(diag, 0)),
				 min(datediag),
				 sum(isnull(meb, 0)),
				 min(datemeb),
				 sum(isnull(retfee, 0)),
				 sum(isnull(paiefinal, 0)),
				 sum(isnull(mmontant, 0)),
				 max(mqty),
				 sum(isnull(initial, 0)),
				 min(date1),
				 min(mdate1),
				 sum(isnull(duree1, 0)),
				 sum(isnull(duree2, 0))
		into :ld_cons,:ld_diag,:ldt_diag,:ld_meb,:ldt_meb,:ld_retfee,:ld_paiefinal,:ld_mmontant,:ld_mqty,:ld_initial,:ldt_date1,:ldt_mdate1,:li_duree1,:li_duree2
		from t_contrats
		where patient_id = :il_idpat and
				id_phase = :ll_phase;
	else
		select cons,diag,datediag,meb,datemeb,retfee,paiefinal,mmontant,mqty,initial,date1,mdate1,duree1,duree2
		into :ld_cons,:ld_diag,:ldt_diag,:ld_meb,:ldt_meb,:ld_retfee,:ld_paiefinal,:ld_mmontant,:ld_mqty,:ld_initial,:ldt_date1,:ldt_mdate1,:li_duree1,:li_duree2
		from t_contrats
		where id_contact = :ll_contact and
				patient_id = :il_idpat and
				id_phase = :ll_phase;
	end if
else
	select cons,diag,datediag,meb,datemeb,retfee,paiefinal,mmontant,mqty,initial,date1,mdate1,duree1,duree2
	into :ld_cons,:ld_diag,:ldt_diag,:ld_meb,:ldt_meb,:ld_retfee,:ld_paiefinal,:ld_mmontant,:ld_mqty,:ld_initial,:ldt_date1,:ldt_mdate1,:li_duree1,:li_duree2
	from t_contrats
	where patient_id = :il_idpat and
			id_phase = :ll_phase;
end if

if isnull(ldt_diag) then ldt_diag = ldt_date1
if isnull(ldt_meb) then ldt_meb = ldt_date1

dw_assurance.setitem(row,'montant_1',ld_cons)
dw_assurance.setitem(row,'montant_2',ld_diag)
dw_assurance.setitem(row,'montant_6',ld_retfee)
dw_assurance.setitem(row,'montant_5',ld_paiefinal)
dw_assurance.setitem(row,'montant_4',ld_mmontant)
dw_assurance.setitem(row,'versement',ld_mqty)
dw_assurance.setitem(row,'montant_3',ld_initial + ld_meb)
dw_assurance.setitem(row,'date_debut_traitement',ldt_date1)
dw_assurance.setitem(row,'date_premier_examen',ldt_date1)
dw_assurance.setitem(row,'date_phase',ldt_diag)
dw_assurance.setitem(row,'date_paiement_initial',ldt_meb)
if is_langue = 'F' then
	dw_assurance.setitem(row,'dureeapp',string(li_duree1) + ' à ' + string(li_duree2) + ' mois')
else
	dw_assurance.setitem(row,'dureeapp',string(li_duree1) + ' to ' + string(li_duree2) + ' month')
end if
end event

event ue_retrieve();long ll_nbrow,ll_lastid,ll_findrow

ll_nbrow = dw_assurance.retrieve(il_idpat,v_no_ortho)
// si aucun formulaire, en ajoute un nouveau
if ll_nbrow = 0 then
	dw_assurance.event ue_insert()
	dw_assurance.retrieve(il_idpat,v_no_ortho)
end if
// construit la table des assurances
uf_setass()
// focus sur le dernier fomulaire
select max(assurance_id) into :ll_lastid from assurance_formulaire where patient_id = :il_idpat;
ll_findrow = dw_assurance.find('assurance_id = ' + string(ll_lastid),1,ll_nbrow)
dw_assurance.scrolltorow(ll_findrow)
// inscrit le titre
st_title.event ue_title()
//dw_assurance.event ue_langue()
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event constructor;SetTransObject(SQLCA)
//cacher entente
SELECT asst1 INTO :ib_entente FROM t_options where ortho_id = :v_no_ortho;
if ib_entente then
	object.t_remarque1.visible = false
	object.t_remarque2.visible = false
end if

if this.GetChild('id_phase', dddw_phase) = -1 then
	error_type(0)
end if
dddw_phase.SetTransObject(SQLCA)
dddw_phase.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_phase.retrieve()
end event

event updateend;long ll_row, ll_assuranceid
integer test

if rowsinserted <> 0 then
	ll_row = dw_assurance.getrow()
	select max(assurance_id) into :ll_assuranceid from assurance_formulaire;
	dw_assurance.setitem(ll_row,'assurance_id',ll_assuranceid)
	if ii_modeajout = 1 then   
     	test = dw_assurance.setitemstatus(ll_row,'assurance_id',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'traitement_c_l',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'montant_1',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'montant_2',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'versement',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'montant_3',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'montant_4',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'montant_5',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'montant_6',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'nb_mois',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'date_debut_traitement',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'date_premier_examen',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'date_phase',primary!,notmodified!)
	   test = dw_assurance.setitemstatus(ll_row,'date_paiement_initial',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'autre_mode_paiement',primary!,notmodified!) 
		test = dw_assurance.setitemstatus(ll_row,'assurance_formulaire_patient_id',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'description',primary!,notmodified!)
		test = dw_assurance.setitemstatus(ll_row,'commentaire',primary!,notmodified!)  
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

event rbuttondown;call super::rbuttondown;uo_dynmenu luo_rappcons
m_popup m_rapp
string ls_cat, ls_desc
long		ll_id, ll_idcatplan, ll_count

if dwo.name = 'description' then
	
	SELECT 	count(*) into :ll_count 
		FROM	 	t_catplans INNER JOIN t_sujets ON t_catplans.id_sujet = t_sujets.id_sujet
		WHERE		isnull(rappconsult,0) = 1 AND
					isnull(haut,0) = 1 and
					t_sujets.ortho_id = :v_no_ortho;
	
	if ll_count >= 1 then
	
		is_champ = string(dwo.name)
	
		luo_rappcons = create uo_dynmenu
		m_rapp = create m_popup
		luo_rappcons.of_init( m_rapp)
		
		// Ajouter la premier rangée du menu
		
		DECLARE listcat CURSOR FOR
			SELECT 	categorie,
						id_catplan
			FROM	 	t_catplans INNER JOIN t_sujets ON t_catplans.id_sujet = t_sujets.id_sujet
			WHERE		isnull(rappconsult,0) = 1 and
						isnull(haut,0) = 1 and
						t_sujets.ortho_id = :v_no_ortho;
		
		OPEN listcat;
		
		FETCH listcat INTO :ls_cat, :ll_idcatplan;
		
		DO WHILE SQLCA.SQLCode = 0
			
			ll_id = luo_rappcons.fnvCreateDynTopLvlItem( ls_cat )
			
			DECLARE listtrait CURSOR FOR
				SELECT	description
				FROM		t_plans
				WHERE		id_catplan = :ll_idcatplan;
				
			OPEN listtrait;
			
			FETCH listtrait INTO :ls_desc;
			
			DO WHILE SQLCA.SQLCode = 0
			
				luo_rappcons.fnvCreateDynMenuitem(ls_desc, ll_id)
			
				FETCH listtrait INTO :ls_desc;
			
			LOOP
			
			CLOSE listtrait;
			
			FETCH listcat INTO :ls_cat, :ll_idcatplan;
		
		LOOP
			
		CLOSE listcat;
		
		m_rapp.popmenu (pointerx(), pointery())
	
		destroy m_rapp
		destroy luo_rappcons
	else
		error_type(1003)
	end if
elseif dwo.name = 'commentaire' then
	
	SELECT 	count(*) into :ll_count 
		FROM	 	t_catplans INNER JOIN t_sujets ON t_catplans.id_sujet = t_sujets.id_sujet
		WHERE		isnull(rappconsult,0) = 1 and
					isnull(bas,0) = 1 and
					t_sujets.ortho_id = :v_no_ortho;
	
	if ll_count >= 1 then
	
		is_champ = string(dwo.name)
	
		luo_rappcons = create uo_dynmenu
		m_rapp = create m_popup
		luo_rappcons.of_init( m_rapp)
		
		// Ajouter la premier rangée du menu
		
		DECLARE listcat2 CURSOR FOR
			SELECT 	categorie,
						id_catplan
			FROM	 	t_catplans INNER JOIN t_sujets ON t_catplans.id_sujet = t_sujets.id_sujet
			WHERE		isnull(rappconsult,0) = 1 and
						isnull(bas,0) = 1 and
						t_sujets.ortho_id = :v_no_ortho;
		
		OPEN listcat2;
		
		FETCH listcat2 INTO :ls_cat, :ll_idcatplan;
		
		DO WHILE SQLCA.SQLCode = 0
			
			ll_id = luo_rappcons.fnvCreateDynTopLvlItem( ls_cat )
			
			DECLARE listtrait2 CURSOR FOR
				SELECT	description
				FROM		t_plans
				WHERE		id_catplan = :ll_idcatplan;
				
			OPEN listtrait2;
			
			FETCH listtrait2 INTO :ls_desc;
			
			DO WHILE SQLCA.SQLCode = 0
			
				luo_rappcons.fnvCreateDynMenuitem(ls_desc, ll_id)
			
				FETCH listtrait2 INTO :ls_desc;
			
			LOOP
			
			CLOSE listtrait2;
			
			FETCH listcat2 INTO :ls_cat, :ll_idcatplan;
		
		LOOP
			
		CLOSE listcat2;
		
		m_rapp.popmenu (pointerx(), pointery())
	
		destroy m_rapp
		destroy luo_rappcons
	else
		error_type(1003)
	end if
end if

end event

