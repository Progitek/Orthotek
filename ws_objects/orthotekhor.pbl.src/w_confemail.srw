$PBExportHeader$w_confemail.srw
forward
global type w_confemail from w_response
end type
type cbx_email3 from checkbox within w_confemail
end type
type cbx_email2 from checkbox within w_confemail
end type
type cbx_email1 from checkbox within w_confemail
end type
type hpb_sendcourriel from hprogressbar within w_confemail
end type
type cbx_confrdv from checkbox within w_confemail
end type
type st_title from st_uo_transparent within w_confemail
end type
type uo_toolbar from u_cst_toolbarstrip within w_confemail
end type
type dw_confemail from u_dw within w_confemail
end type
type rr_1 from roundrectangle within w_confemail
end type
end forward

global type w_confemail from w_response
integer width = 2981
integer height = 2028
boolean center = true
cbx_email3 cbx_email3
cbx_email2 cbx_email2
cbx_email1 cbx_email1
hpb_sendcourriel hpb_sendcourriel
cbx_confrdv cbx_confrdv
st_title st_title
uo_toolbar uo_toolbar
dw_confemail dw_confemail
rr_1 rr_1
end type
global w_confemail w_confemail

type variables
public date idt_date
protected long il_horidspec
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_fermer ()
public subroutine of_print ()
public subroutine of_send ()
public subroutine of_selectauto ()
public subroutine of_changermsg ()
public subroutine of_confhoraire (long al_row)
public function integer of_courriel (string as_message, string as_smtpserver, long al_logfile, long al_smtpauth, string as_smtpuserid, string as_smtppassword, long al_smtpport, string as_emailto, string as_nomto, string as_emailfrom, long al_patid)
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_settheme("classics")
uo_toolbar.of_displayborder(true)

if gnv_app.of_getlangue( ) = 'an' then
	uo_toolbar.of_additem("Print", "Print!")
	uo_toolbar.of_additem("Send email", "Custom025!")
	uo_toolbar.of_additem("Change message","Pastewindow!")
	uo_toolbar.of_additem("Close", "Exit!")
	st_title.text = "Appointment list to send by email"
	cbx_email1.text = "Email #1"
	cbx_email2.text = "Email #2"
	cbx_email3.text = "Email #3"
	
else
	uo_toolbar.of_additem("Imprimer", "Print!")
	uo_toolbar.of_additem("Envoyer courriel", "Custom025!")
	uo_toolbar.of_additem("Changer le message","Pastewindow!")
	uo_toolbar.of_additem("Fermer", "Exit!")
end if

uo_toolbar.of_displaytext(true)


end subroutine

public subroutine of_fermer ();close(w_confemail)
end subroutine

public subroutine of_print ();gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_confemail)
end subroutine

public subroutine of_send ();string ls_smtpserver, ls_smtpuserid, ls_smtppassword, ls_messadultfr, ls_messadulten, ls_messenffr
string ls_messenfen, ls_nomortho, ls_nom, ls_email, ls_email1, ls_email2, ls_email3, ls_langue, ls_courriel, ls_msg
long ll_smtpport, ll_smtpauth, j, ll_patid, ll_pos, ll_idcontact, ll_envoyer, ll_idrdv, ll_erreurmail, ll_logfile
long ll_delai, m, ll_sendcourriel
n_smtp luo_smtp
date ldt_age, ldt_daterdv
n_cst_datetime luo_time
n_cst_fusion luo_fusion

// Aller chercher les informations dans les options

select 	isnull(smtpserver,''), isnull(smtpport,25), isnull(smtpuserid,''), isnull(smtppassword,''), 
			isnull(smtpauth,0),isnull(logfile,0), isnull(mailmessrdvadultfr,'Pas de message'),
			isnull(mailmessrdvadulten,'Pas de message'),isnull(mailmessrdvenffr,'Pas de message'),
			isnull(mailmessrdvenfen,'Pas de message'), isnull(delaimail,1)
into		:ls_smtpserver, :ll_smtpport, :ls_smtpuserid, :ls_smtppassword, :ll_smtpauth, :ll_logfile,
			:ls_messadultfr, :ls_messadulten, :ls_messenffr, :ls_messenfen, :ll_delai
from t_options where ortho_id = :v_no_ortho;

If ls_smtpserver = "" Then
	MessageBox("Avertissement", "Vous devez configurer les informations du SMTP avant de procéder")
	Return
End If

select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :gl_idpers;

// Aller chercher un destinataire
If ls_courriel = "" Then
	MessageBox("Avertissement", "Un destinataire est nécessaire pour envoyer un courriel")
	Return
End If

// Setter le nombre de email a expedier dans la progressbar
hpb_sendcourriel.setrange(1, dw_confemail.rowcount() * 10) 
setpointer(hourglass!)

for j = 1 to dw_confemail.rowcount()
	
	ll_envoyer = dw_confemail.getItemNumber(j,'t_rdv_envoyermail')
	if isnull(ll_envoyer) then ll_envoyer = 0

	if dw_confemail.isselected(j) and ll_envoyer = 0 then
		
		// ON place en ordre les destinataires

		ll_patid = dw_confemail.getItemnumber(j,'t_rdv_patient_id')
		ls_nom = dw_confemail.getItemString(j,'patnom')
		ls_email1 = dw_confemail.getItemString(j,'patient_email')
		ls_email2 = dw_confemail.getItemString(j,'patient_email2')
		ls_email3= dw_confemail.getItemString(j,'patient_email3')
		ldt_age = dw_confemail.getItemdate(j,'patient_date_naissance')
		ls_langue = dw_confemail.getItemString(j,'patient_langue')
		ll_idrdv = dw_confemail.getItemNumber(j,'t_rdv_id_rdv')
			
		// Validation de l'adresse e-mail
	
		for m = 1 to 3 
			
			// On utilise le email 1 a 3
			
			CHOOSE CASE m
				CASE 1
					ls_email = ls_email1
					if cbx_email1.checked then 
						ll_sendcourriel = 1
					else
						ll_sendcourriel = 0
					end if
				CASE 2
					ls_email = ls_email2
					if cbx_email2.checked then 
						ll_sendcourriel = 1
					else
						ll_sendcourriel = 0
					end if
				CASE 3
					ls_email = ls_email3
					if cbx_email3.checked then
						ll_sendcourriel = 1
					else
						ll_sendcourriel = 0
					end if
					
			END CHOOSE

			if isnull(ls_email) then ls_email = ''
			if match(ls_email,'@') and ll_sendcourriel = 1 then
				ll_pos = pos(ls_email,'@')
				if pos(mid(ls_email,ll_pos),'.') > 0 then
					
					ldt_daterdv = relativedate(idt_date, -1)
					select id_contact into :ll_idcontact from patient where patient_id = :ll_patid;
					if ls_langue = 'A' then
						if luo_time.of_yearsafter(ldt_age, today()) > 18 then
							ls_msg = luo_fusion.of_fusion(ls_messadulten,ll_idcontact,0,ldt_daterdv)
						else
							ls_msg = luo_fusion.of_fusion(ls_messenfen,ll_idcontact,0,ldt_daterdv)
						end if
					else
						if luo_time.of_yearsafter(ldt_age, today()) > 18 then
							ls_msg = luo_fusion.of_fusion(ls_messadultfr,ll_idcontact,0,ldt_daterdv)
						else
							ls_msg = luo_fusion.of_fusion(ls_messenffr,ll_idcontact,0,ldt_daterdv)
						end if
					end if
					
					// send the message
					If of_courriel(ls_msg,ls_smtpserver,ll_logfile,ll_smtpauth,ls_smtpuserid, ls_smtppassword,ll_smtpport,ls_email,ls_nom,ls_courriel,ll_patid) = 1 Then
						update t_rdv set envoyermail = 1 where id_rdv = :ll_idrdv;
							if gf_sqlerr() then
							commit using SQLCA;
						else
							rollback using SQLCA;
						end if
						
						dw_confemail.setitem( j,"t_rdv_envoyermail", 1)
						// Confirmation dans l'horaire
					
						if cbx_confrdv.checked then
							of_confhoraire(j)
						end if						
						
//						// Mettre message dans boîte d'envoi
//						
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
					error_type(-1)						
					END IF
	
				end if
			end if
		
		next
		
		sleep(ll_delai)
		
	end if
	
	hpb_sendcourriel.stepit( )
	
next

MessageBox("Information", "Message envoyé avec succès")


end subroutine

public subroutine of_selectauto ();long i, ll_pos, ll_envoyeremail, ll_validemail
string ls_email

// ON place en ordre les destinataires

for i = 1 to dw_confemail.rowcount()
	
	ls_email = dw_confemail.getItemString(i,'patient_email')
	ll_envoyeremail = dw_confemail.getItemNumber(i,'t_rdv_envoyermail')
	ll_validemail = dw_confemail.getItemNumber(i,'patient_emailvalid')
	if isnull(ll_envoyeremail) then ll_envoyeremail = 0
	if isnull(ll_validemail) then ll_validemail = 0
	
	if isnull(ls_email) then ls_email = ''
	if match(ls_email,'@') then
		ll_pos = pos(ls_email,'@')
		if pos(mid(ls_email,ll_pos),'.') > 0 and ll_validemail = 0 and ll_envoyeremail = 0 then
			dw_confemail.selectRow(i,true)
		end if
	end if			

next
end subroutine

public subroutine of_changermsg ();open(w_changermsg)
end subroutine

public subroutine of_confhoraire (long al_row);long ll_patid, ll_orthoid, ll_col
time lt_heurerdv
date ldt_daterdv
string ls_sql

ll_patid = dw_confemail.getItemnumber(al_row,'t_rdv_patient_id')
lt_heurerdv = dw_confemail.getItemTime(al_row,'t_rdv_rdvheure')
ldt_daterdv =dw_confemail.getItemDate(al_row,'t_rdv_rdvdate')
ll_col = dw_confemail.getItemnumber(al_row,'t_rdv_colonne')
ll_orthoid = dw_confemail.getItemnumber(al_row,'t_rdv_ortho_id')

ls_sql = "update horaire set conf" + string(ll_col) + " = 1 &
			 where 	no_ortho = " + string(ll_orthoid) + " and &
			 			datecal  = '" + string(ldt_daterdv,"yyyy-mm-dd") + "' and &
						heure = '"  + string(lt_heurerdv,"hh:mm") + "' and &
						patient_id_" + string(ll_col) + " = " + string(ll_patid)

execute immediate :ls_sql using SQLCA;
				



end subroutine

public function integer of_courriel (string as_message, string as_smtpserver, long al_logfile, long al_smtpauth, string as_smtpuserid, string as_smtppassword, long al_smtpport, string as_emailto, string as_nomto, string as_emailfrom, long al_patid);n_smtp luo_smtp
long ll_iduser, ll_envoiconf
string ls_nomdoc, ls_rep

select isnull(confirmenvoi,0) into :ll_envoiconf from t_options where ortho_id = :v_no_ortho;

// Aller chercher les informations dans les options

If al_logfile = 1 Then
	luo_smtp.of_SetLogfile(True)
Else
	luo_smtp.of_SetLogfile(False)
End If
luo_smtp.of_DeleteLogfile()

// set properties
If al_smtpauth = 1 Then
	luo_smtp.of_SetLogin(as_smtpuserid, as_smtppassword)
End If

luo_smtp.of_SetPort(al_smtpport)
luo_smtp.of_SetServer(as_smtpserver)
ls_rep = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "confirmationcourriel", 'No')
if ls_rep = 'Yes' then
	luo_smtp.of_SetReceipt(true)
end if
luo_smtp.of_SetFrom(as_emailfrom, "")

select isnull(dr_nom_complet,'') into :ls_nomdoc from ortho_id inner join patient on patient.no_ortho = ortho_id.ortho_id where patient_id = :al_patid;

luo_smtp.of_SetSubject(ls_nomdoc)
luo_smtp.of_SetBody(as_message, false)
luo_smtp.of_Reset()
luo_smtp.of_AddTo(as_emailto, as_nomto)
if ll_envoiconf = 0 then
 luo_smtp.of_addbcc(as_emailfrom)
end if

// send the message
If not luo_smtp.of_SendMail() Then
	return 0
end if

return 1
end function

on w_confemail.create
int iCurrent
call super::create
this.cbx_email3=create cbx_email3
this.cbx_email2=create cbx_email2
this.cbx_email1=create cbx_email1
this.hpb_sendcourriel=create hpb_sendcourriel
this.cbx_confrdv=create cbx_confrdv
this.st_title=create st_title
this.uo_toolbar=create uo_toolbar
this.dw_confemail=create dw_confemail
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_email3
this.Control[iCurrent+2]=this.cbx_email2
this.Control[iCurrent+3]=this.cbx_email1
this.Control[iCurrent+4]=this.hpb_sendcourriel
this.Control[iCurrent+5]=this.cbx_confrdv
this.Control[iCurrent+6]=this.st_title
this.Control[iCurrent+7]=this.uo_toolbar
this.Control[iCurrent+8]=this.dw_confemail
this.Control[iCurrent+9]=this.rr_1
end on

on w_confemail.destroy
call super::destroy
destroy(this.cbx_email3)
destroy(this.cbx_email2)
destroy(this.cbx_email1)
destroy(this.hpb_sendcourriel)
destroy(this.cbx_confrdv)
destroy(this.st_title)
destroy(this.uo_toolbar)
destroy(this.dw_confemail)
destroy(this.rr_1)
end on

event open;call super::open;long li_liste_trait_par_spec, ll_mail1, ll_mail2, ll_mail3, ll_horidspec

idt_date = gnv_app.inv_entrepotglobal.of_retournedonnee("datejournee")
il_horidspec = gnv_app.inv_entrepotglobal.of_retournedonnee("spechoraire")

if cbx_email1.checked then
	ll_mail1 = 1
else
	ll_mail1 = 0
end if

if cbx_email2.checked then
	ll_mail2 = 1
else
	ll_mail2 = 0
end if

if cbx_email3.checked then
	ll_mail3 = 1
else
	ll_mail3 = 0
end if

select horshareid,liste_trait_par_spec 
into :ll_horidspec,:li_liste_trait_par_spec 
from t_options where ortho_id = :v_no_ortho;

if li_liste_trait_par_spec = 1 then
	dw_confemail.retrieve(idt_date,ll_horidspec,v_no_ortho,ll_mail1,ll_mail2,ll_mail3)
else
	if isnull(ll_horidspec) then ll_horidspec = v_no_ortho
	dw_confemail.retrieve(idt_date,ll_horidspec,ll_horidspec,ll_mail1,ll_mail2,ll_mail3)
end if

of_selectauto()
end event

type cbx_email3 from checkbox within w_confemail
integer x = 1115
integer y = 116
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Courriel 3"
boolean checked = true
end type

event clicked;long ll_mail1, ll_mail2, ll_mail3, li_liste_trait_par_spec, ll_horidspec

if cbx_email1.checked then
	ll_mail1 = 1
else
	ll_mail1 = 0
end if

if cbx_email2.checked then
	ll_mail2 = 1
else
	ll_mail2 = 0
end if

if cbx_email3.checked then
	ll_mail3 = 1
else
	ll_mail3 = 0
end if

select horshareid,liste_trait_par_spec 
into :ll_horidspec,:li_liste_trait_par_spec 
from t_options where ortho_id = :v_no_ortho;

if li_liste_trait_par_spec = 1 then
	dw_confemail.retrieve(idt_date,ll_horidspec,v_no_ortho)
else
	if isnull(ll_horidspec) then ll_horidspec = v_no_ortho
	dw_confemail.retrieve(idt_date,ll_horidspec,ll_horidspec,ll_mail1,ll_mail2,ll_mail3)
end if

of_selectauto()
end event

type cbx_email2 from checkbox within w_confemail
integer x = 562
integer y = 116
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Courriel 2"
boolean checked = true
end type

event clicked;long ll_mail1, ll_mail2, ll_mail3, li_liste_trait_par_spec, ll_horidspec

if cbx_email1.checked then
	ll_mail1 = 1
else
	ll_mail1 = 0
end if

if cbx_email2.checked then
	ll_mail2 = 1
else
	ll_mail2 = 0
end if

if cbx_email3.checked then
	ll_mail3 = 1
else
	ll_mail3 = 0
end if

select horshareid,liste_trait_par_spec 
into :ll_horidspec,:li_liste_trait_par_spec 
from t_options where ortho_id = :v_no_ortho;

if li_liste_trait_par_spec = 1 then
	dw_confemail.retrieve(idt_date,ll_horidspec,v_no_ortho)
else
	if isnull(ll_horidspec) then ll_horidspec = v_no_ortho
	dw_confemail.retrieve(idt_date,ll_horidspec,ll_horidspec,ll_mail1,ll_mail2,ll_mail3)
end if

of_selectauto()
end event

type cbx_email1 from checkbox within w_confemail
integer x = 9
integer y = 116
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Courriel 1"
boolean checked = true
end type

event clicked;long ll_mail1, ll_mail2, ll_mail3, li_liste_trait_par_spec, ll_horidspec

if cbx_email1.checked then
	ll_mail1 = 1
else
	ll_mail1 = 0
end if

if cbx_email2.checked then
	ll_mail2 = 1
else
	ll_mail2 = 0
end if

if cbx_email3.checked then
	ll_mail3 = 1
else
	ll_mail3 = 0
end if

select horshareid,liste_trait_par_spec 
into :ll_horidspec,:li_liste_trait_par_spec 
from t_options where ortho_id = :v_no_ortho;

if li_liste_trait_par_spec = 1 then
	dw_confemail.retrieve(idt_date,ll_horidspec,v_no_ortho)
else
	if isnull(ll_horidspec) then ll_horidspec = v_no_ortho
	dw_confemail.retrieve(idt_date,ll_horidspec,ll_horidspec,ll_mail1,ll_mail2,ll_mail3)
end if

of_selectauto()
end event

type hpb_sendcourriel from hprogressbar within w_confemail
integer x = 9
integer y = 1744
integer width = 2953
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

type cbx_confrdv from checkbox within w_confemail
integer x = 2030
integer y = 20
integer width = 901
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Confirmation des rendez-vous"
end type

type st_title from st_uo_transparent within w_confemail
integer x = 119
integer y = 16
integer width = 1175
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string text = "Liste des rendez-vous a envoyer par courriel"
end type

type uo_toolbar from u_cst_toolbarstrip within w_confemail
integer y = 1828
integer width = 2962
integer height = 912
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE "Print","Imprimer"
		of_print()
	CASE "Send email","Envoyer courriel"
		of_send()
		of_fermer()
	CASE "Change message","Changer le message"
		of_changermsg()
	CASE "Close","Fermer"
		of_fermer()
END CHOOSE

end event

type dw_confemail from u_dw within w_confemail
integer y = 196
integer width = 2958
integer height = 1524
integer taborder = 10
string dataobject = "d_confemail"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;call super::clicked;if isselected(row) then
	selectRow(row,false)
else
	selectRow(row,true)
end if 
end event

type rr_1 from roundrectangle within w_confemail
integer linethickness = 4
long fillcolor = 16777215
integer y = 8
integer width = 2953
integer height = 92
integer cornerheight = 40
integer cornerwidth = 46
end type

