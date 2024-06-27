$PBExportHeader$w_lettres_patients.srw
forward
global type w_lettres_patients from w_child
end type
type dw_lettres_patients_sel from u_dw within w_lettres_patients
end type
type st_4 from statictext within w_lettres_patients
end type
type st_3 from statictext within w_lettres_patients
end type
type st_2 from statictext within w_lettres_patients
end type
type sle_recherche from singlelineedit within w_lettres_patients
end type
type st_1 from statictext within w_lettres_patients
end type
type lb_files from listbox within w_lettres_patients
end type
type sle_word from singlelineedit within w_lettres_patients
end type
type cb_open_word from commandbutton within w_lettres_patients
end type
type dw_lettres_patients from u_dw within w_lettres_patients
end type
type st_status from statictext within w_lettres_patients
end type
type cb_close from commandbutton within w_lettres_patients
end type
end forward

global type w_lettres_patients from w_child
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
dw_lettres_patients_sel dw_lettres_patients_sel
st_4 st_4
st_3 st_3
st_2 st_2
sle_recherche sle_recherche
st_1 st_1
lb_files lb_files
sle_word sle_word
cb_open_word cb_open_word
dw_lettres_patients dw_lettres_patients
st_status st_status
cb_close cb_close
end type
global w_lettres_patients w_lettres_patients

type prototypes


end prototypes

type variables
integer pat_id[]
int indice = 0
string vfocus, filtre = "patient_patient_id = 0"
private string is_corrpath
end variables

forward prototypes
public function string of_killfilter (integer patient_id)
public function string of_madefilter (integer patient_id)
public subroutine sup_ligne ()
public subroutine ajout_ligne (long al_row, long al_idcontact, long al_idphase)
end prototypes

public function string of_killfilter (integer patient_id);string is_filter = ''
int i

//pat_id[indice] = patient_id

for i = 1 to indice
	if pat_id[i] <> patient_id then
	   if is_filter = '' then
	      is_filter = "patient_patient_id = " + string(pat_id[i])
      else
		   is_filter += " or "
		   is_filter += "patient_patient_id = " + string(pat_id[i])
      end if
	else
		pat_id[i] = 0
	end if
next

return is_filter

end function

public function string of_madefilter (integer patient_id);string is_filter = ''
int i

indice = indice + 1
pat_id[indice] = patient_id

for i = 1 to indice
   if is_filter = '' then
	   is_filter = "patient_patient_id = " + string(pat_id[i])
   else
		is_filter += " or "
		is_filter += "patient_patient_id = " + string(pat_id[i])
   end if
next

return is_filter

end function

public subroutine sup_ligne ();dw_lettres_patients_sel.deleterow(dw_lettres_patients_sel.getrow())
end subroutine

public subroutine ajout_ligne (long al_row, long al_idcontact, long al_idphase);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 24/10/2003
// Demande  : JMD
// Version  : 7.6.1
// Modifié par:
//	Modifié le :
/////////////////////////////////
long ll_pos,ll_iddentist,ll_idpat,ll_ententetypefusion,ll_defoidcontact
integer li_info,li_info1
dec{2} ld_info,ld_info1,ld_info2
date ldt_info
string ls_info

select patient_id into :ll_idpat from t_contact where id_contact = :al_idcontact; 
select id_dentist,id_contact into :ll_iddentist,:ll_defoidcontact from patient where patient_id = :ll_idpat;
dw_lettres_patients_sel.setitem(al_row,'id_contact',al_idcontact)
//patient
//select ententetypefusion into :ll_ententetypefusion from t_options where ortho_id = :v_no_ortho;
SetNull(ls_info)
	select patient_nom into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'patient_nom',ls_info)

SetNull(ls_info)
	select patient_prenom into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'patient_prenom',ls_info)

SetNull(ls_info)
	select adresse into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'adresse',ls_info)
	
SetNull(ls_info)
	select ville into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'ville',ls_info)

SetNull(ls_info)
	select province into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'province',ls_info)

SetNull(ls_info)
	select code_postale into :ls_info from patient where patient_id = :ll_idpat;
	ls_info = string(ls_info,'@@@ @@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'code_postale',ls_info)
	
SetNull(ls_info)
	select new_dossier into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'pat_nodossier',ls_info)
	
SetNull(ls_info)
	select no_dossier into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'pat_nopatient',ls_info)
	
SetNull(ls_info)
	select tel_maison into :ls_info from patient where patient_id = :ll_idpat;
	ls_info = string(ls_info,'(@@@) @@@-@@@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'tel_maison',ls_info)
	
SetNull(ls_info)
//do while match(as_texte,'<<pattelb>>')
//	select tel_bureau into :ls_info from patient where patient_id = :ll_idpat;
//	ls_info = string(ls_info,'(@@@) @@@-@@@@')
//	ll_pos = pos(as_texte,'<<pattelb>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,11,ls_info)
//loop
SetNull(ls_info)
	select date_naissance into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'pat_datenaissance',ls_info)
	
SetNull(ls_info)
	select date_naissance into :ldt_info from patient where patient_id = :ll_idpat;
	ls_info = calculage(ldt_info)
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'pat_age',ls_info)
	
SetNull(ls_info)
	select max(debut_traitement) into :ldt_info from traitements where patient_id = :ll_idpat;
	ls_info = string(ldt_info)
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'debut_trait',ls_info)
	
//parent
SetNull(ls_info)
	select nom_pere into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'nom_pere',ls_info)
	
SetNull(ls_info)
	select no_tel_pere into :ls_info from patient where patient_id = :ll_idpat;
	ls_info = string(ls_info,'(@@@) @@@-@@@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'tel_pere',ls_info)
	
SetNull(ls_info)
	select nom_mere into :ls_info from patient where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'nom_mere',ls_info)
	
SetNull(ls_info)
	select no_tel_mere into :ls_info from patient where patient_id = :ll_idpat;
	ls_info = string(ls_info,'(@@@) @@@-@@@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'tel_mere',ls_info)
	
//Responsable
SetNull(ls_info)
	select salutation into :ls_info from t_salutation inner join t_contact on t_salutation.id_sal = t_contact.id_sal where t_contact.id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_salu',ls_info)
	
SetNull(ls_info)
	select salutation into :ls_info from t_salutation inner join t_contact on t_salutation.id_sal = t_contact.id_sal1 where t_contact.id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_salu1',ls_info)
	
SetNull(ls_info)
	select prenom into :ls_info from t_contact where id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_prenom',ls_info)
	
SetNull(ls_info)
	select nom into :ls_info from t_contact where id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_nom',ls_info)
	
SetNull(ls_info)
	select adresse into :ls_info from t_contact where id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_add',ls_info)
	
SetNull(ls_info)
	select ville into :ls_info from t_contact where id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_ville',ls_info)
	
SetNull(ls_info)
	select province into :ls_info from t_contact where id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_province',ls_info)
	
SetNull(ls_info)
	select zip into :ls_info from t_contact where id_contact = :ll_defoidcontact;
	ls_info = string(ls_info,'@@@ @@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_codepostal',ls_info)
	
SetNull(ls_info)
	select telres into :ls_info from t_contact where id_contact = :ll_defoidcontact;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'resp_tel',ls_info)
	
//specialiste
SetNull(ls_info)
	select dr_nom_complet into :ls_info from ortho_id where ortho_id = :v_no_ortho;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dr_nom_complet' ,ls_info)
	
SetNull(ls_info)
	select dr_adresse into :ls_info from ortho_id where ortho_id = :v_no_ortho;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dr_adresse' ,ls_info)
	
SetNull(ls_info)
	select dr_ville into :ls_info from ortho_id where ortho_id = :v_no_ortho;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dr_ville' ,ls_info)
	
SetNull(ls_info)
	select dr_province into :ls_info from ortho_id where ortho_id = :v_no_ortho;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dr_province' ,ls_info)
	
SetNull(ls_info)
	select dr_code_postal into :ls_info from ortho_id where ortho_id = :v_no_ortho;
	ls_info = string(ls_info,'@@@ @@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dr_codepostal' ,ls_info)
	
// Entente financiere
//SetNull(ls_info)
//do while match(as_texte,'<<Phase>>')
//	if ll_ententetypefusion = 1 then
//		select id_phase into :li_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	else
//		select phase into :li_info from t_entente where id_contact = :al_idcontact;
//	end if
//	ls_info = "Phase " + string(li_info)
//	ll_pos = pos(as_texte,'<<Phase>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,9,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<Ttype>>')
//	select traitement into :li_info from t_entente where id_contact = :al_idcontact;
//	choose case li_info
//		case 0
//			ls_info = "Traitement partiel"
//		case 1
//			ls_info = "Traitement complet"
//	end choose
//	ll_pos = pos(as_texte,'<<Ttype>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,9,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<Tdebut>>')
//	if ll_ententetypefusion = 1 then
//		select date1 into :ldt_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	else
//		select debut into :ldt_info from t_entente where id_contact = :al_idcontact;
//	end if
//	ls_info = string(ldt_info)
//	ll_pos = pos(as_texte,'<<Tdebut>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,10,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<Tfin>>')
//	select fin into :ldt_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ldt_info)
//	ll_pos = pos(as_texte,'<<Tfin>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,8,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<Tduree>>')
//	select estduree1,estduree2 into :li_info,:li_info1 from t_entente where id_contact = :al_idcontact;
//	if li_info1 = 0 or isnull(li_info1) then
//		ls_info = string(li_info) + ' mois'
//	else
//		ls_info = string(li_info) + ' à ' + string(li_info1) + ' mois'
//	end if
//	ll_pos = pos(as_texte,'<<Tduree>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,10,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TcoutTotal>>')
//	select cout_total into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TcoutTotal>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,14,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TcoutPhase1>>')
//	if ll_ententetypefusion = 1 then
//		select couttrait into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	else
//		select cout_total1 into :ld_info from t_entente where id_contact = :al_idcontact;
//	end if	
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TcoutPhase1>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TcoutDiag1>>')
//	if ll_ententetypefusion = 1 then
//		select diag into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	else
//		select diag_anal1 into :ld_info from t_entente where id_contact = :al_idcontact;
//	end if	
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TcoutDiag1>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,14,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TpaieInit1>>')
//	if ll_ententetypefusion = 1 then
//		select initial into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//		ls_info = string(ld_info) + ' $'
//	else
//		select paiement_init1,verpaieinit1 into :ld_info,:li_info from t_entente where id_contact = :al_idcontact;	
//		if li_info > 1 then
//			ls_info = string(li_info) + ' versement(s) de ' + string(ld_info) + ' $'
//		else
//			ls_info = string(ld_info) + ' $'
//		end if	
//	end if	
//	ll_pos = pos(as_texte,'<<TpaieInit1>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,14,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TdatePaieInit1>>')
//	select datepaieinit into :ldt_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ldt_info)
//	ll_pos = pos(as_texte,'<<TdatePaieInit1>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,18,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<Tversement1>>')
//	if ll_ententetypefusion = 1 then
//		select mmontant into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	else
//		select mensualite1 into :ld_info from t_entente where id_contact = :al_idcontact;
//	end if
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<Tversement1>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TnbVersement1>>')
//	if ll_ententetypefusion = 1 then
//		select mqty into :li_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	else
//		select duree1 into :li_info from t_entente where id_contact = :al_idcontact;
//	end if
//	ls_info = string(li_info)
//	ll_pos = pos(as_texte,'<<TnbVersement1>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,17,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TpaieFinal1>>')
//	if ll_ententetypefusion = 1 then
//		select paiefinal into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	else
//		select paiement_fin1 into :ld_info from t_entente where id_contact = :al_idcontact;
//	end if
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TpaieFinal1>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TcoutPhase2>>')
//	select cout_total2 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TcoutPhase2>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TcoutDiag2>>')
//	select diag_anal2 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TcoutDiag2>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,14,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TpaieInit2>>')
//	select paiement_init2,verpaieinit2 into :ld_info,:li_info from t_entente where id_contact = :al_idcontact;
//	ll_pos = pos(as_texte,'<<TpaieInit2>>')
//	if li_info > 1 then
//		ls_info = string(li_info) + ' versement de ' + string(ld_info) + ' $'
//	else
//		ls_info = string(ld_info) + ' $'
//	end if
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,14,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TdatePaieInit2>>')
//	select datepaieinit into :ldt_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ldt_info)
//	ll_pos = pos(as_texte,'<<TdatePaieInit2>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,18,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<Tversement2>>')
//	select mensualite2 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<Tversement2>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TnbVersement2>>')
//	select duree2 into :li_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(li_info)
//	ll_pos = pos(as_texte,'<<TnbVersement2>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,17,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TpaieFinal2>>')
//	select paiement_fin2 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TpaieFinal2>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TcoutPhase3>>')
//	select cout_total3 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TcoutPhase3>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TcoutDiag3>>')
//	select diag_anal3 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TcoutDiag3>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,14,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TpaieInit3>>')
//	select paiement_init3,verpaieinit3 into :ld_info,:li_info from t_entente where id_contact = :al_idcontact;
//	ll_pos = pos(as_texte,'<<TpaieInit3>>')
//	if li_info > 1 then
//		ls_info = string(li_info) + ' versement de ' + string(ld_info) + ' $'
//	else
//		ls_info = string(ld_info) + ' $'
//	end if
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,14,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TdatePaieInit3>>')
//	select datepaieinit into :ldt_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ldt_info)
//	ll_pos = pos(as_texte,'<<TdatePaieInit3>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,18,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<Tversement3>>')
//	select mensualite3 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<Tversement3>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TnbVersement3>>')
//	select duree3 into :li_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(li_info)
//	ll_pos = pos(as_texte,'<<TnbVersement3>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,17,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TpaieFinal3>>')
//	select paiement_fin3 into :ld_info from t_entente where id_contact = :al_idcontact;
//	ls_info = string(ld_info) + ' $'
//	ll_pos = pos(as_texte,'<<TpaieFinal3>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,15,ls_info)
//loop
//SetNull(ls_info)
//do while match(as_texte,'<<TCommentaire>>')
//	select note1 into :ls_info from t_entente where id_contact = :al_idcontact;
//	ll_pos = pos(as_texte,'<<TCommentaire>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,16,ls_info)
//loop
// Contrat
SetNull(ls_info)
	select description into :ls_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_description' ,ls_info)
	
SetNull(ls_info)
	select date1 into :ldt_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ls_info = string(ldt_info)
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_date_traitement' ,ls_info)
	
SetNull(ls_info)
	select pourcentage into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ls_info = string(integer(ld_info))
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_pourcentage' ,ls_info)
	
SetNull(ls_info)
	select couttrait,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ld_info = ld_info * ld_info1 / 100
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_cout_traitement' ,ls_info)
	
SetNull(ls_info)
	select initial,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ld_info = ld_info * ld_info1 / 100
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_paiement_initial' ,ls_info)
	
SetNull(ls_info)
	select cons into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_cout_consultation' ,ls_info)
	
SetNull(ls_info)
	select diag,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ld_info = ld_info * ld_info1 / 100
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_cout_diagnostic' ,ls_info)
	
	SetNull(ls_info)
	select meb,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ld_info = ld_info * ld_info1 / 100
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_cout_meb' ,ls_info)
	
SetNull(ls_info)
	select retfee,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ld_info = ld_info * ld_info1 / 100
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_cout_retention' ,ls_info)
	
SetNull(ls_info)
	select mdate1 into :ldt_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ls_info = string(ldt_info)
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_date_premier_versement_mens' ,ls_info)
	
SetNull(ls_info)
	select mmontant into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_versement_mensuel' ,ls_info)
	
SetNull(ls_info)
	select mqty into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ld_info = ld_info
	ls_info = string(integer(ld_info))
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_nb_versement' ,ls_info)
	
SetNull(ls_info)
	select mmontant,mqty,paiefinal into :ld_info,:ld_info1,:ld_info2 from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ld_info = (ld_info * ld_info1) + ld_info2
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_total_versement_mensuel' ,ls_info)
	
SetNull(ls_info)
	select paiefinal into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_idphase and patient_id = :ll_idpat;
	ls_info = string(ld_info) + ' $'
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'c_paiement_final' ,ls_info)
	
// Dentiste
SetNull(ls_info)
	select det_suf into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dt_titre' ,ls_info)
	
SetNull(ls_info)
	select det_prenom into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dt_prenom' ,ls_info)
	
SetNull(ls_info)
	select det_nom into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dt_nom' ,ls_info)
	
SetNull(ls_info)
	select det_add into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dt_add' ,ls_info)
	
SetNull(ls_info)
	select det_ville into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dt_ville' ,ls_info)
	
SetNull(ls_info)
	select det_prov into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dt_prov' ,ls_info)
	
SetNull(ls_info) 
	select det_zip into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
	ls_info = string(ls_info,'@@@ @@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'dt_code_postal' ,ls_info)
	
//référent
SetNull(ls_info)
//do while match(as_texte,'<<reftitre>>')
//	select ref_suffix into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//	ll_pos = pos(as_texte,'<<reftitre>>')
//	if isnull(ls_info) then ls_info = ''
//	as_texte = replace(as_texte,ll_pos,12,ls_info)
//loop
SetNull(ls_info)
	select ref_prenom into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'ref_nom' ,ls_info)
	
SetNull(ls_info)
	select ref_nom into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'ref_prenom' ,ls_info)
	
SetNull(ls_info)
	select ref_adresse into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'ref_adresse',ls_info)
	
SetNull(ls_info)
	select ref_ville into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'ref_ville',ls_info)
	
SetNull(ls_info)
	select ref_province into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'ref_province' ,ls_info)
	
SetNull(ls_info)
	select ref_zip into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
	ls_info = string(ls_info,'@@@ @@@')
	if isnull(ls_info) then ls_info = ''
	dw_lettres_patients_sel.setitem(al_row,'ref_zip' ,ls_info)
	
	
	
	
//	dw_lettres_patients_sel.setitem(al_row,'patient_id',dw_lettres_patients.getitemnumber(ll_row,'patient_patient_id'))
//	
//	dw_lettres_patients_sel.setitem(al_row,'patient_prenom',ls_info)
//	
//	
//	
//	
//	
//	
//
//	dw_lettres_patients_sel.setitem(al_row,'ref_sexe' ,dw_lettres_patients.getitemstring(ll_row,'t_referents_ref_sexe'))
//	
//	
//	dw_lettres_patients_sel.setitem(al_row,'ref_tel_bur' ,dw_lettres_patients.getitemstring(ll_row,'t_referents_ref_tel_bur'))
//	dw_lettres_patients_sel.setitem(al_row,'ref_tel_fax' ,dw_lettres_patients.getitemstring(ll_row,'t_referents_ref_tel_fax'))
//	dw_lettres_patients_sel.setitem(al_row,'ref_email' ,dw_lettres_patients.getitemstring(ll_row,'t_referents_ref_email'))
//	
//	
//	
//	dw_lettres_patients_sel.setitem(al_row,'dr_tel_bur' ,dw_lettres_patients.getitemstring(ll_row,'ortho_id_dr_tel_bur'))
//	
//	dw_lettres_patients_sel.setitem(al_row,'date_naissance' ,dw_lettres_patients.getitemdate(ll_row,'patient_date_naissance'))
//	dw_lettres_patients_sel.setitem(al_row,'aujourd_hui' ,today())
end subroutine

on w_lettres_patients.create
int iCurrent
call super::create
this.dw_lettres_patients_sel=create dw_lettres_patients_sel
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.sle_recherche=create sle_recherche
this.st_1=create st_1
this.lb_files=create lb_files
this.sle_word=create sle_word
this.cb_open_word=create cb_open_word
this.dw_lettres_patients=create dw_lettres_patients
this.st_status=create st_status
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lettres_patients_sel
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.sle_recherche
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.lb_files
this.Control[iCurrent+8]=this.sle_word
this.Control[iCurrent+9]=this.cb_open_word
this.Control[iCurrent+10]=this.dw_lettres_patients
this.Control[iCurrent+11]=this.st_status
this.Control[iCurrent+12]=this.cb_close
end on

on w_lettres_patients.destroy
call super::destroy
destroy(this.dw_lettres_patients_sel)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_recherche)
destroy(this.st_1)
destroy(this.lb_files)
destroy(this.sle_word)
destroy(this.cb_open_word)
destroy(this.dw_lettres_patients)
destroy(this.st_status)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

select corrpath into :is_corrpath from t_options where ortho_id = :v_no_ortho;
lb_files.DirList(is_corrpath, 0, st_status)
if v_langue = 'an' then
	lb_files.AddItem ('NEW')
else
	lb_files.AddItem ('NOUVELLE')
end if
end event

type dw_lettres_patients_sel from u_dw within w_lettres_patients
integer x = 1454
integer y = 108
integer width = 1161
integer height = 1788
integer taborder = 70
string dragicon = "C:\ii4net\orthotek\images\Distlstl.ico"
string title = "lettres_patients_sel"
string dataobject = "d_lettres_patients_sel1"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event getfocus;vfocus = 'patient_sel'
end event

event losefocus;vfocus = 'none'
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

settransobject(SQLCA)
SetRowFocusIndicator(FocusRect!)

end event

event dragdrop;String is_filter
long ll_idcontact,ll_phase

if vfocus = 'recherche_patient' then
	
	long i,ll_newrow
	boolean lb_presence = false
	
	ll_idcontact = dw_lettres_patients.getitemnumber(dw_lettres_patients.getrow(),'id_contact')
	ll_phase = 1 //dw_lettres_patients.getitemstring(dw_lettres_patients.getrow(),'patient_nomresp1')
	if dw_lettres_patients_sel.rowcount() > 0 then
		FOR i = 1 TO dw_lettres_patients_sel.rowcount()
			if ll_idcontact = dw_lettres_patients_sel.getitemnumber(i,'id_contact') then
				lb_presence = true
				exit
			end if
		NEXT
	end if
	if lb_presence = false then
		ll_newrow = dw_lettres_patients_sel.insertrow(0)
		dw_lettres_patients_sel.scrolltorow(ll_newrow)
		ajout_ligne(ll_newrow,ll_idcontact,ll_phase)
	end if
end if
end event

event clicked;this.drag(begin!)
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

type st_4 from statictext within w_lettres_patients
integer x = 1454
integer width = 1125
integer height = 108
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Patients sélectionnés"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Selected patients"
end if
end event

type st_3 from statictext within w_lettres_patients
integer x = 2615
integer y = 1716
integer width = 928
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Emplacement des documents: "
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Directory of documents"
end if
end event

type st_2 from statictext within w_lettres_patients
integer x = 2619
integer width = 571
integer height = 108
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documents"
boolean focusrectangle = false
end type

type sle_recherche from singlelineedit within w_lettres_patients
integer x = 9
integer y = 108
integer width = 1440
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 1090519039
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_dnom
int v_nb


ls_dnom = Trim(sle_recherche.text)+'%'
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if

//dw_lettres_patients.setfilter("patient_nom like '" + upper(ls_dnom) + "'")
//dw_lettres_patients.filter()
dw_lettres_patients.retrieve(v_no_ortho, ls_dnom)
//dw_lettres_patients.retrieve(v_no_ortho)

end event

type st_1 from statictext within w_lettres_patients
integer x = 9
integer width = 1413
integer height = 100
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correspondances"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Correspondences"
end if
end event

type lb_files from listbox within w_lettres_patients
integer x = 2619
integer y = 108
integer width = 992
integer height = 1588
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 79741120
boolean vscrollbar = true
string item[] = {""}
end type

type sle_word from singlelineedit within w_lettres_patients
boolean visible = false
integer x = 9
integer y = 1912
integer width = 1856
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_open_word from commandbutton within w_lettres_patients
integer x = 1893
integer y = 1912
integer width = 750
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "WORD"
end type

event clicked;string v_word,v_lettre,v_doc
int li_id, flag

if lb_files.selecteditem() = "" then
   error_type(125)
	flag = 0
else
	if dw_lettres_patients_sel.rowcount() = 0 then
	   if error_type(207) = 1 then
         flag = 1
		else
			flag = 0
		end if
	else
		flag = 1
   end if
end if

if flag = 1 then
   sle_word.visible = false
   select max(id) into :li_id from t_lettres;
	if isnull(li_id) then li_id = 0
   if sle_word.text <> '' then
	   if li_id > 0 then
//			messagebox('update','')
		   update t_lettres set word = :sle_word.text where id = :li_id;
		   commit using sqlca;
	   else
//			messagebox('insert','')
		   insert into t_lettres (word) values (:sle_word.text);
	   end if
   end if
   select word into :v_word from t_lettres where id = :li_id;
   if v_word = '' or isnull(v_word) = true then
	   sle_word.visible = true
	   sle_word.text = v_word
	   messagebox("Avertissement!","Donnez l'emplacement de word!")
	   sle_word.text = 'EXEMPLE: C:\Program Files\Microsoft Office\Office\WINWORD.EXE'
	   sle_word.SetFocus()
   else
	   if dw_lettres_patients_sel.SaveAs("c:\ii4net\orthotek\correspondances\patients.xls", EXCEL5!,True) <> 1 then
		   messagebox('Error répertoire introuvable!','c:\ii4net\orthotek\correspondances\...',stopsign!)
	   else
		   v_lettre = lb_files.SelectedItem()
		   if v_lettre <> '' and isnull(v_lettre) = false and v_lettre <> 'NOUVELLE' then
			   v_doc = v_word + ' ' + v_lettre
		   else
			   v_doc = v_word
		   end if
		   if run(v_doc,maximized!) <> 1 then
			   sle_word.visible = true
			   sle_word.text = v_word
			   error_type(56)
			   messagebox("Avertissement!","Donnez l'emplacement de word!")
			   sle_word.text = 'EXEMPLE: C:\Program Files\Microsoft Office\Office\WINWORD.EXE'
			   sle_word.SetFocus()
		   end if
	   end if
   end if
end if
//	end if
//else
//	messagebox('Information','Vous devez sélectionner un document')
//end if
end event

type dw_lettres_patients from u_dw within w_lettres_patients
integer x = 9
integer y = 232
integer width = 1440
integer height = 1664
integer taborder = 20
string dragicon = "C:\ii4net\orthotek\images\Distlstl.ico"
string title = "Lettre patient"
string dataobject = "d_lettres_patients"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)

if v_langue = 'an' then
	this.object.t_1.text = "Nb. of patients:"
end if
end event

event clicked;//boolean result
//
//result = dw_lettres_patients.IsSelected(row)
//IF result THEN
//	dw_lettres_patients.setitem(row,'patient_corr',0)
//	dw_lettres_patients.SelectRow(row, FALSE)
//ELSE
//	dw_lettres_patients.setitem(row,'patient_corr',1)
//	dw_lettres_patients.SelectRow(row,true)
//END IF

dw_lettres_patients.drag(begin!)
end event

event getfocus;vfocus = 'recherche_patient'
end event

event losefocus;vfocus = 'none'
end event

event dragdrop;String is_filter
int patient_id

if vfocus = 'patient_sel' then
 //   patient_id = dw_lettres_patients_sel.object.patient_patient_id[dw_lettres_patients_sel.getrow()]
//    is_filter = of_killfilter(patient_id)
//	 if dw_lettres_patients_sel.rowcount() = 1 then
//	    is_filter = "patient_patient_id = 0"
//	 end if
//dw_lettres_patients_sel.setfilter(is_filter)
//	   dw_lettres_patients_sel.filter()
	 
//	 dw_lettres_patients_sel.retrieve(v_no_ortho)
dw_lettres_patients_sel.deleterow(dw_lettres_patients_sel.getrow())
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

type st_status from statictext within w_lettres_patients
integer x = 2619
integer y = 1784
integer width = 992
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_lettres_patients
integer x = 2647
integer y = 1912
integer width = 965
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

