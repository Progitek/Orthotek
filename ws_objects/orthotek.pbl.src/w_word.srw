$PBExportHeader$w_word.srw
forward
global type w_word from w_child
end type
type ole_word from olecontrol within w_word
end type
type cb_close from commandbutton within w_word
end type
type cb_lettername from commandbutton within w_word
end type
type cb_update from commandbutton within w_word
end type
end forward

global type w_word from w_child
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
ole_word ole_word
cb_close cb_close
cb_lettername cb_lettername
cb_update cb_update
end type
global w_word w_word

type variables
public string is_corrpath
public s_corrletter is_corrletter
end variables

forward prototypes
public subroutine uf_createdosspatletter (string as_wletter)
public function boolean uf_mergetodosspat (string as_wletter)
end prototypes

public subroutine uf_createdosspatletter (string as_wletter);////////////////////////////////////
//// Créé par : Éric Vézina ing.
//// Créé le  : 20-03-2005
//// Demande  : JMD
//// Version  : 7.8.8
//// Modifié par:
////	Modifié le :
////////////////////////////////////
//
//long ll_pos,ll_iddentist,ll_idpat, ll_ententetypefusion
//integer li_info,li_info1,li_res
//dec{2} ld_info,ld_info1,ld_info2
//date ldt_info
//string ls_info
//boolean  lb_result
//w_progressbar iw_progressbar
//
//SetPointer(HourGlass!)
//
//open(iw_progressbar)
//iw_progressbar.of_tache('Fusion du document ...')
//iw_progressbar.of_max(93)
//iw_progressbar.of_position(0)
//
//ll_idpat = is_corrletter.patid
////select patient_id into :ll_idpat from t_contact where id_contact = :al_idcontact;
//select id_dentist into :ll_iddentist from patient where patient_id = :ll_idpat;
//
//oleobject ole_word1
//ole_word1 = create oleobject
//li_res = ole_word1.ConnecttoNewObject("word.application")
//choose case li_res
//	case -1
//		messagebox('Err','Invalid Call: the argument is the Object property of a control')
//	case -2
//		messagebox('Err','Class name not found')
//	case -3
//		messagebox('Err','Object could not be created')
//	case -4
//		messagebox('Err','Could not connect to object')
//	case -9
//		messagebox('Err','Other error')
//	case -15
//		messagebox('Err','MTS is not loaded on this computer')
//	case -16
//		messagebox('Err','Invalid Call: this function not applicable')
//end choose
// 
//ole_word1.documents.open(as_wletter)
//
////ole_word1.Selection.Find.ClearFormatting
////ole_word1.Selection.Find.Replacement.ClearFormatting
////ole_word1.Selection.Find.Text = "Hi"
////ole_word1.Selection.Find.Replacement.Text = "Hello"
////ole_word1.Selection.Find.Forward = True
////ole_word1.Selection.Find.Wrap =  1 //wdFindContinue
////ole_word1.Selection.Find.Format = False
////ole_word1.Selection.Find.MatchCase = False
////ole_word1.Selection.Find.MatchWholeWord = False
////ole_word1.Selection.Find.MatchWildcards = False
////ole_word1.Selection.Find.MatchSoundsLike = False
////ole_word1.Selection.Find.MatchAllWordForms = False
////ole_word1.Selection.Find.Execute
//
////If ole_word1.Selection.Find.Forward = True Then
////      ole_word1.Selection.Collapse(1)   //wdCollapseStart
////Else
////      ole_word1.Selection.Collapse(0)   //wdCollapseEnd
////End If
//
//// <<PatSal>>
//SetNull(ls_info)
//select salutation into :ls_info from patient inner join t_salutation on patient.id_sal = t_salutation.id_sal where patient.patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<PatSal>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(1)
//// <<patnom>>
//SetNull(ls_info)
//select patient_nom into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patnom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(2)
//// <<patprenom>>
//SetNull(ls_info)
//select patient_prenom into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patprenom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(3)
//// <<patadd>>
//SetNull(ls_info)
//select adresse into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patadd>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(4)
//// <<patville>>
//SetNull(ls_info)
//select ville into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patville>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(5)
//// <<patprov>>
//SetNull(ls_info)
//select province into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patprov>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(6)
//// <<patcode>>
//SetNull(ls_info)
//select code_postale into :ls_info from patient where patient_id = :ll_idpat;
//ls_info = string(ls_info,'@@@ @@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patcode>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(7)
//// <<patgenre>>
//SetNull(ls_info)
//select sex into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Select(8)
//// <<patnodoss>>
//SetNull(ls_info)
//select new_dossier into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patnodoss>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(9)
//// <<patnopat>>
//SetNull(ls_info)
//select no_dossier into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patnopat>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(10)
//// <<patnoboite>>
//SetNull(ls_info)
//select no_boite into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patnoboite>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(11)
//// <<pattelr>>
//SetNull(ls_info)
//select tel_maison into :ls_info from patient where patient_id = :ll_idpat;
//ls_info = string(ls_info,'(@@@) @@@-@@@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<pattelr>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(12)
//// <<pattelb>>
//SetNull(ls_info)
//select tel_bureau into :ls_info from patient where patient_id = :ll_idpat;
//ls_info = string(ls_info,'(@@@) @@@-@@@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<pattelb>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(13)
//// <<patnaiss1>>
//SetNull(ls_info)
//select date_naissance into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patnaiss1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(14)
//// <<patnaiss2>>
//SetNull(ls_info)
//select date_naissance into :ldt_info from patient where patient_id = :ll_idpat;
//ls_info = calculage(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patnaiss2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(15)
//// <<traitdebut>>
//SetNull(ls_info)
//select max(debut_traitement) into :ldt_info from traitements where patient_id = :ll_idpat;
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<traitdebut>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(16)
////parent
//// <<nom_pere>>
//SetNull(ls_info)
//select nom_pere into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<nom_pere>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(17)
//// <<tel_pere>>
//SetNull(ls_info)
//select no_tel_pere into :ls_info from patient where patient_id = :ll_idpat;
//ls_info = string(ls_info,'(@@@) @@@-@@@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<tel_pere>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(18)
//// <<nom_mere>>
//SetNull(ls_info)
//select nom_mere into :ls_info from patient where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<nom_mere>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(19)
//// <<tel_mere>>
//SetNull(ls_info)
//select no_tel_mere into :ls_info from patient where patient_id = :ll_idpat;
//ls_info = string(ls_info,'(@@@) @@@-@@@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<tel_mere>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(20)
////Responsable
//// <<RespSal>>
//SetNull(ls_info)
////select salutation into :ls_info from t_salutation inner join t_contact on t_salutation.id_sal = t_contact.id_sal where t_contact.id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespSal>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(21)
//// <<RespSal2>>
//SetNull(ls_info)
////select salutation into :ls_info from t_salutation inner join t_contact on t_salutation.id_sal = t_contact.id_sal1 where t_contact.id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespSal2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(22)
//// <<RespPrenom>>
//SetNull(ls_info)
////select prenom into :ls_info from t_contact where id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespPrenom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(23)
//// <<RespNom>>
//SetNull(ls_info)
////select nom into :ls_info from t_contact where id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<patnom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(24)
//// <<RespAdd>>
//SetNull(ls_info)
////select adresse into :ls_info from t_contact where id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespAdd>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(25)
//// <<RespVille>>
//SetNull(ls_info)
////select ville into :ls_info from t_contact where id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespVille>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(26)
//// <<RespProv>>
//SetNull(ls_info)
////select province into :ls_info from t_contact where id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespProv>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(27)
//// <<RespCode>>
//SetNull(ls_info)
////select zip into :ls_info from t_contact where id_contact = :al_idcontact;
//ls_info = string(ls_info,'@@@ @@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespCode>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(28)
//// <<RespTel>>
//SetNull(ls_info)
////select telres into :ls_info from t_contact where id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RespTel>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(29)
////specialiste
//// <<spec_nomcompl>>
//SetNull(ls_info)
//select dr_nom_complet into :ls_info from ortho_id where ortho_id = :v_no_ortho;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<spec_nomcompl>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(30)
//// <<spec_add>>
//SetNull(ls_info)
//select dr_adresse into :ls_info from ortho_id where ortho_id = :v_no_ortho;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<spec_add>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(31)
//// <<spec_ville>>
//SetNull(ls_info)
//select dr_ville into :ls_info from ortho_id where ortho_id = :v_no_ortho;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<spec_ville>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(32)
//// <<spec_prov>>
//SetNull(ls_info)
//select dr_province into :ls_info from ortho_id where ortho_id = :v_no_ortho;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<spec_prov>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(33)
//// <<spec_code>>
//SetNull(ls_info)
//select dr_code_postal into :ls_info from ortho_id where ortho_id = :v_no_ortho;
//ls_info = string(ls_info,'@@@ @@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<spec_code>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(34)
//// Autre
//// <<date>>
//SetNull(ls_info)
//ls_info = string(today())
//lb_result = ole_word1.Selection.Find.Execute ("<<date>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(35)
//// Entente financiere
//// <<Phase>>
//SetNull(ls_info)
////if ll_ententetypefusion = 1 then
////	select id_phase into :li_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
////else
////	select phase into :li_info from t_entente where id_contact = :al_idcontact;
////end if
//ls_info = "Phase " + string(li_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Phase>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(36)
//// <<Ttype>>
//SetNull(ls_info)
////select traitement into :li_info from t_entente where id_contact = :al_idcontact;
//choose case li_info
//	case 0
//		ls_info = "Traitement partiel"
//	case 1
//		ls_info = "Traitement complet"
//end choose
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Ttype>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(37)
//// <<Tdebut>>
//SetNull(ls_info)
////if ll_ententetypefusion = 1 then
////	select date1 into :ldt_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
////else
////	select debut into :ldt_info from t_entente where id_contact = :al_idcontact;
////end if
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Tdebut>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(38)
//// <<Tfin>>
//SetNull(ls_info)
////select fin into :ldt_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Tfin>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(39)
//// <<Tduree>>
//SetNull(ls_info)
////select estduree1,estduree2 into :li_info,:li_info1 from t_entente where id_contact = :al_idcontact;
//if li_info1 = 0 or isnull(li_info1) then
//	ls_info = string(li_info) + ' mois'
//else
//	ls_info = string(li_info) + ' à ' + string(li_info1) + ' mois'
//end if
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Tduree>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(40)
//// <<TcoutTotal>>
//SetNull(ls_info)
////select cout_total into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TcoutTotal>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(41)
//// <<TcoutPhase1>>
//SetNull(ls_info)
////if ll_ententetypefusion = 1 then
////	select couttrait into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
////else
////	select cout_total1 into :ld_info from t_entente where id_contact = :al_idcontact;
////end if	
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TcoutPhase1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(42)
//// <<TcoutDiag1>>
//SetNull(ls_info)
//if ll_ententetypefusion = 1 then
////	select diag into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//else
////	select diag_anal1 into :ld_info from t_entente where id_contact = :al_idcontact;
//end if	
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TcoutDiag1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(43)
//// <<TpaieInit1>>
//SetNull(ls_info)
//if ll_ententetypefusion = 1 then
////	select initial into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//	ls_info = string(ld_info) + ' $'
//else
////	select paiement_init1,verpaieinit1 into :ld_info,:li_info from t_entente where id_contact = :al_idcontact;	
//	if li_info > 1 then
//		ls_info = string(li_info) + ' versement(s) de ' + string(ld_info) + ' $'
//	else
//		ls_info = string(ld_info) + ' $'
//	end if	
//end if	
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TpaieInit1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(44)
//// <<TdatePaieInit1>>
//SetNull(ls_info)
////select datepaieinit into :ldt_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TdatePaieInit1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(45)
//// <<Tversement1>>
//SetNull(ls_info)
//if ll_ententetypefusion = 1 then
////	select mmontant into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//else
////	select mensualite1 into :ld_info from t_entente where id_contact = :al_idcontact;
//end if
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Tversement1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(46)
//// <<TnbVersement1>>
//SetNull(ls_info)
//if ll_ententetypefusion = 1 then
////	select mqty into :li_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//else
////	select duree1 into :li_info from t_entente where id_contact = :al_idcontact;
//end if
//ls_info = string(li_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TnbVersement1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(47)
//// <<TpaieFinal1>>
//SetNull(ls_info)
//if ll_ententetypefusion = 1 then
////	select paiefinal into :ld_info from t_contrats where id_contact = :ll_idpat and id_phase = :al_phase;
//else
////	select paiement_fin1 into :ld_info from t_entente where id_contact = :al_idcontact;
//end if
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TpaieFinal1>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(48)
//// <<TcoutPhase2>>
//SetNull(ls_info)
////select cout_total2 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TcoutPhase2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(49)
//// <<TcoutDiag2>>
//SetNull(ls_info)
////select diag_anal2 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TcoutDiag2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(50)
//// <<TpaieInit2>>
//SetNull(ls_info)
////select paiement_init2,verpaieinit2 into :ld_info,:li_info from t_entente where id_contact = :al_idcontact;
//if li_info > 1 then
//	ls_info = string(li_info) + ' versement de ' + string(ld_info) + ' $'
//else
//	ls_info = string(ld_info) + ' $'
//end if
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TpaieInit2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(51)
//// <<TdatePaieInit2>>
//SetNull(ls_info)
////select datepaieinit into :ldt_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TdatePaieInit2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(52)
//// <<Tversement2>>
//SetNull(ls_info)
////select mensualite2 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Tversement2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(53)
//// <<TnbVersement2>>
//SetNull(ls_info)
////select duree2 into :li_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(li_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TnbVersement2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(54)
//// <<TpaieFinal2>>
//SetNull(ls_info)
////select paiement_fin2 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TpaieFinal2>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(55)
//// <<TcoutPhase3>>
//SetNull(ls_info)
////select cout_total3 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TcoutPhase3>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(56)
//// <<TcoutDiag3>>
//SetNull(ls_info)
////select diag_anal3 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TcoutDiag3>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(57)
//// <<TpaieInit3>>
//SetNull(ls_info)
////select paiement_init3,verpaieinit3 into :ld_info,:li_info from t_entente where id_contact = :al_idcontact;
//if li_info > 1 then
//	ls_info = string(li_info) + ' versement de ' + string(ld_info) + ' $'
//else
//	ls_info = string(ld_info) + ' $'
//end if
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TpaieInit3>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(58)
//// <<TdatePaieInit3>>
//SetNull(ls_info)
////select datepaieinit into :ldt_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TdatePaieInit3>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(59)
//// <<Tversement3>>
//SetNull(ls_info)
////select mensualite3 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Tversement3>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(60)
//// <<TnbVersement3>>
//SetNull(ls_info)
////select duree3 into :li_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(li_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TnbVersement3>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(61)
//// <<TpaieFinal3>>
//SetNull(ls_info)
////select paiement_fin3 into :ld_info from t_entente where id_contact = :al_idcontact;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TpaieFinal3>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(62)
//// <<TCommentaire>>
//SetNull(ls_info)
////select note1 into :ls_info from t_entente where id_contact = :al_idcontact;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TCommentaire>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(63)
//// Contrat
//// <<Description>>
//SetNull(ls_info)
////select description into :ls_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<Description>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(64)
//// <<TraitDate>>
//SetNull(ls_info)
////select date1 into :ldt_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TraitDate>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(65)
//// <<%>>
//SetNull(ls_info)
////select pourcentage into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ls_info = string(integer(ld_info))
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<%>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(66)
//// <<TCoutTrait>>
//SetNull(ls_info)
////select couttrait,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ld_info = ld_info * ld_info1 / 100
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TCoutTrait>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(67)
//// <<TCoutInit>>
//SetNull(ls_info)
////select initial,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ld_info = ld_info * ld_info1 / 100
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TCoutInit>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(68)
//// <<TCoutCons>>
//SetNull(ls_info)
////select cons into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TCoutCons>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(69)
//// <<TCoutDiag>>
//SetNull(ls_info)
////select diag,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ld_info = ld_info * ld_info1 / 100
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TCoutDiag>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(70)
//// <<TCoutMeb>>
//SetNull(ls_info)
////select meb,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ld_info = ld_info * ld_info1 / 100
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TCoutMeb>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(71)
//// <<TCoutRet>>
//SetNull(ls_info)
////select retfee,pourcentage into :ld_info,:ld_info1 from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ld_info = ld_info * ld_info1 / 100
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TCoutRet>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(72)
//// <<DateMens>>
//SetNull(ls_info)
////select mdate1 into :ldt_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ls_info = string(ldt_info)
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<DateMens>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(73)
//// <<CoutMens>>
//SetNull(ls_info)
////select mmontant into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<CoutMens>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(74)
//// <<NbMens>>
//SetNull(ls_info)
////select mqty into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ld_info = ld_info + 1
//ls_info = string(integer(ld_info))
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<NbMens>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(75)
//// <<TotMens>>
//SetNull(ls_info)
////select mmontant,mqty,paiefinal into :ld_info,:ld_info1,:ld_info2 from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ld_info = (ld_info * ld_info1) + ld_info2
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<TotMens>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(76)
//// <<PaieFinal>>
//SetNull(ls_info)
////select paiefinal into :ld_info from t_contrats where id_contact = :al_idcontact and id_phase = :al_phase and patient_id = :ll_idpat;
//ls_info = string(ld_info) + ' $'
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<PaieFinal>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(77)
//// Dentiste
//// <<DentSal>>
//SetNull(ls_info)
//select salutation into :ls_info from t_dentists inner join t_salutation on t_dentists.id_sal = t_salutation.id_sal
//																inner join patient on t_dentists.id_dentist = patient.id_dentist where patient.patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<DentSal>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(78)
//// <<dttitre>>
//SetNull(ls_info)
//select det_suf into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<dttitre>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(79)
//// <<dtprenom>>
//SetNull(ls_info)
//select det_prenom into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<dtprenom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(80)
//// <<dtnom>>
//SetNull(ls_info)
//select det_nom into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<dtnom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(81)
//// <<dtadd>>
//SetNull(ls_info)
//select det_add into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<dtadd>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(82)
//// <<dtville>>
//SetNull(ls_info)
//select det_ville into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<dtville>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(83)
//// <<dtprov>>
//SetNull(ls_info)
//select det_prov into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<dtprov>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(84)
//// <<dtcode>>
//SetNull(ls_info)
//select det_zip into :ls_info from t_dentists inner join patient on t_dentists.id_dentist = patient.id_dentist where patient_id = :ll_idpat;
//ls_info = string(ls_info,'@@@ @@@')
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<dtcode>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(85)
////référent
//// <<RefDent>>
//SetNull(ls_info)
//select salutation into :ls_info from t_referents inner join t_salutation on t_referents.id_sal = t_salutation.id_sal
//																 inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<RefDent>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(86)
//// <<reftitre>>
//SetNull(ls_info)
//select ref_suffix into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<reftitre>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(87)
//// <<refprenom>>
//SetNull(ls_info)
//select ref_prenom into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<refprenom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(88)
//// <<refnom>>
//SetNull(ls_info)
//select ref_nom into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<refnom>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(89)
//// <<refadd>>
//SetNull(ls_info)
//select ref_adresse into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<refadd>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(90)
//// <<refville>>
//SetNull(ls_info)
//select ref_ville into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<refville>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(91)
//// <<refprov>>
//SetNull(ls_info)
//select ref_province into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<refprov>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(92)
//// <<refcode>>
//SetNull(ls_info)
//select ref_zip into :ls_info from t_referents inner join patient on t_referents.id = patient.referant_nom where patient_id = :ll_idpat;
//if isnull(ls_info) then ls_info = ''
//lb_result = ole_word1.Selection.Find.Execute ("<<refcode>>", False, False, False,False, False, True, 1, False, ls_info, 1)
//iw_progressbar.of_position(93)
//ole_word1.ActiveDocument.SaveAs(is_corrpath + "\" + string(is_corrletter.patid) + "\" + is_corrletter.letter, 6)
//ole_word1.ActiveDocument.Close
//
//Destroy ole_word1
//close(iw_progressbar)
//ole_word.Activate ( InPlace! )
//
//
////long ll_pos,ll_iddentist,ll_idpat, ll_ententetypefusion
////integer li_info,li_info1
////dec{2} ld_info,ld_info1,ld_info2
////date ldt_info
////string ls_info
////
////select patient_id into :ll_idpat from t_contact where id_contact = :al_idcontact;
////select id_dentist into :ll_iddentist from patient where patient_id = :ll_idpat;
////
//////patient
//////select ententetypefusion into :ll_ententetypefusion from t_options where ortho_id = :v_no_ortho;
//
//
////return as_texte
end subroutine

public function boolean uf_mergetodosspat (string as_wletter);//////////////////////////////////
// Créé par : Éric Vézina ing.
// Créé le  : 20-03-2005
// Demande  : JMD
// Version  : 7.8.8
// Modifié par:
//	Modifié le :
//////////////////////////////////

long i,ll_pos,ll_iddentist,ll_idpat, ll_ententetypefusion
integer li_info,li_info1,li_res,li_asc,li_bspos = 0
dec{2} ld_info,ld_info1,ld_info2
date ldt_info
string ls_info,ls_letter,ls_char,ls_windex
boolean  lb_result
OLEObject iole_word
iole_word = CREATE oleobject

// correction du fichier
for i = 2 to len(as_wletter)
	ls_char = mid(as_wletter,i,1)
	li_asc = asc(ls_char)
	if li_asc = 92 then
		if i - li_bspos = 1 then
			as_wletter = replace(as_wletter,i,1,'')
		end if
		li_bspos = i
	end if
next

// verification si le template existe
if FileExists(as_wletter) then

	ls_letter = is_corrletter.letter
	// verification si le repertoire existe sinon creer
	If DirectoryExists ( is_corrpath + '\' + string(is_corrletter.patid) ) = false Then
		CreateDirectory ( is_corrpath + '\' + string(is_corrletter.patid) )
	else
		// verification si la lettre existe deja si oui renommer
		i = 1
		do while fileexists(is_corrpath + '\' + string(is_corrletter.patid) + '\' + ls_letter)
			ls_letter = is_corrletter.letter + string(i)
			i++
		loop
	end if
	is_corrletter.letter = ls_letter
	// mailmerge
	li_res = iole_word.Connecttonewobject("word.application")
	choose case li_res
		case -1
			messagebox('Err','Invalid Call: the argument is the Object property of a control')
		case -2
			messagebox('Err','Class name not found')
		case -3
			messagebox('Err','Object could not be created')
		case -4
			messagebox('Err','Could not connect to object')
		case -9
			messagebox('Err','Other error')
		case -15
			messagebox('Err','MTS is not loaded on this computer')
		case -16
			messagebox('Err','Invalid Call: this function not applicable')
	end choose
	iole_word.Documents.open(as_wletter)
	ls_windex = iole_word.ActiveDocument.Name
//	messagebox('docname',ls_windex)
	if fileexists("c:\ii4net\orthotek\img.html") then
		iole_word.Documents.open("c:\ii4net\orthotek\img.html")
		iole_word.Documents.Item("c:\ii4net\orthotek\img.html").Range.Copy()
		iole_word.Documents.Item("c:\ii4net\orthotek\img.html").close(0)
		if fileexists(as_wletter) then
			iole_word.Documents.Item(ls_windex).Activate()
			iole_word.ActiveDocument.Range(iole_word.ActiveDocument.Range.End - 1,iole_word.ActiveDocument.Range.End - 1).Paste()
		else
			error_type(0)
		end if
		filedelete("c:\ii4net\orthotek\img.html")
	end if
	iole_word.ActiveDocument.MailMerge.MainDocumentType = 0 //"wdFormLetters"
	iole_word.ActiveDocument.MailMerge.OpenDataSource('c:\ii4net\orthotek\pat.txt',0,false,false,false,false,"","",false)
	iole_word.ActiveDocument.MailMerge.Destination = 0 // "wdSendToNewDocument"
	iole_word.ActiveDocument.MailMerge.Execute
	iole_word.ActiveDocument.SaveAs(is_corrpath + "\" + string(is_corrletter.patid) + "\" + is_corrletter.letter)
	iole_word.Documents.close(0)
	iole_word.Application.Quit(0)
	iole_word.DisconnectObject()
	Destroy iole_word
	return true
else
	return false
end if
end function

on w_word.create
int iCurrent
call super::create
this.ole_word=create ole_word
this.cb_close=create cb_close
this.cb_lettername=create cb_lettername
this.cb_update=create cb_update
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_word
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_lettername
this.Control[iCurrent+4]=this.cb_update
end on

on w_word.destroy
call super::destroy
destroy(this.ole_word)
destroy(this.cb_close)
destroy(this.cb_lettername)
destroy(this.cb_update)
end on

event open;/////////////////////////////////////////////////////
//
// Par			: Eric Vezina ing.
// Date			: 20-03-2005
// Description	: r (mode lecture seul)
//					  w (mode edition)
//					  t (mode template)
//					  l (mode lettre)
//
// rl : ce mode est concu pour consulter une lettre patient.
// wl : ce mode est concu pour ecrire une nouvelle correspondance patient.
//
/////////////////////////////////////////////////////
integer li_res
setredraw(false)
select corrpath into :is_corrpath from t_options where ortho_id = :v_no_ortho;

is_corrletter = message.powerobjectparm
//li_res = ole_word.InsertClass("Word.application")
if li_res = 0 then
	//messagebox('letter',is_corrletter.letter)
	choose case is_corrletter.flag + is_corrletter.mode
		case 'rt'
			// masquer les commands buttons
			cb_lettername.enabled = false
			cb_update.text = 'Fermer'
			// lire un template sans le modifier
			if FileExists(is_corrpath + '/' + is_corrletter.letter) then
				ole_word.insertfile(is_corrpath + '/' + is_corrletter.letter)
			else
				ole_word.insertfile('c:\ii4net\orthotek\tpl')
			end if
		case 'rl'
			// masquer les commands buttons
			cb_lettername.enabled = false
//			cb_update.text = 'Fermer'
			// lire une correspondance patient sans la modifier
			if FileExists(is_corrpath + '/' + string(is_corrletter.patid) + '/' + is_corrletter.letter) then
				ole_word.insertfile(is_corrpath + '/' + + string(is_corrletter.patid) + '/' + is_corrletter.letter)
			else
				messagebox('Erreur!','Impossible de trouver ' + is_corrpath + '\' + string(is_corrletter.patid) + '\' + is_corrletter.letter)
				close(w_word)
			end if
		case 'wt'
			// masquer les commands buttons
//			if is_corrletter.flag = 'w' and is_corrletter.patid > 0 and is_corrletter.mode = 'l' then
//				cb_print.enabled = true
//			end if
			// ecrire un nouveau template
			if FileExists(is_corrpath + '/' + is_corrletter.letter) then
				ole_word.insertfile(is_corrpath + '/' + is_corrletter.letter)
			else
				ole_word.insertfile('c:\ii4net\orthotek\tpl')
			end if
		case 'wl'
			// masquer les commands buttons
//			if is_corrletter.flag = 'w' and is_corrletter.patid > 0 and is_corrletter.mode = 'l' then
//				cb_print.enabled = true
//			end if
			// creer le document ds le dossier du patient
			if uf_mergetodosspat(is_corrpath + '\' + is_corrletter.letter) then
				ole_word.insertfile(is_corrpath + '/' + string(is_corrletter.patid) + '/' + is_corrletter.letter)
			else
				messagebox('Erreur!','Impossible de trouver la lettre type : ' + is_corrpath + '\' + is_corrletter.letter)
				close(w_word)
			end if
	end choose
end if
ole_word.activate(InPlace!)
ole_word.SetFocus()
setredraw(true)
ole_word.setredraw(true)
end event

event clicked;ole_word.activate(InPlace!)
ole_word.setfocus()
end event

event timer;//w_principal.SetMicroHelp(is_corrpath + '\' + is_corrletter.letter)
end event

type ole_word from olecontrol within w_word
integer y = 116
integer width = 3602
integer height = 1832
integer taborder = 10
boolean focusrectangle = false
string binarykey = "w_word.win"
omdisplaytype displaytype = displayasactivexdocument!
omcontentsallowed contentsallowed = containsany!
omlinkupdateoptions linkupdateoptions = linkupdatemanual!
end type

event constructor;ole_word.setredraw(false)
end event

type cb_close from commandbutton within w_word
integer x = 3255
integer y = 1964
integer width = 370
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;w_word.setredraw(false)
ole_word.setredraw(false)
choose case is_corrletter.flag + is_corrletter.mode
	case 'wl'
		filedelete(is_corrpath + "\" + string(is_corrletter.patid) + "\" + is_corrletter.letter)
end choose

close(parent)
end event

type cb_lettername from commandbutton within w_word
integer y = 1964
integer width = 699
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Changer le nom"
end type

event clicked;openwithparm(w_lettername,is_corrletter.letter,w_principal)
w_word.title = "Corps de la lettre"
end event

type cb_update from commandbutton within w_word
integer x = 699
integer y = 1964
integer width = 2555
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder et fermer"
end type

event clicked;w_word.setredraw(false)
ole_word.setredraw(false)
if len(is_corrletter.letter) > 3 then
	choose case is_corrletter.flag + is_corrletter.mode
		case 'rl'
			ole_word.saveas(is_corrpath + '\' + string(is_corrletter.patid) + '\' + is_corrletter.letter)
			if isvalid(w_dossier_patients) then
				w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
			end if
		case 'rt'
			// ne pas sauvegarder
		case 'wl'
			ole_word.saveas(is_corrpath + '\' + string(is_corrletter.patid) + '\' + is_corrletter.letter)
			if isvalid(w_dossier_patients) then
				w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
			end if
		case 'wt'
			ole_word.saveas(is_corrpath + '\' + is_corrletter.letter)
			if isvalid(w_corrletters) then
				w_corrletters.lb_files.DirList(w_corrletters.is_corrpath+'/*.doc', 0)
			end if
	end choose
end if

close(parent)
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
09w_word.bin 
2C00004e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0000000cfffffffefffffffe00000005000000060000000700000008000000090000000a0000000bfffffffe0000001d0000000e0000000f0000001000000011000000120000001300000014fffffffe000000160000001700000018000000190000001a0000001b0000001cfffffffefffffffe0000001f000000200000002100000022000000230000002400000025fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000040002090600000000000000c0460000000000000000000000000000006e996f9001c5f5cc000000030000014000000000004f00010065006c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000102000affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000140000000000540031006200610065006c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000e0000000100000003ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000004000010000000000000430001006d006f004f0070006a006200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000006a00000000fffffffe00000002fffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff02000001000000000000000000000000000000000065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0072006400670061fffe000100000a03ffffffff0002090600000000000000c0460000000000001875636f44746e656d63694d206f736f72572074660064726f0000000a6f57534d6f446472001000636f570000442e64726d75636f2e746e6539f40038000071b20000000000000000005b000000620070005f006d00720064006700610065006cffffffff000000030000000400000001ffffffff000000020000000000003b88000001e70000002c0009000100160300000000000000000500050000020b0000000000000000000501e7020c00033b880000000000000000000000000000000000000000414e00000000494e006d00000064005f00610072007700670074006900690068005d006e00680000006c00650020007000200028006e0069006500740065006700200072007000780073006f0020002c006e0069006500740065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070005f006d006500680070006c0000005d000000000000264a000000000000266a000000000000269e00000000000026c200000000000026ea000000000000270e000000000000272800000000000f00140001000a000f0069000000030000000000380000fff14000003800020006000c006f004e006d0072006c0061000200000018000000184a430401485f00184a610c0c486d0c0c4873040c48740000000000000000000000000000000000320000fff24041003200a10011000c006f00500069006c00650063007000200072006100640020006600e90075006100000074000000000000000000000000000100000003000000000c00ffff00000001ffff200400000001ffff00997aa00000000000000000000000010000000004000000040100000003000004000000040100000004000004000000040100000005000040ff0000000180000000000000000000004290f00001000100000000000000000000000000000000000010020000000000000100000030000040000801ffff00070000006e0055006e006b0077006f00ff006e00080001ff0000000000000000ff000000000001ffff000000020000ff00ffff00ff000000020000ff00ffff000300000047000000000190160602020005040503870403020020007a0880000000000000ff00000000000001540000006d006900730065004e00200077006500520020006d006f006e00610035000000020190160105050006070102000705020000000000100000000000000000000000800000530000006d0079006f00620000006c0090263300020000010204060b02020202007a87040000002000000880000000000001ff0000000000720041006100690000006c00040022008c083000c4f00018a90000020000000193e2850093e28526000000260000010000000000000000000100000000000100030004000000011000000000000000000100010001000000000000000000000010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0070800b400b40512818100000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000ce000000000000020000000010f00000000008000000000000000000000000000000000000000000000000000000000012ffff00000000000000000000000000070000004900490048003400300050000700310049004900480034003000500000003100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
230000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062004f0065006a00740063006f0050006c006f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100160000000200000006ffffffff00000000000000000000000000000000000000006e996f9001c5f5cc6e996f9001c5f5cc000000000000000000000000004f00020065006c007200500073006500300030000000300000000000000000000000000000000000000000000000000000000000000000000000000000000001020018ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000006e00000000006f005700640072006f0044007500630065006d0074006e000000000000000000000000000000000000000000000000000000000000000000000000000000000002001a0000000500000007ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000d000010000000000000530005006d00750061006d00790072006e0049006f0066006d007200740061006f00690000006e00000000000000000000000000000000000000000000000001020028ffffffff00000008ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000015000010000000000000c1a5ec0409202512f00000000000bf100000000000000000000400000004016a62000ee7256a620000e725000000000000000000000000000000000016040c00000c2e00018d4700018d470000000100000000000000000000000000000000000000000000000000000000000fffff0000000000000000000fffff0000000000000000000fffff000000000000000000000000000000000000006c009e000000000000009e0000009e000000000000009e000000000000009e000000000000009e000000000000009e000000140000000000000000000000d200000000000000d200000000000000d200000000000000d200000000000000d20000000c000000de0000000c000000d20000000000000177000000b6000000f600000000000000f600000000000000f600000000000000f600000000000000f600000000000000f600000000000000f600000000000000f600000000000000f600000002000000f800000000000000f800000000000000f800000000000000f800000000000000f800000000000000f8000000240000022d000002200000044d000000460000011c00000015000000000000000000000000000000000000009e00000000000000f60000000000000000000000000000000000000000000000f600000000000000f600000000000000f600000000000000f6000000000000011c00000000000000f6000000000000009e000000000000009e00000000000000f6000000000000000000000000000000f6000000000000013100000016000000f600000000000000f600000000000000f600000000000000f6000000000000009e00000000000000f6000000000000009e00000000000000f600000000000000f6000000000000000000000000000000f600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f600000000000000f600000000000000f600000000000000f6000000000000000000000000000000f6000000000000009e000000000000009e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2400000000000000000000000000f600000000000000f600000000000000ea0000000c0000ac60000033a787fb00d201c50000000000d200000000000000f600000000000000f6000000000000000000000000000000f60000000000000147000000300000017700000000000000f6000000000000049300000000000000f6000000000000049300000000000000f600000000000000f600000000000000b200000012000000c40000000e0000009e000000000000009e000000000000009e000000000000009e00000000000000020000000000d90000000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000004010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000040000000401000000fd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000000040000000401000000fe0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
240000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101029031002cb01f0168b0202fd0b0213de0b022070890230708902405a0b02505a0b0170000b01802c4900c02c4000002c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe000201050000000000000000000000000000000000000001f29f85e010684ff9000891abd9b3272b0000003000000168000000110000000100000090000000020000009800000003000000a400000004000000b000000005000000c000000006000000cc00000007000000d800000008000000ec00000009000000fc00000012000001080000000a000001240000000c000001300000000d0000013c0000000e000001480000000f000001500000001000000158000000130000016000000002000004e40000001e00000001007300000000001e00000001007300000000001e0000000848344949003130500000001e00000001483449000000001e00000001483449000000001e0000000b6d726f4e642e6c610000746f0000001e0000000848344949003130500000001e00000002483400310000001e000000137263694d666f736f6f572074392064720000302e0000004000000000000000000000004082fb760001c533a70000004082fb760001c533a70000000300000001000000030000000000000003000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400050063006f006d0075006e006500530074006d00750061006d00790072006e0049006f0066006d007200740061006f00690000006e000000000000000000020038ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000001e00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe000201050000000000000000000000000000000000000001d5cdd502101b2e9c00089793aef92c2b00000030000000e80000000c00000001000000680000000f00000070000000050000007c000000060000008400000011
240000008c00000017000000940000000b0000009c00000010000000a400000013000000ac00000016000000b40000000d000000bc0000000c000000c900000002000004e40000001e00000004003469690000000300000001000000030000000100000003000000000000000300091b0e0000000b000000000000000b000000000000000b000000000000000b000000000000101e000000010000000100100c000000020000001e0000000600746954000300657201000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19w_word.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
