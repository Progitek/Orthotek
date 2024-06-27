$PBExportHeader$w_confrappelmail.srw
forward
global type w_confrappelmail from w_response
end type
type cbx_smsauto from checkbox within w_confrappelmail
end type
type cbx_1 from checkbox within w_confrappelmail
end type
type cbx_email3 from checkbox within w_confrappelmail
end type
type cbx_email2 from checkbox within w_confrappelmail
end type
type uo_toolbar from u_cst_toolbarstrip within w_confrappelmail
end type
type rr_3 from roundrectangle within w_confrappelmail
end type
type st_4 from statictext within w_confrappelmail
end type
type st_3 from statictext within w_confrappelmail
end type
type hpb_sendcourriel from hprogressbar within w_confrappelmail
end type
type st_title from st_uo_transparent within w_confrappelmail
end type
type dw_confrappelmail from u_dw within w_confrappelmail
end type
type rr_1 from roundrectangle within w_confrappelmail
end type
type rr_2 from roundrectangle within w_confrappelmail
end type
type cbx_email1 from checkbox within w_confrappelmail
end type
type cbx_sms from checkbox within w_confrappelmail
end type
type tab_msg from tab within w_confrappelmail
end type
type tabpage_msgpred from userobject within tab_msg
end type
type cbx_confcourriel from checkbox within tabpage_msgpred
end type
type ddlb_listmsg from u_ddlb within tabpage_msgpred
end type
type mle_msgan from multilineedit within tabpage_msgpred
end type
type mle_msgfr from multilineedit within tabpage_msgpred
end type
type mle_sujetfr from multilineedit within tabpage_msgpred
end type
type mle_sujetan from multilineedit within tabpage_msgpred
end type
type st_6 from statictext within tabpage_msgpred
end type
type st_5 from statictext within tabpage_msgpred
end type
type tabpage_msgpred from userobject within tab_msg
cbx_confcourriel cbx_confcourriel
ddlb_listmsg ddlb_listmsg
mle_msgan mle_msgan
mle_msgfr mle_msgfr
mle_sujetfr mle_sujetfr
mle_sujetan mle_sujetan
st_6 st_6
st_5 st_5
end type
type tabpage_msghtml from userobject within tab_msg
end type
type lb_filehtml from u_lb within tabpage_msghtml
end type
type tabpage_msghtml from userobject within tab_msg
lb_filehtml lb_filehtml
end type
type tab_msg from tab within w_confrappelmail
tabpage_msgpred tabpage_msgpred
tabpage_msghtml tabpage_msghtml
end type
end forward

global type w_confrappelmail from w_response
integer width = 4649
integer height = 2180
boolean titlebar = false
boolean controlmenu = false
long backcolor = 15780518
boolean center = true
cbx_smsauto cbx_smsauto
cbx_1 cbx_1
cbx_email3 cbx_email3
cbx_email2 cbx_email2
uo_toolbar uo_toolbar
rr_3 rr_3
st_4 st_4
st_3 st_3
hpb_sendcourriel hpb_sendcourriel
st_title st_title
dw_confrappelmail dw_confrappelmail
rr_1 rr_1
rr_2 rr_2
cbx_email1 cbx_email1
cbx_sms cbx_sms
tab_msg tab_msg
end type
global w_confrappelmail w_confrappelmail

type variables
protected date idt_date
protected long il_idspec
long il_typecourriel
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_fermer ()
public subroutine of_print ()
public subroutine of_send ()
public subroutine of_changermsg ()
public subroutine of_sendrdv ()
public subroutine of_confhoraire (long al_row)
public subroutine of_etiquette ()
public function string of_html (string as_msg, long al_idmessage, long al_iduser, long al_idpat)
public function integer of_traitrequis ()
public subroutine of_pdf ()
protected function integer of_courriel (string as_message, string as_emailto, string as_nomto, string as_emailfrom, long al_patid, string as_sujet, integer ai_sms, long al_idrdv, string as_attchment)
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_settheme("classics")
uo_toolbar.of_displayborder(true)

if gnv_app.of_getlangue( ) = 'an' then
	uo_toolbar.of_additem("Print", "Print!")
	uo_toolbar.of_additem("Send", "Custom025!")
	uo_toolbar.of_additem("Label", "Custom074!")
	uo_toolbar.of_additem("Change message","Pastewindow!")
	uo_toolbar.of_additem("Close", "Exit!")
	st_title.text = "Appointment list to send by email"
	cbx_email1.text = "Email 1"
	cbx_email2.text = "Email 2"
	cbx_email3.text = "Email 3"
	st_3.text = "Sender: "
else
	uo_toolbar.of_additem("Imprimer", "Print!")
	uo_toolbar.of_additem("Envoyer", "Custom025!")
	uo_toolbar.of_additem("Étiquette", "Custom074!")
	uo_toolbar.of_additem("Changer le message","Pastewindow!")
	uo_toolbar.of_additem("Fermer", "Exit!")
end if

uo_toolbar.of_displaytext(true)


end subroutine

public subroutine of_fermer ();close(w_confrappelmail)
end subroutine

public subroutine of_print ();gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_confrappelmail)
end subroutine

public subroutine of_send ();string  ls_smtpuserid, ls_smtpserver, ls_smtppassword, ls_courriel, ls_nomdoc, ls_langue, ls_sujet
string ls_msgfr, ls_msgan, ls_sujetfr, ls_sujetan, ls_nom, ls_email, ls_body, ls_sms, ls_msg, ls_now
string ls_email1, ls_email2, ls_email3
long  ll_smtpport, ll_smtpauth, ll_logfile, ll_iduser, j, ll_pos, ll_patid, ll_idhorrdvpat
long ll_envoyercourriel, ll_emailinvalide, ll_delai, ll_idpers, ll_idcontact, lL_sendcourriel, m
date ldt_age, ldt_daterdv
n_smtp luo_smtp
n_cst_datetime luo_time
n_cst_fusion luo_fusion
long ll_idspec, ll_c, ll_s

//ll_idspec = gnv_app.of_getspecid( )

// Aller chercher les informations dans les options

select 	isnull(smtpserver,''), isnull(smtpport,25), isnull(smtpuserid,''), isnull(smtppassword,''), 
			isnull(smtpauth,0), isnull(logfile,0), isnull(delaimail,0)
into		:ls_smtpserver, :ll_smtpport, :ls_smtpuserid, :ls_smtppassword, :ll_smtpauth, :ll_logfile, :ll_delai
from 		t_options
where 	t_options.ortho_id = :v_no_ortho;

setnull(ldt_daterdv)
ls_msgfr = tab_msg.tabpage_msgpred.mle_msgfr.text
ls_sujetfr =  tab_msg.tabpage_msgpred.mle_sujetfr.text
ls_msgan = tab_msg.tabpage_msgpred.mle_msgan.text
ls_sujetan = tab_msg.tabpage_msgpred.mle_sujetan.text

If ls_smtpserver = "" Then
	MessageBox("Avertissement", "Vous devez configurer les informations du SMTP avant de procéder")
	Return
End If

select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :gl_idpers;

If ls_courriel = "" Then
	MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
	Return
End If

// Setter le nombre de email a expedier dans la progressbar
hpb_sendcourriel.setrange(1, dw_confrappelmail.rowcount() * 10) 
setpointer(hourglass!)

for j = 1 to dw_confrappelmail.rowcount()
	
	ll_c = dw_confrappelmail.getItemNumber(j,'c')
	ll_s = dw_confrappelmail.getItemNumber(j,'s')
	
	if ll_c = 1 or ll_s = 1 then
		
		// ON place en ordre les destinataires

		ll_patid = dw_confrappelmail.getItemNumber(j,'id_patient')
		ls_nom = dw_confrappelmail.getItemString(j,'nompatient')
//		ls_email = dw_confrappelmail.getItemString(j,'courriel')
		ls_langue = dw_confrappelmail.getItemString(j,'langue')
		select email, email2, email3 into :ls_email1, :ls_email2, :ls_email3
		from patient
		where patient_id = :ll_patid;
		
		for m = 1 to 3
			
			CHOOSE CASE m
				CASE 1
					ls_email = ls_email1
				CASE 2
					ls_email = ls_email2
				CASE 3
					ls_email = ls_email3					
			END CHOOSE
		
			if isnull(ls_email) then ls_email = ''
			if match(ls_email,'@') then
				ll_pos = pos(ls_email,'@')
				if pos(mid(ls_email,ll_pos),'.') > 0 then
				
					select id_contact into :ll_idcontact from patient where patient_id = :ll_patid;
					if ls_langue = 'A' then
						ls_msg = luo_fusion.of_fusion(ls_msgan,ll_idcontact,0,1900-01-01)
						ls_sujet = luo_fusion.of_fusion(ls_sujetan,ll_idcontact,0,1900-01-01)
					else
						ls_msg = luo_fusion.of_fusion(ls_msgfr,ll_idcontact,0,1900-01-01)
						ls_sujet = luo_fusion.of_fusion(ls_sujetfr,ll_idcontact,0,1900-01-01)
					end if
							
					if ll_c = 1 then
						
						of_courriel(ls_msg,ls_email,ls_nom,ls_courriel,ll_patid,ls_sujet, 0, 0,'')
						dw_confrappelmail.setItem(j,'envoicourriel',1)
							
						if il_typecourriel = 1 then
						
							// Mettre le commentaire dans le dossier patient
							
							if v_langue = 'an' then
								insert into t_histonote(patient_id, id_personnel, datehisto, histonote)
								values(:ll_patid,:gl_idpers,now(),'Recall sended by email');
								error_type(-1)
							else
								insert into t_histonote(patient_id, id_personnel, datehisto, histonote)
								values(:ll_patid,:gl_idpers,now(),'Rappel envoyé par courriel');
								error_type(-1)
							end if
							
							// Ajouter dans le note de rappel
							
							ls_now = string(now(),'yyyy-mm-dd hh:mm:ss')
							update RENDEZVOUS set note1 = isnull(note1,'') || ' ' || 'Rappel envoyé par courriel le ' || :ls_now
							where patient_id = :ll_patid;
							error_type(-1)
							
						end if
						
					end if
					
					if ll_s = 1 then
						select isnull(telcell,'') into :ls_sms from patient where patient_id = :ll_patid;
						of_courriel(ls_msg,ls_sms,ls_nom,ls_courriel,ll_patid,ls_sujet, 1,0,'')
						dw_confrappelmail.setItem(j,'envoicourriel',1)
							
						if il_typecourriel = 1 then
						
							// Mettre le commentaire dans le dossier patient
							
							if v_langue = 'an' then
								insert into t_histonote(patient_id, id_personnel, datehisto, histonote)
								values(:ll_patid,:gl_idpers,now(),'Recall sended by SMS');
								error_type(-1)
							else
								insert into t_histonote(patient_id, id_personnel, datehisto, histonote)
								values(:ll_patid,:gl_idpers,now(),'Rappel envoyé par SMS');
								error_type(-1)
							end if
							
							// Ajouter dans le note de rappel
							
							update RENDEZVOUS set note1 = isnull(note1,'') || ' ' || 'Rappel envoyé par courriel le ' || now()
							where patient_id = :ll_patid;
							error_type(-1)
							
						end if
							
					end if
		//			sleep(ll_delai)
				end if
			end if
			
		next
			
	end if
	
	hpb_sendcourriel.stepit( )
	
next

MessageBox("Information", "Opération terminée avec succès")


		
		

end subroutine

public subroutine of_changermsg ();//  gnv_app.inv_entrepotglobal.of_ajoutedonnee("nospecemail", gnv_app.of_getspecid( )) 
//gnv_app.inv_entrepotglobal.of_ajoutedonnee("typecourriel", il_typecourriel) 
//opensheet(w_listmsgemail,w_appframe,2,layered!)

string ls_sujetfr, ls_sujetan, ls_msgfr, ls_msgan
long ll_idmsgcourriel, ll_cnt, ll_confparcourriel


ls_sujetfr = tab_msg.tabpage_msgpred.mle_sujetfr.text
ls_sujetan = tab_msg.tabpage_msgpred.mle_sujetan.text
ls_msgfr = tab_msg.tabpage_msgpred.mle_msgfr.text
ls_msgan = tab_msg.tabpage_msgpred.mle_msgan.text

if tab_msg.tabpage_msgpred.cbx_confcourriel.checked then
	ll_confparcourriel = 1
else
	ll_confparcourriel = 0
end if

select count(1) into :ll_cnt from t_messagecourriel where typemessage = :il_typecourriel and ortho_id = :v_no_ortho;
if ll_cnt = 0 then
	insert into t_messagecourriel(titrecourriel,typemessage,sujetcourriel,sujetcourrielan,messagecourriel,messagecourrielan,ortho_id,confirmation) 
	values('Message de rappels',:il_typecourriel,:ls_sujetfr,:ls_sujetan,:ls_msgfr,:ls_msgan,:v_no_ortho,:ll_confparcourriel);
else
	ll_idmsgcourriel = tab_msg.tabpage_msgpred.ddlb_listmsg.of_getselectedData()
	update t_messagecourriel set 	sujetcourriel = :ls_sujetfr, 
											sujetcourrielan = :ls_sujetan,
											messagecourriel = :ls_msgfr,
											messagecourrielan = :ls_msgan,
											confirmation = :ll_confparcourriel
	where id_messagecourriel = :ll_idmsgcourriel;
	if gf_sqlerr() then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
end if

if gnv_app.of_getlangue() = 'an' then
	messagebox("Avertissement","Message is save succcessfully",Information!,Ok!)
else
	messagebox("Avertissement","Sauvegarde effectué avec succès",Information!,Ok!)
end if


end subroutine

public subroutine of_sendrdv ();string  ls_smtpuserid, ls_smtpserver, ls_smtppassword, ls_courriel, ls_nomdoc, ls_langue, ls_note, ls_messadultfr, ls_messenffr
string ls_messadultan, ls_messenfan, ls_sujet, ls_sms, ls_email1, ls_email2, ls_email3
string ls_nom, ls_email, ls_body, ls_msg
long  ll_smtpport, ll_smtpauth, ll_logfile, ll_iduser, j, ll_pos, ll_patid, ll_idhorrdvpat, ll_c, ll_s, m, ll_sendcourriel
long ll_envoyer, ll_emailinvalide, ll_delai, ll_idhorconf, ll_idpers, ll_idcontact, ll_idrdv,ll_confpardefaut
date ldt_age, ldt_rdv, ldt_daterdv
boolean lb_traiter
n_smtp luo_smtp
n_cst_datetime luo_time
n_cst_fusion luo_fusion
//n_corrfusion luo_corrfus

// Aller chercher les informations dans les options

select 	isnull(smtpserver,''), isnull(smtpport,25), isnull(smtpuserid,''), isnull(smtppassword,''), 
			isnull(smtpauth,0), isnull(logfile,0), isnull(delaimail,0)
into		:ls_smtpserver, :ll_smtpport, :ls_smtpuserid, :ls_smtppassword, :ll_smtpauth, :ll_logfile, :ll_delai
from 		t_options 
where 	ortho_id = :v_no_ortho;

ls_messadultfr = tab_msg.tabpage_msgpred.mle_msgfr.text
ls_messenffr =  tab_msg.tabpage_msgpred.mle_sujetfr.text
ls_messadultan = tab_msg.tabpage_msgpred.mle_msgan.text
ls_messenfan = tab_msg.tabpage_msgpred.mle_sujetan.text

If ls_smtpserver = "" Then
	MessageBox("Avertissement", "Vous devez configurer les informations du SMTP avant de procéder")
	Return
End If

select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :gl_idpers;

If ls_courriel = "" Then
	MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
	Return
End If

// Setter le nombre de email a expedier dans la progressbar
hpb_sendcourriel.setrange(1, dw_confrappelmail.rowcount() * 10) 
setpointer(hourglass!)

for j = 1 to dw_confrappelmail.rowcount()
	
	ll_envoyer = dw_confrappelmail.getItemNumber(j,'t_rdv_envoyermail')
	if isnull(ll_envoyer) then ll_envoyer = 0
	ll_c = dw_confrappelmail.getItemNumber(j,'c')
	ll_s = dw_confrappelmail.getItemNumber(j,'s')

	if (ll_c = 1 or ll_s = 1) and ll_envoyer = 0 then
		
		// ON place en ordre les destinataires

		ll_patid = dw_confrappelmail.getItemnumber(j,'t_rdv_patient_id')
		ls_nom = dw_confrappelmail.getItemString(j,'patnom')
		ls_email1 = dw_confrappelmail.getItemString(j,'patient_email')
		ls_email2 = dw_confrappelmail.getItemString(j,'patient_email2')
		ls_email3= dw_confrappelmail.getItemString(j,'patient_email3')
		ldt_age = dw_confrappelmail.getItemdate(j,'patient_date_naissance')
		ls_langue = dw_confrappelmail.getItemString(j,'patient_langue')
		ll_idrdv = dw_confrappelmail.getItemNumber(j,'t_rdv_id_rdv')
		ldt_rdv = dw_confrappelmail.getItemDate(j,'t_rdv_rdvdate') 
		ls_sms = dw_confrappelmail.getItemString(j,'patient_telcell') 
		
			
		// Validation de l'adresse e-mail
	
		for m = 1 to 3 
			
			// On utilise le email 1 a 3
			
			CHOOSE CASE m
				CASE 1
					ls_email = ls_email1
				CASE 2
					ls_email = ls_email2
				CASE 3
					ls_email = ls_email3					
			END CHOOSE

			if isnull(ls_email) then ls_email = ''
			if match(ls_email,'@')  then
				ll_pos = pos(ls_email,'@')
				if pos(mid(ls_email,ll_pos),'.') > 0 then
					
					ldt_daterdv = relativedate(idt_date, -1)
					select id_contact into :ll_idcontact from patient where patient_id = :ll_patid;
					if ls_langue = 'A' then
						ls_msg = luo_fusion.of_fusion(ls_messadultan,ll_idcontact,0,ldt_daterdv)
						ls_sujet = luo_fusion.of_fusion(ls_messenfan,ll_idcontact,0,ldt_daterdv)
					else
						ls_msg = luo_fusion.of_fusion(ls_messadultfr,ll_idcontact,0,ldt_daterdv)
						ls_sujet = luo_fusion.of_fusion(ls_messenffr,ll_idcontact,0,ldt_daterdv)
					end if
					
//					lb_traiter = false
					
					if ll_c = 1 then
						of_courriel(ls_msg,ls_email,ls_nom,ls_courriel,ll_patid,ls_sujet,0,ll_idrdv,'')
					end if
					if ll_s = 1 then
						select isnull(telcell,'') into :ls_sms from patient where patient_id = :ll_patid;
						of_courriel(ls_msg,ls_sms,ls_nom,ls_courriel,ll_patid,ls_sujet,1,ll_idrdv,'')
					end if
					dw_confrappelmail.setItem(j,'t_rdv_envoyermail',1)
					
					// send the message
					update t_rdv set envoyermail = 1 where id_rdv = :ll_idrdv;
						if error_type(-1) = 1 then
						commit using SQLCA;
					else
						rollback using SQLCA;
					end if
					
					// Confirmation dans l'horaire
				
					//if tab_msg.tabpage_msgpred.cbx_confcourriel.checked then
						select isnull(confpardefaut,0) into :ll_confpardefaut from t_options where ortho_id = :v_no_ortho;
						if ll_confpardefaut = 0 then of_confhoraire(j)
					//end if						
					
					// Mettre message dans boîte d'envoi
					
//						INSERT INTO t_message ( dateenvoye,   
//														priorite,   
//														message_de,   
//														message_a,   
//														message_texte,   
//														sujet,   
//														source,   
//														statut,   
//														statut_lu,
//														typemessagerie,
//														couleur)
//											VALUES (	now(),
//														'0',
//														:gs_user,
//														:ls_email,
//														:ls_msg,
//														'confirmation de rendez-vous',
//														'e',
//														'a',
//														'o',
//														'U',
//														15780518);
//					error_type(-1)						

				end if
			end if
		
		next
		
	//	sleep(ll_delai)
		
	end if
	
	hpb_sendcourriel.stepit( )
	
next

MessageBox("Information", "Opération terminée avec succès")






















/*


// Setter le nombre de email a expedier dans la progressbar

for j = 1 to dw_confrappelmail.rowcount()
	
	if (ll_c = 1 or ll_s = 1) and ll_envoyercourriel = 0 and ll_emailinvalide = 0 then
		
		// ON place en ordre les destinataires

	//		luo_corrfus.of_setlangue(ls_langue)
		
		if isnull(ls_email) then ls_email = ''
		if match(ls_email,'@') then
			ll_pos = pos(ls_email,'@')
			if pos(mid(ls_email,ll_pos),'.') > 0 then
				
				if ls_langue = 'A' then
//					ls_body = luo_corrfus.of_fusion(ls_msgan,'id_patient',string(ll_patid))
//					ls_sujet = luo_corrfus.of_fusion(ls_sujetan,'id_patient',string(ll_patid))
				else
//					ls_body = luo_corrfus.of_fusion(ls_msgfr,'id_patient',string(ll_patid))
//					ls_sujet = luo_corrfus.of_fusion(ls_sujetfr,'id_patient',string(ll_patid))
				end if
				
//				ls_body = luo_corrfus.of_fusion(ls_body,'id_horrdvpat',string(ll_idhorrdvpat))
//				ls_body = luo_corrfus.of_fusion(ls_body,'id_referent',string(ll_idreferent))
				
//				select id_personne2 into :ll_idpers 
//				from t_patients left outer join t_interrelation on t_patients.id_personne = t_interrelation.id_personne1
//				where responsable = 1 and id_patient = :ll_patid;
//				ls_body = luo_corrfus.of_fusion(ls_body,'id_personne',string(ll_idpers))
				
				// send the message
				
				lb_traiter = false
				
				if ll_c = 1 then
					if of_courriel(ls_body,ls_smtpserver,ll_logfile,ll_smtpauth,ls_smtpuserid,ls_smtppassword, ll_smtpport,ls_email,ls_nom,ls_courriel,ll_patid,ls_sujet) = 1 then
						lb_traiter = true
					end if
				end if
				if ll_s = 1 then
//					if luo_smtp.of_sendsms(ls_sms,ls_sujet,ls_body) = 1 then
//						lb_traiter = true
//					end if
				end if
													
				if lb_traiter then
					
					update t_horrdvpat set envoyercourriel = 1 where id_horrdvpat = :ll_idhorrdvpat;
					if gf_sqlerr() then
						commit using SQLCA;
					else
						rollback using SQLCA;
					end if
					dw_confrappelmail.setitem( j,"t_horrdvpat_envoyercourriel", 1)
					
					// Confirmer le rendez-vous si requis
					
//					setnull(ll_idhorconf)
//					select id_horconf into :ll_idhorconf from t_horconf where isnull(courriel,0) = 1;
//					if not isnull(ll_idhorconf) then
//						update t_horrdvpat set confirme = :ll_idhorconf where id_patient = :ll_patid and daterdv = :ldt_rdv;
//						if gf_sqlerr() then
//							commit using SQLCA;
//						else
//							rollback using SQLCA;
//						end if
//					end if
					
					// Écrire dans le message
					
					if gnv_app.of_getlangue( ) = 'an' then
						ls_note = 'Confirmation by email has sended by system'
					else
						ls_note = 'Confirmation par courriel envoyé par le système'
					end if
					
					insert into t_notes(note1,notedate,id_foreignkey,typenote)
					values(:ls_note,now(),:ll_patid,'t_patients');
					if gf_sqlerr() then
						commit using SQLCA;
					else
						rollback using SQLCA;
					end if
				
				end if
				
			end if
			sleep(ll_delai)
		end if

	end if

	hpb_sendcourriel.stepit( )
	
next

MessageBox("Information", "Courriel envoyé avec succès")


		*/
		

end subroutine

public subroutine of_confhoraire (long al_row);long ll_patid, ll_orthoid, ll_col
time lt_heurerdv
date ldt_daterdv
string ls_sql

ll_patid = dw_confrappelmail.getItemnumber(al_row,'t_rdv_patient_id')
lt_heurerdv = dw_confrappelmail.getItemTime(al_row,'t_rdv_rdvheure')
ldt_daterdv = dw_confrappelmail.getItemDate(al_row,'t_rdv_rdvdate')
ll_col = dw_confrappelmail.getItemnumber(al_row,'t_rdv_colonne')
ll_orthoid = dw_confrappelmail.getItemnumber(al_row,'t_rdv_ortho_id')

ls_sql = "update horaire set conf" + string(ll_col) + " = 1 &
			 where 	no_ortho = " + string(ll_orthoid) + " and &
			 			datecal  = '" + string(ldt_daterdv,"yyyy-mm-dd") + "' and &
						heure = '"  + string(lt_heurerdv,"hh:mm") + "' and &
						patient_id_" + string(ll_col) + " = " + string(ll_patid)

execute immediate :ls_sql using SQLCA;
				



end subroutine

public subroutine of_etiquette ();integer i, j
long ll_patid[], ll_c

datastore dw_etiq
dw_etiq = create datastore

gi_imp = 10
gb_datawindow = false
j = 1

dw_etiq.dataobject = 'd_etiquette_patient2'
dw_etiq.settransobject(SQLCA)

for i = 1 to dw_confrappelmail.rowcount( )
	
	ll_c = dw_confrappelmail.getItemNumber(i,'c')
	if isnull(ll_c) then ll_c = 0
	
	if ll_c = 1 then
		IF il_typecourriel = 2 then
			ll_patid[j] = dw_confrappelmail.getitemnumber(i,'t_rdv_patient_id')
		else
			ll_patid[j] = dw_confrappelmail.getitemnumber(i,'id_patient')
		end if
		j++
	end if
next

dw_etiq.retrieve(ll_patid)

openwithparm(w_print_options,dw_etiq)

end subroutine

public function string of_html (string as_msg, long al_idmessage, long al_iduser, long al_idpat);string ls_html = ""
string ls_logo
string ls_nomclinique
string ls_body
string ls_courriel
string ls_langue
string ls_text[]
string ls_popuser
long ll_ortho_id

 SELECT isnull(courriel,''),ortho_id
   INTO :ls_courriel, :ll_ortho_id
   FROM t_personnels
  WHERE id_personnel = :al_iduser;
  
 SELECT isnull(chemin_logo,''),popuser
   INTO :ls_logo,:ls_popuser 
   FROM t_options
  WHERE ortho_id = :ll_ortho_id;
  
  
SELECT langue INTO :ls_langue FROM patient WHERE patient_id = :al_idpat;
if ls_langue = 'F' then
	ls_text[1] = 'Confirmation rendez-vous'
	ls_text[2] = 'Confirmer votre présence'
else
	ls_text[1] = 'Confirmation appointment'
	ls_text[2] = 'Confirm your presence'
end if

// NE PAS UTILISER DE FEUILLE DE STYLE (*.css) ~ CAR N'EST PAS GÉRER PAR HOTMAIL & GMAIL
ls_html += '<!DOCTYPE html>'
ls_html += '<html>'
ls_html += '<head>'
ls_html += '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />'
ls_html += '</head>'

ls_html += '<style>body{font-family:Arial, Helvetica, sans-serif;font-style: inherit;font-variant: inherit;font-weight: inherit;font-size: inherit;line-height: inherit;font-size-adjust: inherit;font-stretch: inherit;vertical-align: baseline;font-size:14px;}</style></head>'
ls_html += '<body><center>'
ls_html += '<div style="background-color:white;width:540px;margin-left:auto;margin-right:auto;border:1px solid #CCCCCC;">'
if ls_logo <> '' then ls_html += '<br><center><img src="'+ls_logo+'" width="300px" height="60px" /></center>'
ls_html += '<table><tr><td style="background-color:white;padding:20px;color:#36393D;width:450px;">'
ls_html += '<h3><strong>'+ls_text[1]+'</strong></h3>'
ls_html += '<p>'+as_msg+'</p>'

ls_html += '<center><a style="border-radius:3px;box-shadow:inset 0 1px 0 #6db3e6,inset 1px 0 0 #48a1e2;color:white;font-size:15px;-moz-border-radius:3px;padding:14px 7px 14px 7px;max-width:210px;font-family:proxima_nova,~'Open Sans~', ~'lucida grande~', ~'Segoe UI~', arial, verdana, ~'lucida sans unicode~', tahoma, sans-serif;; border: 1px #1373b5 solid; text-align: center; -webkit-border-radius: 3px;text-decoration:none;width:210px;margin: 6px auto; display: block; background-color: #007ee6;" href="http://progitek.ca/confirmation/confirmation.php?destinataire='+ls_courriel+'&reponse=progitekoui&idmessage='+string(al_idmessage)+'&popuser='+ls_popuser+'">'+ls_text[2]+'</a></center>'
ls_html += '</td><td style="background-color:white;"></td></tr></table>'
ls_html += '</center></body>'
ls_html += '</html>'

return ls_html
end function

public function integer of_traitrequis ();long i,j,ll_c,ll_patid,ll_idcontact,ll_idcons,ll_cachechart
string ls_msg,ls_msgfr,ls_msgan,ls_sujet,ls_sujetfr,ls_sujetan
string ls_filename,ls_langue,ls_nom,ls_email[],ls_courriel,ls_persnom,ls_persprenom,ls_corrpath
string ls_1fr,ls_2fr,ls_3fr,ls_4fr,ls_5fr,ls_6fr,ls_7fr,ls_8fr,ls_9fr,ls_10fr
string ls_1en,ls_2en,ls_3en,ls_4en,ls_5en,ls_6en,ls_7en,ls_8en,ls_9en,ls_10en
string ls_nomortho, ls_raplangue
n_cst_fusion luo_fusion
n_signature luo_sign

// Validation 
select isnull(corrpath,''),traitreq1fr,traitreq2fr,traitreq3fr,traitreq4fr,traitreq5fr,traitreq6fr,traitreq7fr,traitreq8fr,traitreq9fr,traitreq10fr,traitreq1en,traitreq2en,traitreq3en,traitreq4en,traitreq5en,traitreq6en,traitreq7en,traitreq8en,traitreq9en,traitreq10en,cachechart
  into :ls_corrpath,:ls_1fr,:ls_2fr,:ls_3fr,:ls_4fr,:ls_5fr,:ls_6fr,:ls_7fr,:ls_8fr,:ls_9fr,:ls_10fr,:ls_1en,:ls_2en,:ls_3en,:ls_4en,:ls_5en,:ls_6en,:ls_7en,:ls_8en,:ls_9en,:ls_10en,:ll_cachechart
  from t_options
 where ortho_id = :v_no_ortho;

if not DirectoryExists(ls_corrpath) then 
	messagebox("Avertissement","Le chemin pour la correspondance est invalide ou inexistant !")
	return -1
end if

select isnull(courriel,''),isnull(nom,''),isnull(prenom,'') 
  into :ls_courriel,:ls_persnom,:ls_persprenom 
  from t_personnels 
  where id_personnel = :gl_idpers;

if ls_courriel = '' then
	Messagebox("Avertissement",ls_persnom + " " + ls_persprenom + " ne possède pas d'adresse courriel.")
	return -1
end if 

select dr_nom_complet into :ls_nomortho from ortho_id where ortho_id = :v_no_ortho;

//message
ls_msgfr   = tab_msg.tabpage_msgpred.mle_msgfr.text
ls_sujetfr = tab_msg.tabpage_msgpred.mle_sujetfr.text
ls_msgan   = tab_msg.tabpage_msgpred.mle_msgan.text
ls_sujetan = tab_msg.tabpage_msgpred.mle_sujetan.text

//datawindow
n_ds ds_datawindow
ds_datawindow = create n_ds
ds_datawindow.dataobject = 'd_traitreqimpver2'
ds_datawindow.setTransObject(SQLCA)

for i =1 to dw_confrappelmail.rowcount()
	
	ll_c = dw_confrappelmail.getItemNumber(i,'c')
	if ll_c = 1 then
		
		ll_idcons  = dw_confrappelmail.getitemnumber(i,'id_patient')
		ls_nom     = dw_confrappelmail.getItemString(i,'nompatient')
		ls_langue  = dw_confrappelmail.getItemString(i,'langue')
		
		if ls_langue = 'A' then
			ls_msg   = luo_fusion.of_fusion(ls_msgan,ll_idcontact,0,1900-01-01)
			ls_sujet = luo_fusion.of_fusion(ls_sujetan,ll_idcontact,0,1900-01-01)
		else
			ls_msg   = luo_fusion.of_fusion(ls_msgfr,ll_idcontact,0,1900-01-01)
			ls_sujet = luo_fusion.of_fusion(ls_sujetfr,ll_idcontact,0,1900-01-01)
		end if
		
		select isnull(det_email,''),patient_id
		  into :ls_email[1],:ll_patid
		  from t_dentists inner join t_consultations on t_dentists.id_dentist = t_consultations.id_dentist
		 where id = :ll_idcons;

		if ls_email[1] = '' then
			Messagebox("Avertissement",ls_nom + " ne possède pas d'adresse courriel.")
		else
			//créer pièce jointe
			if not  DirectoryExists(ls_corrpath + "\" + string(ll_patid)) then createdirectory(ls_corrpath + "\" + string(ll_patid))
			ls_filename = ls_corrpath + "\" + string(ll_patid) + "\traitrequis-" + string(today(),"dd-mm-yyyy") + string(ll_idcons) + ".pdf"

			// changer langue
			select det_langue into :ls_raplangue from t_dentists inner join t_consultations on t_dentists.id_dentist = t_consultations.id_dentist where t_consultations.id = :ll_idcons;
			if ls_raplangue = 'an' then
				ds_datawindow.modify("t_ortho.text = 'Orthodontist'")
				ds_datawindow.modify("t_title.text = 'TREATMENT REQUEST'")
				ds_datawindow.modify("t_cher.text = 'Dear:'")
				ds_datawindow.modify("t_tel.text = 'Tel.:'")
				ds_datawindow.modify("t_telbur.text = 'Tel.:'")
				ds_datawindow.modify("t_fax.text = 'Fax:'")
				ds_datawindow.modify("t_age1.text = 'Age:'")
				ds_datawindow.modify("t_nais.text = 'Date of birth:'")
				ds_datawindow.modify("t_radio.text = 'Please proceed with the following at the next appointment:'")
				ds_datawindow.modify("t_restauration.text = ': Restoration'")
				ds_datawindow.modify("exam.checkbox.text = 'Examination'")
				ds_datawindow.modify("prophy.checkbox.text = 'Fluororide application and prophylaxis'")
				ds_datawindow.modify("radio.checkbox.text = 'Please send the most recent x-rays to our office'")
				ds_datawindow.modify("hygiene.checkbox.text = 'The oral hygiene is inadequate. Please help us improve the oral hygiene'")
				ds_datawindow.modify("t_alapro.text = 'on next appointment'")
				ds_datawindow.modify("rest.checkbox.text = 'Restoration'")
				ds_datawindow.modify("extrait.checkbox.text = 'Please, extract:'")
				ds_datawindow.modify("autchir.checkbox.text = 'Other surgery'")
				ds_datawindow.modify("commpat.checkbox.text = 'Please contact the patient to schedule an appointment'")
				ds_datawindow.modify("commrab.checkbox.text = 'The patient will contact your office'")
				ds_datawindow.modify("retradio.checkbox.text = 'Please return the x-rays at the end of the treatment'")
				ds_datawindow.modify("t_consultations_panremispatient.checkbox.text = 'Copy of the panoramic delivered to your patient'")
				ds_datawindow.modify("t_consultations_copietransparcourriel.checkbox.text = 'Copy of the panaramic delivered to you by email'")
				ds_datawindow.modify("t_droite.text = 'Right'")
				ds_datawindow.modify("t_droite1.text = 'Right'")
				ds_datawindow.modify("t_gauche.text = 'Left'")
				ds_datawindow.modify("t_gauche1.text = 'Left'")
				ds_datawindow.modify("t_remarque.text = 'Commentary :'")
				ds_datawindow.modify("t_merci.visible = false")
				ds_datawindow.modify("t_thanks.visible = true")
				ds_datawindow.modify("t_footer1.text = 'N.B.: All patients are required to continue visiting their dentist during'")
				ds_datawindow.modify("t_footer2.text = 'orthodontic treatment. Please, continue recalling the patient as usual.'")
				ds_datawindow.modify("t_footer3.text = ''")
				ds_datawindow.modify("t_titreortho.visible = false")
				ds_datawindow.modify("t_nomortho.text = ~"" + ls_nomortho + "~"") 
				if ls_nomortho = 'Dr. SIDNEY KONIGSBERG' then
					ds_datawindow.modify("t_titreortho.visible = true")
					ds_datawindow.modify("t_nomortho.visible = true")
					ds_datawindow.modify("l_8.visible = true")
					ds_datawindow.modify("p_sign.visible = true")	
				elseif ls_nomortho = 'Dr Nathalie Beaulne' then
					ds_datawindow.object.t_secortho.visible = true
					ds_datawindow.object.l_9.visible = true
				else
					ds_datawindow.modify("t_titreortho.text = ''")
				end if
				if not isnull(ls_1en) then
					if ls_1en = 'HIDE' or ls_1en = 'CACHER' then
						ds_datawindow.modify("exam.visible = false")
					else
						ds_datawindow.modify("exam.checkbox.text = '" + ls_1en + "'")
					end if
				end if
				if not isnull(ls_2en) then
					if ls_2en = 'HIDE' or ls_2en = 'CACHER' then
						ds_datawindow.modify("prophy.visible = false")
					else
						ds_datawindow.modify("prophy.checkbox.text = '" + ls_2en + "'")
					end if
				end if
				if not isnull(ls_3en) then
					if ls_3en = 'HIDE' or ls_3en = 'CACHER' then
						ds_datawindow.modify("radio.visible = false")
					else
						ds_datawindow.modify("radio.checkbox.text = '" + ls_3en + "'")
					end if
				end if
				if not isnull(ls_4en) then
					if ls_4en = 'HIDE' or ls_4en = 'CACHER' then
						ds_datawindow.modify("hygiene.visible = false")
					else
						ls_4en = gnv_app.inv_string.of_globalreplace(ls_4en, "'", "`")
						ds_datawindow.modify("hygiene.checkbox.text = '" + ls_4en + "'")
					end if
					ds_datawindow.modify("t_alapro.text = ''")
				end if
				if not isnull(ls_5en) then
					if ls_5en = 'HIDE' or ls_5en = 'CACHER' then
						ds_datawindow.modify("rest.visible = false")
					else
						ds_datawindow.modify("rest.checkbox.text = '" + ls_5en + "'")
					end if
				end if
				if not isnull(ls_6en) then
					if ls_6en = 'HIDE' or ls_6en = 'CACHER' then
						ds_datawindow.modify("extrait.visible = false")
					else
						ds_datawindow.modify("extrait.checkbox.text = '" + ls_6en + "'")
					end if
				end if
				if not isnull(ls_7en) then
					if ls_7en = 'HIDE' or ls_7en = 'CACHER' then
						ds_datawindow.modify("autchir.visible = false")
					else
						ds_datawindow.modify("autchir.checkbox.text = '" + ls_7en + "'")
					end if
				end if
				if not isnull(ls_8en) then
					if ls_8en = 'HIDE' or ls_8en = 'CACHER' then
						ds_datawindow.modify("commpat.visible = false")
					else
						ds_datawindow.modify("commpat.checkbox.text = '" + ls_8en + "'")
					end if
				end if
				if not isnull(ls_9en) then
					if ls_9en = 'HIDE' or ls_9en = 'CACHER' then
						ds_datawindow.modify("commrab.visible = false")
					else
						ds_datawindow.modify("commrab.checkbox.text = '" + ls_9en + "'")
					end if
				end if
				if not isnull(ls_10en) then
					if ls_10en = 'HIDE' or ls_10en = 'CACHER' then
						ds_datawindow.modify("retradio.visible = false")
					else
						ds_datawindow.modify("retradio.checkbox.text = '" + ls_10en + "'")
					end if
				end if
			else
				ds_datawindow.modify("t_nomortho.text = ~"" + ls_nomortho + "~"")
				if not isnull(ls_1fr) then
					if ls_1fr = 'HIDE' or ls_1fr = 'CACHER' then
						ds_datawindow.modify("exam.visible = false")
					else
						ds_datawindow.modify("exam.checkbox.text = '" + ls_1fr + "'")
					end if
				end if
				if not isnull(ls_2fr) then
					if ls_2fr = 'HIDE' or ls_2fr = 'CACHER' then
						ds_datawindow.modify("prophy.visible = false")
					else
						ds_datawindow.modify("prophy.checkbox.text = '" + ls_2fr + "'")
					end if
				end if
				if not isnull(ls_3fr) then
					if ls_3fr = 'HIDE' or ls_3fr = 'CACHER' then
						ds_datawindow.modify("radio.visible = false")
					else
						ds_datawindow.modify("radio.checkbox.text = '" + ls_3fr + "'")
					end if
				end if
				if not isnull(ls_4fr) then
					if ls_4fr = 'HIDE' or ls_4fr = 'CACHER' then
						ds_datawindow.modify("hygiene.visible = false")
					else
						ls_4fr = gnv_app.inv_string.of_globalreplace(ls_4fr, "'", "`")
						ds_datawindow.modify("hygiene.checkbox.text = '" + ls_4fr + "'")
					end if
					ds_datawindow.modify("t_alapro.text = ''")
				end if
				if not isnull(ls_5fr) then
					if ls_5fr = 'HIDE' or ls_5fr = 'CACHER' then
						ds_datawindow.modify("rest.visible = false")
					else
						ds_datawindow.modify("rest.checkbox.text = '" + ls_5fr + "'")
					end if
				end if
				if not isnull(ls_6fr) then
					if ls_6fr = 'HIDE' or ls_6fr = 'CACHER' then
						ds_datawindow.modify("extrait.visible = false")
					else
						ds_datawindow.modify("extrait.checkbox.text = '" + ls_6fr + "'")
					end if
				end if
				if not isnull(ls_7fr) then
					if ls_7fr = 'HIDE' or ls_7fr = 'CACHER' then
						ds_datawindow.modify("autchir.visible = false")
					else
						ds_datawindow.modify("autchir.checkbox.text = '" + ls_7fr + "'")
					end if
				end if
				if not isnull(ls_8fr) then
					if ls_8fr = 'HIDE' or ls_8fr = 'CACHER' then
						ds_datawindow.modify("commpat.visible = false")
					else
						ds_datawindow.modify("commpat.checkbox.text = '" + ls_8fr + "'")
					end if
				end if
				if not isnull(ls_9fr) then
					if ls_9fr = 'HIDE' or ls_9fr = 'CACHER' then
						ds_datawindow.modify("commrab.visible = false")
					else
						ds_datawindow.modify("commrab.checkbox.text = '" + ls_9fr + "'")
					end if
				end if
				if not isnull(ls_10fr) then
					if ls_10fr = 'HIDE' or ls_10fr = 'CACHER' then
						ds_datawindow.modify("retradio.visible = false")
					else
						ls_10fr = gnv_app.inv_string.of_globalreplace(ls_10fr, "'", "`")
						ds_datawindow.modify("retradio.checkbox.text = '" + ls_10fr + "'")
					end if
				end if
			end if		

			if ds_datawindow.retrieve(ll_idcons) > 0 then 
				// Afficher la signature
				luo_sign.of_affichesign(ds_datawindow, 1, ll_idcons)
				
				if ds_datawindow.saveas(ls_filename,PDF!,False) = 1 then
					if FileExists(ls_filename) then
						for j = 1 to upperbound(ls_email)
							if isnull(ls_email[j]) then ls_email[j] = ''
							if ls_email[j] <> '' then
								if match(ls_email[j],'^[a-zA-Z0-9][a-zA-Z\0-9\-_\.]*[^.]\@[^.][a-zA-Z\0-9\-_\.]+\.[a-zA-Z\0-9\-_\.]*[a-zA-Z\0-9]+$') then
									gnv_app.inv_entrepotglobal.of_ajoutedonnee("idforeignkey","T"+string(ll_idcons))
									of_courriel(ls_msg,ls_email[j],ls_nom,ls_courriel,ll_patid,ls_sujet, 0, 0, ls_filename)
									dw_confrappelmail.setItem(i,'envoicourriel',1)
								end if
							end if
						next
					end if
				end if		
			end if
		end if 
	end if
next

return 0
end function

public subroutine of_pdf ();// CRéer PDF

end subroutine

protected function integer of_courriel (string as_message, string as_emailto, string as_nomto, string as_emailfrom, long al_patid, string as_sujet, integer ai_sms, long al_idrdv, string as_attchment);string ls_commandline, ls_nomemail, ls_nomordi, ls_foreignkey, ls_computername, ls_message, ls_nomreel,ls_idforeignkey, ls_popuser
long ll_idmessage, ll_iduser, ll_confirmenvoi,ll_confirmation

select isnull(cie,dr_nom_complet),popuser into :ls_nomemail , :ls_popuser
from ortho_id 
where ortho_id = :v_no_ortho;

ls_nomordi = gnv_app.of_obtenir_nom_ordinateur( )

// On créee le message dans la base de donnees
ls_idforeignkey = gnv_app.inv_entrepotglobal.of_retournedonnee("idforeignkey")
if not isnull(ls_idforeignkey) or ls_idforeignkey <> '' then
	ls_foreignkey = ls_idforeignkey
else
	if al_idrdv > 0 then
		ls_foreignkey = 'R' + string(al_idrdv)
	else
		ls_foreignkey = 'P' + + string(al_patid)
	end if
end if

if isnull(al_patid) or al_patid = 0 then
	select isnull(patient_prenom,'') || ' ' || isnull(patient_nom,'') into :ls_nomreel
	from patient
	where patient_id = :al_patid;
else
	ls_nomreel = 'Inconnu'
end if

ls_computername = gnv_app.of_obtenir_nom_ordinateur( )

select confirmenvoi into :ll_confirmenvoi from t_options where ortho_id = :v_no_ortho;
if ll_confirmenvoi = 1 and ai_sms = 0 then as_emailto = as_emailfrom + ";" + as_emailto
				
insert into t_message(dateenvoye, priorite, message_de, message_a, sujet, message_texte, fichier_attache, source, statut,
                      statut_lu, statut_affiche, typemessagerie, couleur, email, envoyer, sms, nomemail, id_user,idforeignkey,nomordinateur)
values(now(), 0, :as_emailfrom, :as_emailto, :as_sujet, :as_message, :as_attchment, 'e', 'a', 'o','o', 'U', 15780518, 1, 0, :ai_sms, :ls_nomemail, :gl_idpers,:ls_foreignkey, :ls_nomordi);
if gf_sqlerr() then
	commit using SQLCA;
	select max(id_message) into :ll_idmessage from t_message;
	select isnull(patcourriel,0) into :ll_confirmation from patient where patient_id = :al_patid;
	if ai_sms = 0 and il_typecourriel = 2 and tab_msg.tabpage_msgpred.cbx_confcourriel.checked and ll_confirmation = 0 then 
		ls_message = of_html(as_message,ll_idmessage,ll_iduser,al_patid)
		update t_message set message_texte = :ls_message where id_message = :ll_idmessage;
	end if
	if ai_sms = 1 then
		ls_message = rep(as_message,"%lien_confirmation%","http://progitek.ca/confirmation/confirmation.php?idmessage="+string(ll_idmessage)+"&popuser="+ls_popuser)
		update t_message set message_texte = :ls_message where id_message = :ll_idmessage;
	end if
else
	rollback using SQLCA;
end if

return 1

//long ll_iduser
//string ls_nomdoc, ls_clinique, ls_message, ls_recipient, ls_smtpsender
//integer li_rc, li_FileNum
//OLEObject pbsmtpmail
//
//pbsmtpmail = create OLEObject
//
//li_rc = pbsmtpmail.ConnectToNewObject("PbSmtpClient.PbMail")
//IF li_rc < 0 THEN
//
//    DESTROY pbsmtpmail
//    MessageBox("Connecting to COM Object Failed","Error: " + String(li_rc))
//	 Return -6
//
//END IF
//
//// Aller chercher les informations dans les options
//
//ll_iduser = long(gnv_app.of_getuserid( ))
//
//select isnull(dr_nom_complet,'') into :ls_nomdoc from ortho_id inner join patient on patient.no_ortho = ortho_id.ortho_id where patient_id = :al_patid;
//
////select nom || ', ' || prenom into :ls_smtpsender from t_users where id_user = :ll_iduser;
//pbsmtpmail.SenderName = as_emailfrom
//pbsmtpmail.SenderEmail = as_emailfrom
//
//if al_smtpauth = 1 then
//	pbsmtpmail.SmtpAuth = true
//	pbsmtpmail.SmtpUser = as_smtpuserid
//	pbsmtpmail.SmtpPassword = as_smtppassword
//end if
//
//pbsmtpmail.SmtpServer = as_smtpserver
//pbsmtpmail.SmtpPort = al_smtpport
//pbsmtpmail.subject = as_sujet
//if tab_msg.selectedtab = 2 then
//	li_FileNum = FileOpen("c:\ii4net\dentitek\html\" + tab_msg.tabpage_msghtml.lb_filehtml.selecteditem( ),TextMode!)
//   FileReadEx(li_FileNum, ls_message)
//	FileClose(li_FileNum)
//else
//	ls_message = "<html><head></head><body><PRE>" + as_message + "</PRE></body></html>"
//end if
//pbsmtpmail.messageText = ls_message
//pbsmtpmail.IsHTML = true
//if cbx_conf.checked then
//	pbsmtpmail.smtpConf = true
//end if
//pbsmtpmail.ajoutRecipient(as_emailto)
//// pbsmtpmail.ajoutAttachement(st_filename.text)
//
//// send the message
//li_rc = pbsmtpmail.sendMail()
//If li_rc <> 1 Then
//	DESTROY pbsmtpmail
//	return 0
//end if
//
//DESTROY pbsmtpmail
//return 1
//
end function

on w_confrappelmail.create
int iCurrent
call super::create
this.cbx_smsauto=create cbx_smsauto
this.cbx_1=create cbx_1
this.cbx_email3=create cbx_email3
this.cbx_email2=create cbx_email2
this.uo_toolbar=create uo_toolbar
this.rr_3=create rr_3
this.st_4=create st_4
this.st_3=create st_3
this.hpb_sendcourriel=create hpb_sendcourriel
this.st_title=create st_title
this.dw_confrappelmail=create dw_confrappelmail
this.rr_1=create rr_1
this.rr_2=create rr_2
this.cbx_email1=create cbx_email1
this.cbx_sms=create cbx_sms
this.tab_msg=create tab_msg
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_smsauto
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.cbx_email3
this.Control[iCurrent+4]=this.cbx_email2
this.Control[iCurrent+5]=this.uo_toolbar
this.Control[iCurrent+6]=this.rr_3
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.hpb_sendcourriel
this.Control[iCurrent+10]=this.st_title
this.Control[iCurrent+11]=this.dw_confrappelmail
this.Control[iCurrent+12]=this.rr_1
this.Control[iCurrent+13]=this.rr_2
this.Control[iCurrent+14]=this.cbx_email1
this.Control[iCurrent+15]=this.cbx_sms
this.Control[iCurrent+16]=this.tab_msg
end on

on w_confrappelmail.destroy
call super::destroy
destroy(this.cbx_smsauto)
destroy(this.cbx_1)
destroy(this.cbx_email3)
destroy(this.cbx_email2)
destroy(this.uo_toolbar)
destroy(this.rr_3)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.hpb_sendcourriel)
destroy(this.st_title)
destroy(this.dw_confrappelmail)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.cbx_email1)
destroy(this.cbx_sms)
destroy(this.tab_msg)
end on

event open;call super::open;//date ldt_date_debut, ldt_date_fin
//long ll_idspec,ll_idraptrait,ll_avrdv,ll_actif
//string ls_compte[]
long ll_patid[], ll_idhorrdvpat, i, ll_nodos, ll_row, ll_typecourriel, ll_idref, ll_idspec, ll_horidspec
string ls_nompat, ls_langue, ls_courriel, ls_cell, ls_nomdet
date ldt_datenais, ldt_daterdv
integer li_liste_trait_par_spec

ll_patid = gnv_app.inv_entrepotglobal.of_retournedonnee("Liste_patient_courriel")
il_typecourriel = gnv_app.inv_entrepotglobal.of_retournedonnee("type_courriel")


dw_confrappelmail.setRedraw(false)

if il_typecourriel = 2 then
	
	idt_date = gnv_app.inv_entrepotglobal.of_retournedonnee("date_courriel")
	ll_idspec = gnv_app.inv_entrepotglobal.of_retournedonnee("specialiste_courriel")
	
	select horshareid,liste_trait_par_spec 
	into :ll_horidspec,:li_liste_trait_par_spec 
	from t_options where ortho_id = :v_no_ortho;
	
	if li_liste_trait_par_spec = 1 then
		ll_idspec = v_no_ortho
	else
		ll_idspec = ll_horidspec
	end if

	dw_confrappelmail.dataobject = 'd_confemail'
	dw_confrappelmail.setTransObject(SQLCA)
	dw_confrappelmail.retrieve(idt_date,ll_horidspec, ll_idspec)
	
	
else
	if isValid(w_listtraitementnonsigne) then
		for i = 1 to upperbound(ll_patid)	
			
			select isnull(det_nom,'') || ' ' || isnull(det_prenom,''),isnull(det_langue,'fr'),isnull(det_email,''),patient_nom || ' ' || patient_prenom
			into :ls_nomdet,:ls_langue,:ls_courriel,:ls_nompat
			from t_consultations 
				inner join patient on patient.patient_id = t_consultations.patient_id
				left outer join t_dentists on t_dentists.id_dentist = t_consultations.id_dentist
			where id = :ll_patid[i];
			
			ll_row = dw_confrappelmail.insertRow(0)
			dw_confrappelmail.setitem(ll_row,'id_patient',ll_patid[i])
			dw_confrappelmail.setitem(ll_row,'nompatient',ls_nompat)
			dw_confrappelmail.setitem(ll_row,'langue',ls_langue)
			dw_confrappelmail.object.t_2.text = 'Spécialiste'
			dw_confrappelmail.object.t_4.visible = FALSE
			dw_confrappelmail.object.s.visible = FALSE
			tab_msg.tabpage_msgpred.cbx_confcourriel.visible = FALSE
			cbx_email2.visible = FALSE
			cbx_email3.visible = FALSE
			cbx_sms.visible = FALSE
			cbx_1.visible = FALSE
			dw_confrappelmail.modify("cellulaire.EditMask.Mask = ''")
			dw_confrappelmail.setitem(ll_row,'cellulaire',ls_nomdet)
			dw_confrappelmail.setitem(ll_row,'courriel',ls_courriel)
			dw_confrappelmail.setitem(ll_row,'envoicourriel',0)
		next
		dw_confrappelmail.setSort("nompatient A")
		dw_confrappelmail.sort()
	else
		for i = 1 to upperbound(ll_patid)	
			select patient_nom || ' ' || patient_prenom, langue, no_dossier, email, telcell, date_naissance
			into :ls_nompat, :ls_langue, :ll_nodos, :ls_courriel, :ls_cell, :ldt_datenais
			from patient where patient_id = :ll_patid[i];
			
			ll_row = dw_confrappelmail.insertRow(0)
			dw_confrappelmail.setitem(ll_row,'id_patient',ll_patid[i])
			dw_confrappelmail.setitem(ll_row,'nompatient',ls_nompat)
			dw_confrappelmail.setitem(ll_row,'langue',ls_langue)
			dw_confrappelmail.setitem(ll_row,'courriel',ls_courriel)
			dw_confrappelmail.setitem(ll_row,'nodos',ll_nodos)
			dw_confrappelmail.setitem(ll_row,'cellulaire',ls_cell)
			dw_confrappelmail.setitem(ll_row,'datenais',ldt_datenais)
			dw_confrappelmail.setitem(ll_row,'id_referent',0)
			dw_confrappelmail.setitem(ll_row,'envoicourriel',0)
		next
		dw_confrappelmail.setSort("nompatient A")
		dw_confrappelmail.sort()
	end if
end if	
dw_confrappelmail.setRedraw(true)

tab_msg.tabpage_msgpred.ddlb_listmsg.event ue_filllist()
tab_msg.tabpage_msghtml.lb_filehtml.dirlist("c:\ii4net\dentitek\html\*.html",0)

//ldt_date_debut = gnv_app.inv_entrepotglobal.of_retournedonnee("Confrappel_datedebut")
//ldt_date_fin = gnv_app.inv_entrepotglobal.of_retournedonnee("Confrappel_datefin")
//ll_idspec = gnv_app.inv_entrepotglobal.of_retournedonnee("Confrappel_idspec")
//ll_idraptrait = gnv_app.inv_entrepotglobal.of_retournedonnee("Confrappel_idraptrait")
//ll_avrdv = gnv_app.inv_entrepotglobal.of_retournedonnee("Confrappel_avrdv")
//ls_compte = gnv_app.inv_entrepotglobal.of_retournedonnee("Confrappel_compte")
//ll_actif = gnv_app.inv_entrepotglobal.of_retournedonnee("Confrappel_actif")
//dw_confrappelmail.retrieve(ldt_date_debut,ldt_date_fin,ll_idspec,ll_idraptrait,ll_avrdv,ls_compte,ll_actif)
//dw_confrappelmail.selectRow(0,true)
end event

type cbx_smsauto from checkbox within w_confrappelmail
integer x = 1385
integer y = 132
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 16711680
long backcolor = 15780518
string text = "SMS autorisé"
end type

event clicked;long i, ll_sms

for i = 1 to dw_confrappelmail.rowcount()
	if il_typecourriel = 2 then
		ll_sms = dw_confrappelmail.getItemNumber(i,'patient_confirmsms')
	else
		//ll_sms = dw_confrappelmail.getItemNumber(i,'patient_confirmsms')
	end if
	if ll_sms > 0 then	
		if this.checked then
			dw_confrappelmail.setItem(i,'s',1)
		else
			dw_confrappelmail.setItem(i,'s',0)
		end if
	end if
next

end event

type cbx_1 from checkbox within w_confrappelmail
integer x = 1765
integer y = 132
integer width = 347
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Sans courriel"
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_confrappelmail.rowcount()
	if il_typecourriel = 2 then
		ls_courriel = dw_confrappelmail.getItemString(i,'patient_email')
	else
		ls_courriel = dw_confrappelmail.getItemString(i,'courriel')
	end if
	if isnull(ls_courriel) then ls_courriel = ""
	if len(ls_courriel) >= 0 then
		if not match(ls_courriel,'@') then
			if this.checked then
				dw_confrappelmail.setItem(i,'c',1)
			else
				dw_confrappelmail.setItem(i,'c',0)
			end if
		end if
	end if
next

end event

type cbx_email3 from checkbox within w_confrappelmail
integer x = 800
integer y = 132
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Courriel #3"
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_confrappelmail.rowcount()
	if il_typecourriel = 2 then
		ls_courriel = dw_confrappelmail.getItemString(i,'patient_email2')
	else
		ls_courriel = dw_confrappelmail.getItemString(i,'courriel')
	end if
	if len(ls_courriel) > 0 then
		if match(ls_courriel,'@') then
			if this.checked then
				dw_confrappelmail.setItem(i,'c',1)
			else
				dw_confrappelmail.setItem(i,'c',0)
			end if
		end if
	end if
next

end event

type cbx_email2 from checkbox within w_confrappelmail
integer x = 416
integer y = 132
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Courriel #2"
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_confrappelmail.rowcount()
	if il_typecourriel = 2 then
		ls_courriel = dw_confrappelmail.getItemString(i,'patient_email2')
	else
		ls_courriel = dw_confrappelmail.getItemString(i,'courriel')
	end if
	if len(ls_courriel) > 0 then
		if match(ls_courriel,'@') then
			if this.checked then
				dw_confrappelmail.setItem(i,'c',1)
			else
				dw_confrappelmail.setItem(i,'c',0)
			end if
		end if
	end if
next

end event

type uo_toolbar from u_cst_toolbarstrip within w_confrappelmail
event destroy ( )
integer x = 14
integer y = 2052
integer width = 4608
integer taborder = 40
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;boolean lb_sms = false
long i, ll_s

CHOOSE CASE as_button
	CASE "Print","Imprimer"
		of_print()
	CASE "Send","Envoyer"
		if isValid(w_listtraitementnonsigne) then
			of_traitrequis()
		else
			// Verrifier si l'envoi est possible
			for i = 1 to dw_confrappelmail.rowcount()
				ll_s = dw_confrappelmail.getItemNumber(i,'s')
				if ll_s = 1 then lb_sms = true
			next
			if tab_msg.selectedtab = 2 and lb_sms then
				if gnv_app.of_getlangue() = 'an' then
					messagebox("Avertissement","An HTML file cannot be send by SMS", Information!, OK!)	
				else
					messagebox("Avertissement","Un fichier HTML ne peut-être envoyé par SMS", Information!, OK!)	
				end if
				return
			end if
			
			// Envoyer un courriel
			if il_typecourriel = 2 then
				of_sendrdv()
			else
				of_send()
			end if
		end if
	CASE 	"Étiquette","Label"
		of_etiquette()
	CASE "Change message","Changer le message"
		of_changermsg()
	CASE "Close","Fermer"
		of_fermer()
END CHOOSE



end event

type rr_3 from roundrectangle within w_confrappelmail
integer linethickness = 4
long fillcolor = 12639424
integer x = 2222
integer y = 116
integer width = 2400
integer height = 1840
integer cornerheight = 40
integer cornerwidth = 46
end type

type st_4 from statictext within w_confrappelmail
boolean visible = false
integer x = 2565
integer y = 128
integer width = 1065
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_confrappelmail
boolean visible = false
integer x = 2272
integer y = 128
integer width = 306
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 12639424
string text = "Expéditeur: "
boolean focusrectangle = false
end type

type hpb_sendcourriel from hprogressbar within w_confrappelmail
integer x = 9
integer y = 1972
integer width = 4608
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
end type

type st_title from st_uo_transparent within w_confrappelmail
integer x = 37
integer y = 16
integer width = 1445
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 12639424
string text = "Envoi de courriels massives"
end type

type dw_confrappelmail from u_dw within w_confrappelmail
integer x = 23
integer y = 228
integer width = 2167
integer height = 1720
integer taborder = 10
string dataobject = "d_listcourrierenvoyer"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
string is_objet_rbutton = "0"
end type

event rbuttondown;call super::rbuttondown;//string ls_valeur
//n_corrfusion luo_corrfus
//
//ls_valeur = luo_corrfus.of_fusion("%nom_patient%", "3322")
//messagebox("dff",ls_valeur)
end event

type rr_1 from roundrectangle within w_confrappelmail
integer linethickness = 4
long fillcolor = 12639424
integer y = 8
integer width = 4626
integer height = 92
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_confrappelmail
integer linethickness = 4
long fillcolor = 16777215
integer x = 14
integer y = 208
integer width = 2190
integer height = 1756
integer cornerheight = 40
integer cornerwidth = 46
end type

type cbx_email1 from checkbox within w_confrappelmail
integer x = 32
integer y = 132
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Courriel #1"
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_confrappelmail.rowcount()
	if il_typecourriel = 2 then
		ls_courriel = dw_confrappelmail.getItemString(i,'patient_email')
	else
		ls_courriel = dw_confrappelmail.getItemString(i,'courriel')
	end if
	if len(ls_courriel) > 0 then
		if match(ls_courriel,'@') then
			if this.checked then
				dw_confrappelmail.setItem(i,'c',1)
			else
				dw_confrappelmail.setItem(i,'c',0)
			end if
		end if
	end if
next

end event

type cbx_sms from checkbox within w_confrappelmail
integer x = 1184
integer y = 132
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 16711680
long backcolor = 15780518
string text = "SMS"
end type

event clicked;long i
string ls_cell

for i = 1 to dw_confrappelmail.rowcount()
	if il_typecourriel = 2 then
		ls_cell = dw_confrappelmail.getItemString(i,'patient_telcell')
	else
		ls_cell = dw_confrappelmail.getItemString(i,'cellulaire')
	end if
	if len(ls_cell) > 0 then
	if this.checked then
			dw_confrappelmail.setItem(i,'s',1)
		else
			dw_confrappelmail.setItem(i,'s',0)
		end if
	end if
next

end event

type tab_msg from tab within w_confrappelmail
integer x = 2231
integer y = 204
integer width = 2377
integer height = 1740
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_msgpred tabpage_msgpred
tabpage_msghtml tabpage_msghtml
end type

on tab_msg.create
this.tabpage_msgpred=create tabpage_msgpred
this.tabpage_msghtml=create tabpage_msghtml
this.Control[]={this.tabpage_msgpred,&
this.tabpage_msghtml}
end on

on tab_msg.destroy
destroy(this.tabpage_msgpred)
destroy(this.tabpage_msghtml)
end on

type tabpage_msgpred from userobject within tab_msg
integer x = 18
integer y = 100
integer width = 2341
integer height = 1624
long backcolor = 15780518
string text = "Message prédéfini"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
cbx_confcourriel cbx_confcourriel
ddlb_listmsg ddlb_listmsg
mle_msgan mle_msgan
mle_msgfr mle_msgfr
mle_sujetfr mle_sujetfr
mle_sujetan mle_sujetan
st_6 st_6
st_5 st_5
end type

on tabpage_msgpred.create
this.cbx_confcourriel=create cbx_confcourriel
this.ddlb_listmsg=create ddlb_listmsg
this.mle_msgan=create mle_msgan
this.mle_msgfr=create mle_msgfr
this.mle_sujetfr=create mle_sujetfr
this.mle_sujetan=create mle_sujetan
this.st_6=create st_6
this.st_5=create st_5
this.Control[]={this.cbx_confcourriel,&
this.ddlb_listmsg,&
this.mle_msgan,&
this.mle_msgfr,&
this.mle_sujetfr,&
this.mle_sujetan,&
this.st_6,&
this.st_5}
end on

on tabpage_msgpred.destroy
destroy(this.cbx_confcourriel)
destroy(this.ddlb_listmsg)
destroy(this.mle_msgan)
destroy(this.mle_msgfr)
destroy(this.mle_sujetfr)
destroy(this.mle_sujetan)
destroy(this.st_6)
destroy(this.st_5)
end on

type cbx_confcourriel from checkbox within tabpage_msgpred
integer x = 1687
integer y = 32
integer width = 635
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Confirmation par courriel  "
boolean checked = true
boolean lefttext = true
end type

type ddlb_listmsg from u_ddlb within tabpage_msgpred
event ue_filllist ( )
integer x = 718
integer y = 28
integer width = 942
integer height = 400
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean sorted = false
end type

event ue_filllist();string ls_msgfr, ls_sujetfr, ls_msgan, ls_sujetan
long ll_idmsgcourriel, ll_typemsg, ll_index = 0, ll_orthoid,ll_confmail

DECLARE listcourriel CURSOR FOR 

	select 	isnull(titrecourriel,'Msg'),
				id_messagecourriel,
				typemessage,
				ortho_id
	from		t_messagecourriel
	where		t_messagecourriel.ortho_id = :v_no_ortho;
	
OPEN listcourriel;

FETCH listcourriel INTO :ls_msgfr, :ll_idmsgcourriel, :ll_typemsg, :ll_orthoid;

DO WHILE SQLCA.SQLcode = 0 
	
	of_addItem(ls_msgfr,ll_idmsgcourriel)
	if ll_typemsg = il_typecourriel and ll_orthoid = v_no_ortho then
		ll_index = ll_idmsgcourriel
	end if
	
	FETCH listcourriel INTO :ls_msgfr, :ll_idmsgcourriel, :ll_typemsg, :ll_orthoid;
	
LOOP

CLOSE listcourriel;

if ll_index = 0 then
	of_selectItem(0)
	
	ls_sujetfr = 'Pas de message'
	ls_msgfr = 'Pas de message'
	ls_sujetan = 'Pas de message'
	ls_msgan = 'Pas de message'
	
else
	of_selectItem(ll_index,0,false)
	
	ll_idmsgcourriel = of_getselecteddata()

	select 	isnull(messagecourriel,'Pas de message'),
				isnull(sujetcourriel,'Pas de sujet'),
				isnull(messagecourrielan,'Pas de message'),
				isnull(sujetcourrielan,'Pas de sujet'),
				isnull(confirmation,0)
	into     :ls_msgfr, :ls_sujetfr, :ls_msgan, :ls_sujetan,:ll_confmail
	from		t_messagecourriel
	where		t_messagecourriel.id_messagecourriel = :ll_idmsgcourriel;
	
end if

mle_sujetfr.text = ls_sujetfr
mle_msgfr.text = ls_msgfr
mle_sujetan.text = ls_sujetan
mle_msgan.text = ls_msgan

if ll_confmail = 1 then 
	tab_msg.tabpage_msgpred.cbx_confcourriel.checked = true
else
	tab_msg.tabpage_msgpred.cbx_confcourriel.checked = false
end if


end event

event selectionchanged;call super::selectionchanged;long ll_idmsgcourriel, ll_confmail
string ls_msgfr, ls_sujetfr, ls_msgan, ls_sujetan

ll_idmsgcourriel = of_getSelectedData()

select 	isnull(messagecourriel,'Pas de message'),
			isnull(sujetcourriel,'Pas de sujet'),
			isnull(messagecourrielan,'Pas de message'),
			isnull(sujetcourrielan,'Pas de sujet'),
			isnull(confirmation,0)
into     :ls_msgfr, :ls_sujetfr, :ls_msgan, :ls_sujetan,:ll_confmail
from		t_messagecourriel
where		t_messagecourriel.id_messagecourriel = :ll_idmsgcourriel;


tab_msg.tabpage_msgpred.mle_sujetfr.text = ls_sujetfr
tab_msg.tabpage_msgpred.mle_msgfr.text = ls_msgfr
tab_msg.tabpage_msgpred.mle_sujetan.text = ls_sujetan
tab_msg.tabpage_msgpred.mle_msgan.text = ls_msgan

if ll_confmail = 1 then 
	tab_msg.tabpage_msgpred.cbx_confcourriel.checked = true	
else
	tab_msg.tabpage_msgpred.cbx_confcourriel.checked = false	
end if

end event

type mle_msgan from multilineedit within tabpage_msgpred
integer x = 14
integer y = 1076
integer width = 2313
integer height = 540
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_champfusion, ls_col
integer li_pos

li_pos = position()
m_insertinfo my_menu
my_menu = create m_insertinfo
m_insertinfo.uf_translate()
m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
selecttext(li_pos,0)
paste() 
destroy my_menu

end event

type mle_msgfr from multilineedit within tabpage_msgpred
integer x = 9
integer y = 312
integer width = 2313
integer height = 540
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_champfusion, ls_col
integer li_pos

li_pos = position()
m_insertinfo my_menu
my_menu = create m_insertinfo
m_insertinfo.uf_translate()
m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
selecttext(li_pos,0)
paste() 
destroy my_menu

end event

type mle_sujetfr from multilineedit within tabpage_msgpred
integer x = 9
integer y = 148
integer width = 2313
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_champfusion, ls_col
integer li_pos

li_pos = position()
m_insertinfo my_menu
my_menu = create m_insertinfo
m_insertinfo.uf_translate()
m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
selecttext(li_pos,0)
paste() 
destroy my_menu


end event

type mle_sujetan from multilineedit within tabpage_msgpred
integer x = 9
integer y = 912
integer width = 2313
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_champfusion, ls_col
integer li_pos

li_pos = position()
m_insertinfo my_menu
my_menu = create m_insertinfo
m_insertinfo.uf_translate()
m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
selecttext(li_pos,0)
paste() 
destroy my_menu

end event

type st_6 from statictext within tabpage_msgpred
integer x = 9
integer y = 852
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Anglais"
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_msgpred
integer x = 9
integer y = 92
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Français"
boolean focusrectangle = false
end type

type tabpage_msghtml from userobject within tab_msg
integer x = 18
integer y = 100
integer width = 2341
integer height = 1624
long backcolor = 15780518
string text = "Fichier HTML"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
lb_filehtml lb_filehtml
end type

on tabpage_msghtml.create
this.lb_filehtml=create lb_filehtml
this.Control[]={this.lb_filehtml}
end on

on tabpage_msghtml.destroy
destroy(this.lb_filehtml)
end on

type lb_filehtml from u_lb within tabpage_msghtml
integer y = 8
integer width = 2331
integer height = 1612
integer taborder = 11
boolean sorted = false
end type

