$PBExportHeader$w_envoidpa.srw
forward
global type w_envoidpa from w_child
end type
type st_3 from statictext within w_envoidpa
end type
type em_date from editmask within w_envoidpa
end type
type cbx_date from checkbox within w_envoidpa
end type
type cb_1 from commandbutton within w_envoidpa
end type
type dw_sat from uo_sat within w_envoidpa
end type
type cb_export from commandbutton within w_envoidpa
end type
type cb_close from commandbutton within w_envoidpa
end type
type st_2 from statictext within w_envoidpa
end type
type st_1 from statictext within w_envoidpa
end type
type cb_find from commandbutton within w_envoidpa
end type
type cb_print from commandbutton within w_envoidpa
end type
type dw_cheques_postdates from u_dw within w_envoidpa
end type
type em_fin from editmask within w_envoidpa
end type
type em_debut from editmask within w_envoidpa
end type
end forward

global type w_envoidpa from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
st_3 st_3
em_date em_date
cbx_date cbx_date
cb_1 cb_1
dw_sat dw_sat
cb_export cb_export
cb_close cb_close
st_2 st_2
st_1 st_1
cb_find cb_find
cb_print cb_print
dw_cheques_postdates dw_cheques_postdates
em_fin em_fin
em_debut em_debut
end type
global w_envoidpa w_envoidpa

type variables

end variables

forward prototypes
public subroutine of_td ()
public subroutine of_rbc2 ()
public subroutine of_rbc (string as_file)
public subroutine of_bn (string as_filename)
public subroutine of_bs (string as_filename)
public function string of_formatacp (long al_banque)
end prototypes

public subroutine of_td ();integer li_FileNum
date ldt_debut, ldt_fin, ldt_expdate
string ls_linefich, ls_nocarte, ls_mod, ls_expdate, ls_expdatejj, ls_expdatemm, ls_jj, ls_mm, ls_aaaa, ls_debut, ls_fin
string ls_chemintd, ls_dospat, ls_nomterm, ls_noseqtd,ls_chemfile
long i, ll_cpdid, ll_seqtd
dec{2} ld_montant

ldt_debut = gf_emtodate(em_debut.text)
ldt_fin = gf_emtodate(em_fin.text)
day(ldt_debut)

ls_jj = string(day(ldt_debut))
if len(ls_jj) = 1 then ls_jj = '0' + ls_jj
ls_mm = string(month(ldt_debut))
if len(ls_mm) = 1 then ls_mm = '0' + ls_mm
ls_aaaa = string(year(ldt_debut))
ls_debut = ls_jj + ls_mm + ls_aaaa
ls_jj = string(day(ldt_fin))
if len(ls_jj) = 1 then ls_jj = '0' + ls_jj
ls_mm = string(month(ldt_fin))
if len(ls_mm) = 1 then ls_mm = '0' + ls_mm
ls_aaaa = string(year(ldt_fin))
ls_fin = ls_jj + ls_mm + ls_aaaa

// Faire le nom du ficher

select terminaltd, noseqencetd, chemintd 
into :ls_nomterm, :ll_seqtd, :ls_chemintd
from t_options where ortho_id = :v_no_ortho;

// Vérifier si le client veut vraiment continuer avec l'importation 

if error_type(262) = 1 then

	ll_seqtd++
	if ll_seqtd = 100 then ll_seqtd = 0
	ls_noseqtd = remplir(string(ll_seqtd),2,'0',true)
	update t_options set noseqencetd = :ll_seqtd where ortho_id = :v_no_ortho;
	ls_chemfile = ls_chemintd + "\" + ls_nomterm + "-I" + ls_noseqtd + ".txt"
	
	li_FileNum = FileOpen(ls_chemfile, Linemode!, Write!, LockWrite!, Replace!)
	
	for i = 1 to dw_cheques_postdates.rowcount()
		
		ls_nocarte = dw_cheques_postdates.getItemString(i,'cheques_postdates_nocarte')
		ldt_expdate = dw_cheques_postdates.getItemDate(i,'cheques_postdates_datecarte')
		ld_montant = dw_cheques_postdates.getItemNumber(i,'cheques_postdates_paiement')
	//	ll_cpdid = dw_cheques_postdates.getItemNumber(i,'cheques_postdates_cheques_postdates_id')
		ls_mod = dw_cheques_postdates.getItemString(i,'cheques_postdates_modalite')
		ls_dospat = dw_cheques_postdates.getItemString(i,'patient_new_dossier')
		if ls_mod = 'pVisa' or ls_mod = 'pMasterCard' or ls_mod = 'pAmex' then
			ls_linefich = ",,,,"
			ls_linefich += ls_nocarte + ','
			ls_expdatejj = right(string(year(ldt_expdate)),2)
			ls_expdatemm = string(month(ldt_expdate))
			if len(ls_expdatemm) = 1 then ls_expdatemm = '0' + ls_expdatemm
			ls_expdate = ls_expdatemm + ls_expdatejj
			ls_linefich += ls_expdate + ','
			ls_linefich += string(ld_montant) + ','
	//		ls_linefich += string(ll_cpdid)
			ls_linefich += ls_dospat
			filewrite(li_FileNum,ls_linefich)
		end if
	next
	
	
	Fileclose(li_FileNum)
end if
end subroutine

public subroutine of_rbc2 ();n_cst_datetime lnv_time
n_cst_string lnv_string
string ls_enregtete, ls1_01, ls1_02, ls1_03, ls1_04, ls1_05, ls1_06, ls1_07, ls1_08, ls1_09, ls1_10, ls1_11
string ls_mouvdebit, ls2_01, ls2_02, ls2_03, ls2_04, ls2_05, ls2_06, ls2_07, ls2_08, ls2_09, ls2_10, ls2_11,ls2_12, ls2_13, ls2_14, ls2_15, ls2_16, ls2_17, ls2_18, ls2_19, ls2_20, ls2_21, ls2_22, ls2_23, ls2_24 ,ls2_25, ls2_26, ls2_27, ls2_28, ls2_29
string ls_msgerr, ls4_01, ls4_02, ls4_03, ls4_04, ls4_05, ls4_06, ls4_07, ls4_08, ls4_09, ls4_10, ls4_11, ls4_12, ls4_13
string ls_artfin, ls3_01, ls3_02, ls3_03, ls3_04, ls3_05, ls3_06, ls3_07, ls3_08, ls3_09, ls3_10, ls3_11, ls3_12,ls3_13, ls3_14, ls3_15, ls3_16, ls3_17, ls3_18
string ls_aajjj, ls_nopaiement, ls_trait, ls_patnoinst, ls_patnosccu, ls_patnocomp, ls_paie,ls_jjmmaaaa, ls_modal
string ls_montotal,ll_nbtotalligne
string ls_comptespec,ls_nomclient, ls_nocreationfich, ls_noclientrbc, ls_chemfile,ls_nomclientfich,ls_modalite
integer ld_montant, ld_montanttotal,li_FileNum
long ll_nocreationfich,i, ll_idcheque, ll_envoitrait

ls_noclientrbc = remplir(dw_cheques_postdates.getitemstring(1,'noclientrbc'), 10, " ",false)
ls_nomclient = remplir(dw_cheques_postdates.getitemstring(1,'nomcompletrbc'), 30, " ",false)


IF isnull(ls_noclientrbc) OR LEN(ls_noclientrbc) <> 10 OR isnull(ls_nomclient) OR LEN(ls_nomclient) = 0 THEN
	error_type(161)
ELSE
	//------------------------------------------------------------------------------------------------------
	// CRÉATION DU FICHIER
	//------------------------------------------------------------------------------------------------------
	SELECT nofichierrbc INTO :ls_nocreationfich FROM t_options WHERE ortho_id = :v_no_ortho;
		ll_nocreationfich = long(ls_nocreationfich)
	IF isnull(ll_nocreationfich) OR ll_nocreationfich = 9999 THEN
		ll_nocreationfich = 1
	ELSE
		ll_nocreationfich++
	END IF
	ls_nocreationfich = remplir(string(ll_nocreationfich),4,"0",true)
	ls_jjmmaaaa = remplir(string(day(today())),2,"0",true) + remplir(string(month(today())),2,"0",true) + string(year(today()))
	ls_chemfile = "C:\ii4net\orthotek\exportation\rbc"+ls_jjmmaaaa+ls_nomclientfich+ls_nocreationfich+".txt"
	li_FileNum = FileOpen(ls_chemfile, Linemode!, Write!, LockWrite!, Replace!) 
			
	//------------------------------------------------------------------------------------------------------
	// ENREGISTREMENT EN-TÊTE
	//------------------------------------------------------------------------------------------------------

	ls_aajjj = mid(string(year(today())),3,4) + string(lnv_time.of_juliandaynumber(today()))
	ls_trait = string(month(today())) + remplir(string(day(today())),2,"0",true) + string(year(today()))
	//------------------------------------------------------------------------------------------------------
	ls1_01 = '0'                                                                     //Type d'enregistrement' 
	ls1_02 = '000'                                                                //Caractère de remplissage
	ls1_03 = ls_noclientrbc                                           //Récupération du numéro de client RBC
	ls1_04 = '0'                                                                  //Caractère de remplissage
	ls1_05 = '001'                                                              //Type de services (PPA CAD)
	ls1_06 = ls_aajjj               //Numéro de création du fichier FORMAT : AAJJJ (selon calendrier julien)
	ls1_07 = '  '                                                   //Caractère de remplissage (espaces = 2)
	ls1_08 = ls_trait                                                       //Date de traitement (MMJJAAAA)
	ls1_09 = ls1_03                                                                      //Identique a LS_03
	ls1_10 = '01'                                                               //Type de fichier de données
	ls1_11 = '                                                                                                                                                 '
	ls_enregtete = ls1_01 + ls1_02 + ls1_03 + ls1_04 + ls1_05 + ls1_06 + ls1_07 + ls1_08 + ls1_09 + ls1_10 
	ls_enregtete +=ls1_11
	filewrite(li_FileNum,ls_enregtete)
	//------------------------------------------------------------------------------------------------------
	
	
	FOR i = 1 TO dw_cheques_postdates.rowcount()	
		//------------------------------------------------------------------------------------------------------
		// ENREGISTREMENT MOUVEMENT DE DÉBIT
		//------------------------------------------------------------------------------------------------------							
		ll_idcheque = dw_cheques_postdates.getitemnumber( i,'cheques_postdates_cheques_postdates_id')
		SELECT isnull(envoitrait,0) INTO :ll_envoitrait FROM cheques_postdates WHERE cheques_postdates_id = :ll_idcheque; 
		
				
		SELECT dr_compte INTO :ls_comptespec FROM ortho_id WHERE ortho_id = :v_no_ortho;
		ls_comptespec = remplir(ls_comptespec, 19, " ",false)
		

		ls_nomclient = remplir(ls_nomclient, 30, " ",false)
		
		ls_nopaiement = remplir(string(dw_cheques_postdates.getitemnumber(i,'no_paiement')),2,"0",true)
		
		ls_patnoinst = dw_cheques_postdates.getitemstring(i,'t_contact_noinstitution')
		ls_patnosccu = dw_cheques_postdates.getitemstring(i,'t_contact_nosuccursale')
		ls_patnocomp = dw_cheques_postdates.getitemstring(i,'t_contact_nocompte')	
		ls_modalite = dw_cheques_postdates.getitemstring( i,'cheques_postdates_modalite')			
		ls_paie = remplir( string(dw_cheques_postdates.getitemnumber(i,'cheques_postdates_paiement')), 14, " ",false)
		ls_trait = string(dw_cheques_postdates.getitemstring(i,'cheques_postdates_date_cheque'),"mmddyyyy")
		
		ld_montanttotal = ld_montanttotal + dw_cheques_postdates.getitemnumber(i,'cheques_postdates_paiement')
		
		IF isnull(ls_patnoinst) OR trim(ls_patnoinst) = "" OR isnull(ls_patnosccu) OR trim(ls_patnosccu) = "" OR isnull(ls_patnocomp) OR trim(ls_patnocomp)="" OR ls_modalite <> "pPD" THEN
			dw_cheques_postdates.setitem(i, "couleur",rgb(255,0,0))
		ELSEIF ll_envoitrait = 0 THEN
			//------------------------------------------------------------------------------------------------------
			ls2_01 = '1'                                                                     //Type d'enregistrement
			ls2_02 = '000'                                                        //Caractère de remplissage (0 = 3)
			ls2_03 = ls_noclientrbc                                           //Récupération du numéro de client RBC
			ls2_04 = '0'                                                          //Caractère de remplissage (0 = 1)
			ls2_05 = '001'                                                                         //Type de service
			ls2_06 = '0'	                                                       //Caractère de remplissage (0 = 1)
			ls2_07 = ls_nocreationfich                                               //Numéro de création du fichier
			ls2_08 = '  '                                                    //Caractère de remplissage (espace = 2)
			ls2_09 = 'D'                                                                          //Type de paiement
			ls2_10 = '0'	                                                //Type d'enregistrement (mouvement debit)
			ls2_11 = '           '                                          //Caractère de remplissage (espace = 11)
			ls2_12 = ls_comptespec
			ls2_13 = '      '                                                //Caractère de remplissage (espace = 6)
			ls2_14 = ls_nomclient                                                              //Nom du bénéficiaire
			ls2_15 = ls_trait
			ls2_16 = '00'                                                         //Caractère de remplissage (0 = 2)
			ls2_17 = ls_nopaiement                                                      //Numéro de paiement (00-99)
			ls2_18 = '     '                                                 //Caractère de remplissage (espace = 5)
			ls2_19 = ls_patnoinst                                              //Numéro de l'établissement financier
			ls2_20 = ls_patnosccu                                                 	          //Numéro de succursale
			ls2_21 = ls_patnocomp               	                                               //Numéro de compte
			ls2_22 = 'CAD'                                                                                 //Monnaie
			ls2_23 = 'CAN'                                                                     //Pays de destination
			ls2_24 = ls_paie                                                         //Montant du paiement à débiter
			ls2_25 = '00000000'                                                   //Caractère de remplissage (0 = 8)
			ls2_26 ='Traitement dentaire'
			ls2_27 = ' '                                                //État du paiement (blanc = paiement valide)
			ls2_28 = 'ACH'                                                                        //Code d'opération
			ls2_29 = '      '                                                //Caractère de remplissage (espace = 6)
			ls_mouvdebit = ls2_01 + ls2_02 + ls2_03 + ls2_04 + ls2_05 + ls2_06 + ls2_07 + ls2_08 + ls2_09 + ls2_10 
			ls_mouvdebit +=ls2_11 + ls2_12 + ls2_13 + ls2_14 + ls2_15 + ls2_16 + ls2_17 + ls2_18 + ls2_19 + ls2_20 
			ls_mouvdebit +=ls2_21 + ls2_22 + ls2_23 + ls2_24 + ls2_25 + ls2_26 + ls2_27 + ls2_28 + ls2_29
			
			filewrite(li_FileNum,ls_mouvdebit)
		
			//------------------------------------------------------------------------------------------------------
			// MESSAGE D'ERREUR
			//------------------------------------------------------------------------------------------------------
			
			ls4_01 = '1'                                                                     //Type d'enregistrement' 
			ls4_02 = '000'                                                                //Caractère de remplissage
			ls4_03 = ls_noclientrbc                                           //Récupération du numéro de client RBC
			ls4_04 = '0'                                                                  //Caractère de remplissage
			ls4_05 = '001'                                                              //Type de services (PPA CAD)
			ls4_06 = '0'              //Numéro de création du fichier FORMAT : AAJJJ (selon calendrier julien)
			ls4_07 = ls_aajjj                                                  //Caractère de remplissage (espaces = 2)
			ls4_08 = '  '                                                      //Date de traitement (MMJJAAAA)
			ls4_09 = 'D'                                                                      //Identique a LS_03
			ls4_10 = '3'                                                               //Type de fichier de données
			ls4_11 = '                                                                                                                                                 '
			ls4_12 = '3'
			ls4_13 = '                                                                               '
			ls_enregtete = ls4_01 + ls4_02 + ls4_03 + ls4_04 + ls4_05 + ls4_06 + ls4_07 + ls4_08 + ls4_09 + ls4_10 
			ls_enregtete +=ls4_11 + ls4_12 + ls4_13
			filewrite(li_FileNum,ls_enregtete)
		
			// On met à jour la table pour ne pas ajouter dans un autre fichier la même ligne
			UPDATE cheques_postdates SET envoitrait = 1 WHERE cheques_postdates_id =: ll_idcheque;
			IF sqlca.sqlcode <> 0 THEN
				messagebox("erreur",+sqlca.sqlerrtext)
			END IF
			COMMIT USING sqlca;
		END IF
	NEXT
		//------------------------------------------------------------------------------------------------------
		// ARTICLE FIN DU CLIENT
		//------------------------------------------------------------------------------------------------------
		ls_montotal = remplir(string(ld_montanttotal), 8, " ",false)
		ll_nbtotalligne = remplir(string(dw_cheques_postdates.rowcount()), 8, " ",false)
		//------------------------------------------------------------------------------------------------------
		ls3_01 = '4'                                                                     //Type d'enregistrement
		ls3_02 = '000'	                                                       //Caractère de remplissage (0 = 3)
		ls3_03 = ls_noclientrbc                                                               //Numéro du client
		ls3_04 = '0'                                                          //Caractère de remplissage (0 = 1)
		ls3_05 = '001'                                                                         //Type de service
		ls3_06 = ls_aajjj               //Numéro de création du fichier FORMAT : AAJJJ (selon calendrier julien)
		ls3_07 = '  '                                                    //Caractère de remplissage (espace = 2)
		ls3_08 = '                                                    ' //Caractère de remplissage (espace = 52)
		ls3_09 = '   '                                                   //Caractère de remplissage (espace = 3)
		ls3_10 = '00000000' 
		ls3_11 = '00000000'
		ls3_12 = '00000000000000000000000000'                                //Caractère de remplissage (0 = 26)
		ls3_13 = ll_nbtotalligne                                         //Nombre total d'enregistrement
		ls3_14 = ls_montotal                                                    //Montant total d'enregistrement
		ls3_15 = '00000000'
		ls3_16 = '00000000'		                                              //Caractère de remplissage (0 = 8)
		ls3_17 = '00000000'		                                              //Caractère de remplissage (0 = 8)
		ls3_18 = '00000000'
		ls_artfin = ls3_01 + ls3_02 + ls3_03 + ls3_04 + ls3_05 + ls3_06 + ls3_07 + ls3_08 + ls3_09 + ls3_10 
		ls_artfin +=ls3_11 + ls3_12 + ls3_13 + ls3_14 + ls3_15 + ls3_16 + ls3_17 + ls3_18
		
		filewrite(li_FileNum,ls_artfin)
	fileclose(li_FileNum)	
	
	// Si on a pas de paiements dans le fichier on supprime et on remet le compteur à la meme valeur
		 if dw_cheques_postdates.rowcount() = 0 then
			ll_nocreationfich = ll_nocreationfich - 1
			fileDelete(ls_chemfile)
			error_type(163)
		end if
		 
		// Enregistrement du numéro de création du fichier
		 ls_nocreationfich = string(ll_nocreationfich)	  
		 update t_options set nofichierrbc =:ls_nocreationfich;
		 if sqlca.sqlcode <> 0 then
		 	messagebox("erreur",+sqlca.sqlerrtext)
		 end if
		 commit using sqlca;
END IF
end subroutine

public subroutine of_rbc (string as_file);integer li_FileNum
string ls_filestring, ls_entete

// On récupère le contenu du ficher

li_FileNum = FileOpen(as_file, TextMode!)
FileReadEx(li_FileNum, ls_filestring)
FileClose(li_FileNum)

select isnull(nomfichierbn,'$$AAPACPA1464[TEST[NL$$') into :ls_entete from t_options where ortho_id = :v_no_ortho;
ls_filestring = ls_entete + "~r~n" + ls_filestring

li_FileNum = FileOpen(as_file, TextMode!, Write!, LockReadWrite!, Replace!)
FileWriteEx(li_FileNum, ls_filestring)
FileClose(li_FileNum)


//n_cst_datetime lnv_time
//n_cst_string lnv_string
//integer li_FileNum
//date ldt_datejour, ldt_datepaie
//string ls_linefich, ls_aaaa, ls_datejour, ls_linefichfin, ls_langue, ls_noenr, ls_noclientrbc, ls_nbtotalligne, ls_modalite, ls_datechem
//string ls_chemfile,ls_noinstitution,ls_nosuccursale,ls_nocompte, ls_linefichret, ls_montanttotal, ls_mm, ls_jj, ls_nomclientfich
//string ls_linefichentete, ls_nomclient, ls_nocreationfich, ls_remplissage, ls_idpat, ls_date, ls_nopaiement, ls_nomabrege, ls_montantcheque
//long i, ll_jourjulien, ll_idpat, ll_nopaiement, ll_noenr, ll_nbtotalligne, ll_nocreationfich, ll_idcheque, ll_envoitrait
//dec{2} ld_montant, ld_montanttotal
//
////Récupération du numéro de client RBC et du nom abrégé à figurer dans le fichier
//ls_noclientrbc = dw_cheques_postdates.getitemstring(1,'noclientrbc')
//ls_nomabrege = dw_cheques_postdates.getitemstring(1,'nomabregerbc') 
//ls_nomclient = dw_cheques_postdates.getitemstring(1,'nomcompletrbc')
//ls_nomclientfich = lnv_string.of_globalreplace(ls_nomclient," ","")
//
//if isnull(ls_noclientrbc) or isnull(ls_nomabrege) or trim(ls_noclientrbc) = "" or trim(ls_nomabrege) = "" then
//	error_type(161)
//else
//	if error_type(266) = 1 then
//	
//		// Construction de la date du jour selon le calendrier julien
//		ldt_datejour=today()
//		ls_aaaa = string(year(ldt_datejour))
//		ls_mm = string(month(ldt_datejour))
//		ls_mm = remplir(ls_mm,2,"0",true)
//		ls_jj = string(day(ldt_datejour))
//		ls_jj = remplir(ls_jj,2,"0",true)
//		ls_datechem=ls_jj + ls_mm + ls_aaaa
//		ll_jourjulien = lnv_time.of_juliandaynumber( ldt_datejour)
//		ls_datejour = ls_aaaa + string(ll_jourjulien)
//		
//		//Récupération du numéro de fichier dans la BD
//		select nofichierrbc into :ls_nocreationfich from t_options where ortho_id = :v_no_ortho;
//		ll_nocreationfich = long(ls_nocreationfich)
//		if isnull(ll_nocreationfich) or ll_nocreationfich = 9999 then
//			ll_nocreationfich = 1
//		else
//			ll_nocreationfich++
//		end if
//			
//		// Faire le nom du ficher
//		ls_nocreationfich = remplir(string(ll_nocreationfich),4,"0",true)
//		ls_chemfile = "C:\ii4net\orthotek\exportation\rbc"+ls_datechem+ls_nomclientfich+ls_nocreationfich+".txt"
//		
//		li_FileNum = FileOpen(ls_chemfile, Linemode!, Write!, LockWrite!, Replace!)
//		 
//		 // Construction de la chaine d'en-tête
//		ll_noenr = 1
//		ls_noenr=remplir(string(ll_noenr),6,"0",true)
//		ls_linefichentete = ls_noenr // No d'enr
//		ls_linefichentete += "A" // Type d'enr
//		ls_linefichentete += "HDR" // Code d'operation	
//		ls_noclientrbc = remplir(ls_noclientrbc,10,"0",false)
//		ls_linefichentete +=  ls_noclientrbc // No client
//		ls_nomclient = remplir(ls_nomclient,30," ",false)
//		ls_linefichentete += ls_nomclient			 
//		//ls_nocreationfich = "TEST" // à remplacer !	 
//		ls_linefichentete += ls_nocreationfich
//		ls_linefichentete += ls_datejour // Date calendrier julien
//		ls_linefichentete += "CAD" // Devise utilisée
//		ls_linefichentete += "1" // Type d'entrée
//		ls_remplissage = remplir(" ",87," ",false)
//		ls_linefichentete += ls_remplissage
//		filewrite(li_FileNum,ls_linefichentete)
//			 
//		// Création des lignes du fichier
//		// Enregistrement de paiement de base	
//		for i = 1 to dw_cheques_postdates.rowcount()
//								
//			ll_idcheque = dw_cheques_postdates.getitemnumber( i,'cheques_postdates_cheques_postdates_id')
//			select isnull(envoitrait,0) into :ll_envoitrait from cheques_postdates where cheques_postdates_id = :ll_idcheque; 
//				
//			// Récupération infos bancaires du patient 
//			ls_noinstitution = dw_cheques_postdates.getitemstring(i,'patient_noinstitution')
//			ls_nosuccursale = dw_cheques_postdates.getitemstring(i,'patient_nosuccursale')
//			ls_nocompte = dw_cheques_postdates.getitemstring(i,'patient_nocompte')
//			ls_modalite = dw_cheques_postdates.getitemstring( i,'cheques_postdates_modalite')			
//				
//			//Construction de la date julien
//			ldt_datepaie = dw_cheques_postdates.getitemdate( i,'cheques_postdates_date_cheque')
//			ls_aaaa = string(year(ldt_datepaie)) 
//			ll_jourjulien = lnv_time.of_juliandaynumber(ldt_datepaie)
//			ls_date = ls_aaaa + string(ll_jourjulien)
//			
//			if isnull(ls_noinstitution) or trim(ls_noinstitution) = "" or isnull(ls_nosuccursale) or trim(ls_nosuccursale) = "" or isnull(ls_nocompte) or trim(ls_nocompte)="" or long(ls_date) < long(ls_datejour) or ls_modalite <> "pPD" then
//				dw_cheques_postdates.setitem(i, "couleur",rgb(255,0,0))
//			elseif ll_envoitrait = 0 then
//				
//				ll_noenr = ll_noenr + 1
//				ls_noenr=remplir(string(ll_noenr),6,"0",true)
//				ls_linefich = ls_noenr // No d'enregistrement
//				
//				ls_linefich += "D"
//				ls_linefich += "450" // Code d'opération
//				ls_linefich += ls_noclientrbc // No client -- Le même que dans l'en-tête
//				ls_linefich += " "
//				
//				// No attribué au client
//				ll_idpat = dw_cheques_postdates.getItemNumber(i,'patient_patient_id')
//				ls_idpat = remplir(string(ll_idpat),19," ",false)
//				ls_linefich += ls_idpat 
//				
//				// No du paiment du patient
//				ll_nopaiement = dw_cheques_postdates.getitemnumber(i,'no_paiement')
//				ls_nopaiement = remplir(string(ll_nopaiement),2,"0",true)
//				ls_linefich += ls_nopaiement
//								
//				// No institution financiere
//				ls_noinstitution = remplir(ls_noinstitution,4,"0",true)
//				ls_linefich += ls_noinstitution
//				
//				// No succursale de l'institution financiere
//				ls_nosuccursale = remplir(ls_nosuccursale,5,"0",true)			
//				ls_linefich += ls_nosuccursale
//				
//				// No du compte du patient		
//				ls_nocompte = remplir(ls_nocompte, 18, " ",false)
//				ls_linefich += ls_nocompte
//				
//				ls_linefich += " "
//				
//				// Montant du paiement à prélever
//				ld_montant =  dw_cheques_postdates.getitemnumber(i,'cheques_postdates_paiement')
//				ld_montanttotal = ld_montanttotal + ld_montant // Calcul du montant total			
//				ls_montantcheque = string(ld_montant)
//				ls_montantcheque = lnv_string.of_globalreplace( ls_montantcheque, ".", "")
//				ls_montantcheque = remplir(ls_montantcheque,10,"0",true)
//				ls_linefich += ls_montantcheque
//					
//				ls_remplissage = remplir(" ",6," ",true)
//				ls_linefich += ls_remplissage
//					
//				// date Julien		
//				ls_linefich += ls_date
//					
//				// Nom du patient 
//				ls_nomclient = dw_cheques_postdates.getitemstring( i,'patient_patient_nom')
//				ls_nomclient = remplir(ls_nomclient,30," ",false)
//				ls_linefich += ls_nomclient
//				
//				// Récupérer la langue
//				 ls_langue = dw_cheques_postdates.getItemString(i,'patient_langue')
//				 if ls_langue = "A" then
//					ls_langue = "E"
//				end if 
//				ls_linefich += ls_langue
//					
//				ls_linefich += " "
//				ls_nomabrege = remplir(ls_nomabrege,15," ",false)
//				ls_linefich += ls_nomabrege
//				ls_linefich += "CAD"
//				ls_linefich += " "
//				ls_linefich += "CAN"
//				ls_remplissage = remplir(" ",5," ",true)
//				ls_linefich += ls_remplissage
//				filewrite(li_FileNum,ls_linefich)
//				
//				//Enregistrement de message de virements de fonds électronique
//				ll_noenr = ll_noenr + 1
//				ls_noenr=remplir(string(ll_noenr),6,"0",true)
//				ls_linefichret = ls_noenr
//				ls_linefichret += "D"
//				ls_linefichret += "RET"
//				ls_linefichret += ls_noclientrbc
//				ls_remplissage = remplir(" ",132," ",false)
//				ls_linefichret += ls_remplissage
//				filewrite(li_FileNum,ls_linefichret)			
//				ll_nbtotalligne++
//				
//				// On met à jour la table pour ne pas ajouter dans un autre fichier la même ligne
//				update cheques_postdates set envoitrait = 1 where cheques_postdates_id =: ll_idcheque;
//				if sqlca.sqlcode <> 0 then
//					messagebox("erreur",+sqlca.sqlerrtext)
//				end if
//				commit using sqlca;					
//			end if								
//		next				
//					
//		// Construction de la chaine de fin 
//		ll_noenr = ll_noenr + 1
//		ls_noenr=remplir(string(ll_noenr),6,"0",true)
//		ls_linefichfin = ls_noenr
//		ls_linefichfin += "Z" // Type d'enr
//		ls_linefichfin += "TRL" // Code opération
//		ls_linefichfin +=  ls_noclientrbc // No cliebt rbc
//		ls_remplissage = remplir(" ",20," ",true)
//		ls_linefichfin += ls_remplissage	
//		ls_nbtotalligne = remplir(string(ll_nbtotalligne),6,"0",true)
//		ls_linefichfin += ls_nbtotalligne
//		ls_montanttotal = string(ld_montanttotal)
//		ls_montanttotal = lnv_string.of_globalreplace( ls_montanttotal, ".", "")
//		ls_montanttotal = remplir(ls_montanttotal,14,"0",true)
//		ls_linefichfin += ls_montanttotal	
//		ls_linefichfin += "00"
//		ls_linefichfin += remplir(string(ll_nbtotalligne),6,"0",true)
//		ls_remplissage = remplir(" ",84," ",true)
//		ls_linefichfin += ls_remplissage
//		filewrite(li_FileNum, ls_linefichfin)
//					
//   	fileclose(li_FileNum)	 
//		 
//		 // Si on a pas de paiements dans le fichier on supprime et on remet le compteur à la meme valeur
//		 if ll_nbtotalligne = 0 then
//			ll_nocreationfich = ll_nocreationfich - 1
//			fileDelete(ls_chemfile)
//			error_type(163)
//		end if
//		 
//		// Enregistrement du numéro de création du fichier
//		 ls_nocreationfich = string(ll_nocreationfich)	  
//		 update t_options set nofichierrbc =:ls_nocreationfich;
//		 if sqlca.sqlcode <> 0 then
//		 	messagebox("erreur",+sqlca.sqlerrtext)
//		 end if
//		 commit using sqlca;
//	end if
//	error_type(162)
//end if
// 
end subroutine

public subroutine of_bn (string as_filename);string ls_entete, ls_nomfich, ls_path, ls_fichzip
long ll_pos
ulong lul_unzFile
n_zlib luo_zlib



select isnull(nomfichierbn,'') into :ls_entete from t_options where ortho_id = :v_no_ortho;
ll_pos = LastPos (as_filename,"\")
if ls_entete = '' then
	ls_nomfich = mid(as_filename,ll_pos + 1)
else
	ls_nomfich = ls_entete
end if
ls_path = left(as_filename,ll_pos)
FileCopy(as_filename,ls_path + ls_nomfich + ".txt")



// ZIPPER LE FICHIER

// Créer fichier creerzip.bat

ls_fichzip = ls_nomfich + ".zip"
lul_unzFile = luo_zlib.of_zipOpen(ls_path+ls_fichzip)
luo_zlib.of_importfile( lul_unzFile, ls_path + ls_nomfich + ".txt", ls_nomfich + ".txt")
luo_zlib.of_zipclose(lul_unzFile,"")
	
	
	
	


//long ll_compteurfich
//string ls_transactionpath
//long i, j, ll_numFile, ll_dayOfTheYear, ll_idCpd, k
//long  ll_idpatient, ll_dayOfTheYearDatePaiement, ll_idcontact
//string ls_filename, ls_prenom, ls_nom
//string ls_notransit, ls_nocompte, ls_nousager, ls_nombanque, ls_nocomptepayeur, ls_noinstitution, ls_nosuccursale
//string ls_nomuser, ls_anneecrt, ls_anneeDatePaiement, ls_s1, ls_s2, ls_s3, ls_s4
//string ls_s9, ls_s10, ls_s11, ls_s12, ls_s13, ls_s14, ls_s15, ls_s16, ls_s17, ls_s18
//string ls_s19, ls_s20, ls_s21, ls_nomuabrege,  ls_nomusager, ls_nompayeur
//string ls_s5, ls_s6, ls_s7, ls_s8, ls_filestring
//Date ldt_today, ldt_datePaiement
//Decimal ld_montant, ld_montanttot
//n_cst_string espace
//n_cst_datetime luo_datetime
//
//j = 1
//k = 0
//ld_montanttot = 0
//
//// A MODIFIER
//
////recherche de l'adresse pour le stockage du fichier
//select isnull(chemintd,'c:\ii4net\orthotek\comptabilite'), isnull(noseqencetd,0) into :ls_transactionpath, :ll_compteurFich
//from t_options
//where ortho_id = :v_no_ortho;
//
//if ls_transactionpath = "" then
//	if gnv_app.of_getlangue( ) = 'an' then
//		messagebox("Avertissement","You must enter path in options to use pre-authorized debit exportation. ",Information!,Ok!)
//	else
//		messagebox("Avertissement","Vous devez entrer un chemin dans les options pour utiliser l'exportation des paiements préautorisés.",Information!,Ok!)
//	end if
//	return 
//end if
//
//if not DirectoryExists(ls_transactionpath) then createdirectory(ls_transactionpath)
//
//// on récupère les données dans les tables
//
//select 	isnull(nomabregerbc,''), 
//			isnull(noclientrbc,''),
//			isnull(nomuser,'')
//into 		:ls_nomuabrege, 
//			:ls_nousager,
//			:ls_nomusager
//from t_options
//where t_options.ortho_id = :v_no_ortho;
//
//select isnull(dr_banque,''), 
//			isnull(dr_compte,'')
//into 		:ls_notransit, 
//			:ls_nocompte
//from ortho_id
//where ortho_id.ortho_id = :v_no_ortho;
//
//if ls_nomuabrege = "" then
//	messagebox("Avertissement","Le nom abrégé d'usager est absent",Information!,Ok!)
//end if
//
//if ls_notransit = "" then
//	messagebox("Avertissement","Le numéro de transit est absent",Information!,Ok!)
//end if
//
//if ls_nocompte = "" then
//	messagebox("Avertissement","Le numéro de compte est absent",Information!,Ok!)
//end if
//
//if ls_nousager = "" then
//	messagebox("Avertissement","Le numéro d'usager est absent",Information!,Ok!)
//end if
//
//if ls_nomusager = "" then
//	messagebox("Avertissement","Le nom d'usager est absent",Information!,Ok!)
//end if
//
////ll_compteurFich++
//
//if dw_cheques_postdates.rowcount( ) > 0 then 
//	// Générer le fichier de transaction
//	if not DirectoryExists(ls_transactionpath + "\" + string(today(),"dd-mm-yyyy")) then createdirectory(ls_transactionpath + "\" + string(today(), "dd-mm-yyyy"))
//
//	ls_filename = ls_transactionpath + "\" + string(today(),"dd-mm-yyyy") + "\" + string(now(),"dd-mm-yyyy-hh-mm-ss") + ".txt"
//
//	ll_numFile = FileOpen(ls_filename, lineMode!, write!,LockWrite!, Append!)
//	
//	// on recherche le jour dans l'année
//	ll_dayOfTheYear = luo_datetime.of_juliandaynumber(today())
//	
////	// Générer l'enregistrement A
////	// En-tête
//	
//	ls_s1 = "A"
//	ls_s2 = "000000001"
//	ls_s3 = espace.of_padleft(ls_nousager, 10)
//	ls_s4 = remplir_zerosign(4, ll_compteurFich)
//	ls_s5 = "0" + right(string(year(today())),2) + remplir_zerosign(3,ll_dayOfTheYear)
//	ls_s6 = "00610"
//	ls_s7 = space(20)
//	ls_s8 = "CAD"
////	ls_s9 =  space(1406)
//	ls_filestring = ls_s1 + ls_s2 + ls_s3 + ls_s4 + ls_s5 + ls_s6 + ls_s7 + ls_s8
//	
//	fileWrite( ll_numFile, ls_filestring)
//	
//	// contenu
//	for i = 1 to dw_cheques_postdates.rowcount( )
//		
//		if dw_cheques_postdates.getItemNumber(i,'traiter') = 1 then
//		
//			ll_idpatient = dw_cheques_postdates.getItemNumber( i, "patient_patient_id")
//			ldt_datePaiement = dw_cheques_postdates.getItemDate( i, "cheques_postdates_date_cheque")
//			ld_montant = dw_cheques_postdates.getItemDecimal( i, "cheques_postdates_paiement")
//			ls_nom = dw_cheques_postdates.getItemString( i, "patient_patient_nom")
//			ls_prenom = dw_cheques_postdates.getItemString( i, "patient_patient_prenom")
//			ll_idCpd = dw_cheques_postdates.getItemNumber( i, "cheques_postdates_cheques_postdates_id")
//			ll_idcontact = dw_cheques_postdates.getItemNumber( i, 'cheques_postdates_id_contact')
//				
//			select 	isnull(noinstitution,''), 
//						isnull(nocompte,''), 
//						isnull(nosuccursale,''),
//						isnull(nompayeur,'')
//			into 		:ls_noinstitution, 
//						:ls_nocomptepayeur, 
//						:ls_nosuccursale,
//						:ls_nompayeur
//			from t_contact
//			where id_contact = :ll_idcontact;
//			
//			ls_nombanque = "0" + ls_noinstitution + ls_nosuccursale
//			ll_dayOfTheYearDatePaiement = luo_datetime.of_juliandaynumber(ldt_datePaiement)
//			ls_anneeDatePaiement = String(Year(ldt_datePaiement))
//		
//			if not isnull(ld_montant) and ld_montant > 0 and ls_nompayeur <> "" and ls_nocomptepayeur <> "" and ls_noinstitution <> "" and ls_nosuccursale <> "" then
//				
//				j++
//				k++
//				ls_s1 = "D" + remplir_zerosign(9, j)
//				ls_s2 = espace.of_padleft(ls_nousager, 10)
//				ls_s3 = remplir_zerosign(4, ll_compteurFich)
//				ls_s4 = "430" 
//				ls_s5 = remplir_zero(10, ld_montant)
//				ls_s6 = "0" + right(ls_anneeDatePaiement,2) + remplir_zerosign(3,ll_dayOfTheYearDatePaiement)
//				ls_s7 = espace.of_padleft(ls_nombanque, 9)
//				ls_s8 = espace.of_padright(ls_nocomptepayeur, 12)
//				ls_s9 = "0000000000000000000000"
//				ls_s10 = "000"
//				ls_s11 = espace.of_padleft(ls_nomuabrege,15)
//				ls_s12 = espace.of_padleft(ls_nompayeur,30)
//				ls_s13 = espace.of_padleft(ls_nomusager,30)
//				ls_s14 = espace.of_padleft(ls_nousager, 10)
//				ls_s15 = espace.of_padleft(String(ll_idCpd), 19)
//				ls_s16 = espace.of_padleft(ls_notransit, 9)
//				ls_s17 = espace.of_padright(ls_nocompte, 12)
//				ls_s18 = space(15)
//				ls_s19 = space(22)
//				ls_s20 = space(2)
//				ls_s21 = "00000000000"
//				
//				ls_filestring = ls_s1 + ls_s2 + ls_s3 + ls_s4 + ls_s5 + ls_s6 + ls_s7 + & 
//									 ls_s8 + ls_s9 + ls_s10 + ls_s11 + ls_s12 + ls_s13 + ls_s14 + &
//									 ls_s15 + ls_s16 + ls_s17 + ls_s18 + ls_s19 + ls_s20 + ls_s21
//				
//				// Générer un enregistrement D	
//				fileWrite( ll_numFile, ls_filestring)		
//				ld_montanttot = ld_montanttot + ld_montant
//			else
//				
//				if v_langue = 'an' then
//					messagebox("Warning","Bank name, branch name, account name or payee name are absent. The payment of " + ls_prenom + ' ' + ls_nom + " will not be process",Information!,OK!)
//				else
//					messagebox("Avertissement","Le nom de la banque, le nom de la succursale, le numéro du compte ou le nom du payeur sont absent. Le paiement de " + ls_prenom + ' ' + ls_nom + " ne sera pas traité",Information!,OK!)
//				end if
//			
//			end if
//			
//		end if
//		
//	next
//	
//	
//	j++	
//	ls_s1 = "Z"
//	ls_s2 = remplir_zerosign(9, j)
//	ls_s3 = espace.of_padleft(ls_nousager, 10)
//	ls_s4 = remplir_zerosign(4, ll_compteurFich)
//	ls_s5 = remplir_zero(14, ld_montanttot)
//	ls_s6 = remplir_zerosign(8, k)
//	ls_s7 = "00000000000000"
//	ls_s8 = "00000000"
//	ls_s9 = "00000000000000"
//	ls_s10 = "00000000"
//	ls_s11 = "00000000000000"
//	ls_s12 = "00000000"
//	ls_s13 = space(1352)
//	
//	ls_filestring = ls_s1 + ls_s2 + ls_s3 + ls_s4 + ls_s5 + ls_s6 + ls_s7 + ls_s8 + &
//						 ls_s9 + ls_s10 + ls_s11 + ls_s12 + ls_s13
//	
//	// Générer un enregistrement Z
//	fileWrite( ll_numFile,ls_filestring)
//	fileClose( ll_numFile )	
//	
//	update t_options set noseqencetd = noseqencetd + 1 where ortho_id = :v_no_ortho;
//	if error_type(-1) = 1 then
//		commit using SQLCA;
//	else
//		rollback using SQLCA;
//	end if
//	
//	// Zipper le fichier
//	
//	
//	
//end if
//
//
//
end subroutine

public subroutine of_bs (string as_filename);//integer li_FileNum, li_ret
//string ls_filestring[], ls_entete, ls_line, ls_part1
//long i = 1
//
//// On récupère le contenu du ficher
//
//li_FileNum = FileOpen(as_filename, LineMode!)
//DO 
//	li_ret = FileReadEx(li_FileNum, ls_filestring[i])
//	i++
//LOOP WHILE li_ret > 0
//FileClose(li_FileNum)
//
////select isnull(nomfichierbn,'$$AAPACPA1464[TEST[NL$$') into :ls_entete from t_options where ortho_id = :v_no_ortho;
//li_FileNum = FileOpen(as_filename, LineMode!, Write!, LockReadWrite!, Replace!)
//
//ls_part1 =  mid(ls_filestring[1],1,30)
//ls_filestring[1] = ls_part1 + '00220' + space(1429)
//
//for i = 1 to upperbound(ls_filestring)
//	
//	FileWriteEx(li_FileNum, ls_filestring[i])
//		
//next
//FileClose(li_FileNum)
//
////ls_filestring = ls_entete + "~r~n" + ls_filestring
////
////li_FileNum = FileOpen(as_file, TextMode!, Write!, LockReadWrite!, Replace!)
////FileWriteEx(li_FileNum, ls_filestring)
////FileClose(li_FileNum)
end subroutine

public function string of_formatacp (long al_banque);long ll_compteurfich
string ls_transactionpath
long i, j, ll_numFile, ll_dayOfTheYear, ll_idCpd, k
long  ll_idpatient, ll_dayOfTheYearDatePaiement, ll_idcontact, ll_cpdadate
string ls_filename, ls_prenom, ls_nom
string ls_notransit, ls_nocompte, ls_nousager, ls_nombanque, ls_nocomptepayeur, ls_noinstitution, ls_nosuccursale
string ls_nomuser, ls_anneecrt, ls_anneeDatePaiement, ls_s1, ls_s2, ls_s3, ls_s4
string ls_s9, ls_s10, ls_s11, ls_s12, ls_s13, ls_s14, ls_s15, ls_s16, ls_s17, ls_s18
string ls_s19, ls_s20, ls_s21, ls_nomuabrege,  ls_nomusager, ls_nompayeur
string ls_s5, ls_s6, ls_s7, ls_s8, ls_filestring
Date ldt_today, ldt_datePaiement, ldt_dateppa
Decimal ld_montant, ld_montanttot
n_cst_string espace
n_cst_datetime luo_datetime

j = 1
k = 0
ld_montanttot = 0
if cbx_date.checked then
	ll_cpdadate = 1
	em_date.getData(ldt_dateppa)
else
	ll_cpdadate = 0
end if


// A MODIFIER

//recherche de l'adresse pour le stockage du fichier
select isnull(chemintd,'c:\ii4net\orthotek\comptabilite'), isnull(noseqencetd,1) into :ls_transactionpath, :ll_compteurFich
from t_options
where ortho_id = :v_no_ortho;

if ls_transactionpath = "" then
	if gnv_app.of_getlangue( ) = 'an' then
		messagebox("Avertissement","You must enter path in options to use pre-authorized debit exportation. ",Information!,Ok!)
	else
		messagebox("Avertissement","Vous devez entrer un chemin dans les options pour utiliser l'exportation des paiements préautorisés.",Information!,Ok!)
	end if
	return ""
end if

if not DirectoryExists(ls_transactionpath) then createdirectory(ls_transactionpath)

// on récupère les données dans les tables

select 	isnull(nomabregerbc,''), 
			isnull(noclientrbc,''),
			isnull(nomuser,'')
into 		:ls_nomuabrege, 
			:ls_nousager,
			:ls_nomusager
from t_options
where t_options.ortho_id = :v_no_ortho;

select isnull(dr_banque,''), 
			isnull(dr_compte,'')
into 		:ls_notransit, 
			:ls_nocompte
from ortho_id
where ortho_id.ortho_id = :v_no_ortho;

if ls_nomuabrege = "" then
	messagebox("Avertissement","Le nom abrégé d'usager est absent",Information!,Ok!)
end if

if ls_notransit = "" then
	messagebox("Avertissement","Le numéro de transit est absent",Information!,Ok!)
end if

if ls_nocompte = "" then
	messagebox("Avertissement","Le numéro de compte est absent",Information!,Ok!)
end if

if ls_nousager = "" then
	messagebox("Avertissement","Le numéro d'usager est absent",Information!,Ok!)
end if

if ls_nomusager = "" then
	messagebox("Avertissement","Le nom d'usager est absent",Information!,Ok!)
end if

//ll_compteurFich++

if dw_cheques_postdates.rowcount( ) > 0 then 
	// Générer le fichier de transaction
	if not DirectoryExists(ls_transactionpath + "\" + string(today(),"dd-mm-yyyy")) then createdirectory(ls_transactionpath + "\" + string(today(), "dd-mm-yyyy"))

	ls_filename = ls_transactionpath + "\" + string(today(),"dd-mm-yyyy") + "\" + string(now(),"dd-mm-yyyy-hh-mm-ss") + ".txt"

	ll_numFile = FileOpen(ls_filename, lineMode!, write!,LockWrite!, Append!)
	
	// on recherche le jour dans l'année
	ll_dayOfTheYear = luo_datetime.of_juliandaynumber(today())
	
//	// Générer l'enregistrement A
//	// En-tête
	
	ls_s1 = "A"
	ls_s2 = "000000001"
	ls_s3 = espace.of_padleft(ls_nousager, 10)
	ls_s4 = remplir_zerosign(4, ll_compteurFich)
	ls_s5 = "0" + right(string(year(today())),2) + remplir_zerosign(3,ll_dayOfTheYear)
	if al_banque = 4 then
		ls_s6 = "00220"
	else
		ls_s6 = "00610"
	end if
	ls_s7 = space(20)
	ls_s8 = "CAD"
//	ls_s9 =  space(1406)
	ls_filestring = ls_s1 + ls_s2 + ls_s3 + ls_s4 + ls_s5 + ls_s6 + ls_s7 + ls_s8
	
	fileWrite( ll_numFile, ls_filestring)
	
	// contenu
	for i = 1 to dw_cheques_postdates.rowcount( )
		
		if dw_cheques_postdates.getItemNumber(i,'traiter') = 1 then
		
			ll_idpatient = dw_cheques_postdates.getItemNumber( i, "patient_patient_id")
			if ll_cpdadate = 1 then
				ldt_datepaiement = ldt_dateppa
			else
				ldt_datePaiement = dw_cheques_postdates.getItemDate( i, "cheques_postdates_date_cheque")
			end if
			ld_montant = dw_cheques_postdates.getItemDecimal( i, "cheques_postdates_paiement")
			ls_nom = dw_cheques_postdates.getItemString( i, "patient_patient_nom")
			ls_prenom = dw_cheques_postdates.getItemString( i, "patient_patient_prenom")
			ll_idCpd = dw_cheques_postdates.getItemNumber( i, "cheques_postdates_cheques_postdates_id")
			ll_idcontact = dw_cheques_postdates.getItemNumber( i, 'cheques_postdates_id_contact')
				
			select 	isnull(noinstitution,''), 
						isnull(nocompte,''), 
						isnull(nosuccursale,''),
						isnull(nompayeur,'')
			into 		:ls_noinstitution, 
						:ls_nocomptepayeur, 
						:ls_nosuccursale,
						:ls_nompayeur
			from t_contact
			where id_contact = :ll_idcontact;
			
			ls_nombanque = "0" + ls_noinstitution + ls_nosuccursale
			ll_dayOfTheYearDatePaiement = luo_datetime.of_juliandaynumber(ldt_datePaiement)
			ls_anneeDatePaiement = String(Year(ldt_datePaiement))
		
			if not isnull(ld_montant) and ld_montant > 0 and ls_nompayeur <> "" and ls_nocomptepayeur <> "" and ls_noinstitution <> "" and ls_nosuccursale <> "" then
				
				j++
				k++
				ls_s1 = "D" + remplir_zerosign(9, j)
				ls_s2 = espace.of_padleft(ls_nousager, 10)
				ls_s3 = remplir_zerosign(4, ll_compteurFich)
				ls_s4 = "430" 
				ls_s5 = remplir_zero(10, ld_montant)
				ls_s6 = "0" + right(ls_anneeDatePaiement,2) + remplir_zerosign(3,ll_dayOfTheYearDatePaiement)
				ls_s7 = espace.of_padleft(ls_nombanque, 9)
				ls_s8 = espace.of_padright(ls_nocomptepayeur, 12)
				ls_s9 = "0000000000000000000000"
				ls_s10 = "000"
				ls_s11 = espace.of_padleft(ls_nomuabrege,15)
				ls_s12 = espace.of_padleft(ls_nompayeur,30)
				ls_s13 = espace.of_padleft(ls_nomusager,30)
				ls_s14 = espace.of_padleft(ls_nousager, 10)
				ls_s15 = espace.of_padleft(String(ll_idCpd), 19)
				ls_s16 = espace.of_padleft(ls_notransit, 9)
				ls_s17 = espace.of_padright(ls_nocompte, 12)
				ls_s18 = space(15)
				ls_s19 = space(22)
				ls_s20 = space(2)
				ls_s21 = "00000000000"
				
				ls_filestring = ls_s1 + ls_s2 + ls_s3 + ls_s4 + ls_s5 + ls_s6 + ls_s7 + & 
									 ls_s8 + ls_s9 + ls_s10 + ls_s11 + ls_s12 + ls_s13 + ls_s14 + &
									 ls_s15 + ls_s16 + ls_s17 + ls_s18 + ls_s19 + ls_s20 + ls_s21
				
				// Générer un enregistrement D	
				fileWrite( ll_numFile, ls_filestring)		
				ld_montanttot = ld_montanttot + ld_montant
			else
				
				if v_langue = 'an' then
					messagebox("Warning","Bank name, branch name, account name or payee name are absent. The payment of " + ls_prenom + ' ' + ls_nom + " will not be process",Information!,OK!)
				else
					messagebox("Avertissement","Le nom de la banque, le nom de la succursale, le numéro du compte ou le nom du payeur sont absent. Le paiement de " + ls_prenom + ' ' + ls_nom + " ne sera pas traité",Information!,OK!)
				end if
			
			end if
			
		end if
		
	next
	
	
	j++	
	ls_s1 = "Z"
	ls_s2 = remplir_zerosign(9, j)
	ls_s3 = espace.of_padleft(ls_nousager, 10)
	ls_s4 = remplir_zerosign(4, ll_compteurFich)
	ls_s5 = remplir_zero(14, ld_montanttot)
	ls_s6 = remplir_zerosign(8, k)
	ls_s7 = "00000000000000"
	ls_s8 = "00000000"
	if al_banque = 4 then
		ls_s9 = "              "
		ls_s10 = "        "
		ls_s11 = "              "
		ls_s12 = "        "
		ls_s13 = ""
	else
		ls_s9 = "00000000000000"
		ls_s10 = "00000000"
		ls_s11 = "00000000000000"
		ls_s12 = "00000000"
		ls_s13 = space(1352)
	end if
	
	ls_filestring = ls_s1 + ls_s2 + ls_s3 + ls_s4 + ls_s5 + ls_s6 + ls_s7 + ls_s8 + &
						 ls_s9 + ls_s10 + ls_s11 + ls_s12 + ls_s13
	
	// Générer un enregistrement Z
	fileWrite( ll_numFile,ls_filestring)
	fileClose( ll_numFile )	
	
	update t_options set noseqencetd = isnull(noseqencetd,1) + 1 where ortho_id = :v_no_ortho;
	if error_type(-1) = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	
end if

return ls_filename

end function

on w_envoidpa.create
int iCurrent
call super::create
this.st_3=create st_3
this.em_date=create em_date
this.cbx_date=create cbx_date
this.cb_1=create cb_1
this.dw_sat=create dw_sat
this.cb_export=create cb_export
this.cb_close=create cb_close
this.st_2=create st_2
this.st_1=create st_1
this.cb_find=create cb_find
this.cb_print=create cb_print
this.dw_cheques_postdates=create dw_cheques_postdates
this.em_fin=create em_fin
this.em_debut=create em_debut
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.em_date
this.Control[iCurrent+3]=this.cbx_date
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_sat
this.Control[iCurrent+6]=this.cb_export
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_find
this.Control[iCurrent+11]=this.cb_print
this.Control[iCurrent+12]=this.dw_cheques_postdates
this.Control[iCurrent+13]=this.em_fin
this.Control[iCurrent+14]=this.em_debut
end on

on w_envoidpa.destroy
call super::destroy
destroy(this.st_3)
destroy(this.em_date)
destroy(this.cbx_date)
destroy(this.cb_1)
destroy(this.dw_sat)
destroy(this.cb_export)
destroy(this.cb_close)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.dw_cheques_postdates)
destroy(this.em_fin)
destroy(this.em_debut)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today())
em_fin.text = string(today())
em_date.text = string(today())

dw_cheques_postdates.SetTransObject(SQLCA)


end event

type st_3 from statictext within w_envoidpa
string tag = "resize=n"
integer x = 133
integer y = 40
integer width = 590
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date de prélèvement"
boolean focusrectangle = false
end type

type em_date from editmask within w_envoidpa
string tag = "resize=n"
integer x = 731
integer y = 32
integer width = 448
integer height = 80
integer taborder = 30
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
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

type cbx_date from checkbox within w_envoidpa
string tag = "resize=n"
integer x = 50
integer y = 32
integer width = 82
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " "
end type

type cb_1 from commandbutton within w_envoidpa
integer x = 782
integer y = 1912
integer width = 393
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Exporter"
end type

event clicked;long ll_banque, ll_nbcheque
string ls_filename

ll_nbcheque = dw_cheques_postdates.rowcount( )
if ll_nbcheque = 0 then
	messagebox("Avertissement!","Il n'y a pas de chèques sélectionnés")
else
	
	open(w_choix_banque_cheque)
	ll_banque = gnv_app.inv_entrepotglobal.of_retournedonnee("banquechoisie")
	
	ls_filename = of_formatacp(ll_banque)
	if ls_filename <> "" then
		
		if ll_banque = 1 then
			of_td()
		elseif ll_banque = 2 then
			of_rbc(ls_filename)
		elseif ll_banque = 3 then
			of_bn(ls_filename)
		elseif ll_banque = 4 then
			of_bs(ls_filename)
		end if
	end if 
end if
end event

event constructor;if v_langue = 'an' then
cb_close.text = 'Export'
end if
end event

type dw_sat from uo_sat within w_envoidpa
integer x = 2098
integer y = 20
integer taborder = 40
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_cheques_postdates.setFilter("")
	dw_cheques_postdates.filter()
else
	dw_cheques_postdates.setFilter("patient_id_satellite = " + string(il_idsat))
	dw_cheques_postdates.filter()
end if
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type cb_export from commandbutton within w_envoidpa
integer x = 2487
integer y = 1912
integer width = 571
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Exporter vers Excel"
end type

event clicked;if dw_cheques_postdates.SaveAs("c:\ii4net\orthotek\correspondances\cpd.xls", EXCEL5!,True) = 1 then
	if error_type(228) = 1 then
		run('C:\Program Files\Microsoft Office\Office\Excel.EXE c:\ii4net\orthotek\correspondances\cpd.xls',maximized!)
	end if
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Export to Excel'
end if
end event

type cb_close from commandbutton within w_envoidpa
integer x = 3058
integer y = 1912
integer width = 571
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
cb_close.text = 'Close'
end if
end event

type st_2 from statictext within w_envoidpa
integer x = 1847
integer y = 1924
integer width = 123
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
st_2.text = 'End:'
end if
end event

type st_1 from statictext within w_envoidpa
integer x = 1193
integer y = 1924
integer width = 169
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Début:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
st_1.text = 'Start:'
end if
end event

type cb_find from commandbutton within w_envoidpa
integer x = 389
integer y = 1912
integer width = 393
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_cheques_postdates.object.date_debut.text = em_debut.text
dw_cheques_postdates.object.date_fin.text = em_fin.text
dw_cheques_postdates.object.t_2.text = em_date.text
//dw_cheques_postdates.setfilter("cheques_postdates_date_cheque > '"+debut+"' and cheques_postdates_date_cheque < '"+fin+"'")
dw_cheques_postdates.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
cb_find.text = 'Search'
end if
end event

type cb_print from commandbutton within w_envoidpa
integer y = 1912
integer width = 393
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_cheques_postdates.object.date_debut.text = em_debut.text
dw_cheques_postdates.object.date_fin.text = em_fin.text
dw_cheques_postdates.object.t_2.text = em_date.text

datastore ds_chequepostdate
ds_chequepostdate = create datastore

ds_chequepostdate.dataobject = "d_envoidpa"
ds_chequepostdate.settransobject(sqlca)
ds_chequepostdate.retrieve(v_no_ortho,debut,fin)
ds_chequepostdate.object.date_debut.text = em_debut.text
ds_chequepostdate.object.date_fin.text = em_fin.text
ds_chequepostdate.object.t_datepre2.text = em_date.text
IF cbx_date.checked THEN
	ds_chequepostdate.object.t_datepre2.visible = true
	ds_chequepostdate.object.t_2.visible = true
ElSE
	ds_chequepostdate.object.t_datepre2.visible = false
   ds_chequepostdate.object.t_2.visible = false
END IF
gb_datawindow = false
openwithparm(w_print_options, ds_chequepostdate)
destroy ds_chequepostdate

//gb_datawindow = true
//openwithparm(w_print_options, dw_cheques_postdates)
end event

event constructor;if v_langue = 'an' then
cb_print.text = 'Print'
end if
end event

type dw_cheques_postdates from u_dw within w_envoidpa
integer x = 23
integer y = 148
integer width = 3579
integer height = 1736
integer taborder = 50
string dataobject = "d_envoidpa"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	dw_cheques_postdates.object.t_3.text = 'From'
	dw_cheques_postdates.object.t_4.text = 'to'
	dw_cheques_postdates.object.t_1.text = 'Postdated cheques for:'
	dw_cheques_postdates.object.patient_patient_nom_t.text = 'Name'
//	dw_cheques_postdates.object.patient_patient_prenom_t.text = 'First name'
	dw_cheques_postdates.object.cheques_postdates_paiement_t.text = 'Amount'
	dw_cheques_postdates.object.t_2.text = 'File #'
	dw_cheques_postdates.object.b_date.text = 'Date'
	dw_cheques_postdates.object.b_nom.text = 'Last name'
//	dw_cheques_postdates.object.b_prenom.text = 'First name'
	dw_cheques_postdates.object.b_montant.text = 'Amount'
	dw_cheques_postdates.object.b_dossier.text = 'Patient file'
	dw_cheques_postdates.object.t_periode.text = 'Period:'
	dw_cheques_postdates.object.t_printedon.text = 'Printed on'
	dw_cheques_postdates.object.t_carte.text = 'Card #'
	dw_cheques_postdates.object.b_carte.text = 'Card #'
end if

dw_cheques_postdates.object.cheques_postdates_modalite.values = gf_method(v_langue)

end event

event buttonclicked;choose case dwo.name
	case 'b_date'
		dw_cheques_postdates.setsort("cheques_postdates_date_cheque A")
		dw_cheques_postdates.sort()
	case 'b_nom'
		dw_cheques_postdates.setsort("patient_patient_nom A")
		dw_cheques_postdates.sort()
	case 'b_prenom'
		dw_cheques_postdates.setsort("patient_patient_prenom A")
		dw_cheques_postdates.sort()
	case 'b_montant'
		dw_cheques_postdates.setsort("cheques_postdates_paiement A")
		dw_cheques_postdates.sort()
	case 'b_mod'	
		dw_cheques_postdates.setsort("cheques_postdates_modalite A")
		dw_cheques_postdates.sort()
	case 'b_dossier'
		dw_cheques_postdates.setsort("patient_new_dossier A")
		dw_cheques_postdates.sort()
end choose
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

type em_fin from editmask within w_envoidpa
integer x = 2021
integer y = 1924
integer width = 448
integer height = 80
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
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

type em_debut from editmask within w_envoidpa
integer x = 1358
integer y = 1924
integer width = 448
integer height = 80
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
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

