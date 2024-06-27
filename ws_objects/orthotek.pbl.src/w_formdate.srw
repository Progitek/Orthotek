$PBExportHeader$w_formdate.srw
forward
global type w_formdate from w_child
end type
type cbx_reception from checkbox within w_formdate
end type
type cb_courriel from commandbutton within w_formdate
end type
type shl_2 from statichyperlink within w_formdate
end type
type shl_1 from statichyperlink within w_formdate
end type
type shl_unselect from statichyperlink within w_formdate
end type
type shl_select from statichyperlink within w_formdate
end type
type st_start from statictext within w_formdate
end type
type cb_print from commandbutton within w_formdate
end type
type cb_1 from commandbutton within w_formdate
end type
type st_end from statictext within w_formdate
end type
type em_datedebut from editmask within w_formdate
end type
type em_datefin from editmask within w_formdate
end type
type st_title from statictext within w_formdate
end type
type cb_search from commandbutton within w_formdate
end type
type dw_formass from u_dw within w_formdate
end type
end forward

global type w_formdate from w_child
string tag = "recuauto"
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
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
cbx_reception cbx_reception
cb_courriel cb_courriel
shl_2 shl_2
shl_1 shl_1
shl_unselect shl_unselect
shl_select shl_select
st_start st_start
cb_print cb_print
cb_1 cb_1
st_end st_end
em_datedebut em_datedebut
em_datefin em_datefin
st_title st_title
cb_search cb_search
dw_formass dw_formass
end type
global w_formdate w_formdate

type variables
int apercu = 1
private string is_piecejointe[]
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_creerpiecejointe ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	title = "Print insurance form"
else
	title = "Impression des formulaires"
end if
end subroutine

public subroutine of_creerpiecejointe ();n_ds ds_formnorm
integer li_recutype
long i,j = 1, ll_traitid, ll_imp, ll_contactid, ll_patid
string ls_langue, ls_corrpath, ls_filename
date ldt_debut, ldt_fin

ds_formnorm = create n_ds

SetPointer(HourGlass!)
em_datedebut.getData(ldt_debut)
em_datefin.getData(ldt_fin)

if dw_formass.rowcount() > 0 then
		
	for i = 1 to dw_formass.rowcount()
			
		ll_traitid = dw_formass.getItemNumber(i,'traitements_traitement_id')
		ll_contactid = dw_formass.getItemNumber(i,'cont_id_contact')
		ll_imp = dw_formass.getItemNumber(i,'impform')
		ls_langue = dw_formass.getItemString(i,'patient_langue')
					
		if ll_imp = 1 then
		
			if ls_langue = 'A' then
				ds_formnorm.dataobject = 'd_formnormenauto'
			else
				ds_formnorm.dataobject = 'd_formnormpaiefr'
			end if
		
			ds_formnorm.SetTransObject(SQLCA)
			ds_formnorm.retrieve(ll_traitid, ldt_debut, ldt_fin,ll_contactid)
							
			if dw_formass.getItemNumber(i,'courriel') = 1 then
					
				ll_patid = dw_formass.getItemnumber(i, "patient_patient_id")
				
				select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
				if not  DirectoryExists(ls_corrpath + "\" + string(ll_patid)) then createdirectory(ls_corrpath + "\" + string(ll_patid))
				ls_filename = ls_corrpath + "\" + string(ll_patid) + "\formulaire_assurance-" + string(ll_contactid) + "-" + string(today(),"dd-mm-yyyy") + ".pdf"
				ds_formnorm.saveas(ls_filename,PDF!, false)
				is_piecejointe[j] = ls_filename
				j++
		
			end if
		
		end if
			
	next

end if
	
end subroutine

on w_formdate.create
int iCurrent
call super::create
this.cbx_reception=create cbx_reception
this.cb_courriel=create cb_courriel
this.shl_2=create shl_2
this.shl_1=create shl_1
this.shl_unselect=create shl_unselect
this.shl_select=create shl_select
this.st_start=create st_start
this.cb_print=create cb_print
this.cb_1=create cb_1
this.st_end=create st_end
this.em_datedebut=create em_datedebut
this.em_datefin=create em_datefin
this.st_title=create st_title
this.cb_search=create cb_search
this.dw_formass=create dw_formass
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_reception
this.Control[iCurrent+2]=this.cb_courriel
this.Control[iCurrent+3]=this.shl_2
this.Control[iCurrent+4]=this.shl_1
this.Control[iCurrent+5]=this.shl_unselect
this.Control[iCurrent+6]=this.shl_select
this.Control[iCurrent+7]=this.st_start
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.st_end
this.Control[iCurrent+11]=this.em_datedebut
this.Control[iCurrent+12]=this.em_datefin
this.Control[iCurrent+13]=this.st_title
this.Control[iCurrent+14]=this.cb_search
this.Control[iCurrent+15]=this.dw_formass
end on

on w_formdate.destroy
call super::destroy
destroy(this.cbx_reception)
destroy(this.cb_courriel)
destroy(this.shl_2)
destroy(this.shl_1)
destroy(this.shl_unselect)
destroy(this.shl_select)
destroy(this.st_start)
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.st_end)
destroy(this.em_datedebut)
destroy(this.em_datefin)
destroy(this.st_title)
destroy(this.cb_search)
destroy(this.dw_formass)
end on

event open;call super::open;date ld_debut

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

ld_debut = date('01-01-1900')

em_datefin.text = string(today())
em_datedebut.text = string(ld_debut)
end event

type cbx_reception from checkbox within w_formdate
integer x = 2496
integer y = 8
integer width = 1147
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Demande de confirmation de reception"
end type

type cb_courriel from commandbutton within w_formdate
integer x = 512
integer y = 1912
integer width = 498
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Courriel"
end type

event clicked;//////////////////////////////////////////////////////
//
// Impression des formulaires normalisés automatique
//
//////////////////////////////////////////////////////

long ll_traitid, i, ll_contactid, ll_contactidold = 0, ll_traitidold = 0, ll_job, k, p, ll_nbcopies
long ll_contid, ll_copies, ll_copiesold, ll_courriel, ll_patid
long ll_idpers, ll_sleep,j = 1
string ls_langue, ls_typepaie, ls_courriel
string ls_email, ls_sujetfr, ls_sujetan, ls_messagefr, ls_messagean, ls_sujet, ls_message
string ls_nom, ls_filename, ls_msg, ls_body, ls_commandline, ls_nomemail, ls_nomordi, ls_nomreel, ls_foreignkey
date ldt_datepaie, ldt_debut, ldt_fin, ldt_datecpd
dec{2} ld_montant
boolean lb_premier = true
integer li_rc
long ll_confirmenvoi

of_creerpiecejointe()

for k = 1 to dw_formass.rowcount()
	
	if dw_formass.getItemNumber(k,'impform') = 1 then
		
		ll_traitid = dw_formass.getItemNumber(k,'traitements_traitement_id')
		ll_contactid = dw_formass.getItemNumber(k,'cont_id_contact')
		ld_montant = dw_formass.getItemNumber(k,'cont_mont')
		ldt_datepaie = dw_formass.getItemDate(k,'cont_datecpd')
		ls_langue = dw_formass.getItemString(k,'patient_langue')
		ll_courriel = dw_formass.getItemnumber(k, "courriel")
		select patient_id into :ll_patid from traitements where traitement_id = :ll_traitid;
//		ls_email = dw_formass.getItemString(k,'patient_email')
		
		SELECT ifnull(t_contact.email,patient.email,t_contact.email), isnull(t_contact.prenom,'') || ' ' || isnull(t_contact.nom,'') into :ls_email, :ls_nomreel
		from t_contact INNER JOIN patient ON patient.patient_id = t_contact.patient_id 
		where t_contact.id_contact = :ll_contactid;
		
		// Regarder si l'on envoie le formulaire par courriel
		
		if ll_courriel = 1 then
					
			if lb_premier then
				gnv_app.inv_entrepotglobal.of_ajoutedonnee("typecourrielaafficher",4)
				open(w_courriel)
				ls_sujetfr = gnv_app.inv_entrepotglobal.of_retournedonnee("sujetfrcourriel")
				ls_sujetan = gnv_app.inv_entrepotglobal.of_retournedonnee("sujetancourriel")
				ls_messagefr = gnv_app.inv_entrepotglobal.of_retournedonnee("messagefrcourriel")
				ls_messagean = gnv_app.inv_entrepotglobal.of_retournedonnee("messageancourriel")
				lb_premier = false
			end if
			if ls_langue = 'A' then
				ls_sujet = ls_sujetan
				ls_message = ls_messagean
			else
				ls_sujet = ls_sujetfr
				ls_message = ls_messagefr
			end if

			select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :gl_idpers;

			If ls_courriel = "" Then
				MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
				Return
			End If
					
			ls_body = "<html>"
			ls_body +="<head></head></html>"
			ls_body +="<body><PRE>"+ls_message+"</PRE></body>"
			ls_body +="</html>"
			
			select isnull(cie,dr_nom_complet) into :ls_nomemail from ortho_id where ortho_id = :v_no_ortho;
			
			// Générer la piece jointe
			ls_filename = rep(is_piecejointe[j],'\','\\')

			if FileExists(is_piecejointe[j])	then	
				
				ls_nomordi = gnv_app.of_obtenir_nom_ordinateur( )
				ls_foreignkey = 'P' + string(ll_patid)
				
				select confirmenvoi into :ll_confirmenvoi from t_options where ortho_id = :v_no_ortho;
				if ll_confirmenvoi = 1 then ls_email = ls_courriel + ";" + ls_email
				
				insert into t_message(dateenvoye, priorite, message_de, message_a, sujet, message_texte, fichier_attache, source, statut,
                      statut_lu, statut_affiche, typemessagerie, couleur, email, envoyer, sms, nomemail, id_user, nomordinateur, nomreel, idforeignkey)
				values(now(), 0, :ls_courriel, :ls_email, :ls_sujet, :ls_body, :ls_filename, 'e', 'a', 'o','o', 'U', 15780518, 1, 0, 0,:ls_nomemail,:gl_idpers, :ls_nomordi, :ls_nomreel, :ls_foreignkey);
				if gf_sqlerr() then
					commit using SQLCA;
				else
					rollback using SQLCA;
				end if

					
				if ls_typepaie = 'P' then
					update paiement set imp = 1 
					where 	date_paiement = :ldt_datecpd and
								id_contact = :ll_contid and
								traitement_patient_id = :ll_traitid;
				else
					update cheques_postdates set imp = 1 
					where  date_cheque = :ldt_datecpd and
							 id_contact = :ll_contid and
							 traitement_patient_id = :ll_traitid;
				end if
				
				if error_type(-1) = 1 then
					commit using SQLCA;
				else
					rollback using SQLCA;
				end if
									
			else
				
				if gnv_app.of_getlangue( ) = 'an' then
					ls_msg += ls_email + ": This email has not been send~r~n"
				else
					ls_msg += ls_email + ": Ce courriel n'a pu être envoyé~r~n"
				end if
				
			end if
			j++
			
		end if
		
	end if
next	

if len(ls_msg) > 0 then 
	messagebox("Information!",ls_msg)
else
	error_type(1021)
end if




end event

event constructor;if v_langue = 'an' then
	this.text = 'Email'
end if
end event

type shl_2 from statichyperlink within w_formdate
integer x = 2313
integer y = 1816
integer width = 626
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 16777215
string text = "Sélectionner courriel"
boolean focusrectangle = false
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_formass.rowcount()
	
	ls_courriel = dw_formass.getItemstring( i, "patient_email")
	if not (ls_courriel = "" or isnull(ls_courriel)) then 
		dw_formass.setItem(i,'impform',1)
	end if

next
end event

event constructor;if v_langue = 'an' then
	this.text = "Select email"
end if
end event

type shl_1 from statichyperlink within w_formdate
integer x = 1696
integer y = 1816
integer width = 590
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 16777215
string text = "Sélectionner papier"
boolean focusrectangle = false
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_formass.rowcount()
	
	ls_courriel = dw_formass.getItemstring( i, "patient_email")
	if ls_courriel = "" or isnull(ls_courriel) then 
		dw_formass.setItem(i,'impform',1)
	end if

next
end event

event constructor;if v_langue = 'an' then
	this.text = "Select paper"
end if
end event

type shl_unselect from statichyperlink within w_formdate
integer x = 2967
integer y = 1816
integer width = 576
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 16777215
string text = "Désélectionner tout"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Unselect all"
end if
end event

event clicked;long i

for i = 1 to dw_formass.rowcount()
	dw_formass.setItem(i,'impform',0)
next
end event

type shl_select from statichyperlink within w_formdate
integer x = 1152
integer y = 1816
integer width = 512
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 16777215
string text = "Sélectionner tout"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Select all"
end if
end event

event clicked;long i

for i = 1 to dw_formass.rowcount()
	dw_formass.setItem(i,'impform',1)
next
end event

type st_start from statictext within w_formdate
integer x = 1623
integer y = 1940
integer width = 201
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Début:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Start:'
end if
end event

type cb_print from commandbutton within w_formdate
integer x = 14
integer y = 1912
integer width = 498
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimante"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Printer'
end if
end event

event clicked;//////////////////////////////////////////////////////
//
// Impression des formulaires normalisés automatique
//
//////////////////////////////////////////////////////

long ll_traitid, i, ll_contactid, ll_contactidold = 0, ll_traitidold = 0, ll_job, k, p, ll_nbcopies
long ll_contid, ll_copies, ll_copiesold, ll_smtpport, ll_smtpauth, ll_logfile, ll_courriel
long ll_idpers
string ls_langue, ls_typepaie, ls_smtpserver, ls_smtpuserid, ls_smtppassword, ls_courriel
string ls_email, ls_sujetfr, ls_sujetan, ls_messagefr, ls_messagean, ls_sujet, ls_message
string ls_nom, ls_filename
date ldt_datepaie, ldt_debut, ldt_fin, ldt_datecpd
dec{2} ld_montant
boolean lb_premier = true
datastore ds_formnorm

ldt_debut = gf_emtodate(em_datedebut.text)
ldt_fin = gf_emtodate(em_datefin.text)

//printsetup()
ds_formnorm = create datastore

gb_imp = false
gb_datawindow = false
ds_formnorm.dataobject = 'd_formnormpaiefr'
openwithparm(w_print_options,ds_formnorm)
ds_formnorm = message.powerObjectParm
if isNull(ds_formnorm) then return
ll_job = PrintOpen("Formulaires normalisés")


for k = 1 to dw_formass.rowcount()
	
	if dw_formass.getItemNumber(k,'impform') = 1 then
		
		ll_traitid = dw_formass.getItemNumber(k,'traitements_traitement_id')
		ll_contactid = dw_formass.getItemNumber(k,'cont_id_contact')
		ls_langue = dw_formass.getItemString(k,'patient_langue')
		ll_nbcopies = dw_formass.getItemNumber(k,'nbcopies')
		
		if ls_langue = 'A' then
			ds_formnorm.dataobject = 'd_formnormenauto'
		else
			ds_formnorm.dataobject = 'd_formnormpaiefr'
		end if
	
		ds_formnorm.SetTransObject(SQLCA)
		ds_formnorm.retrieve(ll_traitid, ldt_debut, ldt_fin,ll_contactid)
			
		for p = 1 to ll_nbcopies
			PrintDataWindow(ll_job, ds_formnorm)
		next
						
			
	end if
next	


//ds_formnorm.print()
for p = 1 to ll_copiesold
	PrintDataWindow(ll_job, ds_formnorm)
next

PrintClose(ll_job)

destroy ds_formnorm

// On coche les paiements et les cheques postdatés deja imprimés

for i = 1 to dw_formass.rowcount()
	if dw_formass.getItemNumber(i,'impform') = 1 then
		
		ll_traitid = dw_formass.getItemNumber(i,'traitements_traitement_id')
		ll_contid = dw_formass.getItemNumber(i,'cont_id_contact')
		ldt_datecpd = dw_formass.getItemDate(i,'cont_datecpd')
		ls_typepaie = dw_formass.getItemString(i,'cont_typepaie')
		
		if ls_typepaie = 'P' then
			update paiement set imp = 1 
			where 	date_paiement = :ldt_datecpd and
						id_contact = :ll_contid and
						traitement_patient_id = :ll_traitid;
		else
			update cheques_postdates set imp = 1 
			where  date_cheque = :ldt_datecpd and
					 id_contact = :ll_contid and
					 traitement_patient_id = :ll_traitid;
		end if
		
		if error_type(-1) = 1 then
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
		
	end if
next
end event

type cb_1 from commandbutton within w_formdate
integer x = 2949
integer y = 1912
integer width = 690
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type st_end from statictext within w_formdate
integer x = 2313
integer y = 1944
integer width = 165
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'End'
end if
end event

type em_datedebut from editmask within w_formdate
integer x = 1838
integer y = 1928
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd-mm-yyyy"
boolean dropdowncalendar = true
end type

type em_datefin from editmask within w_formdate
integer x = 2491
integer y = 1928
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd-mm-yyyy"
boolean autoskip = true
boolean dropdowncalendar = true
end type

type st_title from statictext within w_formdate
integer x = 37
integer y = 20
integer width = 1202
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impression des formulaires d~'assurances "
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Print insurance forms"
end if
end event

type cb_search from commandbutton within w_formdate
integer x = 1010
integer y = 1912
integer width = 567
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event constructor;if v_langue = 'an' then
	this.text = "Search"
end if
end event

event clicked;date ldt_debut
date ldt_fin

setpointer(hourglass!)

ldt_debut = gf_emtodate(em_datedebut.text)
ldt_fin = gf_emtodate(em_datefin.text)

dw_formass.retrieve(v_no_ortho,ldt_debut,ldt_fin)
end event

type dw_formass from u_dw within w_formdate
integer x = 18
integer y = 104
integer width = 3611
integer height = 1788
integer taborder = 10
string dataobject = "d_formass"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;setTransObject(SQLCA)
end event

