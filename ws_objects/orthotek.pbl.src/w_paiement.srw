$PBExportHeader$w_paiement.srw
forward
global type w_paiement from w_child
end type
type em_totpaie from editmask within w_paiement
end type
type st_totpaie from statictext within w_paiement
end type
type em_totfact from editmask within w_paiement
end type
type st_totfact from statictext within w_paiement
end type
type cb_recuresp from commandbutton within w_paiement
end type
type st_phase from statictext within w_paiement
end type
type cb_recuu from commandbutton within w_paiement
end type
type cb_formulaire_a from commandbutton within w_paiement
end type
type cb_recup from commandbutton within w_paiement
end type
type cb_print from commandbutton within w_paiement
end type
type cb_cancel from commandbutton within w_paiement
end type
type cb_insert from commandbutton within w_paiement
end type
type em_solde from editmask within w_paiement
end type
type em_montant_du from editmask within w_paiement
end type
type st_9 from statictext within w_paiement
end type
type st_4 from statictext within w_paiement
end type
type sle_no_dossier from singlelineedit within w_paiement
end type
type sle_prenom_nom from singlelineedit within w_paiement
end type
type st_2 from statictext within w_paiement
end type
type st_5 from statictext within w_paiement
end type
type st_6 from statictext within w_paiement
end type
type sle_age from singlelineedit within w_paiement
end type
type sle_date_naissance from singlelineedit within w_paiement
end type
type st_7 from statictext within w_paiement
end type
type st_3 from statictext within w_paiement
end type
type st_title from statictext within w_paiement
end type
type cb_close from commandbutton within w_paiement
end type
type cb_maj from commandbutton within w_paiement
end type
type rr_1 from roundrectangle within w_paiement
end type
type rr_2 from roundrectangle within w_paiement
end type
type rr_4 from roundrectangle within w_paiement
end type
type dw_paiements_traitement from u_dw within w_paiement
end type
type dw_paiement from u_dw within w_paiement
end type
end forward

global type w_paiement from w_child
string tag = "Payment"
integer width = 3611
integer height = 2028
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
boolean ib_disableclosequery = true
event ue_post_open ( )
em_totpaie em_totpaie
st_totpaie st_totpaie
em_totfact em_totfact
st_totfact st_totfact
cb_recuresp cb_recuresp
st_phase st_phase
cb_recuu cb_recuu
cb_formulaire_a cb_formulaire_a
cb_recup cb_recup
cb_print cb_print
cb_cancel cb_cancel
cb_insert cb_insert
em_solde em_solde
em_montant_du em_montant_du
st_9 st_9
st_4 st_4
sle_no_dossier sle_no_dossier
sle_prenom_nom sle_prenom_nom
st_2 st_2
st_5 st_5
st_6 st_6
sle_age sle_age
sle_date_naissance sle_date_naissance
st_7 st_7
st_3 st_3
st_title st_title
cb_close cb_close
cb_maj cb_maj
rr_1 rr_1
rr_2 rr_2
rr_4 rr_4
dw_paiements_traitement dw_paiements_traitement
dw_paiement dw_paiement
end type
global w_paiement w_paiement

type variables
public integer changement
private integer ii_phase
public long il_traitid
private long il_patid
private string is_montant
datawindowchild dddwin
datawindowchild dddwin1
public long il_idcontact
end variables

forward prototypes
public subroutine labelpatient ()
public subroutine if_close ()
public subroutine sauve ()
public subroutine createfact (date f_datepaie)
public subroutine uf_modalite ()
public function boolean if_validinformation ()
end prototypes

event ue_post_open();gf_uhelp(il_patid)
labelpatient()
//dddwin1.setTransObject(SQLCA)
dddwin1.setFilter("patient_id = " + string(il_patid))
//dddwin1.retrieve()
dw_paiements_traitement.retrieve(il_traitid)
end event

public subroutine labelpatient ();string ls_nom, ls_prenom, ls_age, ls_nodoss, ls_phase
date ldt_naissance
dec{2} ld_frais, ld_frais1, ld_montantpaye, ld_solde, ld_montantdu

select traitements.phase, t_phase.phase 
into :ii_phase, :ls_phase 
from traitements INNER JOIN t_phase ON t_phase.id_phase = traitements.id_phase
where traitement_id = :il_traitid;
st_phase.text = ls_phase
select sum(montant) into :ld_frais from factures_traitements where traitement_id = :il_traitid;
if isnull(ld_frais) then ld_frais = 0  
select sum(montant) into :ld_frais1 from factures_traitements where traitement_id = :il_traitid and date_facture <= today();
if isnull(ld_frais1) then ld_frais1 = 0 
select sum(montant_recu) into :ld_montantpaye from paiement where traitement_patient_id = :il_traitid;
if isnull(ld_montantpaye) then ld_montantpaye = 0
SELECT patient_nom, patient_prenom, date_naissance, new_dossier into :ls_nom,:ls_prenom,:ldt_naissance,:ls_nodoss from patient where patient_id = :il_patid;
sle_prenom_nom.text = ls_nom +" "+ ls_prenom
ls_age = calculage(ldt_naissance)
sle_age.text = ls_age
sle_no_dossier.text = ls_nodoss
sle_date_naissance.text = string(ldt_naissance)
ld_solde = ld_frais - ld_montantpaye
em_solde.text = string(ld_solde)
ld_montantdu = ld_frais1 - ld_montantpaye
em_montant_du.text = string(ld_montantdu)
em_totfact.text = string(ld_frais)
em_totpaie.text = string(ld_montantpaye)



end subroutine

public subroutine if_close ();if changement = 1 then
	if error_type(200) = 1 then
		sauve()
	end if
end if
close(w_paiement)
end subroutine

public subroutine sauve ();// le code est en double c est tres laid, a refaire.... avec des event ue_update
long row,ll_idpaie, ll_droitmodfactpaie
integer li_nbphase
string ls_montant, ls_mod
date v_paiement
dec{2} ld_montant


select droitmodfactpaie into :ll_droitmodfactpaie from t_personnels where id_personnel = :gl_idpers;

dw_paiement.AcceptText()
dw_paiements_traitement.accepttext()
row = dw_paiement.getrow()
if row > 0 then
	v_paiement = dw_paiement.getitemdate(row,"date_paiement")
	ls_mod = dw_paiement.getItemString(row,'paiement')
	ld_montant = dw_paiement.getItemNumber(row,'montant_recu')
	
	if isnull(ls_mod) then
		if v_langue = 'an' then
			messagebox("Information!","A method is needed to save",Information!,Ok!)
		else
			messagebox("Information!","Une modalité est nécessaire pour sauvegarder",Information!,Ok!)
		end if
		return 
	end if
	
	if isnull(ld_montant) then
		if v_langue = 'an' then
			messagebox("Information!","An amount is needed to save",Information!,Ok!)
		else
			messagebox("Information!","Un montant est nécessaire pour sauvegarder",Information!,Ok!)
		end if
		return 
	end if
	
else
	v_paiement = date('01-01-1900')
end if
	// verification de la phase
	select count(*) into :li_nbphase from traitements where patient_id = :il_patid;
	if li_nbphase > ii_phase then
		if error_type(247) = 1 then
			if row > 0 then
				v_paiement = dw_paiement.getitemdate(row,"date_paiement")
				select max(paiement_id) into :ll_idpaie from paiement;
				ll_idpaie++
				ls_montant = string(dw_paiement.getitemnumber(row,'montant_recu'))
				f_logs('add','0',ll_idpaie,il_patid,v_paiement,ls_montant) //log
			else
				setnull(v_paiement)
			end if
			if isnull(v_paiement) = false then
				if isnull(ll_droitmodfactpaie) or daysafter(v_paiement,today()) <= ll_droitmodfactpaie then
					SetRedraw(false)
					if dw_paiement.update(TRUE,FALSE) = 1 then
						createfact(v_paiement)
						if dw_paiements_traitement.update(TRUE,FALSE) = 1 then
							dw_paiement.resetupdate()	// Both updates are OK
							dw_paiements_traitement.resetupdate()		// Clear update flags
							commit using sqlca;							// Commit them
							dw_paiements_traitement.retrieve(il_traitid)
							dw_paiement.reset()
							dw_paiements_traitement.setfocus()
							changement = 0
						else
							error_type(50)
							rollback using sqlca;						// 2nd update failed
						end if
					else
						error_type(50)
						rollback using sqlca;
					end if
					w_paiement.BringToTop = true
					SetRedraw(true)
				else
					messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
				end if
			else
				if dw_paiements_traitement.update() = 1 then
					commit using SQLCA;
					changement = 0
				else
					rollback using SQLCA;
				end if
			end if
		end if
	else
		dw_paiement.AcceptText()
		dw_paiements_traitement.accepttext()
		row = dw_paiement.getrow()
		if row > 0 then
			v_paiement = dw_paiement.getitemdate(row,"date_paiement")
			select max(paiement_id) into :ll_idpaie from paiement;
			ll_idpaie++
			ls_montant = string(dw_paiement.getitemnumber(row,'montant_recu'))
			f_logs('add','0',ll_idpaie,il_patid,v_paiement,ls_montant) //log
		else
			setnull(v_paiement)
		end if
		if isnull(v_paiement) = false then
			if isnull(ll_droitmodfactpaie) or daysafter(v_paiement,today()) <= ll_droitmodfactpaie then
				SetRedraw(false)
				if dw_paiement.update(TRUE,FALSE) = 1 then
					createfact(v_paiement)
					if dw_paiements_traitement.update(TRUE,FALSE) = 1 then
						dw_paiement.resetupdate()	// Both updates are OK
						dw_paiements_traitement.resetupdate()		// Clear update flags
						commit using sqlca;							// Commit them
						dw_paiements_traitement.retrieve(il_traitid)
						dw_paiement.reset()
						dw_paiements_traitement.setfocus()
						changement = 0
					else
						error_type(50)
						rollback using sqlca;						// 2nd update failed
					end if
				else
					error_type(50)
					rollback using sqlca;
				end if
				w_paiement.BringToTop = true
				SetRedraw(true)
			else
				messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
			end if
		else
			if dw_paiements_traitement.update() = 1 then
				commit using SQLCA;
				changement = 0
			else
				rollback using SQLCA;
			end if
		end if
	end if

end subroutine

public subroutine createfact (date f_datepaie);integer li_affect,li_option
dec{2} ld_montant

select createfact into :li_option from t_options;
if li_option = 1 then
	if dw_paiement.getrow() > 0 then
		ld_montant = dw_paiement.getitemnumber(dw_paiement.getrow(),'montant_recu')
		li_affect = dw_paiement.getitemnumber(dw_paiement.getrow(),'affect')
	//	if v_langue = 'an' then
	//		messagebox('Information!','An invoice was created on ' + string(f_datepaie)+' with the amount of '+string(ld_montant) + ' $')
	//	else
	//		messagebox('Avertissement!','Une facture à été créé en date du ' + string(f_datepaie)+' au montant de '+string(ld_montant) + ' $')
	//	end if
		insert into factures_traitements(traitement_id,date_facture,montant,cache,imp,affect,status_id) &
		values(:il_traitid,:f_datepaie,:ld_montant,0,0,:li_affect,1);
	end if
end if
end subroutine

public subroutine uf_modalite ();//string ls_mod
//if v_langue = 'an' then
//	ls_mod = 'Cash~t$/Cheque~tC/Visa~tVisa/MasterCard~tMC/AmericanExpress~tAmEx/Interact~tPD/N.S.F.~tNSF/Credit~tcredit/Transfer~ttrans/Loss~tperte/Postdated~tP/Others~tA/ADJUSTMENT~tmod'
//else
//	ls_mod = 'Comptant~t$/Chèque~tC/Visa~tVisa/MasterCard~tMC/American Express~tAmEx/Paiement direct~tPD/N.S.F.~tNSF/Crédit~tcredit/Transfert~ttrans/Perte~tperte/Postdaté~tP/Autres~tA/AJUSTEMENT~tmod'
//end if
//dw_paiement.object.paiement.values = ls_mod
//dw_paiements_traitement.object.paiement.values = ls_mod
end subroutine

public function boolean if_validinformation ();//if dw_paiement.getitemnumber(1,'') then
//	
//end if
return true
end function

on w_paiement.create
int iCurrent
call super::create
this.em_totpaie=create em_totpaie
this.st_totpaie=create st_totpaie
this.em_totfact=create em_totfact
this.st_totfact=create st_totfact
this.cb_recuresp=create cb_recuresp
this.st_phase=create st_phase
this.cb_recuu=create cb_recuu
this.cb_formulaire_a=create cb_formulaire_a
this.cb_recup=create cb_recup
this.cb_print=create cb_print
this.cb_cancel=create cb_cancel
this.cb_insert=create cb_insert
this.em_solde=create em_solde
this.em_montant_du=create em_montant_du
this.st_9=create st_9
this.st_4=create st_4
this.sle_no_dossier=create sle_no_dossier
this.sle_prenom_nom=create sle_prenom_nom
this.st_2=create st_2
this.st_5=create st_5
this.st_6=create st_6
this.sle_age=create sle_age
this.sle_date_naissance=create sle_date_naissance
this.st_7=create st_7
this.st_3=create st_3
this.st_title=create st_title
this.cb_close=create cb_close
this.cb_maj=create cb_maj
this.rr_1=create rr_1
this.rr_2=create rr_2
this.rr_4=create rr_4
this.dw_paiements_traitement=create dw_paiements_traitement
this.dw_paiement=create dw_paiement
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_totpaie
this.Control[iCurrent+2]=this.st_totpaie
this.Control[iCurrent+3]=this.em_totfact
this.Control[iCurrent+4]=this.st_totfact
this.Control[iCurrent+5]=this.cb_recuresp
this.Control[iCurrent+6]=this.st_phase
this.Control[iCurrent+7]=this.cb_recuu
this.Control[iCurrent+8]=this.cb_formulaire_a
this.Control[iCurrent+9]=this.cb_recup
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_cancel
this.Control[iCurrent+12]=this.cb_insert
this.Control[iCurrent+13]=this.em_solde
this.Control[iCurrent+14]=this.em_montant_du
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.sle_no_dossier
this.Control[iCurrent+18]=this.sle_prenom_nom
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.st_5
this.Control[iCurrent+21]=this.st_6
this.Control[iCurrent+22]=this.sle_age
this.Control[iCurrent+23]=this.sle_date_naissance
this.Control[iCurrent+24]=this.st_7
this.Control[iCurrent+25]=this.st_3
this.Control[iCurrent+26]=this.st_title
this.Control[iCurrent+27]=this.cb_close
this.Control[iCurrent+28]=this.cb_maj
this.Control[iCurrent+29]=this.rr_1
this.Control[iCurrent+30]=this.rr_2
this.Control[iCurrent+31]=this.rr_4
this.Control[iCurrent+32]=this.dw_paiements_traitement
this.Control[iCurrent+33]=this.dw_paiement
end on

on w_paiement.destroy
call super::destroy
destroy(this.em_totpaie)
destroy(this.st_totpaie)
destroy(this.em_totfact)
destroy(this.st_totfact)
destroy(this.cb_recuresp)
destroy(this.st_phase)
destroy(this.cb_recuu)
destroy(this.cb_formulaire_a)
destroy(this.cb_recup)
destroy(this.cb_print)
destroy(this.cb_cancel)
destroy(this.cb_insert)
destroy(this.em_solde)
destroy(this.em_montant_du)
destroy(this.st_9)
destroy(this.st_4)
destroy(this.sle_no_dossier)
destroy(this.sle_prenom_nom)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_age)
destroy(this.sle_date_naissance)
destroy(this.st_7)
destroy(this.st_3)
destroy(this.st_title)
destroy(this.cb_close)
destroy(this.cb_maj)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.rr_4)
destroy(this.dw_paiements_traitement)
destroy(this.dw_paiement)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_idcontact = long(gnv_app.inv_entrepotglobal.of_retournedonnee("contactpaiement"))

if message.doubleparm > 0 then
	il_traitid = message.doubleparm  //passage du parametre externe
	select patient_id into :il_patid from traitements where traitement_id = :il_traitid;
else
	error_type(0)
	close(w_paiement)
end if
w_paiement.postevent('ue_post_open')
end event

type em_totpaie from editmask within w_paiement
integer x = 1390
integer y = 448
integer width = 416
integer height = 64
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type st_totpaie from statictext within w_paiement
integer x = 951
integer y = 448
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Total payé:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Total paid:'
end if
end event

type em_totfact from editmask within w_paiement
integer x = 517
integer y = 448
integer width = 425
integer height = 64
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type st_totfact from statictext within w_paiement
integer x = 37
integer y = 448
integer width = 471
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Total facturé:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Total charged:'
end if
end event

type cb_recuresp from commandbutton within w_paiement
integer x = 1509
integer y = 1892
integer width = 439
integer height = 128
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Reçu resp."
end type

event clicked;long ll_patid
string ls_nomresp
datastore ds_paiement

openWithParm(w_choixresp,il_patid)
ls_nomresp = message.stringparm
ds_paiement = create datastore
ds_paiement.dataobject = "d_paiement_imp"
ds_paiement.SetTransObject(SQLCA)
ds_paiement.retrieve(ls_nomresp)
if isnull(ls_nomresp) = false and ls_nomresp <> "" then
	printsetup()
	ds_paiement.print()
end if
destroy ds_paiement

end event

event constructor;if v_langue = 'an' then
	this.text = 'Rec to Resp'
end if
end event

type st_phase from statictext within w_paiement
integer x = 1947
integer y = 84
integer width = 1403
integer height = 124
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Phase"
boolean focusrectangle = false
end type

type cb_recuu from commandbutton within w_paiement
integer x = 905
integer y = 1892
integer width = 302
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Reçu U"
end type

event clicked;long v_paiement_id

v_paiement_id = dw_paiements_traitement.getitemnumber(dw_paiements_traitement.getrow(),'paiement_id')
if v_paiement_id > 0 then
	w_traitements.IB_PERIODIC = false
	opensheetwithparm(w_recu,v_paiement_id,w_traitements,2,layered!)
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'U Rec'
end if
end event

type cb_formulaire_a from commandbutton within w_paiement
integer x = 462
integer y = 1892
integer width = 443
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Formulaire N"
end type

event clicked;SetPointer(HourGlass!)
OpenWithParm (w_formpaie,il_traitid, w_paiement)
end event

event constructor;if v_langue = 'an' then
	this.text = 'N Form'
end if
end event

type cb_recup from commandbutton within w_paiement
integer x = 1207
integer y = 1892
integer width = 302
integer height = 128
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Reçu P"
end type

event clicked;long v_paiement_id

v_paiement_id = dw_paiements_traitement.getitemnumber(dw_paiements_traitement.getrow(),'paiement_id')
if v_paiement_id > 0 then
	w_traitements.IB_PERIODIC = true
	opensheetwithparm(w_recu,v_paiement_id,w_traitements,2,layered!)
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'P Rec'
end if
end event

type cb_print from commandbutton within w_paiement
integer x = 1952
integer y = 1892
integer width = 402
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rapport"
end type

event clicked;opensheetwithparm(w_rapport_paiement, il_traitid ,w_principal,2,layered!)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Report'
end if
end event

type cb_cancel from commandbutton within w_paiement
integer x = 2354
integer y = 1892
integer width = 407
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;long row, ll_idpaie, ll_idlot, ll_droitmodfactpaie
string coche, v_password, montant, v_montant
date ldt_paiedate, ldt_date
boolean lb_droit

/*select supprpaie into :lb_droit from t_personneldroit where id_personnel = :gl_idpers;
if isNull(lb_droit) then lb_droit = false

if lb_droit then
	error_type(196)
	return 0
end if
*/

dw_paiements_traitement.acceptText()
ldt_date = dw_paiements_traitement.getItemDate(dw_paiements_traitement.getRow(),'date_paiement')

select isnull(droitmodfactpaie,-1) into :ll_droitmodfactpaie from t_personnels where id_personnel = :gl_idpers;
if ((ll_droitmodfactpaie = 0 and ldt_date <= today()) or daysafter(ldt_date,today()) > ll_droitmodfactpaie) and ll_droitmodfactpaie <> -1 then 
	messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
	return 
end if


row = dw_paiements_traitement.getrow()
coche = dw_paiements_traitement.getitemstring(row,"recu")
ldt_paiedate = dw_paiements_traitement.getitemDate(row,"date_paiement")
ll_idlot = dw_paiements_traitement.getitemnumber(row,"id_lot")
	if ll_idlot > 0 then
		error_type(194)
	else
		if coche = "1" then
			if error_type(221) = 1 then
				select password into :v_password from password where typepass = 'paiement';
				if isnull(v_password) = true or v_password = "" then
					error_type(138)
					insert into password (password, typepass, ortho_id) values ('paiement', 'paiement',0);
					commit;
				end if
				openwithparm(w_password_supp_paiement,"paiement")
				if message.stringparm = "ok" then
					if row > 0 then
						ll_idpaie = dw_paiements_traitement.getitemnumber(row,"paiement_id")
						v_montant = string(dw_paiements_traitement.getitemnumber(row,"montant_recu"))
						dw_paiements_traitement.deleterow(row)
						f_logs('del',v_montant,ll_idpaie,il_patid,ldt_paiedate,'0') //log
						changement = 1
					end if
				end if
			end if
		else
			if row > 0 then
				ll_idpaie = dw_paiements_traitement.getitemnumber(row,"paiement_id")
				montant = string(dw_paiements_traitement.getitemdate(row,"date_paiement"))
				v_montant = string(dw_paiements_traitement.getitemnumber(row,"montant_recu"))
				if v_langue = 'an' then
					if messagebox("Avertissement","Are you sure do you want to delete this payment "+montant+" of " + v_montant +"$",Question!,OkCancel!,2) = 1 then
						dw_paiements_traitement.deleterow(row)
						f_logs('del',v_montant,ll_idpaie,il_patid,ldt_paiedate,'0') //log
						changement = 1
						w_paiement.setFocus()
					end if
				else
					if messagebox("Avertissement","Êtes-vous sur de vouloir supprimer le paiement du "+montant+" de " + v_montant +"$",Question!,OkCancel!,2) = 1 then
						dw_paiements_traitement.deleterow(row)
						f_logs('del',v_montant,ll_idpaie,il_patid,ldt_paiedate,'0') //log
						changement = 1
						w_paiement.setFocus()
					end if
				end if
			end if
		end if
	end if






end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_insert from commandbutton within w_paiement
integer x = 9
integer y = 1892
integer width = 453
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long row, ll_idcontact, ll_idsat
integer li_resp
string ls_nom, ls_prenom, ls_r1, ls_r2, ls_r3, ls_nompatient, ls_method, ls_taxe

if il_traitid > 0 then
	row = dw_paiement.insertrow(0)
	dddwin.setTransObject(SQLCA)
	dddwin.setFilter("patient_id = " + string(il_patid)) 
	dddwin.retrieve()
	select id_contact, id_satellite into :ll_idcontact, :ll_idsat from patient where patient_id = :il_patid;
	dw_paiement.setitem(row,"id_contact",il_idcontact)
	dw_paiement.setitem(row,"date_paiement",today())
	dw_paiement.setitem(row,"datedepot",today())
	dw_paiement.setitem(row,"traitement_patient_id",il_traitid)
	dw_paiement.setitem(row,"id_satellite",ll_idsat)
	dw_paiement.setitem(row,"recu","0")
	dw_paiement.setitem(row,"affect",1)
	dw_paiement.setitem(row,"cache",0)
	select phasetype into :ls_taxe from traitements where traitement_id = :il_traitid;
	if ls_taxe = 'e' then 
		dw_paiement.setitem(row,"taxe",1)
	else
		dw_paiement.setitem(row,"taxe",0)
	end if
	select method into :ls_method from t_options where ortho_id = :v_no_ortho;
	if isnull(ls_method) = false then
		dw_paiement.setitem(row,"paiement",ls_method)
	end if
	dw_paiement.SetFocus()
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type em_solde from editmask within w_paiement
integer x = 507
integer y = 368
integer width = 425
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type em_montant_du from editmask within w_paiement
integer x = 1371
integer y = 368
integer width = 416
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type st_9 from statictext within w_paiement
integer x = 9
integer y = 544
integer width = 1879
integer height = 84
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Création d~'un nouveau paiement"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_9.text = 'Edit a new payment'
end if
end event

type st_4 from statictext within w_paiement
integer x = 965
integer y = 208
integer width = 320
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "No dossier:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_4.text = 'File #:'
end if
end event

type sle_no_dossier from singlelineedit within w_paiement
integer x = 1321
integer y = 208
integer width = 416
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "# dossier"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type sle_prenom_nom from singlelineedit within w_paiement
integer x = 279
integer y = 120
integer width = 1312
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "nom prenom"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_2 from statictext within w_paiement
integer x = 37
integer y = 208
integer width = 142
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Âge:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Age:'
end if
end event

type st_5 from statictext within w_paiement
integer x = 37
integer y = 288
integer width = 553
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Date de naissance:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Birthdate:'
end if
end event

type st_6 from statictext within w_paiement
integer x = 37
integer y = 368
integer width = 329
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Solde:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Balance:'
end if
end event

type sle_age from singlelineedit within w_paiement
integer x = 357
integer y = 208
integer width = 430
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "age"
boolean border = false
end type

type sle_date_naissance from singlelineedit within w_paiement
integer x = 827
integer y = 288
integer width = 846
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "date de naissance"
boolean border = false
end type

type st_7 from statictext within w_paiement
integer x = 933
integer y = 368
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Montant dû:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Due amount:'
end if
end event

type st_3 from statictext within w_paiement
integer x = 37
integer y = 128
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Patient:"
boolean focusrectangle = false
end type

type st_title from statictext within w_paiement
integer width = 544
integer height = 88
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Paiements"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Payment'
end if
end event

type cb_close from commandbutton within w_paiement
integer x = 3205
integer y = 1892
integer width = 402
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if_close()
if isvalid(w_traitements) then
	w_traitements.tab_dossfin.tabpage_tous.dw_traitements.retrieve(w_traitements.il_traitid)
	w_traitements.tab_sommaires.tabpage_paiements.dw_sommaire_paiement.Retrieve(w_traitements.il_traitid)
	w_traitements.tab_sommaires.tabpage_factures.dw_factures_sommaire.retrieve(w_traitements.il_traitid)
	w_traitements.cbrefresh()
	w_traitements.checksolde()
end if


end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_maj from commandbutton within w_paiement
integer x = 2766
integer y = 1892
integer width = 434
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()
cb_insert.setfocus()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type rr_1 from roundrectangle within w_paiement
integer linethickness = 1
long fillcolor = 80269524
integer x = 5
integer y = 104
integer width = 1851
integer height = 436
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_paiement
integer linethickness = 1
long fillcolor = 80269524
integer x = 5
integer y = 636
integer width = 3602
integer height = 304
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_4 from roundrectangle within w_paiement
integer linethickness = 1
long fillcolor = 80269524
integer x = 5
integer y = 948
integer width = 3602
integer height = 928
integer cornerheight = 40
integer cornerwidth = 46
end type

type dw_paiements_traitement from u_dw within w_paiement
integer x = 18
integer y = 964
integer width = 3579
integer height = 892
integer taborder = 110
string title = "Paiements traitement"
string dataobject = "d_paiements_traitement"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
if dw_paiements_traitement.GetChild('id_contact', dddwin1) = -1 then
	error_type(0)
end if
if v_langue = 'an' then
	dw_paiements_traitement.Object.date_paiement_t.text = 'Date'
	dw_paiements_traitement.Object.montant_recu_t.text = 'Amount'
	dw_paiements_traitement.Object.paiement_t.text = 'Payment'
	dw_paiements_traitement.Object.t_1.text = 'Responsible Party'
	dw_paiements_traitement.Object.recu_t.text = 'Receipt'
	dw_paiements_traitement.Object.t_3.text = 'Check #'
	dw_paiements_traitement.Object.t_qty.text = 'Qty:' 
end if

dw_paiements_traitement.object.paiement.values = gf_method(v_langue)
end event

event itemchanged;date ldt_paie, ldt_date, ldt_dateavenir
long ll_droitmodfactpaie

ldt_date = dw_paiements_traitement.getItemDate(dw_paiements_traitement.getRow(),'date_paiement')
if dwo.name = 'date_paiement' then
	ldt_dateavenir = date(data)
else
	ldt_dateavenir = ldt_date
end if

select isnull(droitmodfactpaie,-1) into :ll_droitmodfactpaie from t_personnels where id_personnel = :gl_idpers;
if ((ll_droitmodfactpaie = 0 and (ldt_date <= today() or ldt_dateavenir <= today())) or (daysafter(ldt_date,today()) > ll_droitmodfactpaie and daysafter(ldt_dateavenir,today()) > ll_droitmodfactpaie)) and ll_droitmodfactpaie <> -1 then
	messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
	return 2
end if

changement = 1
if dwo.name = 'montant_recu' then
	ldt_paie = getItemDate(row,'date_paiement')
	f_logs('chg',is_montant,il_traitid,il_patid,ldt_paie,data)
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

event editchanged;changement = 1
end event

event clicked;if dwo.name = 'montant_recu' then
	is_montant = string(getItemNumber(row,'montant_recu'))
end if
end event

event itemfocuschanged;// barrer la transaction si necessaire
//if row > 0 then
//	if getitemdate(row,'date_paiement') <= idt_lockdate then
//		modify("date_paiement.Edit.displayonly = true")
//		modify("montant_recu.Edit.displayonly = true")
//		modify("paiement.Edit.displayonly = true")
//		modify("nocheque.Edit.displayonly = true")
//		modify("dddwin1.id_contact.Edit.displayonly = true")
//	else
//		modify("date_paiement.Edit.displayonly = false")
//		modify("montant_recu.Edit.displayonly = false")
//		modify("paiement.Edit.displayonly = false")
//		modify("nocheque.Edit.displayonly = false")
//		modify("dddwin1.id_contact.Edit.displayonly = false")
//	end if
//end if
end event

event retrieveend;call super::retrieveend;datawindowchild dwc_phase

if getChild("traitement_patient_id", dwc_phase) = -1 then
	error_type(0)
	return 0
end if

dwc_phase.setTransObject(SQLCA)
dwc_phase.setFilter("traitements_patient_id = " + string(il_patid))
dwc_phase.retrieve()

end event

type dw_paiement from u_dw within w_paiement
event ue_update ( )
integer x = 18
integer y = 656
integer width = 3579
integer height = 248
integer taborder = 50
string dataobject = "d_paiement"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();//		dw_paiement.AcceptText()
////		dw_paiements_traitement.accepttext()
//		row = dw_paiement.getrow()
//		if row > 0 then
//			v_paiement = dw_paiement.getitemdate(row,"date_paiement")
//			select max(paiement_id) into :ll_idpaie from paiement;
//			ll_idpaie++
//			ls_montant = string(dw_paiement.getitemnumber(row,'montant_recu'))
//			f_logs('add','0',ll_idpaie,il_patid,v_paiement,ls_montant) //log
//		else
//			setnull(v_paiement)
//		end if
//		if v_paiement < today() and isnull(v_paiement) = false then
//			SetRedraw(false)
//			if error_type(247) = 1 then
//				if dw_paiement.update(TRUE,FALSE) = 1 then
//					createfact(v_paiement)
////					if dw_paiements_traitement.update(TRUE,FALSE) = 1 then
//						dw_paiement.resetupdate()	// Both updates are OK
////						dw_paiements_traitement.resetupdate()		// Clear update flags
//						commit using sqlca;							// Commit them
//						dw_paiements_traitement.retrieve(il_traitid)
//						dw_paiement.reset()
//						dw_paiements_traitement.setfocus()
//						changement = 0
//					else
//						error_type(50)
//						rollback using sqlca;						// 2nd update failed
//					end if
//				else
//					error_type(50)
//					rollback using sqlca;
//				end if
//			end if
//			w_paiement.BringToTop = true
//			SetRedraw(true)
//		else
//			if dw_paiement.update(TRUE,FALSE) = 1 then
//				createfact(v_paiement)
//				if dw_paiements_traitement.update(TRUE,FALSE) = 1 then
//					dw_paiement.resetupdate()	// Both updates are OK
//					dw_paiements_traitement.resetupdate()		// Clear update flags
//					commit using sqlca;							// Commit them
//					dw_paiements_traitement.retrieve(il_traitid)
//					dw_paiement.reset()
//					dw_paiements_traitement.setfocus()
//					changement = 0
//					labelpatient()
//				else
//					error_type(50)
//					rollback using sqlca;						// 2nd update failed
//				end if
//			else
//				error_type(50)
//				rollback using sqlca;
//			end if
//		end if
//	end if
end event

event editchanged;changement = 1
end event

event itemchanged;changement = 1
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject (SQLCA)
if dw_paiement.GetChild('id_contact', dddwin) = -1 then
	error_type(0)
end if
//dw_paiement.Object.paiement.ValidationMsg = "La modalité de paiement est manquante"
//dw_paiement.Object.montant_recu.ValidationMsg = "Le montant reçu est manquant"

if v_langue = 'an' then
	dw_paiement.Object.paiement_t.text = 'Method'
	dw_paiement.Object.date_paiement_t.text = 'Date'
	dw_paiement.Object.t_date.text = 'Exp. Date'
	dw_paiement.Object.t_cheque.text = 'Check #'
	dw_paiement.Object.montant_recu_t.text = 'Amount'
	dw_paiement.Object.t_1.text = 'Responsible Party'
	object.paiement.values = 'Cash~t$/Cheque~tC/Visa~tVisa/MasterCard~tMC/AmericanExpress~tAmEx/Interact~tPD/N.S.F.~tNSF/Credit~tcredit/Transfer~ttrans/Loss~tperte/Postdated~tP/Monthly Charge~tmens/Others~tA/Adjustment~tmod/N.S.F. Visa~tnsfv/N.S.F. Mastercard~tmsfm/Money Order~tmo'
else
	object.paiement.values = 'Comptant~t$/Chèque~tC/Visa~tVisa/MasterCard~tMC/American Express~tAmEx/Paiement Direct~tPD/N.S.F.~tNSF/Crédit~tcredit/Transfert~ttrans/Perte~tperte/Postdaté~tP/Mensualité~tmens/Autres~tA/Ajustement~tmod/N.S.F. Visa~tnsfv/N.S.F. Mastercard~tmsfm/Mandat poste~tmo'
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


//IF sqldbcode = -195 THEN 
//	error_type(51)
//END IF
//RETURN 1
end event

event itemfocuschanged;//if dwo.name = 'paiement' then
	choose case this.getitemstring(row,'paiement')
		case 'C'
			//active nocheque
			this.SetTabOrder('nocheque',30)
			this.SetTabOrder('nocarte',0)
			this.SetTabOrder('datecarte',0)
			this.Object.t_cheque.Text = "# Chèque"
			this.Object.nocheque.Visible = true
			this.Object.nocarte.Visible = false
			this.Object.nocheque.Edit.DisplayOnly = false
			this.Object.nocheque.Background.Color = rgb(255,255,255)
			this.Object.nocheque.Color = rgb(0,0,0)
			this.Object.datecarte.Background.Color = rgb(132,130,132)
			this.Object.datecarte.Color = rgb(255,255,255)
	
		case 'Visa', 'MC', 'AmEx'
			//active nocarte
			this.SetTabOrder('nocheque',0)
			this.SetTabOrder('nocarte',30)
			this.SetTabOrder('datecarte',40)
			this.Object.t_cheque.Text = "# Carte"
			this.Object.nocheque.Visible = false
			this.Object.nocarte.Visible = true
			this.Object.nocheque.Edit.DisplayOnly = true
			this.Object.nocheque.Background.Color = rgb(255,255,255)
			this.Object.nocheque.Color = rgb(0,0,0)
			this.Object.datecarte.Background.Color = rgb(255,255,255)
			this.Object.datecarte.Color = rgb(0,0,0)
		
		case else
			//desactive
			this.SetTabOrder('nocheque',0)
			this.SetTabOrder('nocarte',0)
			this.SetTabOrder('datecarte',0)
			this.Object.nocheque.Visible = true
			this.Object.nocarte.Visible = false
			this.Object.nocheque.Edit.DisplayOnly = true
			this.Object.nocheque.Background.Color = rgb(132,130,132)
			this.Object.nocheque.Color = rgb(255,255,255)
			this.Object.datecarte.Background.Color = rgb(132,130,132)
			this.Object.datecarte.Color = rgb(255,255,255)
	end choose
//end if
end event

