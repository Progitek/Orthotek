$PBExportHeader$w_exportacomba.srw
forward
global type w_exportacomba from w_child
end type
type cb_1 from commandbutton within w_exportacomba
end type
type dw_expaccomba from u_dw within w_exportacomba
end type
type st_titre from statictext within w_exportacomba
end type
type cb_close from commandbutton within w_exportacomba
end type
type em_datefin from editmask within w_exportacomba
end type
type em_datedebut from editmask within w_exportacomba
end type
type st_datefin from statictext within w_exportacomba
end type
type st_datedebut from statictext within w_exportacomba
end type
type cb_export from commandbutton within w_exportacomba
end type
end forward

global type w_exportacomba from w_child
integer x = 214
integer y = 221
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_1 cb_1
dw_expaccomba dw_expaccomba
st_titre st_titre
cb_close cb_close
em_datefin em_datefin
em_datedebut em_datedebut
st_datefin st_datefin
st_datedebut st_datedebut
cb_export cb_export
end type
global w_exportacomba w_exportacomba

forward prototypes
public function integer derniernodepot ()
end prototypes

public function integer derniernodepot ();/////////////////////
// 
// Créé par: Sebastien Tremblay
// Créé le: 30-10-2003
// Demande: 
// Version:
// Modifié par: 
// Modifié le:
//
//////////////////////

string ls_chemin
integer err
integer li_no
OLEObject Acomba
OLEObject JournalKey

SELECT t_options.expath INTO :ls_chemin FROM t_options WHERE ortho_id = :v_no_ortho;

Acomba = CREATE OLEObject
err = Acomba.ConnectToNewObject("AcoX0116.AcombaX")
if err = 0 then
	err = Acomba.CompanyExists(ls_chemin)
	if err <> 0 then
		err =	Acomba.OpenCompany("D:\Fortune", ls_chemin)
		if err = 0 then
			err = Acomba.LogCurrentUser(1, "ii4net")
			if	err =0 then
				JournalKey = CREATE OLEObject
				err = JournalKey.ConnectToNewObject("AcoX0116.JournalKey")
				if err = 0 then
					err = JournalKey.XLastKey(5)
					if err = 0 then
						li_no = JournalKey.JoTransactionNumber
						Acomba.closeCompany()
						return li_no
					else
						MessageBox("Erreur", string(Acomba.GetErrorMessage(err)))
						Acomba.closeCompany()
					end if
				else
					MessageBox("Erreur", string(Acomba.GetErrorMessage(err)))
					Acomba.closeCompany()
				end if
			else
				MessageBox("Erreur", string(Acomba.GetErrorMessage(err)))
				Acomba.closeCompany()
			end if
		else
			MessageBox("Erreur", string(Acomba.GetErrorMessage(err)))
			Acomba.closeCompany()			
		end if
	else
		MessageBox("Erreur", string(Acomba.GetErrorMessage(err)))
	end if
else
	MessageBox("Erreur", string(Acomba.GetErrorMessage(err)))
end if
end function

on w_exportacomba.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_expaccomba=create dw_expaccomba
this.st_titre=create st_titre
this.cb_close=create cb_close
this.em_datefin=create em_datefin
this.em_datedebut=create em_datedebut
this.st_datefin=create st_datefin
this.st_datedebut=create st_datedebut
this.cb_export=create cb_export
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_expaccomba
this.Control[iCurrent+3]=this.st_titre
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.em_datefin
this.Control[iCurrent+6]=this.em_datedebut
this.Control[iCurrent+7]=this.st_datefin
this.Control[iCurrent+8]=this.st_datedebut
this.Control[iCurrent+9]=this.cb_export
end on

on w_exportacomba.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_expaccomba)
destroy(this.st_titre)
destroy(this.cb_close)
destroy(this.em_datefin)
destroy(this.em_datedebut)
destroy(this.st_datefin)
destroy(this.st_datedebut)
destroy(this.cb_export)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_datedebut.text = string(Today())
em_datefin.text = string(Today())
end event

type cb_1 from commandbutton within w_exportacomba
integer x = 608
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Exporter"
end type

event clicked;/////////////////////
// 
// Créé par: Sebastien Tremblay
// Créé le: 28-10-2003
// Demande: 
// Version:
// Modifié par: 
// Modifié le:
//
//////////////////////

string ls_chemin, ls_compterec, ls_ligne, ls_descrip, ls_compte
integer li_fichier
date ldt_debut, ldt_fin, ldt_trans
dec{2} ld_montant
long i

ldt_debut = date(em_datedebut.text)
ldt_fin = date(em_datefin.text)

SELECT t_options.expath, t_options.compterec INTO :ls_chemin, :ls_compterec FROM t_options WHERE ortho_id = :v_no_ortho;

li_fichier = FileOpen(ls_chemin + "\Import\GLImport.001", LineMode!, Write!, LockReadWrite!, Replace!)

ls_ligne	 = "GLImport.001 - Factures pour la période du " + string(ldt_debut, "dd/mm/yyyy") + " au " + string(ldt_fin, "dd/mm/yyyy")
FileWrite(li_fichier, ls_ligne)
ls_ligne	 = "LGL7"
FileWrite(li_fichier, ls_ligne)

for i = 1 to dw_expaccomba.rowcount()
	
	ldt_trans = dw_expaccomba.getItemDate(i,'factures_traitements_datetrans')
	ls_descrip = left(dw_expaccomba.getItemString(i,'cp_mod'),30)
	ld_montant = dw_expaccomba.getItemNumber(i,'mont')
	ls_compte = dw_expaccomba.getItemString(i,'t_status_plancompte')
	
	if ls_compte <> '' and not isnull(ls_compte) then
	
		ls_ligne	 = "E" + string(ldt_trans, "yymmdd")
		ls_ligne = ls_ligne + ls_descrip +	Space(30 - Len(ls_descrip)) + Space(5)		
		FileWrite(li_fichier, ls_ligne)
		
		if dw_expaccomba.getItemString(i,'typetrans') = 'F' then

			if ld_montant >= 0 then
				ls_ligne	 = "T" + Space(7 - Len(ls_compterec)) + ls_compterec + Space(9 - Len(string(abs(ld_montant)))) + string(abs(ld_montant)) + Space(9)
				FileWrite(li_fichier, ls_ligne)
				ls_ligne	 = "T" + Space(7 - Len(ls_compte)) + ls_compte + Space(18 - Len(string(abs(ld_montant)))) + string(abs(ld_montant))
				FileWrite(li_fichier, ls_ligne)	
			else
				ls_ligne	 = "T" + Space(7 - Len(ls_compte)) + ls_compte + Space(9 - Len(string(abs(ld_montant)))) + string(abs(ld_montant)) + Space(9)
				FileWrite(li_fichier, ls_ligne)
				ls_ligne	 = "T" + Space(7 - Len(ls_compterec)) + ls_compterec + Space(18 - Len(string(abs(ld_montant)))) + string(abs(ld_montant))
				FileWrite(li_fichier, ls_ligne)
			end if
			
		else
			
			if ld_montant >= 0 then
				ls_ligne	 = "T" + Space(7 - Len(ls_compte)) + ls_compte + Space(9 - Len(string(abs(ld_montant)))) + string(abs(ld_montant)) + Space(9)
				FileWrite(li_fichier, ls_ligne)
				ls_ligne	 = "T" + Space(7 - Len(ls_compterec)) + ls_compterec + Space(18 - Len(string(abs(ld_montant)))) + string(abs(ld_montant))
				FileWrite(li_fichier, ls_ligne)
			else
				ls_ligne	 = "T" + Space(7 - Len(ls_compterec)) + ls_compterec + Space(9 - Len(string(abs(ld_montant)))) + string(abs(ld_montant)) + Space(9)
				FileWrite(li_fichier, ls_ligne)
				ls_ligne	 = "T" + Space(7 - Len(ls_compte)) + ls_compte + Space(18 - Len(string(abs(ld_montant)))) + string(abs(ld_montant))
				FileWrite(li_fichier, ls_ligne)
			end if
		
		end if
		
	end if
	
next

FileClose(li_fichier)

// UPDATE t_options SET noTrans = :ld_noTrans WHERE ortho_id = :v_no_ortho;

MessageBox("Exportation", "L'exportation sera complétée dès que vous exécuterez Acomba", Information!)















/*

string ls_patnom
string ls_patprenom
date ldt_facdate
dec{2} ld_facmontant
int li_compte
date ldt_debut
date ldt_fin
int li_fichier
string ls_chemin
string ls_ligne
dec{0} ld_noTrans

ldt_debut = date(em_datedebut.text)
ldt_fin = date(em_datefin.text)

SELECT t_options.expath INTO :ls_chemin FROM t_options WHERE ortho_id = :v_no_ortho;

DECLARE curFac CURSOR FOR
SELECT patient.patient_nom,
		 patient.patient_prenom,
		 factures_traitements.date_facture,   
       factures_traitements.montant,
		 t_status.plancompte
  FROM factures_traitements INNER JOIN t_status ON factures_traitements.status_id = t_status.status_id
   								 INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
		 traitements			 INNER JOIN patient ON traitements.patient_id = patient.patient_id
 WHERE factures_traitements.date_facture BETWEEN :ldt_debut AND :ldt_fin;
           			
li_fichier = FileOpen(ls_chemin + "\Import\GLImport.001", LineMode!, Write!, LockReadWrite!, Replace!)

ls_ligne	 = "GLImport.001 - Factures pour la période du " + string(ldt_debut, "dd/mm/yyyy") + " au " + string(ldt_fin, "dd/mm/yyyy")
FileWrite(li_fichier, ls_ligne)

ls_ligne	 = "LGL7"
FileWrite(li_fichier, ls_ligne)

OPEN curFac;

Do While SQLCA.SQLCode = 0
   FETCH curFac INTO :ls_patnom,
							:ls_patprenom,
							:ldt_facdate,
							:ld_facmontant,
							:li_compte;

	//Écriture dans un fichier
	//Assertion : moins de 999 transaction par fichier

	if SQLCA.SQLCode = 0 then
		if Len(ls_patnom + " " + ls_patprenom) <= 30 then
			ls_ligne	 = "E" + Right(string(Year(ldt_facdate)),2) + string(Month(ldt_facdate),'##') + string(Day(ldt_facdate), '##') + ls_patnom + " " + ls_patprenom +	Space(35 - Len(ls_patnom + " " + ls_patprenom))
		else
			ls_ligne	 = "E" + Right(string(Year(ldt_facdate)),2) + string(Month(ldt_facdate)) + string(Day(ldt_facdate)) + Left(ls_patnom + " " + ls_patprenom, 30) + Space(5)
		end if
		
		FileWrite(li_fichier, ls_ligne)
		
		ls_ligne	 = "T   1201" + Space(18 - Len(string(ld_facmontant))) + string(ld_facmontant)
		FileWrite(li_fichier, ls_ligne)

		ls_ligne	 = "T" + Space(7 - Len(string(li_compte))) + string(li_compte) + Space(9 - Len(string(ld_facmontant))) + string(ld_facmontant) + Space(9)
		FileWrite(li_fichier, ls_ligne)
	end if
	
Loop

CLOSE curFac;

SELECT t_options.noTrans INTO :ld_noTrans FROM t_options WHERE ortho_id = :v_no_ortho;
//ld_noTrans = dernierNoDepot()

DECLARE curPai CURSOR FOR
SELECT patient.patient_nom,
		 patient.patient_prenom,
		 paiement.date_paiement,   
       paiement.montant_recu
  FROM paiement	 INNER JOIN traitements ON paiement.traitement_patient_id = traitements.traitement_id,
		 traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
 WHERE paiement.date_paiement BETWEEN :ldt_debut AND :ldt_fin;

OPEN curPai;

Do While SQLCA.SQLCode = 0
   FETCH curPai INTO :ls_patnom,
							:ls_patprenom,
							:ldt_facdate,
							:ld_facmontant;

	//Écriture dans un fichier
	//Assertion : moins de 999 transaction par fichier

	if SQLCA.SQLCode = 0 then
		ld_noTrans++
		
		if Len(ls_patnom + " " + ls_patprenom) <= 30 then
			ls_ligne	 = "D" + Right(string(Year(ldt_facdate)),2) + string(Month(ldt_facdate),'##') + string(Day(ldt_facdate), '##') + ls_patnom + " " + ls_patprenom +	Space(30 - Len(ls_patnom + " " + ls_patprenom)) + string(ld_noTrans)
		else
			ls_ligne	 = "D" + Right(string(Year(ldt_facdate)),2) + string(Month(ldt_facdate)) + string(Day(ldt_facdate)) + Left(ls_patnom + " " + ls_patprenom, 30) + string(ld_noTrans)
		end if
		
		FileWrite(li_fichier, ls_ligne)
		
		ls_ligne	 = "T   1001" + Space(9 - Len(string(ld_facmontant))) + string(ld_facmontant) + Space(9)
		FileWrite(li_fichier, ls_ligne)

		ls_ligne	 = "T   1201" + Space(18 - Len(string(ld_facmontant))) + string(ld_facmontant)
		FileWrite(li_fichier, ls_ligne)
	end if
	
Loop

CLOSE curPai;

FileClose(li_fichier)

UPDATE t_options SET noTrans = :ld_noTrans WHERE ortho_id = :v_no_ortho;

MessageBox("Exportation", "L'exportation sera complétée dès que vous exécuterez Acomba", Information!)

*/
end event

event constructor;if v_langue = 'an' then
	this.text = 'Export'
end if
end event

type dw_expaccomba from u_dw within w_exportacomba
integer x = 9
integer y = 116
integer width = 3621
integer height = 1796
integer taborder = 10
string dataobject = "d_expaccomba"
boolean border = false
boolean righttoleft = true
end type

event constructor;call super::constructor;setTransObject(SQLCA)
end event

type st_titre from statictext within w_exportacomba
integer y = 16
integer width = 1147
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Exportation vers Acomba"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Acomba Export'
end if
end event

type cb_close from commandbutton within w_exportacomba
integer x = 3040
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(Parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type em_datefin from editmask within w_exportacomba
integer x = 2569
integer y = 1940
integer width = 402
integer height = 84
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
string mask = "dd/mm/yyyy"
string displaydata = "~t/"
boolean dropdowncalendar = true
end type

type em_datedebut from editmask within w_exportacomba
integer x = 1847
integer y = 1940
integer width = 402
integer height = 84
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
string mask = "dd/mm/yyyy"
string displaydata = "~t/"
boolean dropdowncalendar = true
end type

type st_datefin from statictext within w_exportacomba
integer x = 2254
integer y = 1948
integer width = 306
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
string text = "Date de fin"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'End Date'
end if
end event

type st_datedebut from statictext within w_exportacomba
integer x = 1431
integer y = 1948
integer width = 398
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
string text = "Date de début"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Start Date'
end if
end event

type cb_export from commandbutton within w_exportacomba
integer x = 9
integer y = 1924
integer width = 594
integer height = 112
integer taborder = 10
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

ldt_debut = gf_emtodate(em_datedebut.text)
ldt_fin = gf_emtodate(em_datefin.text)

dw_expaccomba.retrieve(ldt_debut, ldt_fin, v_no_ortho)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

