$PBExportHeader$w_recuautodate.srw
forward
global type w_recuautodate from window
end type
type cbx_reception from checkbox within w_recuautodate
end type
type hpb_progress from hprogressbar within w_recuautodate
end type
type st_4 from statictext within w_recuautodate
end type
type st_3 from statictext within w_recuautodate
end type
type st_2 from statictext within w_recuautodate
end type
type st_1 from statictext within w_recuautodate
end type
type cb_1 from commandbutton within w_recuautodate
end type
type cb_2 from commandbutton within w_recuautodate
end type
type cb_printlist from commandbutton within w_recuautodate
end type
type dw_listrecuauto from u_dw within w_recuautodate
end type
type st_title from statictext within w_recuautodate
end type
type st_fin from statictext within w_recuautodate
end type
type shl_deb from statichyperlink within w_recuautodate
end type
type em_datedebut from editmask within w_recuautodate
end type
type cb_cancel from commandbutton within w_recuautodate
end type
type cb_print from commandbutton within w_recuautodate
end type
type em_datefin from editmask within w_recuautodate
end type
end forward

global type w_recuautodate from window
string tag = "recuauto"
integer width = 3657
integer height = 2052
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
cbx_reception cbx_reception
hpb_progress hpb_progress
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
cb_2 cb_2
cb_printlist cb_printlist
dw_listrecuauto dw_listrecuauto
st_title st_title
st_fin st_fin
shl_deb shl_deb
em_datedebut em_datedebut
cb_cancel cb_cancel
cb_print cb_print
em_datefin em_datefin
end type
global w_recuautodate w_recuautodate

type variables
int apercu = 1
boolean ib_courriel,ib_imp 
string is_piecejointe[]
end variables

forward prototypes
public subroutine of_creerpiecejointe ()
end prototypes

public subroutine of_creerpiecejointe ();//n_ds ds_recutot
//n_cst_courriel luo_courriel
//integer li_recutype
//long i,j = 1, ll_paieid, ll_imp, ll_patid, ll_courriel
//string ls_typetrans, ls_email, ls_corrpath, ls_filename
//
//luo_courriel = create n_cst_courriel
//ds_recutot = create n_ds
//
//long ll_recutype, ll_idcont, ll_traitid, ll_margeh, ll_margeg
//boolean lb_premier
//date ldt_debut, ldt_fin
//string ls_langue
//integer li_bac2
//ulong li_job
//
//select isnull(typerecu,1) into :ll_recutype from t_options where ortho_id = :v_no_ortho;
//
//if ll_recutype = 3 then // Recu qui ne sont pas des recus mais des factures
//
//	ds_recutot.dataobject = 'd_invoice'
//	ds_recutot.setTransObject(SQLCA)
//	j = 1
//	for i = 1 to dw_listrecuauto.rowcount()
//				
//		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
//			
//		if ll_imp = 1 then
//				
//			lb_premier = true
//			ll_paieid = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
//			ls_langue = dw_listrecuauto.getItemString(i,'patient_langue')
//			ll_patid = dw_listrecuauto.getItemNumber(i,'patient_patient_id')
//			ll_idcont = dw_listrecuauto.getItemNumber(i,'paiement_id_contact')
//			ll_courriel = dw_listrecuauto.getItemNumber(i,'courriel')
//			
//			select traitement_patient_id into :ll_traitid from paiement where paiement_id = :ll_paieid;
//			em_datedebut.getdata(ldt_debut)
//			em_datefin.getdata(ldt_fin)
//			gf_recuautoimporthocom(ds_recutot,ll_traitid,ls_langue,ll_patid,ll_idcont,ldt_debut,ldt_fin,false)			
//			if ll_imp = 1 and ll_courriel = 1 then
//				
//				ll_patid = dw_listrecuauto.getItemnumber(i, "patient_patient_id")
//				select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
//				if not  DirectoryExists(ls_corrpath + "\" + string(ll_patid)) then createdirectory(ls_corrpath + "\" + string(ll_patid))
//				ls_filename = ls_corrpath + "\" + string(ll_patid) + "\recu-" + string(today(),"dd-mm-yyyy") + "-" + string(ll_idcont) + ".pdf"
//				ds_recutot.saveas(ls_filename,PDF!, false)
//				is_piecejointe[j] = ls_filename
//				j++
//			
//			end if
//			
//			hpb_progress.stepit( )
//	
//		end if
//		
//	next
//		
//else // Autre recu
//	
//	CHOOSE CASE ll_recutype
//		CASE 1
//			ds_recutot.dataobject = 'd_recuimp'
//		CASE 2
//			ds_recutot.dataobject = 'd_recuparemail'
//		CASE 4
//			ds_recutot.dataobject = 'd_recu2sec'
//		CASE 5
//			ds_recutot.dataobject = 'd_recumodel2'
//	END CHOOSE
//	
//	ds_recutot.setTransobject(SQLCA)
//		
//	// BOUCLE PAIEMENT
//	
//	j = 1
//	for i = 1 to dw_listrecuauto.rowcount()
//				
//		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
//		ls_typetrans = dw_listrecuauto.getItemString(i,'typetrans')
//		ll_patid = dw_listrecuauto.getItemnumber(i, "patient_patient_id")
//		ll_courriel = dw_listrecuauto.getItemNumber(i,'courriel')
//			
//		if ll_imp = 1 and ll_courriel = 1 then
//		
//			ll_paieid = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
//			ll_idcont = dw_listrecuauto.getItemNumber(i,'paiement_id_contact')
//			if ls_typetrans = 'P' then
//				ds_recutot.retrieve('P',{ll_paieid},ll_idcont)
//			else
//				ds_recutot.retrieve('C',{ll_paieid},ll_idcont)
//			end if
//			
//			select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
//			if not  DirectoryExists(ls_corrpath + "\" + string(ll_patid)) then createdirectory(ls_corrpath + "\" + string(ll_patid))
//			ls_filename = ls_corrpath + "\" + string(ll_patid) + "\recu-" + string(today(),"dd-mm-yyyy") + "-" + string(ll_idcont) + ".pdf"
//			ds_recutot.saveas(ls_filename,PDF!, false)
//			is_piecejointe[j] = ls_filename
//			j++
//		
//		end if
//		
//	next	
//	
//end if	
//
//destroy ds_recutot	
end subroutine

on w_recuautodate.create
this.cbx_reception=create cbx_reception
this.hpb_progress=create hpb_progress
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_printlist=create cb_printlist
this.dw_listrecuauto=create dw_listrecuauto
this.st_title=create st_title
this.st_fin=create st_fin
this.shl_deb=create shl_deb
this.em_datedebut=create em_datedebut
this.cb_cancel=create cb_cancel
this.cb_print=create cb_print
this.em_datefin=create em_datefin
this.Control[]={this.cbx_reception,&
this.hpb_progress,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.cb_2,&
this.cb_printlist,&
this.dw_listrecuauto,&
this.st_title,&
this.st_fin,&
this.shl_deb,&
this.em_datedebut,&
this.cb_cancel,&
this.cb_print,&
this.em_datefin}
end on

on w_recuautodate.destroy
destroy(this.cbx_reception)
destroy(this.hpb_progress)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_printlist)
destroy(this.dw_listrecuauto)
destroy(this.st_title)
destroy(this.st_fin)
destroy(this.shl_deb)
destroy(this.em_datedebut)
destroy(this.cb_cancel)
destroy(this.cb_print)
destroy(this.em_datefin)
end on

event open;date ld_debut
long ll_courriel

ld_debut = date('01-01-1900')
select isnull(envoicourriel,0) into :ll_courriel from t_options where ortho_id = :v_no_ortho;
if ll_courriel = 1 then
	ib_courriel = true
else
	ib_courriel = false
end if
ib_imp = true
em_datefin.text = string(today())
em_datedebut.text = string(ld_debut)
//w_recuautodate.move(500,900)
end event

type cbx_reception from checkbox within w_recuautodate
integer x = 2656
integer y = 16
integer width = 960
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Demande de confirmation de reception"
end type

event constructor;if v_langue = 'an' then
	this.text = "Ask a confirmation of reception"
end if
end event

type hpb_progress from hprogressbar within w_recuautodate
integer x = 795
integer y = 1820
integer width = 1938
integer height = 64
unsignedinteger maxposition = 100
unsignedinteger position = 1
integer setstep = 1
end type

type st_4 from statictext within w_recuautodate
integer x = 3081
integer y = 96
integer width = 521
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "Desélectionner tous"
boolean focusrectangle = false
end type

event clicked;long i

for i = 1 to dw_listrecuauto.rowcount()
	dw_listrecuauto.setItem(i,'imp',0)
next
end event

event constructor;if v_langue = 'an' then
	this.text = "Unselect all"
end if
end event

type st_3 from statictext within w_recuautodate
integer x = 2459
integer y = 96
integer width = 571
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "Sélectionner courriel"
boolean focusrectangle = false
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_listrecuauto.rowcount()
	ls_courriel = dw_listrecuauto.getItemString(i,'patient_email')
	if not isnull(ls_courriel) and ls_courriel <> '' then 
		dw_listrecuauto.setItem(i,'imp',1)
	end if
next
end event

event constructor;if v_langue = 'an' then
	this.text = "Select email"
end if
end event

type st_2 from statictext within w_recuautodate
integer x = 1883
integer y = 96
integer width = 521
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "Sélectionner papier"
boolean focusrectangle = false
end type

event clicked;long i
string ls_courriel

for i = 1 to dw_listrecuauto.rowcount()
	ls_courriel = dw_listrecuauto.getItemString(i,'patient_email')
	if isnull(ls_courriel) or ls_courriel = '' then 
		dw_listrecuauto.setItem(i,'imp',1)
	end if
next
end event

event constructor;if v_langue = 'an' then
	this.text = "Select paper"
end if
end event

type st_1 from statictext within w_recuautodate
integer x = 1367
integer y = 96
integer width = 475
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "Sélectionner tous"
boolean focusrectangle = false
end type

event clicked;long i

for i = 1 to dw_listrecuauto.rowcount()
	dw_listrecuauto.setItem(i,'imp',1)
next
end event

event constructor;if v_langue = 'an' then
	this.text = "Select all"
end if
end event

type cb_1 from commandbutton within w_recuautodate
integer x = 1486
integer y = 1920
integer width = 421
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Courriel"
end type

event clicked;n_ds ds_recutot
n_cst_courriel luo_courriel
integer li_recutype
long i, ll_paieid, ll_imp, ll_patid, ll_courriel, ll_idcontact,ll_patrecu
string ls_typetrans, ls_email, ls_corrpath, ls_filename, ls_sujetfr, ls_sujetan, ls_messagefr, ls_messagean
string ls_sujet, ls_message, ls_courriel, ls_nomemail, ls_nomordi, ls_msg, ls_nomreel
long ll_recutype, ll_idcont, ll_idpers, ll_traitid, ll_confirmenvoi, ll_emailpatientrecu
boolean lb_premier
date ldt_debut, ldt_fin
string ls_langue, ls_body, ls_foreignkey


luo_courriel = create n_cst_courriel
ds_recutot = create n_ds

select isnull(typerecu,1), isnull(emailpatientrecu,0) into :ll_recutype, :ll_emailpatientrecu from t_options where ortho_id = :v_no_ortho;

if ll_recutype = 3 then // Recu qui ne sont pas des recus mais des factures

	ds_recutot.dataobject = 'd_invoice'
	ds_recutot.setTransObject(SQLCA)
	lb_premier = true

	for i = 1 to dw_listrecuauto.rowcount()
				
		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
			
		if ll_imp = 1 then
				
			ll_paieid = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
			ls_langue = dw_listrecuauto.getItemString(i,'patient_langue')
			ll_courriel = dw_listrecuauto.getItemNumber(i,'courriel')
			ls_typetrans = dw_listrecuauto.getItemString(i,'typetrans')
			ll_patid = dw_listrecuauto.getItemnumber(i, "patient_patient_id")
	
			select traitement_patient_id into :ll_traitid from paiement where paiement_id = :ll_paieid;
			em_datedebut.getdata(ldt_debut)
			em_datefin.getdata(ldt_fin)
			
			gf_recuautoimporthocom(ds_recutot,ll_traitid,ls_langue,ll_patid,ll_idcont,ldt_debut,ldt_fin,false)			
			if ll_imp = 1 and ll_courriel = 1 then

				ll_idcontact = dw_listrecuauto.getItemNumber(i,'paiement_id_contact')
								
				if ll_emailpatientrecu = 1 then
					SELECT if isnull(t_contact.email,'') = '' then patient.email else t_contact.email endif, isnull(patrecu,0), isnull(t_contact.prenom,'') || ' ' ||  isnull(t_contact.nom,'') into :ls_email, :ll_patrecu, :ls_nomreel
					from t_contact INNER JOIN patient ON patient.patient_id = t_contact.patient_id  
					where t_contact.id_contact = :ll_idcontact;
				else
					SELECT t_contact.email, isnull(patrecu,0), isnull(t_contact.prenom,'') || ' ' ||  isnull(t_contact.nom,'') 
					into :ls_email, :ll_patrecu, :ls_nomreel
					from t_contact INNER JOIN patient ON patient.patient_id = t_contact.patient_id 
					where t_contact.id_contact = :ll_idcontact;
				end if
				
				if ll_patrecu = 0 then
					if lb_premier then
						gnv_app.inv_entrepotglobal.of_ajoutedonnee("typecourrielaafficher",3)
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

					ll_idpers = gl_idpers
					select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :ll_idpers;
	
					If ls_courriel = "" Then
						MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
						Return
					End If
					
					ls_body = "<html>"
					ls_body +="<head></head></html>"
					ls_body +="<body><PRE>"+ls_message+"</PRE></body>"
					ls_body +="</html>"		
					
					select isnull(cie,dr_nom_complet) into :ls_nomemail from ortho_id where ortho_id = :v_no_ortho;
					
					
					select confirmenvoi into :ll_confirmenvoi from t_options where ortho_id = :v_no_ortho;
					if ll_confirmenvoi = 1 then ls_email = ls_courriel + ";" + ls_email
					
					select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
					if not  DirectoryExists(ls_corrpath + "\" + string(ll_patid)) then createdirectory(ls_corrpath + "\" + string(ll_patid))
					ls_filename = ls_corrpath + "\" + string(ll_patid) + "\recu-" + string(today(),"dd-mm-yyyy") + "-" + string(ll_idcont) + ".pdf"
					ds_recutot.saveas(ls_filename,PDF!, false)
					if FileExists(ls_filename) then 
						ls_nomordi = gnv_app.of_obtenir_nom_ordinateur( )
						ls_filename = rep(ls_filename,'\','\\')
						ls_foreignkey = "P" + string(ll_patid)
						
						insert into t_message(dateenvoye, priorite, message_de, message_a, sujet, message_texte, fichier_attache, source, statut,
								 statut_lu, statut_affiche, typemessagerie, couleur, email, envoyer, sms, nomemail, id_user, nomordinateur, nomreel, idforeignkey)
						values(now(), 0, :ls_courriel, :ls_email, :ls_sujet, :ls_body, :ls_filename, 'e', 'a', 'o','o', 'U', 15780518, 1, 0, 0, :ls_nomemail, :gl_idpers, :ls_nomordi, :ls_nomreel,:ls_foreignkey);
						if gf_sqlerr() then
							commit using SQLCA;
							if ls_typetrans = 'P'  then
								update paiement set recu = '1' where paiement_id = :ll_paieid;
							else
								update cheques_postdates set recu = '1' where cheques_postdates_id = :ll_paieid;
							end if
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
				end if		
			end if
			
			hpb_progress.stepit( )
	
		end if
		
	next
		
else // Autre recu
	
	CHOOSE CASE ll_recutype
		CASE 1
			ds_recutot.dataobject = 'd_recuimp'
		CASE 2
			ds_recutot.dataobject = 'd_recuparemail'
		CASE 4
			ds_recutot.dataobject = 'd_recu2sec'
		CASE 5
			ds_recutot.dataobject = 'd_recumodel2'
	END CHOOSE
	
	ds_recutot.setTransobject(SQLCA)
		
	// BOUCLE PAIEMENT
	
	lb_premier = true
	for i = 1 to dw_listrecuauto.rowcount()
				
		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
		ls_typetrans = dw_listrecuauto.getItemString(i,'typetrans')
		ll_patid = dw_listrecuauto.getItemnumber(i, "patient_patient_id")
		ll_courriel = dw_listrecuauto.getItemNumber(i,'courriel')
			
		if ll_imp = 1 and ll_courriel = 1 then
		
			ll_paieid = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
			ll_idcont = dw_listrecuauto.getItemNumber(i,'paiement_id_contact')
			if ls_typetrans = 'P' then
				ds_recutot.retrieve('P',{ll_paieid},ll_idcont)
			else
				ds_recutot.retrieve('C',{ll_paieid},ll_idcont)
			end if
			
			if ll_emailpatientrecu = 1 then

				SELECT if isnull(t_contact.email,'') = '' then patient.email else t_contact.email endif, isnull(patrecu,0), isnull(t_contact.prenom,'') || ' ' ||  isnull(t_contact.nom,'') into :ls_email, :ll_patrecu, :ls_nomreel
				from t_contact INNER JOIN patient ON patient.patient_id = t_contact.patient_id 
				where t_contact.id_contact = :ll_idcont;
				
			else
				
				SELECT if isnull(t_contact.email,'') = '' then patient.email else t_contact.email endif, isnull(patrecu,0), isnull(t_contact.prenom,'') || ' ' ||  isnull(t_contact.nom,'') into :ls_email, :ll_patrecu, :ls_nomreel
				from t_contact INNER JOIN patient ON patient.patient_id = t_contact.patient_id 
				where t_contact.id_contact = :ll_idcont;
				
			end if
				
				//messagebox("fsdfdfdf",ls_email)
					
				if ll_patrecu = 0 then
					if lb_premier then
						gnv_app.inv_entrepotglobal.of_ajoutedonnee("typecourrielaafficher",3)
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

					ll_idpers = gl_idpers
					select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :ll_idpers;
	
					If ls_courriel = "" Then
						MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
						Return
					End If
					
					//messagebox("2",ls_email)
				
					ls_body = "<html>"
					ls_body +="<head></head></html>"
					ls_body +="<body><PRE>"+ls_message+"</PRE></body>"
					ls_body +="</html>"		
					
					select isnull(cie,dr_nom_complet) into :ls_nomemail from ortho_id where ortho_id = :v_no_ortho;
					
					select confirmenvoi into :ll_confirmenvoi from t_options where ortho_id = :v_no_ortho;
					if ll_confirmenvoi = 1 then ls_email = ls_courriel + ";" + ls_email
					
					select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
					if not  DirectoryExists(ls_corrpath + "\" + string(ll_patid)) then createdirectory(ls_corrpath + "\" + string(ll_patid))
					ls_filename = ls_corrpath + "\" + string(ll_patid) + "\recu-" + string(today(),"dd-mm-yyyy") + "-" + string(ll_idcont) + ".pdf"
					ds_recutot.saveas(ls_filename,PDF!, false)
										
					if FileExists(ls_filename) then
						
						ls_filename = rep(ls_filename,'\','\\')
						ls_nomordi = gnv_app.of_obtenir_nom_ordinateur( )
						ls_foreignkey = "P" + string(ll_patid)
						
						insert into t_message(dateenvoye, priorite, message_de, message_a, sujet, message_texte, fichier_attache, source, statut,
								 statut_lu, statut_affiche, typemessagerie, couleur, email, envoyer, sms, nomemail, id_user, nomordinateur, idforeignkey)
						values(now(), 0, :ls_courriel, :ls_email, :ls_sujet, :ls_body, :ls_filename, 'e', 'a', 'o','o', 'U', 15780518, 1, 0, 0, :ls_nomemail, :gl_idpers, :ls_nomordi, :ls_foreignkey);
						if gf_sqlerr() then
							commit using SQLCA;
							if ls_typetrans = 'P'  then
								update paiement set recu = '1' where paiement_id = :ll_paieid;
							else
								update cheques_postdates set recu = '1' where cheques_postdates_id = :ll_paieid;
							end if
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
				end if
		end if
		
	next	
	
end if	

destroy ds_recutot	
end event

event constructor;if v_langue = 'an' then
	this.text = 'Email'
end if
end event

type cb_2 from commandbutton within w_recuautodate
integer x = 1038
integer y = 1920
integer width = 448
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimante"
end type

event clicked;long ll_recutype, i, ll_imp, ll_paieid, ll_patid, ll_idcont, ll_traitid, ll_margeh, ll_margeg
long ll_cpdidtab[], ll_paieidtab[], j
boolean lb_premier
date ldt_debut, ldt_fin
string ls_langue, ls_nom, ls_prenom, ls_typetrans
integer li_bac2
ulong li_job

datastore ds_recutot

ds_recutot = create datastore

select isnull(typerecu,1) into :ll_recutype from t_options where ortho_id = :v_no_ortho;

if ll_recutype = 3 then // Recu qui ne sont pas des recus mais des factures

	ds_recutot.dataobject = 'd_invoice'
	ds_recutot.setTransObject(SQLCA)
	li_job = PrintOpen("Liste des recus", true)
	
	for i = 1 to dw_listrecuauto.rowcount()
				
		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
			
		if ll_imp = 1 then
				
			lb_premier = true
			ll_paieid = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
			ls_langue = dw_listrecuauto.getItemString(i,'patient_langue')
			ll_patid = dw_listrecuauto.getItemNumber(i,'patient_patient_id')
			ll_idcont = dw_listrecuauto.getItemNumber(i,'paiement_id_contact')
//			ls_nom = dw_listrecuauto.getItemString(i,'patient_patient_nom') 
//			ls_prenom = dw_listrecuauto.getItemString(i,'patient_patient_prenom')
			select traitement_patient_id into :ll_traitid from paiement where paiement_id = :ll_paieid;
			em_datedebut.getdata(ldt_debut)
			em_datefin.getdata(ldt_fin)
			gf_recuautoimporthocom(ds_recutot,ll_traitid,ls_langue,ll_patid,ll_idcont,ldt_debut,ldt_fin,true)			
			ds_recutot.object.datawindow.print.Paper.Source = li_bac2
			ds_recutot.object.datawindow.print.margin.top = 400
			ds_recutot.object.datawindow.print.margin.left = ll_margeg
			Printdatawindow(li_job,ds_recutot)
//			ds_recutot.print()
			hpb_progress.stepit( )
	
		end if
		
	next
	
	PrintClose(li_job)
	
	
else // Autre recu
	
	CHOOSE CASE ll_recutype
		CASE 1
			ds_recutot.dataobject = 'd_recuimpauto'
		CASE 2
			ds_recutot.dataobject = 'd_recunueimpauto'
		CASE 4
			ds_recutot.dataobject = 'd_recu2secauto'
		CASE 5
			ds_recutot.dataobject = 'd_recumodel2auto'
		CASE 6
			ds_recutot.dataobject = 'd_recuimp2auto'
	END CHOOSE
	
	ds_recutot.setTransobject(SQLCA)
	
	// BOUCLE PAIEMENT
	
	j = 1
	for i = 1 to dw_listrecuauto.rowcount()
				
		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
		ls_typetrans = dw_listrecuauto.getItemString(i,'typetrans')
			
		if ll_imp = 1 and ls_typetrans = 'P' then
			ll_paieidtab[j] = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
			j++
		end if
		
	next
	
	// BOUCLE POSTDATES
	
	j = 1
	for i = 1 to dw_listrecuauto.rowcount()
				
		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
		ls_typetrans = dw_listrecuauto.getItemString(i,'typetrans')
			
		if ll_imp = 1 and ls_typetrans <> 'P' then
			ll_cpdidtab[j] = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
			j++
		end if
		
	next
	
	if ds_recutot.retrieve('P',ll_paieidtab) > 0 then
		openwithparm(w_print_options,ds_recutot)
	end if
	
	if ds_recutot.retrieve('C',ll_cpdidtab) > 0 then
		openwithparm(w_print_options,ds_recutot)
	end if
	
end if	

destroy ds_recutot

// Cocher les recus si l'impression a été un succès
	
if error_type(205) = 1 then

	for i = 1 to dw_listrecuauto.rowcount()
		
		ll_paieid = dw_listrecuauto.getItemNumber(i,'paiement_paiement_id')
		ls_typetrans = dw_listrecuauto.getItemString(i,'typetrans')
		ll_imp = dw_listrecuauto.getItemNumber(i,'imp')
		
		if ll_imp = 1 then
			if ls_typetrans = 'P'  then
				update paiement set recu = '1' where paiement_id = :ll_paieid;
			else
				update cheques_postdates set recu = '1' where cheques_postdates_id = :ll_paieid;
			end if
			if error_type(-1) = 1 then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
		end if
		
	next
	
end if

end event

event constructor;if v_langue = 'an' then
	this.text = 'Print receipt'
end if
end event

type cb_printlist from commandbutton within w_recuautodate
integer x = 521
integer y = 1920
integer width = 512
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer liste"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_listrecuauto)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print list'
end if
end event

type dw_listrecuauto from u_dw within w_recuautodate
integer x = 5
integer y = 164
integer width = 3616
integer height = 1740
integer taborder = 40
string dataobject = "d_listrecuauto"
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;CHOOSE CASE dwo.name
	CASE 'imp'
		if long(data) = 0 then
			setItem(row,'courriel',0)
		end if
	CASE 'courriel'
		if long(data) = 1 then
			setItem(row,'imp',1)
		end if		
END CHOOSE
end event

event clicked;call super::clicked;long i
string ls_courriel

setPointer(hourglass!)

if rowcount() > 0 then

	setRedraw(false)
	CHOOSE CASE dwo.name
		CASE 't_imp'
			
			if ib_imp then
				
				for i = 1 to rowcount()
					setItem(i,'imp',1)
				next
				ib_imp = false
				
			else
				
				for i = 1 to rowcount()
					setItem(i,'imp',0)
					setItem(i,'courriel',0)
				next
				ib_imp = true
				
			end if
			
		CASE 't_courriel'
			
			if ib_courriel then
				for i = 1 to rowcount()
					ls_courriel = getItemString(i,'patient_email')
					if not isnull(ls_courriel) and ls_courriel <> '' then 
						setItem(i,'courriel',1)
						setItem(i,'imp',1)
					end if
				next
				ib_courriel = false
			else
				for i = 1 to rowcount()
					setItem(i,'courriel',0)
				next
				ib_courriel = true
			end if
			
		CASE 'patient_patient_nom_t'
			setsort("cp_nompat A")
			sort()
		CASE'compute_0010_t'
			setsort("contact A")
			sort()
	END CHOOSE
	setRedraw(true)
end if
end event

type st_title from statictext within w_recuautodate
integer x = 18
integer y = 24
integer width = 1326
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

event constructor;string ls_ortho

select dr_nom_complet into :ls_ortho from ortho_id where ortho_id = :v_no_ortho;
if v_langue = 'an' then
	st_title.text = ls_ortho + " Receipt's"
else
	st_title.text = "Reçus de " + ls_ortho
end if
end event

type st_fin from statictext within w_recuautodate
integer x = 2665
integer y = 1944
integer width = 128
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
	this.text = "End:"
end if
end event

type shl_deb from statichyperlink within w_recuautodate
integer x = 1934
integer y = 1948
integer width = 197
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 67108864
string text = "Début:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Start:"
end if
end event

type em_datedebut from editmask within w_recuautodate
integer x = 2149
integer y = 1928
integer width = 402
integer height = 96
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

type cb_cancel from commandbutton within w_recuautodate
integer x = 3250
integer y = 1920
integer width = 375
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(w_recuautodate)
end event

event constructor;if v_langue = 'an' then
	cb_cancel.text = 'Close'
end if
end event

type cb_print from commandbutton within w_recuautodate
integer x = 9
integer y = 1920
integer width = 512
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date ldt_debut, ldt_fin
long i

em_datedebut.getdata(ldt_debut)
em_datefin.getdata(ldt_fin)
dw_listrecuauto.retrieve(v_no_ortho,ldt_debut,ldt_fin)

end event

event constructor;if v_langue = 'an' then
	cb_print.text = 'Search'
end if
end event

type em_datefin from editmask within w_recuautodate
integer x = 2816
integer y = 1928
integer width = 416
integer height = 96
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

