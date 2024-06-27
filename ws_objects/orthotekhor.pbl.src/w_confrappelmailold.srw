$PBExportHeader$w_confrappelmailold.srw
forward
global type w_confrappelmailold from w_response
end type
type st_deselectmail from statictext within w_confrappelmailold
end type
type st_selectmail from statictext within w_confrappelmailold
end type
type cb_4 from commandbutton within w_confrappelmailold
end type
type cb_fermer from commandbutton within w_confrappelmailold
end type
type cb_chgmsg from commandbutton within w_confrappelmailold
end type
type cb_sendmail from commandbutton within w_confrappelmailold
end type
type cb_print from commandbutton within w_confrappelmailold
end type
type rr_3 from roundrectangle within w_confrappelmailold
end type
type ddlb_listmsg from u_ddlb within w_confrappelmailold
end type
type st_4 from statictext within w_confrappelmailold
end type
type st_3 from statictext within w_confrappelmailold
end type
type st_2 from statictext within w_confrappelmailold
end type
type st_1 from statictext within w_confrappelmailold
end type
type mle_sujetan from multilineedit within w_confrappelmailold
end type
type mle_sujetfr from multilineedit within w_confrappelmailold
end type
type mle_msgan from multilineedit within w_confrappelmailold
end type
type mle_msgfr from multilineedit within w_confrappelmailold
end type
type st_deselect from statictext within w_confrappelmailold
end type
type st_select from statictext within w_confrappelmailold
end type
type hpb_sendcourriel from hprogressbar within w_confrappelmailold
end type
type st_title from st_uo_transparent within w_confrappelmailold
end type
type dw_confrappelmail from u_dw within w_confrappelmailold
end type
type rr_1 from roundrectangle within w_confrappelmailold
end type
type rr_2 from roundrectangle within w_confrappelmailold
end type
end forward

global type w_confrappelmailold from w_response
integer width = 4649
integer height = 2180
boolean titlebar = false
boolean controlmenu = false
long backcolor = 15780518
boolean center = true
st_deselectmail st_deselectmail
st_selectmail st_selectmail
cb_4 cb_4
cb_fermer cb_fermer
cb_chgmsg cb_chgmsg
cb_sendmail cb_sendmail
cb_print cb_print
rr_3 rr_3
ddlb_listmsg ddlb_listmsg
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
mle_sujetan mle_sujetan
mle_sujetfr mle_sujetfr
mle_msgan mle_msgan
mle_msgfr mle_msgfr
st_deselect st_deselect
st_select st_select
hpb_sendcourriel hpb_sendcourriel
st_title st_title
dw_confrappelmail dw_confrappelmail
rr_1 rr_1
rr_2 rr_2
end type
global w_confrappelmailold w_confrappelmailold

type variables
protected date idt_date
protected long il_idspec
long il_typecourriel
long il_patid[]
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_fermer ()
public subroutine of_print ()
public subroutine of_send ()
public subroutine of_changermsg ()
public function integer of_courriel (string as_message, string as_smtpserver, long al_logfile, long al_smtpauth, string as_smtpuserid, string as_smtppassword, long al_smtpport, string as_emailto, string as_nomto, string as_emailfrom, long al_patid, string as_sujet)
end prototypes

public subroutine uf_traduction ();if gnv_app.of_getlangue( ) = 'an' then
	st_title.text = "Appointment list to send by email"
	st_deselect.text = "Unselect all"
	st_select.text = "Select all"
end if



end subroutine

public subroutine of_fermer ();close(w_confrappelmail)
end subroutine

public subroutine of_print ();integer i
long ll_patid[]

datastore dw_etiq
dw_etiq = create datastore

gi_imp = 10
gb_datawindow = false

dw_etiq.dataobject = 'd_etiquette_patient_2'
dw_etiq.settransobject(SQLCA)

for i = 1 to dw_confrappelmail.rowcount( )
	if dw_confrappelmail.isselected(i) then
		ll_patid[i] = dw_confrappelmail.getitemnumber(i,'id_patient')
	end if
next

dw_etiq.retrieve(ll_patid)

openwithparm(w_print_options,dw_etiq)


end subroutine

public subroutine of_send ();string  ls_smtpuserid, ls_smtpserver, ls_smtppassword, ls_courriel, ls_nomdoc, ls_langue, ls_sujet
string ls_msgfr, ls_msgan, ls_sujetfr, ls_sujetan, ls_nom, ls_email, ls_body
long  ll_smtpport, ll_smtpauth, ll_logfile, ll_iduser, j, ll_pos, ll_patid, ll_idhorrdvpat
long ll_envoyercourriel, ll_emailinvalide, ll_delai, ll_idpers, ll_idcontact
date ldt_age
n_smtp luo_smtp
n_cst_datetime luo_time
n_cst_fusion luo_fusion
long ll_idspec

// Aller chercher les informations dans les options

select 	isnull(smtpserver,''), isnull(smtpport,25), isnull(smtpuserid,''), isnull(smtppassword,''), 
			isnull(smtpauth,0), isnull(logfile,0), isnull(delaimail,0)
into		:ls_smtpserver, :ll_smtpport, :ls_smtpuserid, :ls_smtppassword, :ll_smtpauth, :ll_logfile, :ll_delai
from t_options
where ortho_id = :v_no_ortho;

ls_msgfr = mle_msgfr.text
ls_sujetfr =  mle_sujetfr.text
ls_msgan = mle_msgan.text
ls_sujetan = mle_sujetan.text

If ls_smtpserver = "" Then
	MessageBox("Avertissement", "Vous devez configurer les informations du SMTP avant de procéder")
	Return
End If

ll_iduser = long(gnv_app.of_getuserid( ))
select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :gl_idpers;

If ls_courriel = "" Then
	MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
	Return
End If

// Setter le nombre de email a expedier dans la progressbar
hpb_sendcourriel.setrange(1, dw_confrappelmail.rowcount() * 10) 
setpointer(hourglass!)

for j = 1 to dw_confrappelmail.rowcount()
	
	if dw_confrappelmail.isselected(j) then
		
		// ON place en ordre les destinataires

		ll_patid = dw_confrappelmail.getItemNumber(j,'id_patient')
		select id_contact into :ll_idcontact from patient where patient_id = :ll_patid;
		ls_nom = dw_confrappelmail.getItemString(j,'nompatient')
		ls_email = dw_confrappelmail.getItemString(j,'courriel')
		ls_langue = dw_confrappelmail.getItemString(j,'langue')
//		luo_corrfus.of_setlangue(ls_langue)
		
		if isnull(ls_email) then ls_email = ''
		if match(ls_email,'@') then
			ll_pos = pos(ls_email,'@')
			if pos(mid(ls_email,ll_pos),'.') > 0 then
				
				if ls_langue = 'A' then
					
//					ls_body = luo_corrfus.of_fusion(ls_msgan,'id_patient',string(ll_patid))
//					ls_sujet = luo_corrfus.of_fusion(ls_sujetan,'id_patient',string(ll_patid))
					ls_body =  luo_fusion.of_fusion(ls_msgan,ll_idcontact,0) 
					ls_sujet =  luo_fusion.of_fusion(ls_sujetan,ll_idcontact,0) 
				else
//					ls_body = luo_corrfus.of_fusion(ls_msgfr,'id_patient',string(ll_patid))
//					ls_sujet = luo_corrfus.of_fusion(ls_sujetfr,'id_patient',string(ll_patid))
					ls_body =  luo_fusion.of_fusion(ls_msgfr,ll_idcontact,0) 
					ls_sujet =  luo_fusion.of_fusion(ls_sujetfr,ll_idcontact,0) 

				end if
				
//				select id_personne2 into :ll_idpers 
//				from t_patients left outer join t_interrelation on t_patients.id_personne = t_interrelation.id_personne1
//				where responsable = 1 and id_patient = :ll_patid;
////				ls_body = luo_corrfus.of_fusion(ls_body,'id_personne',string(ll_idpers))
				
				of_courriel(ls_body,ls_smtpserver,ll_logfile,ll_smtpauth,ls_smtpuserid,ls_smtppassword, ll_smtpport,ls_email,ls_nom,ls_courriel,ll_patid,ls_sujet)
		
			end if
			
		end if

	end if
	
	sleep(ll_delai)
	hpb_sendcourriel.stepit( )
	
next

MessageBox("Information", "Courriel envoyé avec succès")


		
		

end subroutine

public subroutine of_changermsg ();//  gnv_app.inv_entrepotglobal.of_ajoutedonnee("nospecemail", gnv_app.of_getspecid( )) 
//gnv_app.inv_entrepotglobal.of_ajoutedonnee("typecourriel", il_typecourriel) 
//opensheet(w_listmsgemail,w_appframe,2,layered!)

string ls_sujetfr, ls_sujetan, ls_msgfr, ls_msgan
long ll_idmsgcourriel, ll_cnt


ls_sujetfr = mle_sujetfr.text
ls_sujetan = mle_sujetan.text
ls_msgfr = mle_msgfr.text
ls_msgan = mle_msgan.text

select count(1) into :ll_cnt from t_messagecourriel where typemessage = 1;
if ll_cnt = 0 then
	insert into t_messagecourriel(titrecourriel,typemessage,sujetcourriel,sujetcourrielan,messagecourriel,messagecourrielan) 
	values('Message de rappels',1,:ls_sujetfr,:ls_sujetan,:ls_msgfr,:ls_msgan);
else
	ll_idmsgcourriel = ddlb_listmsg.of_getselectedData()
	update t_messagecourriel set 	sujetcourriel = :ls_sujetfr, 
											sujetcourrielan = :ls_sujetan,
											messagecourriel = :ls_msgfr,
											messagecourrielan = :ls_msgan
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

public function integer of_courriel (string as_message, string as_smtpserver, long al_logfile, long al_smtpauth, string as_smtpuserid, string as_smtppassword, long al_smtpport, string as_emailto, string as_nomto, string as_emailfrom, long al_patid, string as_sujet);long ll_idpers, ll_confirmemail
string ls_courriel, ls_msg, ls_nomfrom
n_smtp luo_smtp

ll_idpers = gl_idpers
select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :ll_idpers;
select isnull(cie, dr_nom_complet) into :ls_nomfrom from ortho_id where ortho_id = :v_no_ortho;
select isnull(confirmenvoi,0) into :ll_confirmemail from t_options where ortho_id = :v_no_ortho;

If ls_courriel = "" Then
	MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
	Return 0
End If

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
if ll_confirmemail = 1 then
	luo_smtp.of_SetReceipt(true)
end if
luo_smtp.of_SetFrom(ls_courriel, ls_nomfrom)
luo_smtp.of_SetSubject(as_sujet)
luo_smtp.of_SetBody(as_message, false)
luo_smtp.of_Reset()
luo_smtp.of_AddTo(as_emailto, as_nomto)
luo_smtp.of_addbcc(ls_courriel)
					
// send the message
If not luo_smtp.of_SendMail() Then
	ls_msg = as_emailto + ": " + luo_smtp.is_msgtext + "~r~n" 	
	MessageBox("Erreur d'envoi", ls_msg)
End If

//long ll_iduser
//string ls_nomdoc, ls_clinique, ls_message, ls_recipient, ls_smtpsender
//integer li_rc
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
//select isnull(nomclinique,'') into :ls_clinique from t_optiongen;
//if ls_clinique = "" then 
//
//	select isnull(dr_titre,'') || ' ' || isnull(dr_prenom,'') || ' ' || isnull(dr_nom,'') into :ls_clinique 
//	from t_specialists INNER JOIN t_patients ON t_patients.id_specialist = t_specialists.id_specialist
//	where id_patient = :al_patid;
//	
//end if
//
//select nom || ', ' || prenom into :ls_smtpsender from t_users where id_user = :ll_iduser;
//pbsmtpmail.SenderName = ls_smtpsender
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
//pbsmtpmail.subject = ls_clinique
//ls_message = "<html><head></head><body><PRE>" + as_message + "</PRE></body></html>"
//pbsmtpmail.messageText = ls_message
//pbsmtpmail.IsHTML = true
//pbsmtpmail.ajoutRecipient(as_emailto)
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

on w_confrappelmailold.create
int iCurrent
call super::create
this.st_deselectmail=create st_deselectmail
this.st_selectmail=create st_selectmail
this.cb_4=create cb_4
this.cb_fermer=create cb_fermer
this.cb_chgmsg=create cb_chgmsg
this.cb_sendmail=create cb_sendmail
this.cb_print=create cb_print
this.rr_3=create rr_3
this.ddlb_listmsg=create ddlb_listmsg
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_sujetan=create mle_sujetan
this.mle_sujetfr=create mle_sujetfr
this.mle_msgan=create mle_msgan
this.mle_msgfr=create mle_msgfr
this.st_deselect=create st_deselect
this.st_select=create st_select
this.hpb_sendcourriel=create hpb_sendcourriel
this.st_title=create st_title
this.dw_confrappelmail=create dw_confrappelmail
this.rr_1=create rr_1
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_deselectmail
this.Control[iCurrent+2]=this.st_selectmail
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.cb_chgmsg
this.Control[iCurrent+6]=this.cb_sendmail
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.rr_3
this.Control[iCurrent+9]=this.ddlb_listmsg
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.mle_sujetan
this.Control[iCurrent+15]=this.mle_sujetfr
this.Control[iCurrent+16]=this.mle_msgan
this.Control[iCurrent+17]=this.mle_msgfr
this.Control[iCurrent+18]=this.st_deselect
this.Control[iCurrent+19]=this.st_select
this.Control[iCurrent+20]=this.hpb_sendcourriel
this.Control[iCurrent+21]=this.st_title
this.Control[iCurrent+22]=this.dw_confrappelmail
this.Control[iCurrent+23]=this.rr_1
this.Control[iCurrent+24]=this.rr_2
end on

on w_confrappelmailold.destroy
call super::destroy
destroy(this.st_deselectmail)
destroy(this.st_selectmail)
destroy(this.cb_4)
destroy(this.cb_fermer)
destroy(this.cb_chgmsg)
destroy(this.cb_sendmail)
destroy(this.cb_print)
destroy(this.rr_3)
destroy(this.ddlb_listmsg)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_sujetan)
destroy(this.mle_sujetfr)
destroy(this.mle_msgan)
destroy(this.mle_msgfr)
destroy(this.st_deselect)
destroy(this.st_select)
destroy(this.hpb_sendcourriel)
destroy(this.st_title)
destroy(this.dw_confrappelmail)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;call super::open;//date ldt_date_debut, ldt_date_fin
//long ll_idspec,ll_idraptrait,ll_avrdv,ll_actif
//string ls_compte[]
long ll_patid[], i, ll_nodos, ll_row, ll_typecourriel
string ls_nompat, ls_langue, ls_courriel, ls_newdossier

ll_patid = gnv_app.inv_entrepotglobal.of_retournedonnee("Liste_patient_courriel")
il_typecourriel = gnv_app.inv_entrepotglobal.of_retournedonnee("type_courriel")


dw_confrappelmail.setRedraw(false)
for i = 1 to upperbound(ll_patid)
	
	select isnull(patient_nom,'') || ' ' || isnull(patient_prenom,''), langue, new_dossier, email
	into :ls_nompat, :ls_langue, :ls_newdossier, :ls_courriel
	from patient where patient_id = :ll_patid[i];
	
	ll_row = dw_confrappelmail.insertRow(0)
	dw_confrappelmail.setitem(ll_row,'id_patient',ll_patid[i])
	dw_confrappelmail.setitem(ll_row,'nompatient',ls_nompat)
	dw_confrappelmail.setitem(ll_row,'langue',ls_langue)
	dw_confrappelmail.setitem(ll_row,'courriel',ls_courriel)
	dw_confrappelmail.setitem(ll_row,'nodos',ls_newdossier)
	
next
dw_confrappelmail.setSort("nompatient A")
dw_confrappelmail.sort()
dw_confrappelmail.setRedraw(true)

ddlb_listmsg.event ue_filllist()

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

type st_deselectmail from statictext within w_confrappelmailold
integer x = 2071
integer y = 20
integer width = 709
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 12639424
string text = "Sélectionner tout (sans courriel)"
boolean focusrectangle = false
end type

event clicked;string ls_courriel
long ll_pos
integer i

//setnull(il_patid)
dw_confrappelmail.selectrow(0, false)

for i = 1 to dw_confrappelmail.rowcount( )
	ls_courriel = dw_confrappelmail.getitemstring(i,'courriel')
	if isnull(ls_courriel) then ls_courriel = ''
	
	if not match(ls_courriel,'@') or not pos(mid(ls_courriel,ll_pos),'.') > 0 then
		dw_confrappelmail.selectRow(i,true)
		il_patid[i] = dw_confrappelmail.getitemnumber(i,'id_patient')
	end if		
next

end event

type st_selectmail from statictext within w_confrappelmailold
integer x = 2807
integer y = 20
integer width = 594
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 12639424
string text = "Sélectionner tout (courriel)"
boolean focusrectangle = false
end type

event clicked;string ls_courriel
long ll_pos
integer i

//setnull(il_patid)
dw_confrappelmail.selectrow(0, false)

for i = 1 to dw_confrappelmail.rowcount( )
	ls_courriel = dw_confrappelmail.getitemstring(i,'courriel')
	if isnull(ls_courriel) then ls_courriel = ''
	
	if match(ls_courriel,'@') then
		ll_pos = pos(ls_courriel,'@')
		if pos(mid(ls_courriel,ll_pos),'.') > 0 then
			dw_confrappelmail.selectRow(i,true)
			//il_patid[i] = dw_confrappelmail.getitemnumber(i,'id_patient')
		end if
	end if		
next


end event

type cb_4 from commandbutton within w_confrappelmailold
integer x = 1989
integer y = 2048
integer width = 1975
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type cb_fermer from commandbutton within w_confrappelmailold
integer x = 3963
integer y = 2044
integer width = 658
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;of_fermer()
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if	
end event

type cb_chgmsg from commandbutton within w_confrappelmailold
integer x = 1330
integer y = 2044
integer width = 658
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Changer le message"
end type

event clicked;of_changermsg()
end event

event constructor;if v_langue = 'an' then
	this.text = "Change message"
end if	
end event

type cb_sendmail from commandbutton within w_confrappelmailold
integer x = 672
integer y = 2044
integer width = 658
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Envoyer courriel"
end type

event clicked;of_send()
end event

event constructor;if v_langue = 'an' then
	this.text = "Send email"
end if	
end event

type cb_print from commandbutton within w_confrappelmailold
integer x = 14
integer y = 2044
integer width = 658
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer Étiquette"
end type

event clicked;of_print()
end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if	
end event

type rr_3 from roundrectangle within w_confrappelmailold
integer linethickness = 4
long fillcolor = 12639424
integer x = 2222
integer y = 116
integer width = 2400
integer height = 1840
integer cornerheight = 40
integer cornerwidth = 46
end type

type ddlb_listmsg from u_ddlb within w_confrappelmailold
event ue_filllist ( )
integer x = 3707
integer y = 136
integer width = 869
integer height = 624
integer taborder = 20
boolean sorted = false
end type

event ue_filllist();string ls_msgfr, ls_sujetfr, ls_msgan, ls_sujetan
long ll_idmsgcourriel, ll_typemsg, ll_index = 0

DECLARE listcourriel CURSOR FOR 

	select 	isnull(titrecourriel,'Msg'),
				id_messagecourriel,
				typemessage
	from		t_messagecourriel;
	
OPEN listcourriel;

FETCH listcourriel INTO :ls_msgfr, :ll_idmsgcourriel, :ll_typemsg;

DO WHILE SQLCA.SQLcode = 0 
	
	of_addItem(ls_msgfr,ll_idmsgcourriel)
	if ll_typemsg = il_typecourriel then
		ll_index = ll_idmsgcourriel
	end if
	
	FETCH listcourriel INTO :ls_msgfr, :ll_idmsgcourriel, :ll_typemsg;
	
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
				isnull(sujetcourrielan,'Pas de sujet')
	into     :ls_msgfr, :ls_sujetfr, :ls_msgan, :ls_sujetan
	from		t_messagecourriel
	where		t_messagecourriel.id_messagecourriel = :ll_idmsgcourriel;
	
end if




mle_sujetfr.text = ls_sujetfr
mle_msgfr.text = ls_msgfr
mle_sujetan.text = ls_sujetan
mle_msgan.text = ls_msgan
end event

event selectionchanged;call super::selectionchanged;long ll_idmsgcourriel
string ls_msgfr, ls_sujetfr, ls_msgan, ls_sujetan

ll_idmsgcourriel = of_getSelectedData()

select 	isnull(messagecourriel,'Pas de message'),
			isnull(sujetcourriel,'Pas de sujet'),
			isnull(messagecourrielan,'Pas de message'),
			isnull(sujetcourrielan,'Pas de sujet')
into     :ls_msgfr, :ls_sujetfr, :ls_msgan, :ls_sujetan
from		t_messagecourriel
where		t_messagecourriel.id_messagecourriel = :ll_idmsgcourriel;


mle_sujetfr.text = ls_sujetfr
mle_msgfr.text = ls_msgfr
mle_sujetan.text = ls_sujetan
mle_msgan.text = ls_msgan

end event

type st_4 from statictext within w_confrappelmailold
integer x = 2565
integer y = 136
integer width = 1102
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

type st_3 from statictext within w_confrappelmailold
integer x = 2272
integer y = 136
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

type st_2 from statictext within w_confrappelmailold
integer x = 2272
integer y = 1080
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 12639424
string text = "Anglais"
boolean focusrectangle = false
end type

type st_1 from statictext within w_confrappelmailold
integer x = 2272
integer y = 216
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 12639424
string text = "Français"
boolean focusrectangle = false
end type

type mle_sujetan from multilineedit within w_confrappelmailold
integer x = 2272
integer y = 1152
integer width = 2304
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_champfusion
integer li_pos

m_insertinfo my_menu
my_menu = create m_insertinfo
gnv_app.inv_entrepotglobal.of_ajoutedonnee("fusionnerautredw",1)
m_insertinfo.uf_translate()
m_insertinfo.popmenu (100+pixelsToUnits(xpos, XPixelsToUnits!), 100+pixelsToUnits(ypos, YPixelsToUnits!))
ls_champfusion = m_insertinfo.of_getchampfusion()
::clipboard(ls_champfusion)
selecttext(li_pos,0)
paste()

destroy my_menu

end event

type mle_sujetfr from multilineedit within w_confrappelmailold
integer x = 2272
integer y = 296
integer width = 2304
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_champfusion
integer li_pos

m_insertinfo my_menu
my_menu = create m_insertinfo
gnv_app.inv_entrepotglobal.of_ajoutedonnee("fusionnerautredw",1)
m_insertinfo.uf_translate()
m_insertinfo.popmenu (100+pixelsToUnits(xpos, XPixelsToUnits!), 100+pixelsToUnits(ypos, YPixelsToUnits!))
ls_champfusion = m_insertinfo.of_getchampfusion()
::clipboard(ls_champfusion)
selecttext(li_pos,0)
paste()

destroy my_menu

end event

type mle_msgan from multilineedit within w_confrappelmailold
integer x = 2272
integer y = 1328
integer width = 2304
integer height = 600
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

event rbuttondown;string ls_champfusion
integer li_pos

m_insertinfo my_menu
my_menu = create m_insertinfo
gnv_app.inv_entrepotglobal.of_ajoutedonnee("fusionnerautredw",1)
m_insertinfo.uf_translate()
m_insertinfo.popmenu (100+pixelsToUnits(xpos, XPixelsToUnits!), 100+pixelsToUnits(ypos, YPixelsToUnits!))
ls_champfusion = m_insertinfo.of_getchampfusion()
::clipboard(ls_champfusion)
selecttext(li_pos,0)
paste()

destroy my_menu

end event

type mle_msgfr from multilineedit within w_confrappelmailold
integer x = 2272
integer y = 468
integer width = 2304
integer height = 600
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

event rbuttondown;string ls_champfusion
integer li_pos

m_insertinfo my_menu
my_menu = create m_insertinfo
gnv_app.inv_entrepotglobal.of_ajoutedonnee("fusionnerautredw",1)
m_insertinfo.uf_translate()
m_insertinfo.popmenu (100+pixelsToUnits(xpos, XPixelsToUnits!), 100+pixelsToUnits(ypos, YPixelsToUnits!))
ls_champfusion = m_insertinfo.of_getchampfusion()
::clipboard(ls_champfusion)
selecttext(li_pos,0)
paste()

destroy my_menu

end event

type st_deselect from statictext within w_confrappelmailold
integer x = 3653
integer y = 20
integer width = 489
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 12639424
string text = "Désélectionner tout"
boolean focusrectangle = false
end type

event clicked;dw_confrappelmail.selectrow(0, false)
end event

type st_select from statictext within w_confrappelmailold
integer x = 4192
integer y = 24
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 12639424
string text = "Sélectionner tout"
boolean focusrectangle = false
end type

event clicked;dw_confrappelmail.selectrow(0, true)
end event

type hpb_sendcourriel from hprogressbar within w_confrappelmailold
integer x = 9
integer y = 1972
integer width = 4608
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
end type

type st_title from st_uo_transparent within w_confrappelmailold
integer x = 37
integer y = 16
integer width = 1445
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 12639424
string text = "Envoi de courriels massives"
end type

type dw_confrappelmail from u_dw within w_confrappelmailold
integer x = 41
integer y = 136
integer width = 2158
integer height = 1804
integer taborder = 10
string dataobject = "d_listcourrierenvoyer"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
string is_objet_rbutton = "0"
end type

event clicked;call super::clicked;if isselected(row) then
	selectRow(row,false)
else
	selectRow(row,true)
end if 
end event

event rbuttondown;call super::rbuttondown;//string ls_valeur
//n_corrfusion luo_corrfus
//
//ls_valeur = luo_corrfus.of_fusion("%nom_patient%", "3322")
//messagebox("dff",ls_valeur)
end event

type rr_1 from roundrectangle within w_confrappelmailold
integer linethickness = 4
long fillcolor = 12639424
integer y = 8
integer width = 4626
integer height = 92
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_confrappelmailold
integer linethickness = 4
long fillcolor = 15793151
integer x = 14
integer y = 116
integer width = 2190
integer height = 1840
integer cornerheight = 40
integer cornerwidth = 46
end type

