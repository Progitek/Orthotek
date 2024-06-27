$PBExportHeader$w_migctrl.srw
forward
global type w_migctrl from w_child
end type
type cb_17 from commandbutton within w_migctrl
end type
type cb_16 from commandbutton within w_migctrl
end type
type cb_15 from commandbutton within w_migctrl
end type
type cb_14 from commandbutton within w_migctrl
end type
type cb_13 from commandbutton within w_migctrl
end type
type cb_12 from commandbutton within w_migctrl
end type
type cb_11 from commandbutton within w_migctrl
end type
type cb_10 from commandbutton within w_migctrl
end type
type cb_9 from commandbutton within w_migctrl
end type
type cb_8 from commandbutton within w_migctrl
end type
type cb_6 from commandbutton within w_migctrl
end type
type st_3 from statictext within w_migctrl
end type
type cb_5 from commandbutton within w_migctrl
end type
type st_2 from statictext within w_migctrl
end type
type cb_4 from commandbutton within w_migctrl
end type
type cb_3 from commandbutton within w_migctrl
end type
type cb_2 from commandbutton within w_migctrl
end type
type cb_1 from commandbutton within w_migctrl
end type
type st_1 from statictext within w_migctrl
end type
type cb_7 from commandbutton within w_migctrl
end type
end forward

global type w_migctrl from w_child
integer x = 214
integer y = 221
cb_17 cb_17
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_6 cb_6
st_3 st_3
cb_5 cb_5
st_2 st_2
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_7 cb_7
end type
global w_migctrl w_migctrl

on w_migctrl.create
int iCurrent
call super::create
this.cb_17=create cb_17
this.cb_16=create cb_16
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_6=create cb_6
this.st_3=create st_3
this.cb_5=create cb_5
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_7=create cb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_17
this.Control[iCurrent+2]=this.cb_16
this.Control[iCurrent+3]=this.cb_15
this.Control[iCurrent+4]=this.cb_14
this.Control[iCurrent+5]=this.cb_13
this.Control[iCurrent+6]=this.cb_12
this.Control[iCurrent+7]=this.cb_11
this.Control[iCurrent+8]=this.cb_10
this.Control[iCurrent+9]=this.cb_9
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.cb_6
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.cb_4
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.cb_1
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.cb_7
end on

on w_migctrl.destroy
call super::destroy
destroy(this.cb_17)
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.st_3)
destroy(this.cb_5)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_7)
end on

event open;call super::open;transaction CTRL

CTRL = create transaction

CTRL.DBMS       = 'ODBC'
CTRL.LOCK		  = "0"
CTRL.AutoCommit = True
CTRL.DbParm     = "ConnectString='DSN=lamarre',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using CTRL;
if CTRL.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", CTRL.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if
end event

type cb_17 from commandbutton within w_migctrl
integer x = 1499
integer y = 140
integer width = 521
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;date ldt_opendoss, ldt_datenais
transaction miron
string ls_nom, ls_prenom, ls_ville, ls_zip, ls_province, ls_telres, ls_telbur
string ls_adresse

miron = create transaction

miron.DBMS       = 'ODBC'
miron.LOCK		  = "0"
miron.AutoCommit = True
miron.DbParm     = "ConnectString='DSN=miron',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using miron;
if miron.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", miron.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

DECLARE listpat CURSOR FOR
	select 	ouverture_dossier,
				nom,
				prenom,
				adresse,
				ville,
				code_postal,
				province,
				telephone,
				telephone_au_travail,
				date_de_naissance
	from patients using miron;

OPEN listpat;

FETCH listpat INTO :ldt_opendoss,
						 :ls_nom,
						 :ls_prenom,
						 :ls_adresse,
						 :ls_ville,
						 :ls_zip,
						 :ls_province,
						 :ls_telres,
						 :ls_telbur,
						 :ldt_datenais;

DO WHILE miron.SQLCode = 0 
	
	insert into patient(opendoss, patient_nom, patient_prenom, ville, code_postale,
        			province, tel_maison, tel_bureau, date_naissance,no_ortho,adresse)
	values(:ldt_opendoss,:ls_nom,:ls_prenom,:ls_ville,:ls_zip,:ls_province,
			 :ls_telres, :ls_telbur, :ldt_datenais,1,:ls_adresse);
	error_type(-1)

	FETCH listpat INTO :ldt_opendoss,
							 :ls_nom,
							 :ls_prenom,
							 :ls_adresse,
							 :ls_ville,
							 :ls_zip,
							 :ls_province,
							 :ls_telres,
							 :ls_telbur,
							 :ldt_datenais;

LOOP

CLOSE listpat;
end event

type cb_16 from commandbutton within w_migctrl
integer x = 1952
integer y = 904
integer width = 974
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "TEST"
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_noorgan, ll_count, ll_statusid, ll_traitid
long ll_patid
long ll_noplan, ll_affect
string ls_status, ls_mod, ls_note
dec{2} ld_montpaie, ld_montfact, ld_couttrait
date ldt_date, ldt_datedebut, ldt_fermeture
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=baillergeon',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tbpaiements using pcortho;

i = 1


DECLARE listtrans CURSOR FOR
	select 	tbpaiements.nocontpatient,
				tbPaiements.Nocréancier,
				tbpaiements.Réfprojet,
				tbpaiements.Noréfprojet,
				tbpaiements.Montantpaiement,
				tbpaiements.Montantdu,
				tbpaiements.Modedepaiement,
				tbpaiements.Dtduepaiement
	from		tbpaiements 
	order by nocontpatient ASC using pcortho;


OPEN listtrans;


FETCH listtrans INTO			:ll_patid,
									:ll_contactid,
									:ls_status,
									:ll_noplan,
								 	:ld_montpaie,
									:ld_montfact,
									:ls_mod,
									:ldt_date;
								  
	DO WHILE pcortho.SQLCode = 0
		
		select count(*) into :ll_count from t_contact where id_contact = :ll_contactid;
		if ll_count = 0 then
			ll_contactid = ll_patid
		end if
		
		select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid;
		
		// Faire une recherche des informations du traitments
		
		// Facture
		
		if isnull(ld_montfact) then ld_montfact = 0
		
		if ld_montfact <> 0 then
		
			update	factures_traitements set id_contact = :ll_contactid 
			where		date_facture = :ldt_date and 
						traitement_id = (select min(traitement_id) 
												from traitements 
										  	  where patient_id = :ll_patid);
			error_type(-1)
		
		end if
		
		//Paiement
		
		if isnull(ld_montpaie) then ld_montpaie = 0
		
		if ld_montpaie <> 0 then
			
			if ldt_date <= today() then
			
				update paiement set id_contact = :ll_contactid
				where	date_paiement = :ldt_date and
						traitement_patient_id = (select min(traitement_id) 
														from traitements 
													  where patient_id = :ll_patid);
				error_type(-1)
				
			else
				
				if not isnull(ldt_date) then
				
					update cheques_postdates set id_contact = :ll_contactid 
					where date_cheque = :ldt_date and 
							traitement_patient_id = (select min(traitement_id) 
												from traitements 
										  	  where patient_id = :ll_patid);
					error_type(-1)
					
				END IF
				
			end if
			
		end if
		
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listtrans INTO		:ll_patid,
										:ll_contactid,
										:ls_status,
										:ll_noplan,
										:ld_montpaie,
										:ld_montfact,
										:ls_mod,
										:ldt_date;

	LOOP

CLOSE listtrans;
commit using SQLCA;
end event

type cb_15 from commandbutton within w_migctrl
integer x = 978
integer y = 1240
integer width = 974
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration note horaire"
end type

event clicked;long ll_nbligne, i, ll_count
string ls_note
date ldt_datenote
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tbnotesagenda using pcortho;

i = 1


DECLARE listnote CURSOR FOR
select 	dateagenda,
			notesagenda
from		tbnotesagenda using pcortho;


OPEN listnote;


FETCH listnote INTO :ldt_datenote,
						 :ls_note;
								  
	DO WHILE pcortho.SQLCode = 0
		
		if ldt_datenote >= date(2007,8,1) then
			insert into t_hornotedate(hornotedate,commentaire)
			values(:ldt_datenote,:ls_note);
			error_type(-1)
		end if
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listnote INTO :ldt_datenote,
						 			:ls_note;

LOOP

CLOSE listnote;
commit using SQLCA;
end event

type cb_14 from commandbutton within w_migctrl
integer x = 978
integer y = 1128
integer width = 974
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reçu automatique"
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_noorgan, ll_count
string ls_status, ls_titre, ls_resptype
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tiContOrgan 
where 	périodereçus = 1 using pcortho;

i = 1


DECLARE listpat CURSOR FOR
	select 	tiContOrgan.nocontact
	from		tiContOrgan
	where 	périodereçus = 1 using pcortho;


OPEN listpat;


FETCH listpat INTO :ll_contactid;
								  
	DO WHILE pcortho.SQLCode = 0
		
		update patient set recu_automatique = 'oui', assurance = 'oui' where patient_id = :ll_contactid;
		error_type(-1)
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listpat INTO :ll_contactid;

LOOP

CLOSE listpat;
commit using SQLCA;
end event

type cb_13 from commandbutton within w_migctrl
integer y = 1016
integer width = 974
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration RDV"
end type

event clicked;long ll_patid, ll_col, ll_nbligne, i, ll_duree, ll_cat, ll_traitid, ll_couleur, ll_count
long ll_conf, ll_notify, ll_codecoul
string ls_nomcouleur, ls_cat, ls_couleur, ls_nomtrait
time lt_heure
date ldt_date
datetime ldtt_heure, ldtt_date
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

SELECT	count(*) into :ll_nbligne
	FROM		(tbVisitesFutures INNER JOIN tlhrsaux15mn ON tbVisitesFutures.hrvisite = tlhrsaux15mn.no15min)
				INNER JOIN tlcouleur ON 	tbVisitesFutures.codecouleur = tlcouleur.clécouleur										 
	WHERE		annulé = 0 and interne = 1  using pcortho;


i = 1


DECLARE listtrans CURSOR FOR
	SELECT	tbVisitesFutures.nocontpatient,
				tbVisitesFutures.nochaise,
				tbVisitesFutures.Confirmé,
				tbVisitesFutures.notifié,
				tbVisitesFutures.dtvisite,
				tbVisitesFutures.duréeminutes,
				tlhrsaux15mn.qhdisponibles,
				tbVisitesFutures.codecouleur,
				tlcouleur.explication,				
				tlcouleur.nocouleur
	FROM		(tbVisitesFutures INNER JOIN tlhrsaux15mn ON tbVisitesFutures.hrvisite = tlhrsaux15mn.no15min)
				INNER JOIN tlcouleur ON 	tbVisitesFutures.codecouleur = tlcouleur.clécouleur										 
	WHERE		annulé = 0 and interne = 1  using pcortho;


OPEN listtrans;


FETCH listtrans INTO			:ll_patid,
									:ll_col,
									:ll_conf,
									:ll_notify,
									:ldtt_date,
									:ll_duree,
								 	:ldtt_heure,
									:ll_traitid,
									:ls_nomtrait,
									:ll_codecoul;
								  
	DO WHILE pcortho.SQLCode = 0
		
		lt_heure = time(ldtt_heure)
		ldt_date = date(ldtt_date)
		
		if ldt_date >= date(2007,07,31) then
		
			select count(*) into :ll_count from patient where patient_id = :ll_patid;
			if ll_count > 0 then
			
				// Aller chercher la couleur la creer si pas la bonne ramasser le id
				
				select count(*) into :ll_count from t_color where color_id = :ll_codecoul;
				if ll_count = 0 then
					ls_couleur = string(ll_codecoul)
					insert into t_color(color_id,color,name,ortho_id)
					values(:ll_codecoul,:ll_codecoul,:ls_couleur,1);
					error_type(-1)
				end if
				
				// Traitement
				
				select count(*) into :ll_count from type_de_traitement where type_traitement_id = :ll_traitid;
				if ll_count = 0 then
					insert into type_de_traitement(type_traitement_id, nom_traitement,ortho_id,color_id) 
					values(:ll_traitid,:ls_nomtrait,1,:ll_codecoul);
					error_type(-1)
				end if
				
				// Rendez-vous
				
				ll_duree = ll_duree / 10 
				
				if ll_conf = 1 then
				
					insert into t_rdv(rdvdate,rdvheure,patient_id,typetraitid,colonne,ortho_id,duree)
					values(:ldt_date,:lt_heure,:ll_patid,:ll_traitid,:ll_col,1,:ll_duree);
					error_type(-1)
					
				else
					
					insert into rendezvous(prochain_rv,patient_id,traitement_id,no_ortho,ortho_id,duree)
					values(:ldt_date,:ll_patid,:ll_traitid,1,1,:ll_duree);
					error_type(-1)
				
				end if
			
			END IF
		end if
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listtrans INTO		:ll_patid,
										:ll_col,
										:ll_conf,
										:ll_notify,
										:ldtt_date,
										:ll_duree,
										:ldtt_heure,
										:ll_traitid,
										:ls_nomtrait,
										:ll_codecoul;
								  
	LOOP

CLOSE listtrans;
commit using SQLCA;
end event

type cb_12 from commandbutton within w_migctrl
integer y = 900
integer width = 974
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration Finance"
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_noorgan, ll_count, ll_statusid, ll_traitid
long ll_patid
long ll_noplan, ll_affect
string ls_status, ls_mod, ls_note
dec{2} ld_montpaie, ld_montfact
date ldt_date, ldt_datedebut, ldt_fermeture, ld_couttrait
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tbpaiements using pcortho;

i = 1


DECLARE listtrans CURSOR FOR
	select 	tbpaiements.nocontpatient,
				tbPaiements.Nocréancier,
				tbpaiements.Réfprojet,
				tbpaiements.Noréfprojet,
				tbpaiements.Montantpaiement,
				tbpaiements.Montantdu,
				tbpaiements.Modedepaiement,
				tbpaiements.Dtduepaiement
	from		tbpaiements 
	order by nocontpatient ASC using pcortho;


OPEN listtrans;


FETCH listtrans INTO			:ll_patid,
									:ll_contactid,
									:ls_status,
									:ll_noplan,
								 	:ld_montpaie,
									:ld_montfact,
									:ls_mod,
									:ldt_date;
								  
	DO WHILE pcortho.SQLCode = 0
		
		select count(*) into :ll_count from t_contact where id_contact = :ll_contactid;
		if ll_count = 0 then
			ll_contactid = ll_patid
		end if
		
		CHOOSE CASE ls_mod
			CASE 'Amex'
				ls_mod = 'AmEx'
			CASE 'Chèque'
				ls_mod = 'C'
			CASE 'Mastercard'
				ls_mod = 'MC'
			CASE 'Comptant'
				ls_mod = '$'
			CASE 'P Direct'
				ls_mod = 'PD'
			CASE 'Transferts fonds'
				ls_mod = 'trans'
			CASE 'Visa'
				ls_mod = 'Visa'
			CASE ELSE
				ls_mod = 'A'
		END CHOOSE
		
		if ls_status = 'Co' then
			ll_affect = 0
		else
			ll_affect = 1
		end if
		// Creation du status
		
		ll_statusid = 0
		select status_id into :ll_statusid from t_status where code = :ls_status;
		if SQLCA.SQLCode <> 0 and not isnull(ls_status) then
			insert into t_status(code,description,affect,ortho_id)
			values(:ls_status,:ls_status,1,1);
			error_type(-1)
			select status_id into :ll_statusid from t_status where code = :ls_status;
		end if
		if ll_statusid = 0 then setnull(ll_statusid)
		
		
		// Création du traitement
		
		ll_traitid = 0
		select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid;
		if SQLCA.SQLCode <> 0 then
			insert into traitements(patient_id)
			values(:ll_patid);
			error_type(-1)
			select max(traitement_id) into :ll_traitid from traitements;
		end if
		
		// Faire une recherche des informations du traitments
		
		select dtdébtraitement, dtfermeture, valeurtot, notes
		into :ldt_datedebut, :ldt_fermeture, :ld_couttrait, :ls_note
		from tbplantraitement where nopltraitement = :ll_noplan using pcortho;
		
		update traitements set 	debut_traitement = :ldt_datedebut,
										fin_traitment  =:ldt_fermeture,
										montant_original = :ld_couttrait,
										notes = :ls_note
		where	traitement_id = :ll_traitid;
	
		// Facture
		
		if isnull(ld_montfact) then ld_montfact = 0
		
		if ld_montfact <> 0 then
		
			insert into factures_traitements(date_facture,montant,traitement_id,status_id,
														id_contact, affect,cache)
			values(:ldt_date,:ld_montfact, :ll_traitid, :ll_statusid, :ll_contactid,:ll_affect,0);
			error_type(-1)
		
		end if
		
		//Paiement
		
		if isnull(ld_montpaie) then ld_montpaie = 0
		
		if ld_montpaie <> 0 then
			
			if ldt_date <= today() then
			
				insert into paiement(date_paiement,montant_recu,traitement_patient_id,paiement,
															id_contact, affect,cache)
				values(:ldt_date,:ld_montpaie, :ll_traitid, :ls_mod, :ll_contactid, :ll_affect,0);
				error_type(-1)
				
				if ls_status = 'SP' then
					
					ld_montpaie = ld_montpaie * -1
					insert into paiement(date_paiement,montant_recu,traitement_patient_id,paiement,
															id_contact, affect,cache)
					values(:ldt_date,:ld_montpaie, :ll_traitid, 'NSF', :ll_contactid, :ll_affect,0);
					error_type(-1)
					
				end if
				
			else
				
				insert into cheques_postdates(date_cheque,paiement,traitement_patient_id,indicateur,affect,id_contact,modalite)
				values(:ldt_date, :ld_montpaie, :ll_traitid, '0',1,:ll_contactid,'P');
				error_type(-1)
				
			end if
			
		end if
		
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listtrans INTO		:ll_patid,
										:ll_contactid,
										:ls_status,
										:ll_noplan,
										:ld_montpaie,
										:ld_montfact,
										:ls_mod,
										:ldt_date;

	LOOP

CLOSE listtrans;
commit using SQLCA;
end event

type cb_11 from commandbutton within w_migctrl
integer y = 900
integer width = 974
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration Finance"
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_noorgan, ll_count, ll_statusid, ll_traitid
long ll_patid
long ll_noplan, ll_affect
string ls_status, ls_mod, ls_note
dec{2} ld_montpaie, ld_montfact
date ldt_date, ldt_datedebut, ldt_fermeture, ld_couttrait
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tbpaiements using pcortho;

i = 1


DECLARE listtrans CURSOR FOR
	select 	tbpaiements.nocontpatient,
				tbPaiements.Nocréancier,
				tbpaiements.Réfprojet,
				tbpaiements.Noréfprojet,
				tbpaiements.Montantpaiement,
				tbpaiements.Montantdu,
				tbpaiements.Modedepaiement,
				tbpaiements.Dtduepaiement
	from		tbpaiements 
	order by nocontpatient ASC using pcortho;


OPEN listtrans;


FETCH listtrans INTO			:ll_patid,
									:ll_contactid,
									:ls_status,
									:ll_noplan,
								 	:ld_montpaie,
									:ld_montfact,
									:ls_mod,
									:ldt_date;
								  
	DO WHILE pcortho.SQLCode = 0
		
		select count(*) into :ll_count from t_contact where id_contact = :ll_contactid;
		if ll_count = 0 then
			ll_contactid = ll_patid
		end if
		
		CHOOSE CASE ls_mod
			CASE 'Amex'
				ls_mod = 'AmEx'
			CASE 'Chèque'
				ls_mod = 'C'
			CASE 'Mastercard'
				ls_mod = 'MC'
			CASE 'Comptant'
				ls_mod = '$'
			CASE 'P Direct'
				ls_mod = 'PD'
			CASE 'Transferts fonds'
				ls_mod = 'trans'
			CASE 'Visa'
				ls_mod = 'Visa'
			CASE ELSE
				ls_mod = 'A'
		END CHOOSE
		
		if ls_status = 'Co' then
			ll_affect = 0
		else
			ll_affect = 1
		end if
		// Creation du status
		
		ll_statusid = 0
		select status_id into :ll_statusid from t_status where code = :ls_status;
		if SQLCA.SQLCode <> 0 and not isnull(ls_status) then
			insert into t_status(code,description,affect,ortho_id)
			values(:ls_status,:ls_status,1,1);
			error_type(-1)
			select status_id into :ll_statusid from t_status where code = :ls_status;
		end if
		if ll_statusid = 0 then setnull(ll_statusid)
		
		
		// Création du traitement
		
		ll_traitid = 0
		select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid;
		if SQLCA.SQLCode <> 0 then
			insert into traitements(patient_id)
			values(:ll_patid);
			error_type(-1)
			select max(traitement_id) into :ll_traitid from traitements;
		end if
		
		// Faire une recherche des informations du traitments
		
		select dtdébtraitement, dtfermeture, valeurtot, notes
		into :ldt_datedebut, :ldt_fermeture, :ld_couttrait, :ls_note
		from tbplantraitement where nopltraitement = :ll_noplan using pcortho;
		
		update traitements set 	debut_traitement = :ldt_datedebut,
										fin_traitment  =:ldt_fermeture,
										montant_original = :ld_couttrait,
										notes = :ls_note
		where	traitement_id = :ll_traitid;
	
		// Facture
		
		if isnull(ld_montfact) then ld_montfact = 0
		
		if ld_montfact <> 0 then
		
			insert into factures_traitements(date_facture,montant,traitement_id,status_id,
														id_contact, affect,cache)
			values(:ldt_date,:ld_montfact, :ll_traitid, :ll_statusid, :ll_contactid,:ll_affect,0);
			error_type(-1)
		
		end if
		
		//Paiement
		
		if isnull(ld_montpaie) then ld_montpaie = 0
		
		if ld_montpaie <> 0 then
			
			if ldt_date <= today() then
			
				insert into paiement(date_paiement,montant_recu,traitement_patient_id,paiement,
															id_contact, affect,cache)
				values(:ldt_date,:ld_montpaie, :ll_traitid, :ls_mod, :ll_contactid, :ll_affect,0);
				error_type(-1)
				
				if ls_status = 'SP' then
					
					ld_montpaie = ld_montpaie * -1
					insert into paiement(date_paiement,montant_recu,traitement_patient_id,paiement,
															id_contact, affect,cache)
					values(:ldt_date,:ld_montpaie, :ll_traitid, 'NSF', :ll_contactid, :ll_affect,0);
					error_type(-1)
					
				end if
				
			else
				
				insert into cheques_postdates(date_cheque,paiement,traitement_patient_id,indicateur,affect,id_contact,modalite)
				values(:ldt_date, :ld_montpaie, :ll_traitid, '0',1,:ll_contactid,'P');
				error_type(-1)
				
			end if
			
		end if
		
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listtrans INTO		:ll_patid,
										:ll_contactid,
										:ls_status,
										:ll_noplan,
										:ld_montpaie,
										:ld_montfact,
										:ls_mod,
										:ldt_date;

	LOOP

CLOSE listtrans;
commit using SQLCA;
end event

type cb_10 from commandbutton within w_migctrl
integer y = 788
integer width = 974
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Assigner contact"
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_noorgan, ll_count
string ls_status, ls_titre, ls_resptype
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tiContOrgan using pcortho;

i = 1


DECLARE listpat CURSOR FOR
	select 	tiContOrgan.nocontact,
				tiContOrgan.noorganisation,
				tiContOrgan.statut,
				tiContOrgan.titre
	from		tiContOrgan using pcortho;


OPEN listpat;


FETCH listpat INTO			:ll_contactid,
									:ll_noorgan,
								 	:ls_status,
									:ls_titre;
								  
	DO WHILE pcortho.SQLCode = 0
		
		CHOOSE CASE ls_titre
			CASE 'Beau-Père', 'Beau-père'
				ls_resptype = 'bp'
			CASE 'Belle-mère'
				ls_resptype = 'bm'
			CASE 'Grand-Mère'
				ls_resptype = 'gm'
			CASE 'Grand-Père'
				ls_resptype = 'gp'
			CASE 'méè', 'Mère', 'mère'
				ls_resptype = 'm'
			CASE 'Père', 'père'
				ls_resptype = 'p'
			CASE 'Tuteur'
				ls_resptype = 'tu'
			CASE ELSE
				ls_resptype = 'a'
		END CHOOSE
		
		// Type contact
		update t_contact set resptype = :ls_resptype  where id_contact = :ll_contactid;
		error_type(-1)
		
		select count(1) into :ll_count from patient where patient_id = :ll_contactid;
		if ll_count > 0 then
			
			CHOOSE CASE ls_status
				CASE 'Armée','Assureur','Beau-Père','Beau-père','Belle-mère','Centre Jeunesse','Curatelle','Grand-Mère','Grand-Père', 'méè','Mère','mère','Payeur','Père','père','Services Sociaux','Tuteur'
					// Responsable financieur
					update t_contact set patient_id = :ll_contactid  where id_contact = :ll_noorgan;
					error_type(-1)
				CASE 'Chirurgien','Dentiste','dr','Médecin','Orthodontiste','Prostodontiste','Spécialiste'
					// Dentiste
					select count(1) into :ll_count from t_dentists where id_dentist = :ll_noorgan;
					if ll_count = 0 then
						insert into t_dentists(det_nom,det_prenom,det_add,det_ville,det_prov,det_zip,
														det_telbur,det_fax,det_langue,det_email,det_note,
														ortho_id,det_sex,id_sal,actif,inclist,id_dentist)
						(select nom, prenom, adresse, ville, province, zip,
										  telbur, telautre, langue, email, note, 
										  1, sex, id_sal, 1,1, :ll_noorgan from t_contact where id_contact = :ll_noorgan);
						error_type(-1)
					end if
					update patient set id_dentist = :ll_noorgan where patient_id = :ll_contactid;
					error_type(-1)
				CASE 'Référant','référant'
					select count(1) into :ll_count from t_referents where id = :ll_noorgan;
					if ll_count = 0 then
						insert into t_referents(ref_nom,ref_prenom,ref_adresse,ref_ville,ref_province,ref_zip,
														ref_tel_bur,ref_tel_fax,ref_langue,ref_email,ref_note,
														ortho_id,ref_sexe,id_sal,actif,inclist,id)
						(select nom, prenom, adresse, ville, province, zip,
										  telbur, telautre, langue, email, note, 
										  1, sex, id_sal, 1,1, :ll_noorgan from t_contact where id_contact = :ll_noorgan);
						error_type(-1)
					end if
					update patient set referant_nom = :ll_noorgan where patient_id = :ll_contactid;
					error_type(-1)
				CASE ELSE
					update t_contact set patient_id = :ll_contactid  where id_contact = :ll_noorgan;
					error_type(-1)
			END CHOOSE
		end if
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listpat INTO		:ll_contactid,
										:ll_noorgan,
										:ls_status,
										:ls_titre;

LOOP

CLOSE listpat;
commit using SQLCA;
end event

type cb_9 from commandbutton within w_migctrl
integer x = 978
integer y = 676
integer width = 974
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des patients "
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_count, ll_idsal, ll_pat, ll_patid, ll_idstatus
long ll_cntcont
string ls_nom, ls_prenom, ls_titre, ls_sex, ls_langue, ls_notecont, ls_notepat, ls_adresse
string ls_zip, ls_ville, ls_province, ls_notel, ls_typetel, ls_nodos, ls_noboite, ls_notetel = ""
string ls_telres, ls_telbur, ls_cell, ls_telautre, ls_status, ls_alertmed, ls_courriel
date ldt_datenais, ldt_opendoss, ldt_archivedate
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		((tbcontact LEFT OUTER JOIN tbadrcontact ON tbcontact.nocontact = tbadrcontact.nocontact)
							LEFT OUTER JOIN tlville ON tlville.noville = tbadrcontact.noville)
							LEFT OUTER JOIN tlProvÉtats ON tlville.noprov = tlProvÉtats.noprov using pcortho;

i = 1


DECLARE listpat CURSOR FOR
select 	tbcontact.nocontact,
			tbcontact.nom,
			tbcontact.prénom,
			tbcontact.titre,
			tbcontact.naissance,
			tbcontact.sexe,
			tbcontact.langue,
			tbcontact.notescontact,
			tbadrcontact.adresse,
			tbadrcontact.codepostal,
			tlville.ville,
			tlProvÉtats.province	
from		((tbcontact LEFT OUTER JOIN tbadrcontact ON tbcontact.nocontact = tbadrcontact.nocontact)
							LEFT OUTER JOIN tlville ON tlville.noville = tbadrcontact.noville)
							LEFT OUTER JOIN tlProvÉtats ON tlville.noprov = tlProvÉtats.noprov using pcortho;


OPEN listpat;

FETCH listpat INTO			:ll_contactid,
									:ls_nom,
								 	:ls_prenom,
									:ls_titre,
									:ldt_datenais,
									:ls_sex,
									:ls_langue,
									:ls_notecont,
								   :ls_adresse,
								  	:ls_zip,
								   :ls_ville,
								   :ls_province;
								  
								  
	DO WHILE pcortho.SQLCode = 0
		
		select count(*) into :ll_cntcont from t_contact where id_contact = :ll_contactid;
		if ll_cntcont = 0 then
		
			if not(isnull(ls_nom) and isnull(ls_prenom)) then	
				
				if isnull(ls_nom)  then ls_nom = " "
				if isnull(ls_prenom)  then ls_prenom = " "
			
				// Problème des salutations
				
				if isnull(ls_titre) then
					setnull(ll_idsal)
				else
					select count(*) into :ll_count from t_salutation where salutation = :ls_titre;
					if ll_count = 0 then
						insert into t_salutation(salutation,ortho_id) values(:ls_titre,1);
						error_type(-1)
					end if
					select id_sal into :ll_idsal from t_salutation where salutation = :ls_titre;
				end if
				
				// langue
				
				if ls_langue = 'Anglais' then
					ls_langue = 'A'
				else
					ls_langue = 'F'
				end if
				
				// téléphone
				
				setnull(ls_telres)
				setnull(ls_telbur)
				setnull(ls_cell)
				setnull(ls_telautre)
				setnull(ls_courriel)
				
				DECLARE listtel CURSOR FOR
					select Numéro, Type from tbAdrCodContact where nocontact = :ll_contactid using pcortho;
				
				OPEN listtel;
				
				FETCH listtel INTO :ls_notel,:ls_typetel;
				
				DO WHILE pcortho.SQLCode = 0
					
					CHOOSE CASE ls_typetel
						CASE 'Résidence 1'
							ls_telres = ls_notel
						CASE 'Bureau1'
							ls_telbur = ls_notel
						CASE 'Cellulaire'
							ls_cell = ls_notel
						CASE 'Autre'
							ls_telautre = ls_notel
						CASE 'Internet'
							ls_courriel = ls_notel
						CASE ELSE
							ls_notetel += "~r~n" +  ls_notel
					END CHOOSE
					
					FETCH listtel INTO :ls_notel,:ls_typetel;
				LOOP
				
				CLOSE listtel;
				
			
				ls_telres = rep(ls_telres," ","")
				ls_telres = rep(ls_telres,"-","")
				ls_telres = rep(ls_telres,"(","")
				ls_telres = rep(ls_telres,")","")
				ls_telbur = rep(ls_telbur," ","")
				ls_telbur = rep(ls_telbur,"-","")
				ls_telbur = rep(ls_telbur,"(","")
				ls_telbur = rep(ls_telbur,")","")
				ls_cell = rep(ls_cell," ","")
				ls_cell = rep(ls_cell,"-","")
				ls_cell = rep(ls_cell,"(","")
				ls_cell = rep(ls_cell,")","")
				ls_telautre = rep(ls_telautre," ","")
				ls_telautre = rep(ls_telautre,"-","")
				ls_telautre = rep(ls_telautre,"(","")
				ls_telautre = rep(ls_telautre,")","")
				ls_zip = rep(ls_zip," ","")
				
				// Regarder s'il s'agit d'un patient
				
				select count(*) into :ll_pat from tbpatients where nocontpatient = :ll_contactid using pcortho;
				if ll_pat > 0 then
					ll_pat = 1
					ll_patid = ll_contactid
				else
					ll_pat = 0
					setnull(ll_patid)
				end if
	
				// Création du patient
				
				if ll_pat = 1 then
					
					select 	nodossier,
								codecasier,
								notes,
								dtouverture,
								dtfermeture,
								statuts,
								alerte
					into		:ls_nodos,
								:ls_noboite,
								:ls_notepat,
								:ldt_opendoss,
								:ldt_archivedate,
								:ls_status,
								:ls_alertmed
					from 		tbpatients 
					where 	nocontpatient = :ll_patid using pcortho;
					
					// Créer le status s'il existe pas recuperer ID sinon
					
					ls_status = trim(ls_status)
					if ls_status = '' or isnull(ls_status) then 
						setnull(ll_idstatus)
					else
						select count(1) into :ll_count from t_patstatus where nom = :ls_status;
						if ll_count = 0 then
							insert into t_patstatus(nom,ortho_id)
							values(:ls_status,1);
							error_type(-1)
						end if
						select id_patstatus into :ll_idstatus from t_patstatus where nom = :ls_status;
					end if
					
					if isnull(ls_notepat) then ls_notepat = ""
					ls_notepat += ls_notetel
				
					// Création du patient
				
					insert into patient(patient_id,patient_nom,patient_prenom,adresse,ville,
											  province,code_postale,text1,date_naissance,sex,
											  text2,langue,no_ortho,no_boite,opendoss,
											  id_contact,id_sal,note,archivedate,alerte_medical,
											  id_patstatus,new_dossier,email,text5,text6)
					values(:ll_patid,:ls_nom,:ls_prenom,:ls_adresse,:ls_ville,
							 :ls_province,:ls_zip,:ls_telres,:ldt_datenais,:ls_sex,
							 :ls_telbur,:ls_langue,1,:ls_noboite,:ldt_opendoss,
							 :ll_contactid,:ll_idsal,:ls_notepat,:ldt_archivedate,:ls_alertmed,
							 :ll_idstatus,:ls_nodos,:ls_courriel,:ls_cell,:ls_telautre);
					error_type(-1)
				
				end if
				
				if isnull(ls_notecont) then ls_notecont = ""
				ls_notecont += ls_notetel
					
				
				// Création du contact
				
				insert into t_contact(id_contact,nom,prenom, adresse, zip, ville, province,
											 telext, telext1, telext5, telext6, note, sex, langue,
											 pat, patient_id, date_naissance, id_sal,ortho_id,email)
				values(:ll_contactid,:ls_nom,:ls_prenom,:ls_adresse,:ls_zip,:ls_ville,:ls_province,
						 :ls_telres,:ls_telbur,:ls_cell,:ls_telautre,:ls_notecont,:ls_sex,:ls_langue,
						 :ll_pat,:ll_patid,:ldt_datenais,:ll_idsal,1,:ls_courriel);
				error_type(-1)
				
			end if			
		end if
//		insert into t_resps(resp_nom,resp_prenom,resp_adresse,resp_zip,resp_telres, resp_telbur,id_patient,id_province,id_ville,defo)
//		values(:ls_nom, :ls_prenom, :ls_adresse, :ls_zip, :ls_telres, :ls_telbur, :ll_patid, :ll_province, :ll_ville,:ll_pat);
//		gf_sqlerr()

		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
		ls_notetel = ""

	FETCH listpat INTO		:ll_contactid,
									:ls_nom,
								 	:ls_prenom,
									:ls_titre,
									:ldt_datenais,
									:ls_sex,
									:ls_langue,
									:ls_notecont,
								   :ls_adresse,
								  	:ls_zip,
								   :ls_ville,
								   :ls_province;	
LOOP

CLOSE listpat;
commit using SQLCA;
end event

type cb_8 from commandbutton within w_migctrl
integer x = 978
integer y = 904
integer width = 974
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration Finance"
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_noorgan, ll_count, ll_statusid, ll_traitid
long ll_patid
long ll_noplan, ll_affect
string ls_status, ls_mod, ls_note
dec{2} ld_montpaie, ld_montfact, ld_couttrait
date ldt_date, ldt_datedebut, ldt_fermeture
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=baillergeon',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tbpaiements using pcortho;

i = 1


DECLARE listtrans CURSOR FOR
	select 	tbpaiements.nocontpatient,
				tbPaiements.Nocréancier,
				tbpaiements.Réfprojet,
				tbpaiements.Noréfprojet,
				tbpaiements.Montantpaiement,
				tbpaiements.Montantdu,
				tbpaiements.Modedepaiement,
				tbpaiements.Dtduepaiement
	from		tbpaiements 
	order by nocontpatient ASC using pcortho;


OPEN listtrans;


FETCH listtrans INTO			:ll_patid,
									:ll_contactid,
									:ls_status,
									:ll_noplan,
								 	:ld_montpaie,
									:ld_montfact,
									:ls_mod,
									:ldt_date;
								  
	DO WHILE pcortho.SQLCode = 0
		
		select count(*) into :ll_count from t_contact where id_contact = :ll_contactid;
		if ll_count = 0 then
			ll_contactid = ll_patid
		end if
		
		CHOOSE CASE ls_mod
			CASE 'Carte crédit(Autres)'
				ls_mod = 'AmEx'
			CASE 'Carte crédit(Mastercard)'
				ls_mod = 'MC'
			CASE 'Carte crédit(Visa)'
				ls_mod = 'Visa'
			CASE 'Comptant'
				ls_mod = '$'
			CASE 'P Direct'
				ls_mod = 'PD'
			CASE 'Transferts fonds'
				ls_mod = 'trans'
			CASE 'Chèque'
				ls_mod = 'C'
			CASE ELSE
				ls_mod = 'A'
		END CHOOSE
		
		if ls_status = 'Co' then
			ll_affect = 0
		else
			ll_affect = 1
		end if
		// Creation du status
		
		ll_statusid = 0
		select status_id into :ll_statusid from t_status where code = :ls_status;
		if SQLCA.SQLCode <> 0 and not isnull(ls_status) then
			insert into t_status(code,description,affect,ortho_id)
			values(:ls_status,:ls_status,1,1);
			error_type(-1)
			select status_id into :ll_statusid from t_status where code = :ls_status;
		end if
		if ll_statusid = 0 then setnull(ll_statusid)
		
		
		// Création du traitement
		
		ll_traitid = 0
		select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid;
		if SQLCA.SQLCode <> 0 then
			insert into traitements(patient_id)
			values(:ll_patid);
			error_type(-1)
			select max(traitement_id) into :ll_traitid from traitements;
		end if
		
		// Faire une recherche des informations du traitments
		
		select dtdébtraitement, dtfermeture, valeurtot, notes
		into :ldt_datedebut, :ldt_fermeture, :ld_couttrait, :ls_note
		from tbplantraitement where nopltraitement = :ll_noplan using pcortho;
		
		update traitements set 	debut_traitement = :ldt_datedebut,
										fin_traitement  =:ldt_fermeture,
										montant_original = :ld_couttrait,
										note = :ls_note
		where	traitement_id = :ll_traitid;
	
		// Facture
		
		if isnull(ld_montfact) then ld_montfact = 0
		
		if ld_montfact <> 0 then
		
			insert into factures_traitements(date_facture,montant,traitement_id,status_id,
														id_contact, affect,cache)
			values(:ldt_date,:ld_montfact, :ll_traitid, :ll_statusid, :ll_contactid,:ll_affect,0);
			error_type(-1)
		
		end if
		
		//Paiement
		
		if isnull(ld_montpaie) then ld_montpaie = 0
		
		if ld_montpaie <> 0 then
			
			if ldt_date <= today() then
			
				insert into paiement(date_paiement,montant_recu,traitement_patient_id,paiement,
															id_contact, affect,cache)
				values(:ldt_date,:ld_montpaie, :ll_traitid, :ls_mod, :ll_contactid, :ll_affect,0);
				error_type(-1)
				
				if ls_status = 'SP' then
					
					ld_montpaie = ld_montpaie * -1
					insert into paiement(date_paiement,montant_recu,traitement_patient_id,paiement,
															id_contact, affect,cache)
					values(:ldt_date,:ld_montpaie, :ll_traitid, 'NSF', :ll_contactid, :ll_affect,0);
					error_type(-1)
					
				end if
				
			else
				
				if not isnull(ldt_date) then
				
					insert into cheques_postdates(date_cheque,paiement,traitement_patient_id,indicateur,affect,id_contact,modalite)
					values(:ldt_date, :ld_montpaie, :ll_traitid, '0',1,:ll_contactid,'P');
					error_type(-1)
				END IF
				
			end if
			
		end if
		
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listtrans INTO		:ll_patid,
										:ll_contactid,
										:ls_status,
										:ll_noplan,
										:ld_montpaie,
										:ld_montfact,
										:ls_mod,
										:ldt_date;

	LOOP

CLOSE listtrans;
commit using SQLCA;
end event

type cb_6 from commandbutton within w_migctrl
integer x = 978
integer y = 792
integer width = 974
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Assigner contact"
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_noorgan, ll_count
string ls_status, ls_titre, ls_resptype
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=baillergeon',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		tiContOrgan using pcortho;

i = 1


DECLARE listpat CURSOR FOR
	select 	tiContOrgan.nocontact,
				tiContOrgan.noorganisation,
				tiContOrgan.statut,
				tiContOrgan.titre
	from		tiContOrgan using pcortho;


OPEN listpat;


FETCH listpat INTO			:ll_contactid,
									:ll_noorgan,
								 	:ls_status,
									:ls_titre;
								  
	DO WHILE pcortho.SQLCode = 0
		
		CHOOSE CASE ls_titre
			CASE 'Beau-Père', 'Beau-père'
				ls_resptype = 'bp'
			CASE 'Belle-mère'
				ls_resptype = 'bm'
			CASE 'Grand-Mère'
				ls_resptype = 'gm'
			CASE 'Grand-Père'
				ls_resptype = 'gp'
			CASE 'méè', 'Mère', 'mère'
				ls_resptype = 'm'
			CASE 'Père', 'père'
				ls_resptype = 'p'
			CASE 'Tuteur'
				ls_resptype = 'tu'
			CASE ELSE
				ls_resptype = 'a'
		END CHOOSE
		
		// Type contact
		update t_contact set resptype = :ls_resptype  where id_contact = :ll_contactid;
		error_type(-1)
		
		select count(1) into :ll_count from patient where patient_id = :ll_contactid;
		if ll_count > 0 then
			
			CHOOSE CASE ls_status
				CASE 'Agent','autre','beau-Père','Organisme','employée','Grand-mère','Grand-père','Mère','mère','Payeur','Père','père','Fondation','Tuteur'
					// Responsable financieur
					update t_contact set patient_id = :ll_contactid  where id_contact = :ll_noorgan;
					error_type(-1)
				CASE 'Chirurgien','Médecin','Orthodontiste','Endodontiste','Parodontiste','Orthophoniste','Spécialiste','Prosthodontiste','Physiothérapeute','Cli.Chirurgie','Clinique de chirurgi'
					select count(1) into :ll_count from t_referents where id = :ll_noorgan;
					if ll_count = 0 then
						insert into t_referents(ref_nom,ref_prenom,ref_adresse,ref_ville,ref_province,ref_zip,
														ref_tel_bur,ref_tel_fax,ref_langue,ref_email,ref_note,
														ortho_id,ref_sexe,id_sal,actif,inclist,id)
						(select nom, prenom, adresse, ville, province, zip,
										  telbur, telautre, langue, email, note, 
										  1, sex, id_sal, 1,1, :ll_noorgan from t_contact where id_contact = :ll_noorgan);
						error_type(-1)
					end if
					update patient set id_ref = :ll_noorgan where patient_id = :ll_contactid;
					error_type(-1)
				CASE 'Référant'
					select count(1) into :ll_count from t_referents where id = :ll_noorgan;
					if ll_count = 0 then
						insert into t_referents(ref_nom,ref_prenom,ref_adresse,ref_ville,ref_province,ref_zip,
														ref_tel_bur,ref_tel_fax,ref_langue,ref_email,ref_note,
														ortho_id,ref_sexe,id_sal,actif,inclist,id)
						(select nom, prenom, adresse, ville, province, zip,
										  telbur, telautre, langue, email, note, 
										  1, sex, id_sal, 1,1, :ll_noorgan from t_contact where id_contact = :ll_noorgan);
						error_type(-1)
					end if
					update patient set referant_nom = :ll_noorgan where patient_id = :ll_contactid;
					error_type(-1)
				CASE 'Dentiste','dentiste'
					// Dentiste
					select count(1) into :ll_count from t_dentists where id_dentist = :ll_noorgan;
					if ll_count = 0 then
						insert into t_dentists(det_nom,det_prenom,det_add,det_ville,det_prov,det_zip,
														det_telbur,det_fax,det_langue,det_email,det_note,
														ortho_id,det_sex,id_sal,actif,inclist,id_dentist)
						(select nom, prenom, adresse, ville, province, zip,
										  telbur, telautre, langue, email, note, 
										  1, sex, id_sal, 1,1, :ll_noorgan from t_contact where id_contact = :ll_noorgan);
						error_type(-1)
					end if
					update patient set id_dentist = :ll_noorgan where patient_id = :ll_contactid;
					error_type(-1)
			END CHOOSE
		end if
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listpat INTO		:ll_contactid,
										:ll_noorgan,
										:ls_status,
										:ls_titre;

LOOP

CLOSE listpat;
commit using SQLCA;
end event

type st_3 from statictext within w_migctrl
integer x = 18
integer y = 1972
integer width = 745
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_migctrl
integer y = 676
integer width = 974
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des patients "
end type

event clicked;long ll_nbligne, i, ll_contactid, ll_count, ll_idsal, ll_pat, ll_patid, ll_idstatus
string ls_nom, ls_prenom, ls_titre, ls_sex, ls_langue, ls_note, ls_adresse
string ls_zip, ls_ville, ls_province, ls_notel, ls_typetel, ls_nodos, ls_noboite
string ls_telres, ls_telbur, ls_cell, ls_telautre, ls_status, ls_alertmed
date ldt_datenais, ldt_opendoss, ldt_archivedate
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=drdeguise',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

select 	count(*) into :ll_nbligne
from		((tbcontact LEFT OUTER JOIN tbadrcontact ON tbcontact.nocontact = tbadrcontact.nocontact)
							LEFT OUTER JOIN tlville ON tlville.noville = tbadrcontact.noville)
							LEFT OUTER JOIN tlProvÉtats ON tlville.noprov = tlProvÉtats.noprov using pcortho;

i = 1


DECLARE listpat CURSOR FOR
select 	tbcontact.nocontact,
			tbcontact.nom,
			tbcontact.prénom,
			tbcontact.titre,
			tbcontact.naissance,
			tbcontact.sexe,
			tbcontact.langue,
			tbcontact.notescontact,
			tbadrcontact.adresse,
			tbadrcontact.codepostal,
			tlville.ville,
			tlProvÉtats.province	
from		((tbcontact LEFT OUTER JOIN tbadrcontact ON tbcontact.nocontact = tbadrcontact.nocontact)
							LEFT OUTER JOIN tlville ON tlville.noville = tbadrcontact.noville)
							LEFT OUTER JOIN tlProvÉtats ON tlville.noprov = tlProvÉtats.noprov using pcortho;



OPEN listpat;

FETCH listpat INTO			:ll_contactid,
									:ls_nom,
								 	:ls_prenom,
									:ls_titre,
									:ldt_datenais,
									:ls_sex,
									:ls_langue,
									:ls_note,
								   :ls_adresse,
								  	:ls_zip,
								   :ls_ville,
								   :ls_province;
								  
								  
	DO WHILE pcortho.SQLCode = 0
		
		if not(isnull(ls_nom) and isnull(ls_prenom)) then	
			
			if isnull(ls_nom)  then ls_nom = " "
			if isnull(ls_prenom)  then ls_prenom = " "
		
			// Problème des salutations
			
			if isnull(ls_titre) then
				setnull(ll_idsal)
			else
				select count(*) into :ll_count from t_salutation where salutation = :ls_titre;
				if ll_count = 0 then
					insert into t_salutation(salutation,ortho_id) values(:ls_titre,1);
					error_type(-1)
				end if
				select id_sal into :ll_idsal from t_salutation where salutation = :ls_titre;
			end if
			
			// langue
			
			if ls_langue = 'Anglais' then
				ls_langue = 'A'
			else
				ls_langue = 'F'
			end if
			
			// téléphone
			
			DECLARE listtel CURSOR FOR
				select Numéro, Type from tbAdrCodContact where nocontact = :ll_contactid using pcortho;
			
			OPEN listtel;
			
			FETCH listtel INTO :ls_notel,:ls_typetel;
			
			DO WHILE pcortho.SQLCode = 0
				
				CHOOSE CASE ls_typetel
					CASE 'Résidence 1','Résidence 2'
						ls_telres = ls_notel
					CASE 'Bureau1','Bureau2'
						ls_telbur = ls_notel
					CASE 'Cellulaire'
						ls_cell = ls_notel
					CASE ELSE
						ls_telautre = ls_notel
				END CHOOSE
				
				FETCH listtel INTO :ls_notel,:ls_typetel;
			LOOP
			
			CLOSE listtel;
			
		
			ls_telres = rep(ls_telres," ","")
			ls_telres = rep(ls_telres,"-","")
			ls_telres = rep(ls_telres,"(","")
			ls_telres = rep(ls_telres,")","")
			ls_telbur = rep(ls_telbur," ","")
			ls_telbur = rep(ls_telbur,"-","")
			ls_telbur = rep(ls_telbur,"(","")
			ls_telbur = rep(ls_telbur,")","")
			ls_cell = rep(ls_cell," ","")
			ls_cell = rep(ls_cell,"-","")
			ls_cell = rep(ls_cell,"(","")
			ls_cell = rep(ls_cell,")","")
			ls_telautre = rep(ls_telautre," ","")
			ls_telautre = rep(ls_telautre,"-","")
			ls_telautre = rep(ls_telautre,"(","")
			ls_telautre = rep(ls_telautre,")","")
			ls_zip = rep(ls_zip," ","")
			
			// Regarder s'il s'agit d'un patient
			
			select count(*) into :ll_pat from tbpatients where nocontpatient = :ll_contactid using pcortho;
			if ll_pat > 0 then
				ll_pat = 1
				ll_patid = ll_contactid
			else
				ll_pat = 0
				setnull(ll_patid)
			end if

			// Création du patient
			
			if ll_pat = 1 then
				
				select 	nodossier,
							codecasier,
							notes,
							dtouverture,
							dtfermeture,
							statuts,
							alerte
				into		:ls_nodos,
							:ls_noboite,
							:ls_note,
							:ldt_opendoss,
							:ldt_archivedate,
							:ls_status,
							:ls_alertmed
				from 		tbpatients 
				where 	nocontpatient = :ll_patid using pcortho;
				
				// Créer le status s'il existe pas recuperer ID sinon
				
				ls_status = trim(ls_status)
				if ls_status = '' or isnull(ls_status) then 
					setnull(ll_idstatus)
				else
					select count(1) into :ll_count from t_patstatus where nom = :ls_status;
					if ll_count = 0 then
						insert into t_patstatus(nom,ortho_id)
						values(:ls_status,1);
						error_type(-1)
					end if
					select id_patstatus into :ll_idstatus from t_patstatus where nom = :ls_status;
				end if
				
				
				// Création du patient
			
				insert into patient(patient_id,patient_nom,patient_prenom,adresse,ville,
										  province,code_postale,tel_maison,date_naissance,sex,
										  tel_bureau,langue,no_ortho,no_boite,opendoss,
										  id_contact,id_sal,note,archivedate,alerte_medical,
										  id_patstatus,new_dossier)
				values(:ll_patid,:ls_nom,:ls_prenom,:ls_adresse,:ls_ville,
						 :ls_province,:ls_zip,:ls_telres,:ldt_datenais,:ls_sex,
						 :ls_telbur,:ls_langue,1,:ls_noboite,:ldt_opendoss,
						 :ll_contactid,:ll_idsal,:ls_note,:ldt_archivedate,:ls_alertmed,
						 :ll_idstatus,:ls_nodos);
				error_type(-1)
			
			end if
			
			// Création du contact
			
			insert into t_contact(id_contact,nom,prenom, adresse, zip, ville, province,
										 telres, telbur, telcell, telautre, note, sex, langue,
										 pat, patient_id, date_naissance, id_sal,ortho_id)
			values(:ll_contactid,:ls_nom,:ls_prenom,:ls_adresse,:ls_zip,:ls_ville,:ls_province,
					 :ls_telres,:ls_telbur,:ls_cell,:ls_telautre,:ls_note,:ls_sex,:ls_langue,
					 :ll_pat,:ll_patid,:ldt_datenais,:ll_idsal,1);
			error_type(-1)
			
		end if			

//		insert into t_resps(resp_nom,resp_prenom,resp_adresse,resp_zip,resp_telres, resp_telbur,id_patient,id_province,id_ville,defo)
//		values(:ls_nom, :ls_prenom, :ls_adresse, :ls_zip, :ls_telres, :ls_telbur, :ll_patid, :ll_province, :ll_ville,:ll_pat);
//		gf_sqlerr()

		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++

	FETCH listpat INTO		:ll_contactid,
									:ls_nom,
								 	:ls_prenom,
									:ls_titre,
									:ldt_datenais,
									:ls_sex,
									:ls_langue,
									:ls_note,
								   :ls_adresse,
								  	:ls_zip,
								   :ls_ville,
								   :ls_province;	
LOOP

CLOSE listpat;
commit using SQLCA;
end event

type st_2 from statictext within w_migctrl
integer x = 23
integer y = 572
integer width = 690
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Migration PC Ortho"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_migctrl
integer x = 78
integer y = 372
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

type cb_3 from commandbutton within w_migctrl
integer x = 32
integer y = 240
integer width = 974
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration du dossier financier"
end type

event clicked;//string ls_patid, ls_numfact, ls_mod, ls_nce, ls_compte, ls_idvisit, ls_trans, ls_prod
//string ls_dent, ls_surf, ls_code
//long ll_nce, ll_patid, ll_idvisit, ll_count, ll_respid, ll_paieid, ll_nbligne, i, ll_nbpat
//long ll_dent
//date ldt_visitdate, ldt_paiedate
//dec{2} ld_montant
//
//SELECT count(*) into :ll_nbligne FROM ds43faac WHERE  Fd43codtra = 'REC' or Fd43codtra = 'REV';
//i = 1
//
//DECLARE listtrans CURSOR FOR
//
//	SELECT   Fd07numdos,
//			   Fd18dattrt,
//			   Fd43numFac,
//			   Fd43codmda,
//		   	Fd43datfac,
//		   	Fd43monprc,
//			   Fd43reftrs,
//			   Fd43factrt,
//            Fd43codtra,
//				Fd19numden,
//				Fd34cbnsur,
//				Fd17codact,
//				Fd44codass
//	FROM     ds43faac
//WHERE       Fd43codtra = 'REC' or Fd43codtra = 'REV'
//	ORDER BY Fd07numdos asc, Fd43factrt asc, Fd43codtra desc;
//	
//	
//OPEN listtrans;
//
//FETCH listtrans INTO :ls_patid,
//							:ldt_visitdate,
//							:ls_numfact,
//							:ls_mod,
//							:ldt_paiedate,
//							:ld_montant,
//							:ls_nce,
//							:ls_idvisit,
//							:ls_trans,
//							:ls_dent,
//							:ls_surf,
//							:ls_code,
//							:ls_prod;
//
//DO WHILE SQLCA.SQLCode = 0
//	
//	ll_patid = long(ls_patid)
//	select count(*) into :ll_nbpat from t_patients where id_patient = :ll_patid;
//	if ll_nbpat > 0 then
//		ll_idvisit = long(right(ls_idvisit,len(ls_idvisit) - 2))
//		select count(*) into :ll_count from t_visites where id_visit = :ll_idvisit;
//		if ll_count <= 0 then
//			addFact(ll_idvisit, ls_patid, ldt_visitdate)
//		end if
//		
//		ls_mod = trim(ls_mod)
//		CHOOSE CASE ls_mod
//			CASE 'VISA'
//				ls_mod = 'V'
//				ls_compte = 'cas'
//			CASE 'CHEQUE'
//				ls_mod = 'C'
//				ls_compte = 'cas'
//			CASE 'ARGENT'
//				ls_mod = '$'
//				ls_compte = 'cas'
//			CASE 'MASTER'
//				ls_mod = 'MC'
//				ls_compte = 'cas'
//			CASE 'RAMQ'
//				ls_mod = 'ramq'
//				ls_compte = 'amq'
//			CASE ELSE
//				ls_mod = 'A'
//				ls_compte = 'cas'
//		END CHOOSE
//			
//		select id_resp into :ll_respid from t_resps where id_patient = :ll_patid and defo = 1;
//		if ls_trans = 'REV' then
//			ll_dent = long(ls_dent)
//			insert into t_factures(compte,typefact,id_code,id_patient,id_resp, id_visit, montant, prixlab,qte,prod,monttps,monttvq,dent,surf,id_credit)
//			values(:ls_compte,'reg',:ls_code, :ll_patid, :ll_respid, :ll_idvisit, :ld_montant, 0.00,1,:ls_prod,0,0,:ll_dent,:ls_surf,0);
//			gf_sqlerr()
//		else
//			ll_paieid = gf_getIdPaie()
//			insert into t_paiements(id_paiement,compte,id_patient,id_resp,mod,montant,paiedate,typepaie,id_specialist,id_visit) 
//			values(:ll_paieid,:ls_compte,:ll_patid,:ll_respid,:ls_mod,:ld_montant,:ldt_paiedate,'reg',1,:ll_idvisit);
//			gf_sqlerr()
//		end if
//	end if	
//	st_3.text = string(i) + ' / ' + string(ll_nbligne)
//	i++
//
//	FETCH listtrans INTO :ls_patid,
//							:ldt_visitdate,
//							:ls_numfact,
//							:ls_mod,
//							:ldt_paiedate,
//							:ld_montant,
//							:ls_nce,
//							:ls_idvisit,
//							:ls_trans,
//							:ls_dent,
//							:ls_surf,
//							:ls_code,
//							:ls_prod;
//							
//LOOP
//
//CLOSE listtrans;
end event

type cb_2 from commandbutton within w_migctrl
integer x = 32
integer y = 112
integer width = 974
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des patients "
end type

event clicked;//string ls_nodos, ls_nom, ls_prenom, ls_adresse, ls_ville, ls_province, ls_zip, ls_telres
//string ls_telbur, ls_telburext, ls_sex, ls_nas, ls_infopat, ls_langue, ls_ramq
//date ldt_datenais, ldt_opendoss, ldt_ramqexp
//long ll_nodos, ll_province, ll_count, ll_ville,ll_patid, ll_nbligne, i, ll_pat, ll_pos
//long ll_respidville, ll_respidprov, ll_idparente
//string ls_resp, ls_resptelres, ls_resptelbur, ls_respext, ls_resplienpar, ls_respadr
//string ls_respville, ls_respprov, ls_respcop, ls_nomresp, ls_prenomresp
//
//setpointer(hourglass!)
//
//SELECT count(*) into :ll_nbligne FROM dv07pati;
//i = 1
//
//DECLARE listpatctrl CURSOR FOR
//
//	SELECT Fd07numdos,
//			 Fd07nompat,
//			 Fd07prnpat,
//			 Fd07adrpat,
//			 Fd07nomvil,
//			 Fd07nompvc,
//			 Fd07codpos,
//			 Fd07teldom,
//			 Fd07teltra,
//			 Fd07traexn,
//			 Fd07datnai,
//			 Fd07sexpat,
//			 Fd07asusoc,
//			 Fd07datcer,
//			 Fd07descmt,
//			 Fd07lanmtn,
//			 Fd07patnam,
//			 Fd07patexp,
//			 Fd07honrsp,
//			 Fd07hondom,
//			 Fd07hontrv,
//			 Fd07honexn,
//			 Fd07hontyp,
//			 Fd07honadr,
//			 Fd07honvil,
//			 Fd07honpvc,
//			 Fd07honcop
//		FROM dv07pati;
//		
//OPEN listpatctrl;
//
//	FETCH listpatctrl INTO :ls_nodos,
//								  :ls_nom,
//								  :ls_prenom,
//								  :ls_adresse,
//								  :ls_ville,
//								  :ls_province,
//								  :ls_zip,
//								  :ls_telres,
//								  :ls_telbur,
//								  :ls_telburext,
//								  :ldt_datenais,
//								  :ls_sex,
//								  :ls_nas,
//								  :ldt_opendoss,
//								  :ls_infopat,
//								  :ls_langue,
//								  :ls_ramq,
//								  :ldt_ramqexp,
//								  :ls_resp, 
//								  :ls_resptelres, 
//								  :ls_resptelbur, 
//								  :ls_respext, 
//								  :ls_resplienpar, 
//								  :ls_respadr,
//							 	  :ls_respville, 
//								  :ls_respprov, 
//								  :ls_respcop;
//								  
//	DO WHILE SQLCA.SQLCode = 0
//		
//		
//		ll_nodos = long(ls_nodos)
//		ls_nom = trim(ls_nom)
//		ls_prenom = trim(ls_prenom)
//		ls_adresse = trim(left(ls_adresse,50))
//		if isnull(ls_province) = false and ls_province <> '' then
//			select count(*) into :ll_count from t_province where nomprov = :ls_province;
//			if ll_count > 0 then
//				select id_province into :ll_province from t_province where nomprov = :ls_province;
//			else
//				insert into t_province(nomprov,id_pays) values(:ls_province,1);
//				select max(id_province) into :ll_province from t_province;
//			end if
//		end if
//		if isnull(ls_ville) = false and ls_ville <> '' then
//			select count(*) into :ll_count from t_ville where nomville = :ls_ville;
//			if ll_count > 0 then
//				select id_ville into :ll_ville from t_ville where nomville = :ls_ville;
//			else
//				insert into t_ville(nomville,id_province) values(:ls_ville,:ll_province);
//				select max(id_ville) into :ll_ville from t_ville;
//			end if
//		end if
//		ls_telres = left(ls_telres,15)
//		ls_telres = replace(ls_telres,1,2,"")
//		ls_telres = replace(ls_telres,4,1,"")
//		ls_telres = replace(ls_telres,7,1,"")
//		ls_telbur = left(ls_telbur,15)
//		ls_telbur = replace(ls_telbur,1,2,"")
//		ls_telbur = replace(ls_telbur,4,1,"")
//		ls_telbur = replace(ls_telbur,7,1,"")
//		ls_zip = replace(ls_zip,4,1,"")
//		CHOOSE CASE ls_langue
//			CASE 'FRA'
//				ls_langue = 'F'
//			CASE 'ANG'
//				ls_langue = 'A'
//			CASE ELSE
//				ls_langue = 'F'
//		END CHOOSE
//		ls_ramq = left(ls_ramq,12)
//		
//		insert into t_patients(id_patient,nodos,nom,prenom,adresse,id_province,id_ville,zip,telres,
//		telbur,extbur,datenais,sex,nas,opendoss,infopat,langue,ramq,ramqexp,id_specialist) 
//		values(:ll_nodos,:ll_nodos,:ls_nom,:ls_prenom,:ls_adresse, :ll_province,:ll_ville,:ls_zip,:ls_telres,
//		:ls_telbur,:ls_telburext,:ldt_datenais,:ls_sex,:ls_nas,:ldt_opendoss,:ls_infopat,:ls_langue,:ls_ramq,:ldt_ramqexp,1);
//		if gf_sqlerr() = false then
//			select min(id_patient) into :ll_patid from t_patients;
//			ll_patid = ll_patid - 1
//			insert into t_patients(id_patient,nodos,nom,prenom,adresse,id_province,id_ville,zip,telres,
//			telbur,extbur,datenais,sex,nas,opendoss,infopat,langue,ramq,ramqexp,id_specialist) 
//			values(:ll_patid,:ll_nodos,:ls_nom,:ls_prenom,:ls_adresse, :ll_province,:ll_ville,:ls_zip,:ls_telres,
//			:ls_telbur,:ls_telburext,:ldt_datenais,:ls_sex,:ls_nas,:ldt_opendoss,:ls_infopat,:ls_langue,:ls_ramq,:ldt_ramqexp,1);
//		//	messagebox("nodoss",string(ll_nodos))
//		else
//			ll_patid = ll_nodos
//		end if
//		
//		ls_resp = trim(ls_resp)
//		if isnull(ls_resp) = false and ls_resp <> "" then
//			ll_pos = pos(ls_resp,' ')
//			ls_nomresp = left(ls_resp,ll_pos - 1)
//			ls_prenomresp = mid(ls_resp,ll_pos + 1,len(ls_resp))
//			ls_nomresp = left(ls_nomresp,25)
//			ls_prenomresp = left(ls_prenomresp,25)
//			ls_resptelres = left(ls_resptelres,15)
//			ls_resptelres = replace(ls_resptelres,1,2,"")
//			ls_resptelres = replace(ls_resptelres,4,1,"")
//			ls_resptelres = replace(ls_resptelres,7,1,"")
//			ls_resptelbur = left(ls_resptelbur,15)
//			ls_resptelbur = replace(ls_resptelbur,1,2,"")
//			ls_resptelbur = replace(ls_resptelbur,4,1,"")
//			ls_resptelbur = replace(ls_resptelbur,7,1,"")
//			ls_respadr = left(ls_respadr,100)
//			if isnull(ls_respprov) = false and ls_respprov <> '' then
//				select count(*) into :ll_count from t_province where nomprov = :ls_respprov;
//				if ll_count > 0 then
//					select id_province into :ll_respidprov from t_province where nomprov = :ls_respprov;
//				else
//					insert into t_province(nomprov,id_pays) values(:ls_province,1);
//					select max(id_province) into :ll_respidprov from t_province;
//				end if
//			end if
//			if isnull(ls_respville) = false and ls_respville <> '' then
//				select count(*) into :ll_count from t_ville where nomville = :ls_respville;
//				if ll_count > 0 then
//					select id_ville into :ll_respidville from t_ville where nomville = :ls_respville;
//				else
//					insert into t_ville(nomville,id_province) values(:ls_ville,:ll_respidprov);
//					select max(id_ville) into :ll_respidville from t_ville;
//				end if
//			end if
//			ls_respcop = replace(ls_respcop,4,1,"")
//			CHOOSE CASE ls_resplienpar
//				CASE 'P'
//					ll_idparente = 2
//				CASE 'M'
//					ll_idparente = 3
//				CASE 'A'
//					ll_idparente = 4
//				CASE 'T'
//					ll_idparente = 5
//				CASE 'F'
//					ll_idparente = 6
//				CASE 'H'
//					ll_idparente = 7
//				CASE 'A'
//					ll_idparente = 1
//				CASE ELSE
//					ll_idparente = 1
//			END CHOOSE
//			insert into t_resps(resp_nom,resp_prenom,resp_adresse,resp_zip,resp_telres, resp_telbur,id_patient,id_parente,id_province,id_ville,defo)
//			values(:ls_nomresp, :ls_prenomresp, :ls_respadr, :ls_respcop, :ls_resptelres, :ls_resptelbur, :ll_patid, :ll_idparente, :ll_respidprov, :ll_respidville,1);
//			ll_pat = 0
//		else
//			ll_pat = 1
//		end if
//		
//		insert into t_resps(resp_nom,resp_prenom,resp_adresse,resp_zip,resp_telres, resp_telbur,id_patient,id_province,id_ville,defo)
//		values(:ls_nom, :ls_prenom, :ls_adresse, :ls_zip, :ls_telres, :ls_telbur, :ll_patid, :ll_province, :ll_ville,:ll_pat);
//		gf_sqlerr()
//		st_3.text = string(i) + ' / ' + string(ll_nbligne)
//		i++
//		FETCH listpatctrl INTO :ls_nodos,
//								  :ls_nom,
//								  :ls_prenom,
//								  :ls_adresse,
//								  :ls_ville,
//								  :ls_province,
//								  :ls_zip,
//								  :ls_telres,
//								  :ls_telbur,
//								  :ls_telburext,
//								  :ldt_datenais,
//								  :ls_sex,
//								  :ls_nas,
//								  :ldt_opendoss,
//								  :ls_infopat,
//								  :ls_langue,
//								  :ls_ramq,
//								  :ldt_ramqexp,
//								  :ls_resp, 
//								  :ls_resptelres, 
//								  :ls_resptelbur, 
//								  :ls_respext, 
//								  :ls_resplienpar, 
//								  :ls_respadr,
//							 	  :ls_respville, 
//								  :ls_respprov, 
//								  :ls_respcop;
//		
//	LOOP
//
//CLOSE listpatctrl;
//commit using SQLCA;
end event

type cb_1 from commandbutton within w_migctrl
integer x = 3122
integer y = 1924
integer width = 517
integer height = 112
integer taborder = 10
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

type st_1 from statictext within w_migctrl
integer x = 32
integer y = 4
integer width = 631
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Migration CTRL"
boolean focusrectangle = false
end type

type cb_7 from commandbutton within w_migctrl
integer x = 978
integer y = 1016
integer width = 974
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration RDV"
end type

event clicked;long ll_patid, ll_col, ll_nbligne, i, ll_duree, ll_cat, ll_traitid, ll_couleur, ll_count
long ll_conf, ll_notify, ll_codecoul
string ls_nomcouleur, ls_cat, ls_couleur, ls_nomtrait
time lt_heure
date ldt_date
datetime ldtt_heure, ldtt_date
transaction pcortho

pcortho = create transaction

pcortho.DBMS       = 'ODBC'
pcortho.LOCK		  = "0"
pcortho.AutoCommit = True
pcortho.DbParm     = "ConnectString='DSN=baillergeon',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using pcortho;
if pcortho.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", pcortho.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

setpointer(hourglass!)

SELECT	count(*) into :ll_nbligne
FROM		((tbVisitesFutures_5 INNER JOIN tlhrsaux15mn_5 ON tbVisitesFutures_5.hrvisite = tlhrsaux15mn_5.no15min)
			INNER JOIN tltraitements1 ON 	tbVisitesFutures_5.codecouleur = tltraitements1.notraitement1										 
WHERE		annulé = 0 and interne = 1
		   using pcortho;


i = 1


DECLARE listtrans CURSOR FOR
	SELECT	tbVisitesFutures_5.nocontpatient,
				tbVisitesFutures_5.nochaise,
				tbVisitesFutures_5.Confirmé,
				tbVisitesFutures_5.notifié,
				tbVisitesFutures_5.dtvisite,
				tbVisitesFutures_5.duréeminutes,
				tlhrsaux15mn_5.qhdisponibles,
				tbVisitesFutures_5.codecouleur,
				tltraitements1.nomtraitement1,				
				tltraitements1.nocouleur
	FROM		(tbVisitesFutures_5 INNER JOIN tlhrsaux15mn_5 ON tbVisitesFutures_5.hrvisite = tlhrsaux15mn_5.no15min)
				INNER JOIN tltraitements1 ON 	tbVisitesFutures_5.codecouleur = tltraitements1.notraitement1										 
	WHERE		annulé = 0 and interne = 1 using pcortho;


OPEN listtrans;


FETCH listtrans INTO			:ll_patid,
									:ll_col,
									:ll_conf,
									:ll_notify,
									:ldtt_date,
									:ll_duree,
								 	:ldtt_heure,
									:ll_traitid,
									:ls_nomtrait,
									:ll_codecoul;
								  
	DO WHILE pcortho.SQLCode = 0
		
		lt_heure = time(ldtt_heure)
		ldt_date = date(ldtt_date)
		
		if ldt_date >= date(2007,07,31) then
		
			select count(*) into :ll_count from patient where patient_id = :ll_patid;
			if ll_count > 0 then
			
				// Aller chercher la couleur la creer si pas la bonne ramasser le id
				
				select count(*) into :ll_count from t_color where color_id = :ll_codecoul;
				if ll_count = 0 then
					ls_couleur = string(ll_codecoul)
					insert into t_color(color_id,color,name,ortho_id)
					values(:ll_codecoul,:ll_codecoul,:ls_couleur,1);
					error_type(-1)
				end if
				
				// Traitement
				
				select count(*) into :ll_count from type_de_traitement where type_traitement_id = :ll_traitid;
				if ll_count = 0 then
					insert into type_de_traitement(type_traitement_id, nom_traitement,ortho_id,color_id) 
					values(:ll_traitid,:ls_nomtrait,1,:ll_codecoul);
					error_type(-1)
				end if
				
				// Rendez-vous
				
				ll_duree = ll_duree / 10 
				
				if ll_conf = 1 then
				
					insert into t_rdv(rdvdate,rdvheure,patient_id,typetraitid,colonne,ortho_id,duree)
					values(:ldt_date,:lt_heure,:ll_patid,:ll_traitid,:ll_col,1,:ll_duree);
					error_type(-1)
					
				else
					
					insert into rendezvous(prochain_rv,patient_id,traitement_id,no_ortho,ortho_id,duree)
					values(:ldt_date,:ll_patid,:ll_traitid,1,1,:ll_duree);
					error_type(-1)
				
				end if
			
			END IF
		end if
		
		st_3.text = string(i) + ' / ' + string(ll_nbligne)
		i++
	
		FETCH listtrans INTO			:ll_patid,
									:ll_col,
									:ll_conf,
									:ll_notify,
									:ldtt_date,
									:ll_duree,
								 	:ldtt_heure,
									:ll_traitid,
									:ls_nomtrait,
									:ll_codecoul;
								  
	LOOP

CLOSE listtrans;
commit using SQLCA;
end event

