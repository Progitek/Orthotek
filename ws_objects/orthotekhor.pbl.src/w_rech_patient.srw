$PBExportHeader$w_rech_patient.srw
forward
global type w_rech_patient from w_response
end type
type dw_tempsdoc from u_dw within w_rech_patient
end type
type st_day from statictext within w_rech_patient
end type
type cb_newpat from commandbutton within w_rech_patient
end type
type dw_horrechpatviewdt from u_dw within w_rech_patient
end type
type em_duree from editmask within w_rech_patient
end type
type st_1 from statictext within w_rech_patient
end type
type dw_types_traitements_hor from u_dw within w_rech_patient
end type
type cb_annuler from commandbutton within w_rech_patient
end type
type cb_search from commandbutton within w_rech_patient
end type
type sle_rech from singlelineedit within w_rech_patient
end type
type dw_rech from u_dw within w_rech_patient
end type
end forward

shared variables

end variables

global type w_rech_patient from w_response
integer width = 3054
integer height = 2356
boolean controlmenu = false
long backcolor = 78690504
boolean center = true
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
dw_tempsdoc dw_tempsdoc
st_day st_day
cb_newpat cb_newpat
dw_horrechpatviewdt dw_horrechpatviewdt
em_duree em_duree
st_1 st_1
dw_types_traitements_hor dw_types_traitements_hor
cb_annuler cb_annuler
cb_search cb_search
sle_rech sle_rech
dw_rech dw_rech
end type
global w_rech_patient w_rech_patient

type variables
private integer ii_horstep,ii_hidetrait1,ii_archive
private boolean ib_flash = true, ib_modrdv = false
private s_pat is_patold,is_patnew
end variables

forward prototypes
public subroutine uf_ortho2vistadent ()
public subroutine changestatus (long al_traitid, long al_patid)
end prototypes

public subroutine uf_ortho2vistadent ();integer li_vistadent,li_FileNum
long enr	
string ls_vistworkdir,ls_patcp,ls_naiss,ls_telres,ls_telbur,ls_telcell,ls_telautre

//start - compatibilite avec vistadent
select ortho2vistadent into :li_vistadent from t_options where ortho_id = :v_no_ortho;
if li_vistadent = 1 then
	dw_rech.setitem(enr,'idvistadent',w_horaire.is_pat.patid)
	w_horaire.is_pat.idvist = w_horaire.is_pat.patid
end if

if li_vistadent = 1 and isnull(w_horaire.is_pat.idvist) = false then
	RegistryGet("HKEY_CURRENT_USER\Software\RX Video\Portrait","Working",RegString!,ls_vistworkdir)
	if not fileexists(ls_vistworkdir) then
		error_type(153)
		return
	end if

//creation du fichier
ls_patcp = '[Patient]~r~n&
Patient ID='+string(w_horaire.is_pat.idvist)+'~r~n&
Title=~r~n&
First Name='+w_horaire.is_pat.patprenom+'~r~n&
Middle Name=~r~n&
Last Name='+w_horaire.is_pat.patnom+'~r~n&
Preferred Name='+w_horaire.is_pat.patprenom+" "+w_horaire.is_pat.patnom+'~r~n&
Sex=~r~n&
Birth Date='+ls_naiss+'~r~n&
Home Phone='+ls_telres+'~r~n&
Work Phone='+ls_telbur+'~r~n&
Cell Phone='+ls_telcell+'~r~n&
Pager Number='+ls_telautre+'~r~n&
E-mail=~r~n&
Address1=~r~n&
Address2=~r~n&
City=~r~n&
State=~r~n&
Zip Code=~r~n&
Model No=~r~n&
Race='
//	messagebox(ls_vistworkdir +"Vistface.ini",ls_patcp)
	li_FileNum = FileOpen(ls_vistworkdir+"Vistface.ini", LineMode!, Write!, LockWrite!, Replace!)
	FileWrite(li_FileNum, ls_patcp)
	FileClose(li_FileNum)
	run(ls_vistworkdir+"vistface.exe")
end if
//end - compatibilite avec vistadent
end subroutine

public subroutine changestatus (long al_traitid, long al_patid);long ll_idpatstatus

select id_patstatus into :ll_idpatstatus from type_de_traitement where type_de_traitement.type_traitement_id = :al_traitid;
if not isnull(ll_idpatstatus) then
	update patient set id_patstatus = :ll_idpatstatus where patient_id = :al_patid;
	if error_type(-1) = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
END IF
end subroutine

on w_rech_patient.create
int iCurrent
call super::create
this.dw_tempsdoc=create dw_tempsdoc
this.st_day=create st_day
this.cb_newpat=create cb_newpat
this.dw_horrechpatviewdt=create dw_horrechpatviewdt
this.em_duree=create em_duree
this.st_1=create st_1
this.dw_types_traitements_hor=create dw_types_traitements_hor
this.cb_annuler=create cb_annuler
this.cb_search=create cb_search
this.sle_rech=create sle_rech
this.dw_rech=create dw_rech
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_tempsdoc
this.Control[iCurrent+2]=this.st_day
this.Control[iCurrent+3]=this.cb_newpat
this.Control[iCurrent+4]=this.dw_horrechpatviewdt
this.Control[iCurrent+5]=this.em_duree
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_types_traitements_hor
this.Control[iCurrent+8]=this.cb_annuler
this.Control[iCurrent+9]=this.cb_search
this.Control[iCurrent+10]=this.sle_rech
this.Control[iCurrent+11]=this.dw_rech
end on

on w_rech_patient.destroy
call super::destroy
destroy(this.dw_tempsdoc)
destroy(this.st_day)
destroy(this.cb_newpat)
destroy(this.dw_horrechpatviewdt)
destroy(this.em_duree)
destroy(this.st_1)
destroy(this.dw_types_traitements_hor)
destroy(this.cb_annuler)
destroy(this.cb_search)
destroy(this.sle_rech)
destroy(this.dw_rech)
end on

event open;call super::open;/////////////////////////////////////////////////////
//
// Par			: Eric Vezina ing.
// Date			: 01-06-2005
// Description	: 1) insérer un rdv ds l'horaire
//					  2) modifier un rdv déjà existant
//
//////////////////////////////////////////////////////

long ll_row, ll_newrow,ll_find
string ls_date, ls_dayname

// initialisation des varialbes
select hor_step,eliminertrait1,archive into :ii_horstep,:ii_hidetrait1,:ii_archive from t_options where ortho_id = :w_horaire.il_horidspec;
if isnull(ii_hidetrait1) then ii_hidetrait1 = 0

// déterminer la methode 1 ou 2
is_patold = message.powerobjectparm
is_patnew = is_patold

if is_patold.patid > 0 then
	// modification d'un rdv déjà existant
	ib_modrdv = true
	// Modification d'un nouveau patient
	sle_rech.visible = false
	cb_newpat.visible = false
	dw_rech.event ue_retrieve(is_patold.patid,'M')
	dw_types_traitements_hor.event ue_retrieve(is_patold.traitid)

	em_duree.text = string(is_patold.duree)
	
	// Afficher le temps docteur
	
	dw_tempsdoc.event ue_retrieve()
	
else
	// insérer un nouveau rdv ds l'horaire
	if w_horaire.il_patlock > 0 then
		dw_rech.settransobject(sqlca)
		sle_rech.visible = false
		cb_newpat.visible = false
		dw_rech.SetFilter("patient_id = " + string(w_horaire.il_patlock))
		dw_rech.retrieve(v_no_ortho)	
		dw_types_traitements_hor.event ue_retrieve(is_patold.traitid)
		dw_rech.enabled = false
	end if
	ib_modrdv = false
end if

sle_rech.SetFocus()
end event

event timer;dw_horrechpatviewdt.object.compute_over.visible = ib_flash
ib_flash = not ib_flash
end event

type dw_tempsdoc from u_dw within w_rech_patient
event type long ue_retrievetrait ( long al_typetrait )
event ue_update ( )
event ue_enregistrerobject ( )
event type long ue_ajustduree ( long al_duree )
event ue_retrieve ( )
integer x = 2469
integer y = 1180
integer width = 571
integer height = 1084
integer taborder = 40
string dataobject = "d_tempsdocrdv"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event type long ue_retrievetrait(long al_typetrait);long ll_ortho, ll_couleur, ll_row, ll_coulhyg
double ldb_dureetot
string ls_requete
integer li_liste_trait_par_spec, li_doc

this.setRedraw(false)

select horshareid,liste_trait_par_spec into :ll_ortho,:li_liste_trait_par_spec from t_options where ortho_id = :v_no_ortho;
	
if li_liste_trait_par_spec = 1 then
	ll_ortho = v_no_ortho
else
	if isnull(ll_ortho) then ll_ortho = v_no_ortho
end if

select isnull(color,65280) into :ll_coulhyg from t_color where ortho_id = :ll_ortho and hyg = 1;
select isnull(color,16737380) into :ll_couleur from t_color where ortho_id = :ll_ortho and spec = 1;

em_duree.getData(ldb_dureetot)

ls_requete = "create table #tmp_listint(number integer not null)"
execute immediate :ls_requete;

delete from #tmp_listint;

for ll_row = 1 to long(ldb_dureetot)
	insert into #tmp_listint values(:ll_row);
next

this.reset()

declare curTD cursor for
  select t_tempsdoc.doc
	 from #tmp_listint as plage left outer join type_de_traitement on type_de_traitement.duree >= plage.number
																					and type_de_traitement.ortho_id = :ll_ortho
																					and type_de_traitement.type_traitement_id = :al_typetrait
								 left outer join t_tempsdoc on t_tempsdoc.type_traitement_id = type_de_traitement.type_traitement_id
																	and t_tempsdoc.ortho_id = type_de_traitement.ortho_id
																	and t_tempsdoc.debut <= plage.number
																	and t_tempsdoc.fin >= plage.number
order by plage.number asc;

open curTD;

fetch curTD into :li_doc;

do while SQLCA.SQLCode = 0
	ll_row = this.insertRow(0)
	
	choose case li_doc
		case 1 // Docteur
			dw_tempsdoc.object.ortho_id[ll_row] = 1
			dw_tempsdoc.object.dr[ll_row] = 'DR'
			dw_tempsdoc.object.couleur[ll_row] = ll_couleur
		case else // Hygiéniste
			dw_tempsdoc.object.ortho_id[ll_row] = 0
			dw_tempsdoc.object.dr[ll_row] = 'HG'
			dw_tempsdoc.object.couleur[ll_row] = ll_coulhyg
	end choose
	
	fetch curTD into :li_doc;
loop

close curTD;

this.setRedraw(true)

return this.rowCount()
end event

event ue_update();//// Enegistre dans la BD (dans le cas de la liste prioritaire)
//
//long ll_row, ll_nbrows, ll_spec, ll_specprec = -5, ll_rowdebut = 0, ll_spectmp, ll_rdv
//string ls_typprf
//time lt_debut, lt_fin
//
//if iuo_rdv.of_getflags() <> 'addprio' and iuo_rdv.of_getflags() <> 'modprio' then return
//if not (cbx_all.checked or ib_modnordv) then return
//
//ll_rdv = iuo_rdv.of_getRdvId()
//
//delete from t_hortempsdoc where id_horrdvpat = :ll_rdv;
//gf_sqlerr()
//
//this.acceptText()
//ll_nbrows = this.rowCount()
//
//for ll_row = 1 to ll_nbrows
//	ll_spec = this.object.id_spec[ll_row]
//	
//	if ll_spec <> ll_specprec then
//		if ll_rowdebut > 0 then
//			if ll_specprec > 0 then
//				ll_spectmp = ll_specprec
//				setNull(ls_typprf)
//			elseif ll_specprec = -2 then
//				setNull(ll_spectmp)
//				ls_typprf = 'a'
//			else
//				setNull(ll_spectmp)
//				ls_typprf = 'h'
//			end if
//			
//			lt_debut = relativetime(00:00:00, (ll_rowdebut - 1) * ii_horstep * 60)
//			lt_fin = relativetime(00:00:00, (ll_row - 1) * ii_horstep * 60)
//			
//			insert into t_hortempsdoc (id_horrdvpat, id_specialist, hdeb, hfin, typprf)
//				  values (:ll_rdv, :ll_spectmp, :lt_debut, :lt_fin, :ls_typprf);
//			gf_sqlerr()
//		end if
//		
//		ll_rowdebut = ll_row
//		ll_specprec = ll_spec
//	end if
//next
//
//if ll_specprec > 0 then
//	ll_spectmp = ll_specprec
//	setNull(ls_typprf)
//elseif ll_specprec = -2 then
//	setNull(ll_spectmp)
//	ls_typprf = 'a'
//else
//	setNull(ll_spectmp)
//	ls_typprf = 'h'
//end if
//
//lt_debut = relativetime(00:00:00, (ll_rowdebut - 1) * ii_horstep * 60)
//lt_fin = relativetime(00:00:00, (ll_nbrows) * ii_horstep * 60)
//
//insert into t_hortempsdoc (id_horrdvpat, id_specialist, hdeb, hfin, typprf)
//	  values (:ll_rdv, :ll_spectmp, :lt_debut, :lt_fin, :ls_typprf);
//gf_sqlerr()
//
//commit;
end event

event ue_enregistrerobject();long ll_row, ll_nbrows, ll_orthoid, ll_orthoidprec = -5, ll_rowdebut = 0, ll_cpt = 0

this.acceptText()
ll_nbrows = this.rowCount()

for ll_row = 1 to ll_nbrows
	ll_orthoid = this.object.ortho_id[ll_row]
	if ll_orthoid = 1 then
		is_patnew.dt[ll_row] = 'D'
	else
		is_patnew.dt[ll_row] = 'H'
	end if
next

end event

event type long ue_ajustduree(long al_duree);long ll_row, ll_nbRows, ll_couleur, ll_cpt

select color into :ll_couleur 
from t_color 
where ortho_id = :v_no_ortho AND
		isnull(hyg,0) = 1;

ll_nbRows = this.rowCount()

if ll_nbRows > al_duree then
	this.rowsDiscard(al_duree + 1, ll_nbRows, Primary!)
else
	for ll_cpt = ll_nbRows + 1 to al_duree
		ll_row = this.insertRow(0)
		
		this.object.ortho_id[ll_row] = 0
		this.object.dr[ll_row] = 'HG'
		this.object.couleur[ll_row] = ll_couleur
	next
end if

//dw_horrechpatviewdt.event setdt()

return this.rowCount()


end event

event ue_retrieve();long i, ll_row, ll_couleur, ll_coulhyg
string ls_dochyg

dw_tempsdoc.reset()

select isnull(color,65280) into :ll_coulhyg from t_color where ortho_id = :v_no_ortho and hyg = 1;
select isnull(color,16737380) into :ll_couleur from t_color where ortho_id = :v_no_ortho and spec = 1;

for i = 1 to upperbound(is_patold.dt)
	
	ll_row = this.insertRow(0)
	
	choose case is_patold.dt[i]
		case 'D' // Docteur
			dw_tempsdoc.object.ortho_id[ll_row] = 1
			dw_tempsdoc.object.dr[ll_row] = 'DR'
			dw_tempsdoc.object.couleur[ll_row] = ll_couleur
		case 'H'
			dw_tempsdoc.object.ortho_id[ll_row] = 0
			dw_tempsdoc.object.dr[ll_row] = 'HG'
			dw_tempsdoc.object.couleur[ll_row] = ll_coulhyg
	end choose
	
	
next
end event

event clicked;call super::clicked;long ll_orthoid, ll_couleur
string ls_init

if row <= 0 then return 0
if left(dwo.name, 2) <> 'dr' then return 0

ll_orthoid = this.object.ortho_id[row]

	if ll_orthoid = 0 then
		ll_orthoid = 1
		
		ls_init = 'DR'
		select color into :ll_couleur
		  from t_color
		 where isnull(t_color.spec,0) = 1 and
		 		 t_color.ortho_id = :v_no_ortho;
	else
		ll_orthoid = 0
		ls_init = 'HG'
		select color into :ll_couleur
		  from t_color
		 where isnull(t_color.hyg,0) = 1 and
		 		 t_color.ortho_id = :v_no_ortho;
	end if

this.object.ortho_id[row] = ll_orthoid
this.object.dr[row] = ls_init
this.object.couleur[row] = ll_couleur

dw_horrechpatviewdt.event setdt(1,rowcount(),is_patnew.col)
end event

type st_day from statictext within w_rech_patient
integer x = 5
integer width = 2990
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "err"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;this.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
end event

type cb_newpat from commandbutton within w_rech_patient
integer x = 2107
integer y = 84
integer width = 923
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Nouveau patient"
end type

event clicked;long ll_newrow, ll_sat, ll_patstatus, ll_act, ll_horshareid
integer li_option, li_opendossauto, li_noauto, li_virtuel
datawindowchild dddw_ref, dddw_dentist
integer li_liste_trait_par_spec

dw_rech.dataobject = 'd_rechpatnew'

// Référent 1

if dw_rech.getChild( 'referant_nom',dddw_ref) = -1 then
	error_type(0)
end if
dddw_ref.SetTransObject(SQLCA)
dddw_ref.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_ref.retrieve()

if dw_rech.GetChild('id_dentist', dddw_dentist) = -1 then
	error_type(0)
end if
dddw_dentist.SetTransObject(SQLCA)
dddw_dentist.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_dentist.retrieve()

if v_langue = 'an' then
	dw_rech.object.t_nom.text = 'Last name:'
	dw_rech.object.t_prenom.text = 'First name:'
	dw_rech.object.t_telres.text = 'Tel.(Home):'
	dw_rech.object.t_telbur.text = 'Tel.(Off.):'
	dw_rech.object.t_telcell.text = 'Tel.(Cell.):'
	dw_rech.object.t_telautre.text = 'Tel.(Other):'
	dw_rech.object.t_datenais.text = 'Birthday:'
	dw_rech.object.province.values = 'Quebec~tQC/USA~tUSA/Ontario~tON/Manitoba~tMB/Saskatchewan~tSK/Alberta~tAB/British Columbia~tBC/Newfoundland and Labrador~tNF/New Brunswick~tNB/Nova Scotia~tNS/Price Edward Island~tPE/Yukon~tYukon/North West Territories~tNT/Nunavut~tNU'
	dw_rech.object.t_ref.text = "Referent"
	dw_rech.object.t_dent.text = "Dentist"
else
	dw_rech.object.province.values = 'Québec~tQC/USA~tUSA/Ontario~tON/Manitoba~tMB/Saskatchewan~tSK/Alberta~tAB/Colombie-Britannique~tBC/Terre-Neuve-et-Labrador~tNF/Nouveau-Brunswick~tNB/Nouvelle-Écosse~tNS/Île-du-Prince-Edouard~tPE/Yukon~tYK/Territoires du Nord-Ouest~tNT/Nunavut~tNU'
end if
dw_rech.settransobject(sqlca)
ll_newrow = dw_rech.insertrow(0)
dw_rech.setitem(ll_newrow,'no_ortho',v_no_ortho)
select opendossauto into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option <> 1 then
	dw_rech.setitem(ll_newrow,'opendoss',today())
end if
dw_rech.setitem(ll_newrow,'retards',0)
dw_rech.setitem(ll_newrow,'rvmanques',0)
dw_rech.setitem(ll_newrow,'rvcancel',0)
dw_rech.setitem(ll_newrow,'caba',0)
dw_rech.setitem(ll_newrow, "recu_automatique",'0')
dw_rech.setitem(ll_newrow, "province","QC")
dw_rech.setitem(ll_newrow, "langue","F")
dw_rech.setitem(ll_newrow, "recuresp",0)
dw_rech.modify("code_postale.EditMask.Mask = '!#! #!#'")
select opendossauto into :li_opendossauto from t_options where ortho_id = :v_no_ortho;
if not li_opendossauto = 1 or isnull(li_opendossauto) then
	dw_rech.setitem(ll_newrow, "opendoss",today())
end if
select id_satellite into :ll_sat from t_satellites where defo = 1 and ortho_id = :v_no_ortho;
if ll_sat > 0 then dw_rech.setitem(ll_newrow, "id_satellite",ll_sat)
select id_patstatus into :ll_patstatus from t_patstatus where defo = 1 and ortho_id = :v_no_ortho;
if ll_patstatus > 0 then dw_rech.setitem(ll_newrow, "id_patstatus",ll_patstatus)
select id_activite into :ll_act from t_activites where defo = 1 and ortho_id = :v_no_ortho;
if ll_act > 0 then dw_rech.setitem(ll_newrow, "id_activite",ll_act)


select dossier_virtuel_defaut into :li_virtuel  from t_options where ortho_id = :v_no_ortho;
if li_virtuel = 1 then
   dw_rech.setitem(ll_newrow, "dossier_virtuel", 1)
ELSE
	dw_rech.setitem(ll_newrow, "dossier_virtuel", 0)
end if

/*
dw_rech.modify('patient.patient_id.key = yes')
dw_rech.modify('patient.patient_id.update = yes')
dw_rech.modify('patient.no_ortho.update = yes')
dw_rech.modify('patient.patient_nom.update = yes')
dw_rech.modify('patient.patient_prenom.update = yes')
dw_rech.modify('patient.tel_maison.update = yes')
dw_rech.modify('patient.tel_bureau.update = yes')
dw_rech.modify('patient.telcell.update = yes')
dw_rech.modify('patient.telautre.update = yes')
dw_rech.modify('patient.date_naissance.update = yes')
dw_rech.modify('patient.opendoss.update = yes')
dw_rech.modify('patient.retards.update = yes')
dw_rech.modify('patient.rvmanques.update = yes')
dw_rech.modify('patient.recu_automatique.update = yes')
dw_rech.modify('patient.province.update = yes')
dw_rech.modify('patient.langue.update = yes')
dw_rech.modify('patient.recuresp.update = yes')
dw_rech.modify('patient.id_satellite.update = yes')
dw_rech.modify('patient.id_patstatus.update = yes')
dw_rech.modify('patient.id_activite.update = yes')
*/

cb_search.enabled=true
select isnull(eliminertrait1,0) into :li_option from t_options where ortho_id = :v_no_ortho;
// if isnull(li_option) then li_option = 0

select horshareid,liste_trait_par_spec into :ll_horshareid,:li_liste_trait_par_spec from t_options where ortho_id = :v_no_ortho;
if li_liste_trait_par_spec = 1 then
	//probleme dr luc veilleux 2 ortho ds le meme horaire
	dw_types_traitements_hor.retrieve(v_no_ortho,ii_hidetrait1)
else
	//probleme dr michel di battista 2 ortho ds le meme horaire
	if isnull(ll_horshareid) then ll_horshareid = v_no_ortho
	dw_types_traitements_hor.retrieve(ll_horshareid,ii_hidetrait1)
end if


//dw_types_traitements_hor.retrieve(v_no_ortho,li_option)
dw_types_traitements_hor.visible = true
dw_rech.SetFocus()
end event

event constructor;if v_langue = 'an' then
	this.text = "New patient"
end if
end event

type dw_horrechpatviewdt from u_dw within w_rech_patient
event setdt ( long al_row1,  integer ai_duree,  integer ai_col )
integer x = 5
integer y = 1180
integer width = 727
integer height = 1128
integer taborder = 40
boolean enabled = false
string title = "horrechpatviewdt"
string dataobject = "d_horrechpatviewdt"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event setdt(long al_row1, integer ai_duree, integer ai_col);string ls_dt[ ],ls_colname
time lt_start
boolean lb_over = false
long i, ll_orthoid

lt_start = w_horaire.dw_hor.getitemtime(w_horaire.dw_hor.getrow(),'heure')
ls_colname = w_horaire.dw_hor.getcolumnname()
Retrieve(istr_cal.caldate,v_no_ortho,lt_start,relativetime(lt_start, 16 * w_horaire.ii_step * 60))

for i = 1 to dw_tempsdoc.rowcount()
	
	ll_orthoid = dw_tempsdoc.object.ortho_id[i]
	
	if ll_orthoid = 1 then
		ls_dt[i] = 'D'
	else
		ls_dt[i] = 'H'
	end if
	
next

//appliquer
if upperbound(ls_dt) > 0 then
	for i = 1 to ai_duree
		if al_row1 <= rowcount() then
			this.setitem(al_row1,"dt"+string(ai_col),ls_dt[i])
			if getitemnumber(al_row1,'compute_overbooking') > 1 then
				lb_over = true
			end if
		end if
		al_row1 = al_row1 + 1
	next
end if
if lb_over then
	timer(1)
//	messagebox('Information!','OVER BOOKING')
else
	timer(0)
	dw_horrechpatviewdt.object.compute_over.visible = false
end if
end event

event constructor;time lt_start
string ls_colname

SetTransObject(SQLCA)
lt_start = w_horaire.dw_hor.getitemtime(w_horaire.dw_hor.getrow(),'heure')
ls_colname = w_horaire.dw_hor.getcolumnname()
Retrieve(istr_cal.caldate,v_no_ortho,lt_start,relativetime(lt_start, 16 * w_horaire.ii_step * 60))

if v_langue = 'an' then
	this.Object.t_1.text = "Treatment"
	this.Object.t_2.text = "Doctor time"
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

type em_duree from editmask within w_rech_patient
integer x = 1477
integer y = 1088
integer width = 251
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "1~~50"
end type

event constructor;em_duree.text = '00'
end event

event modified;integer row,li_duree
string ls_dt1,ls_dt2,ls_dt3

li_duree = integer(em_duree.text)
row = dw_types_traitements_hor.getrow()

dw_horrechpatviewdt.event setdt(1,li_duree,is_patnew.col)
dw_tempsdoc.event ue_ajustduree(li_duree)
end event

type st_1 from statictext within w_rech_patient
integer x = 1088
integer y = 1092
integer width = 370
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Durée:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Lenght:"
end if
end event

type dw_types_traitements_hor from u_dw within w_rech_patient
event ue_retrieve ( long al_traitid )
boolean visible = false
integer x = 731
integer y = 1180
integer width = 1737
integer height = 1084
integer taborder = 30
string title = "types_traitements"
string dataobject = "d_types_traitements_hor"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve(long al_traitid);//////////////////////////////////////////////////
//
// Par			: Eric Vezina ing
// Date			: 01-06-2005
//
// Description : Recherche des traitements selon 2 méthodes
//					  1 - Liste des traitements en commun
//					  2 - Liste des traitements pas en commun
//
//////////////////////////////////////////////////

long ll_comtrait,ll_find,ll_horshareid, ll_row
integer li_liste_trait_par_spec
string ls_sql

select horshareid,liste_trait_par_spec into :ll_horshareid,:li_liste_trait_par_spec from t_options where ortho_id = :v_no_ortho;
	
if li_liste_trait_par_spec = 1 then
	ll_horshareid = v_no_ortho
else
	if isnull(ll_horshareid) then ll_horshareid = v_no_ortho
end if

ll_row = getRow()
	
if retrieve(ll_horshareid, 0) = 0 then
	error_type(137)
	cb_search.enabled = false
else
	dw_types_traitements_hor.visible = true
	cb_search.enabled = true
	if al_traitid > 0 then
		ll_find = find('type_traitement_id = ' + string(al_traitid),0,rowcount())
		scrolltorow(ll_find)
	elseif ll_row = 1 then
		this.event rowFocusChanged(1)
	end if
	dw_types_traitements_hor.SetFocus()
	dw_types_traitements_hor.setRedraw(true)
end if


end event

event constructor;call super::constructor;this.modify("compute_1.width=1500 " + &
				"destroy type_de_traitement_doctortime1 " + &
				"destroy type_de_traitement_doctortime2 " + &
				"destroy type_de_traitement_doctortime3")

setrowfocusindicator(hand!)
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_type_traitement
integer li_duree
string ls_dt1,ls_dt2,ls_dt3

li_duree = getitemnumber(currentrow,'type_de_traitement_duree')
ll_type_traitement = getitemnumber(currentrow,'type_traitement_id')
em_duree.text = string(li_duree)
dw_tempsdoc.event ue_retrievetrait(ll_type_traitement)
dw_horrechpatviewdt.event setdt(1,li_duree,is_patnew.col)
end event

event clicked;ScrollToRow(GetClickedRow())
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

event editchanged;integer li_duree
string ls_dt1,ls_dt2,ls_dt3

li_duree = getitemnumber(row,'type_de_traitement_duree')
dw_horrechpatviewdt.event setdt(1,li_duree,is_patnew.col)
end event

type cb_annuler from commandbutton within w_rech_patient
integer x = 5
integer y = 1084
integer width = 1056
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
boolean cancel = true
end type

event clicked;w_horaire.uf_unlock()
closewithreturn(w_rech_patient,is_patold)
end event

event constructor;if v_langue = 'an' then
	this.text = "Cancel"
end if
end event

type cb_search from commandbutton within w_rech_patient
integer x = 1979
integer y = 1084
integer width = 1056
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;long row,ll_iduser, v_id_traitement, v_check_cpd, ll_signalersolderdv, ll_idpatient
integer li_count,li_labo = 0
decimal ld_montant, ld_paiement

// Calcul de la nouvelle facon du temps docteur

//dw_tempsdoc.event ue_update()
dw_tempsdoc.event ue_enregistrerobject()

/////////////////////////////////////////////////
// modification d'un rdv existant
//
if ib_modrdv then
	// inserer les nouvelles informations ds la structure
	if dw_rech.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		error_type(50)
	end if
	row = dw_rech.getrow()
	dw_types_traitements_hor.acceptText()
	is_patnew.patid = dw_rech.getitemnumber(row,'patient_id')
	is_patnew.patnom = dw_rech.getitemstring(row,'patient_nom')+','+dw_rech.getitemstring(row,'patient_prenom')
	is_patnew.pattelres = dw_rech.getitemstring(row,'tel_maison')
	if isnull(is_patnew.pattelres) or is_patnew.pattelres = '' then
		is_patnew.pattelres = 'X'
	end if
	if dw_types_traitements_hor.getrow() > 0 then
		is_patnew.traitid = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'type_traitement_id')
		is_patnew.dt1 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime1')
		is_patnew.dt2 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime2')
		is_patnew.dt3 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime3')
		is_patnew.backcolor = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'t_color_color')
	else
		is_patnew.backcolor = rgb(255,255,255)
	end if
	if integer(em_duree.text) <= 0 then
		is_patnew.duree = 1
	else
		is_patnew.duree = integer(em_duree.text)
	end if
	//vérifier si l'employé est disponible
	if not w_horaire.uf_isuser(is_patnew) then
		error_type(189)
	else
		//effacer le rdv
		w_horaire.dw_hor.event ue_delete(is_patold,true)
		//balayer la plage pour verification
		if not w_horaire.uf_validplage(is_patnew) then
			//inserer l'ancien rdv
			if w_horaire.dw_hor.event ue_update(is_patold) then
				commit using sqlca;
				w_horaire.uf_setsync() // hor refresh
				w_horaire.addrdv(is_patold.patid,is_patold.traitid,is_patold.datecal,is_patold.heure,is_patold.duree,is_patold.col,is_patold.idpers,is_patold.memo,is_patold.rv,is_patold.dt)
			else
				rollback using sqlca;
				error_type(50)
			end if
		else
			//inserer le nouveau rdv
			if w_horaire.dw_hor.event ue_update(is_patnew) then
				commit using sqlca;
				w_horaire.uf_setsync() // hor refresh
				w_horaire.addrdv(is_patnew.patid,is_patnew.traitid,is_patnew.datecal,is_patnew.heure,is_patnew.duree,is_patnew.col,is_patnew.idpers,is_patnew.memo,is_patnew.rv,is_patnew.dt)
			else
				rollback using sqlca;
				error_type(50)
			end if
		end if
	end if
	w_horaire.uf_unlock()
	changeStatus(is_patnew.traitid,is_patnew.patid)
	closewithreturn(w_rech_patient,is_patnew)
else
	/////////////////////////////////////////////////
	// ajouter un patient existant
	//
	if dw_rech.visible then
		dw_rech.acceptText()
		dw_types_traitements_hor.acceptText()
		row = dw_rech.getrow()
		select signalersolderdv into :ll_signalersolderdv from t_options where ortho_id = :v_no_ortho;
		if ll_signalersolderdv = 1 then
			ll_idpatient = dw_rech.getitemnumber(row,'patient_id')
			select  (select isnull(sum(isnull(montant,0)),0) from factures_traitements where factures_traitements.traitement_id = traitements.traitement_id),
					 (select isnull(sum(isnull(montant_recu,0)),0) from paiement where paiement.traitement_patient_id = traitements.traitement_id)
			into :ld_montant, :ld_paiement
			from traitements
			where patient_id = :ll_idpatient;
			if ld_montant > ld_paiement then
				Messagebox('Avertissement!','Le patient a un solde à son dossier')			
			end if
		end if
		is_patnew.patnom = dw_rech.getitemstring(row,'patient_nom')+','+dw_rech.getitemstring(row,'patient_prenom')
		is_patnew.pattelres = dw_rech.getitemstring(row,'tel_maison')
		if isnull(is_patnew.pattelres) or is_patnew.pattelres = '' then
			is_patnew.pattelres = 'X'
		end if
		if dw_types_traitements_hor.getrow() > 0 then
			is_patnew.traitid = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'type_traitement_id')
			is_patnew.dt1 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime1')
			is_patnew.dt2 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime2')
			is_patnew.dt3 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime3')
			is_patnew.backcolor = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'t_color_color')
		else
			is_patnew.backcolor = rgb(255,255,255)
		end if
		if integer(em_duree.text) <= 0 then
			is_patnew.duree = 1
		else
			is_patnew.duree = integer(em_duree.text)
		end if
		
		if dw_rech.event ue_update() = 1 then
			commit using sqlca;
			SetNull(is_patnew.patid)
			is_patnew.patid = dw_rech.getitemnumber(row,'patient_id')
			if isnull(is_patnew.patid) then
				select max(patient_id) into :is_patnew.patid from patient;
			end if
		else
			rollback;
			error_type(50)
		end if
		if not w_horaire.uf_isuser(is_patnew) then
			error_type(189)
			is_patnew = w_horaire.uf_clearpat()
		end if
		w_horaire.uf_unlock()
		changeStatus(is_patnew.traitid,is_patnew.patid)
		closewithreturn(w_rech_patient,is_patnew)
	else
		/////////////////////////////////////////////////
		// ajouter un patient nouveau
		//
		row = dw_rech.getrow()
		dw_types_traitements_hor.acceptText()
		is_patnew.patid = dw_rech.getitemnumber(row,'patient_id')
		is_patnew.patnom = dw_rech.getitemstring(row,'patient_nom')+','+dw_rech.getitemstring(row,'patient_prenom')
		is_patnew.pattelres = dw_rech.getitemstring(row,'tel_maison')
		if isnull(is_patnew.pattelres) or is_patnew.pattelres = '' then
			is_patnew.pattelres = 'X'
		end if
		if dw_types_traitements_hor.getrow() > 0 then
			is_patnew.traitid = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'id_typetrait')
			is_patnew.dt1 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime1')
			is_patnew.dt2 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime2')
			is_patnew.dt3 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime3')

			is_patnew.backcolor = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'t_colors_couleur')
		else
			is_patnew.backcolor = rgb(255,255,255)
		end if
		if integer(em_duree.text) <= 0 then
			is_patnew.duree = 1
		else
			is_patnew.duree = integer(em_duree.text)
		end if
		if not w_horaire.uf_isuser(is_patnew) then
			error_type(189)
			is_patnew = w_horaire.uf_clearpat()
		end if
		
		w_horaire.uf_unlock()
		changeStatus(is_patnew.traitid,is_patnew.patid)
		closewithreturn(w_rech_patient,is_patnew)
	end if
end if
end event

type sle_rech from singlelineedit within w_rech_patient
integer x = 5
integer y = 88
integer width = 2057
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;int v_nb, li_archive, li_liste_trait_par_spec
long ll_horshareid
string ls_dnom

//pour regler le bug des apostrophes
ls_dnom = Trim(sle_rech.text)
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if
//**********************************

//select archive into :li_archive from t_options where ortho_id = :v_no_ortho;

	
if isnumber(left(ls_dnom,1)) then
	if li_archive = 1 then
		//archiver
		dw_rech.SetFilter("isnull(archivedate) or archivedate > today() and new_dossier = '"+upper(ls_dnom)+"'")
		dw_rech.filter()
	else
		dw_rech.setfilter("new_dossier = '"+upper(ls_dnom)+"'")
	end if
else
	if li_archive = 1 then
		//archiver
		dw_rech.SetFilter("isnull(archivedate) or archivedate > today() and upper(compute_1) like '"+upper(ls_dnom)+"%'")
		dw_rech.filter()
	else
		dw_rech.setfilter("upper(compute_1) like '"+upper(ls_dnom)+"%'")
	end if
end if

if dw_rech.retrieve(v_no_ortho) > 0 then
	cb_search.enabled=true
	
	select horshareid,liste_trait_par_spec into :ll_horshareid,:li_liste_trait_par_spec from t_options where ortho_id = :v_no_ortho;
	if li_liste_trait_par_spec = 1 then
		//probleme dr luc veilleux 2 ortho ds le meme horaire
		dw_types_traitements_hor.retrieve(v_no_ortho,ii_hidetrait1)
	else
		//probleme dr michel di battista 2 ortho ds le meme horaire
		if isnull(ll_horshareid) then ll_horshareid = v_no_ortho
		dw_types_traitements_hor.retrieve(ll_horshareid,ii_hidetrait1)
	end if
	
	dw_types_traitements_hor.visible = true
else
	cb_search.enabled=false
end if
dw_rech.SetFocus()

end event

type dw_rech from u_dw within w_rech_patient
event ue_retrieve ( long al_idpat,  string as_mod )
event type integer ue_update ( )
integer x = 5
integer y = 200
integer width = 3031
integer height = 872
integer taborder = 20
string dataobject = "d_horfindpat"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve(long al_idpat, string as_mod);if as_mod = 'M' then
	dw_rech.dataobject = 'd_rechpatnew'
	if v_langue = 'an' then
		dw_rech.object.t_nom.text = 'Last name:'
		dw_rech.object.t_prenom.text = 'First name:'
		dw_rech.object.t_telres.text = 'Tel.(Home):'
		dw_rech.object.t_telbur.text = 'Tel.(Off.):'
		dw_rech.object.t_telcell.text = 'Tel.(Cell.):'
		dw_rech.object.t_telautre.text = 'Tel.(Other):'
		dw_rech.object.t_datenais.text = 'Birthday:'
		dw_rech.object.t_ville.text = 'City:'
		dw_rech.object.t_adresse.text = 'Address:'
	end if
	dw_rech.settransobject(sqlca)
	dw_rech.retrieve(al_idpat)
end if
end event

event type integer ue_update();choose case dataobject
	case 'd_horfindpat'
		return update()
	case 'd_rechpatnew'
		long ll_patid, ll_row, ll_cont, ll_nodoscommepatid
		string ls_nom, ls_prenom, ls_telres, ls_telbur, ls_telcell, ls_telautre
		string ls_text1, ls_text2, ls_text5, ls_text6, ls_adr, ls_ville
		string ls_codepostal, ls_province, ls_langue
		
		ll_row = this.getRow()
		
		if update() <> 1 then return -1
		
		select max(patient_id) into :ll_patid from patient;
		
		//Affecter new_dossier comme le patient_id
		select isnull(nodoscommepatid,0) into :ll_nodoscommepatid from t_options where ortho_id = :v_no_ortho;
		if ll_nodoscommepatid = 1 then
			update patient set new_dossier = :ll_patid where patient_id = :ll_patid;
			if error_type(-1) = 1 then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
		end if
		
		this.setItem(ll_row, 'patient_id', ll_patid)
		ls_nom = this.getItemString(ll_row, 'patient_nom')
		ls_prenom = this.getItemString(ll_row, 'patient_prenom')
		ls_adr = this.getItemString(ll_row, 'adresse')
		ls_ville = this.getItemString(ll_row, 'ville')
		ls_province = this.getItemString(ll_row, 'province')
		ls_codepostal = this.getItemString(ll_row, 'code_postale')
		ls_telres = this.getItemString(ll_row, 'tel_maison')
		ls_telbur = this.getItemString(ll_row, 'tel_bureau')
		ls_telcell = this.getItemString(ll_row, 'telcell')
		ls_telautre = this.getItemString(ll_row, 'telautre')
		ls_text1 = this.getItemString(ll_row, 'text1')
		ls_text2 = this.getItemString(ll_row, 'text2')
		ls_text5 = this.getItemString(ll_row, 'text5')
		ls_text6 = this.getItemString(ll_row, 'text6')
		ls_langue = this.getItemString(ll_row, 'langue')
		
		insert into t_contact(ortho_id, patient_id, nom, prenom, adresse, ville, zip, telres, telbur, province, langue,
									 pat, telcell, telautre, resptype, telext1, telext, telext5, telext6)
							values(:v_no_ortho, :ll_patid, :ls_nom, :ls_prenom, :ls_adr, :ls_ville, :ls_codepostal,
									 :ls_telres, :ls_telbur, :ls_province, :ls_langue,1, :ls_telcell, :ls_telautre, 'pat',
									 :ls_text1, :ls_text2, :ls_text5, :ls_text6);
		if error_type(-1) <> 1 then return -1
		select max(id_contact) into :ll_cont from t_contact;
		update patient set id_contact = :ll_cont where patient_id = :ll_patid;
		if error_type(-1) <> 1 then return -1
		
		return 1
end choose

end event

event constructor;call super::constructor;this.of_SetdropDownSearch(true)
this.inv_dropdownsearch.of_addColumn()

settransobject(sqlca)
setrowfocusindicator(FocusRect!)
setfocus()
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

event editchanged;call super::editchanged;inv_dropdownsearch.event pfc_editchanged(row, dwo, data)

// Attention ! Si on met un champ province dans la dw 'd_horfindpat', ça va planter !!
if dwo.name = 'province' then
	if data = 'USA' then
		modify("code_postale.EditMask.Mask = ''")
	else
		modify("code_postale.EditMask.Mask = '!#! #!#'")
	end if
end if

end event

event itemfocuschanged;call super::itemfocuschanged;inv_dropdownsearch.event pfc_itemfocuschanged(row, dwo)
end event

event itemchanged;call super::itemchanged;string ls_patnom, ls_patprenom
long ll_count
s_pat st_pat

if dataobject = 'd_rechpatnew' then
	
	if dwo.name = 'patient_nom' then
		ls_patnom =  data
		ls_patprenom = dw_rech.getItemString(row,'patient_prenom')
	elseif dwo.name = 'patient_prenom' then
		ls_patnom = dw_rech.getItemString(row,'patient_nom')
		ls_patprenom = data
	end if
	
	if dwo.name = 'patient_nom' or dwo.name = 'patient_prenom' then
	
		SELECT count(*) into :ll_count 
		FROM patient 
		WHERE locate(' ' || patient_prenom || ' ', ' ' || :ls_patprenom || ' ' ) > 0 AND 
				locate(' ' || patient_nom || ' ', ' ' || :ls_patnom || ' ') > 0;
				
		if ll_count > 0 then
			
			st_pat.patnom = ls_patnom
			st_pat.patprenom = ls_patprenom
			st_pat.col = 1
			openwithparm(w_patdouble,st_pat)
			
		end if
		
	end if
	
end if



end event

