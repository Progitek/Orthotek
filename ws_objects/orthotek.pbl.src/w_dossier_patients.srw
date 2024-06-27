$PBExportHeader$w_dossier_patients.srw
forward
global type w_dossier_patients from w_child
end type
type cb_ceph from commandbutton within w_dossier_patients
end type
type cb_img from commandbutton within w_dossier_patients
end type
type tab_dosspat from tab within w_dossier_patients
end type
type tabpage_dosspat from userobject within tab_dosspat
end type
type dw_dosspatresp from u_dw within tabpage_dosspat
end type
type dw_dosspat from u_dw within tabpage_dosspat
end type
type tabpage_dosspat from userobject within tab_dosspat
dw_dosspatresp dw_dosspatresp
dw_dosspat dw_dosspat
end type
type tabpage_resp from userobject within tab_dosspat
end type
type dw_dosspatrespfin from u_dw within tabpage_resp
end type
type tabpage_resp from userobject within tab_dosspat
dw_dosspatrespfin dw_dosspatrespfin
end type
type tabpage_contrat from userobject within tab_dosspat
end type
type dw_contrat from u_dw within tabpage_contrat
end type
type tabpage_contrat from userobject within tab_dosspat
dw_contrat dw_contrat
end type
type tabpage_dentist from userobject within tab_dosspat
end type
type dw_dosspatdentresp from u_dw within tabpage_dentist
end type
type tabpage_dentist from userobject within tab_dosspat
dw_dosspatdentresp dw_dosspatdentresp
end type
type tabpage_ref from userobject within tab_dosspat
end type
type dw_dosspatref from u_dw within tabpage_ref
end type
type tabpage_ref from userobject within tab_dosspat
dw_dosspatref dw_dosspatref
end type
type tabpage_rdv from userobject within tab_dosspat
end type
type tab_rdv from tab within tabpage_rdv
end type
type tabpage_visits from userobject within tab_rdv
end type
type dw_dosspatrdv from u_dw within tabpage_visits
end type
type tabpage_visits from userobject within tab_rdv
dw_dosspatrdv dw_dosspatrdv
end type
type tabpage_rappels from userobject within tab_rdv
end type
type tabpage_rappels from userobject within tab_rdv
end type
type tab_rdv from tab within tabpage_rdv
tabpage_visits tabpage_visits
tabpage_rappels tabpage_rappels
end type
type tabpage_rdv from userobject within tab_dosspat
tab_rdv tab_rdv
end type
type tabpage_histocorr from userobject within tab_dosspat
end type
type ole_mail from olecustomcontrol within tabpage_histocorr
end type
type dw_courrieldosspat from u_dw within tabpage_histocorr
end type
type dw_histonote from u_dw within tabpage_histocorr
end type
type dw_histocorr from u_dw within tabpage_histocorr
end type
type tabpage_histocorr from userobject within tab_dosspat
ole_mail ole_mail
dw_courrieldosspat dw_courrieldosspat
dw_histonote dw_histonote
dw_histocorr dw_histocorr
end type
type tabpage_cartetrait from userobject within tab_dosspat
end type
type dw_cartetrait from u_dw within tabpage_cartetrait
end type
type dw_carteentete from u_dw within tabpage_cartetrait
end type
type dw_rdv from u_dw within tabpage_cartetrait
end type
type tabpage_cartetrait from userobject within tab_dosspat
dw_cartetrait dw_cartetrait
dw_carteentete dw_carteentete
dw_rdv dw_rdv
end type
type tabpage_age from userobject within tab_dosspat
end type
type st_statement1 from statictext within tabpage_age
end type
type dw_etatcompte from u_dw within tabpage_age
end type
type tabpage_age from userobject within tab_dosspat
st_statement1 st_statement1
dw_etatcompte dw_etatcompte
end type
type tabpage_etat from userobject within tab_dosspat
end type
type ddlb_resp from u_ddlb within tabpage_etat
end type
type ddlb_etat from u_ddlb within tabpage_etat
end type
type dw_etatcomptepat1 from u_dw within tabpage_etat
end type
type tabpage_etat from userobject within tab_dosspat
ddlb_resp ddlb_resp
ddlb_etat ddlb_etat
dw_etatcomptepat1 dw_etatcomptepat1
end type
type tabpage_rappre from userobject within tab_dosspat
end type
type p_lock from u_p within tabpage_rappre
end type
type pb_13 from picturebutton within tabpage_rappre
end type
type pb_8 from picturebutton within tabpage_rappre
end type
type pb_7 from picturebutton within tabpage_rappre
end type
type st_rappre from statictext within tabpage_rappre
end type
type pb_6 from picturebutton within tabpage_rappre
end type
type pb_5 from picturebutton within tabpage_rappre
end type
type p_unlock from u_p within tabpage_rappre
end type
type dw_rapppre from u_dw within tabpage_rappre
end type
type tabpage_rappre from userobject within tab_dosspat
p_lock p_lock
pb_13 pb_13
pb_8 pb_8
pb_7 pb_7
st_rappre st_rappre
pb_6 pb_6
pb_5 pb_5
p_unlock p_unlock
dw_rapppre dw_rapppre
end type
type tabpage_traitreq from userobject within tab_dosspat
end type
type pb_14 from picturebutton within tabpage_traitreq
end type
type pb_4 from picturebutton within tabpage_traitreq
end type
type pb_3 from picturebutton within tabpage_traitreq
end type
type st_title from statictext within tabpage_traitreq
end type
type pb_1 from picturebutton within tabpage_traitreq
end type
type pb_2 from picturebutton within tabpage_traitreq
end type
type p_locktraite from u_p within tabpage_traitreq
end type
type p_unlocktraite from u_p within tabpage_traitreq
end type
type dw_traitreq from u_dw within tabpage_traitreq
end type
type tabpage_traitreq from userobject within tab_dosspat
pb_14 pb_14
pb_4 pb_4
pb_3 pb_3
st_title st_title
pb_1 pb_1
pb_2 pb_2
p_locktraite p_locktraite
p_unlocktraite p_unlocktraite
dw_traitreq dw_traitreq
end type
type tabpage_rapcons from userobject within tab_dosspat
end type
type cb_permanente from commandbutton within tabpage_rapcons
end type
type cb_primaire from commandbutton within tabpage_rapcons
end type
type pb_delcons from picturebutton within tabpage_rapcons
end type
type cb_odonto from commandbutton within tabpage_rapcons
end type
type p_size from picture within tabpage_rapcons
end type
type pb_12 from picturebutton within tabpage_rapcons
end type
type pb_11 from picturebutton within tabpage_rapcons
end type
type st_cons from statictext within tabpage_rapcons
end type
type pb_10 from picturebutton within tabpage_rapcons
end type
type pb_9 from picturebutton within tabpage_rapcons
end type
type st_patnom2 from statictext within tabpage_rapcons
end type
type p_lockcons from picture within tabpage_rapcons
end type
type dw_dosspatficheconsult from u_dw within tabpage_rapcons
end type
type p_unlockcons from picture within tabpage_rapcons
end type
type tabpage_rapcons from userobject within tab_dosspat
cb_permanente cb_permanente
cb_primaire cb_primaire
pb_delcons pb_delcons
cb_odonto cb_odonto
p_size p_size
pb_12 pb_12
pb_11 pb_11
st_cons st_cons
pb_10 pb_10
pb_9 pb_9
st_patnom2 st_patnom2
p_lockcons p_lockcons
dw_dosspatficheconsult dw_dosspatficheconsult
p_unlockcons p_unlockcons
end type
type tabpage_refa from userobject within tab_dosspat
end type
type dw_dosspatrefa from u_dw within tabpage_refa
end type
type tabpage_refa from userobject within tab_dosspat
dw_dosspatrefa dw_dosspatrefa
end type
type tab_dosspat from tab within w_dossier_patients
tabpage_dosspat tabpage_dosspat
tabpage_resp tabpage_resp
tabpage_contrat tabpage_contrat
tabpage_dentist tabpage_dentist
tabpage_ref tabpage_ref
tabpage_rdv tabpage_rdv
tabpage_histocorr tabpage_histocorr
tabpage_cartetrait tabpage_cartetrait
tabpage_age tabpage_age
tabpage_etat tabpage_etat
tabpage_rappre tabpage_rappre
tabpage_traitreq tabpage_traitreq
tabpage_rapcons tabpage_rapcons
tabpage_refa tabpage_refa
end type
type uo_calutil1 from u_calutil within w_dossier_patients
end type
type cb_transfert from commandbutton within w_dossier_patients
end type
type cb_update from commandbutton within w_dossier_patients
end type
type cb_close from commandbutton within w_dossier_patients
end type
type cb_insert from commandbutton within w_dossier_patients
end type
type cb_new from commandbutton within w_dossier_patients
end type
type cb_print from commandbutton within w_dossier_patients
end type
end forward

global type w_dossier_patients from w_child
string tag = "dosspat"
integer width = 3639
integer height = 2120
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
event ue_timer ( double ad_intervale )
cb_ceph cb_ceph
cb_img cb_img
tab_dosspat tab_dosspat
uo_calutil1 uo_calutil1
cb_transfert cb_transfert
cb_update cb_update
cb_close cb_close
cb_insert cb_insert
cb_new cb_new
cb_print cb_print
end type
global w_dossier_patients w_dossier_patients

type variables
public:
	
	DataWindowChild dddwin 
	DataWindowChild dddw_statut
	DataWindowChild dddw_patstatus
	DataWindowChild dddw_sattelite
	DataWindowChild dddw_activite
	DataWindowChild dddw_dentist
	DataWindowChild dddw_salutation
	DataWindowChild dddw_idcontact
	DataWindowChild dddw_idcontact2
	DataWindowChild dddw_ref
	DataWindowChild dddw_ref2
	DataWindowChild dddw_phase
	DataWindowChild dddw_pers
	boolean change = false
	string is_nom
	string is_spec
	string is_wordpath
	string is_corrpath,is_imgpath
	integer Maj_liste = 0
	integer chang_dossier = 0
	integer ii_chang_nom_prenom_tel = 0
	integer vi_mode_ajout = 0
	integer is_naiss = 0
	integer ii_index
	long il_patid
	
private:

	boolean ib_minimize = false
	boolean rchange = false
	boolean ib_modeajouttraitreq = false
	string photoname
	string is_patlang
	string is_exam = ""
	integer ii_modeajout = 0
	integer ii_resp = 1
	long il_rapport[]
	long il_indrapport
	long il_raptraitreq[]
	long il_indraptraitreq
	long il_rapcons[]
	long il_indrapcons
	long il_rapetat[]
	long il_indrapetat
	long il_nblettre = -1
	long il_row
	long il_respid[]
	long il_indresp
	long il_denttraitreq
	long il_dentrapppre
	long il_admin 
	long il_admin_cons
	long il_admin_traite
	long il_admin_plant
	long il_admin_anal
end variables

forward prototypes
public function long incnopatient ()
public function string of_nbzero (long nbzero)
public function boolean validernodos (long ll_nodos)
public function boolean validernotel (string ls_tel)
public function string incnodossier ()
public function string uf_resptype (string as_lien)
public function integer incnoboite ()
public subroutine uf_ortho2consultpro ()
public subroutine uf_addlieninpatientfile ()
public subroutine uf_passasreferal (long al_patid)
public function boolean validernewdos (string as_newdos)
public subroutine sauve (integer ai_index)
public subroutine uf_ortho2vistadent ()
public function boolean validernomprenom (long al_orthoid)
public subroutine uf_ortho2planmeca ()
public subroutine uf_ortho2dolphin ()
public subroutine uf_dosspatexcel ()
public function string newnumdoss (long ll_nodossstart)
public subroutine uf_ortho2capturelink ()
public function string of_retourner_no_boite (integer al_no_boite)
public subroutine uf_ortho2cadi ()
public subroutine uf_ortho2byte ()
public subroutine uf_ortho2mdl3d ()
public subroutine of_modifiercarte (long al_row)
public subroutine of_refreshbioplugin ()
public subroutine of_envoiemail ()
public subroutine of_importer ()
public subroutine uf_ortho2lava ()
public subroutine uf_setcolor ()
end prototypes

event ue_timer(double ad_intervale);timer(ad_intervale)

end event

public function long incnopatient ();long ll_nb,ll_annee
string ls_annee
ls_annee = string(year(today())) + '000'
ll_annee = long(ls_annee)
select no_dossier into :ll_nb from patient where no_dossier is not null and no_dossier >= :ll_annee order by no_dossier desc;
if ll_nb = 0 then
   return ll_annee
else
   return ll_nb + 1
end if
end function

public function string of_nbzero (long nbzero);String ls_nbzero
Long ll_nbzero

ll_nbzero = Len(string(nbzero))

CHOOSE CASE ll_nbzero
     CASE   1 to 1  
	     ls_nbzero = '00' + string(nbzero)
     CASE  2 to 2   
		 ls_nbzero = '0' + string(nbzero)
     CASE ELSE   
		 ls_nbzero = string(nbzero)
END CHOOSE

return ls_nbzero
end function

public function boolean validernodos (long ll_nodos);long ll_count
string ls_nom
string ls_prenom

select count(*) into :ll_count from patient where no_dossier = :ll_nodos;
select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where no_dossier = :ll_nodos;
is_nom = ls_prenom + ' ' + ls_nom

if ll_count > 0 then
	if ii_modeajout = 1 then
		if error_type(226) = 1 then
			return true
		else
			return false
		end if
	else
		return true
	end if
else
	return true
end if
end function

public function boolean validernotel (string ls_tel);long ll_count
string ls_nom
string ls_prenom

select count(*) into :ll_count from patient where tel_maison = :ls_tel;
select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where tel_maison = :ls_tel;
is_nom = ls_prenom + ' ' +  ls_nom

if ll_count > 0 then
	if ii_modeajout = 1 then
		if error_type(227) = 1 then
			return true
		else
			return false
		end if
	else
		return true
	end if
else
	return true
end if
end function

public function string incnodossier ();long 		ldd_dos


select max(cast(new_dossier as integer)) into :ldd_dos from patient;
ldd_dos = ldd_dos + 1
change = true
return string(ldd_dos)
//long ll_nb,ll_annee = 0
//string ls_annee
//
////ls_annee = string(year(today())) + '000'
//ls_annee = mid(string(year(today())),3,2) + '-0000'
//ll_annee = long(ls_annee)
//select new_dossier into :ll_nb from patient where new_dossier is not null and new_dossier >= :ls_annee order by new_dossier desc;
//if ll_nb = 0 then
//   return ls_annee
////else
////  ls_anneee = mid(string(year(today())),3,2) +
//end if
end function

public function string uf_resptype (string as_lien);choose case as_lien
	case 'p'
		return 'Père'
	case 'm'
		return 'Mère'
	case 'gm'
		return 'Grand Mère'
	case 'gp'
		return 'Grand Père'
	case 'a'
		return 'Autre'
	case 't'
		return 'Tante'
	case 'o'
		return 'Oncle'
	case 'tu'
		return 'Tuteur'
end choose
end function

public function integer incnoboite ();long 		ll_max, ll_count, i
string 	ls_noboite, ls_max
long		ll_noinc

select noboite_inc into :ll_noinc from t_options where ortho_id = :v_no_ortho;

IF ll_noinc = 1 THEN
	select IsNull((min(cast(no_boite as integer))+1),1) as maximum INTO :i from patient a
	where not exists (select 1 from patient b where b.no_boite = a.no_boite + 1)	;
	
ELSE
	select max(cast(no_boite as integer)) into :ll_max from patient where no_boite is not null;
	//ll_max = long(ls_max)
	for i = 1 to ll_max
		ls_noboite = string(i)
		select count(*) into :ll_count from patient where no_boite = :ls_noboite;
		if ll_count <= 0 then
			exit
		end if
	next
	
	if i = ll_max then
		i++
	end if	
END IF
	

return i
end function

public subroutine uf_ortho2consultpro ();integer li_FileNum,li_check
string ls_patcp,ls_date,ls_patid,ls_patnom,ls_patprenom,ls_birthday,ls_add
string ls_city,ls_state,ls_zip,ls_email,ls_tel
date ldt_bithday

select ortho2consultpro into :li_check from t_options where ortho_id = :v_no_ortho;
if li_check = 1 then
	ls_date = string(string(year(today()))+string(month(today()))+string(day(today())))
	ls_patid = string(il_patid)
	ls_patnom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'patient_nom')
	if isnull(ls_patnom) then ls_patnom = ''
	ls_patprenom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'patient_prenom')
	if isnull(ls_patprenom) then ls_patprenom = ''
	ldt_bithday = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemdate(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'date_naissance')
	ls_birthday = string(string(month(ldt_bithday))+'/'+string(day(ldt_bithday))+'/'+string(year(ldt_bithday)))
	if isnull(ls_birthday) then ls_birthday = ''
	ls_add = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'adresse')
	if isnull(ls_add) then ls_add = ''
	ls_city = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'ville')
	if isnull(ls_city) then ls_city = ''
	ls_state = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'province')
	if isnull(ls_state) then ls_state = ''
	ls_zip = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'code_postale')
	if isnull(ls_zip) then ls_zip = ''
	ls_email = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'email')
	if isnull(ls_email) then ls_email = ''
	ls_tel = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'tel_maison')
	if isnull(ls_tel) then ls_tel = ''
	ls_patcp = '[#date: "'+ls_date+'", &
	#dateMod: "'+ls_date+'", &
	#id: "'+ls_patid+'", &
	#accessed: 0, &
	#name: &
	[#FName: "'+ls_patnom+'", &
	#LName: "'+ls_patprenom+'", &
	#mname: "", &
	#birthDay: "'+ls_birthday+'", &
	#sal: "Mr.", &
	#sin: ""], &
	#address: &
	[#Addr1: "'+ls_add+'", &
	#Addr2: "", &
	#City: "'+ls_city+'", &
	#state: "'+ls_state+'", &
	#Zip: "'+ls_zip+'", &
	#country: "Canada", &
	#EMail: "'+ls_email+'"], &
	#phone: &
	[[#num: "'+ls_tel+'", &
	#ext: "", &
	#type: "None"], &
	[#num: "", &
	#ext: "", &
	#type: "None"]], &
	#other: &
	[#referred: "None"], &
	#userAccess: ["Admin"]]'
	
	li_FileNum = FileOpen("C:\Program Files\ConsultPRO3\Patients\"+ls_patid+".dnt", LineMode!, Write!, LockWrite!, Append!)
	FileWrite(li_FileNum, ls_patcp)
	FileClose(li_FileNum)
end if
end subroutine

public subroutine uf_addlieninpatientfile ();integer i
string ls_nom,ls_tel

for i = 1 to tab_dosspat.tabpage_resp.dw_dosspatrespfin.rowcount()
	if tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'resptype') = 'p' then
		ls_nom = tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'prenom') + ' ' + tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'nom')
		ls_tel = tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'telres')
		update patient set nom_pere = :ls_nom, no_tel_pere = :ls_tel where patient_id = :il_patid;
		commit using sqlca; 
	elseif tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'resptype') = 'm' then
		ls_nom = tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'prenom') + ' ' + tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'nom')
		ls_tel = tab_dosspat.tabpage_resp.dw_dosspatrespfin.getitemstring(i,'telres')
		update patient set nom_mere = :ls_nom, no_tel_mere = :ls_tel where patient_id = :il_patid;
		commit using sqlca; 
	end if
next
end subroutine

public subroutine uf_passasreferal (long al_patid);long ll_count
string ls_patnom, ls_patprenom, ls_patadd, ls_patville, ls_patprov
string ls_patzip, ls_patlang, ls_pattelbur, ls_patemail
string ls_patnote, ls_patsex, ls_patsuf, ls_nomcomp


select patient_nom,patient_prenom,adresse,ville,province,code_postale,langue,tel_maison,email,note,sex
into :ls_patnom,:ls_patprenom,:ls_patadd,:ls_patville,:ls_patprov,:ls_patzip,:ls_patlang,:ls_pattelbur,:ls_patemail,:ls_patnote,:ls_patsex
from patient where patient_id = :al_patid;

if ls_patsex = 'F' then
	ls_patsex = 'f'
	ls_patsuf = 'Madame'
else
	ls_patsex = 'h'
	ls_patsuf = 'Monsieur'
end if
choose case ls_patlang
	case 'F'
		ls_patlang = 'fr'
	case 'A'
		ls_patlang = 'an'
	case 'E'
		ls_patlang = 'es'
end choose
ls_nomcomp = ls_patprenom + ' ' + ls_patnom
select count(*) into :ll_count from t_referents where ref_nom = :ls_patnom and ref_prenom = :ls_patprenom and ortho_id = :v_no_ortho;
if ll_count > 0 then
	if error_type(225) = 1 then
	   insert into t_referents(ref_adresse,ref_ville,ref_sexe,ref_province,ref_zip,ref_tel_bur,ref_langue,ref_note,ref_email,ref_prenom,ref_nom,ref_nom_complet,ref_suffix,ortho_id) 
		values(:ls_patadd,:ls_patville,:ls_patsex,:ls_patprov,:ls_patzip,:ls_pattelbur,:ls_patlang,:ls_patnote,:ls_patemail,:ls_patprenom,:ls_patnom,:ls_nomcomp,:ls_patsuf,:v_no_ortho);
	end if
else
	insert into t_referents(ref_adresse,ref_ville,ref_sexe,ref_province,ref_zip,ref_tel_bur,ref_langue,ref_note,ref_email,ref_prenom,ref_nom,ref_nom_complet,ref_suffix,ortho_id) 
	values(:ls_patadd,:ls_patville,:ls_patsex,:ls_patprov,:ls_patzip,:ls_pattelbur,:ls_patlang,:ls_patnote,:ls_patemail,:ls_patprenom,:ls_patnom,:ls_nomcomp,:ls_patsuf,:v_no_ortho);
end if
end subroutine

public function boolean validernewdos (string as_newdos);long ll_count
string ls_nom
string ls_prenom
s_pat st_pat

select count(*) into :ll_count from patient where new_dossier = :as_newdos and patient_id <> :il_patid;
select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where new_dossier = :as_newdos and patient_id <> :il_patid;
is_nom = ls_prenom + ' ' + ls_nom

if ll_count > 0 then
	if ii_modeajout = 1 then
		if error_type(244) = 1 then
			return true
		else
			return false
		end if
	else
		
		st_pat.patnom = ls_nom
		st_pat.patprenom = ls_prenom
		st_pat.col = 2
		openwithparm(w_patdouble,st_pat)
		
		return false
	end if
else
	return true
end if
end function

public subroutine sauve (integer ai_index);//if change then
	choose case ai_index
		case 1 // dossier du patient
			tab_dosspat.tabpage_dosspat.dw_dosspat.event ue_update()
		case 2 // responsable financier
			tab_dosspat.tabpage_resp.dw_dosspatrespfin.event ue_update()
		case 3 // contrat
			tab_dosspat.tabpage_contrat.dw_contrat.event ue_update()
		case 4 // dentiste
			tab_dosspat.tabpage_dentist.dw_dosspatdentresp.event ue_update()
		case 5 // Référent
			tab_dosspat.tabpage_ref.dw_dosspatref.event ue_update()
		case 6 // Rendez-vous
			tab_dosspat.tabpage_rdv.tab_rdv.tabpage_visits.dw_dosspatrdv.event ue_update()
		case 7 // Correspondance
//			tab_dosspat.tabpage_histocorr.dw_histocorr.deleterow(tab_dosspat.tabpage_histocorr.dw_histocorr.getrow())
			tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_update()
		case 8 // carte trait
			if tab_dosspat.tabpage_cartetrait.dw_carteentete.update() = 1 then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
			tab_dosspat.tabpage_cartetrait.dw_cartetrait.event ue_update()
		case 9 // age comptes
	//		tab_dosspat.tabpage_age.dw_etatcompte.event ue_update()
		case 10 // Etat compte
			tab_dosspat.tabpage_etat.dw_etatcomptepat1.event ue_update()
		case 11 // Rap pre
			tab_dosspat.tabpage_rappre.dw_rapppre.event ue_update()
		case 12 // trait req
			if isnull(tab_dosspat.tabpage_traitreq.dw_traitreq.getITemNumber(tab_dosspat.tabpage_traitreq.dw_traitreq.getRow(),'t_consultations_id_dentist')) then
				openwithparm(w_dosspatselectdent,il_patid,w_dossier_patients)
			end if
			tab_dosspat.tabpage_traitreq.dw_traitreq.event ue_update()
		case 13 // rap cons
			tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.event ue_update()
		case 14 // ref a
			tab_dosspat.tabpage_refa.dw_dosspatrefa.event ue_update()
	end choose
//end if

end subroutine

public subroutine uf_ortho2vistadent ();//////////////////////////////////////////////
//
// Par : Eric Vézina ing.
// Date: 12 Décembre 2004
// Description : Cette fonction créer le dossier Vistadent si il n'existe pas et
// modifie le dossier Vistadent si il existe.
//
//////////////////////////////////////////////

integer li_FileNum,li_check
string ls_patcp,ls_date,ls_patid,ls_patnom,ls_patprenom,ls_birthday,ls_add,ls_sal,ls_sex,ls_telautre
string ls_city,ls_state,ls_zip,ls_email,ls_telres,ls_telbur,ls_telcell,ls_vistworkdir,ls_pathphotos
string ls_vistadent, ls_vistaexepath, ls_run
date ldt_bithday

//if error_type(252) = 1 then
//	select ortho2vistadent,chemphoto,pathdolphin into :li_check,:ls_pathphotos, :ls_vistaexepath from t_options where ortho_id = :v_no_ortho;
	ls_vistadent = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'idvistadent')
//	// verifie si l'option creer dossier Vistadent est actif
//	if li_check = 1 and len(ls_pathphotos) > 1 then
//		// verification du # dossier Vistadent
//		if isnull(ls_vistadent) then
//			if error_type(254) = 1 then
//				// creation du # dossier Vistadent
//				ls_vistadent = string(il_patid)
//				// recherche d'un numero unique
//				if directoryexists(ls_pathphotos + '\' + ls_vistadent) then
//					do while directoryexists(ls_pathphotos + '\' + ls_vistadent)
//						ls_vistadent = string(long(ls_vistadent) + 1)
//					loop
//					messagebox('new number',ls_vistadent)
//				end if
//				// inscription du numero
//				update patient set idvistadent = :ls_vistadent where patient_id = :il_patid;
//				commit using sqlca;
//				error_type(-1)
//			else
//				return
//			end if
//		end if
//		// recherche du repertoire Vistadent
//		RegistryGet("HKEY_CURRENT_USER\Software\RX Video\Portrait","Working",RegString!,ls_vistworkdir)
//		if not fileexists(ls_vistworkdir) then
//			error_type(153)
//			return
//		end if
		// get info patient
		ls_date = string(string(year(today()))+string(month(today()))+string(day(today())))
		
		select salutation into :ls_sal from t_salutation inner join patient on t_salutation.id_sal = patient.id_sal where patient.patient_id = :il_patid;
		if isnull(ls_sal) then ls_sal = ''
		ls_sex = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'sex')
		if isnull(ls_sex) then ls_sex = ''
		ls_patnom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'patient_nom')
		if isnull(ls_patnom) then ls_patnom = ''
		ls_patprenom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'patient_prenom')
		if isnull(ls_patprenom) then ls_patprenom = ''
		ldt_bithday = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemdate(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'date_naissance')
		ls_birthday = string(ldt_bithday,'yyyy-MM-dd')
//		messagebox('ls_birthday',ls_birthday)
//		ls_birthday = string(string(month(ldt_bithday))+'/'+string(day(ldt_bithday))+'/'+string(year(ldt_bithday)))
		if isnull(ls_birthday) then ls_birthday = ''
		ls_add = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'adresse')
		if isnull(ls_add) then ls_add = ''
		ls_city = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'ville')
		if isnull(ls_city) then ls_city = ''
		ls_state = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'province')
		if isnull(ls_state) then ls_state = ''
		ls_zip = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'code_postale')
		if isnull(ls_zip) then ls_zip = ''
		ls_email = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'email')
		if isnull(ls_email) then ls_email = ''
		ls_telres = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'tel_maison')
		if isnull(ls_telres) then ls_telres = ''
		ls_telbur = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'tel_bureau')
		if isnull(ls_telbur) then ls_telbur = ''
		ls_telcell = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'telcell')
		if isnull(ls_telcell) then ls_telcell = ''
		ls_telautre = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'telautre')
		if isnull(ls_telautre) then ls_telautre = ''
//		//creation du fichier
//	//	messagebox('create',string(ll_idvistadent))
//		ls_patcp = '[Patient]~r~n&
//	Patient ID='+ls_vistadent+'~r~n&
//	Title='+ls_sal+'~r~n&
//	First Name='+ls_patprenom+'~r~n&
//	Middle Name=~r~n&
//	Last Name='+ls_patnom+'~r~n&
//	Preferred Name='+ls_patprenom+" "+ls_patnom+'~r~n&
//	Sex='+ls_sex+'~r~n&
//	Birth Date='+ls_birthday+'~r~n&
//	Home Phone='+ls_telres+'~r~n&
//	Work Phone='+ls_telbur+'~r~n&
//	Cell Phone='+ls_telcell+'~r~n&
//	Pager Number='+ls_telautre+'~r~n&
//	E-mail='+ls_email+'~r~n&
//	Address1='+ls_add+'~r~n&
//	Address2=~r~n&
//	City='+ls_city+'~r~n&
//	State='+ls_state+'~r~n&
//	Zip Code='+ls_zip+'~r~n&
//	Model No='+ls_add+'~r~n&
//	Race='
//	//	messagebox('Working file',ls_vistworkdir +"Vistface.ini")
//		li_FileNum = FileOpen(ls_vistworkdir+"Vistface.ini", LineMode!, Write!, LockWrite!, Replace!)
//		FileWrite(li_FileNum, ls_patcp)
//		FileClose(li_FileNum)
//		if run(ls_vistworkdir+"vistface.exe") = 1 then
//			error_type(155)
//		end if
//		messagebox("dfd",ls_vistaexepath+"\"+"vistadent.exe - id = ~"" + ls_vistadent + "~"")
//		if run(ls_vistaexepath+"\"+"vistadent.exe - id = ~"" + ls_vistadent + "~"",Minimized!) = 1 then
//			error_type(155)
//		end if
//	end if
if len(ls_vistadent) > 0 then
	if len(ls_patprenom) > 0 and len(ls_patnom) > 0 and len(ls_birthday) > 0 and len(ls_sex) > 0 then
		select cheminvistadent into :ls_vistaexepath from t_options where ortho_id = :v_no_ortho;
		ls_run = '"'+ls_vistaexepath+'" "-id='+ls_vistadent+'" "-first='+ls_patprenom+'" "-last='+ls_patnom+'" "-dob='+ls_birthday+'" "-sex='+ls_sex+'"'
//		messagebox('Vistadent',ls_run)
		run(ls_run, maximized!)
	else
		if v_langue = 'fr' then
			messagebox('Erreur!','Une des informations suivantes est manquante : Prenom, Nom, Date de naissance, Genre',Information!)
		else
			messagebox('Error!','Miss information : First name, last name, Birth Date, Gender',Information!)
		end if
	end if
else
	if v_langue = 'fr' then
			messagebox('Erreur!','Vistadent Id non défini',Information!)
		else
			messagebox('Error!','Vistadent Id is not defined',Information!)
		end if
end if
end subroutine

public function boolean validernomprenom (long al_orthoid);long row,ll_count
string 	ls_nom
string 	ls_prenom
long		ll_patid

row = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getrow()

IF row > 0 THEN
	ls_prenom = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(row,'patient_prenom')
	ls_nom = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(row,'patient_nom')
	ll_patid = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getitemnumber(row,'patient_id')
	
	select count(*) into :ll_count from patient 
	where upper(patient_nom) = upper(:ls_nom) and upper(patient_prenom) = upper(:ls_prenom) and no_ortho = :al_orthoid
	and patient_id <> :ll_patid ;
	
	is_nom = ls_prenom + ' ' + ls_nom
	
	if ll_count > 0 then
		if error_type(243) = 1 then
			return true
		else
			return false
		end if
	else
		return true
	end if
ELSE
	RETURN TRUE
	
END IF
end function

public subroutine uf_ortho2planmeca ();integer li_typeimaging,li_res
string ls_patnom,ls_patprenom,ls_datenais,ls_nodoss,ls_ortho
date ldt_nais

if error_type(250) = 1 then
	select patient_prenom,patient_nom,date_naissance,new_dossier
	into :ls_patprenom,:ls_patnom,:ldt_nais,:ls_nodoss
	from patient where patient_id = :il_patid;
	select dr_nom_complet into :ls_ortho from ortho_id where ortho_id = :v_no_ortho;
	ls_datenais = string(ldt_nais)
	select typeimaging into :li_typeimaging from t_options where ortho_id = :v_no_ortho;
	if not li_typeimaging = 1 or isnull(li_typeimaging) then
		ls_nodoss = string(il_patid)
	end if
	messagebox('planmeca','DxStart.exe "'+ls_nodoss+'" "'+ls_patnom+'" "'+ls_patprenom+'" "'+ls_datenais+'" "'+ls_ortho+'"')
	li_res = run('DxStart.exe "'+ls_nodoss+'" "'+ls_patnom+'" "'+ls_patprenom+'" "'+ls_datenais+'" "'+ls_ortho+'"',Maximized!)
	if li_res = 1 then
//		messagebox('Avertissement!','Le dossier suivant a été créé dans Planmeca : '+ls_nodoss+', '+ls_patnom+', '+ls_patprenom+', '+ls_datenais+', '+ls_ortho)
	else
		messagebox('Erreur!','La création du dossier dans Planmeca a échoué.',stopsign!)
	end if
end if
end subroutine

public subroutine uf_ortho2dolphin ();long ll_rc, ll_id
integer li_FileNum
string ls_patdata,ls_null,ls_patnom,ls_patprenom,ls_birthday,ls_gender,ls_pathdolphin,ls_cmdline,ls_flag = 'Open'
string ls_typeimg, ls_id
date ldt_bithday
SetNull(ls_null)

select isnull(imgfolder,'p') into :ls_typeimg from t_options where ortho_id = :v_no_ortho;
if ls_typeimg = 'd' then
	ls_id = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'new_dossier')
else
	ls_id = string(il_patid)
end if

if error_type(253) = 1 then
	// info patient
	ls_patnom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'patient_nom')
	if isnull(ls_patnom) then ls_patnom = ''
	ls_patprenom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'patient_prenom')
	if isnull(ls_patprenom) then ls_patprenom = ''
	ldt_bithday = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemdate(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'date_naissance')
	ls_birthday = string(string(month(ldt_bithday))+'-'+string(day(ldt_bithday))+'-'+string(year(ldt_bithday)))
	if isnull(ls_birthday) then ls_birthday = ''
	ls_gender = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'sex')
	choose case ls_gender
		case 'M'
			ls_gender = '0'
		case 'F'
			ls_gender = '1'
		case else
			ls_gender = '0'
	end choose
	// création du fihier patient
	ls_patdata = '[Patient Info]~r~n&
						PatientID='+ls_id+'~r~n&
						Lastname='+ls_patnom+'~r~n&
						Firstname='+ls_patprenom+'~r~n&
						Birthdate='+ls_birthday+'~r~n&
						Gender='+ls_gender
		
	// ligne de commande
	select pathdolphin into :ls_pathdolphin from t_options where ortho_id = :v_no_ortho;
	li_FileNum = FileOpen(ls_pathdolphin+'\Import\dol.txt', LineMode!, Write!, LockWrite!, Replace!)
	FileWrite(li_FileNum, ls_patdata)
	FileClose(li_FileNum)
	ls_cmdline = ls_pathdolphin+'\doldb.exe AddPatient -f'+ls_pathdolphin+'\Import\dol.txt'
	// exécuter
	if not isnull(ls_pathdolphin) and ls_pathdolphin <> '' then
		ll_rc = Run(ls_cmdline, Minimized!)
		if ll_rc = 1 then
			messagebox('Avertissement!','Le dossier suivant a été créé dans Dolphin : '+string(ll_id)+', '+ls_patnom+', '+ls_patprenom+', '+ls_birthday+', '+ls_gender)
			Run(ls_pathdolphin+'\dolphin.exe ' + ls_id, Minimized!)
		else
			messagebox('Erreur!','La création du dossier vers Dolphin a échoué.',stopsign!)
			Run(ls_pathdolphin+'\dolphin.exe', Minimized!)
		end if
	else
		messagebox("Erreur!","Le répertoire n'a pas été défini.",Information!,Ok!)
	end if
end if
end subroutine

public subroutine uf_dosspatexcel ();datastore ds_dosspatexcel
ds_dosspatexcel = create datastore
ds_dosspatexcel.dataobject = "d_dosspatexcel"
ds_dosspatexcel.insertrow(0)
ds_dosspatexcel.retrieve(message.doubleparm)
destroy ds_dosspatexcel
end subroutine

public function string newnumdoss (long ll_nodossstart);// Dave Tremblay
//
// Cette fontion attribut le numéro de dossier automatiquement selon un mask

// Ajout d'un 'Mask'
// Christian Rivard 2010-10-06
// Version: 8.4.17.5

// Ajout d'un 'Mask'
// Christian Rivard 2010-11-01
// Version 8.4.17.5

string ls_masktype, ls_annee, ls_mois, ls_nodoss

select maskdoss1 into :ls_masktype from t_options where ortho_id = :v_no_ortho;

CHOOSE CASE ls_masktype
	CASE 'mask1'	
		ls_annee = right(string(year(today())),2)
		ll_nodossstart = ll_nodossstart + 1
		ls_nodoss = ls_annee + '-' + remplir(string(ll_nodossstart),4,'0',true)
	CASE 'mask2'
		ll_nodossstart = ll_nodossstart + 1
		ls_nodoss = string(ll_nodossstart)
	CASE 'mask3'
		ls_annee = string(long(right(string(year(today())),2)))
		ll_nodossstart = ll_nodossstart + 1
		ls_nodoss = ls_annee + remplir(string(ll_nodossstart),4,'0',true)
	CASE 'mask4'
		ls_annee = string(year(today()))
		ll_nodossstart = ll_nodossstart + 1
		ls_nodoss = ls_annee + '-' +  remplir(string(ll_nodossstart),3,'0',true)
	CASE 'mask5'
		ls_annee = string(year(today()))
		ls_mois = string(month(today()))
		ll_nodossstart = ll_nodossstart + 1
		ls_nodoss = ls_annee + '-' + ls_mois + '-' + remplir(string(ll_nodossstart),3,'0',true)
		
END CHOOSE

if messagebox("Question","Désirez-vous attribuer ce nouveau numéro: " + ls_nodoss ,Question!,YesNo!) = 1 then
	update t_options set nodossstart = :ll_nodossstart from t_options where ortho_id = :v_no_ortho;
	commit using sqlca;
	return ls_nodoss
else
	return ''
end if

end function

public subroutine uf_ortho2capturelink ();string ls_path, ls_info

select chemcaplink into :ls_path from t_options where ortho_id = :v_no_ortho;
select patient_nom + ', ' + patient_prenom into :ls_info from patient where patient_id = :il_patid;
Clipboard(ls_info + ' ' + string(il_patid))
run(ls_path, Maximized!)
end subroutine

public function string of_retourner_no_boite (integer al_no_boite);// Cette fonction attribut le numéro de boîte automatiquement selon un mask
string 	ls_masktype, ls_annee, ls_nodoss, ls_mois
long		ll_noinc, ll_rtn

select mask_boite, noboite_inc into :ls_masktype, :ll_noinc from t_options where ortho_id = :v_no_ortho;

CHOOSE CASE ls_masktype
	CASE 'mask1'	
		ls_annee = right(string(year(today())),2)
		al_no_boite = al_no_boite + 1
		ls_nodoss = ls_annee + '-' + remplir(string(al_no_boite),4,'0',true)
	CASE 'mask2'
		IF ll_noinc = 1 THEN
			SetPointer(HourGlass!)
			select IsNull((min(cast(if isnumeric(no_boite) = 1 then no_boite else null endif as integer))+1),1) as maximum INTO :ll_rtn 
			from patient a
			where (cast(if isnumeric(no_boite) = 1 then no_boite else null endif as integer) >= :al_no_boite) 	
			and not exists 
			(select 1 from patient b 
			where cast((if isnumeric(b.no_boite) = 1 then b.no_boite else 0 endif) as integer) = 
			(cast((if isnumeric(a.no_boite) = 1 then a.no_boite else null endif) as integer) + 1) );

		ELSE
			select max(cast(no_boite as integer)) into :ll_rtn from patient where no_boite is not null ;
			ll_rtn = ll_rtn + 1
		END IF
		ls_nodoss = string(ll_rtn)
	CASE 'mask3'
		ls_annee = string(long(right(string(year(today())),2)))
		al_no_boite = al_no_boite + 1
		ls_nodoss = ls_annee + remplir(string(al_no_boite),4,'0',true)
	CASE 'mask4'
		ls_annee = string(year(today()))
		al_no_boite = al_no_boite + 1
		ls_nodoss = ls_annee + '-' +  remplir(string(al_no_boite),3,'0',true)
	CASE 'mask5'
		ls_annee = string(year(today()))
		ls_mois = string(month(today()))
		al_no_boite = al_no_boite + 1
		ls_nodoss = ls_annee + '-' + ls_mois + '-' + remplir(string(al_no_boite),3,'0',true)
	CASE ELSE
		ls_nodoss = right(string(year(today())),2) + '-' + string(month(today()),'00') + '-' + string(al_no_boite)

END CHOOSE

if messagebox("Question","Désirez-vous attribuer ce nouveau numéro: " + ls_nodoss ,Question!,YesNo!) = 1 then
	
	if ls_masktype <> "mask2" THEN
		update t_options set noboxstart = :al_no_boite from t_options where ortho_id = :v_no_ortho;
	END IF
	
	return ls_nodoss
else
	return ''
end if

end function

public subroutine uf_ortho2cadi ();integer li_typeimaging,li_res
string ls_patnom,ls_patprenom,ls_datenais,ls_nodoss,ls_ortho, ls_chemphoto
date ldt_nais

if error_type(261) = 1 then
	select isnull(patient_prenom,'') + ' ' + isnull(patient_nom,''),date_naissance,new_dossier
	into :ls_patnom,:ldt_nais,:ls_nodoss
	from patient where patient_id = :il_patid;
	select dr_nom_complet into :ls_ortho from ortho_id where ortho_id = :v_no_ortho;
	ldt_nais = date(year(ldt_nais),month(ldt_nais),day(ldt_nais))
	ls_datenais = string(ldt_nais,'ddmmyyyy')
	select chemphoto into :ls_chemphoto from t_options where ortho_id = :v_no_ortho;
	ls_chemphoto = ls_chemphoto + '\' + string(il_patid)
//	messagebox("fsd","CADI.exe /P"+ls_patnom+" /D"+ls_ortho+" /L1 /F"+ls_chemphoto+" /B"+ls_datenais)
	li_res = run("C:\CADI\CADI.exe /P"+ls_patnom+" /D"+ls_ortho+" /L1 /F"+ls_chemphoto+"/B"+ls_datenais,Maximized!)
	if li_res = 1 then
//		messagebox('Avertissement!','Le dossier suivant a été créé dans Planmeca : '+ls_nodoss+', '+ls_patnom+', '+ls_patprenom+', '+ls_datenais+', '+ls_ortho)
	else
		messagebox('Erreur!','La création du dossier dans CADI a échoué.',stopsign!)
	end if
end if

end subroutine

public subroutine uf_ortho2byte ();string ls_path

// Intégration Orthobyte
select chprogmdl3d into :ls_path from t_options where ortho_id = :v_no_ortho;

//if not fileExists(ls_path) then
//	error_type(1011)
//	return
//end if

run('"' + ls_path + '" ' + string(il_patid))

end subroutine

public subroutine uf_ortho2mdl3d ();// Lancement d'un logiciel de modélisation 3d

string ls_prgm

select prgmdl3d into :ls_prgm from t_options where ortho_id = :v_no_ortho;

choose case ls_prgm
	case 'B'
		uf_ortho2byte()
	case 'L'
		uf_ortho2lava()
end choose

end subroutine

public subroutine of_modifiercarte (long al_row);long ll_id_cartetrait

s_pat st_pat
		
if al_row > 0 then		
	ll_id_cartetrait = THIS.tab_dosspat.tabpage_cartetrait.dw_cartetrait.getItemNumber(al_row,'id_cartetrait')
	gnv_app.inv_entrepotglobal.of_ajoutedonnee( "id carte traitement modifier", ll_id_cartetrait)
	st_pat.patid = il_patid
	openwithparm(w_cartetrait,st_pat)
end if
end subroutine

public subroutine of_refreshbioplugin ();Integer li_biopunch

select count(1) into :li_biopunch from PERSON where IDPATIENT = :il_patid;

if li_biopunch >= 1 then
	this.tab_dosspat.tabpage_dosspat.dw_dosspat.object.p_biometrie.filename = "C:\ii4net\orthotek\images\bioPlugin.bmp"
else
	this.tab_dosspat.tabpage_dosspat.dw_dosspat.object.p_biometrie.filename = "C:\ii4net\orthotek\images\bioPluginicoRed.bmp"
end if


end subroutine

public subroutine of_envoiemail ();gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientchoixemail", il_patid)
open(w_choixemail)
end subroutine

public subroutine of_importer ();int li_rtn
string ls_docpath, ls_docname, ls_dosscorr

select corrpath into :ls_dosscorr from t_options where ortho_id = :v_no_ortho;
if right(ls_dosscorr, 1) <> '\' then ls_dosscorr += '\'

li_rtn = GetFileOpenName("Select File", ls_docpath, ls_docname, "", "Correspondance (*.DOC; *.PDF; *.JPG; *.XLS; *.XLSX; *.DOCX), *.DOC; *.PDF; *.JPG; *.JPEG; *.XLS; *.XLSX; *.DOCX", ls_dosscorr, 18)


if li_rtn = 1 then
	
	if not DirectoryExists(ls_dosscorr + string(il_patid)) then CreateDirectory(ls_dosscorr + string(il_patid))
	if not DirectoryExists(ls_dosscorr + string(il_patid) + "\scan") then CreateDirectory(ls_dosscorr + string(il_patid) + "\scan")
 
	if v_langue = 'an' then
		ls_docname = inputbox("Question!","Which name your file should be have?",ls_docname)
	else
		ls_docname = inputbox("Question!","Quel nom desirez-vous donner à votre fichier?",ls_docname)
	end if
	if upper(right(ls_docname,3)) = 'PDF' or upper(right(ls_docname,3)) = 'DOC' or upper(right(ls_docname,3)) = 'XLS' or upper(right(ls_docname,4)) = 'XLSX' or upper(right(ls_docname,4)) = 'DOCX'  then
		FileCopy(ls_docpath,ls_dosscorr + string(il_patid) + "\" + ls_docname,true)
	else
		FileCopy(ls_docpath,ls_dosscorr + string(il_patid) + "\scan\" + ls_docname,true)
	end if
	tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
	
end if




end subroutine

public subroutine uf_ortho2lava ();string ls_path, ls_nom, ls_prenom
date ldt_dn
long ll_row

// Intégration Orthobyte
select chprogmdl3d into :ls_path from t_options where ortho_id = :v_no_ortho;

//if not fileExists(ls_path) then
//	error_type(1011)
//	return
//end if

ll_row = tab_dosspat.tabpage_dosspat.dw_dosspat.getRow()

ls_nom = tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(ll_row, "patient_nom")
ls_prenom = tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(ll_row, "patient_prenom")
ldt_dn = tab_dosspat.tabpage_dosspat.dw_dosspat.getItemDate(ll_row, "date_naissance")

//<installation path>\LavaLink.exe /first:<first name> /last:<last name> /dob:<mm/dd/yyyy> /pid:<patient ID>

run('"' + ls_path + '" /first:"' + ls_prenom + '" /last:"' + ls_nom + '" /dob:' + string(ldt_dn, "mm/dd/yyyy") + ' /pid:' + string(il_patid))

end subroutine

public subroutine uf_setcolor ();long ll_color

Choosecolor(ll_color)

update patient set "color_cartetraitement" = :ll_color where patient_id = :il_patid;

w_dossier_patients.tab_dosspat.tabpage_cartetrait.backcolor = ll_color
w_dossier_patients.tab_dosspat.tabpage_cartetrait.dw_cartetrait.modify("datawindow.color = " + string(ll_color))
w_dossier_patients.tab_dosspat.tabpage_cartetrait.dw_carteentete.modify("datawindow.color = " + string(ll_color))
end subroutine

on w_dossier_patients.create
int iCurrent
call super::create
this.cb_ceph=create cb_ceph
this.cb_img=create cb_img
this.tab_dosspat=create tab_dosspat
this.uo_calutil1=create uo_calutil1
this.cb_transfert=create cb_transfert
this.cb_update=create cb_update
this.cb_close=create cb_close
this.cb_insert=create cb_insert
this.cb_new=create cb_new
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ceph
this.Control[iCurrent+2]=this.cb_img
this.Control[iCurrent+3]=this.tab_dosspat
this.Control[iCurrent+4]=this.uo_calutil1
this.Control[iCurrent+5]=this.cb_transfert
this.Control[iCurrent+6]=this.cb_update
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.cb_insert
this.Control[iCurrent+9]=this.cb_new
this.Control[iCurrent+10]=this.cb_print
end on

on w_dossier_patients.destroy
call super::destroy
destroy(this.cb_ceph)
destroy(this.cb_img)
destroy(this.tab_dosspat)
destroy(this.uo_calutil1)
destroy(this.cb_transfert)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.cb_insert)
destroy(this.cb_new)
destroy(this.cb_print)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
long ll_color,ScreenX, ScreenY,ll_tab

il_patid = message.doubleparm  //parametre externe

if v_langue = 'an' then
	tab_dosspat.tabpage_dosspat.text = 'Patient File'
	tab_dosspat.tabpage_resp.text = 'Responsible'
	tab_dosspat.tabpage_dentist.text = 'Dentist'
	tab_dosspat.tabpage_ref.text = 'Referral'
	tab_dosspat.tabpage_rdv.text = 'History'
	tab_dosspat.tabpage_age.text = 'Age of Accounts'
	tab_dosspat.tabpage_etat.text = 'Statement'
	tab_dosspat.tabpage_rapcons.text = 'Consult'
	tab_dosspat.tabpage_rappre.text = 'Preliminary Report'
	tab_dosspat.tabpage_traitreq.text = 'Treatment Request'
	tab_dosspat.tabpage_histocorr.text = 'Correspondance'
	tab_dosspat.tabpage_contrat.text = 'Contract Setup'
	tab_dosspat.tabpage_refa.text = 'Referred To'
	tab_dosspat.tabpage_cartetrait.text = 'Treatment Card'
	tab_dosspat.tabpage_rdv.tab_rdv.tabpage_visits.text = 'Appointments'
	tab_dosspat.tabpage_rdv.tab_rdv.tabpage_rappels.text = 'Recalls'
end if
//w_dossier_patients.postevent('ue_post_open')

select isnull(color_cartetraitement,157931151) into :ll_color from patient where patient_id = :il_patid;
w_dossier_patients.tab_dosspat.tabpage_cartetrait.backcolor = ll_color
w_dossier_patients.tab_dosspat.tabpage_cartetrait.dw_cartetrait.modify("datawindow.color = " + string(ll_color))
w_dossier_patients.tab_dosspat.tabpage_cartetrait.dw_carteentete.modify("datawindow.color = " + string(ll_color))

if not isnull(gnv_app.inv_entrepotglobal.of_retournedonnee("dosspat selectedtab")) then tab_dosspat.selectedtab = 12

end event

event timer;long ll_row

if tab_dosspat.selectedTab = 7 then
	tab_dosspat.tabpage_histocorr.dw_histocorr.setRedraw(false)
	ll_row = tab_dosspat.tabpage_histocorr.dw_histocorr.getRow()
	tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
	tab_dosspat.tabpage_histocorr.dw_histocorr.scrollToRow(ll_row)
	tab_dosspat.tabpage_histocorr.dw_histocorr.setRedraw(true)
else
	timer(0,w_dossier_patients)
end if

end event

event pfc_postopen;call super::pfc_postopen;string ls_nom, ls_newdoss



// Code patcher
if isvalid(w_membfamille) then
	close(w_membfamille)
end if
// Fin patch

select patient_nom + ' ' + patient_prenom, new_dossier into :ls_nom, :ls_newdoss from patient where patient_id = :il_patid;
if isnull(ls_newdoss) then ls_newdoss = ""
w_principal.SetMicroHelp(ls_nom + ' (' + ls_newdoss + ')')
if il_patid > 0 then
	tab_dosspat.tabpage_dosspat.dw_dosspat.Retrieve(il_patid)
	tab_dosspat.tabpage_dosspat.dw_dosspatresp.Retrieve(il_patid)
	tab_dosspat.tabpage_dosspat.dw_dosspat.object.t_age.text = calculage(tab_dosspat.tabpage_dosspat.dw_dosspat.getitemdate(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'date_naissance'))
	if tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'province') <> 'USA' then
		tab_dosspat.tabpage_dosspat.dw_dosspat.modify("code_postale.EditMask.Mask = '!#! #!#'")
	end if
else
	tab_dosspat.tabpage_dosspat.dw_dosspat.event ue_insert()
end if

select debarrer_rappre, debarrer_traitreq, debarrer_cons, debarrer_plant, debarrer_anal
  into :il_admin, :il_admin_traite, :il_admin_cons, :il_admin_plant, :il_admin_anal
  from t_options
 where ortho_id = :v_no_ortho;

// Affecter les variables des dentistes

il_denttraitreq = tab_dosspat.tabpage_dosspat.dw_dosspat.getItemNumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'id_dentist')
il_dentrapppre = il_denttraitreq

//Pointer carte
string	ls_retour
ls_retour = gnv_app.inv_entrepotglobal.of_retournedonnee("lien cincout patient", TRUE)
IF ls_retour = "oui" THEN
	THIS.tab_dosspat.selecttab(THIS.tab_dosspat.tabpage_cartetrait)
END IF

of_refreshbioplugin()
end event

type cb_ceph from commandbutton within w_dossier_patients
boolean visible = false
integer x = 914
integer y = 1796
integer width = 384
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ceph"
end type

event clicked;//n_cst_transfert_ceph lnv_transfert_ceph
//long		ll_row
//string	ls_patnom, ls_patprenom
//
//ll_row = tab_dosspat.tabpage_dosspat.dw_dosspat.getrow()
//IF ll_row > 0 THEN
//	ls_patnom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(ll_row, 'patient_nom')
//	if isnull(ls_patnom) then ls_patnom = ''
//	ls_patprenom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(ll_row,'patient_prenom')
//	if isnull(ls_patprenom) then ls_patprenom = ''
//	
//	lnv_transfert_ceph.il_patient = il_patid
//	lnv_transfert_ceph.itr_trans = SQLCA
//	lnv_transfert_ceph.is_nom = ls_patnom + ", " + ls_patprenom
//	opensheetwithparm(w_ceph, lnv_transfert_ceph,w_principal,2,layered!)
//END IF
end event

type cb_img from commandbutton within w_dossier_patients
integer x = 1467
integer y = 1960
integer width = 462
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "IMG"
end type

event clicked;string ls_pathphoto, ls_imgtype, ls_acces

if cb_img.text = 'IMG' then
	
	select chemphoto into :ls_pathphoto from t_options where ortho_id = :v_no_ortho;
	
	if DirectoryExists(ls_pathphoto) then
		SELECT acces_img INTO :ls_acces FROM t_options where ortho_id = :v_no_ortho;
	
		IF ls_acces = "o" THEN
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("mode_montage", "oui" )
			Opensheetwithparm(w_imaging,il_patid,w_principal,2,layered!)
			//If IsValid(w_imaging) THEN w_imaging.title = "Imagerie"
		ELSE
			error_type(1006)
		END IF
		
	else
		
		error_type(191)
		
	end if

else
	
	s_corrletter s_corr
	boolean lb_2k3 = false
	integer li_result, li_FileNum
	string ls_versword, ls_langue, ls_tmplangue, ls_corrpath
	long ll_contactid[], ll_phase[], ll_idpatcorr[]
	
	select corrpathsys into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
	
	li_result = RegistryGet("HKEY_CLASSES_ROOT\Word.Application\CurVer", "", RegString!, ls_versword)
	
	if li_result = 1 then
		if not isNull(ls_versword) then
			if ls_versword = "Word.Application.11" then lb_2k3 = true
		end if
	end if
	
	s_corr.patid = il_patid
	s_corr.letter = ''
	s_corr.flag = 'w'
	s_corr.mode = 'l'
	select id_contact,langue into :ll_contactid[1],:ls_langue from patient where patient_id = :il_patid;
	ll_phase[1] = 1
	ls_tmplangue = v_langue
	v_langue = ls_langue
	ll_idpatcorr[1] = il_patid
	gf_pat2excel(ll_idpatcorr,ll_contactid,ll_phase)
	gf_pat2xml(il_patid)
	v_langue = ls_tmplangue
	li_FileNum = fileOpen("C:\ii4net\orthotek\filedel.bat", LineMode!, Write!, lockReadWrite!, replace!)
	fileWrite(li_FileNum, 'del /F ' + ls_corrpath + '\' + string(il_patid) + '\.*.doc~r~nexit')
	fileClose(li_FileNum)
	
	run("C:\ii4net\orthotek\filedel.bat",minimized!)
	
	sleep(2)
	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee( 'Correspondanceprescription', 1)
	openwithparm(w_dosspatcorrletters,s_corr,w_principal)

end if


end event

type tab_dosspat from tab within w_dossier_patients
event create ( )
event destroy ( )
event ue_insert ( )
integer width = 3634
integer height = 1956
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean multiline = true
boolean focusonbuttondown = true
boolean showpicture = false
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_dosspat tabpage_dosspat
tabpage_resp tabpage_resp
tabpage_contrat tabpage_contrat
tabpage_dentist tabpage_dentist
tabpage_ref tabpage_ref
tabpage_rdv tabpage_rdv
tabpage_histocorr tabpage_histocorr
tabpage_cartetrait tabpage_cartetrait
tabpage_age tabpage_age
tabpage_etat tabpage_etat
tabpage_rappre tabpage_rappre
tabpage_traitreq tabpage_traitreq
tabpage_rapcons tabpage_rapcons
tabpage_refa tabpage_refa
end type

on tab_dosspat.create
this.tabpage_dosspat=create tabpage_dosspat
this.tabpage_resp=create tabpage_resp
this.tabpage_contrat=create tabpage_contrat
this.tabpage_dentist=create tabpage_dentist
this.tabpage_ref=create tabpage_ref
this.tabpage_rdv=create tabpage_rdv
this.tabpage_histocorr=create tabpage_histocorr
this.tabpage_cartetrait=create tabpage_cartetrait
this.tabpage_age=create tabpage_age
this.tabpage_etat=create tabpage_etat
this.tabpage_rappre=create tabpage_rappre
this.tabpage_traitreq=create tabpage_traitreq
this.tabpage_rapcons=create tabpage_rapcons
this.tabpage_refa=create tabpage_refa
this.Control[]={this.tabpage_dosspat,&
this.tabpage_resp,&
this.tabpage_contrat,&
this.tabpage_dentist,&
this.tabpage_ref,&
this.tabpage_rdv,&
this.tabpage_histocorr,&
this.tabpage_cartetrait,&
this.tabpage_age,&
this.tabpage_etat,&
this.tabpage_rappre,&
this.tabpage_traitreq,&
this.tabpage_rapcons,&
this.tabpage_refa}
end on

on tab_dosspat.destroy
destroy(this.tabpage_dosspat)
destroy(this.tabpage_resp)
destroy(this.tabpage_contrat)
destroy(this.tabpage_dentist)
destroy(this.tabpage_ref)
destroy(this.tabpage_rdv)
destroy(this.tabpage_histocorr)
destroy(this.tabpage_cartetrait)
destroy(this.tabpage_age)
destroy(this.tabpage_etat)
destroy(this.tabpage_rappre)
destroy(this.tabpage_traitreq)
destroy(this.tabpage_rapcons)
destroy(this.tabpage_refa)
end on

event ue_insert();long ll_newrow

ll_newrow = tabpage_traitreq.dw_traitreq.insertrow(0)
tabpage_traitreq.dw_traitreq.scrolltorow(ll_newrow)
tabpage_traitreq.dw_traitreq.setitem(ll_newrow,'patient_id',il_patid)
change = true
sauve(ii_index)
tabpage_traitreq.dw_traitreq.Retrieve(il_patid)
end event

event selectionchanged; long row,ll_newrow,ll_iddent,ll_iddentist,ll_idref, ll_idcont, ll_row, ll_debarrerplan, ll_idcarteentete
date ldt_age, ldt_datebarre, ldt_datecree
integer li_resp = 1
string ls_drtitre,ls_drprenom,ls_drnom,ls_nom,ls_prenom,ls_adresse,ls_zip,ls_ville,ls_telres,ls_lien
string ls_newdoss, ls_cartememo

select patient_nom + ' ' + patient_prenom, new_dossier into :ls_nom, :ls_newdoss from patient where patient_id = :il_patid;
w_principal.SetMicroHelp(ls_nom + ' (' + ls_newdoss + ')')

choose case newindex
	case 1 // dossier du patient
		w_dossier_patients.cb_insert.enabled = true
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Blacklist'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Liste noire'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_new.enabled = true
		w_dossier_patients.cb_update.enabled = true
		tabpage_dosspat.dw_dosspat.retrieve(il_patid)
		w_dossier_patients.title = "Dossier patient"
	case 2 // responsable financier
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Delete'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Supprimer'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_new.enabled = true
		w_dossier_patients.cb_update.enabled = true
		tabpage_resp.dw_dosspatrespfin.retrieve(il_patid)
		if tabpage_resp.dw_dosspatrespfin.getRow() > 0 then
			if tabpage_resp.dw_dosspatrespfin.getItemString(tabpage_resp.dw_dosspatrespfin.getRow(),'province') <> 'USA' then
				tabpage_resp.dw_dosspatrespfin.modify("zip.EditMask.Mask = '!#! #!#'")
			else
				tabpage_resp.dw_dosspatrespfin.modify("zip.EditMask.Mask = ''")
			end if
		end if
		w_dossier_patients.title = "Responsable financier"
	case 3 // contrat
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Delete'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Supprimer'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_new.enabled = true
		w_dossier_patients.cb_update.enabled = true
		if tabpage_contrat.dw_contrat.GetChild('id_contact', dddw_idcontact) = -1 then
			error_type(0)
		end if
//		dddw_idcontact.SetTransObject(SQLCA)
//		dddw_idcontact.SetFilter("patient_id = " + string(il_patid))
		if tabpage_contrat.dw_contrat.Retrieve(w_dossier_patients.il_patid) = 0 then
			tabpage_contrat.dw_contrat.event ue_setcontrat()
		else
			dddw_idcontact.SetTransObject(SQLCA)
			dddw_idcontact.SetFilter("patient_id = " + string(il_patid))
			dddw_idcontact.Retrieve()
			// Recherche des informations deja existantes
			tabpage_contrat.dw_contrat.event ue_insertmontant(integer(tabpage_contrat.dw_contrat.getitemnumber(tabpage_contrat.dw_contrat.getrow(),'id_phase')))
		end if
		
	case 4 // dentiste
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Modify'
			w_dossier_patients.cb_new.text = 'Add'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Modifier'
			w_dossier_patients.cb_new.text = 'Ajouter'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = true
		select id_dentist into :ll_iddentist from patient where patient_id = :il_patid;
		tabpage_dentist.dw_dosspatdentresp.retrieve(ll_iddentist)
		w_dossier_patients.title = "Dentiste responsable"
		
	case 5 // Référent
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Modify'
			w_dossier_patients.cb_new.text = 'Add'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Modifier'
			w_dossier_patients.cb_new.text = 'Ajouter'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = true
		select referant_nom into :ll_idref from patient where patient_id = :w_dossier_patients.il_patid;
		tabpage_ref.dw_dosspatref.retrieve(ll_idref)
		w_dossier_patients.title = "Référent"
		
	case 6 // Rendez-vous
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = ''
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = ''
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = ''
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = ''
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = false
		w_dossier_patients.cb_update.enabled = false
		w_dossier_patients.cb_new.enabled = false
		tabpage_rdv.tab_rdv.tabpage_visits.dw_dosspatrdv.retrieve(il_patid)
		w_dossier_patients.title = "Historique des traitements"
		
	case 7 // Correspondance
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Add consult'
			w_dossier_patients.cb_update.text = 'Delete'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Import'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Ajouter cons'
			w_dossier_patients.cb_update.text = 'Supprimer'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Importer'
		end if
		w_dossier_patients.cb_img.text = 'Prescription'
		w_dossier_patients.cb_transfert.text = 'Capture'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = true
		if tabpage_histocorr.dw_histocorr.dataobject = 'd_dosspatcorrletter' then
			tabpage_histocorr.dw_histocorr.event ue_retrieve()
			tabpage_histocorr.dw_histocorr.setRedraw(false)
			tabpage_histocorr.dw_histocorr.setsort("datecreated D")
			tabpage_histocorr.dw_histocorr.sort()
			tabpage_histocorr.dw_histocorr.setRedraw(true)
		else
			tabpage_histocorr.dw_histocorr.Retrieve(il_patid)
		end if
		w_dossier_patients.title = "Correspondance"
		tabpage_histocorr.dw_histonote.event ue_retrieve()
		tabpage_histocorr.dw_courrieldosspat.event ue_retrieve()
		
	case 8 // carte trait
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Sequence'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Séquence RDV'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = true
		
		if tabpage_cartetrait.dw_carteentete.Retrieve(il_patid) = 0 then
			ll_row = tabpage_cartetrait.dw_carteentete.InsertRow(0)
			tabpage_cartetrait.dw_carteentete.setItem(ll_row,'t_carteentete_patient_id',il_patid)
			if tabpage_cartetrait.dw_carteentete.update() = 1 then
				commit using SQLCA;
				tabpage_cartetrait.dw_carteentete.Retrieve(il_patid)
			else
				rollback using SQLCA;
			end if
		else
			ldt_datecree = tabpage_cartetrait.dw_carteentete.getItemDate(tabpage_cartetrait.dw_carteentete.getRow(),'t_carteentete_datecree')
			if isnull(ldt_datecree) or ldt_datecree = 1900-01-01 then
				tabpage_cartetrait.dw_carteentete.setItem(tabpage_cartetrait.dw_carteentete.getRow(),"t_carteentete_datecree",today())
			end if
		end if
		
		// On regarde si l'on doit POPER la fenetre du memo
		
		ls_cartememo = tabpage_cartetrait.dw_carteentete.getItemString(tabpage_cartetrait.dw_carteentete.getRow(),'t_carteentete_memo1')
		ll_idcarteentete = tabpage_cartetrait.dw_carteentete.getItemNumber(tabpage_cartetrait.dw_carteentete.getRow(),'id_carteentete')
		if len(ls_cartememo) > 0 then
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("id_carteentete_memo", ll_idcarteentete)
			open(w_cartememo)
		end if
		
		tabpage_cartetrait.dw_cartetrait.Retrieve(il_patid)
		w_dossier_patients.title = "Carte de traitement"
		ldt_datebarre = this.tabpage_cartetrait.dw_carteentete.getItemDate(this.tabpage_cartetrait.dw_carteentete.getrow(),"t_carteentete_datecree")
		if isnull(il_admin_plant) then
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement.edit.displayonly = 'no'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement1.edit.displayonly = 'no'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement2.edit.displayonly = 'no'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement3.edit.displayonly = 'no'
//			this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement",160)
//			this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement1",170)
//			this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement2",180)
//			this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement3",190)
			this.tabpage_cartetrait.dw_carteentete.setitem( this.tabpage_cartetrait.dw_carteentete.getrow() ,"t_carteentete_locktraitement",0)
		else
			if daysafter(ldt_datebarre,today()) >= il_admin_plant then
				this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement.edit.displayonly = 'yes'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement1.edit.displayonly = 'yes'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement2.edit.displayonly = 'yes'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement3.edit.displayonly = 'yes'
	//			this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement",0)
//				this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement1",0)
//				this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement2",0)
//				this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement3",0)
				this.tabpage_cartetrait.dw_carteentete.setitem( this.tabpage_cartetrait.dw_carteentete.getrow() ,"t_carteentete_locktraitement",1)
			else
				this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement.edit.displayonly = 'no'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement1.edit.displayonly = 'no'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement2.edit.displayonly = 'no'
			this.tabpage_cartetrait.dw_carteentete.object.t_carteentete_traitement3.edit.displayonly = 'no'
	//			this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement",160)
//				this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement1",170)
//				this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement2",180)
//				this.tabpage_cartetrait.dw_carteentete.settaborder( "t_carteentete_traitement3",190)
				this.tabpage_cartetrait.dw_carteentete.setitem( this.tabpage_cartetrait.dw_carteentete.getrow() ,"t_carteentete_locktraitement",0)
			end if
		end if
		
		tabpage_cartetrait.dw_rdv.Retrieve(il_patid)
		// Regarder si l'on doit barrer les plans de traitement
		
		this.tabpage_cartetrait.dw_carteentete.setfocus()
		this.tabpage_cartetrait.dw_carteentete.setcolumn("t_carteentete_notes_importantes")
		
		// Regarder si l'on met le truc de rendez-vous
		
		if GetSystemMetrics(0) > 1024 then
			this.tabpage_cartetrait.dw_rdv.visible = true
		end if
		
	case 9 // age comptes
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = ''
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = ''
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = ''
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = ''
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = false
		w_dossier_patients.cb_update.enabled = false
		w_dossier_patients.cb_new.enabled = false
		if tabpage_age.dw_etatcompte.retrieve(il_patid) = 0 then
			tabpage_age.dw_etatcompte.visible = false
			tabpage_age.st_statement1.visible = true
		else
			tabpage_age.st_statement1.visible = false
		end if
		w_dossier_patients.title = "Âge des comptes"
		
	case 10 // Etat compte
		
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Delete'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Supprimer'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = true
		
		setnull(ll_idcont)
		tabpage_etat.ddlb_etat.event ue_filldate()
		tabpage_etat.ddlb_resp.event ue_respinfo()
		tab_dosspat.tabpage_etat.dw_etatcomptepat1.event ue_retrieve(0)
		
	case 11 // Rap pre
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Modify'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Modifier'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = true
		
		w_dossier_patients.tab_dosspat.tabpage_rappre.dw_rapppre.event ue_retrieve() 
	//	w_dossier_patients.tab_dosspat.tabpage_rappre.st_patnom1.event ue_title()
		
//		if v_langue = 'an' then
//			tabpage_rappre.dw_rapppre.object.t_title.text = "PRELIMINARY REPORT FOR : " + upper(is_spec)
//		else
//			tabpage_rappre.dw_rapppre.object.t_title.text = "RAPPORT PRÉLIMINAIRE POUR : " + upper(is_spec)
//		end if
		w_dossier_patients.title = "Rapport préliminaire"
		
	case 12 // trait req
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = 'Modify'
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Signature'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = 'Modifier'
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Signature'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = true
		
		w_dossier_patients.tab_dosspat.tabpage_traitreq.dw_traitreq.event ue_retrieve() 
//		w_dossier_patients.tab_dosspat.tabpage_traitreq.st_patnom.event ue_title()
//		if v_langue = 'an' then
//			tabpage_traitreq.dw_traitreq.object.t_title.text = "REQUIRED TREATMENT FOR : " + upper(is_spec)
//		else
//			tabpage_traitreq.dw_traitreq.object.t_title.text = "TRAITEMENT REQUIS POUR : " + upper(is_spec)
//		end if
//		w_dossier_patients.title = "Traitement requis"
		
	case 13 // rap cons
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Add'
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = 'Update'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Ajouter'
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = 'Sauvegarde'
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = true
		w_dossier_patients.cb_new.enabled = false
		
		w_dossier_patients.tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.event ue_retrieve() 
		w_dossier_patients.tab_dosspat.tabpage_rapcons.st_patnom2.event ue_title()
		w_dossier_patients.title = "Fiche de consultation"
		
	case 14 // ref a
		if v_langue = 'an' then
			w_dossier_patients.cb_insert.text = 'Modify'
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = ''
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Print'
		else
			w_dossier_patients.cb_insert.text = 'Modifier'
			w_dossier_patients.cb_new.text = ''
			w_dossier_patients.cb_update.text = ''
			w_dossier_patients.cb_transfert.text = 'Transfert'
			w_dossier_patients.cb_print.text = 'Imprimer'
		end if
		w_dossier_patients.cb_img.text = 'IMG'
		w_dossier_patients.cb_insert.enabled = true
		w_dossier_patients.cb_update.enabled = false
		w_dossier_patients.cb_new.enabled = false
		select id_ref into :ll_idref from patient where patient_id = :il_patid;
		tabpage_refa.dw_dosspatrefa.retrieve(ll_idref)
		w_dossier_patients.title = "Référé à"
end choose
end event

event selectionchanging;ii_index = newindex
sauve(oldindex)

end event

type tabpage_dosspat from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Dossier patient"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_dosspatresp dw_dosspatresp
dw_dosspat dw_dosspat
end type

on tabpage_dosspat.create
this.dw_dosspatresp=create dw_dosspatresp
this.dw_dosspat=create dw_dosspat
this.Control[]={this.dw_dosspatresp,&
this.dw_dosspat}
end on

on tabpage_dosspat.destroy
destroy(this.dw_dosspatresp)
destroy(this.dw_dosspat)
end on

type dw_dosspatresp from u_dw within tabpage_dosspat
integer y = 1440
integer width = 3598
integer height = 300
integer taborder = 30
string title = "dosspatresp"
string dataobject = "d_dosspatresp"
boolean resizable = true
boolean border = false
end type

event clicked;long ll_idcontact
integer li_resptopat
string ls_telres,ls_telbur,ls_telcell,ls_telautre

if row > 0 then
	ll_idcontact = getitemnumber(row,'id_contact')
	select resptopat into :li_resptopat from t_options where ortho_id = :v_no_ortho;
	if li_resptopat = 1 then
		ls_telres = getitemstring(row,'telres')
		ls_telbur = getitemstring(row,'telbur')
		ls_telcell = getitemstring(row,'telcell')
		ls_telautre = getitemstring(row,'telautre')
		dw_dosspat.setitem(dw_dosspat.getrow(),'tel_maison',ls_telres)
		dw_dosspat.setitem(dw_dosspat.getrow(),'tel_bureau',ls_telbur)
		dw_dosspat.setitem(dw_dosspat.getrow(),'telcell',ls_telcell)
		dw_dosspat.setitem(dw_dosspat.getrow(),'telautre',ls_telautre)
	end if
	dw_dosspat.setitem(dw_dosspat.getrow(),'id_contact',ll_idcontact)
	if dw_dosspat.update() = 1 then 
		commit using SQLCA;
	else
		rollback using SQLCA;
		error_type(50)
	end if
	dw_dosspatresp.Retrieve(il_patid)
end if
end event

event constructor;integer li_dosspatresp

select dosspatresp into :li_dosspatresp from t_options where ortho_id = :v_no_ortho;
if li_dosspatresp = 1 then visible = false
if v_langue = 'an' then
	this.object.t_resp.text = 'Responsible'
	this.object.t_telres.text = 'Tel.(Home)'
	this.object.t_telbur.text = 'Tel.(Office)'
	this.object.t_telcell.text = 'Tel.(Cell.)'
	this.object.t_telautre.text = 'Tel.(Other)'
	this.object.t_resptype.text = 'Link'
end if
SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
end event

type dw_dosspat from u_dw within tabpage_dosspat
event dossfin ( )
event uf_keypress pbm_dwnkey
event ue_insert ( )
event ue_update ( )
event ue_transfert ( long al_orthoid )
integer width = 3598
integer height = 1796
integer taborder = 30
string dataobject = "d_dosspat"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event dossfin();il_patid = this.getitemnumber(this.getrow(),'patient_id')
if il_patid > 0 and isnull(il_patid) = false then
	Opensheetwithparm(w_traitements,il_patid,w_principal,2,layered!)
	w_traitements.title = "Dossier financier"
else
	select first patient_id into :il_patid from patient order by patient_id desc;
	Opensheetwithparm(w_traitements,il_patid,w_principal,2,layered!)
	w_traitements.title = "Dossier financier"
end if
end event

event uf_keypress;//if key = keyEnter! then
//	keyTab!
//end if

end event

event ue_insert();long enr, ll_sat, ll_act, ll_patstatus, ll_boite, ll_nodossstart, ll_noboxstart
int li_noauto, li_newdosauto, li_opendossauto, li_dos2boite, li_nodoss2vistadent, li_virtuel
string test, ls_defville, ls_defprov, ls_deflangue, ls_noboite, ls_no, ls_nodoss

select opendossauto,defville,defprov,deflangue into :li_opendossauto,:ls_defville,:ls_defprov,:ls_deflangue from t_options where ortho_id = :v_no_ortho;

reset()
enr = InsertRow(0)
ScrollToRow(enr)
setitem(enr, "no_ortho", v_no_ortho)
setitem(enr, "recu_automatique",'0')
//verifie si le patient a des cheques postdates, voir rowfocus change ds w_patient
setitem(enr, "check_cpd",'0')
setitem(enr, "patient_nom",'')
setitem(enr, "patient_prenom",'')
setitem(enr, "new_dossier",'')
setitem(enr, "no_dossier",'')
setitem(enr, "retards",0)
setitem(enr, "rvmanques",0)
setitem(enr, "rvcancel",0)
setitem(enr, "caba",0)
setitem(enr, "ville",ls_defville)
setitem(enr, "province",ls_defprov)
setitem(enr, "langue",ls_deflangue)
setitem(enr, "recuresp",0)
setitem(enr, "typearchive",1)
modify("code_postale.EditMask.Mask = '!#! #!#'")
if not li_opendossauto = 1 or isnull(li_opendossauto) then
	setitem(enr, "opendoss",today())
end if
select id_satellite into :ll_sat from t_satellites where defo = 1 and ortho_id = :v_no_ortho;
if ll_sat > 0 then setitem(enr, "id_satellite",ll_sat)
select id_patstatus into :ll_patstatus from t_patstatus where defo = 1 and ortho_id = :v_no_ortho;
if ll_patstatus > 0 then setitem(enr, "id_patstatus",ll_patstatus)
select id_activite into :ll_act from t_activites where defo = 1 and ortho_id = :v_no_ortho;
if ll_act > 0 then setitem(enr, "id_activite",ll_act)
tab_dosspat.tabpage_dosspat.dw_dosspat.setfocus()
//increment nopatient ou nodossier
select nopatientauto into :li_noauto  from t_options where ortho_id = :v_no_ortho;
if li_noauto = 1 then
   setitem(enr, "no_dossier", incnopatient())
end if

select dossier_virtuel_defaut into :li_virtuel  from t_options where ortho_id = :v_no_ortho;
if li_virtuel = 1 then
   setitem(enr, "dossier_virtuel", 1)
ELSE
	setitem(enr, "dossier_virtuel", 0)
end if


select boiteauto,newdossierauto,nodossstart,noboxstart,nodos2noboite,nodoss2vistadent into :ll_boite,:li_newdosauto,:ll_nodossstart,:ll_noboxstart,:li_dos2boite,:li_nodoss2vistadent from t_options where ortho_id = :v_no_ortho;
if li_newdosauto = 1 then
	ls_no = NewNumDoss(ll_nodossstart)
	if len(ls_no) >= 1 then
		tab_dosspat.tabpage_dosspat.dw_dosspat.setitem(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"new_dossier",ls_no)
	end if
	// option nodos2noboite
	if li_dos2boite = 1 then
		setitem(1,'no_boite',ls_no)
	end if
	if li_nodoss2vistadent = 1 then
		setitem(1,'idvistadent',ls_no)
	end if
end if

Maj_liste = 1
vi_mode_ajout = 1
ii_modeajout = 1 //bug rowfocuschange
cb_insert.enabled = false
setnull(il_patid)
dw_dosspatresp.reset()
SetFocus()
setcolumn('patient_nom')
end event

event ue_update();long enr,patient_id, nb_row, i, row, presence, ll_valid, ll_row, ll_id, ll_idcontactdef, ll_nodoscommepatid
long ll_validnodoss, ll_validnewdoss, ll_validdosspat, ll_validdosstel,ll_idsal
integer li_resptopat,li_vistadent,li_count
string v_nom,v_prenom,no_dossier,dos,v_tel,ls_telautre,ls_telcell,ls_text1,ls_text2,ls_text5,ls_text6
string ls_patadd, ls_patcity, ls_patzip, ls_telbur, ls_prov, ls_email, ls_sex, ls_langue
date min
time lt_rdv

accepttext()
select validnodoss, validnewdoss, validdosspat, validdosstel, resptopat, nodoscommepatid
into :ll_validnodoss, :ll_validnewdoss, :ll_validdosspat, :ll_validdosstel, :li_resptopat, :ll_nodoscommepatid
from t_options where ortho_id = :v_no_ortho;

if not isnull(getItemString(getRow(),'new_dossier')) and getItemString(getRow(),'new_dossier') <> "" and ll_validnewdoss = 1 then
	if not validernewdos(getItemString(getRow(),'new_dossier')) then
		return
	end if
end if
if not isnull(getItemNumber(getRow(),'no_dossier')) and getItemNumber(getRow(),'no_dossier') <> 0 and ll_validnodoss = 1 then
	if not validernodos(getItemNumber(getRow(),'no_dossier')) then
		return
	end if
end if
if not isnull(getItemString(getRow(),'tel_maison')) and getItemString(getRow(),'tel_maison') <> "" and ll_validdosstel = 1 then
	if not validernotel(getItemString(getRow(),'tel_maison')) then
		return
	end if
end if
if ll_validdosspat = 1 then
	if not validernomprenom(v_no_ortho) then
		return
	end if
end if

ll_idsal = getitemnumber(getrow(),"id_sal")
v_nom = getitemstring(getrow(),"patient_nom")
v_prenom = getitemstring(getrow(),"patient_prenom")
v_tel = getitemstring(getrow(),"tel_maison")
ls_patadd = getitemstring(getrow(),"adresse")
ls_patcity = getitemstring(getrow(),"ville")
ls_patzip = getitemstring(getrow(),"code_postale")
ls_telbur = getitemstring(getrow(),"tel_bureau")
ls_prov = getitemstring(getrow(),"province")
ls_email = getitemstring(getrow(),"email")
ls_sex = getitemstring(getrow(),"sex")
ls_langue = getitemstring(getrow(),"langue")
ls_telcell = getitemstring(getrow(),"telcell")
ls_telautre = getitemstring(getrow(),"telautre")
ls_text1 = getitemstring(getrow(),"text1")
ls_text2 = getitemstring(getrow(),"text2")
ls_text5 = getitemstring(getrow(),"text5")
ls_text6 = getitemstring(getrow(),"text6")

if v_nom = '' or isnull(v_nom) then
	error_type(122)
	SetFocus()
elseif v_prenom = '' or isnull(v_prenom) then
	error_type(123)
	SetFocus()
else	
	
	if this.update() = 1 then 
		commit using SQLCA;
		
		//cle primaire
		il_patid = getitemnumber(getrow(),'patient_id')
		if not il_patid > 0 then
			select max(patient_id) into :il_patid from patient where no_ortho = :v_no_ortho;
		end if
		
		//Affecter new_dossier comme le patient_id
		select isnull(nodoscommepatid,0) into :ll_nodoscommepatid from t_options where ortho_id = :v_no_ortho;
		if ll_nodoscommepatid = 1 then
			update patient set new_dossier = :il_patid where patient_id = :il_patid;
			if error_type(-1) = 1 then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
		end if
		
		cb_insert.enabled = true
		//changement du nom ou du prenom
		if ii_chang_nom_prenom_tel = 1 then
			if vi_mode_ajout <> 1 then
				w_patient.dw_patient_master.deleterow(w_patient.dw_patient_master.getrow())
			end if
			w_patient.dw_patient_master.event ue_actualiser()
			ll_row = w_patient.dw_patient_master.find("patient_id = " + string(il_patid),1,w_patient.dw_patient_master.rowcount())
			w_patient.dw_patient_master.scrolltorow(ll_row)
			
			declare curRDVSync cursor for
			  select heure
				 from horaire
				where datecal = today()
				  and (patient_id_1 = :il_patid
						or patient_id_2 = :il_patid
						or patient_id_3 = :il_patid
						or patient_id_4 = :il_patid
						or patient_id_5 = :il_patid
						or patient_id_6 = :il_patid
						or patient_id_7 = :il_patid
						or patient_id_8 = :il_patid
						or patient_id_9 = :il_patid
						or patient_id_10 = :il_patid
						or patient_id_11 = :il_patid
						or patient_id_12 = :il_patid
						or patient_id_13 = :il_patid
						or patient_id_14 = :il_patid
						or patient_id_15 = :il_patid);
			
			open curRDVSync;
			
			fetch curRDVSync into :lt_rdv;
			
			do while SQLCA.SQLCode = 0
				insert into t_horlogrefresh (rdvdate, rdvheure, updateheure) values(today(), :lt_rdv, now());
				
				fetch curRDVSync into :lt_rdv;
			loop
			
			close curRDVSync;
			commit;
		end if
		w_patient.dw_details_patient.event retourner(il_patid)
		//ajouter au contact
		if vi_mode_ajout = 1 then
			//compatibilite avec vistadent
			if isnull(getitemString(getrow(),"idvistadent")) then
				select ortho2vistadent into :li_vistadent from t_options where ortho_id = :v_no_ortho;
				if li_vistadent = 1 then
					update patient set idvistadent = CAST(patient_id as VARCHAR(15)) where patient_id = :il_patid;
					commit using sqlca;
					error_type(-1)
				end if
			end if
			//ajouter au contact
			insert into t_contact(id_sal,ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,email,sex,langue,pat,telcell,telautre,resptype,telext1,telext,telext5,telext6)
			values(:ll_idsal,:v_no_ortho,:il_patid,:v_nom,:v_prenom,:ls_patadd,:ls_patcity,:ls_patzip,:v_tel,:ls_telbur,:ls_prov,:ls_email,:ls_sex,:ls_langue,1,:ls_telcell,:ls_telautre,'pat',:ls_text1,:ls_text2,:ls_text5,:ls_text6);
			select max(id_contact) into :ll_idcontactdef from t_contact where patient_id = :il_patid;
			update patient set id_contact = :ll_idcontactdef where patient_id = :il_patid;
			if error_type(-1) = 1 then
				commit using sqlca;
			else
				rollback using sqlca;
			end if
		else
			select count(*) into :li_count from t_contact where patient_id = :il_patid and pat = 1;
			if li_count = 0 then
				//ajouter au contact
				insert into t_contact(id_sal,ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,email,sex,langue,pat,telcell,telautre,resptype,telext1,telext,telext5,telext6)
				values(:ll_idsal,:v_no_ortho,:il_patid,:v_nom,:v_prenom,:ls_patadd,:ls_patcity,:ls_patzip,:v_tel,:ls_telbur,:ls_prov,:ls_email,:ls_sex,:ls_langue,1,:ls_telcell,:ls_telautre,'pat',:ls_text1,:ls_text2,:ls_text5,:ls_text6);
			else
				//modifier le contact
				update t_contact set id_sal = :ll_idsal, ortho_id = :v_no_ortho, nom = :v_nom, prenom = :v_prenom, adresse = :ls_patadd, 
				ville = :ls_patcity, zip = :ls_patzip, telres = :v_tel, telbur = :ls_telbur, province = :ls_prov, 
				email = :ls_email, sex = :ls_sex, langue = :ls_langue, telautre = :ls_telautre, telcell = :ls_telcell, resptype = 'pat',
				telext1 = :ls_text1, telext = :ls_text2, telext5 = :ls_text5, telext6 = :ls_text6
				where patient_id = :il_patid and pat = 1;
				if error_type(-1) = 1 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				tab_dosspat.tabpage_resp.dw_dosspatrespfin.event ue_setaddress(1)
			end if
			// verifier si la valeur par defo est valide sinon l'attribuer
			li_count = 0
			select count(*) into :li_count from t_contact where id_contact = (select id_contact from patient where patient_id = :il_patid);
			if li_count = 0 then
				// le patient devient le contact par defo
				update patient set id_contact = (select id_contact from t_contact where patient_id = :il_patid and pat = 1) where patient_id = :il_patid;
			end if
		end if
		// rafraichir la liste des contact
		tab_dosspat.tabpage_dosspat.dw_dosspatresp.Retrieve(il_patid)
		Retrieve(il_patid)
		vi_mode_ajout = 0
	else
		rollback using SQLCA;
		error_type(50)
	end if
end if
w_principal.SetMicroHelp('Dossier patient (' + string(il_patid) + ')')
rchange = false
uf_ortho2consultpro()
//uf_ortho2vistadent()
ii_modeajout = 0 //bug row focus change + controle la verification du folder vistadent
change = false
end event

event ue_transfert(long al_orthoid);long ll_test

////////////////////////////////////////
//
// Par			:	Eric Vezina ing.
// Date			:	03-02-2005
//	Description	:	Fonction qui permet de transferer un patient d'un specialiste a un autre.
//
////////////////////////////////////////
//
//integer li_recuresp
//long ll_checkcpd,ll_nodoss
//long ll_idcontact
//string ls_ville,ls_prov,ls_telmais,ls_sex,ls_zip,ls_telbur,ls_langue,ls_newdoss
//string ls_vistadent
//string ls_statut,ls_ass,ls_recuauto,ls_alertemed,ls_text1,ls_text2,ls_text3,ls_text4
//string ls_text5,ls_text6,ls_add,ls_nas,ls_email,ls_noboite,ls_patprenom,ls_patnom,ls_note
//string ls_nommere,ls_nompere,ls_notelmere,ls_notelpere,ls_telcell,ls_telautre,ls_numret
//date ldt_nais,ldt_opendoss,ldt_nasexp,ldt_archivedate
////
//select	ville,province,tel_maison,sex,code_postale,tel_bureau,langue,new_dossier,
//			statut,assurance,recu_automatique,alerte_medical,text1,text2,text3,text4,
//			text5,text6,adresse,nas,email,no_boite,patient_prenom,patient_nom,note,
//			nom_mere,nom_pere,no_tel_mere,no_tel_pere,telcell,telautre,numret,
//			recuresp,
//			date_naissance,opendoss,date_exp_nas,archivedate,
//			check_cpd,no_dossier,
//			id_contact,idvistadent
//
//into		:ls_ville,:ls_prov,:ls_telmais,:ls_sex,:ls_zip,:ls_telbur,:ls_langue,:ls_newdoss,
//			:ls_statut,:ls_ass,:ls_recuauto,:ls_alertemed,:ls_text1,:ls_text2,:ls_text3,:ls_text4,
//			:ls_text5,:ls_text6,:ls_add,:ls_nas,:ls_email,:ls_noboite,:ls_patprenom,:ls_patnom,:ls_note,
//			:ls_nommere,:ls_nompere,:ls_notelmere,:ls_notelpere,:ls_telcell,:ls_telautre,:ls_numret,
//			:li_recuresp,
//			:ldt_nais,:ldt_opendoss,:ldt_nasexp,:ldt_archivedate,
//			:ll_checkcpd,:ll_nodoss,
//			:ll_idcontact,:ls_vistadent
//from 		patient
//where		patient_id = :il_patid;
//				
//insert into patient(ville,province,tel_maison,sex,code_postale,tel_bureau,langue,new_dossier,
//				statut,assurance,recu_automatique,alerte_medical,text1,text2,text3,text4,
//				text5,text6,adresse,nas,email,no_boite,patient_prenom,patient_nom,note,
//				nom_mere,nom_pere,no_tel_mere,no_tel_pere,telcell,telautre,numret,
//				recuresp,retards,rvmanques,rvcancel,CABA,
//				date_naissance,opendoss,date_exp_nas,archivedate,
//				check_cpd,no_dossier,
//				id_contact,idvistadent,no_ortho)
//values 	  (:ls_ville,:ls_prov,:ls_telmais,:ls_sex,:ls_zip,:ls_telbur,:ls_langue,:ls_newdoss,
//				:ls_statut,:ls_ass,:ls_recuauto,:ls_alertemed,:ls_text1,:ls_text2,:ls_text3,:ls_text4,
//				:ls_text5,:ls_text6,:ls_add,:ls_nas,:ls_email,:ls_noboite,:ls_patprenom,:ls_patnom,:ls_note,
//				:ls_nommere,:ls_nompere,:ls_notelmere,:ls_notelpere,:ls_telcell,:ls_telautre,:ls_numret,
//				:li_recuresp,0,0,0,0,
//				:ldt_nais,:ldt_opendoss,:ldt_nasexp,:ldt_archivedate,
//				:ll_checkcpd,:ll_nodoss,
//				:ll_idcontact,:ls_vistadent,:al_orthoid);
				

long ll_patid				
				
insert into patient(patient_prenom,   
			patient_nom,   
			adresse,   
			ville,   
			province,   
			code_postale,   
			tel_maison,   
			date_naissance,   
			local,
			statut,
			addresp1,   
			cityresp1,   
			telresp1,   
			nomresp1,   
			sex,   
			tel_bureau,   
			langue,   
			no_tel_mere,   
			nom_mere, 
			no_boite,   
			code_recherche,   
			no_ortho,  
			no_dossier,   
			nom_pere,   
			no_tel_pere,   
			assurance,   
			recu_automatique,   
			collection,   
			alerte_medical,   
			medical,   
			recherche,   
			dernier_recu,   
			note,   
			text1,   
			text2,   
			zipresp1,   
			new_dossier,   
			nas,   
			date_exp_nas,
			text3,   
			text4,   
			corr,   
			email,
			retards,
			rvmanques,   
			recuresp,   
			nomresp2,   
			nomresp3,   
			addresp2,   
			addresp3,   
			cityresp2,   
			cityresp3,   
			telresp2,   
			telresp3,   
			zipresp2,   
			zipresp3,   
			opendoss,   
			notecompte,   
			telcell,   
			telautre,   
			text5,   
			text6,   
			numret,   
			rvcancel,
			caba) 
(select	patient_prenom,   
			patient_nom,   
			adresse,   
			ville,   
			province,   
			code_postale,   
			tel_maison,   
			date_naissance,   
			local,
			statut,
			addresp1,   
			cityresp1,   
			telresp1,   
			nomresp1,   
			sex,   
			tel_bureau,   
			langue,   
			no_tel_mere,   
			nom_mere, 
			no_boite,   
			code_recherche,   
			:al_orthoid,  
			no_dossier,   
			nom_pere,   
			no_tel_pere,
			assurance,   
			recu_automatique,   
			collection,   
			alerte_medical,   
			medical,   
			recherche,
			dernier_recu,
			note,   
			text1,   
			text2,   
			zipresp1,   
			new_dossier,   
			nas,   
			date_exp_nas,
			text3,   
			text4,   
			corr,   
			email,   
			retards,   
			rvmanques,   
			recuresp,   
			nomresp2,   
			nomresp3,   
			addresp2,   
			addresp3,   
			cityresp2,   
			cityresp3,   
			telresp2,   
			telresp3,   
			zipresp2,   
			zipresp3,   
			opendoss,   
			notecompte,   
			telcell,   
			telautre,   
			text5,   
			text6,   
			numret,   
			rvcancel,		
			caba
 from patient where patient_id = :il_patid);
error_type(-1)
select max(patient_id) into :ll_patid from patient;


// Contact

insert into t_contact(	nom,   
								prenom,   
								adresse,   
								zip,   
								telres,   
								telbur,   
								email,   
								telcell,   
								note,
								langue,   
								sex,   
								pat,
								telautre,   
								telext,   
								ortho_id,   
								patient_id,   
								date_naissance,   
								resptype,   
								id_contgroup,   
								id_conttype,   
								id_sal,   
								id_sal1,   
								telext1,   
								telext5,   
								telext6,   
								patadd,   
								id_conttype2,   
								id_conttype3,   
								id_conttype4,   
								id_conttype6,   
								id_conttype5,   
								payeur  )
   (SELECT	nom,   
         	prenom,   
         	adresse,   
         	zip,   
         	telres,   
         	telbur,   
         	email,   
         	telcell,   
         	note,
         	langue,   
         	sex,   
         	pat,
         	telautre,   
         	telext,   
         	:al_orthoid,   
         	:ll_patid,   
         	date_naissance,   
         	resptype,   
         	id_contgroup,   
         	id_conttype,   
         	id_sal,   
        		id_sal1,   
         	telext1,   
         	telext5,   
         	telext6,   
         	patadd,   
         	id_conttype2,   
         	id_conttype3,   
         	id_conttype4,   
         	id_conttype6,   
         	id_conttype5,   
         	payeur  
    FROM t_contact where patient_id = :il_patid);
select id_contact into :ll_test from t_contact where patient_id = :ll_patid and pat = 1 and ortho_id = :al_orthoid;
//messagebox('id_pat: '  + string(ll_patid),'id_contact: ' + string(ll_test))
update patient set id_contact = (select min(id_contact) from t_contact where patient_id = :ll_patid and pat = 1 and ortho_id = :al_orthoid) where patient_id = :ll_patid;

if error_type(-1) = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if
end event

event buttonclicked;integer li_dos2boite,li_newdossauto,li_nodoss2vistadent
long i,ll_boite,ll_noboxstart,ll_nodossstart, ll_taille
string ls_paiement, ls_noboite, ls_no, ls_nodoss, ls_maskboite

select boiteauto,newdossierauto,nodossstart,noboxstart,nodos2noboite,nodoss2vistadent, mask_boite into :ll_boite,:li_newdossauto,:ll_nodossstart,:ll_noboxstart,:li_dos2boite,:li_nodoss2vistadent, :ls_maskboite from t_options where ortho_id = :v_no_ortho;

choose case dwo.name
	case 'b_nodoss'
		if li_newdossauto = 1 then
			ls_no = NewNumDoss(ll_nodossstart)
			if len(ls_no) >= 1 then
				tab_dosspat.tabpage_dosspat.dw_dosspat.setitem(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"new_dossier",ls_no)
			end if
			// option nodos2noboite
			if li_dos2boite = 1 then
				setitem(1,'no_boite',ls_no)
			end if
			if li_nodoss2vistadent = 1 then
				setitem(1,'idvistadent',ls_no)
			end if
			change = true
		else
			error_type(147)
		end if
	case 'b_boite'
		if ll_boite = 1 then
			if ll_noboxstart > 0 then
				//ll_noboxstart = ll_noboxstart + 1
				ls_no = of_retourner_no_boite(ll_noboxstart)
				setitem(dw_dosspat.getrow(),"no_boite",ls_no)
			else
				ls_no = string(incnoboite())
				dw_dosspat.Setitem(dw_dosspat.getrow(),'no_boite',ls_no)
			end if
			// option nodos2noboite
			if li_dos2boite = 1 then
				setitem(1,'new_dossier',ls_no)
			end if
			change = true
		else
			error_type(147)
		end if
	case 'b_passref'
		if change then
			if error_type(200) = 1 then
				sauve(ii_index)
			end if
		end if
		if error_type(241) = 1 then
			uf_passasreferal(il_patid)
		end if
	case 'b_pnote'
		setRedraw(false)
		if object.b_pnote.text = '+' then
			this.SetPosition("note", "", true)
			ll_taille = long(object.note.y)
			object.note.y = object.t_salutation.y
			object.note.height = long(object.note.height) + ll_taille - long(object.note.y)
			object.b_pnote.text = '-'
			setColumn('note')
		else
			ll_taille = long(object.note.height)
			object.note.height = object.r_1.height
			object.note.y = long(object.note.y) + ll_taille - long(object.note.height)
			object.b_pnote.text = '+'
			setColumn('note')
		end if
		setRedraw(true)
	case 'b_torque'
		
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientidtorque",il_patid)
		opensheet(w_torque,w_principal,2,layered!)
		
end choose

end event

event clicked;string ls1,ls2
integer li_xray,li_return,ll_personid

choose case dwo.name
	case 't_salutation'
		OpenSheet(w_salutation,w_principal,2,layered!)
	case 'statut_t'
		OpenSheet(w_status,w_principal,2,layered!)
		w_status.title = "Statut"
	case 't_typetrait'
		opensheet(w_patstatus,w_principal,2,layered!)
		w_patstatus.title = 'Statut'
	case 't_satellite'
		OpenSheet(w_satellites,w_principal,2,layered!)
	case 't_activity'
		OpenSheet(w_activites,w_principal,2,layered!)
	case 't_dentist'
		opensheet(w_dentists,w_principal,2,layered!)
	case 't_ref'
		opensheet(w_referents,w_principal,2,layered!)
	case 't_refa'
		opensheet(w_referents,w_principal,2,layered!)
	case 't_phase'
		OpenSheet(w_typephase,w_principal,2,layered!)
	case 't_archive'
		if uo_calutil1.visible then
			uo_calutil1.visible = false
		else
			uo_calutil1.visible = true
		end if	
		change = true
	case 't_family'
		if change then
			if error_type(200) = 1 then
				sauve(ii_index)
			end if
		end if
		Openwithparm(w_membfamille,getitemnumber(row,'id_famille'))
	case 'p_vistadent'
		uf_ortho2vistadent()
	case 't_xray'
		gf_captureortho(il_patid)
//		select xray into :li_xray from t_options where ortho_id = :v_no_ortho;
//		choose case li_xray
//			case 1
//			case 2
//				uf_ortho2planmeca()
//			case 3
//				uf_ortho2capturelink()
//			case 4
//				uf_ortho2cadi()
//			case else
//				error_type(1001)
//		end choose
	case 'p_mdl3d'
		uf_ortho2mdl3d()
	case 't_dolphin'
		uf_ortho2dolphin()
	case 't_email'
		of_envoiemail()
	case 'p_biometrie'
		if picturename = "C:\ii4net\orthotek\images\bioPluginicoRed.bmp" then
			w_biometrie lw_biometrie
			open(lw_biometrie)
			lw_biometrie.of_setbioscan(il_patid, 'p')
		else
			li_return = MessageBox("Avertissement","Voulez-vous supprimer l'empreinte?",Information!,YesNo!)
			if li_return = 1 then
				SELECT PERSONID INTO :ll_personid FROM PERSON WHERE IDPATIENT = :il_patid;
				DELETE FROM FINGERPRINT WHERE PERSONID = :ll_personid;
				DELETE FROM PERSON WHERE PERSONID = :ll_personid;
				of_refreshbioplugin()
			end if
		end if
end choose
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

string ls_hormenuchoix1, ls_mdl3d
integer li_vistadent, li_dolphin, li_planmeca, li_lockrefdent

select hormenuchoix1, vistadentpic, dolphinpic, planmeca, prgmdl3d into :ls_hormenuchoix1, :li_vistadent, :li_dolphin, :li_planmeca, :ls_mdl3d from t_options where ortho_id = :v_no_ortho;
if li_vistadent = 1 then object.p_vistadent.visible = true
if li_dolphin = 1 then object.t_dolphin.visible = true
if li_planmeca = 1 then object.t_xray.visible = true
if ls_mdl3d <> 'A' then
	choose case ls_mdl3d
		case 'B'
			object.p_mdl3d.filename = 'C:\ii4net\orthotek\images\orthobyte.bmp'
		case 'L'
			object.p_mdl3d.filename = 'C:\ii4net\orthotek\images\LavaDigitalModels.bmp'
	end choose	
	object.p_mdl3d.visible = true
end if
if not len(ls_hormenuchoix1) > 0 then ls_hormenuchoix1 = 'CABA'
object.t_caba.text = ls_hormenuchoix1
if v_langue = 'an' then
	object.t_salutation.text = 'Greetings:'
	object.t_family.text = 'Family:'
	object.patient_nom_t.text = 'Name:'
	object.patient_prenom_t.text = 'First name:'
	object.adresse_t.text = 'Address:'
	object.ville_t.text = 'City:'
	object.code_postale_t.text = 'Postal code:'
	object.tel_maison_t.text = 'Phone (home):'
	object.tel_bureau_t.text = 'Phone (office):'
	object.t_datenaiss.text = 'Birth date:'
	object.sex_t.text = 'Gender:'
	object.langue_t.text = 'Language:'
	object.no_dossier_t.text = 'File number:'
	object.t_15.text = 'Nb of missed App:'
	object.t_14.text = 'Nb of late App:'
	object.t_cote.text = 'Quote:'
	object.b_boite.text = 'Box number'
//	object.recu_automatique_t.text = 'Automatic receipt:'
	object.statut_t.text = 'Last invoice:'
	object.alerte_medical_t.text = 'Medical alert:'
	object.t_8.text = 'Desactivate payments to come:'
	object.patient_id_t.text = 'Patient number:'
//	object.assurance_t.text = 'Insurance:'
	object.t_15.text = 'M Apt:'
	object.t_14.text = 'L Apt:'
	object.t_telcell.text = 'Cell phone:'
	object.t_telautre.text = 'Other:'
	object.t_nompere.text = 'Father:'
	object.t_telpere.text = 'Phone:'
	object.t_nommere.text = 'Mother:'
	object.t_telmere.text = 'Phone:'
	object.t_typetrait.text = 'File status:'
	object.t_opendoss.text = 'Open file:'
	object.t_activity.text = 'Activity:'
	object.t_pers.text = 'Employee'
	object.t_dentist.text = 'Dentist:'
	object.t_assmal.text = 'RAMQ:'
	object.t_expdate.text = 'Exp. date:'
	object.t_archive.text = 'Archive:'
	object.b_nodoss.text = 'File Number'
	object.t_nbcancel.text = 'C Apt:'
	object.t_aget.text = 'Age:'
	object.t_numret.text = 'Number of retention:'
	object.t_ref.text = 'Refered by:'
	object.t_refa.text = 'Refered to:'
	object.t_email.text = 'Email:'
	object.t_ordre.text = 'Calling order'
	object.t_dateradio.text = 'XRay date:'
	object.sex.values = 'Male~tM/Female~tF'
	object.t_nbcopie.text = "Copies"
	modify("assurance.checkbox.text = 'Insurance'")
	modify("recu_automatique.checkbox.text = 'Auto. Receipt'")
	object.dossier_virtuel.values = 'Paper~t0/Virtual~t1'
	object.province.values = 'Quebec~tQC/USA~tUSA/Ontario~tON/Manitoba~tMB/Saskatchewan~tSK/Alberta~tAB/British Columbia~tBC/Newfoundland and Labrador~tNF/New Brunswick~tNB/Nova Scotia~tNS/Price Edward Island~tPEI/Yukon~tYukon/North West Territories~tNT/Nunavut~tNU'
	tab_dosspat.tabpage_dosspat.dw_dosspatresp.object.resptype.values = 'Patient~tpat/Father~tp/Mother~tm/Father-in-law~tbp/Mother-in-law~tbm/Tutor~ttu/Grand father~tgp/Grand mother~tgm/Uncle~to/Aunt~tt/Other~ta'
	object.typearchive.values = 'Open~t1/Terminated~t2/Refused~t3'
else
	tab_dosspat.tabpage_dosspat.dw_dosspatresp.object.resptype.values = 'Patient~tpat/Père~tp/Mère~tm/Beau-Père~tbp/Belle-Mère~tbm/Tuteur~ttu/Grand-père~tgp/Grand-mère~tgm/Oncle~to/Tante~tt/Autre~ta'
	object.sex.values = 'Masculin~tM/Féminin~tF'
	object.assurance.values = 'Oui~toui/Non~tnon'
	object.recu_automatique.values = 'Oui~t1/Non~t0'
	object.province.values = 'Québec~tQC/USA~tUSA/Ontario~tON/Manitoba~tMB/Saskatchewan~tSK/Alberta~tAB/Colombie-Britannique~tBC/Terre-Neuve-et-Labrador~tNF/Nouveau-Brunswick~tNB/Nouvelle-Écosse~tNS/Île-du-Prince-Edouard~tPEI/Yukon~tYK/Territoires du Nord-Ouest~tNT/Nunavut~tNU'
end if

SetTransObject(SQLCA)
integer li_email,li_assmal

select delemail,delassmal, lockrefdent into :li_email, :li_assmal, :li_lockrefdent from t_options where ortho_id = :v_no_ortho;
//if li_email = 1 then
//	dw_dosspat.object.t_email.visible = false
//	dw_dosspat.object.email.visible = false
//end if
//if li_assmal = 1 then
	dw_dosspat.object.t_assmal.visible = false
	dw_dosspat.object.t_expdate.visible = false
	dw_dosspat.object.nas.visible = false
	dw_dosspat.object.date_exp_nas.visible = false
	dw_dosspat.object.t_refa.visible = true
	dw_dosspat.object.id_ref.visible = true
//else
//	dw_dosspat.object.t_refa.visible = false
//	dw_dosspat.object.id_ref.visible = false
//end if
if li_lockrefdent = 1 then
	setTabOrder('referant_nom',0)
	setTabOrder('id_dentist',0)
	setTabOrder('id_ref',0)
else
	setTabOrder('referant_nom',340)
	setTabOrder('id_dentist',350)
	setTabOrder('id_ref',360)
end if

//start statuts
if this.GetChild('statut', dddw_statut) = -1 then
	error_type(0)
end if
dddw_statut.SetTransObject(SQLCA)
dddw_statut.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_statut.retrieve()

if this.GetChild('id_patstatus', dddw_patstatus) = -1 then
	error_type(0)
end if
dddw_patstatus.SetTransObject(SQLCA)
dddw_patstatus.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_patstatus.retrieve()

if this.GetChild('id_satellite', dddw_sattelite) = -1 then
	error_type(0)
end if
dddw_sattelite.SetTransObject(SQLCA)
dddw_sattelite.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_sattelite.retrieve()

if this.GetChild('id_activite', dddw_activite) = -1 then
	error_type(0)
end if
dddw_activite.SetTransObject(SQLCA)
dddw_activite.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_activite.retrieve()

if this.GetChild('id_dentist', dddw_dentist) = -1 then
	error_type(0)
end if
dddw_dentist.SetTransObject(SQLCA)
dddw_dentist.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_dentist.retrieve()

if this.GetChild('id_sal', dddw_salutation) = -1 then
	error_type(0)
end if
dddw_salutation.SetTransObject(SQLCA)
dddw_salutation.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_salutation.retrieve()

// Référent 1

if this.getChild( 'referant_nom',dddw_ref) = -1 then
	error_type(0)
end if
dddw_ref.SetTransObject(SQLCA)
dddw_ref.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_ref.retrieve()

// Référent 2

if this.getChild( 'id_ref',dddw_ref2) = -1 then
	error_type(0)
end if
dddw_ref2.SetTransObject(SQLCA)
dddw_ref2.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_ref2.retrieve()

if this.GetChild('id_personnel', dddw_pers) = -1 then
	error_type(0)
end if
dddw_pers.SetTransObject(SQLCA)
dddw_pers.setfilter("actif = 1")
dddw_pers.retrieve()
//
//dddw_ref.object.refnom.expression = "if ( isnull ( ref_prenom ) , '' ,  ref_prenom ) + ' ' + if ( isnull ( ref_nom ) , '' ,  ref_nom )"
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

event editchanged;string ls_ColName,ls1
integer li_dos2boite,li_nodoss2vistadent

ls_ColName = GetColumnName()
CHOOSE CASE ls_ColName
	CASE 'new_dossier'
		select nodos2noboite,nodoss2vistadent into :li_dos2boite,:li_nodoss2vistadent from t_options where ortho_id = :v_no_ortho;
		if li_dos2boite = 1 then
			setitem(1,'no_boite',data)
		end if
		if li_nodoss2vistadent = 1 then
			setitem(1,'idvistadent',data)
		end if
		chang_dossier = 1
	CASE 'no_boite'
		select nodos2noboite into :li_dos2boite from t_options where ortho_id = :v_no_ortho;
		if li_dos2boite = 1 then
			setitem(1,'new_dossier',data)
		end if
		chang_dossier = 1
	CASE 'patient_nom'
		ii_chang_nom_prenom_tel = 1
	CASE 'patient_prenom'
		ii_chang_nom_prenom_tel = 1
	CASE 'tel_maison'
		ii_chang_nom_prenom_tel = 1
	CASE 'date_naissance'
		is_naiss = 1
END CHOOSE

cb_update.enabled = true
change = true
end event

event getfocus;if getcolumnname() = 'date_naissance' then
	this.object.t_age.text = calculage(this.getitemdate(this.getrow(),'date_naissance'))
end if


end event

event itemchanged;if dwo.name = 'province' then
	if data = 'USA' then
		dw_dosspat.modify("code_postale.EditMask.Mask = ''")
	else
		dw_dosspat.modify("code_postale.EditMask.Mask = '!#! #!#'")
	end if
end if

if dwo.name = 'assurance' then setITem(row,'nbcopieform',1)

if row > 0 then

	if dwo.name = 'email' then setitem(row,'emailvalid',0) 
	if dwo.name = 'email2' then setitem(row,'emailvalid2',0) 
	if dwo.name = 'email3' then setitem(row,'emailvalid3',0)
	
end if

cb_update.enabled = true
change = true
end event

event itemfocuschanged;if this.getcolumnname() <> 'date_naissance' and is_naiss = 1 then
	this.object.t_age.text = calculage(getitemdate(row,'date_naissance'))
	is_naiss = 0
end if
end event

event updateend;long ll_row
integer test

if rowsinserted <> 0 then
	ll_row = this.getrow()
	select max(patient_id) into :il_patid from patient;
	if isnull(il_patid) then il_patid = 1
	this.setitem(ll_row,'patient_id',il_patid)
	if ii_modeajout = 1 then
	  test = this.setitemstatus(ll_row,'patient_id',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'ville',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'province',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'code_postale',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'tel_maison',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'date_naissance',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'sex',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'tel_bureau',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'langue',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'no_dossier',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'statut',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'assurance',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'recu_automatique',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'alerte_medical',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'text1',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'text2',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'text3',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'text4',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'adresse',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'patient_id',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'date_exp_nas',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'nas',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'check_cpd',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'no_ortho',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'email',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'retards',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'rvmanques',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'new_dossier',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'no_boite',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'patient_prenom',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'patient_nom',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'note',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'recuresp',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'id_personnel',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'id_patstatus',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'id_satellite',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'id_activite',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'id_dentist',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'opendoss',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'nom_mere',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'nom_pere',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'no_tel_mere',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'no_tel_pere',primary!,notmodified!)
	end if
end if
end event

type tabpage_resp from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Responsable(s)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_dosspatrespfin dw_dosspatrespfin
end type

on tabpage_resp.create
this.dw_dosspatrespfin=create dw_dosspatrespfin
this.Control[]={this.dw_dosspatrespfin}
end on

on tabpage_resp.destroy
destroy(this.dw_dosspatrespfin)
end on

type dw_dosspatrespfin from u_dw within tabpage_resp
event ue_update ( )
event ue_setaddress ( integer ai_type )
integer width = 3607
integer height = 1740
integer taborder = 40
string title = "dosspatrespfin"
string dataobject = "d_dosspatrespfin"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();accepttext()
if this.update() = 1 then
	commit using SQLCA;
	uf_addlieninpatientfile()
	event ue_setaddress(2)
	Retrieve(il_patid)
	dddw_idcontact.setfilter("patient_id = " + string(il_patid))
	tab_dosspat.tabpage_dosspat.dw_dosspatresp.Retrieve(il_patid)
else
	rollback using SQLCA;
	error_type(50)
end if
change = false
end event

event ue_setaddress(integer ai_type);string ls_add,ls_ville,ls_prov,ls_zip, ls_telres, ls_telbur, ls_telautre, ls_telcell

if ai_type = 1 then
	
	select adresse,ville,province,zip,telres,telbur,telcell,telautre
	into :ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_telres,:ls_telbur,:ls_telcell,:ls_telautre
	from t_contact where patient_id = :il_patid and pat = 1;
	
	update t_contact set adresse = :ls_add, 
							ville = :ls_ville, 
							province = :ls_prov, 
							zip = :ls_zip,
							telres = :ls_telres
						
	where patient_id = :il_patid and patadd = 1;
	if error_type(-1) = 1 then 
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if

else
	
	if getITemNumber(getrow(),'patadd') = 1 then
	
		ls_add = getItemString(getrow(),'adresse')
		ls_ville = getItemString(getrow(),'ville')
		ls_prov = getItemString(getrow(),'province')
		ls_zip = getItemString(getrow(),'zip')
		ls_telres = getItemString(getrow(),'telres')
	//	ls_telbur = getItemString(getrow(),'telbur')
	//	ls_telcell = getItemString(getrow(),'telcell')
	//	ls_telautre = getItemString(getrow(),'telautre')
		
		update t_contact set adresse = :ls_add, 
								ville = :ls_ville, 
								province = :ls_prov, 
								zip = :ls_zip,
								telres = :ls_telres
		where patient_id = :il_patid and patadd = 1;
		if error_type(-1) = 1 then 
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
		
		update patient set adresse = :ls_add,
								 ville = :ls_ville,
								 province = :ls_prov,
								 code_postale = :ls_zip,
								 tel_maison = :ls_telres
		where patient_id = :il_patid;
		if error_type(-1) = 1 then 
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if

	end if

end if

end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	object.t_sal1.text = 'Greetings1:'
	object.t_sal2.text = 'Greetings2:'
	object.t_title.text = 'Financial responsible and other'
	object.t_nom.text = 'Last name:'
	object.t_prenom.text = 'First name:'
	object.t_adresse.text = 'Address:'
	object.t_ville.text = 'City:'
	object.t_province.text = 'Province:'
	object.t_zip.text = 'Postal code:'
	object.t_telmai.text = 'Home phone:'
	object.t_telbur.text = 'Office phone:'
	object.t_telcell.text = 'Cell. phone:'
	object.t_telother.text = 'Other phone:'
	object.t_lien.text = 'Link:'
	object.t_group.text = 'Group:'
	object.b_respfinance.text = 'Financial'
	object.b_ententefinsplit.text = 'Financial agreement'
	object.b_respfinetiq.text = 'Label'
	object.b_enveloppe.text = 'Envelope'
	object.resptype.values = 'Patient~tpat/Father~tp/Mother~tm/Father-in-law~tbp/Mother-in-law~tbm/Tutor~ttu/Grand father~tgp/Grand mother~tgm/Uncle~to/Aunt~tt/Other~ta'
	object.province.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/British Columbia~tBritish Colombia/NewFoundland~tNewFoundland/New Brunswick~tNew Brunswick/Nova Scotia~tNova Scotia/Price Edward island~tPrice Edward island/Yukon~tYukon/North West Territory~tNorthwest Territories'
else
	object.resptype.values = 'Patient~tpat/Père~tp/Mère~tm/Beau-Père~tbp/Belle-Mère~tbm/Tuteur~ttu/Grand-père~tgp/Grand-mère~tgm/Oncle~to/Tante~tt/Autre~ta'
	object.province.values = 'Québec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/Colombie-Britanique~tColombie Britanique/Terre-Neuve~tTerre Neuve/Nouveau-Brunswick~tNouveau Brunswick/Nouvelle-Écosse~tNouvelle Écosse/Île-du-Prince-Edward~tÎle-du-Price-Edward/Yukon~tYukon/Territoires du Nord-Ouest~tTerritoires du Nord-Ouest/Nunavut~tNunavut'
end if
SetTransObject(SQLCA)
end event

event buttonclicked;string ls_logo

choose case dwo.name
	case 'b_respfinance'
		long i,ll_idcontact
		string ls_paiement
		ll_idcontact = getitemnumber(row,'id_contact')
		dataobject = 'd_dosspatrespfinfinance'
		SetTransObject (SQLCA)
		retrieve(ll_idcontact)
		for i = 1 to rowcount()
			if gf_invoice_or_payment(getitemstring(i,'paiement')) = 'p' then
				ls_paiement = getitemstring(i,'paiement')
				if v_langue = 'an' then
					setitem(i,'paiement','Payment - ' + gf_method1(v_langue,ls_paiement))
				else
					setitem(i,'paiement','Paiement - ' + gf_method1(v_langue,ls_paiement))
				end if
			elseif gf_invoice_or_payment(getitemstring(i,'paiement')) = 'i' then
				ls_paiement = getitemstring(i,'paiement')
				if v_langue = 'an' then
					setitem(i,'paiement','Invoice - ' + gf_method1(v_langue,ls_paiement))
				else
					setitem(i,'paiement','Facture - ' + gf_method1(v_langue,ls_paiement))
				end if
			end if
		next
		w_dossier_patients.title = "Finance"
	case 'b_ententefinsplit'
		opensheet(w_ententeedit,w_principal,2,layered!)
		w_ententeedit.title = "Entente financière"
		w_ententeedit.il_patid = getitemnumber(getrow(),'id_contact')
		w_ententeedit.il_idphase = getitemnumber(getrow(),'id_phase')
		w_ententeedit.st_title.event ue_title()
	case 'b_respfinetiq'
		
		gi_imp = 2
		
		datastore ds_etiqresp
		ds_etiqresp = create datastore
		ds_etiqresp.dataobject = "d_etiquettesresp"
		ds_etiqresp.SetTransObject(SQLCA)
		ds_etiqresp.retrieve(getitemnumber(row,'id_contact'))
		
		if ds_etiqresp.getItemString(ds_etiqresp.getRow(),'province') <> 'USA' then
			ds_etiqresp.modify("zip.EditMask.Mask = '!#! #!#'")
		else
			ds_etiqresp.modify("zip.EditMask.Mask = ''")
		end if
		gb_datawindow = false
		openwithparm(w_print_options,ds_etiqresp)
		destroy ds_etiqresp
	case "b_enveloppe"
		
		datastore ds_envresp
		ds_envresp = create datastore
		ds_envresp.dataobject = "d_enveloppe_responsable"
		ds_envresp.SetTransObject(SQLCA)
		ds_envresp.retrieve(getitemnumber(row,'id_contact'))
		
		if ds_envresp.getItemString(ds_envresp.getRow(),'province') <> 'USA' then
			ds_envresp.modify("zip.EditMask.Mask = '!#! #!#'")
		else
			ds_envresp.modify("zip.EditMask.Mask = ''")
		end if
		
		//Récupérer le logo
		select chemin_logo
		into :ls_logo
		from t_options
		where ortho_id = :v_no_ortho;	
		
		IF Isnull(ls_logo) = false AND ls_logo <> "" THEN
			ds_envresp.object.p_logo.filename = ls_logo
		END IF
		
		gb_datawindow = false
		openwithparm(w_print_options,ds_envresp)
		destroy ds_envresp
		
end choose
end event

event itemchanged;if getItemString(getRow(),'province') <> 'USA' then
	modify("zip.EditMask.Mask = '!#! #!#'")
else
	modify("zip.EditMask.Mask = ''")
end if
change = true
end event

event rowfocuschanged;long row
integer li_pat

li_pat = getitemnumber(currentrow,'pat')
if li_pat = 1 then
	modify("id_sal.TabSequence = 0")
	modify("id_sal1.TabSequence = 0")
	modify("nom.TabSequence = 0")
	modify("prenom.TabSequence = 0")
	modify("adresse.TabSequence = 0")
	modify("ville.TabSequence = 0")
	modify("province.TabSequence = 0")
	modify("zip.TabSequence = 0")
	modify("telres.TabSequence = 0")
	modify("telbur.TabSequence = 0")
	modify("telcell.TabSequence = 0")
	modify("telautre.TabSequence = 0")
	modify("telext.TabSequence = 0")
	modify("id_contgroup.TabSequence = 0")
	modify("telext1.TabSequence = 0")
	modify("telext5.TabSequence = 0")
	modify("telext6.TabSequence = 0")
	modify("resptype.TabSequence = 0")
	modify("patadd.TabSequence = 0")
	if v_langue = 'an' then
		object.resptype.values = 'Patient~tpat/Father~tp/Mother~tm/Father-in-law~tbp/Mother-in-law~tbm/Tutor~ttu/Grand father~tgp/Grand mother~tgm/Uncle~to/Aunt~tt/Other~ta'
	else
		object.resptype.values = 'Patient~tpat/Père~tp/Mère~tm/Beau-Père~tbp/Belle-Mère~tbm/Tuteur~ttu/Grand-père~tgp/Grand-mère~tgm/Oncle~to/Tante~tt/Autre~ta'
	end if
else
	modify("id_sal.TabSequence = 10")
	modify("id_sal1.TabSequence = 40")
	modify("nom.TabSequence = 20")
	modify("prenom.TabSequence = 30")
	modify("adresse.TabSequence = 50")
	modify("ville.TabSequence = 60")
	modify("province.TabSequence = 70")
	modify("zip.TabSequence = 80")
	modify("telres.TabSequence = 100")
	modify("telbur.TabSequence = 120")
	modify("telcell.TabSequence = 140")
	modify("telautre.TabSequence = 160")
	modify("telext.TabSequence = 130")
	modify("id_contgroup.TabSequence = 180")
	modify("telext1.TabSequence = 110")
	modify("telext5.TabSequence = 150")
	modify("telext6.TabSequence = 170")
	modify("resptype.TabSequence = 90")
	modify("patadd.TabSequence = 190")
	if v_langue = 'an' then
		object.resptype.values = 'Father~tp/Mother~tm/Father-in-law~tbp/Mother-in-law~tbm/Tutor~ttu/Grand father~tgp/Grand mother~tgm/Uncle~to/Aunt~tt/Other~ta'
	else
		object.resptype.values = 'Père~tp/Mère~tm/Beau-Père~tbp/Belle-Mère~tbm/Tuteur~ttu/Grand-père~tgp/Grand-mère~tgm/Oncle~to/Tante~tt/Autre~ta'
	end if
end if
end event

event editchanged;change = true
end event

event clicked;//long row
integer li_pat

li_pat = getitemnumber(row,'pat')

if li_pat = 1 then
	modify("id_sal.TabSequence = 0")
	modify("id_sal1.TabSequence = 0")
	modify("nom.TabSequence = 0")
	modify("prenom.TabSequence = 0")
	modify("adresse.TabSequence = 0")
	modify("ville.TabSequence = 0")
	modify("province.TabSequence = 0")
	modify("zip.TabSequence = 0")
	modify("telres.TabSequence = 0")
	modify("telbur.TabSequence = 0")
	modify("telcell.TabSequence = 0")
	modify("telautre.TabSequence = 0")
	modify("telext.TabSequence = 0")
	modify("id_contgroup.TabSequence = 0")
	modify("telext1.TabSequence = 0")
	modify("telext5.TabSequence = 0")
	modify("telext6.TabSequence = 0")
	modify("resptype.TabSequence = 0")
	modify("patadd.TabSequence = 0")
	if v_langue = 'an' then
		object.resptype.values = 'Patient~tpat/Father~tp/Mother~tm/Father-in-law~tbp/Mother-in-law~tbm/Tutor~ttu/Grand father~tgp/Grand mother~tgm/Uncle~to/Aunt~tt/Other~ta'
	else
		object.resptype.values = 'Patient~tpat/Père~tp/Mère~tm/Beau-Père~tbp/Belle-Mère~tbm/Tuteur~ttu/Grand-père~tgp/Grand-mère~tgm/Oncle~to/Tante~tt/Autre~ta'
	end if
else
	modify("id_sal.TabSequence = 10")
	modify("id_sal1.TabSequence = 40")
	modify("nom.TabSequence = 20")
	modify("prenom.TabSequence = 30")
	modify("adresse.TabSequence = 50")
	modify("ville.TabSequence = 60")
	modify("province.TabSequence = 70")
	modify("zip.TabSequence = 80")
	modify("telres.TabSequence = 100")
	modify("telbur.TabSequence = 120")
	modify("telcell.TabSequence = 140")
	modify("telautre.TabSequence = 160")
	modify("telext.TabSequence = 130")
	modify("id_contgroup.TabSequence = 180")
	modify("telext1.TabSequence = 110")
	modify("telext5.TabSequence = 150")
	modify("telext6.TabSequence = 170")
	modify("resptype.TabSequence = 90")
	modify("patadd.TabSequence = 190")
	if v_langue = 'an' then
		object.resptype.values = 'Father~tp/Mother~tm/Father-in-law~tbp/Mother-in-law~tbm/Tutor~ttu/Grand father~tgp/Grand mother~tgm/Uncle~to/Aunt~tt/Other~ta'
	else
		object.resptype.values = 'Père~tp/Mère~tm/Beau-Père~tbp/Belle-Mère~tbm/Tuteur~ttu/Grand-père~tgp/Grand-mère~tgm/Oncle~to/Tante~tt/Autre~ta'
	end if
end if

choose case dwo.name
	case 't_institution'
		open(w_infos_cheque)
	case 't_nosuccursale'
		open(w_infos_cheque)
	case 't_nocompte'
		open(w_infos_cheque)
end choose
end event

type tabpage_contrat from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Contrat"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_contrat dw_contrat
end type

on tabpage_contrat.create
this.dw_contrat=create dw_contrat
this.Control[]={this.dw_contrat}
end on

on tabpage_contrat.destroy
destroy(this.dw_contrat)
end on

type dw_contrat from u_dw within tabpage_contrat
event ue_setcontrat ( )
event ue_update ( )
event ue_insertmontant ( integer ai_idphase )
integer width = 3607
integer height = 1744
integer taborder = 40
string title = "contrat"
string dataobject = "d_contrat"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_setcontrat();//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 07/08/2004
// Demande  : Dr. Sidney Konigsberg
// Version  : 7.8.4
// 
//	Cette événement ajoute un nouveau contrat tout en concervant
// les informations du contrat précédant si ce dernier diffère
// de 100%.
// 
//////////////////////////////////
long ll_rowcount,ll_newrow,ll_idcontact,ll_idphase
integer li_mqty
decimal ld_couttrait,ld_init,ld_diag,ld_meb,ld_ret,ld_mmontant,ld_paiefin
decimal ld_pourc
string ls_period
date ldt_trait, ldt_initial, ldt_diag, ldt_meb

// verification du contrat precedant si complet ou incomplet
ll_rowcount = rowcount()
if ll_rowcount > 0 then
	// avec contrat incomplet
	if getitemnumber(ll_rowcount,'pourcentage') < 100 then
		ld_pourc = getitemnumber(ll_rowcount,'pourcentage')
		ld_couttrait = getitemnumber(ll_rowcount,'couttrait')
		ldt_trait = getitemdate(ll_rowcount,'date1')
		ldt_initial = getitemdate(ll_rowcount,'mdate1')
		ldt_diag = getitemdate(ll_rowcount,'datediag')
		ldt_meb = getitemdate(ll_rowcount,'datemeb')
		ld_init = getitemnumber(ll_rowcount,'initial')
		ld_diag = getitemnumber(ll_rowcount,'diag')
		ld_ret = getitemnumber(ll_rowcount,'retfee')
		ld_meb = getitemnumber(ll_rowcount,'meb')
		li_mqty = getitemnumber(ll_rowcount,'mqty')
		ld_mmontant = getitemnumber(ll_rowcount,'mmontant')
		ld_paiefin = getitemnumber(ll_rowcount,'paiefinal')
		ll_idphase = getitemnumber(ll_rowcount,'id_phase')
		ls_period = getitemstring(ll_rowcount,'periode')
		
		// Ajustement des montants si contract

		setitem(ll_rowcount,'couttrait',ld_couttrait * ld_pourc / 100.0)
		setitem(ll_rowcount,'initial',ld_init * ld_pourc / 100.0)
		setitem(ll_rowcount,'diag',ld_diag * ld_pourc / 100.0)
		setitem(ll_rowcount,'retfee',ld_ret * ld_pourc / 100.0)
		setitem(ll_rowcount,'meb',ld_meb * ld_pourc / 100.0)
		setitem(ll_rowcount,'mmontant',ld_mmontant * ld_pourc / 100.0)
		setitem(ll_rowcount,'paiefinal',ld_paiefin * ld_pourc / 100.0)

		ld_pourc = 100 - ld_pourc
		
		ld_couttrait = ld_couttrait * ld_pourc / 100.0
		ld_init = ld_init * ld_pourc / 100.0
		ld_diag = ld_diag * ld_pourc / 100.0
		ld_ret = ld_ret * ld_pourc / 100.0
		ld_meb = ld_meb * ld_pourc / 100.0
		ld_mmontant = ld_mmontant * ld_pourc / 100.0
		ld_paiefin = ld_paiefin * ld_pourc / 100.0

	else
		// avec contrat complet
		ld_pourc = 100
		ld_couttrait = 0
		ldt_trait = today()
		ldt_initial = today()
		ldt_diag = today()
		ldt_meb = today()
		ld_init = 0
		ld_diag = 0
		ld_ret = 0
		ld_meb = 0
		li_mqty = 0
		ld_mmontant = 0
		ld_paiefin = 0
		SetNull(ll_idphase)
		ls_period = 'm'
	end if
else
	// sans contrat
	ld_pourc = 100
	ld_couttrait = 0
	ldt_trait = today()
	ldt_initial = today()
	ldt_diag = today()
	ldt_meb = today()
	ld_init = 0
	ld_diag = 0
	ld_ret = 0
	ld_meb = 0
	li_mqty = 0
	ld_mmontant = 0
	ld_paiefin = 0
	select min(id_phase) into :ll_idphase from t_phase where ortho_id = :v_no_ortho;
	ls_period = 'm'
end if

// completer les variables manquantes
select id_contact into :ll_idcontact from t_contact where patient_id = :il_patid and pat = 1;

// creation du nouveau contrat
ll_newrow = insertrow(0)
setitem(ll_newrow,'id_phase',ll_idphase)
setitem(ll_newrow,'patient_id',il_patid)
setitem(ll_newrow,'id_contact',ll_idcontact)
setitem(ll_newrow,'pourcentage',ld_pourc)
setitem(ll_newrow,'periode',ls_period)
setitem(ll_newrow,'date1',ldt_trait)
setitem(ll_newrow,'couttrait',ld_couttrait)
setitem(ll_newrow,'cons',0)
setitem(ll_newrow,'cons2',0)
setitem(ll_newrow,'diag',ld_diag)
setitem(ll_newrow,'datediag',ldt_diag)
setitem(ll_newrow,'meb',ld_meb)
setitem(ll_newrow,'datemeb',ldt_meb)
setitem(ll_newrow,'retfee',ld_ret)
setitem(ll_newrow,'initial',ld_init)
setitem(ll_newrow,'mqty',li_mqty)
setitem(ll_newrow,'mdate1',ldt_initial)
setitem(ll_newrow,'mmontant',ld_mmontant)
setitem(ll_newrow,'paiefinal',ld_paiefin)
setitem(ll_newrow,'inuse',0)
dddw_idcontact.SetTransObject(SQLCA)
dddw_idcontact.SetFilter("patient_id = " + string(il_patid))
dddw_idcontact.Retrieve()
scrolltorow(ll_newrow)

event ue_insertmontant(integer(ll_idphase))
end event

event ue_update();accepttext()
if this.update() = 1 then 
	commit using SQLCA;
else
	rollback;
	error_type(50)
end if
change = false
end event

event ue_insertmontant(integer ai_idphase);long ll_traitid,ll_statusid
integer row
dec{2} ld_montant

// Recherche des informations deja existantes
row = dw_contrat.getrow()

select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and id_phase = :ai_idphase;
if ll_traitid > 0 then
	// consultation
	ld_montant = 0
	SetNull(ll_statusid)
	select montant into :ld_montant 
	from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id
	where factures_traitements.traitement_id = :ll_traitid and
			t_status.ordrepaie = 1;
	if ld_montant <> 0 then
		setitem(row,'cons',ld_montant)
	end if
	// consultation
	ld_montant = 0
	SetNull(ll_statusid)
	select montant into :ld_montant 
	from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id
	where factures_traitements.traitement_id = :ll_traitid and
			t_status.ordrepaie = 8;
	if ld_montant <> 0 then
		setitem(row,'cons2',ld_montant)
	end if
	// diagnostic
	ld_montant = 0
	SetNull(ll_statusid)
	select montant into :ld_montant 
	from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id
	where factures_traitements.traitement_id = :ll_traitid and
			t_status.ordrepaie = 2;
	if ld_montant <> 0 then
		setitem(row,'diag',ld_montant)
	end if
	// meb
	ld_montant = 0
	SetNull(ll_statusid)
	select montant into :ld_montant 
	from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id
	where factures_traitements.traitement_id = :ll_traitid and
			t_status.ordrepaie = 3;
	if ld_montant <> 0 then
		setitem(row,'meb',ld_montant)
	end if
end if
end event

event constructor;//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 24/10/2003
// Demande  : JMD
// Version  : 7.6.1
// Modifié par:
//	Modifié le :
//////////////////////////////////

//pro_resize luo_size
//luo_size.uf_resizedw(this)

string ls_rec, ls_bond, ls_retainer, ls_init

select isnull(recordtext,''), isnull(bondtext,''), isnull(retainertext,''), isnull(inittext,'') 
into :ls_rec, :ls_bond, :ls_retainer, :ls_init 
from t_options 
where ortho_id = :v_no_ortho;

if v_langue = 'fr' then
	modify("t_contact.text = 'Responsable:'")
	modify("t_trait.text = 'Traitement:'")
	modify("gb_contract.text = 'Détails du contrat'")
	modify("t_billdate.text = 'Début traitement:'")
	modify("t_couttrait.text = 'Coût traitement:'")
	modify("t_cons.text = 'Consultation:'")
	if ls_rec = '' then
		modify("t_diag.text = 'Diagnostic:'")
	else
		modify("t_diag.text = '" + ls_rec + ":'")
	end if
	if ls_bond = '' then
		modify("t_rec.text = 'MEB:'")
	else
		modify("t_rec.text = '" + ls_bond + ":'")
	end if
	if ls_retainer = '' then
		modify("t_retfee.text = 'Rétention:'")
	else
		modify("t_retfee.text = '" + ls_retainer + ":'")
	end if
	if ls_init = '' then
		modify("t_initial.text = 'Paiement initial:'")
	else
		modify("t_initial.text = '" + ls_init + ":'")
	end if
	modify("t_mqty.text = 'Nb. versements:'")
	modify("t_mmontant.text = 'Montant:'")
	modify("t_paiefinal.text = 'Dernier paiement:'")
	modify("t_used.text = 'Actif:'")
	modify("gb_period.text = 'Période'")	
	object.periode.values = 'Mensuel~tm/Bi-mensuel~tb/Trimestriel~tq/Semestriel~ts/Annuel~ta'
else
	if ls_rec = '' then
		modify("t_diag.text = 'Records:'")
	else
		modify("t_diag.text = '" + ls_rec + ":'")
	end if
	if ls_bond = '' then
		modify("t_rec.text = 'Bond:'")
	else
		modify("t_rec.text = '" + ls_bond + ":'")
	end if
	if ls_retainer = '' then
		modify("t_retfee.text = 'Retainer fee:'")
	else
		modify("t_retfee.text = '" + ls_retainer + ":'")
	end if
	if ls_init = '' then
		modify("t_initial.text = 'Initial amount:'")
	else
		modify("t_initial.text = '" + ls_init + ":'")
	end if
	modify("t_duree.text = 'Estimated treatment time'")
	modify("t_a.text = 'to'")
	modify("t_month.text = 'month'")
	modify("b_entente.text = 'Financial agreement'")
	object.periode.values = 'Monthly~tm/Bi-Monthly~tb/Quaterly~tq/Semi-Annually~ts/Annually~ta'
end if
SetTransObject(SQLCA)

if this.GetChild('id_phase', dddw_phase) = -1 then
	error_type(0)
end if
dddw_phase.SetTransObject(SQLCA)
dddw_phase.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_phase.retrieve()
end event

event buttonclicked;long ll_contactid[], ll_patidcorr[], ll_phase[]

choose case dwo.name
	case 'b_entente'
		s_corrletter s_corr
		boolean lb_2k3
		OLEObject lole_word
		
		lole_word = create oleobject
		
		if lole_word.connecttonewobject('word.application') <> 0 then return
		lb_2k3 = (left(lole_word.version, 2) = '11')
		lole_word.disconnectobject()
		destroy lole_word
		
		s_corr.patid = il_patid
		s_corr.letter = ""
		s_corr.flag = 'w'
		s_corr.mode = 'l'
		// fichier texte
		ll_contactid[1] = dw_contrat.getitemnumber(row,'id_contact')
		ll_patidcorr[1] = il_patid
		ll_phase[1] = getitemnumber(row,'id_phase')
		gf_pat2excel(ll_patidcorr,ll_contactid,ll_phase)
		gf_pat2xml(il_patid)
		// ouverture
		openwithparm(w_dosspatcorrletters,s_corr,w_principal)
		if isvalid(w_dosspatcorrletters) then
			w_dosspatcorrletters.title = "Choix lettre"
		end if
end choose
end event

event clicked;string ls1

choose case dwo.name
	case 't_calcqty'
		ls1 = object.t_calcqty.text
		if ls1 = 'X' then
			object.t_calcqty.text = ''
		else
			object.t_calcqty.text = 'X'
		end if
	case 't_calcmens'
		ls1 = object.t_calcmens.text
		if ls1 = 'X' then
			object.t_calcmens.text = ''
		else
			object.t_calcmens.text = 'X'
		end if
end choose
end event

event editchanged;string ls_ColName
integer li_nb
dec{2} ld_pourc,ld_couttrait,ld_initial,ld_ver,ld_paiefin,ld_cons,ld_diag,ld_meb,ld_ret, ld_cons2

ls_ColName = GetColumnName()
CHOOSE CASE ls_ColName
	CASE 'mqty'	
			li_nb = integer(data)
			if li_nb > 0 then
//				ld_pourc = getitemnumber(row,'pourcentage') / 100
				ld_couttrait = getitemnumber(row,'couttrait') //* ld_pourc
				ld_cons = getitemnumber(row,'cons')
				ld_cons2 = getItemNumber(row,'cons2')
				ld_diag = getitemnumber(row,'diag') //* ld_pourc
				ld_ret = getitemnumber(row,'retfee') //* ld_pourc
				ld_meb = getitemnumber(row,'meb') //* ld_pourc
				ld_initial = getitemnumber(row,'initial') //* ld_pourc
				ld_ver = (ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (li_nb + 1)
				if object.t_calcqty.text = 'X' then
					setitem(row,'mmontant',ld_ver)
				end if
				ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - li_nb * getitemnumber(row,'mmontant')
				setitem(row,'paiefinal',ld_paiefin)
			end if
	CASE 'mmontant'		
		ld_ver = dec(data)
		if ld_ver > 0 then
//			ld_pourc = getitemnumber(row,'pourcentage') / 100
			ld_couttrait = getitemnumber(row,'couttrait') //* ld_pourc
			ld_cons = getitemnumber(row,'cons')
			ld_cons2 = getItemNumber(row,'cons2')
			ld_diag = getitemnumber(row,'diag') //* ld_pourc
			ld_ret = getitemnumber(row,'retfee') //* ld_pourc
			ld_meb = getitemnumber(row,'meb') //* ld_pourc
			ld_initial = getitemnumber(row,'initial') //* ld_pourc
			li_nb = ((ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (ld_ver)) - 1
			if object.t_calcmens.text = 'X' then
				setitem(row,'mqty',li_nb)
			end if
			ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - getitemnumber(row,'mqty') * ld_ver
			setitem(row,'paiefinal',ld_paiefin)
		end if
	CASE 'pourcentage'	
			ld_pourc = integer(data)
			if ld_pourc > 0 then
//				ld_pourc = ld_pourc / 100
				li_nb = getitemnumber(row,'mqty')
				ld_couttrait = getitemnumber(row,'couttrait') //* ld_pourc
				ld_cons = getitemnumber(row,'cons')
				ld_cons2 = getItemNumber(row,'cons2')
				ld_diag = getitemnumber(row,'diag') //* ld_pourc
				ld_ret = getitemnumber(row,'retfee') //* ld_pourc
				ld_meb = getitemnumber(row,'meb') //* ld_pourc
				ld_initial = getitemnumber(row,'initial') //* ld_pourc
				ld_ver = (ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (li_nb + 1)
//				if object.t_calcqty.text = 'X' then
					setitem(row,'mmontant',ld_ver)
//				end if
				ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - li_nb * getitemnumber(row,'mmontant')
				setitem(row,'paiefinal',ld_paiefin)
			end if
		CASE 'couttrait'
			ld_couttrait = dec(data)
			if ld_couttrait > 0 then
				li_nb = getitemnumber(row,'mqty')
				ld_cons = getitemnumber(row,'cons')
				ld_cons2 = getItemNumber(row,'cons2')
				ld_diag = getitemnumber(row,'diag')
				ld_ret = getitemnumber(row,'retfee')
				ld_meb = getitemnumber(row,'meb')
				ld_initial = getitemnumber(row,'initial')
				ld_ver = (ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (li_nb + 1)
//				if object.t_calcqty.text = 'X' then
					setitem(row,'mmontant',ld_ver)
//				end if
				ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - li_nb * getitemnumber(row,'mmontant')
				setitem(row,'paiefinal',ld_paiefin)
			end if
		CASE 'diag'
			ld_diag = dec(data)
			if ld_diag > 0 then
				ld_couttrait = getitemnumber(row,'couttrait')
				li_nb = getitemnumber(row,'mqty')
				ld_cons = getitemnumber(row,'cons')
				ld_cons2 = getItemNumber(row,'cons2')
				ld_ret = getitemnumber(row,'retfee')
				ld_meb = getitemnumber(row,'meb')
				ld_initial = getitemnumber(row,'initial')
				ld_ver = (ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (li_nb + 1)
//				if object.t_calcqty.text = 'X' then
					setitem(row,'mmontant',ld_ver)
//				end if
				ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - li_nb * getitemnumber(row,'mmontant')
				setitem(row,'paiefinal',ld_paiefin)
			end if
		CASE 'meb'
			ld_meb = dec(data)
			if ld_meb > 0 then
				ld_couttrait = getitemnumber(row,'couttrait')
				li_nb = getitemnumber(row,'mqty')
				ld_cons = getitemnumber(row,'cons')
				ld_cons2 = getItemNumber(row,'cons2')
				ld_diag = getitemnumber(row,'diag')
				ld_ret = getitemnumber(row,'retfee')
				ld_initial = getitemnumber(row,'initial')
				ld_ver = (ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (li_nb + 1)
//				if object.t_calcqty.text = 'X' then
					setitem(row,'mmontant',ld_ver)
//				end if
				ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - li_nb * getitemnumber(row,'mmontant')
				setitem(row,'paiefinal',ld_paiefin)
			end if
		CASE 'retfee'
			ld_ret = dec(data)
			if ld_ret > 0 then
				ld_couttrait = getitemnumber(row,'couttrait')
				li_nb = getitemnumber(row,'mqty')
				ld_cons = getitemnumber(row,'cons')
				ld_cons2 = getItemNumber(row,'cons2')
				ld_diag = getitemnumber(row,'diag')
				ld_meb = getitemnumber(row,'meb')
				ld_initial = getitemnumber(row,'initial')
				ld_ver = (ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (li_nb + 1)
//				if object.t_calcqty.text = 'X' then
					setitem(row,'mmontant',ld_ver)
//				end if
				ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - li_nb * getitemnumber(row,'mmontant')
				setitem(row,'paiefinal',ld_paiefin)
			end if
		CASE 'initial'
			ld_initial = dec(data)
			if ld_initial > 0 then
				ld_couttrait = getitemnumber(row,'couttrait')
				li_nb = getitemnumber(row,'mqty')
				ld_cons = getitemnumber(row,'cons')
				ld_cons2 = getItemNumber(row,'cons2')
				ld_diag = getitemnumber(row,'diag')
				ld_ret = getitemnumber(row,'retfee')
				ld_meb = getitemnumber(row,'meb')
				ld_ver = (ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb) / (li_nb + 1)
//				if object.t_calcqty.text = 'X' then
					setitem(row,'mmontant',ld_ver)
//				end if
				ld_paiefin = ld_couttrait - ld_initial - ld_diag - ld_ret - ld_meb - li_nb * getitemnumber(row,'mmontant')
				setitem(row,'paiefinal',ld_paiefin)
			end if
END CHOOSE
change = true
end event

event itemchanged;//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 24/10/2003
// Demande  : JMD
// Version  : 7.6.1
// Modifié par:
//	Modifié le :
//////////////////////////////////
long ll_traitid,ll_statusid
integer li_idphase
dec{2} ld_montant

if dwo.name = 'id_phase' then
	// Recherche des informations deja existantes
	event ue_insertmontant(integer(data))
end if
change = true
end event

event itemerror;call super::itemerror;return 3

end event

type tabpage_dentist from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Dentiste"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_dosspatdentresp dw_dosspatdentresp
end type

on tabpage_dentist.create
this.dw_dosspatdentresp=create dw_dosspatdentresp
this.Control[]={this.dw_dosspatdentresp}
end on

on tabpage_dentist.destroy
destroy(this.dw_dosspatdentresp)
end on

type dw_dosspatdentresp from u_dw within tabpage_dentist
event ue_update ( )
integer width = 3607
integer height = 1740
integer taborder = 40
string title = "dosspatdentresp"
string dataobject = "d_dosspatdentresp"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();long ll_id

accepttext()
if this.update() = 1 then 
	commit using SQLCA;
else
	rollback;
	error_type(50)
end if
//appliquer sur le patient
ll_id = getitemnumber(getrow(),'id_dentist')
if not ll_id > 0 or isnull(ll_id) then
	select max(id_dentist) into :ll_id from t_dentists where ortho_id = :v_no_ortho;
	if ll_id > 0 then
		update patient set id_dentist = :ll_id where patient_id = :il_patid;
		commit;
	end if
else
	if ll_id > 0 then
		update patient set id_dentist = :ll_id where patient_id = :il_patid;
		commit;
	end if
end if
change = false
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	object.t_title.text = 'Dentist responsible'
	object.t_titre.text = 'Title:'
	object.t_nom.text = 'Last name:'
	object.t_prenom.text = 'First name:'
	object.t_adresse.text = 'Address:'
	object.t_ville.text = 'City:'
	object.t_province.text = 'Province:'
	object.t_sex.text = 'Sex:'
	object.t_zip.text = 'Postal code:'
	object.t_langue.text = 'Language:'
	object.t_fax.text = 'Fax:'
	object.t_telbur.text = 'Office phone:'
	object.t_email.text = 'Email:'
	object.t_note.text = 'Note:'
	object.b_enveloppe.text = 'Envelope'
	object.det_prov.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/British Columbia~tBritish Colombia/NewFoundland~tNewFoundland/New Brunswick~tNew Brunswick/Nova Scotia~tNova Scotia/Price Edward island~tPrice Edward island/Yukon~tYukon/North West Territory~tNorthwest Territories'
else
	object.det_prov.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/Colombie Britanique~tColombie Britanique/Terre neuve~tTerre Neuve/Nouveau Brunswick~tNouveau Brunswick/Nouvelle Écosse~tNouvelle Écosse/Île-du-Price-Edward~tÎle-du-Price-Edward/Yukon~tYukon/Territoires du Nord-Ouest~tTerritoire du Nord-Ouest'
end if
SetTransObject(SQLCA)
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event buttonclicked;call super::buttonclicked;IF row > 0 THEN
	datastore ds_envresp
	string	ls_logo
	
	ds_envresp = create datastore
	ds_envresp.dataobject = "d_enveloppe_dentiste"
	ds_envresp.SetTransObject(SQLCA)
	ds_envresp.retrieve(getitemnumber(row,'id_dentist'))
	
	if ds_envresp.getItemString(ds_envresp.getRow(),'t_dentists_det_prov') <> 'USA' then
		ds_envresp.modify("t_dentists_det_zip.EditMask.Mask = '!#! #!#'")
	else
		ds_envresp.modify("t_dentists_det_zip.EditMask.Mask = ''")
	end if
	
	//Récupérer le logo
	select chemin_logo
	into :ls_logo
	from t_options
	where ortho_id = :v_no_ortho;	
	
	IF Isnull(ls_logo) = false AND ls_logo <> "" THEN
		ds_envresp.object.p_logo.filename = ls_logo
	END IF
	
	gb_datawindow = false
	openwithparm(w_print_options,ds_envresp)
	destroy ds_envresp
	
	
END IF
end event

type tabpage_ref from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Référent"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_dosspatref dw_dosspatref
end type

on tabpage_ref.create
this.dw_dosspatref=create dw_dosspatref
this.Control[]={this.dw_dosspatref}
end on

on tabpage_ref.destroy
destroy(this.dw_dosspatref)
end on

type dw_dosspatref from u_dw within tabpage_ref
event ue_update ( )
integer width = 3607
integer height = 1740
integer taborder = 40
string title = "dosspatref"
string dataobject = "d_dosspatref"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();long ll_id

accepttext()
if this.update() = 1 then 
	commit using SQLCA;
else
	rollback;
	error_type(50)
end if
//appliquer sur le patient
IF getrow() > 0 THEN
	ll_id = getitemnumber(getrow(),'id')
	if not ll_id > 0 or isnull(ll_id) then
		select max(id) into :ll_id from t_referents where ortho_id = :v_no_ortho;
		if ll_id > 0 then
			update patient set referant_nom = :ll_id where patient_id = :il_patid;
			commit;
		end if
	else
		if ll_id > 0 then
			update patient set referant_nom = :ll_id where patient_id = :il_patid;
			commit;
		end if
	end if
	change = false
END IF
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	object.t_title.text = 'Referral'
	object.t_titre.text = 'Title:'
	object.t_nom.text = 'Last name:'
	object.t_prenom.text = 'First name:'
	object.t_adresse.text = 'Address:'
	object.t_ville.text = 'City:'
	object.t_province.text = 'Province:'
	object.t_zip.text = 'Postal code:'
	object.t_fax.text = 'Fax:'
	object.t_telbur.text = 'Office phone:'
	object.t_email.text = 'Email:'
	object.t_langue.text = 'Language:'
	object.t_note.text = 'Note:'
	object.ref_province.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/British Columbia~tBritish Colombia/NewFoundland~tNewFoundland/New Brunswick~tNew Brunswick/Nova Scotia~tNova Scotia/Price Edward island~tPrice Edward island/Yukon~tYukon/North West Territory~tNorthwest Territories'
else
	object.ref_province.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/Colombie Britanique~tColombie Britanique/Terre neuve~tTerre Neuve/Nouveau Brunswick~tNouveau Brunswick/Nouvelle Écosse~tNouvelle Écosse/Île-du-Price-Edward~tÎle-du-Price-Edward/Yukon~tYukon/Territoires du Nord-Ouest~tTerritoire du Nord-Ouest'
end if
SetTransObject(SQLCA)
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

type tabpage_rdv from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Rendez-vous"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
tab_rdv tab_rdv
end type

on tabpage_rdv.create
this.tab_rdv=create tab_rdv
this.Control[]={this.tab_rdv}
end on

on tabpage_rdv.destroy
destroy(this.tab_rdv)
end on

type tab_rdv from tab within tabpage_rdv
event create ( )
event destroy ( )
integer width = 3611
integer height = 1752
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_visits tabpage_visits
tabpage_rappels tabpage_rappels
end type

on tab_rdv.create
this.tabpage_visits=create tabpage_visits
this.tabpage_rappels=create tabpage_rappels
this.Control[]={this.tabpage_visits,&
this.tabpage_rappels}
end on

on tab_rdv.destroy
destroy(this.tabpage_visits)
destroy(this.tabpage_rappels)
end on

type tabpage_visits from userobject within tab_rdv
event create ( )
event destroy ( )
integer x = 18
integer y = 108
integer width = 3575
integer height = 1628
long backcolor = 79741120
string pointer = "Arrow!"
string text = "Visites"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_dosspatrdv dw_dosspatrdv
end type

on tabpage_visits.create
this.dw_dosspatrdv=create dw_dosspatrdv
this.Control[]={this.dw_dosspatrdv}
end on

on tabpage_visits.destroy
destroy(this.dw_dosspatrdv)
end on

type dw_dosspatrdv from u_dw within tabpage_visits
event ue_update ( )
integer width = 3584
integer height = 1636
integer taborder = 50
string title = "dosspatrdv"
string dataobject = "d_dosspatrdv"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();accepttext()
if this.update() = 1 then 
	commit using SQLCA;
else
	rollback;
	error_type(50)
end if
change = false
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
if v_langue = 'an' then
	object.t_heure.text = 'Time'
	object.t_heurearr.text = 'Seated'
	object.t_heuredep.text = 'Released'
	object.t_trait.text = 'Treatment'
	object.t_duree.text = 'Length'
	object.rdvetat.values = 'Cancel Appointment~tc/Missed-Broken Appointment~tm/Late Appointment~tl/CABA~tb/Early~te/On Time~to/On Deck~td'
else
	object.rdvetat.values = 'Annulé~tc/Manqué~tm/Retard~tl/CABA~tb/Avance~te/À Temps~to/On Deck~td'
end if
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

type tabpage_rappels from userobject within tab_rdv
integer x = 18
integer y = 108
integer width = 3575
integer height = 1628
long backcolor = 79741120
string text = "Rappels"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tabpage_histocorr from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Correspondance"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
ole_mail ole_mail
dw_courrieldosspat dw_courrieldosspat
dw_histonote dw_histonote
dw_histocorr dw_histocorr
end type

on tabpage_histocorr.create
this.ole_mail=create ole_mail
this.dw_courrieldosspat=create dw_courrieldosspat
this.dw_histonote=create dw_histonote
this.dw_histocorr=create dw_histocorr
this.Control[]={this.ole_mail,&
this.dw_courrieldosspat,&
this.dw_histonote,&
this.dw_histocorr}
end on

on tabpage_histocorr.destroy
destroy(this.ole_mail)
destroy(this.dw_courrieldosspat)
destroy(this.dw_histonote)
destroy(this.dw_histocorr)
end on

type ole_mail from olecustomcontrol within tabpage_histocorr
event statustextchange ( string text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string text )
event propertychange ( string szproperty )
event beforenavigate2 ( oleobject pdisp,  any url,  any flags,  any targetframename,  any postdata,  any headers,  ref boolean cancel )
event newwindow2 ( ref oleobject ppdisp,  ref boolean cancel )
event navigatecomplete2 ( oleobject pdisp,  any url )
event documentcomplete ( oleobject pdisp,  any url )
event onquit ( )
event onvisible ( boolean ocx_visible )
event ontoolbar ( boolean toolbar )
event onmenubar ( boolean menubar )
event onstatusbar ( boolean statusbar )
event onfullscreen ( boolean fullscreen )
event ontheatermode ( boolean theatermode )
event windowsetresizable ( boolean resizable )
event windowsetleft ( long left )
event windowsettop ( long top )
event windowsetwidth ( long ocx_width )
event windowsetheight ( long ocx_height )
event windowclosing ( boolean ischildwindow,  ref boolean cancel )
event clienttohostwindow ( ref long cx,  ref long cy )
event setsecurelockicon ( long securelockicon )
event filedownload ( boolean activedocument,  ref boolean cancel )
event navigateerror ( oleobject pdisp,  any url,  any frame,  any statuscode,  ref boolean cancel )
event printtemplateinstantiation ( oleobject pdisp )
event printtemplateteardown ( oleobject pdisp )
event updatepagestatus ( oleobject pdisp,  any npage,  any fdone )
event privacyimpactedstatechange ( boolean bimpacted )
event setphishingfilterstatus ( long phishingfilterstatus )
event newprocess ( long lcauseflag,  oleobject pwb2,  ref boolean cancel )
event redirectxdomainblocked ( oleobject pdisp,  any starturl,  any redirecturl,  any frame,  any statuscode )
event beforescriptexecute ( oleobject pdispwindow )
string tag = "resize=arb"
integer x = 2117
integer y = 948
integer width = 1481
integer height = 792
integer taborder = 21
boolean focusrectangle = false
string binarykey = "w_dossier_patients.win"
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_courrieldosspat from u_dw within tabpage_histocorr
event ue_retrieve ( )
string tag = "resize=ar"
integer x = 2117
integer width = 1481
integer height = 944
integer taborder = 50
string dataobject = "d_courrieldosspat"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();string ls_param1, ls_param2

ls_param1 = 'P' + string(il_patid)

dw_courrieldosspat.retrieve(ls_param1)
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_idmessage
string ls_body, ls_typeetat, ls_msgfail

ll_idmessage = dw_courrieldosspat.getItemNumber(currentrow,'id_message')
ls_typeetat = dw_courrieldosspat.getItemstring(currentrow,'typeetat')
ls_msgfail = dw_courrieldosspat.getItemstring(currentrow,'msgfail')

if ls_msgfail = '' then
	if ls_typeetat = 'I' then
		ls_body = dw_courrieldosspat.getItemString(currentrow,'message_texte')
	else
		ls_body = dw_courrieldosspat.getItemString(currentrow,'messagereply')
	end if
else
	ls_body = dw_courrieldosspat.getItemString(currentrow,'msgfail')
end if

gnv_app.inv_filesrv.of_filewrite("c:\ii4net\orthotek\msgprogitek.html", ls_body,false)
ole_mail.object.navigate("c:\ii4net\orthotek\msgprogitek.html")
end event

event clicked;call super::clicked;selectRow(0,false)
selectRow(row,true)
end event

type dw_histonote from u_dw within tabpage_histocorr
event ue_retrieve ( )
integer y = 1136
integer width = 3598
integer height = 604
integer taborder = 11
string dataobject = "d_histonote"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();retrieve(il_patid)
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)
SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
end event

type dw_histocorr from u_dw within tabpage_histocorr
event ue_update ( )
event ue_retrieve ( )
string tag = "resize=ab"
integer width = 2112
integer height = 1732
integer taborder = 40
string title = "histocorr"
string dataobject = "d_histocorr"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();if dataobject = 'd_histocorr' then
	accepttext()
	if update() = 1 then 
		commit using SQLCA;
	else
		rollback;
		error_type(50)
	end if
end if
change = false
end event

event ue_retrieve();long ll_nb,ll_newrow
int i,index
date ldt
time lt
string ls_word
n_cst_filesrvwin32 io_file
n_cst_dirattrib lo_dirList[]
reset()
select corrpath,wordpath,imgpath into :is_corrpath,:ls_word,:is_imgpath from t_options where ortho_id = :v_no_ortho;
is_wordpath = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", ls_word)

io_file = Create n_cst_filesrvwin32

// lister les .doc
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\*.doc", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .jpg
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\scan\*.jpg", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .jpeg
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\scan\*.jpeg", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .tif
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\scan\*.tif", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .tiff
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\scan\*.tiff", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\scan\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .pdf
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\*.pdf", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .xls
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\*.xls", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .xlsx
ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\*.xlsx", 33, lo_dirList)
For i = 1 To ll_nb
	if left(lo_dirList[i].is_FileName,1) <> '.' then
		ll_newrow = insertrow(0)
		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datecreated',datetime(ldt,lt))
		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
		setitem(ll_newrow,'datemodified',datetime(ldt,lt))
		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt)
		setitem(ll_newrow,'accessed',string(ldt))
		setitem(ll_newrow,'dateaccessed',ldt)
	end if
Next

// lister les .docx
//ll_nb = io_file.of_dirList(is_corrpath + "\" + string(il_patid) + "\*.docx", 33, lo_dirList)
//For i = 1 To ll_nb
//	if left(lo_dirList[i].is_FileName,1) <> '.' then
//		ll_newrow = insertrow(0)
//		setitem(ll_newrow,'corrletter',lo_dirList[i].is_FileName)
//		io_file.of_getcreationdatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
//		setitem(ll_newrow,'created',string(ldt)+ ' at ' +string(lt))
//		io_file.of_getlastwritedatetime(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt,lt)
//		setitem(ll_newrow,'modified',string(ldt)+ ' at ' +string(lt))
//		io_file.of_getlastaccessdate(is_corrpath + "\" + string(il_patid) + "\" + lo_dirList[i].is_FileName,ldt)
//		setitem(ll_newrow,'accessed',string(ldt))
//	end if
//Next

// dw_histonote.retrieve(il_patid)


destroy io_file

THIS.Sort()
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

//if v_langue = 'an' then
//	modify("t_dest.text = 'Recipient'")
//	modify("t_sujet.text = 'Subject:'")
//	modify("t_heure.text = 'Time:'")
//	modify("t_docname.text = 'Document Name:'")
//end  if

dataobject = 'd_dosspatcorrletter'
SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
end event

event doubleclicked;long ll_contactid[], ll_phase[], ll_patcorr[]
string ls_nomdoc, ls_typelettre

string ls_password, ls_concat
long ll_concat,ll_total

if dataobject = 'd_dosspatcorrletter' then
	boolean lb_2k3
	OLEObject lole_word
	s_corrletter s_corr

	s_corr.patid = il_patid
	s_corr.letter = getitemstring(row,'corrletter')
	s_corr.flag = 'r'
	s_corr.mode = 'l'

	lole_word = create oleobject
		
//	if match(upper(s_corr.letter),'DOC') and lole_word.connecttonewobject('word.application') <> 0 then
//		lb_2k3 = (left(lole_word.version, 2) = '11')
//		lole_word.disconnectobject()
//		destroy lole_word
//	end if
	
	if s_corr.letter = '' then
		error_type(125)
	else
		if match(upper(s_corr.letter),'JPG') or match(upper(s_corr.letter),'JPEG') then
			if isnull(is_imgpath) or is_imgpath = "" then
				
				n_cst_syncproc luo_sync
				luo_sync = CREATE n_cst_syncproc
				
				luo_sync.of_setwindow('normal')
				luo_sync.of_RunAndWait('"' + is_corrpath + '\' + string(s_corr.patid) + '\scan\' + s_corr.letter+'"')
				
				IF IsValid(luo_sync) THEN destroy luo_sync
			else 
				Run(is_imgpath + ' "' + is_corrpath + '\' + string(s_corr.patid) + '\scan\' + s_corr.letter+'"')
			end if
			
		elseif match(upper(s_corr.letter),'PDF') or &
				 match(upper(s_corr.letter),'XLS') or &
				 match(upper(s_corr.letter),'DOCX') then
			
			ls_nomdoc = is_corrpath + '\' + string(s_corr.patid) + '\' + s_corr.letter
			
			luo_sync = CREATE n_cst_syncproc
			
			luo_sync.of_setwindow('normal')
			luo_sync.of_RunAndWait('"' + ls_nomdoc + '"')
			
			IF IsValid(luo_sync) THEN destroy luo_sync
		
		else
			select first id_contact, id_phase into :ll_contactid[1], :ll_phase[1] from t_contrats where patient_id = :il_patid order by id_phase desc;
			ll_patcorr[1] = il_patid
			
			gf_pat2excel(ll_patcorr,ll_contactid,ll_phase)
			//--------------------------------------------
			//AJOUTER AUTORISATION LECTURE DANS FICHIER INI  (WORD)
			
			ls_password = ProfileString ("c:\ii4net\orthotek\corr\corr.ini", "corr", string(s_corr.patid)+s_corr.letter, "")
			
			FOR ll_concat = 1 To len(ls_password)
				ll_total = ll_total + Integer(Mid(ls_password,ll_concat,1))
			NEXT
			setProfileString ("c:\ii4net\orthotek\ortho.ini", "corr", string(s_corr.patid)+s_corr.letter, string(ll_total) )
			//--------------------------------------------
			Run('"'+is_wordpath + '" "' + is_corrpath + '\' + string(s_corr.patid) + '\' + s_corr.letter+'"')
			//ancien code
			//uf_excel()
			//opensheetwithparm(w_word,s_corr,w_principal,2,layered!)
			//w_word.title = "Corps de la lettre"
		end if
	end if
else
		
	ls_nomdoc = getItemString(row,'nomdoc')
	if isnull(ls_nomdoc) or ls_nomdoc = "" then
		Opensheetwithparm(w_description,2,w_principal,2,layered!)
		w_description.title = "Rapport de consultation"
	else
		
		if match(ls_nomdoc,'.ltr') or match(ls_nomdoc,'.doc') then
			
			
			run('C:\Program Files\Microsoft Office\Office\WINWORD.EXE C:\ii4net\orthotek\correspondances\'+ ls_nomdoc,maximized!)
		else
			ls_typelettre = getItemString(row,'typelettre')
			if ls_typelettre = 'c' then
				opensheet(w_ententeedit,w_principal,2,layered!)
				w_ententeedit.title = "Contrat"
				w_ententeedit.il_prov = 3
				w_ententeedit.il_patid = il_patid
				w_ententeedit.il_idphase = getitemnumber(getrow(),'id_phase')
				w_ententeedit.il_idcontact = getItemNumber(getRow(),'id_contact')
				w_ententeedit.event ue_post_open()
				w_ententeedit.st_title.event ue_title()
			else
				opensheetwithparm(w_corpslettre,3,w_principal,2,layered!)
				w_corpslettre.title = "Lettre de correspondance"
			end if
		end if
	end if
end if
end event

event editchanged;//change = true
end event

event itemchanged;//change = true
end event

event rbuttondown;if dataobject = 'd_dosspatcorrletter' then
	dataobject = 'd_histocorr'
	settransobject(sqlca)
	retrieve(il_patid)
else
	dataobject = 'd_dosspatcorrletter'
	event ue_retrieve()
end if
end event

event clicked;call super::clicked;choose case dwo.name 
	case 'corrletter_t'
		setRedraw(false)
		setsort("corrletter A")
		sort()
		setRedraw(true)
	case 'created_t'
		setRedraw(false)
		setsort("datecreated D")
		sort()
		setRedraw(true)
	case 'modified_t'
		setRedraw(false)
		setsort("datemodified D")
		sort()
		setRedraw(true)
	case 'accessed_t'
		setRedraw(false)
		setsort("dateaccessed D")
		sort()
		setRedraw(true)
end choose
end event

type tabpage_cartetrait from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 15793151
string text = "Carte de traitements"
long tabtextcolor = 33554432
long tabbackcolor = 15793151
long picturemaskcolor = 536870912
dw_cartetrait dw_cartetrait
dw_carteentete dw_carteentete
dw_rdv dw_rdv
end type

on tabpage_cartetrait.create
this.dw_cartetrait=create dw_cartetrait
this.dw_carteentete=create dw_carteentete
this.dw_rdv=create dw_rdv
this.Control[]={this.dw_cartetrait,&
this.dw_carteentete,&
this.dw_rdv}
end on

on tabpage_cartetrait.destroy
destroy(this.dw_cartetrait)
destroy(this.dw_carteentete)
destroy(this.dw_rdv)
end on

type dw_cartetrait from u_dw within tabpage_cartetrait
event ue_update ( )
integer x = 5
integer y = 752
integer width = 3579
integer height = 980
integer taborder = 40
string dataobject = "d_cartetraitement"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();//long enr,patient_id, nb_row, i, row, presence, ll_valid, ll_row, ll_id, ll_idcontactdef
//long ll_validnodoss, ll_validnewdoss, ll_validdosspat, ll_validdosstel
//integer li_resptopat
//string v_nom, v_prenom, no_dossier, dos, v_tel, ls_telautre, ls_telcell
//string ls_patadd, ls_patcity, ls_patzip, ls_telbur, ls_prov, ls_email, ls_sex, ls_langue
//date min
//
//tab_dosspat.tabpage_dosspat.dw_dosspat.accepttext()
//choose case tab_dosspat.tabpage_dosspat.dw_dosspat.dataobject
//	case 'd_dosspat'
//		select validnodoss, validnewdoss, validdosspat, validdosstel, resptopat into :ll_validnodoss, :ll_validnewdoss, :ll_validdosspat, :ll_validdosstel, :li_resptopat from t_options where ortho_id = :v_no_ortho;
//		if isnull(tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'new_dossier')) = false and tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'new_dossier') <> "" and ll_validnewdoss = 1 then
//			if validernewdos(tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'new_dossier')) = false then
//				return
//			end if
//		end if
//		if isnull(tab_dosspat.tabpage_dosspat.dw_dosspat.getItemNumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'no_dossier')) = false and tab_dosspat.tabpage_dosspat.dw_dosspat.getItemNumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'no_dossier') <> 0 and ll_validnodoss = 1 then
//			if validernodos(tab_dosspat.tabpage_dosspat.dw_dosspat.getItemNumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'no_dossier')) = false then
//				return
//			end if
//		end if
//		if isnull(tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'tel_maison')) = false and tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'tel_maison') <> "" and ll_validdosstel = 1 then
//			if validernotel(tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'tel_maison')) = false then
//				return		
//			end if
//		end if
//		if validernomprenom(tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'patient_nom'),tab_dosspat.tabpage_dosspat.dw_dosspat.getItemString(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'patient_prenom')) = false and ll_validdosspat = 1 then
//			return
//		end if
//		v_nom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"patient_nom")
//		v_prenom = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"patient_prenom")
//		v_tel = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"tel_maison")
//		ls_patadd = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"adresse")
//		ls_patcity = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"ville")
//		ls_patzip = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"code_postale")
//		ls_telbur = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"tel_bureau")
//		ls_prov = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"province")
//		ls_email = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"email")
//		ls_sex = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"sex")
//		ls_langue = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"langue")
//		ls_telcell = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"telcell")
//		ls_telautre = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"telautre")
//		
//		if v_nom = '' or isnull(v_nom) = true then
//			error_type(122)
//			tab_dosspat.tabpage_dosspat.dw_dosspat.SetFocus()
//		elseif v_prenom = '' or isnull(v_prenom) = true then
//			error_type(123)
//			tab_dosspat.tabpage_dosspat.dw_dosspat.SetFocus()
//		else
//			if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//				commit using SQLCA;
//				//cle primaire
//				il_patid = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemnumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'patient_id')
//				if not il_patid > 0 then
//					select max(patient_id) into :il_patid from patient where no_ortho = :v_no_ortho;
//				end if
//				cb_insert.enabled = true
//				//changement du nom ou du prenom
//				if ii_chang_nom_prenom_tel = 1 then
//					if vi_mode_ajout <> 1 then
//						w_patient.dw_patient_master.deleterow(w_patient.dw_patient_master.getrow())
//					end if
//					w_patient.dw_patient_master.setredraw(false)
//					ajout_ligne(il_patid)
//					w_patient.dw_patient_master.setsort("patient_nom A, patient_prenom A")
//					w_patient.dw_patient_master.sort()
//					w_patient.dw_patient_master.setredraw(true)
//					ll_row = w_patient.dw_patient_master.find("patient_id = " + string(il_patid),1,w_patient.dw_patient_master.rowcount())
//					w_patient.dw_patient_master.scrolltorow(ll_row)
//				end if
//				w_patient.dw_details_patient.event retourner(il_patid)
//				//ajouter au contact
//				if vi_mode_ajout = 1 then
//					insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,email,sex,langue,pat,telcell,telautre,resptype)
//					values(:v_no_ortho,:il_patid,:v_nom,:v_prenom,:ls_patadd,:ls_patcity,:ls_patzip,:v_tel,:ls_telbur,:ls_prov,:ls_email,:ls_sex,:ls_langue,1,:ls_telcell,:ls_telautre,'pat');
//					select max(id_contact) into :ll_idcontactdef from t_contact where patient_id = :il_patid;
//					update patient set id_contact = :ll_idcontactdef where patient_id = :il_patid;
//					commit using sqlca;
//				else
//					//modifier le contact
////					messagebox('contact','modifie le contact')
//					update t_contact set ortho_id = :v_no_ortho, nom = :v_nom, prenom = :v_prenom, adresse = :ls_patadd, 
//					ville = :ls_patcity, zip = :ls_patzip, telres = :v_tel, telbur = :ls_telbur, province = :ls_prov, 
//					email = :ls_email, sex = :ls_sex, langue = :ls_langue, telautre = :ls_telautre, telcell = :ls_telcell 
//					where patient_id = :il_patid and pat = 1;
//				end if
//				tab_dosspat.tabpage_dosspat.dw_dosspat.Retrieve(il_patid)
//				vi_mode_ajout = 0
//			else
//				rollback using SQLCA;
//				error_type(50)
//			end if
//		end if
//		w_principal.SetMicroHelp('Dossier patient (' + string(il_patid) + ')')
//		rchange = false
//		ii_modeajout = 0 //bug row focus change
//		//activer ou non le menu
////		if il_patid > 0 then
////			plb_dosspatchoix.enabled=true
////		else
////			plb_dosspatchoix.enabled=false
////		end if
//		uf_ortho2consultpro()
//	case 'd_dosspatrespfin'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//			uf_addlieninpatientfile()
//			tab_dosspat.tabpage_dosspat.dw_dosspat.Retrieve(il_patid)
////			dddw_idcontact.setfilter("patient_id = " + string(w_patient.il_patid))
//		else
//			rollback;
//			error_type(50)
//		end if
//	case 'd_dosspatficheconsult'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//		
//	case 'd_dosspatdentresp'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//		//appliquer sur le patient
//		ll_id = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemnumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'id_dentist')
//		if not ll_id > 0 or isnull(ll_id) then
//			select max(id_dentist) into :ll_id from t_dentists where ortho_id = :v_no_ortho;
//			if ll_id > 0 then
//				update patient set id_dentist = :ll_id where patient_id = :il_patid;
//				commit;
//			end if
//		else
//			if ll_id > 0 then
//				update patient set id_dentist = :ll_id where patient_id = :il_patid;
//				commit;
//			end if
//		end if
//	case 'd_dosspatref'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//		//appliquer sur le patient
//		ll_id = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemnumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'id')
//		if not ll_id > 0 or isnull(ll_id) then
//			select max(id) into :ll_id from t_referents where ortho_id = :v_no_ortho;
//			if ll_id > 0 then
//				update patient set referant_nom = :ll_id where patient_id = :il_patid;
//				commit;
//			end if
//		else
//			if ll_id > 0 then
//				update patient set referant_nom = :ll_id where patient_id = :il_patid;
//				commit;
//			end if
//		end if
//	case 'd_dosspatrdv'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//	case 'd_rapppre'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//	case 'd_traitreq'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//	case 'd_etatcomptepat1'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//	case 'd_contrat'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//	case 'd_dosspatrefa'
////		f_modupdate()
//		if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
//			commit using SQLCA;
//		else
//			rollback;
//			error_type(50)
//		end if
//		//appliquer sur le patient
//		ll_id = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemnumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),'id')
//		if not ll_id > 0 or isnull(ll_id) then
//			select max(id) into :ll_id from t_referents where ortho_id = :v_no_ortho;
//			if ll_id > 0 then
//				update patient set id_ref = :ll_id where patient_id = :il_patid;
//				commit;
//			end if
//		else
//			if ll_id > 0 then
//				update patient set id_ref = :ll_id where patient_id = :il_patid;
//				commit;
//			end if
//		end if
//end choose
//change = false
end event

event constructor;

//pro_resize luo_size
//luo_size.uf_resizedw(this)
SetTransObject(SQLCA)

//if v_langue = 'an' then
//	object.typeds.values = "Days~t1/Weeks~t2/Months~t3/Years~t4"
//else
//	object.typeds.values = "Jours~t1/Semaines~t2/Mois~t3/Années~t4"
//end if

//datawindowchild dwc_typetrait
//if getChild("type_traitement_id",dwc_typetrait) = -1 then
//	error_type(50)
//end if

// Cacher l'image "p_delete" si pas user progitek

if gl_idpers = 0 then
	object.p_delete.visible = true
else
	object.p_delete.visible = false
end if

//dwc_typetrait.setTransObject(SQLCA)
//dwc_typetrait.retrieve(v_no_ortho)
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event clicked;call super::clicked;string ls_user
long ll_iduser, ll_user_on, ll_idcartetrait

accepttext()
choose case dwo.name
		
	case 't_elast'
		
		ll_idcartetrait = getItemNumber(row,'id_cartetrait')
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("cartetraitelast", ll_idcartetrait)
		open(w_viewelast)
		
	case 't_cehg1'
		if getitemnumber(row,'cehg1') = 0 then
			setitem(row,'cehg1',1)
		else
			setitem(row,'cehg1',0)
		end if
	case 't_cehg2'
		if getitemnumber(row,'cehg1') = 0 then
			setitem(row,'cehg2',1)
		else
			setitem(row,'cehg2',0)
		end if
	case 't_cehg3'
		if getitemnumber(row,'cehg3') = 0 then
			setitem(row,'cehg3',1)
		else
			setitem(row,'cehg3',0)
		end if
	case 't_cehg4'
		if getitemnumber(row,'cehg4') = 0 then
			setitem(row,'cehg4',1)
		else
			setitem(row,'cehg4',0)
		end if
	case 't_cehg5'
		if getitemnumber(row,'cehg5') = 0 then
			setitem(row,'cehg5',1)
		else
			setitem(row,'cehg5',0)
		end if
	case 't_cehg6'
		if getitemnumber(row,'cehg6') = 0 then
			setitem(row,'cehg6',1)
		else
			setitem(row,'cehg6',0)
		end if
	case 't_cehg7'
		if getitemnumber(row,'cehg7') = 0 then
			setitem(row,'cehg7',1)
		else
			setitem(row,'cehg7',0)
		end if
		
	case 't_cehd1'
		if getitemnumber(row,'cehd1') = 0 then
			setitem(row,'cehd1',1)
		else
			setitem(row,'cehd1',0)
		end if
	case 't_cehd2'
		if getitemnumber(row,'cehd1') = 0 then
			setitem(row,'cehd2',1)
		else
			setitem(row,'cehd2',0)
		end if
	case 't_cehd3'
		if getitemnumber(row,'cehd3') = 0 then
			setitem(row,'cehd3',1)
		else
			setitem(row,'cehd3',0)
		end if
	case 't_cehd4'
		if getitemnumber(row,'cehd4') = 0 then
			setitem(row,'cehd4',1)
		else
			setitem(row,'cehd4',0)
		end if
	case 't_cehd5'
		if getitemnumber(row,'cehd5') = 0 then
			setitem(row,'cehd5',1)
		else
			setitem(row,'cehd5',0)
		end if
	case 't_cehd6'
		if getitemnumber(row,'cehd6') = 0 then
			setitem(row,'cehd6',1)
		else
			setitem(row,'cehd6',0)
		end if
	case 't_cehd7'
		if getitemnumber(row,'cehd7') = 0 then
			setitem(row,'cehd7',1)
		else
			setitem(row,'cehd7',0)
		end if
		
	case 't_cebg1'
		if getitemnumber(row,'cebg1') = 0 then
			setitem(row,'cebg1',1)
		else
			setitem(row,'cebg1',0)
		end if
	case 't_cebg2'
		if getitemnumber(row,'cebg1') = 0 then
			setitem(row,'cebg2',1)
		else
			setitem(row,'cebg2',0)
		end if
	case 't_cebg3'
		if getitemnumber(row,'cebg3') = 0 then
			setitem(row,'cebg3',1)
		else
			setitem(row,'cebg3',0)
		end if
	case 't_cebg4'
		if getitemnumber(row,'cebg4') = 0 then
			setitem(row,'cebg4',1)
		else
			setitem(row,'cebg4',0)
		end if
	case 't_cebg5'
		if getitemnumber(row,'cebg5') = 0 then
			setitem(row,'cebg5',1)
		else
			setitem(row,'cebg5',0)
		end if
	case 't_cebg6'
		if getitemnumber(row,'cebg6') = 0 then
			setitem(row,'cebg6',1)
		else
			setitem(row,'cebg6',0)
		end if
	case 't_cebg7'
		if getitemnumber(row,'cebg7') = 0 then
			setitem(row,'cebg7',1)
		else
			setitem(row,'cebg7',0)
		end if
		
	case 't_cebd1'
		if getitemnumber(row,'cebd1') = 0 then
			setitem(row,'cebd1',1)
		else
			setitem(row,'cebd1',0)
		end if
	case 't_cebd2'
		if getitemnumber(row,'cebd1') = 0 then
			setitem(row,'cebd2',1)
		else
			setitem(row,'cebd2',0)
		end if
	case 't_cebd3'
		if getitemnumber(row,'cebd3') = 0 then
			setitem(row,'cebd3',1)
		else
			setitem(row,'cebd3',0)
		end if
	case 't_cebd4'
		if getitemnumber(row,'cebd4') = 0 then
			setitem(row,'cebd4',1)
		else
			setitem(row,'cebd4',0)
		end if
	case 't_cebd5'
		if getitemnumber(row,'cebd5') = 0 then
			setitem(row,'cebd5',1)
		else
			setitem(row,'cebd5',0)
		end if
	case 't_cebd6'
		if getitemnumber(row,'cebd6') = 0 then
			setitem(row,'cebd6',1)
		else
			setitem(row,'cebd6',0)
		end if
	case 't_cebd7'
		if getitemnumber(row,'cebd7') = 0 then
			setitem(row,'cebd7',1)
		else
			setitem(row,'cebd7',0)
		end if
		
	CASE "shl_modifier"
		//Demander le mot de passe de l'utilisateur en cours
		ll_iduser = getItemNumber(row,'id_usersigne')
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("ancienuser",ll_iduser)
		open(w_authuser)
		ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authenuser",false))
		if ls_user <> 'Failed' then
			ll_iduser = long(ls_user)
			setItem(row,'id_usersigne',ll_iduser)
			acceptText()
			if update() = 1 then
				commit using SQLCA;
				gnv_app.inv_entrepotglobal.of_ajoutedonnee( "read only carte", "non")
				of_modifiercarte(row)
			else
				rollback using SQLCA;
			end if
		end if

	CASE "shl_visualiser"
		gnv_app.inv_entrepotglobal.of_ajoutedonnee( "read only carte", "oui")
		of_modifiercarte(row)
		
	CASE 'p_delete'
		
		deleteRow(row)
		if update() = 1 then
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
		
	CASE 'p_orthooff' 
		// Demander le mot de passe
		
		//Avant de demander le mot de passe vérifier si la personne loggué serait pas déjà l'ortho
		select id_personnel into :ll_iduser from t_personnels where id_personnel = :gl_idpers
		AND ( postocc = 'O' OR postocc = 'P' OR id_personnel = 0);
		
		if (isnull(ll_iduser) OR ll_iduser = 0) AND gl_idpers <> 0 then		
			open(w_authdentist)
			ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authendentist"))
			if ls_user <> 'Failed' then
				ll_iduser = long(ls_user)
				setItem(row,'id_orthosigne',ll_iduser)
				if update() = 1 then
					commit using SQLCA;
				else
					rollback using SQLCA;
				end if
			end if
		else
			setItem(row,'id_orthosigne',ll_iduser)
			if update() = 1 then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
			
		end if
	
end choose
end event

type dw_carteentete from u_dw within tabpage_cartetrait
integer width = 3598
integer height = 744
integer taborder = 11
string dataobject = "d_carteentete"
boolean hscrollbar = true
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;call super::clicked;long ll_color, ll_retour, ll_lock, ll_iduser, ll_personnel
string ls_phrase, ls_phrase_orig, ls_user

IF dwo.name = "shl_changer_couleur" THEN
	IF row > 0 THEN
		ll_color = THIS.Object.t_carteentete_couleur_texte[row]
		IF Isnull(ll_color) THEN ll_color = 0
		
		ll_retour = ChooseColor ( ll_color) 
		if ll_retour > 0 then
		
			THIS.Object.t_carteentete_couleur_texte[row] = ll_color
			THIS.AcceptText()
			THIS.GroupCalc()
			THIS.SetFocus()
			THIS.Setcolumn("t_carteentete_traitement")
			change = true
			//THIS.event ue_update()
		END IF
		
	END IF
END IF

IF dwo.name = "t_plantrait" THEN
	
	if dw_carteentete.getItemNumber(dw_carteentete.getRow(),'t_carteentete_locktraitement') =  1 then return
			
	w_choix_phrase_type lw_open
	
	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau datastore sg","d_souscategoriephrase")
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau datastore g","ds_categoriephrase")
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau phrase","")
	Open(lw_open)
	
	ls_phrase = gnv_app.inv_entrepotglobal.of_retournedonnee("lien tableau phrase")
	
	If Isnull(ls_phrase) THEN ls_phrase = ""
	
	THIS.AcceptText()
	ls_phrase_orig = THIS.object.t_carteentete_traitement[row]
	If Isnull(ls_phrase_orig) THEN 
		ls_phrase_orig = ""
	ELSE
		ls_phrase_orig = ls_phrase_orig + "~r~n"
	END IF
	
	ls_phrase = ls_phrase_orig  +  ls_phrase
	
	THIS.object.t_carteentete_traitement[row] = ls_phrase
	
	dw_carteentete.AcceptText()
	change = true
	
end if

IF dwo.name = "t_xray" THEN 
	gf_captureortho(il_patid)
END IF

//if dwo.name = 't_carteentete_traitement' or & 
//	dwo.name = 't_carteentete_traitement1' or &
//	dwo.name = 't_carteentete_traitement2' or &
//	dwo.name = 't_carteentete_traitement3' then
//	setItem(row,'t_carteentete_datecree',today())
//	acceptText()
//end if
//IF dwo.name = "t_corrpanneau" THEN
//	gf_pat2xml(il_patid)
//	Opensheetwithparm(w_description,1,w_principal,2,layered!)
//	w_description.title = "Rapport de consultation"
//	opensheetwithparm(w_choix_consult,1,w_principal,2,layered!)		
//end if

IF dwo.name = "p_lock" THEN
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("typederapport","plantrait")
	open(w_password_unlock)
	IF MEssage.StringParm = "ok" THEN
		this.setitem( this.getrow() ,"t_carteentete_locktraitement",0)
		this.setitem( this.getRow(),"t_carteentete_datecree",1900-01-01)
		ll_personnel = long(gnv_app.inv_entrepotglobal.of_retournedonnee("personnelauth"))
		this.setitem( this.getrow() ,"t_carteentete_id_usersigne", ll_personnel)
		select isnull(nom,'') || ', ' || isnull(prenom,'') into :ls_user from t_personnels where id_personnel = :ll_personnel;
		this.setitem(this.getRow(),'usersigne',ls_user)
		dw_carteentete.object.t_carteentete_traitement.edit.displayonly = 'no'
		dw_carteentete.object.t_carteentete_traitement1.edit.displayonly = 'no'
		dw_carteentete.object.t_carteentete_traitement2.edit.displayonly = 'no'
		dw_carteentete.object.t_carteentete_traitement3.edit.displayonly = 'no'
//		this.settaborder( "t_carteentete_traitement",160)
//		this.settaborder( "t_carteentete_traitement1",170)
//		this.settaborder( "t_carteentete_traitement2",180)
//		this.settaborder( "t_carteentete_traitement3",190)
		change = true
	end if
end if


//IF dwo.name = "p_unlock" THEN
//	open(w_authuser)
//	ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authenuser",FALSE))
//	if ls_user <> 'Failed' and not isnull(ls_user) then
//		ll_iduser = long(ls_user)
//		this.setitem( this.getrow() ,"t_carteentete_locktraitement",1)
//		this.setitem(this.getrow(),"t_carteentete_id_usersigne",ll_iduser)
//		this.setitem( this.getRow(),"t_carteentete_datecree",today())
//		this.acceptText()
//		this.settaborder( "t_carteentete_traitement",0)
//		this.settaborder( "t_carteentete_traitement1",0)
//		this.settaborder( "t_carteentete_traitement2",0)
//		this.settaborder( "t_carteentete_traitement3",0)
//		select isnull(nom,'') || ', ' || isnull(prenom,'') into :ls_user from t_personnels where id_personnel = :ll_iduser;
//		this.setitem(this.getRow(),'usersigne',ls_user)
//		change = true
//	end if
//end if

end event

event itemchanged;call super::itemchanged;change = true
end event

event constructor;call super::constructor;string 	ls_texte_sna, ls_texte_snb, ls_texte_fma, ls_texte_imp, ls_texte_abop, ls_texte_liapg, ls_texte_cstage, ls_texte_gngome

//Vérifier s'il y a eu des customizations dans les options
SELECT texte_sna, texte_snb, texte_fma, texte_imp, texte_abop, texte_liapg, cstage, gngome
INTO 	:ls_texte_sna, :ls_texte_snb, :ls_texte_fma, :ls_texte_imp, :ls_texte_abop, :ls_texte_liapg, :ls_texte_cstage, :ls_texte_gngome
FROM 	t_options 
WHERE	ortho_id = :v_no_ortho ;

THIS.object.sna_t.text = ls_texte_sna
THIS.object.snb_t.text = ls_texte_snb
THIS.object.fma_t.text = ls_texte_fma
THIS.object.imp_t.text = ls_texte_imp
THIS.object.abop_t.text = ls_texte_abop
THIS.object.liagp_t.text = ls_texte_liapg
THIS.object.cstage_t.text = ls_texte_cstage
THIS.object.gngome_t.text = ls_texte_gngome

end event

event buttonclicked;call super::buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_torque'
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientidtorque",il_patid)
		opensheet(w_torque,w_principal,2,layered!)
	CASE 'b_analyse'
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("id_cartetraitplantrait", il_patid)
		opensheet(w_carte_plan_trait,w_principal,2,layered!)
	CASE 'b_rdv'
			dw_rdv.visible = true
	case 'b_color'
		uf_setcolor()
	case 'b_memo'
		
		long ll_idcarteentete
		string ls_memo
		
		ll_idcarteentete =  getItemNumber(row,'id_carteentete')
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("id_carteentete_memo", ll_idcarteentete)
		open(w_cartememo)
		select memo1 into :ls_memo from t_carteentete where id_carteentete = :ll_idcarteentete;
		dw_carteentete.setITem(row,'t_carteentete_memo1',ls_memo)
			
END CHOOSE
end event

event editchanged;call super::editchanged;change = true
end event

event doubleclicked;call super::doubleclicked;choose case dwo.name
	case "compute_1"
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("caller", "cartetx")
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("idpat_cartetx", string(il_patid))
		open(w_envoi_message)
end choose
end event

type dw_rdv from u_dw within tabpage_cartetrait
string tag = "resize=mr"
boolean visible = false
integer x = 2711
integer width = 887
integer height = 656
integer taborder = 11
string dataobject = "d_rdvcartetraitement"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event buttonclicked;call super::buttonclicked;if dwo.name = 'b_fermer' then dw_rdv.visible = false
end event

type tabpage_age from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Âge des comptes"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_statement1 st_statement1
dw_etatcompte dw_etatcompte
end type

on tabpage_age.create
this.st_statement1=create st_statement1
this.dw_etatcompte=create dw_etatcompte
this.Control[]={this.st_statement1,&
this.dw_etatcompte}
end on

on tabpage_age.destroy
destroy(this.st_statement1)
destroy(this.dw_etatcompte)
end on

type st_statement1 from statictext within tabpage_age
integer x = 1239
integer y = 700
integer width = 1769
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "This patient's has no due amount."
else
	this.text = "Ce patient n'a pas de montant dû."
end if
end event

type dw_etatcompte from u_dw within tabpage_age
integer width = 3598
integer height = 1740
integer taborder = 40
string title = "etatcompte"
string dataobject = "d_etatcompte"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;//pro_resize luo_size
//luo_size.uf_resizedw(this)

if v_langue = 'an' then
	object.t_title.text = 'Age of accounts'
	object.t_maison.text = 'Home:'
	object.t_bureau.text = 'Office:'
	object.t_total.text = 'Total'
	object.t_courant.text = 'Current'
	object.t_30.text = '30 days'
	object.t_60.text = '60 days'
	object.t_90.text = '90 days'
	object.t_printedon.text = 'Printed on'
end if
SetTransObject(SQLCA)
end event

type tabpage_etat from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "État de compte"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
ddlb_resp ddlb_resp
ddlb_etat ddlb_etat
dw_etatcomptepat1 dw_etatcomptepat1
end type

on tabpage_etat.create
this.ddlb_resp=create ddlb_resp
this.ddlb_etat=create ddlb_etat
this.dw_etatcomptepat1=create dw_etatcomptepat1
this.Control[]={this.ddlb_resp,&
this.ddlb_etat,&
this.dw_etatcomptepat1}
end on

on tabpage_etat.destroy
destroy(this.ddlb_resp)
destroy(this.ddlb_etat)
destroy(this.dw_etatcomptepat1)
end on

type ddlb_resp from u_ddlb within tabpage_etat
event ue_respinfo ( )
integer width = 1234
integer height = 828
integer taborder = 11
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event ue_respinfo();long i, ll_idresp
string ls_contact

of_reset()

// Ajout du choix tous

of_addItem("Tous",0)

// Ajout des responsables

DECLARE listresp CURSOR FOR
	SELECT id_contact, prenom + ' ' + nom from t_contact where patient_id = :il_patid;
	
OPEN listresp;

FETCH listresp INTO :ll_idresp, :ls_contact;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_contact,ll_idresp)

	FETCH listresp INTO :ll_idresp, :ls_contact;
	
LOOP

CLOSE listresp;

of_selectItem(1)
end event

event selectionchanged;call super::selectionchanged;dw_etatcomptepat1.event ue_retrieve(0)
end event

type ddlb_etat from u_ddlb within tabpage_etat
event ue_filldate ( )
integer x = 3017
integer width = 581
integer height = 592
integer taborder = 11
end type

event ue_filldate();date ldt_date
long ll_idetatcompte

of_reset()

if v_langue = 'an' then
	of_addItem("New",0)
else
	of_addItem("Nouveau",0)
end if

DECLARE listdate CURSOR FOR
	select dateetatcompte, id_etatcomptepat from t_etatcomptepat where patient_id = :il_patid;
	
OPEN listdate;

FETCH listdate INTO :ldt_date, :ll_idetatcompte;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(string(ldt_date,'dd/mm/yyyy'),ll_idetatcompte)
	
	FETCH listdate INTO :ldt_date, :ll_idetatcompte;

LOOP

CLOSE listdate;

of_selectItem(1)
end event

event selectionchanged;call super::selectionchanged;long ll_idetatcomptepat

ll_idetatcomptepat = ddlb_etat.of_getSelectedData()
dw_etatcomptepat1.event ue_retrieve(ll_idetatcomptepat)
end event

type dw_etatcomptepat1 from u_dw within tabpage_etat
event ue_update ( )
event ue_setrapetat ( )
event ue_retrieve ( long al_idetatcompte )
event ue_insert ( )
integer y = 104
integer width = 3598
integer height = 1636
integer taborder = 40
string title = "etatcomptepat1"
string dataobject = "d_etatcomptepat1"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();long ll_row, ll_patid, ll_idcont, ll_idetatcompte
string ls_etatnote, ls_msg
dec{2} ld_totfact, ld_facttot, ld_paietot, ld_factc, ld_paiec, ld_fact30, ld_paie30
dec{2} ld_fact60, ld_paie60
date ldt_lastpaie


ll_idetatcompte = ddlb_etat.of_getselectedData()

if ll_idetatcompte = 0 then
	
	if v_langue = 'an' then
		ls_msg = "Do you want to save this statement?"
	else
		ls_msg = "Désirez-vous sauvegarder votre état de compte?" 
	end if
	
	if messagebox("Question",ls_msg,Question!,YesNo!,2) = 1 then
		
		dw_etatcomptepat1.acceptText()
		ll_row = dw_etatcomptepat1.getRow()
		ls_etatnote = dw_etatcomptepat1.getITemString(ll_row,'t_etatcomptepat_noteetatcompte')
		ld_totfact = dw_etatcomptepat1.getITemNumber(ll_row,'totfact')
		ld_facttot = dw_etatcomptepat1.getITemNumber(ll_row,'facttot')
		ld_paietot = dw_etatcomptepat1.getITemNumber(ll_row,'paietot')
		ld_factc = dw_etatcomptepat1.getITemNumber(ll_row,'factc') 
		ld_paiec = dw_etatcomptepat1.getITemNumber(ll_row,'paiec') 
		ld_fact30 = dw_etatcomptepat1.getITemNumber(ll_row,'fact30') 
		ld_paie30 = dw_etatcomptepat1.getITemNumber(ll_row,'paie30') 
		ld_fact60 = dw_etatcomptepat1.getITemNumber(ll_row,'fact60') 
		ld_paie60 = dw_etatcomptepat1.getITemNumber(ll_row,'paie60') 
		ll_idcont = dw_etatcomptepat1.getITemNumber(ll_row,'contid')
		ldt_lastpaie = dw_etatcomptepat1.getITemDate(ll_row,'lastpaie')
		ll_patid = dw_etatcomptepat1.getITemNumber(ll_row,'patient_patient_id')
		
		insert into t_etatcomptepat(noteetatcompte, totfact, facttot, paietot, factc, paiec, fact30, paie30, fact60, paie60,
		                            id_contact, lastpaie, patient_id, dateetatcompte)
		values (:ls_etatnote,:ld_totfact,:ld_facttot,:ld_paietot, :ld_factc, :ld_paiec, :ld_fact30, :ld_paie30, :ld_fact60, :ld_paie60,
				  :ll_idcont, :ldt_lastpaie, :ll_patid, today());
		if SQLCA.SQLCode <> 0 then
			messagebox("Avertissement",SQLCA.SQLerrText,Information!,Ok!)
		end if
		
		ddlb_etat.event ue_filldate()
	
	end if

end if


//if this.update() = 1 then
//	commit using sqlca;
//	change = false
//else
//	rollback using sqlca;
//	error_type(50)
//end if
end event

event ue_setrapetat();long ll_id,ll_rapport[],i=1

il_rapetat[] = ll_rapport[]

DECLARE cur CURSOR FOR

	select id_etatcomptepat
	from t_etatcomptepat
	where patient_id = :il_patid;

OPEN cur;

FETCH cur INTO :ll_id;

DO WHILE SQLCA.SQLCODE = 0
	il_rapetat[i] = ll_id
	i++
	FETCH cur INTO :ll_id;
LOOP

CLOSE cur;

il_indrapetat = 1
end event

event ue_retrieve(long al_idetatcompte);long ll_nbrow,ll_lastid,ll_findrow,ll_iddent, ll_col, ll_contid, ll_idetatcompte
string ls_drtitre,ls_drprenom,ls_drnom, ls_namecol

if al_idetatcompte = 0 then
	setnull(ll_idetatcompte)
else
	ll_idetatcompte = al_idetatcompte
end if 

ll_contid = ddlb_resp.of_getSelectedData()
if ll_contid = 0 then setnull(ll_contid) 


ll_nbrow = this.retrieve(il_patid,ll_contid,ll_idetatcompte)
// si aucun formulaire, en ajoute un nouveau
//if ll_nbrow > 0 then
//
//	event ue_setrapetat()
//	il_indrapetat = upperbound(il_rapetat)
//	st_etat.event ue_title()
//	
//end if
//

end event

event ue_insert();//long ll_idcont
//dec{2} ld_totfact, ld_facttot, ld_paietot, ld_factc, ld_paiec, ld_fact30, ld_paie30, ld_fact60, ld_paie60
//date ldt_lastpaie
//
////gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientidchoixresp",il_patid)
////open(w_choixrespetat)
////ll_idcont = long(gnv_app.inv_entrepotglobal.of_retournedonnee("idreponsableetat"))
////
//ld_facttot = 0 
//ld_paietot = 0
//if ll_idcont = 0 then setnull(ll_idcont)
//
//SELECT	(select isnull(sum(isnull(montant,0)),0) 
//			 from 	factures_traitements 
//			 where traitement_id = traitements.traitement_id and 
//			 		 (id_contact = :ll_idcont or :ll_idcont is null)) as totfact,
//         (select isnull(sum(isnull(montant,0)),0) 
//			 from  factures_traitements 
//			 where traitement_id = traitements.traitement_id and 
//			      (id_contact = :ll_idcont or :ll_idcont is null) and 
//			 		 date_facture <= today()) as facttot,      
//         (select isnull(sum(isnull(montant_recu,0)),0) 
//			 from paiement 
//			 where traitement_patient_id = traitements.traitement_id and 
//			      (id_contact = :ll_idcont or :ll_idcont is null) and 
//			 		 date_paiement <= today()) as paietot,
//         (select isnull(sum(isnull(montant,0)),0) 
//			 from factures_traitements 
//			 where traitement_id = traitements.traitement_id and 
//			 		(id_contact = :ll_idcont or :ll_idcont is null) and 
//					 date_facture <= today() - 30) as factc,      
//         (select isnull(sum(isnull(montant_recu,0)),0) 
//			 from paiement 
//			 where traitement_patient_id = traitements.traitement_id and 
//			 		 (id_contact = :ll_idcont or :ll_idcont is null) and 
//					 date_paiement <= today()) as paiec ,
//         (select isnull(sum(isnull(montant,0)),0) 
//			 from factures_traitements 
//			 where traitement_id = traitements.traitement_id and 
//			 		 (id_contact = :ll_idcont or :ll_idcont is null) and 
//					  date_facture <= today() - 60) as fact30,      
//         (select isnull(sum(isnull(montant_recu,0)),0) 
//		    from paiement 
//			 where traitement_patient_id = traitements.traitement_id and 
//			 		 (id_contact = :ll_idcont or :ll_idcont is null) and 
//					  date_paiement <= today()) as paie30 ,
//         (select isnull(sum(isnull(montant,0)),0) 
//			 from factures_traitements 
//			 where traitement_id = traitements.traitement_id and 
//			 		 (id_contact = :ll_idcont or :ll_idcont is null) and 
//					  date_facture <= today() -90) as fact60,      
//         (select isnull(sum(isnull(montant_recu,0)),0) 
//			 from paiement 
//			 where traitement_patient_id = traitements.traitement_id and 
//			       (id_contact = :ll_idcont or :ll_idcont is null) and 
//					  date_paiement <= today()) as paie60,
//		   (select max(date_paiement) from paiement where traitement_patient_id = traitements.traitement_id) as lastpaie
//into :ld_totfact, :ld_facttot, :ld_paietot, :ld_factc, :ld_paiec, :ld_fact30, :ld_paie30, :ld_fact60, :ld_paie60, :ldt_lastpaie
//FROM     patient  INNER JOIN traitements ON traitements.patient_id = patient.patient_id                             
//						INNER JOIN t_contact ON patient.patient_id = t_contact.patient_id
//WHERE 	facttot > paietot and
//         patient.patient_id = :il_patid AND
//         (t_contact.id_contact = :ll_idcont OR :ll_idcont is null);
//
//
//if ld_facttot > ld_paietot then
//
//	insert into t_etatcomptepat(patient_id, totfact, facttot, paietot, factc, paiec, fact30, paie30, fact60, paie60, id_contact, lastpaie) 
//	values(:il_patid,:ld_totfact, :ld_facttot, :ld_paietot, :ld_factc, :ld_paiec, :ld_fact30, :ld_paie30, :ld_fact60, :ld_paie60, :ll_idcont, :ldt_lastpaie);
//	if error_type(-1) = 1 then
//		commit using sqlca;
//		event ue_retrieve()
//		change = true
//	else
//		rollback using sqlca;
//		error_type(50)
//	end if
//	
//else
//	
//	if v_langue = 'an' then
//		messagebox("Warning!","It's impossible to create a statement because this patient doesn't have unpaid balance",Information!,Ok!)
//	else
//		messagebox("Attention!","Il est impossible de créer un état de compte, car ce patient n'a pas de solde impayé.",Information!,Ok!)
//	end if
//
//end if
//
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	object.t_dernpaie.text = 'Last payment~nreceived'
	object.t_traitcost.text = 'Treatment cost'
	object.t_balance.text = 'Balance'
	object.t_current.text = 'Current'
	object.t_31days.text = '31-60 days'
	object.t_61days.text = '61-90 days'
	object.t_90days.text = '90 days +'
	object.t_ref.text = 'Reference:'
	object.t_file.text = 'File:'
	object.t_resp.text = 'Responsible party:'
end if
SetTransObject(SQLCA)
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event resize;call super::resize;string ls_y, ls_height, ls_header

ls_y = object.r_1.y
ls_height = object.r_1.height
ls_header = string(long(ls_y) + long(ls_height))

Object.DataWindow.header.Height = ls_header
end event

type tabpage_rappre from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Rapport préliminaire"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
p_lock p_lock
pb_13 pb_13
pb_8 pb_8
pb_7 pb_7
st_rappre st_rappre
pb_6 pb_6
pb_5 pb_5
p_unlock p_unlock
dw_rapppre dw_rapppre
end type

on tabpage_rappre.create
this.p_lock=create p_lock
this.pb_13=create pb_13
this.pb_8=create pb_8
this.pb_7=create pb_7
this.st_rappre=create st_rappre
this.pb_6=create pb_6
this.pb_5=create pb_5
this.p_unlock=create p_unlock
this.dw_rapppre=create dw_rapppre
this.Control[]={this.p_lock,&
this.pb_13,&
this.pb_8,&
this.pb_7,&
this.st_rappre,&
this.pb_6,&
this.pb_5,&
this.p_unlock,&
this.dw_rapppre}
end on

on tabpage_rappre.destroy
destroy(this.p_lock)
destroy(this.pb_13)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.st_rappre)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.p_unlock)
destroy(this.dw_rapppre)
end on

type p_lock from u_p within tabpage_rappre
integer x = 1856
integer y = 4
integer width = 110
integer height = 76
string picturename = "C:\ii4net\orthotek\images\lock.jpg"
end type

event clicked;call super::clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("typederapport","rapppre")

// Demander le mot de passe
w_password_unlock lw_win
OpenWithParm(lw_win, "")
IF MEssage.StringParm = "ok" THEN
//	ib_admin = TRUE
	p_unlock.visible = TRUE
	p_lock.visible = FALSE
	dw_rapppre.setItem(dw_rapppre.getRow(),'locked',0)
END IF
end event

type pb_13 from picturebutton within tabpage_rappre
integer x = 2098
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Clear!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;if error_type(240) = 1 then
	dw_rapppre.deleteRow(dw_rapppre.getRow())
	dw_rapppre.event ue_update()
	dw_rapppre.event ue_setrappre()
	dw_rapppre.event ue_affinfo()
	st_rappre.event ue_title()
end if
end event

type pb_8 from picturebutton within tabpage_rappre
integer x = 3401
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRLast!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indraptraitreq = upperbound(il_raptraitreq)
dw_rapppre.event ue_affinfo()
st_rappre.event ue_title()
end event

type pb_7 from picturebutton within tabpage_rappre
integer x = 3301
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRNext!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indrapport++ 
if il_indrapport > upperbound(il_rapport) then il_indrapport = upperbound(il_rapport)
dw_rapppre.event ue_affinfo()
st_rappre.event ue_title()
end event

type st_rappre from statictext within tabpage_rappre
event ue_title ( )
integer x = 2405
integer y = 8
integer width = 891
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Rapport préliminaire"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_title();integer i,li_nbass,z = 0
long ll_id

li_nbass = upperbound(il_rapport)

if dw_rapppre.getRow() > 0 then
	dw_rapppre.setFilter("t_consultations_id = " + string(il_rapport[il_indrapport]))
	dw_rapppre.Filter()
	
	if v_langue = 'an' then
		this.text = 'Form ' + string(il_indrapport) + ' of ' + string(li_nbass)
	else
		this.text = 'Formulaire ' + string(il_indrapport) + ' de ' + string(li_nbass)
	end if
	
	//Locker le formulaire si la date est passée
	
	IF isnull(il_admin) THEN
		p_unlock.visible = TRUE
		p_lock.visible = FALSE
		dw_rapppre.setItem(dw_rapppre.getRow(),'locked',0)
	else
		if daysafter(dw_rapppre.Object.t_consultations_datecreer[dw_rapppre.getRow()],today()) >= il_admin THEN
			p_unlock.visible = FALSE
			p_lock.visible = TRUE
			dw_rapppre.setItem(dw_rapppre.getRow(),'locked',1)
		ELSE
			p_unlock.visible = TRUE
			p_lock.visible = FALSE
			dw_rapppre.setItem(dw_rapppre.getRow(),'locked',0)
		END IF
	end if
end if
end event

type pb_6 from picturebutton within tabpage_rappre
integer x = 2299
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRPrior!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indrapport --
if il_indrapport <= 0 then il_indrapport = 1
dw_rapppre.event ue_affinfo()
st_rappre.event ue_title()
end event

type pb_5 from picturebutton within tabpage_rappre
integer x = 2199
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRFirst!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indrapport = 1
dw_rapppre.event ue_affinfo()
st_rappre.event ue_title()
end event

type p_unlock from u_p within tabpage_rappre
integer x = 1856
integer y = 4
integer width = 110
integer height = 76
string picturename = "C:\ii4net\orthotek\images\unlock.jpg"
end type

type dw_rapppre from u_dw within tabpage_rappre
event ue_update ( )
event ue_insert ( )
event ue_retrieve ( )
event ue_setrappre ( )
event ue_affinfo ( )
integer width = 3598
integer height = 1740
integer taborder = 40
string title = "rapppre"
string dataobject = "d_rapppre"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();string ls_surveru, ls_surhoru, ls_artouvu
long ll_row

accepttext()
if this.update() = 1 then
	ll_row = dw_rapppre.getRow()
	if ll_row > 0 then
		ls_surveru = dw_rapppre.getItemString(ll_row, 'surveru')
		ls_surhoru = dw_rapppre.getItemString(ll_row, 'surhoru')
		ls_artouvu = dw_rapppre.getItemString(ll_row, 'artouvu')
		
		update t_options set surveru = :ls_surveru,
									surhoru = :ls_surhoru,
									artouvu = :ls_artouvu
							where ortho_id = :v_no_ortho;
	end if
	
	commit using SQLCA;
else
	rollback;
	error_type(50)
end if
change = false
end event

event ue_insert();insert into t_consultations(flag,patient_id,id_dentist,datecreer,heurecreer,surveru,surhoru,artouvu)
(select 'p',:il_patid,:il_dentrapppre,today(),now(),isnull(surveru, 'p'),isnull(surhoru, 't'),isnull(artouvu, 't') from t_options where ortho_id = :v_no_ortho);
if error_type(-1) = 1 then
	commit using sqlca;
	event ue_retrieve()
	change = true
else
	rollback using sqlca;
	error_type(50)
end if
end event

event ue_retrieve();long ll_nbrow,ll_lastid,ll_findrow,ll_iddent, ll_col
string ls_drtitre,ls_drprenom,ls_drnom, ls_namecol

ll_nbrow = this.retrieve(il_patid)
// si aucun formulaire, en ajoute un nouveau
if ll_nbrow > 0 then
//	event ue_insert()
//	this.retrieve(il_patid)
//	p_unlock.visible = TRUE
//	p_lock.visible = FALSE
//	
//	dw_rapppre.enabled = TRUE
	

	select id_dentist into :ll_iddent from patient where patient_id = :il_patid;
	if isnull(ll_iddent) or ll_iddent = 0 then
		messagebox("Avertissement","Ce patient n'a pas de dentiste associé à son dossier.",Information!, OK!)
	end if
	
	// Coordonnées du spécialiste
	if isnull(is_spec) or is_spec = '' then
		select det_suf,det_prenom,det_nom into :ls_drtitre,:ls_drprenom,:ls_drnom from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :il_patid;
		is_spec = ls_drtitre+' '+ls_drprenom+' '+ls_drnom
	end if
	// construit la table des traitreq
	event ue_setrappre()
	// focus sur le dernier fomulaire
//	select max(id) into :ll_lastid from t_consultations where patient_id = :il_patid;
//	ll_findrow = this.find('t_consultations_id = ' + string(ll_lastid),1,ll_nbrow)
//	this.scrolltorow(ll_findrow)
	// inscrit le titre
	il_indrapport = upperbound(il_rapport)
	st_rappre.event ue_title()
	//dw_assurance.event ue_langue()
	
	// Mettre les champs
	
	this.event ue_affinfo()
end if

end event

event ue_setrappre();long ll_id,ll_rapport[],i=1

il_rapport[] = ll_rapport[]

DECLARE cur CURSOR FOR

	select id
	from t_consultations
	where patient_id = :il_patid AND
			flag = 'p';

OPEN cur;

FETCH cur INTO :ll_id;

DO WHILE SQLCA.SQLCODE = 0
	il_rapport[i] = ll_id
	i++
	FETCH cur INTO :ll_id;
LOOP

CLOSE cur;

il_indrapport = 1
end event

event ue_affinfo();//long ll_iddentist, ll_idsal
//string ls_drnom, ls_drprenom, ls_sal
//time lt_heure
//date ldt_date
//
//ll_iddentist = getItemNumber(getRow(),'t_consultations_id_dentist')
//select isnull(det_nom,''), isnull(det_prenom,''), id_sal into :ls_drnom, :ls_drprenom, :ll_idsal from t_dentists where id_dentist = :ll_iddentist;
//select salutation into :ls_sal from t_salutation where id_sal = :ll_idsal;
//st_dentist2.text = ls_sal + ' ' + ls_drprenom + ' ' + ls_drnom
//lt_heure = getITemTime(getRow(),'t_consultations_heurecreer')
//st_heure2.text = string(lt_heure,"hh:mm")
//ldt_date = getItemDate(getRow(),'t_consultations_datecreer')
//st_date2.text = string(ldt_date,"dd/mm/yyyy")
end event

event constructor;//pro_resize luo_size
//luo_size.uf_resizedw(this)

if v_langue = 'an' then
	//object.t_title.text = 'PRELIMINARY REPORT'
	modify("expre1.checkbox.text = 'An Orthodontic treatment has been assigned'")
	modify("expre2.checkbox.text = 'The patient has been placed on a recall list and will be examined'")
	modify("t_ds.text = 'in'")
	modify("t_mois.text = 'month'")
	modify("t_malo.checkbox.text = 'malocclusion'")
	modify("mc1.checkbox.text = 'class 1'")
	modify("mc2d1.checkbox.text = 'class 2 div 1'")
	modify("mc2s2.checkbox.text = 'class 2 div 2'")
	modify("mc3.checkbox.text = 'class 3'")
	modify("exarcmaxant.checkbox.text = 'excess space in anterior jawbone arcade'")
	modify("exarcmaxpos.checkbox.text = 'excess space in posterior jawbone arcade'")
	modify("exarcmanant.checkbox.text = 'excess space in anterior mandibulary arcade'")
	modify("exarcmanpos.checkbox.text = 'excess space in posterior mandibulary arcade'")
	modify("surhor.checkbox.text = 'horyzontal overhang'")
	modify("surver.checkbox.text = 'vertical overhang'")
	modify("artouv.checkbox.text = 'open articulation'")
	modify("chearcmaxant.checkbox.text = 'overlapping anterior jawbone arcade'")
	modify("chearcmaxpos.checkbox.text = 'overlapping posterior jawbone arcade'")
	modify("chearcmanant.checkbox.text = 'overlapping anterior mandibulary arcade'")
	modify("chearcmanpos.checkbox.text = 'overlapping posterior mandibulary arcade'")
	modify("occant.checkbox.text = 'anterior crossed occlusion'")
	modify("occpos.checkbox.text = 'posterior crossed occlusion'")
	modify("occpos.checkbox.text = 'posterior crossed occlusion'")
	modify("devligmed.checkbox.text = 'deviation of median lines'")
	modify("t_remarque.text = 'Remarks :'")
end if
SetTransObject(SQLCA)
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

type tabpage_traitreq from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Traitement requis"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
pb_14 pb_14
pb_4 pb_4
pb_3 pb_3
st_title st_title
pb_1 pb_1
pb_2 pb_2
p_locktraite p_locktraite
p_unlocktraite p_unlocktraite
dw_traitreq dw_traitreq
end type

on tabpage_traitreq.create
this.pb_14=create pb_14
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_title=create st_title
this.pb_1=create pb_1
this.pb_2=create pb_2
this.p_locktraite=create p_locktraite
this.p_unlocktraite=create p_unlocktraite
this.dw_traitreq=create dw_traitreq
this.Control[]={this.pb_14,&
this.pb_4,&
this.pb_3,&
this.st_title,&
this.pb_1,&
this.pb_2,&
this.p_locktraite,&
this.p_unlocktraite,&
this.dw_traitreq}
end on

on tabpage_traitreq.destroy
destroy(this.pb_14)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_title)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.p_locktraite)
destroy(this.p_unlocktraite)
destroy(this.dw_traitreq)
end on

type pb_14 from picturebutton within tabpage_traitreq
integer x = 2098
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Clear!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;string	ls_user
long		ll_iduser

if error_type(240) = 1 then
	//2008-10-13 ne plus deleter, plutot caceller quand c'est dans le passé
	//
	long	ll_row
	ll_row = dw_traitreq.getRow()
	If ll_row > 0 THEN
		
		//2008-11-19 Ajout de la demande de mot de passe
		//Demander le mot de passe de l'utilisateur en cours
		open(w_authuser)
		ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authenuser",FALSE))
		if ls_user <> 'Failed' then
			ll_iduser = long(ls_user)
		ELSE
			RETURN
		end if		
		
		IF p_locktraite.visible = TRUE THEN
			dw_traitreq.object.t_consultations_cancelle[ll_row] = 1
			dw_traitreq.object.t_consultations_date_cancelle[ll_row] = datetime(today())
			dw_traitreq.object.t_consultations_user_cancelle[ll_row] = ll_iduser
		ELSE
			dw_traitreq.deleteRow(dw_traitreq.getRow())
		END IF
		dw_traitreq.event ue_update()
		dw_traitreq.event ue_settraitreq()
		dw_traitreq.event ue_affinfo()
		st_title.event ue_title()
	END IF
end if
end event

type pb_4 from picturebutton within tabpage_traitreq
integer x = 3401
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
boolean map3dcolors = true
end type

event clicked;if ib_modeajouttraitreq = false then
	il_indraptraitreq = upperbound(il_raptraitreq)
	dw_traitreq.event ue_affinfo()
	st_title.event ue_title()
end if
end event

type pb_3 from picturebutton within tabpage_traitreq
integer x = 3305
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
boolean map3dcolors = true
end type

event clicked;if ib_modeajouttraitreq = false then
	il_indraptraitreq++ 
	if il_indraptraitreq > upperbound(il_raptraitreq) then il_indraptraitreq = upperbound(il_raptraitreq)
	dw_traitreq.event ue_affinfo()
	st_title.event ue_title()
end if
end event

type st_title from statictext within tabpage_traitreq
event ue_title ( )
integer x = 2400
integer y = 12
integer width = 891
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Traitement requis"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_title();integer i,li_nbass,z = 0
long ll_id
n_signature luo_sign

IF dw_traitreq.getrow() > 0 THEN
	li_nbass = upperbound(il_raptraitreq[])
	
	dw_traitreq.setFilter("t_consultations_id = " + string(il_raptraitreq[il_indraptraitreq]))
	dw_traitreq.Filter()
	
   luo_sign.of_affichesign( dw_traitreq, 1, il_raptraitreq[il_indraptraitreq])

	if v_langue = 'an' then
		this.text = 'Form ' + string(il_indraptraitreq) + ' of ' + string(li_nbass)
	else
		this.text = 'Formulaire ' + string(il_indraptraitreq) + ' de ' + string(li_nbass)
	end if
	
	//Locker le formulaire si la date est passée
	
	if ib_modeajouttraitreq then
		p_unlocktraite.visible = TRUE
		p_locktraite.visible = FALSE
		dw_traitreq.setItem(dw_traitreq.GetRow(),'locked',0)
//		dw_traitreq.setTabOrder("t_consultations_id_dentist",10)
	else
		if isnull(il_admin_traite) then
			p_unlocktraite.visible = TRUE
			p_locktraite.visible = FALSE
			dw_traitreq.setItem(dw_traitreq.GetRow(),'locked',0)
//			dw_traitreq.setTabOrder("t_consultations_id_dentist",10)
		else
			IF daysafter(dw_traitreq.Object.t_consultations_datecreer[dw_traitreq.GetRow()], today()) >= il_admin_traite THEN
				p_unlocktraite.visible = FALSE
				p_locktraite.visible = TRUE
				dw_traitreq.setItem(dw_traitreq.GetRow(),'locked',1)
//				dw_traitreq.setTabOrder("t_consultations_id_dentist",0)
			ELSE
				p_unlocktraite.visible = TRUE
				p_locktraite.visible = FALSE
				dw_traitreq.setItem(dw_traitreq.GetRow(),'locked',0)
//				dw_traitreq.setTabOrder("t_consultations_id_dentist",10)
			END IF
		end if
	end if
	
ELSE
	if v_langue = 'an' then
		this.text = 'Form 0 of 0' 
	else
		this.text = 'Formulaire 0 de 0' 
	end if
	
END IF
end event

type pb_1 from picturebutton within tabpage_traitreq
integer x = 2299
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
boolean map3dcolors = true
end type

event clicked;if ib_modeajouttraitreq = false then
	il_indraptraitreq --
	if il_indraptraitreq <= 0 then il_indraptraitreq = 1
	dw_traitreq.event ue_affinfo()
	st_title.event ue_title()
end if
end event

type pb_2 from picturebutton within tabpage_traitreq
integer x = 2199
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRFirst!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;//dw_traitreq.ScrollToRow(1)
if ib_modeajouttraitreq = false then
	dw_traitreq.event ue_affinfo()
	il_indraptraitreq = 1
	st_title.event ue_title()
end if
end event

type p_locktraite from u_p within tabpage_traitreq
integer x = 1856
integer y = 4
integer width = 110
integer height = 76
string picturename = "C:\ii4net\orthotek\images\lock.jpg"
end type

event clicked;call super::clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("typederapport","traitreq")

// Demander le mot de passe
w_password_unlock lw_win
OpenWithParm(lw_win, "")
IF MEssage.StringParm = "ok" THEN
//	ib_admin_traite = TRUE
	p_unlocktraite.visible = TRUE
	p_locktraite.visible = FALSE
	dw_traitreq.setItem(dw_traitreq.GetRow(),'locked',0)
END IF
end event

type p_unlocktraite from u_p within tabpage_traitreq
integer x = 1856
integer y = 4
integer width = 110
integer height = 76
string picturename = "C:\ii4net\orthotek\images\unlock.jpg"
end type

type dw_traitreq from u_dw within tabpage_traitreq
event ue_update ( )
event ue_retrieve ( )
event ue_settraitreq ( )
event ue_insert ( )
event ue_affinfo ( )
integer width = 3598
integer height = 1740
integer taborder = 40
string title = "traitreq"
string dataobject = "d_traitreq"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();accepttext()
if this.update() = 1 then 
	commit using SQLCA;
	ib_modeajouttraitreq = false
	
	// Regarder si l'on barre le cadenais
	if il_admin_traite = 0 then
		p_unlocktraite.visible = FALSE
		p_locktraite.visible = TRUE
		dw_traitreq.setItem(dw_traitreq.GetRow(),'locked',1)
	end if
	
else
	rollback;
	error_type(50)
end if
change = false
end event

event ue_retrieve();long ll_nbrow,ll_lastid,ll_findrow,ll_iddent, ll_cachechart
string ls_drtitre,ls_drprenom,ls_drnom, ls_exam, ls_test, ls_dentlangue
n_signature luo_sign

select cachechart into :ll_cachechart from t_options where ortho_id = :v_no_ortho;

ll_nbrow = this.retrieve(il_patid)
// si aucun formulaire, en ajoute un nouveau
if ll_nbrow > 0 then
//	event ue_insert()
//	this.retrieve(il_patid)
//	p_unlocktraite.visible = TRUE
//	p_locktraite.visible = FALSE	
//	dw_traitreq.enabled = TRUE	

	// Mettre la signature si s'applique
	luo_sign.of_affichesign( dw_traitreq, 1, dw_traitreq.getitemnumber(dw_traitreq.rowcount(), 't_consultations_id'))
	
	select id_dentist into :ll_iddent from patient where patient_id = :il_patid;
	if isnull(ll_iddent) or ll_iddent = 0 then
		messagebox("Avertissement","Ce patient n'a pas de dentiste associé à son dossier.",Information!, OK!)
	end if
	
	// Coordonnées du spécialiste
	if isnull(is_spec) or is_spec = '' then
		select det_suf,det_prenom,det_nom,det_langue into :ls_drtitre,:ls_drprenom,:ls_drnom,:ls_dentlangue from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :il_patid;
		is_spec = ls_drtitre+' '+ls_drprenom+' '+ls_drnom
	end if
	
	// Affaire du desc

	if is_exam = "" then is_exam = describe("exam.checkbox.text")
	ls_test = getItemString(getRow(),'t_consultations_champdesc')
	// modify("exam.checkbox.text = '" + is_exam + ' ' + ls_test + "'")
	if ls_test = "" then
		if v_langue = 'an' then
			modify("exam.checkbox.text = 'Exam'")
		else
			modify("exam.checkbox.text = 'Examen'")
		end if
		this.Object.exam.Color = rgb(0,0,0)
	else
		modify("exam.checkbox.text = '" + ls_test + "'")
		this.Object.exam.Color = rgb(255,0,0)
	end if
	
	// Restauration
	
	ls_test = getItemString(getRow(),'t_consultations_champres')
	if isnull(ls_test) = false and ls_test <> "" then
		modify("rest.checkbox.text = '" + ls_test + "'")
	end if
	
	select cachechart into :ll_cachechart from t_options where ortho_id = :v_no_ortho;
	if ll_cachechart = 1 then
	//	dw_traitreq.object.t_gauche.visible = false
	//	dw_traitreq.object.t_droite.visible = false
		dw_traitreq.object.l_1.visible = false
		dw_traitreq.object.l_2.visible = false
	else
	//	dw_traitreq.object.t_gauche.visible = true
	//	dw_traitreq.object.t_droite.visible = true
		dw_traitreq.object.l_1.visible = true
		dw_traitreq.object.l_2.visible = true
	end if
	
	// construit la table des traitreq
	event ue_settraitreq()
	// focus sur le dernier fomulaire
//	select max(id) into :ll_lastid from t_consultations where patient_id = :il_patid;
//	ll_findrow = this.find('t_consultations_id = ' + string(ll_lastid),1,ll_nbrow)
//	this.scrolltorow(ll_findrow)
	// inscrit le titre
	
	il_indraptraitreq = upperbound(il_raptraitreq)
	st_title.event ue_title()
	
	// Mettre les champs
	
	this.event ue_affinfo()
end if
end event

event ue_settraitreq();long ll_id,ll_rapport[],i=1

il_raptraitreq[] = ll_rapport[]

DECLARE cur CURSOR FOR

	select id
	from t_consultations
	where patient_id = :il_patid AND
			flag = 't'
	order by id asc;

OPEN cur;

FETCH cur INTO :ll_id;

DO WHILE SQLCA.SQLCODE = 0
	il_raptraitreq[i] = ll_id
	i++
	FETCH cur INTO :ll_id;
LOOP

CLOSE cur;

il_indraptraitreq = 1

end event

event ue_insert();ib_modeajouttraitreq = true
insert into t_consultations(flag,patient_id,d11,d12,d13,d14,d15,d16,d17,d18,d21,d22,d23,d24,d25,d26,d27,d28,d31,d32,d33,d34,d35,d36,d37,d38,d41,d42,d43,d44,d45,d46,d47,d48,d51,d52,d53,d54,d55,d61,d62,d63,d64,d65,d71,d72,d73,d74,d75,d81,d82,d83,d84,d85,datecreer,heurecreer,id_dentist,surveru,surhoru,artouvu)
values('t',:il_patid,11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,28,31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48,51,52,53,54,55,61,62,63,64,65,71,72,73,74,75,81,82,83,84,85,today(),now(),:il_denttraitreq,'t','t','t');
if error_type(-1) = 1 then
	commit using sqlca;
	event ue_retrieve()
	change = true
else
	rollback using sqlca;
	error_type(50)
end if
end event

event ue_affinfo();//long ll_iddentist, ll_idsal
//string ls_drnom, ls_drprenom, ls_sal
//time lt_heure
//date ldt_date
//
//ll_iddentist = getItemNumber(getRow(),'t_consultations_id_dentist')
//select isnull(det_nom,''), isnull(det_prenom,''), id_sal into :ls_drnom, :ls_drprenom, :ll_idsal from t_dentists where id_dentist = :ll_iddentist;
//select salutation into :ls_sal from t_salutation where id_sal = :ll_idsal;
//st_dentist.text = ls_sal + ' ' + ls_drprenom + ' ' + ls_drnom
//lt_heure = getITemTime(getRow(),'t_consultations_heurecreer')
//st_heure.text = string(lt_heure,"hh:mm")
//ldt_date = getItemDate(getRow(),'t_consultations_datecreer')
//st_date.text = string(ldt_date,"dd/mm/yyyy")


end event

event constructor;//pro_resize luo_size
//luo_size.uf_resizedw(this)

long ll_cachechart

string ls_0fr,ls_1fr,ls_2fr,ls_3fr,ls_4fr,ls_5fr,ls_6fr,ls_7fr,ls_8fr,ls_9fr,ls_10fr
string ls_0en,ls_1en,ls_2en,ls_3en,ls_4en,ls_5en,ls_6en,ls_7en,ls_8en,ls_9en,ls_10en

select cachechart into :ll_cachechart from t_options where ortho_id = :v_no_ortho;

select traitreq0fr,traitreq1fr,traitreq2fr,traitreq3fr,traitreq4fr,traitreq5fr,traitreq6fr,traitreq7fr,traitreq8fr,traitreq9fr,traitreq10fr,
		 traitreq0en,traitreq1en,traitreq2en,traitreq3en,traitreq4en,traitreq5en,traitreq6en,traitreq7en,traitreq8en,traitreq9en,traitreq10en
into :ls_0fr,:ls_1fr,:ls_2fr,:ls_3fr,:ls_4fr,:ls_5fr,:ls_6fr,:ls_7fr,:ls_8fr,:ls_9fr,:ls_10fr,:ls_0en,:ls_1en,:ls_2en,:ls_3en,:ls_4en,:ls_5en,
	  :ls_6en,:ls_7en,:ls_8en,:ls_9en,:ls_10en
from t_options 
where ortho_id = :v_no_ortho;

if v_langue = 'an' then
	modify("t_title.text = 'REQUIRED TREATMENT'")
	modify("t_radio.text = 'Please proceed with the following: '")
	modify("t_restauration.text = ': Restoration'")
	modify("exam.checkbox.text = 'Examination'")
	modify("prophy.checkbox.text = 'Fluoride application and prophylaxis'")
	modify("radio.checkbox.text = 'Please send the most recent radios to our office'")
	modify("hygiene.checkbox.text = 'The oral hygiene is inadequate. Please help us improve the oral hygiene on next appointment'")
	modify("t_alapro.text = 'on next appointment'")
	modify("rest.checkbox.text = 'Restoration'")
	modify("extrait.checkbox.text = 'Please, extract:'")
	modify("autchir.checkbox.text = 'Other surgery:'")
	modify("commpat.checkbox.text = 'Please contact the patient to schedule an appointment'")
	modify("commrab.checkbox.text = 'The patient will contact your office'")
	modify("retradio.checkbox.text = 'Please return the radio at the end of the treatment'")
	modify("t_consultations_panremispatient.checkbox.text = 'Copy of the panoramic delivered to your patient'")
	modify("t_droite.text = 'Right'")
	modify("t_droite1.text = 'Right'")
	modify("t_gauche.text = 'Left'")
	modify("t_gauche1.text = 'Left'")
	modify("t_remarque.text = 'Commentary :'")
	modify("t_cancelle.text = 'Cancelled'")
	modify("t_consultations_copietransparcourriel.checkbox.text = 'Copy of the panoramic delvered to you by email'")
		
	if isnull(ls_0en) = false and ls_0en <> "" then
		modify("t_radio.text = ~"" + ls_0en + "~"")
	end if
	if isnull(ls_1en) = false and ls_1en <> "" then
		modify("exam.checkbox.text = ~"" + ls_1en + "~"")
	end if
	if isnull(ls_2en) = false and ls_2en <> "" then
		modify("prophy.checkbox.text = ~"" + ls_2en + "~"")
	end if
	if isnull(ls_3en) = false and ls_3en <> "" then
		modify("radio.checkbox.text = ~"" + ls_3en + "~"")
	end if
	if isnull(ls_4en) = false and ls_4en <> "" then
	//	ls_4en = gnv_app.inv_string.of_globalreplace(ls_4en, "'", "`")
		modify("hygiene.checkbox.text = ~"" + ls_4en + "~"")
		modify("t_alapro.text = ''")
	end if
	if isnull(ls_5en) = false and ls_5en <> "" then
		modify("rest.checkbox.text = ~"" + ls_5en + "~"")
	end if
	if isnull(ls_6en) = false and ls_6en <> ""  then
		modify("extrait.checkbox.text = ~"" + ls_6en + "~"")
	end if
	if isnull(ls_7en) = false and ls_7en <> "" then
		modify("autchir.checkbox.text = ~"" + ls_7en + "~"")
	end if
	if isnull(ls_8en) = false and ls_8en <> "" then
		modify("commpat.checkbox.text = ~"" + ls_8en + "~"")
	end if
	if isnull(ls_9en) = false and ls_9en <> "" then
		modify("commrab.checkbox.text = ~"" + ls_9en + "~"")
	end if
	if isnull(ls_10en) = false and ls_10en <> "" then
		modify("retradio.checkbox.text = ~"" + ls_10en + "~"")
	end if
else
	if isnull(ls_0fr) = false and ls_0fr <> "" then
		modify("t_radio.text = ~"" + ls_0fr + "~"")
	end if
	if isnull(ls_1fr) = false and ls_1fr <> "" then
		modify("exam.checkbox.text = ~"" + ls_1fr + "~"")
	end if
	if isnull(ls_2fr) = false and ls_2fr <> "" then
		modify("prophy.checkbox.text = ~"" + ls_2fr + "~"")
	end if
	if isnull(ls_3fr) = false and ls_3fr <> "" then
		modify("radio.checkbox.text = ~"" + ls_3fr + "~"")
	end if
	if isnull(ls_4fr) = false and ls_4fr <> "" then
		ls_4fr = gnv_app.inv_string.of_globalreplace(ls_4fr, "'", "`")
		modify("hygiene.checkbox.text = ~"" + ls_4fr + "~"")
		modify("t_alapro.text = ''")
	end if
	if isnull(ls_5fr) = false and ls_5fr <> "" then
		modify("rest.checkbox.text = ~"" + ls_5fr + "~"")
	end if
	if isnull(ls_6fr) = false and ls_6fr <> "" then
		modify("extrait.checkbox.text = ~"" + ls_6fr + "~"")
	end if
	if isnull(ls_7fr) = false and ls_7fr <> "" then
		modify("autchir.checkbox.text = ~"" + ls_7fr + "~"")
	end if
	if isnull(ls_8fr) = false and ls_8fr <> "" then
		modify("commpat.checkbox.text = ~"" + ls_8fr + "~"")
	end if
	if isnull(ls_9fr) = false and ls_9fr <> "" then
		modify("commrab.checkbox.text = ~"" + ls_9fr + "~"")
	end if
	if isnull(ls_10fr) = false and ls_10fr <> "" then
		modify("retradio.checkbox.text = ~"" + ls_10fr + "~"")
	end if
end if

if ll_cachechart = 1 then
//	dw_traitreq.object.t_gauche.visible = false
//	dw_traitreq.object.t_droite.visible = false
	dw_traitreq.object.l_1.visible = false
	dw_traitreq.object.l_2.visible = false
else
//	dw_traitreq.object.t_gauche.visible = true
//	dw_traitreq.object.t_droite.visible = true
	dw_traitreq.object.l_1.visible = true
	dw_traitreq.object.l_2.visible = true
end if

SetTransObject(SQLCA)
end event

event clicked;string ls_protect
//messagebox('Name',string(dwo.name))

if row < 0 then return 0

if getItemNumber(row,'locked') = 0 then 

	SetRedraw(false)
	Choose case dwo.name
		case 't_consultations_d11'
			if getitemnumber(row,'t_consultations_e11') = 1 then
				setitem(row,'t_consultations_e11',0)
			else
				setitem(row,'t_consultations_e11',1)
			end if
		case 't_consultations_d12'
			if getitemnumber(row,'t_consultations_e12') = 1 then
				setitem(row,'t_consultations_e12',0)
			else
				setitem(row,'t_consultations_e12',1)
			end if
		case 't_consultations_d13'
			if getitemnumber(row,'t_consultations_e13') = 1 then
				setitem(row,'t_consultations_e13',0)
			else
				setitem(row,'t_consultations_e13',1)
			end if
		case 't_consultations_d14'
			if getitemnumber(row,'t_consultations_e14') = 1 then
				setitem(row,'t_consultations_e14',0)
			else
				setitem(row,'t_consultations_e14',1)
			end if
		case 't_consultations_d15'
			if getitemnumber(row,'t_consultations_e15') = 1 then
				setitem(row,'t_consultations_e15',0)
			else
				setitem(row,'t_consultations_e15',1)
			end if
		case 't_consultations_d16'
			if getitemnumber(row,'t_consultations_e16') = 1 then
				setitem(row,'t_consultations_e16',0)
			else
				setitem(row,'t_consultations_e16',1)
			end if
		case 't_consultations_d17'
			if getitemnumber(row,'t_consultations_e17') = 1 then
				setitem(row,'t_consultations_e17',0)
			else
				setitem(row,'t_consultations_e17',1)
			end if
		case 't_consultations_d18'
			if getitemnumber(row,'t_consultations_e18') = 1 then
				setitem(row,'t_consultations_e18',0)
			else
				setitem(row,'t_consultations_e18',1)
			end if
		case 't_consultations_d21'
			if getitemnumber(row,'t_consultations_e21') = 1 then
				setitem(row,'t_consultations_e21',0)
			else
				setitem(row,'t_consultations_e21',1)
			end if
		case 't_consultations_d22'
			if getitemnumber(row,'t_consultations_e22') = 1 then
				setitem(row,'t_consultations_e22',0)
			else
				setitem(row,'t_consultations_e22',1)
			end if
		case 't_consultations_d23'
			if getitemnumber(row,'t_consultations_e23') = 1 then
				setitem(row,'t_consultations_e23',0)
			else
				setitem(row,'t_consultations_e23',1)
			end if
		case 't_consultations_d24'
			if getitemnumber(row,'t_consultations_e24') = 1 then
				setitem(row,'t_consultations_e24',0)
			else
				setitem(row,'t_consultations_e24',1)
			end if
		case 't_consultations_d25'
			if getitemnumber(row,'t_consultations_e25') = 1 then
				setitem(row,'t_consultations_e25',0)
			else
				setitem(row,'t_consultations_e25',1)
			end if
		case 't_consultations_d26'
			if getitemnumber(row,'t_consultations_e26') = 1 then
				setitem(row,'t_consultations_e26',0)
			else
				setitem(row,'t_consultations_e26',1)
			end if
		case 't_consultations_d27'
			if getitemnumber(row,'t_consultations_e27') = 1 then
				setitem(row,'t_consultations_e27',0)
			else
				setitem(row,'t_consultations_e27',1)
			end if
		case 't_consultations_d28'
			if getitemnumber(row,'t_consultations_e28') = 1 then
				setitem(row,'t_consultations_e28',0)
			else
				setitem(row,'t_consultations_e28',1)
			end if
		case 't_consultations_d31'
			if getitemnumber(row,'t_consultations_e31') = 1 then
				setitem(row,'t_consultations_e31',0)
			else
				setitem(row,'t_consultations_e31',1)
			end if
		case 't_consultations_d32'
			if getitemnumber(row,'t_consultations_e32') = 1 then
				setitem(row,'t_consultations_e32',0)
			else
				setitem(row,'t_consultations_e32',1)
			end if
		case 't_consultations_d33'
			if getitemnumber(row,'t_consultations_e33') = 1 then
				setitem(row,'t_consultations_e33',0)
			else
				setitem(row,'t_consultations_e33',1)
			end if
		case 't_consultations_d34'
			if getitemnumber(row,'t_consultations_e34') = 1 then
				setitem(row,'t_consultations_e34',0)
			else
				setitem(row,'t_consultations_e34',1)
			end if
		case 't_consultations_d35'
			if getitemnumber(row,'t_consultations_e35') = 1 then
				setitem(row,'t_consultations_e35',0)
			else
				setitem(row,'t_consultations_e35',1)
			end if
		case 't_consultations_d36'
			if getitemnumber(row,'t_consultations_e36') = 1 then
				setitem(row,'t_consultations_e36',0)
			else
				setitem(row,'t_consultations_e36',1)
			end if
		case 't_consultations_d37'
			if getitemnumber(row,'t_consultations_e37') = 1 then
				setitem(row,'t_consultations_e37',0)
			else
				setitem(row,'t_consultations_e37',1)
			end if
		case 't_consultations_d38'
			if getitemnumber(row,'t_consultations_e38') = 1 then
				setitem(row,'t_consultations_e38',0)
			else
				setitem(row,'t_consultations_e38',1)
			end if
		case 't_consultations_d41'
			if getitemnumber(row,'t_consultations_e41') = 1 then
				setitem(row,'t_consultations_e41',0)
			else
				setitem(row,'t_consultations_e41',1)
			end if
		case 't_consultations_d42'
			if getitemnumber(row,'t_consultations_e42') = 1 then
				setitem(row,'t_consultations_e42',0)
			else
				setitem(row,'t_consultations_e42',1)
			end if
		case 't_consultations_d43'
			if getitemnumber(row,'t_consultations_e43') = 1 then
				setitem(row,'t_consultations_e43',0)
			else
				setitem(row,'t_consultations_e43',1)
			end if
		case 't_consultations_d44'
			if getitemnumber(row,'t_consultations_e44') = 1 then
				setitem(row,'t_consultations_e44',0)
			else
				setitem(row,'t_consultations_e44',1)
			end if
		case 't_consultations_d45'
			if getitemnumber(row,'t_consultations_e45') = 1 then
				setitem(row,'t_consultations_e45',0)
			else
				setitem(row,'t_consultations_e45',1)
			end if
		case 't_consultations_d46'
			if getitemnumber(row,'t_consultations_e46') = 1 then
				setitem(row,'t_consultations_e46',0)
			else
				setitem(row,'t_consultations_e46',1)
			end if
		case 't_consultations_d47'
			if getitemnumber(row,'t_consultations_e47') = 1 then
				setitem(row,'t_consultations_e47',0)
			else
				setitem(row,'t_consultations_e47',1)
			end if
		case 't_consultations_d48'
			if getitemnumber(row,'t_consultations_e48') = 1 then
				setitem(row,'t_consultations_e48',0)
			else
				setitem(row,'t_consultations_e48',1)
			end if
		case 't_consultations_d51'
			if getitemnumber(row,'t_consultations_e51') = 1 then
				setitem(row,'t_consultations_e51',0)
			else
				setitem(row,'t_consultations_e51',1)
			end if
		case 't_consultations_d52'
			if getitemnumber(row,'t_consultations_e52') = 1 then
				setitem(row,'t_consultations_e52',0)
			else
				setitem(row,'t_consultations_e52',1)
			end if
		case 't_consultations_d53'
			if getitemnumber(row,'t_consultations_e53') = 1 then
				setitem(row,'t_consultations_e53',0)
			else
				setitem(row,'t_consultations_e53',1)
			end if
		case 't_consultations_d54'
			if getitemnumber(row,'t_consultations_e54') = 1 then
				setitem(row,'t_consultations_e54',0)
			else
				setitem(row,'t_consultations_e54',1)
			end if
		case 't_consultations_d55'
			if getitemnumber(row,'t_consultations_e55') = 1 then
				setitem(row,'t_consultations_e55',0)
			else
				setitem(row,'t_consultations_e55',1)
			end if
		case 't_consultations_d61'
			if getitemnumber(row,'t_consultations_e61') = 1 then
				setitem(row,'t_consultations_e61',0)
			else
				setitem(row,'t_consultations_e61',1)
			end if
		case 't_consultations_d62'
			if getitemnumber(row,'t_consultations_e62') = 1 then
				setitem(row,'t_consultations_e62',0)
			else
				setitem(row,'t_consultations_e62',1)
			end if
		case 't_consultations_d63'
			if getitemnumber(row,'t_consultations_e63') = 1 then
				setitem(row,'t_consultations_e63',0)
			else
				setitem(row,'t_consultations_e63',1)
			end if
		case 't_consultations_d64'
			if getitemnumber(row,'t_consultations_e64') = 1 then
				setitem(row,'t_consultations_e64',0)
			else
				setitem(row,'t_consultations_e64',1)
			end if
		case 't_consultations_d65'
			if getitemnumber(row,'t_consultations_e65') = 1 then
				setitem(row,'t_consultations_e65',0)
			else
				setitem(row,'t_consultations_e65',1)
			end if
		case 't_consultations_d71'
			if getitemnumber(row,'t_consultations_e71') = 1 then
				setitem(row,'t_consultations_e71',0)
			else
				setitem(row,'t_consultations_e71',1)
			end if
		case 't_consultations_d72'
			if getitemnumber(row,'t_consultations_e72') = 1 then
				setitem(row,'t_consultations_e72',0)
			else
				setitem(row,'t_consultations_e72',1)
			end if
		case 't_consultations_d73'
			if getitemnumber(row,'t_consultations_e73') = 1 then
				setitem(row,'t_consultations_e73',0)
			else
				setitem(row,'t_consultations_e73',1)
			end if
		case 't_consultations_d74'
			if getitemnumber(row,'t_consultations_e74') = 1 then
				setitem(row,'t_consultations_e74',0)
			else
				setitem(row,'t_consultations_e74',1)
			end if
		case 't_consultations_d75'
			if getitemnumber(row,'t_consultations_e75') = 1 then
				setitem(row,'t_consultations_e75',0)
			else
				setitem(row,'t_consultations_e75',1)
			end if
		case 't_consultations_d81'
			if getitemnumber(row,'t_consultations_e81') = 1 then
				setitem(row,'t_consultations_e81',0)
			else
				setitem(row,'t_consultations_e81',1)
			end if
		case 't_consultations_d82'
			if getitemnumber(row,'t_consultations_e82') = 1 then
				setitem(row,'t_consultations_e82',0)
			else
				setitem(row,'t_consultations_e82',1)
			end if
		case 't_consultations_d83'
			if getitemnumber(row,'t_consultations_e83') = 1 then
				setitem(row,'t_consultations_e83',0)
			else
				setitem(row,'t_consultations_e83',1)
			end if
		case 't_consultations_d84'
			if getitemnumber(row,'t_consultations_e84') = 1 then
				setitem(row,'t_consultations_e84',0)
			else
				setitem(row,'t_consultations_e84',1)
			end if
		case 't_consultations_d85'
			if getitemnumber(row,'t_consultations_e85') = 1 then
				setitem(row,'t_consultations_e85',0)
			else
				setitem(row,'t_consultations_e85',1)
			end if
		case 't_r11'
			if getitemnumber(row,'t_consultations_r11') = 1 then
				setitem(row,'t_consultations_r11',0)
			else
				setitem(row,'t_consultations_r11',1)
			end if
		case 't_r12'
			if getitemnumber(row,'t_consultations_r12') = 1 then
				setitem(row,'t_consultations_r12',0)
			else
				setitem(row,'t_consultations_r12',1)
			end if
		case 't_r13'
			if getitemnumber(row,'t_consultations_r13') = 1 then
				setitem(row,'t_consultations_r13',0)
			else
				setitem(row,'t_consultations_r13',1)
			end if
		case 't_r14'
			if getitemnumber(row,'t_consultations_r14') = 1 then
				setitem(row,'t_consultations_r14',0)
			else
				setitem(row,'t_consultations_r14',1)
			end if
		case 't_r15'
			if getitemnumber(row,'t_consultations_r15') = 1 then
				setitem(row,'t_consultations_r15',0)
			else
				setitem(row,'t_consultations_r15',1)
			end if
		case 't_r16'
			if getitemnumber(row,'t_consultations_r16') = 1 then
				setitem(row,'t_consultations_r16',0)
			else
				setitem(row,'t_consultations_r16',1)
			end if
		case 't_r17'
			if getitemnumber(row,'t_consultations_r17') = 1 then
				setitem(row,'t_consultations_r17',0)
			else
				setitem(row,'t_consultations_r17',1)
			end if
		case 't_r18'
			if getitemnumber(row,'t_consultations_r18') = 1 then
				setitem(row,'t_consultations_r18',0)
			else
				setitem(row,'t_consultations_r18',1)
			end if
		case 't_r21'
			if getitemnumber(row,'t_consultations_r21') = 1 then
				setitem(row,'t_consultations_r21',0)
			else
				setitem(row,'t_consultations_r21',1)
			end if
		case 't_r22'
			if getitemnumber(row,'t_consultations_r22') = 1 then
				setitem(row,'t_consultations_r22',0)
			else
				setitem(row,'t_consultations_r22',1)
			end if
		case 't_r23'
			if getitemnumber(row,'t_consultations_r23') = 1 then
				setitem(row,'t_consultations_r23',0)
			else
				setitem(row,'t_consultations_r23',1)
			end if
		case 't_r24'
			if getitemnumber(row,'t_consultations_r24') = 1 then
				setitem(row,'t_consultations_r24',0)
			else
				setitem(row,'t_consultations_r24',1)
			end if
		case 't_r25'
			if getitemnumber(row,'t_consultations_r25') = 1 then
				setitem(row,'t_consultations_r25',0)
			else
				setitem(row,'t_consultations_r25',1)
			end if
		case 't_r26'
			if getitemnumber(row,'t_consultations_r26') = 1 then
				setitem(row,'t_consultations_r26',0)
			else
				setitem(row,'t_consultations_r26',1)
			end if
		case 't_r27'
			if getitemnumber(row,'t_consultations_r27') = 1 then
				setitem(row,'t_consultations_r27',0)
			else
				setitem(row,'t_consultations_r27',1)
			end if
		case 't_r28'
			if getitemnumber(row,'t_consultations_r28') = 1 then
				setitem(row,'t_consultations_r28',0)
			else
				setitem(row,'t_consultations_r28',1)
			end if
		case 't_r31'
			if getitemnumber(row,'t_consultations_r31') = 1 then
				setitem(row,'t_consultations_r31',0)
			else
				setitem(row,'t_consultations_r31',1)
			end if
		case 't_r32'
			if getitemnumber(row,'t_consultations_r32') = 1 then
				setitem(row,'t_consultations_r32',0)
			else
				setitem(row,'t_consultations_r32',1)
			end if
		case 't_r33'
			if getitemnumber(row,'t_consultations_r33') = 1 then
				setitem(row,'t_consultations_r33',0)
			else
				setitem(row,'t_consultations_r33',1)
			end if
		case 't_r34'
			if getitemnumber(row,'t_consultations_r34') = 1 then
				setitem(row,'t_consultations_r34',0)
			else
				setitem(row,'t_consultations_r34',1)
			end if
		case 't_r35'
			if getitemnumber(row,'t_consultations_r35') = 1 then
				setitem(row,'t_consultations_r35',0)
			else
				setitem(row,'t_consultations_r35',1)
			end if
		case 't_r36'
			if getitemnumber(row,'t_consultations_r36') = 1 then
				setitem(row,'t_consultations_r36',0)
			else
				setitem(row,'t_consultations_r36',1)
			end if
		case 't_r37'
			if getitemnumber(row,'t_consultations_r37') = 1 then
				setitem(row,'t_consultations_r37',0)
			else
				setitem(row,'t_consultations_r37',1)
			end if
		case 't_r38'
			if getitemnumber(row,'t_consultations_r38') = 1 then
				setitem(row,'t_consultations_r38',0)
			else
				setitem(row,'t_consultations_r38',1)
			end if
		case 't_r41'
			if getitemnumber(row,'t_consultations_r41') = 1 then
				setitem(row,'t_consultations_r41',0)
			else
				setitem(row,'t_consultations_r41',1)
			end if
		case 't_r42'
			if getitemnumber(row,'t_consultations_r42') = 1 then
				setitem(row,'t_consultations_r42',0)
			else
				setitem(row,'t_consultations_r42',1)
			end if
		case 't_r43'
			if getitemnumber(row,'t_consultations_r43') = 1 then
				setitem(row,'t_consultations_r43',0)
			else
				setitem(row,'t_consultations_r43',1)
			end if
		case 't_r44'
			if getitemnumber(row,'t_consultations_r44') = 1 then
				setitem(row,'t_consultations_r44',0)
			else
				setitem(row,'t_consultations_r44',1)
			end if
		case 't_r45'
			if getitemnumber(row,'t_consultations_r45') = 1 then
				setitem(row,'t_consultations_r45',0)
			else
				setitem(row,'t_consultations_r45',1)
			end if
		case 't_r46'
			if getitemnumber(row,'t_consultations_r46') = 1 then
				setitem(row,'t_consultations_r46',0)
			else
				setitem(row,'t_consultations_r46',1)
			end if
		case 't_r47'
			if getitemnumber(row,'t_consultations_r47') = 1 then
				setitem(row,'t_consultations_r47',0)
			else
				setitem(row,'t_consultations_r47',1)
			end if
		case 't_r48'
			if getitemnumber(row,'t_consultations_r48') = 1 then
				setitem(row,'t_consultations_r48',0)
			else
				setitem(row,'t_consultations_r48',1)
			end if
		case 't_r51'
			if getitemnumber(row,'t_consultations_r51') = 1 then
				setitem(row,'t_consultations_r51',0)
			else
				setitem(row,'t_consultations_r51',1)
			end if
		case 't_r52'
			if getitemnumber(row,'t_consultations_r52') = 1 then
				setitem(row,'t_consultations_r52',0)
			else
				setitem(row,'t_consultations_r52',1)
			end if
		case 't_r53'
			if getitemnumber(row,'t_consultations_r53') = 1 then
				setitem(row,'t_consultations_r53',0)
			else
				setitem(row,'t_consultations_r53',1)
			end if
		case 't_r54'
			if getitemnumber(row,'t_consultations_r54') = 1 then
				setitem(row,'t_consultations_r54',0)
			else
				setitem(row,'t_consultations_r54',1)
			end if
		case 't_r55'
			if getitemnumber(row,'t_consultations_r55') = 1 then
				setitem(row,'t_consultations_r55',0)
			else
				setitem(row,'t_consultations_r55',1)
			end if
		case 't_r61'
			if getitemnumber(row,'t_consultations_r61') = 1 then
				setitem(row,'t_consultations_r61',0)
			else
				setitem(row,'t_consultations_r61',1)
			end if
		case 't_r62'
			if getitemnumber(row,'t_consultations_r62') = 1 then
				setitem(row,'t_consultations_r62',0)
			else
				setitem(row,'t_consultations_r62',1)
			end if
		case 't_r63'
			if getitemnumber(row,'t_consultations_r63') = 1 then
				setitem(row,'t_consultations_r63',0)
			else
				setitem(row,'t_consultations_r63',1)
			end if
		case 't_r64'
			if getitemnumber(row,'t_consultations_r64') = 1 then
				setitem(row,'t_consultations_r64',0)
			else
				setitem(row,'t_consultations_r64',1)
			end if
		case 't_r65'
			if getitemnumber(row,'t_consultations_r65') = 1 then
				setitem(row,'t_consultations_r65',0)
			else
				setitem(row,'t_consultations_r65',1)
			end if
		case 't_r71'
			if getitemnumber(row,'t_consultations_r71') = 1 then
				setitem(row,'t_consultations_r71',0)
			else
				setitem(row,'t_consultations_r71',1)
			end if
		case 't_r72'
			if getitemnumber(row,'t_consultations_r72') = 1 then
				setitem(row,'t_consultations_r72',0)
			else
				setitem(row,'t_consultations_r72',1)
			end if
		case 't_r73'
			if getitemnumber(row,'t_consultations_r73') = 1 then
				setitem(row,'t_consultations_r73',0)
			else
				setitem(row,'t_consultations_r73',1)
			end if
		case 't_r74'
			if getitemnumber(row,'t_consultations_r74') = 1 then
				setitem(row,'t_consultations_r74',0)
			else
				setitem(row,'t_consultations_r74',1)
			end if
		case 't_r75'
			if getitemnumber(row,'t_consultations_r75') = 1 then
				setitem(row,'t_consultations_r75',0)
			else
				setitem(row,'t_consultations_r75',1)
			end if
		case 't_r81'
			if getitemnumber(row,'t_consultations_r81') = 1 then
				setitem(row,'t_consultations_r81',0)
			else
				setitem(row,'t_consultations_r81',1)
			end if
		case 't_r82'
			if getitemnumber(row,'t_consultations_r82') = 1 then
				setitem(row,'t_consultations_r82',0)
			else
				setitem(row,'t_consultations_r82',1)
			end if
		case 't_r83'
			if getitemnumber(row,'t_consultations_r83') = 1 then
				setitem(row,'t_consultations_r83',0)
			else
				setitem(row,'t_consultations_r83',1)
			end if
		case 't_r84'
			if getitemnumber(row,'t_consultations_r84') = 1 then
				setitem(row,'t_consultations_r84',0)
			else
				setitem(row,'t_consultations_r84',1)
			end if
		case 't_r85'
			if getitemnumber(row,'t_consultations_r85') = 1 then
				setitem(row,'t_consultations_r85',0)
			else
				setitem(row,'t_consultations_r85',1)
			end if
		case 't_cancelle'
			setitem(row,'t_consultations_cancelle',0)
	end choose
	change = true
	SetRedraw(true)

end if
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event buttonclicked;call super::buttonclicked;string ls_test, ls_exam
long ll_cachechart

CHOOSE CASE dwo.name
	CASE "b_desc"
		ls_exam = describe("exam.checkbox.text")
		if v_langue = 'an' then
			ls_test = inputbox("Requiered treatment","Please insert replacement text.",ls_exam)
		else
			ls_test = inputbox("Traitement requis","Veuillez insérer le texte de remplacement.",ls_exam)
		end if
		setItem(row,'t_consultations_champdesc', ls_test)
		if ls_test = "" then
			modify("exam.checkbox.text = 'Examen'")
			this.Object.exam.Color = rgb(0,0,0) // modif Dr Alain Paquette
		else
//			modify("exam.checkbox.text = '" + ls_exam + ' ' + ls_test + "'")
			modify("exam.checkbox.text = '" + ls_test + "'")
			this.Object.exam.Color = rgb(255,0,0) // modif Dr Alain Paquette
		end if 
		change = true
	CASE "b_res"
		if v_langue = 'an' then
			ls_test = inputbox("Requiered treatment","Please insert replacement text.","")
		else
			ls_test = inputbox("Traitement requis","Veuillez insérer le texte de remplacement.","")
		end if
		setItem(row,'t_consultations_champres', ls_test)
		select cachechart into :ll_cachechart from t_options where ortho_id = :v_no_ortho;
		if ll_cachechart = 1 then
//			dw_traitreq.object.t_gauche.visible = false
//			dw_traitreq.object.t_droite.visible = false
			dw_traitreq.object.l_1.visible = false
			dw_traitreq.object.l_2.visible = false
		else
//			dw_traitreq.object.t_gauche.visible = true
//			dw_traitreq.object.t_droite.visible = true
			dw_traitreq.object.l_1.visible = true
			dw_traitreq.object.l_2.visible = true
		end if
		change = true
		
END CHOOSE
end event

event rowfocuschanged;call super::rowfocuschanged;string ls_exam, ls_test
string ls_1fr,ls_5fr,ls_1en,ls_5en, ls_namecol
long ll_cachechart, ll_col


select traitreq1fr,traitreq5fr,traitreq1en,traitreq5en
into :ls_1fr,:ls_5fr,:ls_1en,:ls_5en
from t_options 
where ortho_id = :v_no_ortho;

ls_exam = describe("exam.checkbox.text")
IF currentrow > 0 THEN
	ls_test = getItemString(currentrow,'t_consultations_champdesc') 
	if isnull(ls_test) then ls_test = ""
	if len(ls_test) > 0 then
	//	modify("exam.checkbox.text = '" + ls_exam + ' ' + ls_test + "'")
		modify("exam.checkbox.text = '" + ls_test + "'")
		this.Object.exam.Color = rgb(255,0,0)
	else
		if (isnull(ls_1en) = false and ls_1en <> "") or (isnull(ls_1fr) = false and ls_1fr <> "") then
			if v_langue = 'an' then
				modify("exam.checkbox.text = '" + ls_1en + "'")
			else
				modify("exam.checkbox.text = '" + ls_1fr + "'")
			end if
		else
			modify("exam.checkbox.text = 'Examen'")
		end if
		this.Object.exam.Color = rgb(0,0,0)
	end if		

	ls_test = getItemString(currentrow,'t_consultations_champres')
	if isnull(ls_test) then ls_test = ""
	if len(ls_test) > 0 then
		modify("rest.checkbox.text = '" + ls_test + "'")
	else
		if (isnull(ls_1en) = false and ls_1en <> "") or (isnull(ls_1fr) = false and ls_1fr <> "") then
			if v_langue = 'an' then
				modify("rest.checkbox.text = '" + ls_5en + "'")
			else
				modify("rest.checkbox.text = '" + ls_5fr + "'")
			end if
		else
			modify("rest.checkbox.text = 'Restaurations'")
		end if
	end if

	select cachechart into :ll_cachechart from t_options where ortho_id = :v_no_ortho;
	if ll_cachechart = 1 then
	//	dw_traitreq.object.t_gauche.visible = false
	//	dw_traitreq.object.t_droite.visible = false
		dw_traitreq.object.l_1.visible = false
		dw_traitreq.object.l_2.visible = false
	else
	//	dw_traitreq.object.t_gauche.visible = true
	//	dw_traitreq.object.t_droite.visible = true
		dw_traitreq.object.l_1.visible = true
		dw_traitreq.object.l_2.visible = true
	end if
	
END IF
end event

type tabpage_rapcons from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Rapport consultation"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_permanente cb_permanente
cb_primaire cb_primaire
pb_delcons pb_delcons
cb_odonto cb_odonto
p_size p_size
pb_12 pb_12
pb_11 pb_11
st_cons st_cons
pb_10 pb_10
pb_9 pb_9
st_patnom2 st_patnom2
p_lockcons p_lockcons
dw_dosspatficheconsult dw_dosspatficheconsult
p_unlockcons p_unlockcons
end type

on tabpage_rapcons.create
this.cb_permanente=create cb_permanente
this.cb_primaire=create cb_primaire
this.pb_delcons=create pb_delcons
this.cb_odonto=create cb_odonto
this.p_size=create p_size
this.pb_12=create pb_12
this.pb_11=create pb_11
this.st_cons=create st_cons
this.pb_10=create pb_10
this.pb_9=create pb_9
this.st_patnom2=create st_patnom2
this.p_lockcons=create p_lockcons
this.dw_dosspatficheconsult=create dw_dosspatficheconsult
this.p_unlockcons=create p_unlockcons
this.Control[]={this.cb_permanente,&
this.cb_primaire,&
this.pb_delcons,&
this.cb_odonto,&
this.p_size,&
this.pb_12,&
this.pb_11,&
this.st_cons,&
this.pb_10,&
this.pb_9,&
this.st_patnom2,&
this.p_lockcons,&
this.dw_dosspatficheconsult,&
this.p_unlockcons}
end on

on tabpage_rapcons.destroy
destroy(this.cb_permanente)
destroy(this.cb_primaire)
destroy(this.pb_delcons)
destroy(this.cb_odonto)
destroy(this.p_size)
destroy(this.pb_12)
destroy(this.pb_11)
destroy(this.st_cons)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.st_patnom2)
destroy(this.p_lockcons)
destroy(this.dw_dosspatficheconsult)
destroy(this.p_unlockcons)
end on

type cb_permanente from commandbutton within tabpage_rapcons
boolean visible = false
integer x = 1714
integer width = 407
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Permanente"
end type

event clicked;dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d11',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d12',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d13',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d14',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d15',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d16',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d17',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d21',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d22',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d23',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d24',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d25',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d26',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d27',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d31',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d32',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d33',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d34',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d35',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d36',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d37',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d41',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d42',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d43',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d44',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d45',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d46',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d47',1)
end event

type cb_primaire from commandbutton within tabpage_rapcons
boolean visible = false
integer x = 1390
integer width = 329
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mixte"
end type

event clicked;dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d11',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d12',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d16',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d21',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d22',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d26',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d31',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d32',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d36',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d41',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d42',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d46',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c1',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c2',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c3',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c4',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d1',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d2',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d3',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d4',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e1',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e2',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e3',1)
dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e4',1)
end event

type pb_delcons from picturebutton within tabpage_rapcons
integer x = 2235
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Clear!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;string	ls_user
long		ll_iduser

if error_type(240) = 1 then
	//2008-10-13 ne plus deleter, plutot caceller quand c'est dans le passé
	//
	long	ll_row
	ll_row = dw_dosspatficheconsult.getRow()
	If ll_row > 0 THEN
		
		//2008-11-19 Ajout de la demande de mot de passe
		//Demander le mot de passe de l'utilisateur en cours
		open(w_authuser)
		ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authenuser",FALSE))
		if ls_user <> 'Failed' then
			ll_iduser = long(ls_user)
		ELSE
			RETURN
		end if		
		
		IF p_lockcons.visible = TRUE THEN
			dw_dosspatficheconsult.object.t_rapconsult1_cancelle[ll_row] = 1
			dw_dosspatficheconsult.object.t_rapconsult1_date_cancelle[ll_row] = datetime(today())
			dw_dosspatficheconsult.object.t_rapconsult1_user_cancelle[ll_row] = ll_iduser
		ELSE
			dw_dosspatficheconsult.deleteRow(dw_dosspatficheconsult.getRow())
		END IF
		dw_dosspatficheconsult.event ue_update()
		dw_dosspatficheconsult.event ue_setcons()
		st_cons.event ue_title()
	END IF
end if
end event

type cb_odonto from commandbutton within tabpage_rapcons
boolean visible = false
integer x = 951
integer width = 443
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Odontogramme"
end type

event clicked;string ls_odontostr, ls_dent[]
long i, ll_row

if cb_odonto.text = "Primaire" then
	
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'a1',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'a2',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'a3',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'a4',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'b1',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'b2',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'b3',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'b4',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c1',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c2',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c3',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'c4',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d1',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d2',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d3',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'d4',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e1',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e2',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e3',1)
	dw_dosspatficheconsult.setitem(dw_dosspatficheconsult.getRow(),'e4',1)
	
else

	ll_row = tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getRow()
	if ll_row > 0 then
		
		openwithparm(w_odonto,'d_odontomixte')
		ls_odontostr = message.stringparm
		ls_odontostr = trim(mid(ls_odontostr,3))
		ls_odontostr = trim(left(ls_odontostr,len(ls_odontostr) - 2))
		ls_dent = split(ls_odontostr,' ')
		for i = 1 to upperbound(ls_dent)
			 tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.setItem(ll_row,'e'+ls_dent[i],1)
		next
		
	end if
	
end if
end event

type p_size from picture within tabpage_rapcons
boolean visible = false
integer y = 1588
integer width = 165
integer height = 144
boolean enabled = false
boolean originalsize = true
boolean focusrectangle = false
end type

type pb_12 from picturebutton within tabpage_rapcons
integer x = 3493
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRLast!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indrapcons = upperbound(il_rapcons) 
st_cons.event ue_title()
end event

type pb_11 from picturebutton within tabpage_rapcons
integer x = 3392
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRNext!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indrapcons++ 
if il_indrapcons > upperbound(il_rapcons) then il_indrapcons = upperbound(il_rapcons)
st_cons.event ue_title()
end event

type st_cons from statictext within tabpage_rapcons
event ue_title ( )
integer x = 2546
integer y = 8
integer width = 846
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Fiche de consultation"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_title();integer i,li_nbass,z = 0
long ll_id, ll_rapp[]
date ldt_date

if dw_dosspatficheconsult.getRow() > 0 then
	CHOOSE CASE dw_dosspatficheconsult.dataobject
		CASE 'd_dosspatficheconsult'
			dw_dosspatficheconsult.setFilter("t_consultations_id = " + string(il_rapcons[il_indrapcons]))
			dw_dosspatficheconsult.Filter()
			
			ldt_date = dw_dosspatficheconsult.Object.t_consultations_datecreer[dw_dosspatficheconsult.getRow()]
			
		CASE 'd_rapconsultdrouin', 'd_rapconsultluigi','d_rapconsultgariepy'
			dw_dosspatficheconsult.setFilter("id_rapconsult1 = " + string(il_rapcons[il_indrapcons]))
			dw_dosspatficheconsult.Filter()
			
			ldt_date = dw_dosspatficheconsult.Object.datecreer[dw_dosspatficheconsult.getRow()]
	
		CASE 'd_rapconsultvenneri'
			dw_dosspatficheconsult.setFilter("id_rapconsult1 = " + string(il_rapcons[il_indrapcons]))
			dw_dosspatficheconsult.Filter()
			
			ldt_date = dw_dosspatficheconsult.Object.t_rapconsult1_datecreer[dw_dosspatficheconsult.getRow()]
		
		CASE 'd_rapconsultberube'
			dw_dosspatficheconsult.setFilter("id_rapconsult1 = " + string(il_rapcons[il_indrapcons]))
			dw_dosspatficheconsult.Filter()
			
			ldt_date = dw_dosspatficheconsult.Object.t_rapconsult1_datecreer[dw_dosspatficheconsult.getRow()]
		
	   CASE 'd_rapconsultmiron'
			dw_dosspatficheconsult.setFilter("id_rapconsmiron = " + string(il_rapcons[il_indrapcons]))
			dw_dosspatficheconsult.Filter()
			
			ldt_date = dw_dosspatficheconsult.Object.t_rapcons_miron_datecreer[dw_dosspatficheconsult.getRow()]
			
	CASE ELSE
			dw_dosspatficheconsult.setFilter("t_rapconsult1_id_rapconsult1 = " + string(il_rapcons[il_indrapcons]))
			dw_dosspatficheconsult.Filter()
			
			ldt_date = dw_dosspatficheconsult.Object.t_rapconsult1_datecreer[dw_dosspatficheconsult.getRow()]
			
	END CHOOSE
	
	li_nbass = upperbound(il_rapcons)
	
	if v_langue = 'an' then
		this.text = 'Form ' + string(il_indrapcons) + ' of ' + string(li_nbass)
	else
		this.text = 'Formulaire ' + string(il_indrapcons) + ' de ' + string(li_nbass)
	end if
	
	//Locker le formulaire si la date est passée
	if isnull(il_admin_cons) then
		p_unlockcons.visible = TRUE
		p_lockcons.visible = FALSE
		dw_dosspatficheconsult.setItem(dw_dosspatficheconsult.getRow(),'locked',0)
	else
		IF daysafter(ldt_date,today()) >= il_admin_cons THEN
			p_unlockcons.visible = FALSE
			p_lockcons.visible = TRUE
			dw_dosspatficheconsult.setItem(dw_dosspatficheconsult.getRow(),'locked',1)
			if dw_dosspatficheconsult.DataObject = "d_rapconsultdrouin" then
				dw_dosspatficheconsult.modify("datecons.edit.displayonly = yes")
			end if
		ELSE
			p_unlockcons.visible = TRUE
			p_lockcons.visible = FALSE
			dw_dosspatficheconsult.setItem(dw_dosspatficheconsult.getRow(),'locked',0)
			if dw_dosspatficheconsult.DataObject = "d_rapconsultdrouin" then
				dw_dosspatficheconsult.modify("datecons.edit.displayonly = no")
			end if
		END IF
	end if
end if
end event

type pb_10 from picturebutton within tabpage_rapcons
integer x = 2441
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRPrior!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indrapcons --
if il_indrapcons <= 0 then il_indrapcons = 1
st_cons.event ue_title()
end event

type pb_9 from picturebutton within tabpage_rapcons
integer x = 2341
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRFirst!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;il_indrapcons = 1
st_cons.event ue_title()
end event

type st_patnom2 from statictext within tabpage_rapcons
event ue_title ( )
integer y = 4
integer width = 955
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "FICHE DE CONSULTATION"
boolean focusrectangle = false
end type

event ue_title();string ls

select (patient_prenom + ' ' + patient_nom) as patnom
into :ls
from patient
where patient_id = :il_patid;

st_patnom2.text = ls
end event

type p_lockcons from picture within tabpage_rapcons
integer x = 2130
integer y = 4
integer width = 91
integer height = 80
string picturename = "C:\ii4net\orthotek\images\lock.jpg"
boolean focusrectangle = false
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("typederapport","rappcons")

// Demander le mot de passe
w_password_unlock lw_win
OpenWithParm(lw_win, "")
IF MEssage.StringParm = "ok" THEN
//	ib_admin_cons = TRUE
	p_unlockcons.visible = TRUE
	p_lockcons.visible = FALSE
	dw_dosspatficheconsult.setItem(dw_dosspatficheconsult.getRow(),'locked',0)
END IF
end event

type dw_dosspatficheconsult from u_dw within tabpage_rapcons
event ue_update ( )
event ue_insert ( )
event ue_retrieve ( )
event ue_setcons ( )
integer y = 96
integer width = 3598
integer height = 1644
integer taborder = 40
string title = "dosspatficheconsult"
string dataobject = "d_dosspatficheconsult"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();accepttext()
if this.update() = 1 then
	commit using SQLCA;
else
	rollback;
	error_type(50)
end if
change = false
end event

event ue_insert();if dataobject = 'd_dosspatficheconsult' then
	insert into t_consultations(flag,patient_id,d11,d12,d13,d14,d15,d16,d17,d18,d21,d22,d23,d24,d25,d26,d27,d28,d31,d32,d33,d34,d35,d36,d37,d38,d41,d42,d43,d44,d45,d46,d47,d48,d51,d52,d53,d54,d55,d61,d62,d63,d64,d65,d71,d72,d73,d74,d75,d81,d82,d83,d84,d85,surveru,surhoru,artouvu,datecreer,heurecreer)
	values('c',:il_patid,11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,28,31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48,51,52,53,54,55,61,62,63,64,65,71,72,73,74,75,81,82,83,84,85,'t','t','t',today(),now());
	if error_type(-1) = 1 then
		commit using sqlca;
		event ue_retrieve()
		change = true
	else
		rollback using sqlca;
		error_type(50)
	end if
	
elseif dataobject = 'd_rapconsultluigi' then
	insert into t_rapconsult1(patient_id,datecons,datecreer,heurecreer)
	values(:il_patid,today(),today(),now());
	if error_type(-1) = 1 then
		commit using sqlca;
		event ue_retrieve()
		change = true
	else
		rollback using sqlca;
		error_type(50)
	end if
elseif dataobject = 'd_rapconsultgariepy' then
	insert into t_rapconsult1(patient_id,datecons,datecreer,heurecreer)
	values(:il_patid,today(),today(),now());
	if error_type(-1) = 1 then
		commit using sqlca;
		event ue_retrieve()
		change = true
	else
		rollback using sqlca;
		error_type(50)
	end if
elseif dataobject = 'd_rapconsultvenneri' then
	insert into t_rapconsult1(patient_id,datecons,datecreer,heurecreer)
	values(:il_patid,today(),today(),now());
	if error_type(-1) = 1 then
		commit using sqlca;
		event ue_retrieve()
		change = true
	else
		rollback using sqlca;
		error_type(50)
	end if
elseif dataobject = 'd_rapconsultdrouin' then
	insert into t_rapconsult1(patient_id,datecons,dent11,dent12,dent13,dent14,dent15,dent16,dent17,dent18,dent21,dent22,dent23,dent24,dent25,dent26,dent27,dent28,dent31,dent32,dent33,dent34,dent35,dent36,dent37,dent38,dent41,dent42,dent43,dent44,dent45,dent46,dent47,dent48,dent51,dent52,dent53,dent54,dent55,dent61,dent62,dent63,dent64,dent65,dent71,dent72,dent73,dent74,dent75,dent81,dent82,dent83,dent84,dent85,datecreer,heurecreer)
	values(:il_patid,today(),11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,28,31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48,51,52,53,54,55,61,62,63,64,65,71,72,73,74,75,81,82,83,84,85,today(),now());
	if error_type(-1) = 1 then
		commit using sqlca;
		event ue_retrieve()
		change = true
	else
		rollback using sqlca;
		error_type(50)
	end if
elseif dataobject = 'd_rapconsultberube' then
	insert into t_rapconsult1(patient_id,datecons,datecreer,heurecreer)
	values(:il_patid,today(),today(),now());
	if error_type(-1) = 1 then
		commit using sqlca;
		event ue_retrieve()
		change = true
	else
		rollback using sqlca;
		error_type(50)
	end if
elseif dataobject = 'd_rapconsultmiron' then
	insert into t_rapcons_miron(patient_id,datecons,mdent11,mdent12,mdent13,mdent14,mdent15,mdent16,mdent17,mdent18,mdent21,mdent22,mdent23,mdent24,mdent25,mdent26,mdent27,mdent28,mdent31,mdent32,mdent33,mdent34,mdent35,mdent36,mdent37,mdent38,mdent41,mdent42,mdent43,mdent44,mdent45,mdent46,mdent47,mdent48,mdenta1,mdenta2,mdenta3,mdenta4,mdentb1,mdentb2,mdentb3,mdentb4,mdentc1,mdentc2,mdentc3,mdentc4,mdentd1,mdentd2,mdentd3,mdentd4,mdente1,mdente2,mdente3,mdente4,datecreer,heurecreer)
	values(:il_patid,today(),11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,28,31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48,'A','A','A','A','B','B','B','B','C','C','C','C','D','D','D','D','E','E','E','E',today(),now());
	if error_type(-1) = 1 then
		commit using sqlca;
		event ue_retrieve()
		change = true
	else
		rollback using sqlca;
		error_type(50)
	end if
end if
end event

event ue_retrieve();long ll_nbrow,ll_lastid,ll_findrow,ll_iddent
ulong lul_width, lul_height, picwidth, picheight
dec {5} var = 1
string ls_drtitre,ls_drprenom,ls_drnom,ls_imgfolder,ls_path,ls_pathlat,ls_pathocc,ls_pathfrontsmile,ls_lat,ls_occ,ls_frontsmile
date ldt_age

if dataobject = 'd_dosspatficheconsult' then
	ll_nbrow = this.retrieve(il_patid)
	// si aucun formulaire, en ajoute un nouveau
	if ll_nbrow = 0 then
		event ue_insert()
		this.retrieve(il_patid)
	end if
	
	// construit la table des traitreq
	event ue_setcons()
	// inscrit le titre
	il_indrapcons = upperbound(il_rapcons)
	st_cons.event ue_title()
	ldt_age = tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getitemdate(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getrow(),'date_naissance')
	tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.object.t_age.text = calculage(ldt_age)

elseif dataobject = 'd_rapconsultluigi' then
	ll_nbrow = this.retrieve(il_patid)
	// si aucun formulaire, en ajoute un nouveau
	if ll_nbrow > 0 then
		
		// construit la table des rapports de consult
		event ue_setcons()
		// focus sur le dernier fomulaire
//		select max(id_rapconsult1) into :ll_lastid from t_rapconsult1 where patient_id = :il_patid;
//		ll_findrow = find('id_rapconsult1 = ' + string(ll_lastid),1,ll_nbrow)
//		this.scrolltorow(ll_findrow)
		// inscrit le titre
		il_indrapcons = upperbound(il_rapcons)
		st_cons.event ue_title()
		
	end if
	
elseif dataobject = 'd_rapconsultgariepy' then
	ll_nbrow = this.retrieve(il_patid)
	// si aucun formulaire, en ajoute un nouveau
	if ll_nbrow > 0 then
		
		// construit la table des rapports de consult
		event ue_setcons()
		// focus sur le dernier fomulaire
//		select max(id_rapconsult1) into :ll_lastid from t_rapconsult1 where patient_id = :il_patid;
//		ll_findrow = find('id_rapconsult1 = ' + string(ll_lastid),1,ll_nbrow)
//		this.scrolltorow(ll_findrow)
		// inscrit le titre
		il_indrapcons = upperbound(il_rapcons)
		st_cons.event ue_title()
		
	end if
	
elseif dataobject = 'd_rapconsultvenneri' then
		ll_nbrow = this.retrieve(il_patid)
	// si aucun formulaire, en ajoute un nouveau
	if ll_nbrow = 0 then
		select id_dentist into :ll_iddent from patient where patient_id = :il_patid;
		if isnull(ll_iddent) or ll_iddent = 0 then
			messagebox("Avertissement","Ce patient n'a pas de dentiste associé à son dossier.",Information!, OK!)
			return
		else
			event ue_insert()
			ll_nbrow = this.retrieve(il_patid)
		end if
		
	else
		select imgfolder,chemphoto into :ls_imgfolder,:ls_path from t_options where ortho_id = :v_no_ortho;
	// indique l'emplacement du pan initial
		select "lateral",anterioroccl,front_smile
		into :ls_lat,:ls_occ,:ls_frontsmile
		from t_imagerie 
		where patient_id = :il_patid and sequence = 1;
		ls_pathlat = ls_path + '\' + string(il_patid) + '\1\small\' + ls_lat
		ls_pathocc = ls_path + '\' + string(il_patid) + '\1\small\' + ls_occ
		ls_pathfrontsmile = ls_path + '\' + string(il_patid) + '\1\small\' + ls_frontsmile

		if FileExists(ls_pathlat) then
			p_size.PictureName = ls_pathlat
			p_size.OriginalSize = true
	//		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
	//		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
			lul_width = p_size.Width
			lul_height = p_size.Height
			if lul_width > 1500 then
				var = lul_width / 1500
			end if
			if lul_height / var > 550 then
				var = lul_height / 550
			end if
			picwidth = lul_width / var
			picheight = lul_height / var
			
			dw_dosspatficheconsult.object.p_lat.width = string(picwidth)
			dw_dosspatficheconsult.object.p_lat.height = string(picheight)
			dw_dosspatficheconsult.object.p_lat.FileName = ls_pathlat
			dw_dosspatficheconsult.object.p_lat.visible = true
		else
			dw_dosspatficheconsult.object.p_lat.visible = false
		end if
	
		if FileExists(ls_pathocc) then
			p_size.PictureName = ls_pathocc
			p_size.OriginalSize = true
	//		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
	//		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
			lul_width = p_size.Width
			lul_height = p_size.Height
			if lul_width > 915 then
				var = lul_width / 915
			end if
			if lul_height / var > 610 then
				var = lul_height / 610
			end if
			picwidth = lul_width / var
			picheight = lul_height / var
			
			dw_dosspatficheconsult.object.p_occ.width = string(picwidth)
			dw_dosspatficheconsult.object.p_occ.height = string(picheight)
			dw_dosspatficheconsult.object.p_occ.FileName = ls_pathocc
			dw_dosspatficheconsult.object.p_occ.visible = true
		else
			dw_dosspatficheconsult.object.p_occ.visible = false
		end if
	
		if FileExists(ls_pathfrontsmile) then
			p_size.PictureName = ls_pathfrontsmile
			p_size.OriginalSize = true
	//		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
	//		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
			lul_width = p_size.Width
			lul_height = p_size.Height
			if lul_width > 1500 then
				var = lul_width / 1500
			end if
			if lul_height / var > 550 then
				var = lul_height / 550
			end if
			picwidth = lul_width / var
			picheight = lul_height / var
			
			dw_dosspatficheconsult.object.p_frontsmile.width = string(picwidth)
			dw_dosspatficheconsult.object.p_frontsmile.height = string(picheight)
			dw_dosspatficheconsult.object.p_frontsmile.FileName = ls_pathfrontsmile
			dw_dosspatficheconsult.object.p_frontsmile.visible = true
		else
			dw_dosspatficheconsult.object.p_frontsmile.visible = false
		end if
	end if
	
	// construit la table des rapports de consult
	event ue_setcons()
	// focus sur le dernier fomulaire
//	select max(id_rapconsult1) into :ll_lastid from t_rapconsult1 where patient_id = :il_patid;
//	ll_findrow = find('id_rapconsult1 = ' + string(ll_lastid),1,ll_nbrow)
//	this.scrolltorow(ll_findrow)
//	// inscrit le titre
	il_indrapcons = upperbound(il_rapcons)
	st_cons.event ue_title()
elseif dataobject = 'd_rapconsultdrouin' then
	
	ll_nbrow = this.retrieve(il_patid)
	// si aucun formulaire, en ajoute un nouveau
	if ll_nbrow > 0 then
			
		// construit la table des rapports de consult
		event ue_setcons()
		il_indrapcons = upperbound(il_rapcons)
		// focus sur le dernier fomulaire
//		select max(id_rapconsult1) into :ll_lastid from t_rapconsult1 where patient_id = :il_patid;
//		ll_findrow = find('id_rapconsult1 = ' + string(ll_lastid),1,ll_nbrow)
//		this.scrolltorow(ll_findrow)
//		// inscrit le titre
		st_cons.event ue_title()
	end if
	
elseif dataobject = 'd_rapconsultberube' then
	ll_nbrow = this.retrieve(il_patid)
	// si aucun formulaire, en ajoute un nouveau
	if ll_nbrow > 0 then
		
		event ue_setcons()
		// focus sur le dernier fomulaire
//		select max(id_rapconsult1) into :ll_lastid from t_rapconsult1 where patient_id = :il_patid;
//		ll_findrow = find('id_rapconsult1 = ' + string(ll_lastid),1,ll_nbrow)
//		this.scrolltorow(ll_findrow)
		// inscrit le titre
		il_indrapcons = upperbound(il_rapcons)
		st_cons.event ue_title()
	end if
elseif dataobject = 'd_rapconsultmiron' then
	ll_nbrow = this.retrieve(il_patid)
	// si aucun formulaire, en ajoute un nouveau
	if ll_nbrow > 0 then
			
		this.object.t_age.text = calculage(getitemdate(this.getrow(),'patient_date_naissance'))
	
		// construit la table des rapports de consult
		event ue_setcons()
		il_indrapcons = upperbound(il_rapcons)
		// focus sur le dernier fomulaire
//		select max(id_rapconsult1) into :ll_lastid from t_rapconsult1 where patient_id = :il_patid;
//		ll_findrow = find('id_rapconsult1 = ' + string(ll_lastid),1,ll_nbrow)
//		this.scrolltorow(ll_findrow)
//		// inscrit le titre
		st_cons.event ue_title()
	end if
end if
end event

event ue_setcons();long ll_id,ll_rapport[],i=1


il_rapcons[] = ll_rapport[]

choose case dataobject
	case 'd_dosspatficheconsult'
		DECLARE cur CURSOR FOR
	
		select id
		from t_consultations
		where patient_id = :il_patid AND
				flag = 'c';
	
		OPEN cur;
		
		FETCH cur INTO :ll_id;
		
		DO WHILE SQLCA.SQLCODE = 0
			il_rapcons[i] = ll_id
			i++
			FETCH cur INTO :ll_id;
		LOOP
		
		CLOSE cur;
	case 'd_rapconsultmiron'
		DECLARE cur3 CURSOR FOR
	
		select id_rapconsmiron
		from t_rapcons_miron
		where patient_id = :il_patid
		ORDER by datecons ASC, id_rapconsmiron ASC;
				
		OPEN cur3;
		
		FETCH cur3 INTO :ll_id;
		
		DO WHILE SQLCA.SQLCODE = 0
			il_rapcons[i] = ll_id
			i++
			FETCH cur3 INTO :ll_id;
		LOOP
		
		CLOSE cur3;
	case else
		DECLARE cur2 CURSOR FOR
	
		select id_rapconsult1
		from t_rapconsult1
		where patient_id = :il_patid
		ORDER by datecons ASC, id_rapconsult1 ASC;
				
		OPEN cur2;
		
		FETCH cur2 INTO :ll_id;
		
		DO WHILE SQLCA.SQLCODE = 0
			il_rapcons[i] = ll_id
			i++
			FETCH cur2 INTO :ll_id;
		LOOP
		
		CLOSE cur2;
end choose
il_indrapcons = 1
//if dataobject = 'd_dosspatficheconsult' then
//	
//	
//	DECLARE cur CURSOR FOR
//	
//		select id
//		from t_consultations
//		where patient_id = :il_patid AND
//				flag = 'c';
//	
//	OPEN cur;
//	
//	FETCH cur INTO :ll_id;
//	
//	DO WHILE SQLCA.SQLCODE = 0
//		il_rapcons[i] = ll_id
//		i++
//		FETCH cur INTO :ll_id;
//	LOOP
//	
//	CLOSE cur;
//
//else 	
//		
//	DECLARE cur2 CURSOR FOR
//	
//		select id_rapconsult1
//		from t_rapconsult1
//		where patient_id = :il_patid
//		ORDER by datecons ASC, id_rapconsult1 ASC;
//				
//	OPEN cur2;
//	
//	FETCH cur2 INTO :ll_id;
//	
//	DO WHILE SQLCA.SQLCODE = 0
//		il_rapcons[i] = ll_id
//		i++
//		FETCH cur2 INTO :ll_id;
//	LOOP
//	
//	CLOSE cur2;
//end if

end event

event constructor;//pro_resize luo_size
//luo_size.uf_resizedw(this)

integer li_typerapcons
date ldt_datenais
// choix du rapport de consultation
select typerapcons into :li_typerapcons from t_options where ortho_id = :v_no_ortho;
choose case li_typerapcons 
	case 1
		dataobject = 'd_dosspatficheconsult'
	case 2
		dataobject = 'd_rapconsultluigi'
	case 3
		dataobject = 'd_rapconsultvenneri'
	case 4
		dataobject = 'd_rapconsultdrouin'
		cb_odonto.visible = true
	case 5
		dataobject = 'd_rapconsultberube'
	case 6
		dataobject = 'd_rapconsultmiron'
		cb_permanente.visible = true
		cb_primaire.visible = true
		cb_odonto.visible = true
		cb_odonto.text = "Primaire"
	case 7
		dataobject = 'd_rapconsultgariepy'
end choose

// traduction
choose case dataobject
	case 'd_dosspatficheconsult'
		if v_langue = 'an' then
			object.t_title.text = 'Consultation form'
			object.t_nom.text = 'Name:'
			object.t_add.text = 'Address:'
			object.t_ville.text = 'City:'
			object.t_telmaison.text = 'Home phone:'
			object.t_premvisit.text = 'First visit:'
			object.t_ecole.text = 'School:'
			object.t_datenais.text = 'Date of Birth:'
			object.t_langue.text = 'Language:'
			object.t_telbur.text = 'Office phone:'
			object.t_refpar.text = 'Referral:'
			object.t_dentist.text = 'Dentist:'
			object.t_accpar.text = 'Accompanied by:'
			object.t_dents.text = 'Teeth'
			object.t_obs.text = 'Remarks'
			object.t_estime.text = 'Estimate'
			object.t_age.text = 'Age'
			object.t_printedon.text = 'Printed on:'
			object.t_classe.text = 'CLASS'
		end if
end choose
SetTransObject(SQLCA)
end event

event clicked;string ls_rep

if getItemNumber(row,'locked') = 0 then 

	SetRedraw(false)
	Choose case dwo.name
		case 'mdent11'
			if getitemnumber(row,'d11') = 1 then
				setitem(row,'d11',0)
			else
				setitem(row,'d11',1)
			end if
		case 'mdent12'
			if getitemnumber(row,'d12') = 1 then
				setitem(row,'d12',0)
			else
				setitem(row,'d12',1)
			end if
		case 'mdent13'
			if getitemnumber(row,'d13') = 1 then
				setitem(row,'d13',0)
			else
				setitem(row,'d13',1)
			end if
		case 'mdent14'
			if getitemnumber(row,'d14') = 1 then
				setitem(row,'d14',0)
			else
				setitem(row,'d14',1)
			end if
		case 'mdent15'
			if getitemnumber(row,'d15') = 1 then
				setitem(row,'d15',0)
			else
				setitem(row,'d15',1)
			end if
		case 'mdent16'
			if getitemnumber(row,'d16') = 1 then
				setitem(row,'d16',0)
			else
				setitem(row,'d16',1)
			end if
		case 'mdent17'
			if getitemnumber(row,'d17') = 1 then
				setitem(row,'d17',0)
			else
				setitem(row,'d17',1)
			end if
		case 'mdent18'
			if getitemnumber(row,'d18') = 1 then
				setitem(row,'d18',0)
			else
				setitem(row,'d18',1)
			end if
		case 'mdent21'
			if getitemnumber(row,'d21') = 1 then
				setitem(row,'d21',0)
			else
				setitem(row,'d21',1)
			end if
		case 'mdent22'
			if getitemnumber(row,'d22') = 1 then
				setitem(row,'d22',0)
			else
				setitem(row,'d22',1)
			end if
		case 'mdent23'
			if getitemnumber(row,'d23') = 1 then
				setitem(row,'d23',0)
			else
				setitem(row,'d23',1)
			end if
		case 'mdent24'
			if getitemnumber(row,'d24') = 1 then
				setitem(row,'d24',0)
			else
				setitem(row,'d24',1)
			end if
		case 'mdent25'
			if getitemnumber(row,'d25') = 1 then
				setitem(row,'d25',0)
			else
				setitem(row,'d25',1)
			end if
		case 'mdent26'
			if getitemnumber(row,'d26') = 1 then
				setitem(row,'d26',0)
			else
				setitem(row,'d26',1)
			end if
		case 'mdent27'
			if getitemnumber(row,'d27') = 1 then
				setitem(row,'d27',0)
			else
				setitem(row,'d27',1)
			end if
		case 'mdent28'
			if getitemnumber(row,'d28') = 1 then
				setitem(row,'d28',0)
			else
				setitem(row,'d28',1)
			end if
		case 'mdent31'
			if getitemnumber(row,'d31') = 1 then
				setitem(row,'d31',0)
			else
				setitem(row,'d31',1)
			end if
		case 'mdent32'
			if getitemnumber(row,'d32') = 1 then
				setitem(row,'d32',0)
			else
				setitem(row,'d32',1)
			end if
		case 'mdent33'
			if getitemnumber(row,'d33') = 1 then
				setitem(row,'d33',0)
			else
				setitem(row,'d33',1)
			end if
		case 'mdent34'
			if getitemnumber(row,'d34') = 1 then
				setitem(row,'d34',0)
			else
				setitem(row,'d34',1)
			end if
		case 'mdent35'
			if getitemnumber(row,'d35') = 1 then
				setitem(row,'d35',0)
			else
				setitem(row,'d35',1)
			end if
		case 'mdent36'
			if getitemnumber(row,'d36') = 1 then
				setitem(row,'d36',0)
			else
				setitem(row,'d36',1)
			end if
		case 'mdent37'
			if getitemnumber(row,'d37') = 1 then
				setitem(row,'d37',0)
			else
				setitem(row,'d37',1)
			end if
		case 'mdent38'
			if getitemnumber(row,'d38') = 1 then
				setitem(row,'d38',0)
			else
				setitem(row,'d38',1)
			end if
		case 'mdent41'
			if getitemnumber(row,'d41') = 1 then
				setitem(row,'d41',0)
			else
				setitem(row,'d41',1)
			end if
		case 'mdent42'
			if getitemnumber(row,'d42') = 1 then
				setitem(row,'d42',0)
			else
				setitem(row,'d42',1)
			end if
		case 'mdent43'
			if getitemnumber(row,'d43') = 1 then
				setitem(row,'d43',0)
			else
				setitem(row,'d43',1)
			end if
		case 'mdent44'
			if getitemnumber(row,'d44') = 1 then
				setitem(row,'d44',0)
			else
				setitem(row,'d44',1)
			end if
		case 'mdent45'
			if getitemnumber(row,'d45') = 1 then
				setitem(row,'d45',0)
			else
				setitem(row,'d45',1)
			end if
		case 'mdent46'
			if getitemnumber(row,'d46') = 1 then
				setitem(row,'d46',0)
			else
				setitem(row,'d46',1)
			end if
		case 'mdent47'
			if getitemnumber(row,'d47') = 1 then
				setitem(row,'d47',0)
			else
				setitem(row,'d47',1)
			end if
		case 'mdent48'
			if getitemnumber(row,'d48') = 1 then
				setitem(row,'d48',0)
			else
				setitem(row,'d48',1)
			end if
		case 'mdenta1'
			if getitemnumber(row,'a1') = 1 then
				setitem(row,'a1',0)
			else
				setitem(row,'a1',1)
			end if
		case 'mdenta2'
			if getitemnumber(row,'a2') = 1 then
				setitem(row,'a2',0)
			else
				setitem(row,'a2',1)
			end if
		case 'mdenta3'
			if getitemnumber(row,'a3') = 1 then
				setitem(row,'a3',0)
			else
				setitem(row,'a3',1)
			end if
		case 'mdenta4'
			if getitemnumber(row,'a4') = 1 then
				setitem(row,'a4',0)
			else
				setitem(row,'a4',1)
			end if
		case 'mdentb1'
			if getitemnumber(row,'b1') = 1 then
				setitem(row,'b1',0)
			else
				setitem(row,'b1',1)
			end if
		case 'mdentb2'
			if getitemnumber(row,'b2') = 1 then
				setitem(row,'b2',0)
			else
				setitem(row,'b2',1)
			end if
		case 'mdentb3'
			if getitemnumber(row,'b3') = 1 then
				setitem(row,'b3',0)
			else
				setitem(row,'b3',1)
			end if
		case 'mdentb4'
			if getitemnumber(row,'b4') = 1 then
				setitem(row,'b4',0)
			else
				setitem(row,'b4',1)
			end if
		case 'mdentc1'
			if getitemnumber(row,'c1') = 1 then
				setitem(row,'c1',0)
			else
				setitem(row,'c1',1)
			end if
		case 'mdentc2'
			if getitemnumber(row,'c2') = 1 then
				setitem(row,'c2',0)
			else
				setitem(row,'c2',1)
			end if
		case 'mdentc3'
			if getitemnumber(row,'c3') = 1 then
				setitem(row,'c3',0)
			else
				setitem(row,'c3',1)
			end if
		case 'mdentc4'
			if getitemnumber(row,'c4') = 1 then
				setitem(row,'c4',0)
			else
				setitem(row,'c4',1)
			end if
		case 'mdentd1'
			if getitemnumber(row,'d1') = 1 then
				setitem(row,'d1',0)
			else
				setitem(row,'d1',1)
			end if
		case 'mdentd2'
			if getitemnumber(row,'d2') = 1 then
				setitem(row,'d2',0)
			else
				setitem(row,'d2',1)
			end if
		case 'mdentd3'
			if getitemnumber(row,'d3') = 1 then
				setitem(row,'d3',0)
			else
				setitem(row,'d3',1)
			end if
		case 'mdentd4'
			if getitemnumber(row,'d4') = 1 then
				setitem(row,'d4',0)
			else
				setitem(row,'d4',1)
			end if
		case 'mdente1'
			if getitemnumber(row,'e1') = 1 then
				setitem(row,'e1',0)
			else
				setitem(row,'e1',1)
			end if
		case 'mdente2'
			if getitemnumber(row,'e2') = 1 then
				setitem(row,'e2',0)
			else
				setitem(row,'e2',1)
			end if
		case 'mdente3'
			if getitemnumber(row,'e3') = 1 then
				setitem(row,'e3',0)
			else
				setitem(row,'e3',1)
			end if
		case 'mdente4'
			if getitemnumber(row,'e4') = 1 then
				setitem(row,'e4',0)
			else
				setitem(row,'e4',1)
			end if
		case 't_consultations_d11'
			if getitemnumber(row,'t_consultations_e11') = 1 then
				setitem(row,'t_consultations_e11',0)
			else
				setitem(row,'t_consultations_e11',1)
			end if
		case 't_consultations_d12'
			if getitemnumber(row,'t_consultations_e12') = 1 then
				setitem(row,'t_consultations_e12',0)
			else
				setitem(row,'t_consultations_e12',1)
			end if
		case 't_consultations_d13'
			if getitemnumber(row,'t_consultations_e13') = 1 then
				setitem(row,'t_consultations_e13',0)
			else
				setitem(row,'t_consultations_e13',1)
			end if
		case 't_consultations_d14'
			if getitemnumber(row,'t_consultations_e14') = 1 then
				setitem(row,'t_consultations_e14',0)
			else
				setitem(row,'t_consultations_e14',1)
			end if
		case 't_consultations_d15'
			if getitemnumber(row,'t_consultations_e15') = 1 then
				setitem(row,'t_consultations_e15',0)
			else
				setitem(row,'t_consultations_e15',1)
			end if
		case 't_consultations_d16'
			if getitemnumber(row,'t_consultations_e16') = 1 then
				setitem(row,'t_consultations_e16',0)
			else
				setitem(row,'t_consultations_e16',1)
			end if
		case 't_consultations_d17'
			if getitemnumber(row,'t_consultations_e17') = 1 then
				setitem(row,'t_consultations_e17',0)
			else
				setitem(row,'t_consultations_e17',1)
			end if
		case 't_consultations_d18'
			if getitemnumber(row,'t_consultations_e18') = 1 then
				setitem(row,'t_consultations_e18',0)
			else
				setitem(row,'t_consultations_e18',1)
			end if
		case 't_consultations_d21'
			if getitemnumber(row,'t_consultations_e21') = 1 then
				setitem(row,'t_consultations_e21',0)
			else
				setitem(row,'t_consultations_e21',1)
			end if
		case 't_consultations_d22'
			if getitemnumber(row,'t_consultations_e22') = 1 then
				setitem(row,'t_consultations_e22',0)
			else
				setitem(row,'t_consultations_e22',1)
			end if
		case 't_consultations_d23'
			if getitemnumber(row,'t_consultations_e23') = 1 then
				setitem(row,'t_consultations_e23',0)
			else
				setitem(row,'t_consultations_e23',1)
			end if
		case 't_consultations_d24'
			if getitemnumber(row,'t_consultations_e24') = 1 then
				setitem(row,'t_consultations_e24',0)
			else
				setitem(row,'t_consultations_e24',1)
			end if
		case 't_consultations_d25'
			if getitemnumber(row,'t_consultations_e25') = 1 then
				setitem(row,'t_consultations_e25',0)
			else
				setitem(row,'t_consultations_e25',1)
			end if
		case 't_consultations_d26'
			if getitemnumber(row,'t_consultations_e26') = 1 then
				setitem(row,'t_consultations_e26',0)
			else
				setitem(row,'t_consultations_e26',1)
			end if
		case 't_consultations_d27'
			if getitemnumber(row,'t_consultations_e27') = 1 then
				setitem(row,'t_consultations_e27',0)
			else
				setitem(row,'t_consultations_e27',1)
			end if
		case 't_consultations_d28'
			if getitemnumber(row,'t_consultations_e28') = 1 then
				setitem(row,'t_consultations_e28',0)
			else
				setitem(row,'t_consultations_e28',1)
			end if
		case 't_consultations_d31'
			if getitemnumber(row,'t_consultations_e31') = 1 then
				setitem(row,'t_consultations_e31',0)
			else
				setitem(row,'t_consultations_e31',1)
			end if
		case 't_consultations_d32'
			if getitemnumber(row,'t_consultations_e32') = 1 then
				setitem(row,'t_consultations_e32',0)
			else
				setitem(row,'t_consultations_e32',1)
			end if
		case 't_consultations_d33'
			if getitemnumber(row,'t_consultations_e33') = 1 then
				setitem(row,'t_consultations_e33',0)
			else
				setitem(row,'t_consultations_e33',1)
			end if
		case 't_consultations_d34'
			if getitemnumber(row,'t_consultations_e34') = 1 then
				setitem(row,'t_consultations_e34',0)
			else
				setitem(row,'t_consultations_e34',1)
			end if
		case 't_consultations_d35'
			if getitemnumber(row,'t_consultations_e35') = 1 then
				setitem(row,'t_consultations_e35',0)
			else
				setitem(row,'t_consultations_e35',1)
			end if
		case 't_consultations_d36'
			if getitemnumber(row,'t_consultations_e36') = 1 then
				setitem(row,'t_consultations_e36',0)
			else
				setitem(row,'t_consultations_e36',1)
			end if
		case 't_consultations_d37'
			if getitemnumber(row,'t_consultations_e37') = 1 then
				setitem(row,'t_consultations_e37',0)
			else
				setitem(row,'t_consultations_e37',1)
			end if
		case 't_consultations_d38'
			if getitemnumber(row,'t_consultations_e38') = 1 then
				setitem(row,'t_consultations_e38',0)
			else
				setitem(row,'t_consultations_e38',1)
			end if
		case 't_consultations_d41'
			if getitemnumber(row,'t_consultations_e41') = 1 then
				setitem(row,'t_consultations_e41',0)
			else
				setitem(row,'t_consultations_e41',1)
			end if
		case 't_consultations_d42'
			if getitemnumber(row,'t_consultations_e42') = 1 then
				setitem(row,'t_consultations_e42',0)
			else
				setitem(row,'t_consultations_e42',1)
			end if
		case 't_consultations_d43'
			if getitemnumber(row,'t_consultations_e43') = 1 then
				setitem(row,'t_consultations_e43',0)
			else
				setitem(row,'t_consultations_e43',1)
			end if
		case 't_consultations_d44'
			if getitemnumber(row,'t_consultations_e44') = 1 then
				setitem(row,'t_consultations_e44',0)
			else
				setitem(row,'t_consultations_e44',1)
			end if
		case 't_consultations_d45'
			if getitemnumber(row,'t_consultations_e45') = 1 then
				setitem(row,'t_consultations_e45',0)
			else
				setitem(row,'t_consultations_e45',1)
			end if
		case 't_consultations_d46'
			if getitemnumber(row,'t_consultations_e46') = 1 then
				setitem(row,'t_consultations_e46',0)
			else
				setitem(row,'t_consultations_e46',1)
			end if
		case 't_consultations_d47'
			if getitemnumber(row,'t_consultations_e47') = 1 then
				setitem(row,'t_consultations_e47',0)
			else
				setitem(row,'t_consultations_e47',1)
			end if
		case 't_consultations_d48'
			if getitemnumber(row,'t_consultations_e48') = 1 then
				setitem(row,'t_consultations_e48',0)
			else
				setitem(row,'t_consultations_e48',1)
			end if
		case 't_consultations_d51'
			if getitemnumber(row,'t_consultations_e51') = 1 then
				setitem(row,'t_consultations_e51',0)
			else
				setitem(row,'t_consultations_e51',1)
			end if
		case 't_consultations_d52'
			if getitemnumber(row,'t_consultations_e52') = 1 then
				setitem(row,'t_consultations_e52',0)
			else
				setitem(row,'t_consultations_e52',1)
			end if
		case 't_consultations_d53'
			if getitemnumber(row,'t_consultations_e53') = 1 then
				setitem(row,'t_consultations_e53',0)
			else
				setitem(row,'t_consultations_e53',1)
			end if
		case 't_consultations_d54'
			if getitemnumber(row,'t_consultations_e54') = 1 then
				setitem(row,'t_consultations_e54',0)
			else
				setitem(row,'t_consultations_e54',1)
			end if
		case 't_consultations_d55'
			if getitemnumber(row,'t_consultations_e55') = 1 then
				setitem(row,'t_consultations_e55',0)
			else
				setitem(row,'t_consultations_e55',1)
			end if
		case 't_consultations_d61'
			if getitemnumber(row,'t_consultations_e61') = 1 then
				setitem(row,'t_consultations_e61',0)
			else
				setitem(row,'t_consultations_e61',1)
			end if
		case 't_consultations_d62'
			if getitemnumber(row,'t_consultations_e62') = 1 then
				setitem(row,'t_consultations_e62',0)
			else
				setitem(row,'t_consultations_e62',1)
			end if
		case 't_consultations_d63'
			if getitemnumber(row,'t_consultations_e63') = 1 then
				setitem(row,'t_consultations_e63',0)
			else
				setitem(row,'t_consultations_e63',1)
			end if
		case 't_consultations_d64'
			if getitemnumber(row,'t_consultations_e64') = 1 then
				setitem(row,'t_consultations_e64',0)
			else
				setitem(row,'t_consultations_e64',1)
			end if
		case 't_consultations_d65'
			if getitemnumber(row,'t_consultations_e65') = 1 then
				setitem(row,'t_consultations_e65',0)
			else
				setitem(row,'t_consultations_e65',1)
			end if
		case 't_consultations_d71'
			if getitemnumber(row,'t_consultations_e71') = 1 then
				setitem(row,'t_consultations_e71',0)
			else
				setitem(row,'t_consultations_e71',1)
			end if
		case 't_consultations_d72'
			if getitemnumber(row,'t_consultations_e72') = 1 then
				setitem(row,'t_consultations_e72',0)
			else
				setitem(row,'t_consultations_e72',1)
			end if
		case 't_consultations_d73'
			if getitemnumber(row,'t_consultations_e73') = 1 then
				setitem(row,'t_consultations_e73',0)
			else
				setitem(row,'t_consultations_e73',1)
			end if
		case 't_consultations_d74'
			if getitemnumber(row,'t_consultations_e74') = 1 then
				setitem(row,'t_consultations_e74',0)
			else
				setitem(row,'t_consultations_e74',1)
			end if
		case 't_consultations_d75'
			if getitemnumber(row,'t_consultations_e75') = 1 then
				setitem(row,'t_consultations_e75',0)
			else
				setitem(row,'t_consultations_e75',1)
			end if
		case 't_consultations_d81'
			if getitemnumber(row,'t_consultations_e81') = 1 then
				setitem(row,'t_consultations_e81',0)
			else
				setitem(row,'t_consultations_e81',1)
			end if
		case 't_consultations_d82'
			if getitemnumber(row,'t_consultations_e82') = 1 then
				setitem(row,'t_consultations_e82',0)
			else
				setitem(row,'t_consultations_e82',1)
			end if
		case 't_consultations_d83'
			if getitemnumber(row,'t_consultations_e83') = 1 then
				setitem(row,'t_consultations_e83',0)
			else
				setitem(row,'t_consultations_e83',1)
			end if
		case 't_consultations_d84'
			if getitemnumber(row,'t_consultations_e84') = 1 then
				setitem(row,'t_consultations_e84',0)
			else
				setitem(row,'t_consultations_e84',1)
			end if
		case 't_consultations_d85'
			if getitemnumber(row,'t_consultations_e85') = 1 then
				setitem(row,'t_consultations_e85',0)
			else
				setitem(row,'t_consultations_e85',1)
			end if
		case 't_rapconsult1_a1'
			if getitemnumber(row,'t_rapconsult1_a1') = 1 then
				setitem(row,'t_rapconsult1_a1',0)
			else
				setitem(row,'t_rapconsult1_a1',1)
			end if
		case 't_rapconsult1_a2'
			if getitemnumber(row,'t_rapconsult1_a2') = 1 then
				setitem(row,'t_rapconsult1_a2',0)
			else
				setitem(row,'t_rapconsult1_a2',1)
			end if
		case 't_rapconsult1_a3'
			if getitemnumber(row,'t_rapconsult1_a3') = 1 then
				setitem(row,'t_rapconsult1_a3',0)
			else
				setitem(row,'t_rapconsult1_a3',1)
			end if
		case 't_rapconsult1_a4'
			if getitemnumber(row,'t_rapconsult1_a4') = 1 then
				setitem(row,'t_rapconsult1_a4',0)
			else
				setitem(row,'t_rapconsult1_a4',1)
			end if
		case 't_rapconsult1_b1'
			if getitemnumber(row,'t_rapconsult1_b1') = 1 then
				setitem(row,'t_rapconsult1_b1',0)
			else
				setitem(row,'t_rapconsult1_b1',1)
			end if
		case 't_rapconsult1_b2'
			if getitemnumber(row,'t_rapconsult1_b2') = 1 then
				setitem(row,'t_rapconsult1_b2',0)
			else
				setitem(row,'t_rapconsult1_b2',1)
			end if
		case 't_rapconsult1_b3'
			if getitemnumber(row,'t_rapconsult1_b3') = 1 then
				setitem(row,'t_rapconsult1_b3',0)
			else
				setitem(row,'t_rapconsult1_b3',1)
			end if
		case 't_rapconsult1_b4'
			if getitemnumber(row,'t_rapconsult1_b4') = 1 then
				setitem(row,'t_rapconsult1_b4',0)
			else
				setitem(row,'t_rapconsult1_b4',1)
			end if
		case 't_rapconsult1_c1'
			if getitemnumber(row,'t_rapconsult1_c1') = 1 then
				setitem(row,'t_rapconsult1_c1',0)
			else
				setitem(row,'t_rapconsult1_c1',1)
			end if
		case 't_rapconsult1_c2'
			if getitemnumber(row,'t_rapconsult1_c2') = 1 then
				setitem(row,'t_rapconsult1_c2',0)
			else
				setitem(row,'t_rapconsult1_c2',1)
			end if
		case 't_rapconsult1_c3'
			if getitemnumber(row,'t_rapconsult1_c3') = 1 then
				setitem(row,'t_rapconsult1_c3',0)
			else
				setitem(row,'t_rapconsult1_c3',1)
			end if
		case 't_rapconsult1_c4'
			if getitemnumber(row,'t_rapconsult1_c4') = 1 then
				setitem(row,'t_rapconsult1_c4',0)
			else
				setitem(row,'t_rapconsult1_c4',1)
			end if
		case 't_rapconsult1_d1'
			if getitemnumber(row,'t_rapconsult1_d1') = 1 then
				setitem(row,'t_rapconsult1_d1',0)
			else
				setitem(row,'t_rapconsult1_d1',1)
			end if
		case 't_rapconsult1_d2'
			if getitemnumber(row,'t_rapconsult1_d2') = 1 then
				setitem(row,'t_rapconsult1_d2',0)
			else
				setitem(row,'t_rapconsult1_d2',1)
			end if
		case 't_rapconsult1_d3'
			if getitemnumber(row,'t_rapconsult1_d3') = 1 then
				setitem(row,'t_rapconsult1_d3',0)
			else
				setitem(row,'t_rapconsult1_d3',1)
			end if
		case 't_rapconsult1_d4'
			if getitemnumber(row,'t_rapconsult1_d4') = 1 then
				setitem(row,'t_rapconsult1_d4',0)
			else
				setitem(row,'t_rapconsult1_d4',1)
			end if
		case 't_rapconsult1_e1'
			if getitemnumber(row,'t_rapconsult1_e1') = 1 then
				setitem(row,'t_rapconsult1_e1',0)
			else
				setitem(row,'t_rapconsult1_e1',1)
			end if
		case 't_rapconsult1_e2'
			if getitemnumber(row,'t_rapconsult1_e2') = 1 then
				setitem(row,'t_rapconsult1_e2',0)
			else
				setitem(row,'t_rapconsult1_e2',1)
			end if
		case 't_rapconsult1_e3'
			if getitemnumber(row,'t_rapconsult1_e3') = 1 then
				setitem(row,'t_rapconsult1_e3',0)
			else
				setitem(row,'t_rapconsult1_e3',1)
			end if
		case 't_rapconsult1_e4'
			if getitemnumber(row,'t_rapconsult1_e4') = 1 then
				setitem(row,'t_rapconsult1_e4',0)
			else
				setitem(row,'t_rapconsult1_e4',1)
			end if
		case 'dent11'
			if getitemnumber(row,'e11') = 1 then
				setitem(row,'e11',0)
			else
				setitem(row,'e11',1)
			end if
		case 'dent12'
			if getitemnumber(row,'e12') = 1 then
				setitem(row,'e12',0)
			else
				setitem(row,'e12',1)
			end if
		case 'dent13'
			if getitemnumber(row,'e13') = 1 then
				setitem(row,'e13',0)
			else
				setitem(row,'e13',1)
			end if
		case 'dent14'
			if getitemnumber(row,'e14') = 1 then
				setitem(row,'e14',0)
			else
				setitem(row,'e14',1)
			end if
		case 'dent15'
			if getitemnumber(row,'e15') = 1 then
				setitem(row,'e15',0)
			else
				setitem(row,'e15',1)
			end if
		case 'dent16'
			if getitemnumber(row,'e16') = 1 then
				setitem(row,'e16',0)
			else
				setitem(row,'e16',1)
			end if
		case 'dent17'
			if getitemnumber(row,'e17') = 1 then
				setitem(row,'e17',0)
			else
				setitem(row,'e17',1)
			end if
		case 'dent18'
			if getitemnumber(row,'e18') = 1 then
				setitem(row,'e18',0)
			else
				setitem(row,'e18',1)
			end if
		case 'dent21'
			if getitemnumber(row,'e21') = 1 then
				setitem(row,'e21',0)
			else
				setitem(row,'e21',1)
			end if
		case 'dent22'
			if getitemnumber(row,'e22') = 1 then
				setitem(row,'e22',0)
			else
				setitem(row,'e22',1)
			end if
		case 'dent23'
			if getitemnumber(row,'e23') = 1 then
				setitem(row,'e23',0)
			else
				setitem(row,'e23',1)
			end if
		case 'dent24'
			if getitemnumber(row,'e24') = 1 then
				setitem(row,'e24',0)
			else
				setitem(row,'e24',1)
			end if
		case 'dent25'
			if getitemnumber(row,'e25') = 1 then
				setitem(row,'e25',0)
			else
				setitem(row,'e25',1)
			end if
		case 'dent26'
			if getitemnumber(row,'e26') = 1 then
				setitem(row,'e26',0)
			else
				setitem(row,'e26',1)
			end if
		case 'dent27'
			if getitemnumber(row,'e27') = 1 then
				setitem(row,'e27',0)
			else
				setitem(row,'e27',1)
			end if
		case 'dent28'
			if getitemnumber(row,'e28') = 1 then
				setitem(row,'e28',0)
			else
				setitem(row,'e28',1)
			end if
		case 'dent31'
			if getitemnumber(row,'e31') = 1 then
				setitem(row,'e31',0)
			else
				setitem(row,'e31',1)
			end if
		case 'dent32'
			if getitemnumber(row,'e32') = 1 then
				setitem(row,'e32',0)
			else
				setitem(row,'e32',1)
			end if
		case 'dent33'
			if getitemnumber(row,'e33') = 1 then
				setitem(row,'e33',0)
			else
				setitem(row,'e33',1)
			end if
		case 'dent34'
			if getitemnumber(row,'e34') = 1 then
				setitem(row,'e34',0)
			else
				setitem(row,'e34',1)
			end if
		case 'dent35'
			if getitemnumber(row,'e35') = 1 then
				setitem(row,'e35',0)
			else
				setitem(row,'e35',1)
			end if
		case 'dent36'
			if getitemnumber(row,'e36') = 1 then
				setitem(row,'e36',0)
			else
				setitem(row,'e36',1)
			end if
		case 'dent37'
			if getitemnumber(row,'e37') = 1 then
				setitem(row,'e37',0)
			else
				setitem(row,'e37',1)
			end if
		case 'dent38'
			if getitemnumber(row,'e38') = 1 then
				setitem(row,'e38',0)
			else
				setitem(row,'e38',1)
			end if
		case 'dent41'
			if getitemnumber(row,'e41') = 1 then
				setitem(row,'e41',0)
			else
				setitem(row,'e41',1)
			end if
		case 'dent42'
			if getitemnumber(row,'e42') = 1 then
				setitem(row,'e42',0)
			else
				setitem(row,'e42',1)
			end if
		case 'dent43'
			if getitemnumber(row,'e43') = 1 then
				setitem(row,'e43',0)
			else
				setitem(row,'e43',1)
			end if
		case 'dent44'
			if getitemnumber(row,'e44') = 1 then
				setitem(row,'e44',0)
			else
				setitem(row,'e44',1)
			end if
		case 'dent45'
			if getitemnumber(row,'e45') = 1 then
				setitem(row,'e45',0)
			else
				setitem(row,'e45',1)
			end if
		case 'dent46'
			if getitemnumber(row,'e46') = 1 then
				setitem(row,'e46',0)
			else
				setitem(row,'e46',1)
			end if
		case 'dent47'
			if getitemnumber(row,'e47') = 1 then
				setitem(row,'e47',0)
			else
				setitem(row,'e47',1)
			end if
		case 'dent48'
			if getitemnumber(row,'e48') = 1 then
				setitem(row,'e48',0)
			else
				setitem(row,'e48',1)
			end if
		case 'dent51'
			if getitemnumber(row,'e51') = 1 then
				setitem(row,'e51',0)
			else
				setitem(row,'e51',1)
			end if
		case 'dent52'
			if getitemnumber(row,'e52') = 1 then
				setitem(row,'e52',0)
			else
				setitem(row,'e52',1)
			end if
		case 'dent53'
			if getitemnumber(row,'e53') = 1 then
				setitem(row,'e53',0)
			else
				setitem(row,'e53',1)
			end if
		case 'dent54'
			if getitemnumber(row,'e54') = 1 then
				setitem(row,'e54',0)
			else
				setitem(row,'e54',1)
			end if
		case 'dent55'
			if getitemnumber(row,'e55') = 1 then
				setitem(row,'e55',0)
			else
				setitem(row,'e55',1)
			end if
		case 'dent61'
			if getitemnumber(row,'e61') = 1 then
				setitem(row,'e61',0)
			else
				setitem(row,'e61',1)
			end if
		case 'dent62'
			if getitemnumber(row,'e62') = 1 then
				setitem(row,'e62',0)
			else
				setitem(row,'e62',1)
			end if
		case 'dent63'
			if getitemnumber(row,'e63') = 1 then
				setitem(row,'e63',0)
			else
				setitem(row,'e63',1)
			end if
		case 'dent64'
			if getitemnumber(row,'e64') = 1 then
				setitem(row,'e64',0)
			else
				setitem(row,'e64',1)
			end if
		case 'dent65'
			if getitemnumber(row,'e65') = 1 then
				setitem(row,'e65',0)
			else
				setitem(row,'e65',1)
			end if
		case 'dent71'
			if getitemnumber(row,'e71') = 1 then
				setitem(row,'e71',0)
			else
				setitem(row,'e71',1)
			end if
		case 'dent72'
			if getitemnumber(row,'e72') = 1 then
				setitem(row,'e72',0)
			else
				setitem(row,'e72',1)
			end if
		case 'dent73'
			if getitemnumber(row,'e73') = 1 then
				setitem(row,'e73',0)
			else
				setitem(row,'e73',1)
			end if
		case 'dent74'
			if getitemnumber(row,'e74') = 1 then
				setitem(row,'e74',0)
			else
				setitem(row,'e74',1)
			end if
		case 'dent75'
			if getitemnumber(row,'e75') = 1 then
				setitem(row,'e75',0)
			else
				setitem(row,'e75',1)
			end if
		case 'dent81'
			if getitemnumber(row,'e81') = 1 then
				setitem(row,'e81',0)
			else
				setitem(row,'e81',1)
			end if
		case 'dent82'
			if getitemnumber(row,'e82') = 1 then
				setitem(row,'e82',0)
			else
				setitem(row,'e82',1)
			end if
		case 'dent83'
			if getitemnumber(row,'e83') = 1 then
				setitem(row,'e83',0)
			else
				setitem(row,'e83',1)
			end if
		case 'dent84'
			if getitemnumber(row,'e84') = 1 then
				setitem(row,'e84',0)
			else
				setitem(row,'e84',1)
			end if
		case 'dent85'
			if getitemnumber(row,'e85') = 1 then
				setitem(row,'e85',0)
			else
				setitem(row,'e85',1)
			end if
		case 'b_copiertrait'
			String ls_traitement, ls_oldtraitement
			Integer li_idcarteentete
			if not isnull(this.getitemstring( row, 'traitsugg')) then 
				ls_traitement = this.getitemstring( row, 'traitsugg') + " " 
			end if
			if not isnull(this.getitemstring( row, 'complorthorec')) then 
				ls_traitement = ls_traitement + this.getitemstring( row, 'complorthorec') + " " 
			end if
			if not isnull(this.getitemstring( row, 'evalexo')) then 
				ls_traitement = ls_traitement + this.getitemstring( row, 'evalexo') + " " 
			end if
			if not isnull(this.getitemstring( row, 'rpe')) then 
				ls_traitement = ls_traitement + this.getitemstring( row, 'rpe') + " " 
			end if
			if not isnull(this.getitemstring( row, 'fixedapp')) then 
				ls_traitement = ls_traitement + this.getitemstring( row, 'fixedapp') + " " 
			end if
			if not isnull(this.getitemstring( row, 'other1')) then 
				ls_traitement = ls_traitement + this.getitemstring( row, 'other1') + " " 
			end if
			if not isnull(this.getitemstring( row, 'other2')) then 
				ls_traitement = ls_traitement + this.getitemstring( row, 'other2') + " " 
			end if
			select traitement, id_carteentete into :ls_oldtraitement, :li_idcarteentete from t_carteentete where patient_id = :il_patid;
			if not isnull(ls_oldtraitement) then 
				ls_traitement = ls_traitement + " " + ls_oldtraitement
			end if
			if li_idcarteentete > 0 then
				update t_carteentete set traitement = :ls_traitement where patient_id = :il_patid;
				if gf_sqlerr() then
					commit using SQLCA;
				else
					rollback using SQLCA;
				end if
			else
				insert into t_carteentete(patient_id,traitement) values(:il_patid,:ls_traitement);
				if gf_sqlerr() then
					commit using SQLCA;
				else
					rollback using SQLCA;
				end if
			end if
	end choose
	SetRedraw(true)
end if
end event

event rbuttondown;scrolltorow(getclickedrow())
m_ficheconsult my_menu
my_menu = create m_ficheconsult
m_ficheconsult.popmenu (pointerx(), pointery())

end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

type p_unlockcons from picture within tabpage_rapcons
integer x = 2130
integer y = 4
integer width = 91
integer height = 80
string picturename = "C:\ii4net\orthotek\images\unlock.jpg"
boolean focusrectangle = false
end type

type tabpage_refa from userobject within tab_dosspat
event create ( )
event destroy ( )
integer x = 18
integer y = 200
integer width = 3598
integer height = 1740
long backcolor = 79741120
string text = "Référé à"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_dosspatrefa dw_dosspatrefa
end type

on tabpage_refa.create
this.dw_dosspatrefa=create dw_dosspatrefa
this.Control[]={this.dw_dosspatrefa}
end on

on tabpage_refa.destroy
destroy(this.dw_dosspatrefa)
end on

type dw_dosspatrefa from u_dw within tabpage_refa
event ue_update ( )
integer width = 3607
integer height = 1740
integer taborder = 40
string title = "dosspatrefa"
string dataobject = "d_dosspatrefa"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();long ll_id

accepttext()
if tab_dosspat.tabpage_dosspat.dw_dosspat.update() = 1 then 
	commit using SQLCA;
else
	rollback;
	error_type(50)
end if
//appliquer sur le patient
IF getrow() > 0 THEN
	ll_id = getitemnumber(getrow(),'id')
	if not ll_id > 0 or isnull(ll_id) then
		select max(id) into :ll_id from t_referents where ortho_id = :v_no_ortho;
		if ll_id > 0 then
			update patient set id_ref = :ll_id where patient_id = :il_patid;
			commit;
		end if
	else
		if ll_id > 0 then
			update patient set id_ref = :ll_id where patient_id = :il_patid;
			commit;
		end if
	end if
END IF
change = false
end event

event constructor;if v_langue = 'an' then
	object.t_title.text = 'Referral'
	object.t_titre.text = 'Title:'
	object.t_nom.text = 'Last name:'
	object.t_prenom.text = 'First name:'
	object.t_adresse.text = 'Address:'
	object.t_ville.text = 'City:'
	object.t_province.text = 'Province:'
	object.t_zip.text = 'Postal code:'
	object.t_fax.text = 'Fax:'
	object.t_telbur.text = 'Office phone:'
	object.t_email.text = 'Email:'
	object.t_langue.text = 'Language:'
	object.t_note.text = 'Note:'
	object.ref_province.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/British Columbia~tBritish Colombia/NewFoundland~tNewFoundland/New Brunswick~tNew Brunswick/Nova Scotia~tNova Scotia/Price Edward island~tPrice Edward island/Yukon~tYukon/North West Territory~tNorthwest Territories'
else
	object.ref_province.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/Colombie Britanique~tColombie Britanique/Terre neuve~tTerre Neuve/Nouveau Brunswick~tNouveau Brunswick/Nouvelle Écosse~tNouvelle Écosse/Île-du-Price-Edward~tÎle-du-Price-Edward/Yukon~tYukon/Territoires du Nord-Ouest~tTerritoire du Nord-Ouest'
end if
SetTransObject(SQLCA)
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

type uo_calutil1 from u_calutil within w_dossier_patients
boolean visible = false
integer x = 3013
integer y = 676
integer taborder = 20
boolean border = true
end type

on uo_calutil1.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'archivedate',istr_calutil.caldate)
end event

type cb_transfert from commandbutton within w_dossier_patients
integer x = 974
integer y = 1960
integer width = 494
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Transfert"
end type

event clicked;string ls_sign
blob lblob_sign
integer li_num, li_bytes
long ll_x, ll_y, ll_consultid
n_signature luo_sign

CHOOSE CASE ii_index
	CASE 7 // Correspondance
		open(w_scan)
	case 12
		
		ll_x = UnitsToPixels(integer(tab_dosspat.tabpage_traitreq.dw_traitreq.object.p_sign.width), XUnitsToPixels!)
		ll_y = UnitsToPixels(integer(tab_dosspat.tabpage_traitreq.dw_traitreq.object.p_sign.height), YUnitsToPixels!)
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("DimensionX",ll_x)
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("DimensionY",ll_y)
		
		open(w_signature)
		
		ls_sign = string(gnv_app.inv_entrepotglobal.of_retournedonnee("Signaturedentiste"))
		if ls_sign <> "" then
			ll_consultid = tab_dosspat.tabpage_traitreq.dw_traitreq.getItemNumber(tab_dosspat.tabpage_traitreq.dw_traitreq.getRow(),'t_consultations_id')
			luo_sign.of_setsignature(ls_sign, 1, ll_consultid)	
			luo_sign.of_affichesign(tab_dosspat.tabpage_traitreq.dw_traitreq,1,ll_consultid)
		end if
	
	CASE ELSE
		open(w_dosspattransfert)
END CHOOSE

//choose case ii_index
//	case 7 // Correspondance
//		open(w_scan)
//	case else
//		open(w_dosspattransfert)
//end choose



//Code pour l'ancienne imagerie
//string ls_patid, ls_dosspat, ls_type, ls_emplacement, ls_chemin
//long ll_typeimg
//
//select chemPhoto, typeimaging into :ls_chemin, :ll_typeimg from t_options where ortho_id = :v_no_ortho;
//
//	ls_patid = string(tab_dosspat.tabpage_dosspat.dw_dosspat.getitemnumber(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"patient_id"))
//	ls_dosspat = tab_dosspat.tabpage_dosspat.dw_dosspat.getitemstring(tab_dosspat.tabpage_dosspat.dw_dosspat.getrow(),"new_dossier")
//	if isnull(ls_dosspat) or ls_dosspat = '' then
//		error_type(142)
//	else
//		open(w_choiximage) 
//		setpointer(hourglass!)
//		ls_type = string(message.doubleparm)
//		if ll_typeimg = 1 then
//			ls_emplacement = ls_chemin + "\" + ls_dosspat
//			if FileExists(ls_emplacement) = false then
//				CreateDirectoryA(ls_emplacement,0)
//				ls_emplacement = ls_chemin + "\" + ls_dosspat + "\" + ls_type
//				CreateDirectoryA(ls_emplacement,0)
//			else
//				ls_emplacement = ls_chemin + "\" + ls_dosspat + "\" + ls_type
//				if FileExists(ls_emplacement) = false then
//					CreateDirectoryA(ls_emplacement,0)
//				end if
//			end if
//			setpointer(hourglass!)
//			run("c:\ii4net\orthotek\jre\bin\java -Xmx256m -jar Imaging.jar " + ls_patid + " " + ls_type,Minimized!)
//		else
//			ls_emplacement = ls_chemin + "\" + ls_patid
//			if FileExists(ls_emplacement) = false then
//				CreateDirectoryA(ls_emplacement,0)
//				ls_emplacement = ls_chemin + "\" + ls_patid + "\" + ls_type
//				CreateDirectoryA(ls_emplacement,0)
//			else
//				ls_emplacement = ls_chemin + "\" + ls_patid + "\" + ls_type
//				if FileExists(ls_emplacement) = false then
//					CreateDirectoryA(ls_emplacement,0)
//				end if
//			end if
//			setpointer(hourglass!)
//			run("c:\ii4net\orthotek\jre\bin\java -Xmx256m -jar Imaging.jar " + ls_patid + " " + ls_type,Minimized!)	
//		end if
//	end if
//
end event

event constructor;if v_langue = 'an' then
	this.Text = "Transfert"
end if
end event

type cb_update from commandbutton within w_dossier_patients
integer x = 2491
integer y = 1960
integer width = 558
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;
string ls_corrpath, ls_filename, ls_datecorr
boolean lb_ok = false
date ldt_datecorr
tab_dosspat.tabpage_cartetrait.dw_carteentete.AcceptText()

if ii_index = 7 then

	// Aller chercher la date de création
	
	ls_datecorr = tab_dosspat.tabpage_histocorr.dw_histocorr.getItemString(tab_dosspat.tabpage_histocorr.dw_histocorr.getRow(),"created")
	ldt_datecorr = date(left(ls_datecorr,10))
	if ldt_datecorr = today() then lb_ok = true
	if lb_ok = false then
		
		// Demander le mot de passe
		w_password_unlock lw_win
		OpenWithParm(lw_win, "")
		IF MEssage.StringParm = "ok" THEN lb_ok = true
		
	end if
		
	IF lb_ok THEN
	
		if tab_dosspat.tabpage_histocorr.dw_histocorr.dataobject = 'd_dosspatcorrletter' then
			
			if tab_dosspat.tabpage_histocorr.dw_histocorr.getRow() = 0 then return
			
			ls_filename = tab_dosspat.tabpage_histocorr.dw_histocorr.getitemstring(tab_dosspat.tabpage_histocorr.dw_histocorr.getrow(),'corrletter')
			
			if error_type(240) = 1 then
			
				select corrpath into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
				if match(upper(ls_filename),'JPG') then
					FileDelete ( ls_corrpath + '\' + string(il_patid) + '\scan\' + ls_filename )
				else
					FileDelete ( ls_corrpath + '\' + string(il_patid) + '\' + ls_filename )
					FileDelete ( ls_corrpath + '\' + string(il_patid) + '\.' + ls_filename ) 
				end if
				
				// Logger les correspondance
				
				insert into t_logs(actions,intable,logdate,montant,heure,pers,datetrans,iddel,idpat)
				values('del','corr',today(),:ls_filename,now(),:gs_user,:ldt_datecorr,0,:il_patid);
				error_type(-1)
				
				tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
				
			end if
			
		else
			tab_dosspat.tabpage_histocorr.dw_histocorr.deleterow(tab_dosspat.tabpage_histocorr.dw_histocorr.getrow())
			tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_update()
		end if		
			
	end if
else
	sauve(ii_index)
end if
end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Update"
end if
end event

type cb_close from commandbutton within w_dossier_patients
integer x = 3054
integer y = 1960
integer width = 581
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;long ll_row

if change then
	if error_type(200) = 1 then
		sauve(ii_index)
	end if
end if
Close(parent)
w_patient.afficher_info()
w_patient.verif_entente()
w_patient.cbrefresh()
if isvalid(w_stats1) then
	w_stats1.dw_stats1.event ue_retrieve()
end if
end event

event destructor;if Maj_liste = 1 then
	//w_patient.dw_patient_master.retrieve(v_no_ortho)
end if	
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_dossier_patients
integer y = 1960
integer width = 480
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long ll_newrow, ll_id, ll_iddentist, ll_contactid[], ll_iduser, ll_idpatcorr[], ll_phase[]
string ls_langue,ls_prov,ls_add,ls_ville,ls_zip,ls_telres, ls_corrpath, ls_tmplangue, ls_user
int li_filenum
date	ld_today, ld_compare
select corrpath into :ls_corrpath from t_options where ortho_id = :v_no_ortho;

choose case ii_index
	case 1 // dosspat
		if change then
			if error_type(200) = 1 then
				sauve(ii_index)
			end if
		end if
		tab_dosspat.tabpage_dosspat.dw_dosspat.event ue_insert()
	case 2 // resp 
		select province,adresse,ville,code_postale,langue,tel_maison into :ls_prov,:ls_add,:ls_ville,:ls_zip,:ls_langue,:ls_telres 
		from patient where patient_id = :il_patid;
		ll_newrow = tab_dosspat.tabpage_resp.dw_dosspatrespfin.insertrow(0)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'patient_id',il_patid)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'ortho_id',v_no_ortho)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'province',ls_prov)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'adresse',ls_add)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'ville',ls_ville)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'zip',ls_zip)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'langue',ls_langue)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetItem(ll_newrow,'telres',ls_telres)
		if tab_dosspat.tabpage_resp.dw_dosspatrespfin.getItemString(tab_dosspat.tabpage_resp.dw_dosspatrespfin.getRow(),'province') <> 'USA' then
			tab_dosspat.tabpage_resp.dw_dosspatrespfin.modify("zip.EditMask.Mask = '!#! #!#'")
		else
			tab_dosspat.tabpage_resp.dw_dosspatrespfin.modify("zip.EditMask.Mask = ''")
		end if
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.scrolltorow(ll_newrow)
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.SetFocus()
	case 3 // contrat
		tab_dosspat.tabpage_contrat.dw_contrat.event ue_setcontrat()
	case 4 // dentiste
		openwithparm(w_dosspatselectdent,il_patid,w_dossier_patients)
		select id_dentist into :il_denttraitreq from patient where patient_id = :il_patid;
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.retrieve(il_denttraitreq)
	case 5 // ref
		openwithparm(w_dosspatselectref,il_patid,w_dossier_patients)
		select referant_nom into :ll_id from patient where patient_id = :il_patid;
		tab_dosspat.tabpage_ref.dw_dosspatref.retrieve(ll_id)
	case 6 // rdv
	case 7 // correspondance
		if tab_dosspat.tabpage_histocorr.dw_histocorr.dataobject = 'd_dosspatcorrletter' then
			s_corrletter s_corr
			boolean lb_2k3 = false
			integer li_result
			string ls_versword
			
			li_result = RegistryGet("HKEY_CLASSES_ROOT\Word.Application\CurVer", "", RegString!, ls_versword)
			
			if li_result = 1 then
				if not isNull(ls_versword) then
					if ls_versword = "Word.Application.11" then lb_2k3 = true
				end if
			end if
			
			s_corr.patid = il_patid
			s_corr.letter = ''
			s_corr.flag = 'w'
			s_corr.mode = 'l'
			select id_contact,langue into :ll_contactid[1],:ls_langue from patient where patient_id = :il_patid;
			ll_phase[1] = 1
			ls_tmplangue = v_langue
			v_langue = ls_langue
			ll_idpatcorr[1] = il_patid
			gf_pat2excel(ll_idpatcorr,ll_contactid,ll_phase)
			gf_pat2xml(il_patid)
			v_langue = ls_tmplangue
			li_FileNum = fileOpen("C:\ii4net\orthotek\filedel.bat", LineMode!, Write!, lockReadWrite!, replace!)
			fileWrite(li_FileNum, 'del ' + ls_corrpath + '\' + string(il_patid) + '\.*.doc /f /q~r~nexit')
			fileClose(li_FileNum)
			
			run("C:\ii4net\orthotek\filedel.bat",minimized!)
			
			sleep(2)
			
			openwithparm(w_dosspatcorrletters,s_corr,w_principal)
//			w_word.title = "Corps de la lettre"
		else
			Opensheetwithparm(w_corpslettre,2,w_principal,2,layered!)
//			w_corpslettre.title = "Edition de lettre pour patient"
		end if
	case 8 // carte trait
		
		ld_today = date(today())

		//Demander le mot de passe de l'utilisateur en cours
		open(w_authuser)
		ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authenuser",FALSE))
		if ls_user <> 'Failed' then
			ll_iduser = long(ls_user)
			gnv_app.inv_entrepotglobal.of_ajoutedonnee( "read only carte", "non")
			s_pat st_pat
			
			st_pat.col = 0
			st_pat.patid = il_patid
			
			IF tab_dosspat.tabpage_cartetrait.dw_cartetrait.RowCount() > 0 THEN
				//Vérifier s'il y a une autre ligne pour la journée en cours
				ld_compare = date(tab_dosspat.tabpage_cartetrait.dw_cartetrait.object.datecarte[1])
				IF ld_compare = ld_today and ll_iduser = tab_dosspat.tabpage_cartetrait.dw_cartetrait.object.id_usersigne[1] THEN
					//Demander s'il veut modifier ou ajouter
					IF error_type(264) = 1 THEN
						//Rentrer plutôt en mode modification
						tab_dosspat.tabpage_cartetrait.dw_cartetrait.SetRow(1)
						tab_dosspat.tabpage_cartetrait.dw_cartetrait.ScrollToRow(1)
						of_modifiercarte(1)
						RETURN
					END IF 
					
				END IF
			END IF
		
			openwithparm(w_cartetrait,st_pat)
		end if		

	case 9 // age des comptes
	case 10 // etat de compte
		if change then
			if error_type(200) = 1 then
				sauve(ii_index)
			end if
		end if
		tab_dosspat.tabpage_etat.dw_etatcomptepat1.event ue_insert()
	case 11 // rap pré
		if change then
			if error_type(200) = 1 then
				sauve(ii_index)
			end if
		end if
		tab_dosspat.tabpage_rappre.dw_rapppre.event ue_insert()
//		openwithparm(w_dosspatselectdent,il_patid,w_dossier_patients)
//		open(w_dosspatselectcontact)
	case 12 // trait req
		if change then
			if error_type(200) = 1 then
				sauve(ii_index)
			end if
		end if
		tab_dosspat.tabpage_traitreq.dw_traitreq.event ue_insert()
	case 13 // rap consult
		if change then
			if error_type(200) = 1 then
				sauve(ii_index)
			end if
		end if
		tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.event ue_insert()
	case 14 // ref a
		openwithparm(w_dosspatselectrefa,il_patid,w_dossier_patients)
		select id_ref into :ll_id from patient where patient_id = :il_patid;
		tab_dosspat.tabpage_refa.dw_dosspatrefa.retrieve(ll_id)
end choose
end event

event constructor;if v_langue = 'an' then
	this.Text = "Add"
end if
end event

type cb_new from commandbutton within w_dossier_patients
integer x = 480
integer y = 1960
integer width = 494
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Liste noire"
end type

event clicked;long ll_newrow, ll_findrow
long ll_black, ll_idetatcomptepat

choose case ii_index
	CASE 1 // Dossier patient
		select 	id_blacklist
		into		:ll_black
		from 		t_blacklist 
		where 	enterdate is not null and 
					exitdate is null and 
					patient_id = :il_patid;
					
		if ll_black > 0 then
			update t_blacklist set exitdate = today() where id_blacklist = :ll_black;
			if error_type(-1) = 1 then
				commit using SQLCA;
				error_type(1000)
			else
				rollback using SQLCA;
			end if
			
			// Mettre les noms et prénoms en gris
			
			ll_findrow = w_patient.dw_patient_master.find("patient_id = " + string(il_patid),1, w_patient.dw_patient_master.rowcount())
			w_patient.dw_patient_master.setItem(ll_findrow,'blacklist',0)
			tab_dosspat.tabpage_dosspat.dw_dosspat.setItem( tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(), 'blacklist', 0)
		else
			insert into t_blacklist(patient_id,enterdate) values(:il_patid,today());
			if error_type(-1) = 1 then
				commit using SQLCA;
				error_type(199)
			else
				rollback using SQLCA;
			end if
			
			// Mettre les noms et prénoms en rouge
			
			ll_findrow = w_patient.dw_patient_master.find("patient_id = " + string(il_patid),1, w_patient.dw_patient_master.rowcount())
			w_patient.dw_patient_master.setItem(ll_findrow,'blacklist',1)
			tab_dosspat.tabpage_dosspat.dw_dosspat.setItem( tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(), 'blacklist', 1)
		end if	
	case 2 // responsable
		tab_dosspat.tabpage_resp.dw_dosspatrespfin.deleterow(tab_dosspat.tabpage_resp.dw_dosspatrespfin.getrow())
		change = true
	case 3 // contrat
		tab_dosspat.tabpage_contrat.dw_contrat.deleterow(tab_dosspat.tabpage_contrat.dw_contrat.getrow())
		change = true
	case 4 // dentiste
		ll_newrow = tab_dosspat.tabpage_dentist.dw_dosspatdentresp.insertrow(0)
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.SetItem(ll_newrow,'ortho_id',v_no_ortho)
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.SetItem(ll_newrow,'det_prov','QC')
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.SetItem(ll_newrow,'det_langue','fr')
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.SetItem(ll_newrow,'det_suf','Dr')
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.modify("det_zip.EditMask.Mask = '!#! #!#'")
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.scrolltorow(ll_newrow)
		tab_dosspat.tabpage_dentist.dw_dosspatdentresp.SetFocus()
		change = true
	case 5 // referent
		ll_newrow = tab_dosspat.tabpage_ref.dw_dosspatref.insertrow(0)
		tab_dosspat.tabpage_ref.dw_dosspatref.SetItem(ll_newrow,'ortho_id',v_no_ortho)
		tab_dosspat.tabpage_ref.dw_dosspatref.SetItem(ll_newrow,'ref_province','QC')
		tab_dosspat.tabpage_ref.dw_dosspatref.SetItem(ll_newrow,'ref_langue','fr')
		tab_dosspat.tabpage_ref.dw_dosspatref.SetItem(ll_newrow,'ref_suffix','Dr')
		tab_dosspat.tabpage_ref.dw_dosspatref.modify("ref_zip.EditMask.Mask = '!#! #!#'")
		tab_dosspat.tabpage_ref.dw_dosspatref.scrolltorow(ll_newrow)
		tab_dosspat.tabpage_ref.dw_dosspatref.SetFocus()
		change = true
	case 7
		gf_pat2xml(il_patid)
		Opensheetwithparm(w_description,1,w_principal,2,layered!)
		w_description.title = "Rapport de consultation"
	case 8
		openwithparm(w_rdvsequence,il_patid,w_dossier_patients)
	case 10
//		ll_idetatcomptepat = il_rapetat[il_indrapetat]
//		delete from t_etatcomptepat where id_etatcomptepat = :ll_idetatcomptepat;
//		if error_type(-1) = 1 then
//			commit using SQLCA;
//			tab_dosspat.tabpage_etat.dw_etatcomptepat1.event ue_setrapetat()
//			tab_dosspat.tabpage_etat.st_etat.event ue_title()
//			tab_dosspat.tabpage_etat.dw_etatcomptepat1.event ue_retrieve()
//		else
//			rollback using SQLCA;
//		end if
		
	case 11
		openwithparm(w_dosspatselectdent,il_patid,w_dossier_patients)
	case 12
		if not tab_dosspat.tabpage_traitreq.p_locktraite.visible then // and ib_modeajouttraitreq = false then
			openwithparm(w_dosspatselectdent,il_patid,w_dossier_patients)
		end if
end choose
end event

event constructor;if v_langue = 'an' then
	this.text = "Black list"
end if
end event

type cb_print from commandbutton within w_dossier_patients
integer x = 1934
integer y = 1960
integer width = 558
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;long ll_iddent, ll_id, ll_idetatcompte, ll_contid, k = 1
long row,ll_idcons, ll_cachechart, ll_idtrait
ulong lul_width, lul_height,picwidth,picheight
dec {5} var = 1
integer li_resp = 1,li_nbmois, li_err
integer li_option,li_hidecredits,li_typerapcons,i = 1
string ls_cnom,ls_cprenom,ls_cadd,ls_cville,ls_cprov,ls_czip,ls_ctel,ls_lien,ls_dentlang
string ls_respprenom,ls_respnom,ls_respadd,ls_respcity,ls_prov,ls_respzip,ls_resptel
string ls_nbmois,ls_surverdim,ls_surhordim,ls_artouvdim, ls_champdesc, ls_temp, ls_champres
string ls_drnom, ls_drprenom, ls_salutation, ls_svu, ls_shu, ls_aou, ls_langue, ls_email, ls_email1, ls_email2, ls_email3
string ls_imgfolder,ls_path,ls_lat,ls_front,ls_frontsmile,ls_pathlat,ls_pathfront,ls_pathfrontsmile, ls_mail[], ls_courriel
date ldt_datenais
n_signature luo_sign

if change then
//	if error_type(200) = 1 then
		sauve(ii_index)
//	end if
end if

// choix de la langue pour l'impression

if tab_dosspat.tabpage_traitreq.dw_traitreq.getRow() > 0 then
	ll_iddent = tab_dosspat.tabpage_traitreq.dw_traitreq.getItemNumber(tab_dosspat.tabpage_traitreq.dw_traitreq.getRow(),'t_consultations_id_dentist')
else
	select id_dentist into :ll_iddent from patient where patient_id = :il_patid;
	select det_langue into :ls_dentlang from t_dentists where id_dentist = :ll_iddent;
end if

select langue into :is_patlang from patient where patient_id = :il_patid;
if isnull(ls_dentlang) then ls_dentlang = is_patlang

choose case ii_index
	case 1 // dossier patient
		datastore ds_dospatimp
		ds_dospatimp = create datastore
		ds_dospatimp.dataobject = "d_dospatimp"
		ds_dospatimp.SetTransObject(SQLCA)
		ds_dospatimp.retrieve(il_patid)
		ds_dospatimp.object.t_age.text = tab_dosspat.tabpage_dosspat.dw_dosspat.object.t_age.text
		select dr_nom_complet into :ls_drnom from  ortho_id where ortho_id = :v_no_ortho;
		ds_dospatimp.object.t_titre.text = "DOSSIER PATIENT ( " + ls_drnom + " )"
		declare resp cursor for
			select nom,prenom,adresse,ville,province,zip,telbur 
			from t_contact 
			where patient_id = :il_patid and 
					(t_contact.pat <> 1 or t_contact.pat is null)
			order by	t_contact.id_contact asc;
		open resp;
			fetch resp into :ls_cnom,
								 :ls_cprenom,
								 :ls_cadd,
								 :ls_cville,
								 :ls_cprov,
								 :ls_czip,
								 :ls_ctel;
			do while sqlca.sqlcode = 0
				ds_dospatimp.setitem(ds_dospatimp.getrow(),'nomresp'+string(i),ls_cprenom + ' ' + ls_cnom)
				ds_dospatimp.setitem(ds_dospatimp.getrow(),'addresp'+string(i),ls_cadd)
				ds_dospatimp.setitem(ds_dospatimp.getrow(),'cityresp'+string(i),ls_cville)
				ds_dospatimp.setitem(ds_dospatimp.getrow(),'zipresp'+string(i),ls_czip)
				ds_dospatimp.setitem(ds_dospatimp.getrow(),'telresp'+string(i),ls_ctel)
				fetch resp into :ls_cnom,
								 :ls_cprenom,
								 :ls_cadd,
								 :ls_cville,
								 :ls_cprov,
								 :ls_czip,
								 :ls_ctel;
				i++
			loop
		close resp;
		gi_imp = 1
		gb_datawindow = false
		openwithparm(w_print_options,ds_dospatimp)
		destroy ds_dospatimp
	case 10 // etat de compte
		n_ds ds_etatcomptestd
		ds_etatcomptestd = create n_ds
	   ds_etatcomptestd.dataobject = "d_etatcomptepat"
	   ds_etatcomptestd.setTransObject(SQLCA)
		
		datastore ds_etatcomptepat
		ds_etatcomptepat = create datastore
		ds_etatcomptepat.dataobject = "d_etatcomptepat"
		if is_patlang = 'A' then
			ds_etatcomptestd.object.t_ref.text = 'Reference:'
			ds_etatcomptestd.object.t_file.text = 'File:'
			ds_etatcomptestd.object.t_ref1.text = 'Reference:'
			ds_etatcomptestd.object.t_file1.text = 'File:'
			ds_etatcomptestd.object.t_mere.text = 'Responsible:'
			ds_etatcomptestd.object.t_montantdu.text = 'Payment due'
			ds_etatcomptestd.object.t_printedon.text = 'Printed on'
			ds_etatcomptestd.object.t_solde.text = 'Balance'
			ds_etatcomptestd.object.t_payinclus.text = 'Payment enclosed'
			ds_etatcomptestd.object.t_card.text = 'Card #: ____________________________'
			ds_etatcomptestd.object.t_dateexp.text = 'Exp. date: __________________'
			ds_etatcomptestd.object.t_note1.text = 'Please detach this portion and return with your payment'
			ds_etatcomptestd.object.t_etat.text = 'STATEMENT'
			ds_etatcomptestd.object.t_dernpaie.text = 'Last payment'
			ds_etatcomptestd.object.t_couttrait.text = 'Cost of~r~ntreatment'
			ds_etatcomptestd.object.t_montdu.text = 'Payment due'
			ds_etatcomptestd.object.t_courant.text = 'Current'
			ds_etatcomptestd.object.t_3160.text = '31-60 days'
			ds_etatcomptestd.object.t_6190.text = '61-90 days'
			ds_etatcomptestd.object.t_90plus.text = '90 days +'
			ds_etatcomptestd.object.t_paytot.text = 'Please pay this amount'
			ds_etatcomptestd.object.t_Remarks.text = 'Remarks'
			//----------------------------------------------------
			ds_etatcomptepat.object.t_ref.text = 'Reference:'
			ds_etatcomptepat.object.t_file.text = 'File:'
			ds_etatcomptepat.object.t_ref1.text = 'Reference:'
			ds_etatcomptepat.object.t_file1.text = 'File:'
			ds_etatcomptepat.object.t_mere.text = 'Responsible:'
			ds_etatcomptepat.object.t_montantdu.text = 'Payment due'
			ds_etatcomptepat.object.t_printedon.text = 'Printed on'
			ds_etatcomptepat.object.t_solde.text = 'Balance'
			ds_etatcomptepat.object.t_payinclus.text = 'Payment enclosed'
			ds_etatcomptepat.object.t_card.text = 'Card #: ____________________________'
			ds_etatcomptepat.object.t_dateexp.text = 'Exp. date: __________________'
			ds_etatcomptepat.object.t_note1.text = 'Please detach this portion and return with your payment'
			ds_etatcomptepat.object.t_etat.text = 'STATEMENT'
			ds_etatcomptepat.object.t_dernpaie.text = 'Last payment'
			ds_etatcomptepat.object.t_couttrait.text = 'Cost of~r~ntreatment'
			ds_etatcomptepat.object.t_montdu.text = 'Payment due'
			ds_etatcomptepat.object.t_courant.text = 'Current'
			ds_etatcomptepat.object.t_3160.text = '31-60 days'
			ds_etatcomptepat.object.t_6190.text = '61-90 days'
			ds_etatcomptepat.object.t_90plus.text = '90 days +'
			ds_etatcomptepat.object.t_paytot.text = 'Please pay this amount'
			ds_etatcomptepat.object.t_Remarks.text = 'Remarks'
		end if
		select hidecredits into :li_hidecredits from t_options where ortho_id = :v_no_ortho;
		if li_hidecredits = 1 then
			ds_etatcomptestd.object.r_visa.visible = false
			ds_etatcomptestd.object.t_visa.visible = false
			ds_etatcomptestd.object.r_mc.visible = false
			ds_etatcomptestd.object.t_mc.visible = false
			ds_etatcomptestd.object.r_amex.visible = false
			ds_etatcomptestd.object.t_amex.visible = false
			ds_etatcomptestd.object.t_card.visible = false
			ds_etatcomptestd.object.t_dateexp.visible = false
			ds_etatcomptestd.object.t_signature.visible = false
			//---------------------------------------------
			ds_etatcomptepat.object.r_visa.visible = false
			ds_etatcomptepat.object.t_visa.visible = false
			ds_etatcomptepat.object.r_mc.visible = false
			ds_etatcomptepat.object.t_mc.visible = false
			ds_etatcomptepat.object.r_amex.visible = false
			ds_etatcomptepat.object.t_amex.visible = false
			ds_etatcomptepat.object.t_card.visible = false
			ds_etatcomptepat.object.t_dateexp.visible = false
			ds_etatcomptepat.object.t_signature.visible = false
		end if
		ds_etatcomptepat.SetTransObject(SQLCA)
		
//		select max(traitement_id) into :ll_idtrait from traitements where patient_id = :il_patid;

		ll_idetatcompte = tab_dosspat.tabpage_etat.ddlb_etat.of_getselectedData()
		if ll_idetatcompte = 0 then
			select max(id_etatcomptepat) into :ll_idetatcompte from t_etatcomptepat where patient_id = :il_patid;
			if ll_idetatcompte = 0 or isnull(ll_idetatcompte) then setnull(ll_idetatcompte)
		end if
	
		ll_contid = tab_dosspat.tabpage_etat.ddlb_resp.of_getSelectedData()
		if ll_contid = 0 then setnull(ll_contid)
			
		ds_etatcomptestd.retrieve(il_patid, ll_contid, ll_idetatcompte)
		//-------------------------------------------------------------
		ds_etatcomptepat.retrieve(il_patid, ll_contid, ll_idetatcompte)
		
		select email, email2, email3 into :ls_email1, :ls_email2, :ls_email3 from patient where patient_id = :il_patid;
		if isnull(ls_email) then ls_email = ""		
		if isnull(ls_email2) then ls_email2 = ""
		if isnull(ls_email3) then ls_email3 = ""
		ls_email = ls_email1
		if ls_email2 <> '' then ls_email += ';' + ls_email2
		if ls_email3 <> '' then ls_email += ';' + ls_email3
		
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_email)
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("etatcompte pour impression courriel", ds_etatcomptestd)
		
		gb_datawindow = false
		openwithparm(w_print_options,ds_etatcomptepat)
		
		
		destroy ds_etatcomptepat
		
		// Logguer l'envoi d'un état de compte
		
		if v_langue = 'an' then
			insert into t_histonote(datehisto,histonote,id_personnel,patient_id)
			values(current timestamp, 'Statement is printed',:gl_idpers,:il_patid);
		else
			insert into t_histonote(datehisto,histonote,id_personnel,patient_id)
			values(current timestamp, 'Imprimer un état de compte',:gl_idpers,:il_patid);
		end if
		if error_type(-1) = 1 then
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
		
	CASE 7 // Correspondance
		
		of_importer()
		
	case 8 // Carte de traitement
		
		datastore ds_cartetrait
		ds_cartetrait = create datastore
		ds_cartetrait.dataobject = 'd_cartetraitementimp'
		ds_cartetrait.setTransObject(SQLCA)
		
		if v_langue = 'an' then
			ds_cartetrait.object.typeds.values = "Days~t1/Weeks~t2/Months~t3/Years~t4"
		else
			ds_cartetrait.object.typeds.values = "Jours~t1/Semaines~t2/Mois~t3/Années~t4"
		end if

		datawindowchild dwc_typetrait
		if ds_cartetrait.getChild("type_traitement_id",dwc_typetrait) = -1 then
			error_type(50)
		end if
		dwc_typetrait.setTransObject(SQLCA)
		dwc_typetrait.retrieve(v_no_ortho)
		
		ds_cartetrait.retrieve(il_patid)
		gb_datawindow = false
		openwithparm(w_print_options,ds_cartetrait)
		destroy ds_cartetrait
		
	case 9 // age des comptes
		gb_datawindow = true
		openwithparm(w_print_options,tab_dosspat.tabpage_etat.dw_etatcomptepat1)
	case 13 //consultation
		datastore ds_dosspatficheconsult
		ds_dosspatficheconsult = create datastore
		// choix du rapport de consultation
		select typerapcons into :li_typerapcons from t_options where ortho_id = :v_no_ortho;
		choose case li_typerapcons 
			case 1
				ds_dosspatficheconsult.dataobject = 'd_dosspatficheconsultimp'
			case 2
				ds_dosspatficheconsult.dataobject = 'd_rapconsultluigiimp'
				select dr_nom_complet into :ls_drnom from  ortho_id where ortho_id = :v_no_ortho;
				ds_dosspatficheconsult.object.t_titre.text = "DOSSIER PATIENT ( " + ls_drnom + " )"	
			case 3
				ds_dosspatficheconsult.dataobject = 'd_rapconsultvenneri'
			case 4
				ds_dosspatficheconsult.dataobject = 'd_rapconsultdrouin'
			case 5
				ds_dosspatficheconsult.dataobject = 'd_rapconsultberube'
			case 6
				ds_dosspatficheconsult.dataobject = 'd_rapconsultmiron'
			case 7
				ds_dosspatficheconsult.dataobject = 'd_rapconsultgariepyimp'
				select dr_nom_complet into :ls_drnom from  ortho_id where ortho_id = :v_no_ortho;
				ds_dosspatficheconsult.object.t_titre.text = "DOSSIER PATIENT ( " + ls_drnom + " )"	
		end choose
		ds_dosspatficheconsult.SetTransObject(SQLCA)
		// traduction
		choose case ds_dosspatficheconsult.dataobject
			case 'd_dosspatficheconsultimp'
//				if is_patlang = 'A' then
//					ds_dosspatficheconsult.object.t_title.text = 'Consultation form'
//					ds_dosspatficheconsult.object.t_nom.text = 'Name:'
//					ds_dosspatficheconsult.object.t_add.text = 'Address:'
//					ds_dosspatficheconsult.object.t_ville.text = 'City:'
//					ds_dosspatficheconsult.object.t_telmaison.text = 'Home phone:'
//					ds_dosspatficheconsult.object.t_premvisit.text = 'First visit:'
//					ds_dosspatficheconsult.object.t_ecole.text = 'School:'
//					ds_dosspatficheconsult.object.t_datenais.text = 'Date of Birth:'
				//	ds_dosspatficheconsult.object.t_assurance.text = 'Insurance:'
//					ds_dosspatficheconsult.object.t_langue.text = 'Language:'
//					ds_dosspatficheconsult.object.t_telbur.text = 'Office phone:'
//					ds_dosspatficheconsult.object.t_refpar.text = 'Refered by:'
//					ds_dosspatficheconsult.object.t_dentist.text = 'Dentist:'
//					ds_dosspatficheconsult.object.t_accpar.text = 'Accompanied by:'
//					ds_dosspatficheconsult.object.t_dents.text = 'Teeth'
//					ds_dosspatficheconsult.object.t_obs.text = 'Remarks'
//					ds_dosspatficheconsult.object.t_estime.text = 'Estimate'
//					ds_dosspatficheconsult.object.t_age.text = 'Age'
//					ds_dosspatficheconsult.object.t_printedon.text = 'Printed on:'
//					ds_dosspatficheconsult.object.t_classe.text = 'CLASS'
//				end if
				ds_dosspatficheconsult.retrieve(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getitemnumber(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getrow(),'t_consultations_id'))
				select date_naissance into :ldt_datenais from patient where patient_id = :il_patid;
				ds_dosspatficheconsult.object.t_age.text = calculage(ldt_datenais)
		
			case 'd_rapconsultluigiimp'
				ds_dosspatficheconsult.retrieve(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getitemnumber(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getrow(),'id_rapconsult1'))
				DECLARE responsable CURSOR FOR

					select prenom,nom,adresse,ville,province,zip,telres
					from t_contact
					where patient_id = :il_patid
					order by id_contact asc;
				
				OPEN responsable;
				
				FETCH responsable INTO :ls_respprenom,:ls_respnom,:ls_respadd,:ls_respcity,:ls_prov,:ls_respzip,:ls_resptel;
				
				DO WHILE SQLCA.SQLCODE = 0
					if i = 1 then
						ds_dosspatficheconsult.setitem(1,'patient_nomresp1',ls_respprenom + ' ' + ls_respnom)
						ds_dosspatficheconsult.setitem(1,'patient_addresp1',ls_respadd)
						ds_dosspatficheconsult.setitem(1,'patient_cityresp1',ls_respcity)
						ds_dosspatficheconsult.setitem(1,'patient_zipresp1',ls_respzip)
						ds_dosspatficheconsult.setitem(1,'patient_telresp1',ls_resptel)
					end if
					if i = 2 then
						ds_dosspatficheconsult.setitem(1,'patient_nomresp2',ls_respprenom + ' ' + ls_respnom)
						ds_dosspatficheconsult.setitem(1,'patient_addresp2',ls_respadd)
						ds_dosspatficheconsult.setitem(1,'patient_cityresp2',ls_respcity)
						ds_dosspatficheconsult.setitem(1,'patient_zipresp2',ls_respzip)
						ds_dosspatficheconsult.setitem(1,'patient_telresp2',ls_resptel)
					end if
					i++
					FETCH responsable INTO :ls_respprenom,:ls_respnom,:ls_respadd,:ls_respcity,:ls_prov,:ls_respzip,:ls_resptel;
				LOOP
				
				CLOSE responsable;
				
				select date_naissance into :ldt_datenais from patient where patient_id = :il_patid;
				ds_dosspatficheconsult.object.t_age.text = calculage(ldt_datenais)
			case 'd_rapconsultgariepyimp'
				ds_dosspatficheconsult.retrieve(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getitemnumber(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getrow(),'id_rapconsult1'))
				DECLARE respons CURSOR FOR

					select prenom,nom,adresse,ville,province,zip,telres
					from t_contact
					where patient_id = :il_patid
					order by id_contact asc;
				
				OPEN respons;
				
				FETCH responsable INTO :ls_respprenom,:ls_respnom,:ls_respadd,:ls_respcity,:ls_prov,:ls_respzip,:ls_resptel;
				
				DO WHILE SQLCA.SQLCODE = 0
					if i = 1 then
						ds_dosspatficheconsult.setitem(1,'patient_nomresp1',ls_respprenom + ' ' + ls_respnom)
						ds_dosspatficheconsult.setitem(1,'patient_addresp1',ls_respadd)
						ds_dosspatficheconsult.setitem(1,'patient_cityresp1',ls_respcity)
						ds_dosspatficheconsult.setitem(1,'patient_zipresp1',ls_respzip)
						ds_dosspatficheconsult.setitem(1,'patient_telresp1',ls_resptel)
					end if
					if i = 2 then
						ds_dosspatficheconsult.setitem(1,'patient_nomresp2',ls_respprenom + ' ' + ls_respnom)
						ds_dosspatficheconsult.setitem(1,'patient_addresp2',ls_respadd)
						ds_dosspatficheconsult.setitem(1,'patient_cityresp2',ls_respcity)
						ds_dosspatficheconsult.setitem(1,'patient_zipresp2',ls_respzip)
						ds_dosspatficheconsult.setitem(1,'patient_telresp2',ls_resptel)
					end if
					i++
					FETCH respons INTO :ls_respprenom,:ls_respnom,:ls_respadd,:ls_respcity,:ls_prov,:ls_respzip,:ls_resptel;
				LOOP
				
				CLOSE respons;
				
				select date_naissance into :ldt_datenais from patient where patient_id = :il_patid;
				ds_dosspatficheconsult.object.t_age.text = calculage(ldt_datenais)
			case 'd_rapconsultvenneri'
				ll_id = tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getitemnumber(tab_dosspat.tabpage_rapcons.dw_dosspatficheconsult.getrow(),'id_rapconsult1')
				ds_dosspatficheconsult.setFilter("id_rapconsult1 = " + string(ll_id))
				li_err = ds_dosspatficheconsult.retrieve(il_patid)
				select imgfolder,chemphoto into :ls_imgfolder,:ls_path from t_options where ortho_id = :v_no_ortho;
			// indique l'emplacement du pan initial
				select "lateral",anterioroccl,front_smile
				into :ls_lat,:ls_front,:ls_frontsmile
				from t_imagerie 
				where patient_id = :il_patid and sequence = 1;
				ls_pathlat = ls_path + '\' + string(il_patid) + '\1\small\' + ls_lat
				ls_pathfront = ls_path + '\' + string(il_patid) + '\1\small\' + ls_front
				ls_pathfrontsmile = ls_path + '\' + string(il_patid) + '\1\small\' + ls_frontsmile
		
				if FileExists(ls_pathlat) then
					tab_dosspat.tabpage_rapcons.p_size.PictureName = ls_pathlat
					tab_dosspat.tabpage_rapcons.p_size.OriginalSize = true
			//		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
			//		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
					lul_width = tab_dosspat.tabpage_rapcons.p_size.Width
					lul_height = tab_dosspat.tabpage_rapcons.p_size.Height
					if lul_width > 1500 then
						var = lul_width / 1500
					end if
					if lul_height / var > 550 then
						var = lul_height / 550
					end if
					picwidth = lul_width / var
					picheight = lul_height / var
					
					ds_dosspatficheconsult.object.p_lat.width = string(picwidth)
					ds_dosspatficheconsult.object.p_lat.height = string(picheight)
					ds_dosspatficheconsult.object.p_lat.FileName = ls_pathlat
					ds_dosspatficheconsult.object.p_lat.visible = true
				else
					ds_dosspatficheconsult.object.p_lat.visible = false
				end if
			
				if FileExists(ls_pathfront) then
					tab_dosspat.tabpage_rapcons.p_size.PictureName = ls_pathfront
					tab_dosspat.tabpage_rapcons.p_size.OriginalSize = true
			//		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
			//		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
					lul_width = tab_dosspat.tabpage_rapcons.p_size.Width
					lul_height = tab_dosspat.tabpage_rapcons.p_size.Height
					if lul_width > 1500 then
						var = lul_width / 1500
					end if
					if lul_height / var > 550 then
						var = lul_height / 550
					end if
					picwidth = lul_width / var
					picheight = lul_height / var
					
					ds_dosspatficheconsult.object.p_occ.width = string(picwidth)
					ds_dosspatficheconsult.object.p_occ.height = string(picheight)
					ds_dosspatficheconsult.object.p_occ.FileName = ls_pathfront
					ds_dosspatficheconsult.object.p_occ.visible = true
				else
					ds_dosspatficheconsult.object.p_occ.visible = false
				end if
			
				if FileExists(ls_pathfrontsmile) then
					tab_dosspat.tabpage_rapcons.p_size.PictureName = ls_pathfrontsmile
					tab_dosspat.tabpage_rapcons.p_size.OriginalSize = true
			//		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
			//		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
					lul_width = tab_dosspat.tabpage_rapcons.p_size.Width
					lul_height = tab_dosspat.tabpage_rapcons.p_size.Height
					if lul_width > 1500 then
						var = lul_width / 1500
					end if
					if lul_height / var > 550 then
						var = lul_height / 550
					end if
					picwidth = lul_width / var
					picheight = lul_height / var
					
					ds_dosspatficheconsult.object.p_frontsmile.width = string(picwidth)
					ds_dosspatficheconsult.object.p_frontsmile.height = string(picheight)
					ds_dosspatficheconsult.object.p_frontsmile.FileName = ls_pathfrontsmile
					ds_dosspatficheconsult.object.p_frontsmile.visible = true
				else
					ds_dosspatficheconsult.object.p_frontsmile.visible = false
				end if
			
				
			case 'd_rapconsultdrouin'
				li_err = ds_dosspatficheconsult.retrieve(il_patid)
				
			case 'd_rapconsultberube'
				li_err = ds_dosspatficheconsult.retrieve(il_patid)
				
			case 'd_rapconsultmiron'
				li_err = ds_dosspatficheconsult.retrieve(il_patid)
		end choose
		
		row = ds_dosspatficheconsult.getrow()
		
		gb_datawindow = false
		openwithparm(w_print_options,ds_dosspatficheconsult)
		destroy ds_dosspatficheconsult
		
	case 11 // rapport pre
		datastore ds_rapppreimp
		ds_rapppreimp = create datastore
		ds_rapppreimp.dataobject = "d_rapppreimp"
		ds_rapppreimp.setTransObject(SQLCA)
		ll_idcons = tab_dosspat.tabpage_rappre.dw_rapppre.getitemnumber(tab_dosspat.tabpage_rappre.dw_rapppre.getrow(),'t_consultations_id')
		if ds_rapppreimp.retrieve(ll_idcons) = 0 then
			error_type(195)
			return
		end if
		decimal ldbl_hordim, ldbl_verdim, ldbl_artouv
		select nbmois,surverdim,surhordim,artouvdim,surveru,surhoru,artouvu into :li_nbmois,:ldbl_verdim,:ldbl_hordim,:ldbl_artouv,:ls_svu,:ls_shu,:ls_aou from t_consultations where t_consultations.id = :ll_idcons;
		ls_nbmois = string(li_nbmois)
		if isnull(ls_nbmois) then ls_nbmois = ''
		
		n_cst_string	lnv_string
		
		if isnull(ldbl_verdim) then 
			ls_surverdim = ''
		ELSE
			//Reformatter les mm
			ls_surverdim = string(Round(ldbl_verdim, 1))
		END IF
		
		if ls_svu = 't' then
			ls_surverdim += ' mm.'
		else
			ls_surverdim += ' %.'
		end if
		
		if isnull(ldbl_hordim) then 
			ls_surhordim = ''
		ELSE
			//Reformatter les mm
			ls_surhordim = string(Round(ldbl_hordim, 1))
		END IF
		
		if ls_shu = 't' then
			ls_surhordim += ' mm.'
		else
			ls_surhordim += ' %.'
		end if

		if isnull(ldbl_artouv) then 
			ls_artouvdim = ''
		ELSE
			//Reformatter les mm
			ls_artouvdim = string(Round(ldbl_artouv, 1))
		END IF
		
		if ls_aou = 't' then
			ls_artouvdim += ' mm.'
		else
			ls_artouvdim += ' %.'
		end if
		
		if ls_dentlang = 'an' then
			ds_rapppreimp.object.t_ortho.text = 'Orthodontist'
			ds_rapppreimp.object.t_rappre.text = 'PRELIMINARY REPORT'
			ds_rapppreimp.object.t_cher.text = 'Dear'
			ds_rapppreimp.object.t_age1.text = 'Age'
			ds_rapppreimp.object.t_tel.text = 'Phone'
			ds_rapppreimp.object.t_aeterecu.text = 'Came recently for a consultation'
			ds_rapppreimp.modify("expre2.checkbox.text = 'The patient has an appointment for the complete ortho records'")
			ds_rapppreimp.modify("expre4.checkbox.text = 'According to our observations, it is not necessary to undertake any orthodontic correction at this time.'")
			ds_rapppreimp.modify("t_ds.text = ~"We would like to see the patient in "+ls_nbmois+" months for a recall examination.~"")
			ds_rapppreimp.modify("t_diagpre.text = 'PRELIMINARY DIAGNOSIS'")
			ds_rapppreimp.modify("t_mc1.text = 'Clinical finding'")
			ds_rapppreimp.modify("mc1.checkbox.text = 'Class I'")
			ds_rapppreimp.modify("mc2d1.checkbox.text = 'Class II div 1'")
			ds_rapppreimp.modify("mc2s2.checkbox.text = 'Class II div 2'")
			ds_rapppreimp.modify("mc3.checkbox.text = 'Class III'")
			

			ds_rapppreimp.modify("surver.checkbox.text = ~"Overbite of "+ls_surverdim+"~"")
			ds_rapppreimp.modify("surhor.checkbox.text = ~"Overjet of "+ls_surhordim+"~"")
			ds_rapppreimp.modify("artouv.checkbox.text = ~"Open bite of "+ls_artouvdim+"~"")
			ds_rapppreimp.modify("t_mm.text = ''")
			ds_rapppreimp.modify("t_mm1.text = ''")
			ds_rapppreimp.modify("t_ouv.text = ''")
			ds_rapppreimp.modify("chevauchement.checkbox.text = 'Crowding'")
			ds_rapppreimp.modify("t_ant.text = 'Anterior'")
			ds_rapppreimp.modify("t_post.text = 'Posterior'")
			ds_rapppreimp.modify("arcade_superieur.checkbox.text = 'Maxilla'")
			ds_rapppreimp.modify("arcade_inferieur.checkbox.text = 'Mandible'")
			ds_rapppreimp.modify("exces_espace.checkbox.text = 'Spacing'")
			ds_rapppreimp.modify("arcade_superieur2.checkbox.text = 'Maxilla'")
			ds_rapppreimp.modify("arcade_inferieur2.checkbox.text = 'Mandible'")
			ds_rapppreimp.modify("occlusioncroisee.checkbox.text = 'Cross bite of '")
			ds_rapppreimp.modify("devligmed.checkbox.text = 'Deviation of median lines'")
			ds_rapppreimp.object.t_remarque.text = 'Remarks'
			ds_rapppreimp.object.t_footer1.text = 'Please accept my thanks for having referred your patient to our office for orthodontic care.'
			ds_rapppreimp.object.t_footer2.text = 'Your expression of confidence is greatly appreciated.'
			ds_rapppreimp.object.t_footer3.text = 'N.B. All the patients are advised to continue their recall visits at their dentist during the orthodontic treatment.'
			ds_rapppreimp.object.t_footer4.text = ''
		else
			ds_rapppreimp.modify("t_ds.text = ~"Nous aimerions revoir le (la) patient(e) dans "+ls_nbmois+" mois.~"")
			ds_rapppreimp.modify("surver.checkbox.text = ~"Surplomb vertical "+ls_surverdim+"~"")
			ds_rapppreimp.modify("surhor.checkbox.text = ~"Surplomb horizontal "+ls_surhordim+"~"")
			ds_rapppreimp.modify("artouv.checkbox.text = ~"Occlusion ouverte "+ls_artouvdim+"~"")
		end if
		
		if isnull(is_spec) then
			select t_salutation.salutation + ' ' + det_prenom + ' ' + det_nom into :is_spec from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist left outer join t_salutation ON t_dentists.id_sal = t_salutation.id_sal where patient_id = :il_patid;
		end if
	//	ds_rapppreimp.object.t_spec.text = is_spec
		ds_rapppreimp.object.t_age.text = calculage(ds_rapppreimp.getItemDate(ds_rapppreimp.getRow(),'patient_date_naissance'))
		// eliminer contour
		select logorappre into :li_option from t_options where ortho_id = :v_no_ortho;
		if li_option = 1 then
			ds_rapppreimp.object.rr_contour.visible = false
			ds_rapppreimp.object.ortho_id_dr_nom_complet.visible = false
			ds_rapppreimp.object.l_1.visible = false
			ds_rapppreimp.object.t_ortho.visible = false
			ds_rapppreimp.object.compute_2.visible = false
		end if
		gb_datawindow = false
		openwithparm(w_print_options,ds_rapppreimp)
		destroy ds_rapppreimp
	case 12 // trait req
		string ls_1fr,ls_2fr,ls_3fr,ls_4fr,ls_5fr,ls_6fr,ls_7fr,ls_8fr,ls_9fr,ls_10fr
		string ls_1en,ls_2en,ls_3en,ls_4en,ls_5en,ls_6en,ls_7en,ls_8en,ls_9en,ls_10en
		string ls_nomortho, ls_raplangue
		long ll_rapid
		
		sauve(ii_index)
		
		ll_rapid = tab_dosspat.tabpage_traitreq.dw_traitreq.getitemnumber(tab_dosspat.tabpage_traitreq.dw_traitreq.getrow(),'t_consultations_id')
		
		select traitreq1fr,traitreq2fr,traitreq3fr,traitreq4fr,traitreq5fr,traitreq6fr,traitreq7fr,traitreq8fr,traitreq9fr,traitreq10fr,
				 traitreq1en,traitreq2en,traitreq3en,traitreq4en,traitreq5en,traitreq6en,traitreq7en,traitreq8en,traitreq9en,traitreq10en, cachechart
		into :ls_1fr,:ls_2fr,:ls_3fr,:ls_4fr,:ls_5fr,:ls_6fr,:ls_7fr,:ls_8fr,:ls_9fr,:ls_10fr,:ls_1en,:ls_2en,:ls_3en,:ls_4en,:ls_5en,:ls_6en,:ls_7en,:ls_8en,:ls_9en,:ls_10en, :ll_cachechart
		from t_options where ortho_id = :v_no_ortho;
		
		select dr_nom_complet into :ls_nomortho from ortho_id where ortho_id = :v_no_ortho;

		select det_langue into :ls_raplangue from t_dentists inner join t_consultations on t_dentists.id_dentist = t_consultations.id_dentist where t_consultations.id = :ll_rapid;
		
		datastore ds_traitreqimp
		ds_traitreqimp = create datastore
		ds_traitreqimp.dataobject = "d_traitreqimpver2"
		if ls_raplangue = 'an' or (isNull(ls_raplangue) and ls_dentlang = 'an') then
			ds_traitreqimp.modify("t_ortho.text = 'Orthodontist'")
			
			ds_traitreqimp.modify("t_title.text = 'TREATMENT REQUEST'")
			ds_traitreqimp.modify("t_cher.text = 'Dear:'")
			ds_traitreqimp.modify("t_tel.text = 'Tel.:'")
			ds_traitreqimp.modify("t_telbur.text = 'Tel.:'")
			ds_traitreqimp.modify("t_fax.text = 'Fax:'")
			ds_traitreqimp.modify("t_age1.text = 'Age:'")
			ds_traitreqimp.modify("t_nais.text = 'Date of birth:'")
			ds_traitreqimp.modify("t_radio.text = 'Please proceed with the following at the next appointment:'")
			ds_traitreqimp.modify("t_restauration.text = ': Restoration'")
			ds_traitreqimp.modify("exam.checkbox.text = 'Examination'")
			ds_traitreqimp.modify("prophy.checkbox.text = 'Fluororide application and prophylaxis'")
			ds_traitreqimp.modify("radio.checkbox.text = 'Please send the most recent x-rays to our office'")
			ds_traitreqimp.modify("hygiene.checkbox.text = 'The oral hygiene is inadequate. Please help us improve the oral hygiene'")
			ds_traitreqimp.modify("t_alapro.text = 'on next appointment'")
			ds_traitreqimp.modify("rest.checkbox.text = 'Restoration'")
			ds_traitreqimp.modify("extrait.checkbox.text = 'Please, extract:'")
			ds_traitreqimp.modify("autchir.checkbox.text = 'Other surgery'")
			ds_traitreqimp.modify("commpat.checkbox.text = 'Please contact the patient to schedule an appointment'")
			ds_traitreqimp.modify("commrab.checkbox.text = 'The patient will contact your office'")
			ds_traitreqimp.modify("retradio.checkbox.text = 'Please return the x-rays at the end of the treatment'")
			ds_traitreqimp.modify("t_consultations_panremispatient.checkbox.text = 'Copy of the panoramic delivered to your patient'")
			ds_traitreqimp.modify("t_consultations_copietransparcourriel.checkbox.text = 'Copy of the panaramic delivered to you by email'")
			ds_traitreqimp.modify("t_droite.text = 'Right'")
			ds_traitreqimp.modify("t_droite1.text = 'Right'")
			ds_traitreqimp.modify("t_gauche.text = 'Left'")
			ds_traitreqimp.modify("t_gauche1.text = 'Left'")
			ds_traitreqimp.modify("t_remarque.text = 'Commentary :'")
			ds_traitreqimp.modify("t_merci.visible = false")
			ds_traitreqimp.modify("t_thanks.visible = true")
			ds_traitreqimp.modify("t_footer1.text = 'N.B.: All patients are required to continue visiting their dentist during'")
			ds_traitreqimp.modify("t_footer2.text = 'orthodontic treatment. Please, continue recalling the patient as usual.'")
			ds_traitreqimp.modify("t_footer3.text = ''")
			ds_traitreqimp.modify("t_titreortho.visible = false")
			ds_traitreqimp.modify("t_nomortho.text = ~"" + ls_nomortho + "~"") 
			if ls_nomortho = 'Dr. SIDNEY KONIGSBERG' then
				ds_traitreqimp.modify("t_titreortho.visible = true")
				ds_traitreqimp.modify("t_nomortho.visible = true")
				ds_traitreqimp.modify("l_8.visible = true")
				ds_traitreqimp.modify("p_sign.visible = true")
			elseif ls_nomortho = 'Dr Nathalie Beaulne' then
				ds_traitreqimp.object.t_secortho.visible = true
				ds_traitreqimp.object.l_9.visible = true
			else
				ds_traitreqimp.modify("t_titreortho.text = ''")
			end if
//			ds_traitreqimp.modify("compute_1.expression = ortho_id_dr_adresse  + ', ' + ortho_id_dr_ville  + ' (' + ortho_id_dr_province  +  ') , ' + ortho_id_dr_code_postal")
			if not isnull(ls_1en) then
				if ls_1en = 'HIDE' or ls_1en = 'CACHER' then
					ds_traitreqimp.modify("exam.visible = false")
				else
					ds_traitreqimp.modify("exam.checkbox.text = '" + ls_1en + "'")
				end if
			end if
			if not isnull(ls_2en) then
				if ls_2en = 'HIDE' or ls_2en = 'CACHER' then
					ds_traitreqimp.modify("prophy.visible = false")
				else
					ds_traitreqimp.modify("prophy.checkbox.text = '" + ls_2en + "'")
				end if
			end if
			if not isnull(ls_3en) then
				if ls_3en = 'HIDE' or ls_3en = 'CACHER' then
					ds_traitreqimp.modify("radio.visible = false")
				else
					ds_traitreqimp.modify("radio.checkbox.text = '" + ls_3en + "'")
				end if
			end if
			if not isnull(ls_4en) then
				if ls_4en = 'HIDE' or ls_4en = 'CACHER' then
					ds_traitreqimp.modify("hygiene.visible = false")
				else
					ls_4en = gnv_app.inv_string.of_globalreplace(ls_4en, "'", "`")
					ds_traitreqimp.modify("hygiene.checkbox.text = '" + ls_4en + "'")
				end if
				ds_traitreqimp.modify("t_alapro.text = ''")
			end if
			if not isnull(ls_5en) then
				if ls_5en = 'HIDE' or ls_5en = 'CACHER' then
					ds_traitreqimp.modify("rest.visible = false")
				else
					ds_traitreqimp.modify("rest.checkbox.text = '" + ls_5en + "'")
				end if
			end if
			if not isnull(ls_6en) then
				if ls_6en = 'HIDE' or ls_6en = 'CACHER' then
					ds_traitreqimp.modify("extrait.visible = false")
				else
					ds_traitreqimp.modify("extrait.checkbox.text = '" + ls_6en + "'")
				end if
			end if
			if not isnull(ls_7en) then
				if ls_7en = 'HIDE' or ls_7en = 'CACHER' then
					ds_traitreqimp.modify("autchir.visible = false")
				else
					ds_traitreqimp.modify("autchir.checkbox.text = '" + ls_7en + "'")
				end if
			end if
			if not isnull(ls_8en) then
				if ls_8en = 'HIDE' or ls_8en = 'CACHER' then
					ds_traitreqimp.modify("commpat.visible = false")
				else
					ds_traitreqimp.modify("commpat.checkbox.text = '" + ls_8en + "'")
				end if
			end if
			if not isnull(ls_9en) then
				if ls_9en = 'HIDE' or ls_9en = 'CACHER' then
					ds_traitreqimp.modify("commrab.visible = false")
				else
					ds_traitreqimp.modify("commrab.checkbox.text = '" + ls_9en + "'")
				end if
			end if
			if not isnull(ls_10en) then
				if ls_10en = 'HIDE' or ls_10en = 'CACHER' then
					ds_traitreqimp.modify("retradio.visible = false")
				else
					ds_traitreqimp.modify("retradio.checkbox.text = '" + ls_10en + "'")
				end if
			end if
		else
//			ds_traitreqimp.object.compute_1.expression = "ortho_id_dr_adresse  + ', ' + ortho_id_dr_ville  + ' (' + ortho_id_dr_province  +  ') , ' + ortho_id_dr_code_postal + ' ' + Tél. "
			ds_traitreqimp.modify("t_nomortho.text = ~"" + ls_nomortho + "~"")
			if not isnull(ls_1fr) then
				if ls_1fr = 'HIDE' or ls_1fr = 'CACHER' then
					ds_traitreqimp.modify("exam.visible = false")
				else
					ds_traitreqimp.modify("exam.checkbox.text = '" + ls_1fr + "'")
				end if
			end if
			if not isnull(ls_2fr) then
				if ls_2fr = 'HIDE' or ls_2fr = 'CACHER' then
					ds_traitreqimp.modify("prophy.visible = false")
				else
					ds_traitreqimp.modify("prophy.checkbox.text = '" + ls_2fr + "'")
				end if
			end if
			if not isnull(ls_3fr) then
				if ls_3fr = 'HIDE' or ls_3fr = 'CACHER' then
					ds_traitreqimp.modify("radio.visible = false")
				else
					ds_traitreqimp.modify("radio.checkbox.text = '" + ls_3fr + "'")
				end if
			end if
			if not isnull(ls_4fr) then
				if ls_4fr = 'HIDE' or ls_4fr = 'CACHER' then
					ds_traitreqimp.modify("hygiene.visible = false")
				else
					ls_4fr = gnv_app.inv_string.of_globalreplace(ls_4fr, "'", "`")
					ds_traitreqimp.modify("hygiene.checkbox.text = '" + ls_4fr + "'")
				end if
				ds_traitreqimp.modify("t_alapro.text = ''")
			end if
			if not isnull(ls_5fr) then
				if ls_5fr = 'HIDE' or ls_5fr = 'CACHER' then
					ds_traitreqimp.modify("rest.visible = false")
				else
					ds_traitreqimp.modify("rest.checkbox.text = '" + ls_5fr + "'")
				end if
			end if
			if not isnull(ls_6fr) then
				if ls_6fr = 'HIDE' or ls_6fr = 'CACHER' then
					ds_traitreqimp.modify("extrait.visible = false")
				else
					ds_traitreqimp.modify("extrait.checkbox.text = '" + ls_6fr + "'")
				end if
			end if
			if not isnull(ls_7fr) then
				if ls_7fr = 'HIDE' or ls_7fr = 'CACHER' then
					ds_traitreqimp.modify("autchir.visible = false")
				else
					ds_traitreqimp.modify("autchir.checkbox.text = '" + ls_7fr + "'")
				end if
			end if
			if not isnull(ls_8fr) then
				if ls_8fr = 'HIDE' or ls_8fr = 'CACHER' then
					ds_traitreqimp.modify("commpat.visible = false")
				else
					ds_traitreqimp.modify("commpat.checkbox.text = '" + ls_8fr + "'")
				end if
			end if
			if not isnull(ls_9fr) then
				if ls_9fr = 'HIDE' or ls_9fr = 'CACHER' then
					ds_traitreqimp.modify("commrab.visible = false")
				else
					ds_traitreqimp.modify("commrab.checkbox.text = '" + ls_9fr + "'")
				end if
			end if
			if not isnull(ls_10fr) then
				if ls_10fr = 'HIDE' or ls_10fr = 'CACHER' then
					ds_traitreqimp.modify("retradio.visible = false")
				else
					ls_10fr = gnv_app.inv_string.of_globalreplace(ls_10fr, "'", "`")
					ds_traitreqimp.modify("retradio.checkbox.text = '" + ls_10fr + "'")
				end if
			end if
			if ls_nomortho = 'Roger Drouin, Orthodontiste' or ls_nomortho = 'Engel Hélène Orthodontiste' then
				ds_traitreqimp.object.t_secortho.text = 'Hélène Engel, Orthodontiste'
				ds_traitreqimp.object.t_secortho.visible = true
				ds_traitreqimp.object.l_9.visible = true
			end if
		end if
		// retrieve
		ds_traitreqimp.setTransObject(SQLCA)
		if ds_traitreqimp.retrieve(ll_rapid) = 0 then
			error_type(195)
			return
		end if
		ls_champdesc = ds_traitreqimp.getItemString(ds_traitreqimp.getRow(),'t_consultations_champdesc')
	//	ls_temp = ds_traitreqimp.describe("exam.checkbox.text")
		if isnull(ls_champdesc) then ls_champdesc = ""
		if ls_champdesc = "" then
//			ds_traitreqimp.modify("exam.checkbox.text = '" + ls_temp + ' ' + ls_champdesc + "'")
			if ls_raplangue = 'an' then
				ds_traitreqimp.modify("exam.checkbox.text = 'Examination'")
			else
				if ls_1fr = 'HIDE' or ls_1fr = 'CACHER' then
					ds_traitreqimp.modify("exam.checkbox.text = 'Examen'")
				else
					ds_traitreqimp.modify("exam.checkbox.text = '" + ls_1en + "'")
				end if
			end if
			ds_traitreqimp.object.exam.color = rgb(0,0,0)
		else
			ds_traitreqimp.modify("exam.checkbox.text = '" + ls_champdesc + "'")
			ds_traitreqimp.object.exam.color = rgb(255,0,0)
		end if
		ls_champres = ds_traitreqimp.getItemString(ds_traitreqimp.getRow(),'t_consultations_champres')
		if isnull(ls_champres) = false and ls_champres <> "" then
			ds_traitreqimp.modify("rest.checkbox.text = '" + ls_champres + "'")
		end if
		
		if ll_cachechart = 1 then
//			ds_traitreqimp.object.t_droite.visible = false
//			ds_traitreqimp.object.l_1.visible = false
//			ds_traitreqimp.object.l_2.visible = false
//			ds_traitreqimp.object.t_gauche.visible = false
		else
//			ds_traitreqimp.object.t_droite.visible = true
//			ds_traitreqimp.object.l_1.visible = true
//			ds_traitreqimp.object.l_2.visible = true
//			ds_traitreqimp.object.t_gauche.visible = true
		end if
		
		ds_traitreqimp.object.rest.background.mode = 0
		ds_traitreqimp.object.rest.background.color = rgb(255,255,255)
		
		if isnull(is_spec) then
			select salutation + ' ' + det_prenom + ' ' + det_nom into :is_spec from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist left outer join t_salutation ON t_dentists.id_sal = t_salutation.id_sal where patient_id = :il_patid;
		end if
	//	ds_traitreqimp.object.t_spec.text = is_spec
		ls_langue = v_langue
		v_langue = ls_raplangue
		ds_traitreqimp.object.t_age.text = calculage(ds_traitreqimp.getItemDate(ds_traitreqimp.getRow(),'patient_date_naissance'))
		v_langue = ls_langue
		// eliminer contour
		select logotraitreq into :li_option from t_options where ortho_id = :v_no_ortho;
		if li_option = 1 then
//			ds_traitreqimp.object.rr_contour.visible = false
			ds_traitreqimp.object.ortho_id_dr_nom_complet.visible = false
			ds_traitreqimp.object.l_7.visible = false
			ds_traitreqimp.object.t_ortho.visible = false
			ds_traitreqimp.object.compute_1.visible = false
		end if
		
		// Afficher la signature
		luo_sign.of_affichesign(ds_traitreqimp, 1, ll_rapid)
		
		DECLARE listemail CURSOR FOR 

			select top 3 courriel from (
				select email as courriel from t_contact where patient_id = :il_patid and isnull(email,'') <> ''
				union
				select email from patient where patient_id = :il_patid and isnull(email,'') <> ''
				union
				select email2 from patient where patient_id = :il_patid and isnull(email2,'') <> ''
				union
				select email3 from patient where patient_id = :il_patid and isnull(email3,'') <> ''
			) as t_courlist;
		
		OPEN listemail;
		
			FETCH listemail INTO :ls_mail[k];
				
			DO WHILE SQLCA.SQLCODE = 0
				k++
				FETCH listemail INTO :ls_mail[k];
			LOOP
		CLOSE listemail;


		ls_courriel = unsplit(ls_mail,';')

		gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("idforeignkey","T"+string(ds_traitreqimp.getItemNumber(ds_traitreqimp.getRow(),'t_consultations_id')))
		
		gb_datawindow = false
		openwithparm(w_print_options,ds_traitreqimp)
		destroy ds_traitreqimp
	CASE 6
		gb_datawindow = true
		openWithParm(w_print_options,tab_dosspat.tabpage_rdv.tab_rdv.tabpage_visits.dw_dosspatrdv)
end choose
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_dossier_patients.bin 
2000000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001000000000000000000000000000000000000000000000000000000007ccbfa7001d0b26800000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f000000007ccbfa7001d0b2687ccbfa7001d0b268000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
20ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c0000217d000014770000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c0000217d000014770000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_dossier_patients.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
