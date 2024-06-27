$PBExportHeader$w_exportsimple.srw
forward
global type w_exportsimple from w_main
end type
type cb_print from commandbutton within w_exportsimple
end type
type cb_search from commandbutton within w_exportsimple
end type
type dw_exportquickbook from u_dw within w_exportsimple
end type
type st_titre from statictext within w_exportsimple
end type
type cb_close from commandbutton within w_exportsimple
end type
type em_fin from editmask within w_exportsimple
end type
type em_debut from editmask within w_exportsimple
end type
type st_datefin from statictext within w_exportsimple
end type
type st_datedebut from statictext within w_exportsimple
end type
type cb_export from commandbutton within w_exportsimple
end type
end forward

global type w_exportsimple from w_main
integer width = 3630
integer height = 2112
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean ib_isupdateable = false
event ue_spec_choice ( )
cb_print cb_print
cb_search cb_search
dw_exportquickbook dw_exportquickbook
st_titre st_titre
cb_close cb_close
em_fin em_fin
em_debut em_debut
st_datefin st_datefin
st_datedebut st_datedebut
cb_export cb_export
end type
global w_exportsimple w_exportsimple

type variables
long il_spec[]
private long ii_index = 0
end variables

forward prototypes
public function integer derniernodepot ()
public subroutine maj_transactions ()
public function decimal getsolde (long al_visit)
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

//SELECT t_options.expath INTO :ls_chemin FROM t_options WHERE ortho_id = :v_no_ortho;

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

public subroutine maj_transactions ();/////////////////////
// 
// Créé par: Sebastien Tremblay
// Créé le: 22-10-2004
// Demande: 
// Version: 
// Description: Cette fonction remplit la dw avec les transactions
//					 à exporter dans accomba.
// Modifié par: 
// Modifié le:
//
//////////////////////

long ll_idvisit, ll_spec, ll_compte, ll_row, ll_cpt, ll_mod[], ll_vide[], ll_qte
date ldt_visitdate, ldt_debut, ldt_fin
string ls_compte, ls_prod, ls_modal, ls_ctps, ls_ctvq, ls_mod[], ls_vide[]
dec{2} ld_montant, ld_lab, ld_lab2, ld_tps, ld_tvq, ld_total, ld_mod[], ld_vide[]
boolean lb_trparmod

ldt_debut = date(em_debut.text)
ldt_fin = date(em_fin.text)

// Obtention de l'option d'une transaction par modalité de paiement
SELECT unetrparmod INTO :lb_trparmod FROM t_optiongen;

for ll_spec = 1 to upperBound(il_spec)
	
		// Obtention des comptes de taxes
		SELECT comptetps, comptetvq INTO :ls_ctps, :ls_ctvq FROM t_options WHERE id_specialist = :il_spec[ll_spec];

		// Curseur pour les visites

		DECLARE curVisit CURSOR FOR
			SELECT id_visit, visitdate
			  FROM t_visites
			 WHERE visitdate BETWEEN :ldt_debut AND :ldt_fin AND id_specialist = :il_spec[ll_spec] AND id_visit > 0
		 ORDER BY visitdate ASC, id_visit ASC;
		
		// Curseur pour les factures
		
		DECLARE curFact CURSOR FOR
		SELECT t_factures.montant,
			    t_factures.qte,
				 t_factures.prixlab, 
				 t_factures.prixlab2, 
				 t_factures.monttps, 
				 t_factures.monttvq,
				 t_producteur.descrip, 
				 t_producteur.nocompte 
		  FROM t_producteur INNER JOIN t_factures ON t_factures.prod = t_producteur.codeprod AND
				 (SELECT id_specialist FROM t_visites WHERE t_visites.id_visit = :ll_idvisit) = t_producteur.id_specialist
		 WHERE abs(t_factures.id_visit) = :ll_idvisit;
		 
		// Curseur pour les paiements
		DECLARE curPaie CURSOR FOR
		SELECT t_paiements.montant,
				 t_modalites.descmodal, 
				 t_modalites.comptemodal 
		  FROM t_paiements INNER JOIN t_modalites ON t_paiements.mod = t_modalites.codemodal  AND t_paiements.id_specialist = t_modalites.id_specialist
		 WHERE abs(t_paiements.id_visit) = :ll_idvisit and t_paiements.paiedate BETWEEN :ldt_debut AND :ldt_fin;
		  
		
		OPEN curVisit;
			
		FETCH curVisit INTO :ll_idvisit, :ldt_visitdate;
		
		do while SQLCA.SQLCode = 0
			
			OPEN curFact;
			FETCH curFact INTO :ld_montant, :ll_qte, :ld_lab, :ld_lab2, :ld_tps, :ld_tvq, :ls_prod, :ll_compte;
			do while SQLCA.SQLCode = 0
			
				// Calcul du monatant, excluant les taxes
				if isNull(ld_montant) then ld_montant = 0
				if isNull(ld_lab) then ld_lab = 0
				if isNull(ld_lab2) then ld_lab2 = 0
				ld_total = ld_montant + ld_lab + ld_lab2
				if ld_total <> 0 then
					ll_row = dw_exportquickbook.insertRow(0)
					if ll_row <> 0 then
						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
						dw_exportquickbook.setItem(ll_row, 't_factures_prod', ls_prod)
						dw_exportquickbook.setItem(ll_row, 't_factures_montant', ld_total)
						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', string(ll_compte))
						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
					end if
				end if
				
				// Ajout des 2 comptes de taxes
				// Ajout de la TPS
				if ld_tps <> 0 and not isNull(ld_tps) then
					ll_row = dw_exportquickbook.insertRow(0)
					if ll_row <> 0 then
						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
						dw_exportquickbook.setItem(ll_row, 't_factures_prod', 'TPS')
						dw_exportquickbook.setItem(ll_row, 't_factures_montant', ld_tps)
						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', ls_ctps) // compte TPS
						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
					end if
				end if
				
				// Ajout de la TVQ
				if ld_tps <> 0 and not isNull(ld_tps) then
					ll_row = dw_exportquickbook.insertRow(0)
					if ll_row <> 0 then
						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
						dw_exportquickbook.setItem(ll_row, 't_factures_prod', 'TVQ')
						dw_exportquickbook.setItem(ll_row, 't_factures_montant', ld_tvq)
						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', ls_ctvq) // compte TVQ
						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
					end if
				end if
				
				FETCH curFact INTO :ld_montant, :ll_qte, :ld_lab, :ld_lab2, :ld_tps, :ld_tvq, :ls_prod, :ll_compte;
			loop
			CLOSE curFact;
			
			OPEN curPaie;
			FETCH curPaie INTO :ld_montant, :ls_modal, :ll_compte;
			do while SQLCA.SQLCode = 0
				// Si l'option d'une seule transaction par modalité est activée
				if lb_trparmod then
					// Recherche de la modalité en question
					if upperBound(ls_mod) = 0 then
						ls_mod[1] = ls_modal
						ll_mod[1] = ll_compte
						ld_mod[1] = ld_montant
					else
						ll_cpt = 1
						do while ls_mod[ll_cpt] <> ls_modal and ll_cpt < upperBound(ls_mod)
							ll_cpt++
						loop

						// Si c'est le premier paiement fait avec cette modalité, on l'ajoute à la fin du vecteur
						// à la position ll_cpt qui a la valeur de la prochaine position à combler
						if ls_mod[ll_cpt] <> ls_modal then
							ll_cpt++
							ls_mod[ll_cpt] = ls_modal
							ll_mod[ll_cpt] = ll_compte
							ld_mod[ll_cpt] = ld_montant
						else // Sinon, on additionne le montant à ceux des paiements faits avec cette modalité
							ld_mod[ll_cpt] += ld_montant
						end if
					end if
					
				else // L'option d'une seule transaction par modalité est désactivée
					if ld_total = 0 then
						ll_row = dw_exportquickbook.insertRow(0)
					end if
					if ll_row <> 0 then
						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
						dw_exportquickbook.setItem(ll_row, 't_modalites_descmodal', ls_modal)
						dw_exportquickbook.setItem(ll_row, 't_paiements_montant', ld_montant)
						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', string(ll_compte))
						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
					end if
				end if
				FETCH curPaie INTO :ld_montant, :ls_modal, :ll_compte;
			loop
			CLOSE curPaie;
			ld_total = 0
			ld_tps = 0
			ld_tvq = 0
			ld_montant = 0
			
			FETCH curVisit INTO :ll_idvisit, :ldt_visitdate;
		loop
		
		// Curseur pour les paiements dont la facture existe deja
		DECLARE curPaie2 CURSOR FOR
			SELECT t_paiements.montant,
				 t_modalites.descmodal, 
				 t_modalites.comptemodal,
				 t_paiements.paiedate,
				 t_paiements.id_visit
		  FROM t_paiements INNER JOIN t_modalites ON t_paiements.mod = t_modalites.codemodal  AND t_paiements.id_specialist = t_modalites.id_specialist
		 						 INNER JOIN t_visites ON t_visites.id_visit = t_paiements.id_visit
		 WHERE t_paiements.paiedate BETWEEN :ldt_debut AND :ldt_fin AND visitdate < :ldt_debut;
		
		OPEN curPaie2;
		
		FETCH curPaie2 INTO :ld_montant, :ls_modal, :ll_compte, :ldt_visitdate,:ll_idvisit;
		
		DO WHILE SQLCA.SQLCode = 0
			ll_row = dw_exportquickbook.insertRow(0)
			if ll_row <> 0 then
				dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
				dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
				dw_exportquickbook.setItem(ll_row, 't_modalites_descmodal', ls_modal)
				dw_exportquickbook.setItem(ll_row, 't_paiements_montant', ld_montant)
				dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', string(ll_compte))
				dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
			end if
			FETCH curPaie2 INTO :ld_montant, :ls_modal, :ll_compte, :ldt_visitdate,:ll_idvisit;	
		LOOP
		
		OPEN curPaie2;
	next
//		do while SQLCA.SQLCode = 0
//			// Curseur pour les factures
//			OPEN curFact;
//			FETCH curFact INTO :ld_montant, :ll_qte, :ld_lab, :ld_lab2, :ld_tps, :ld_tvq, :ls_prod, :ll_compte;
//			do while SQLCA.SQLCode = 0
//			
//				// Calcul du monatant, excluant les taxes
//				if isNull(ld_montant) then ld_montant = 0
//				if isNull(ld_lab) then ld_lab = 0
//				if isNull(ld_lab2) then ld_lab2 = 0
//				ld_total = ld_montant + ld_lab + ld_lab2
//				if ld_total <> 0 then
//					ll_row = dw_exportquickbook.insertRow(0)
//					if ll_row <> 0 then
//						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
//						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_descmodal', ls_prod)
//						dw_exportquickbook.setItem(ll_row, 't_factures_montant', ld_total)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', string(ll_compte))
//						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
//					end if
//				end if
//				
//				// Ajout des 2 comptes de taxes
//				// Ajout de la TPS
//				if ld_tps <> 0 and not isNull(ld_tps) then
//					ll_row = dw_exportquickbook.insertRow(0)
//					if ll_row <> 0 then
//						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
//						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_descmodal', 'TPS')
//						dw_exportquickbook.setItem(ll_row, 't_factures_montant', ld_tps)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', ls_ctps) // compte TPS
//						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
//					end if
//				end if
//				
//				// Ajout de la TVQ
//				if ld_tps <> 0 and not isNull(ld_tps) then
//					ll_row = dw_exportquickbook.insertRow(0)
//					if ll_row <> 0 then
//						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
//						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_descmodal', 'TVQ')
//						dw_exportquickbook.setItem(ll_row, 't_factures_montant', ld_tvq)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', ls_ctvq) // compte TVQ
//						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
//					end if
//				end if
//				
//				FETCH curFact INTO :ld_montant, :ll_qte, :ld_lab, :ld_lab2, :ld_tps, :ld_tvq, :ls_prod, :ll_compte;
//			loop
//			CLOSE curFact;
//	
//			// Curseur pour les paiements
//			OPEN curPaie;
//			FETCH curPaie INTO :ld_montant, :ls_modal, :ll_compte;
//			do while SQLCA.SQLCode = 0
//				// Si l'option d'une seule transaction par modalité est activée
//				if lb_trparmod then
//					// Recherche de la modalité en question
//					if upperBound(ls_mod) = 0 then
//						ls_mod[1] = ls_modal
//						ll_mod[1] = ll_compte
//						ld_mod[1] = ld_montant
//					else
//						ll_cpt = 1
//						do while ls_mod[ll_cpt] <> ls_modal and ll_cpt < upperBound(ls_mod)
//							ll_cpt++
//						loop
//
//						// Si c'est le premier paiement fait avec cette modalité, on l'ajoute à la fin du vecteur
//						// à la position ll_cpt qui a la valeur de la prochaine position à combler
//						if ls_mod[ll_cpt] <> ls_modal then
//							ll_cpt++
//							ls_mod[ll_cpt] = ls_modal
//							ll_mod[ll_cpt] = ll_compte
//							ld_mod[ll_cpt] = ld_montant
//						else // Sinon, on additionne le montant à ceux des paiements faits avec cette modalité
//							ld_mod[ll_cpt] += ld_montant
//						end if
//					end if
//					
//				else // L'option d'une seule transaction par modalité est désactivée
//					ll_row = dw_exportquickbook.insertRow(0)
//					if ll_row <> 0 then
//						dw_exportquickbook.setItem(ll_row, 't_visites_id_visit', ll_idvisit)
//						dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_descmodal', ls_modal)
//						dw_exportquickbook.setItem(ll_row, 't_paiements_montant', ld_montant)
//						dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', string(ll_compte))
//						dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
//					end if
//				end if
//				FETCH curPaie INTO :ld_montant, :ls_modal, :ll_compte;
//			loop
//			CLOSE curPaie;
//	
//			FETCH curVisit INTO :ll_idvisit, :ldt_visitdate;
//		
//		loop
//		
//		CLOSE curVisit;
//
//		// Ajout des comptes cumulatifs pour chaque modalité de paiement
//		for ll_cpt = 1 to upperBound(ls_mod)
//			ll_row = dw_exportquickbook.insertRow(0)
//			if ll_row <> 0 then
//				dw_exportquickbook.setItem(ll_row, 't_visites_visitdate', ldt_visitdate)
//				dw_exportquickbook.setItem(ll_row, 't_modalites_descmodal', ls_mod[ll_cpt])
//				dw_exportquickbook.setItem(ll_row, 't_paiements_montant', ld_mod[ll_cpt])
//				dw_exportquickbook.setItem(ll_row, 't_modalites_comptemodal', string(ll_mod[ll_cpt]))
//				dw_exportquickbook.setItem(ll_row, 't_specialists_id_specialist', il_spec[ll_spec])
//			end if
//		next
//		
//		ls_mod = ls_vide
//		ll_mod = ll_vide
//		ld_mod = ld_vide
//	end if
//next
end subroutine

public function decimal getsolde (long al_visit);dec{2} ld_montfact, ld_montlab1, ld_montlab2, ld_monttps
dec{2} ld_monttvq, ld_montpaie

select sum(montant * qte) into :ld_montfact from t_factures where id_visit = :al_visit;
select sum(prixlab) into :ld_montlab1 from t_factures where id_visit = :al_visit;
select sum(prixlab2) into :ld_montlab2 from t_factures where id_visit = :al_visit;
select sum(monttps) into :ld_monttps from t_factures where id_visit = :al_visit;
select sum(monttvq) into :ld_monttvq from t_factures where id_visit = :al_visit;
select sum(montant) into :ld_montpaie from t_paiements where id_visit = :al_visit;

if isnull(ld_montfact) then ld_montfact = 0
if isnull(ld_montlab1) then ld_montlab1 = 0
if isnull(ld_montlab2)then ld_montlab2 = 0
if isnull(ld_monttps) then ld_monttps = 0
if isnull(ld_monttvq) then ld_monttvq = 0
if isnull(ld_montpaie) then ld_montpaie = 0

return (ld_montfact + ld_montlab1 + ld_montlab2 + ld_monttps + ld_monttvq) - ld_montpaie


end function

on w_exportsimple.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_search=create cb_search
this.dw_exportquickbook=create dw_exportquickbook
this.st_titre=create st_titre
this.cb_close=create cb_close
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_datefin=create st_datefin
this.st_datedebut=create st_datedebut
this.cb_export=create cb_export
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_search
this.Control[iCurrent+3]=this.dw_exportquickbook
this.Control[iCurrent+4]=this.st_titre
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.em_fin
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.st_datefin
this.Control[iCurrent+9]=this.st_datedebut
this.Control[iCurrent+10]=this.cb_export
end on

on w_exportsimple.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.dw_exportquickbook)
destroy(this.st_titre)
destroy(this.cb_close)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_datefin)
destroy(this.st_datedebut)
destroy(this.cb_export)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

uf_resizew(this,3630,1945)

em_debut.text = string(Today())
em_fin.text = string(Today())
end event

type cb_print from commandbutton within w_exportsimple
integer x = 23
integer y = 1976
integer width = 457
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_exportquickbook)
end event

type cb_search from commandbutton within w_exportsimple
integer x = 891
integer y = 1976
integer width = 521
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

event clicked;dw_exportquickbook.event ue_retrieve()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type dw_exportquickbook from u_dw within w_exportsimple
event ue_retrieve ( )
integer x = 18
integer y = 104
integer width = 3584
integer height = 1844
integer taborder = 10
string title = "none"
string dataobject = "d_exportaccomba"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();string ls_prod, ls_status
date ldt_visitdate, ldt_datedebut, ldt_datefin, ldt_paiedate
dec{2} ld_montant
long ll_row, ll_idspec, i

reset()
i = 1

	setRedraw(true)

//if ii_index > 0 then

//	ll_idspec = il_spec[ii_index]

	ldt_datedebut = gf_emtodate(em_debut.text)
	ldt_datefin = gf_emtodate(em_fin.text)
	
	// On rempli la partie facturation
	
//	DECLARE facturation CURSOR FOR
//		select sum(isnull(montant,0)),  
//				 date_facture,
//				 (select description from t_status where status_id = factures_traitements.status_id) as descrip 
//		from factures_traitements 
//		where date_facture between :ldt_datedebut and :ldt_datefin 
//		group by descrip, date_facture
//		order by descrip asc, date_facture asc;
//		
//		
//	OPEN facturation;
//	
//	FETCH facturation INTO :ld_montant, 
//								  :ldt_visitdate,
//								  :ls_status;
//	
//	DO WHILE SQLCA.SQLCode = 0
//		
//		ll_row = insertRow(0)
//		setItem(ll_row,'datetrans',ldt_visitdate)
//		setItem(ll_row,'descrip',ls_status)
//		setItem(ll_row,'montantfp', ld_montant)
//		setItem(ll_row,'typefp','F')
//		setItem(ll_row,'id',i)
//		i++
//		
//		FETCH facturation INTO :ld_montant, 
//									  :ldt_visitdate,
//									  :ls_status;
//		
//	LOOP
//	
//	CLOSE facturation;
	
	
	// On rempli la partie paiement
	
	DECLARE paiement CURSOR FOR
				 
		select	sum(isnull(montant_recu,0)), 
					date_paiement,	
				 	paiement
		from paiement inner join traitements ON paiement.traitement_patient_id =  traitements.traitement_id
		              inner join patient ON patient.patient_id = traitements.patient_id
		where date_paiement between :ldt_datedebut and :ldt_datefin and
				patient.no_ortho = :v_no_ortho
		group by paiement, date_paiement
		order by paiement asc, date_paiement asc;
	
	OPEN paiement;
	
	FETCH paiement INTO :ld_montant, 
							  :ldt_paiedate,
							  :ls_status;
							  
	DO WHILE SQLCA.SQLCode = 0
		
		ll_row = insertRow(0)
		setItem(ll_row,'datetrans',ldt_paiedate)
		setItem(ll_row,'descrip',ls_status)
		setItem(ll_row,'montantfp',ld_montant)
		setItem(ll_row,'typefp','P')
		setItem(ll_row,'id',i)
		i++
		
		FETCH paiement INTO :ld_montant, 
								  :ldt_paiedate,
								  :ls_status;
			
	LOOP
	
	CLOSE paiement;
	
	groupcalc()
	
	setRedraw(true)

//end if
end event

event constructor;SetTransObject(SQLCA)
end event

type st_titre from statictext within w_exportsimple
integer width = 1362
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
string text = "Exportation vers Simple comptable"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Acomba Export'
end if
end event

type cb_close from commandbutton within w_exportsimple
integer x = 3017
integer y = 1976
integer width = 599
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

type em_fin from editmask within w_exportsimple
integer x = 2551
integer y = 1992
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "~t/"
end type

type em_debut from editmask within w_exportsimple
integer x = 1829
integer y = 1992
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "~t/"
end type

type st_datefin from statictext within w_exportsimple
integer x = 2235
integer y = 2000
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

type st_datedebut from statictext within w_exportsimple
integer x = 1390
integer y = 2000
integer width = 430
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

type cb_export from commandbutton within w_exportsimple
integer x = 480
integer y = 1976
integer width = 407
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Exporter"
end type

event clicked;/* Créée par: Dave Tremblay
   Créé le: 07-06-2005
	
	Cette fonction permet d'importer les transactions d'une période courante
	dans un fichier pour les envoyer dans Simple comptable
*/

date ldt_date
long ll_nodepot, i, ll_crevenu, ll_crecevable, ll_cbanque
dec{2} ld_montfact, ld_montpaie, ld_facttot, ld_paietot
string ls_mod, ls_typefp
string ls_linefich, ls_date, ls_nomfichier
integer li_filenum

i = 1

// On ouvre le fichier

ls_nomfichier = string(gf_emtodate(em_fin.text),"dd-mm-yyyy") + ".txt"
li_filenum = FileOpen("C:\ii4net\orthotek\comptabilite\" + ls_nomfichier,LineMode!, Write!, LockWrite!, Replace!)

// on va chercher le numéro ou on est rendu pour le dépôt et les compte necessaire

 select crevenu, crecevable, cbanque, nodepot INTO :ll_crevenu, :ll_crecevable, :ll_cbanque, :ll_nodepot FROM t_options where ortho_id = :v_no_ortho;

// On commence par faire le cas de la facturation

//ls_typefp = dw_exportquickbook.getItemString(i,'typefp')
//ld_facttot = dw_exportquickbook.getItemNumber(dw_exportquickbook.getRow(),'monttotfact')
//if isnull(ll_nodepot) then ll_nodepot = 0
//
//// Fabrique l'entete dans le fichier
//
//ll_nodepot++
//ls_date = string(gf_emtodate(em_fin.text),'mm-dd-yy')
//
//// On stock la ligne dans le fichier 
//
//ls_linefich = ls_date + ",~"" + string(ll_nodepot) + "~",~"Migration de la facturation du: " + ls_nomfichier + "~""
//FileWrite(li_filenum,ls_linefich)
//ls_linefich = string(ll_crecevable) + "," + string(ld_facttot,"0.00")
//FileWrite(li_filenum,ls_linefich)
//
//// On rempli les lignes de répartition
//
//DO WHILE i <= dw_exportquickbook.rowcount() and ls_typefp = 'F'
//	
//	ld_montfact = dw_exportquickbook.getItemNumber(i,'montantfp')
//	if isnull(ld_montfact) then ld_montfact = 0
//	if ld_montfact <> 0 then	
//		ls_mod = dw_exportquickbook.getItemString(i,'descrip')
//		ld_montfact = ld_montfact * -1
//		ls_linefich = string(ll_crevenu) + "," + string(ld_montfact,"0.00")
//		FileWrite(li_filenum,ls_linefich)
//	end if
//	i++
//	ls_typefp = dw_exportquickbook.getItemString(i,'typefp')
//	
//LOOP
//
// On continu par les paiements

// Pour patcher

ls_typefp = 'P'

ld_paietot = dw_exportquickbook.getItemNumber(dw_exportquickbook.getRow(),'monttotpaie')

// Fabrique l'entete dans le fichier

ll_nodepot++
ls_date = string(gf_emtodate(em_fin.text),'mm-dd-yy')

// On stock la ligne dans le fichier 

ls_linefich = ls_date + ",~"" + string(ll_nodepot) + "~",~"Migration des paiements du: " + ls_nomfichier + "~""
FileWrite(li_filenum,ls_linefich)
ld_paietot = ld_paietot * -1
ls_linefich = string(ll_crecevable) + "," + string(ld_paietot,"0.00")
FileWrite(li_filenum,ls_linefich)

// On rempli les lignes de répartition

DO WHILE i <= dw_exportquickbook.rowcount() and ls_typefp = 'P'
	
	ld_montpaie = dw_exportquickbook.getItemNumber(i,'montantfp')
	if isnull(ld_montpaie) then ld_montpaie = 0
	if ld_montpaie <> 0 then	
		ls_mod = dw_exportquickbook.getItemString(i,'descrip')
		ls_linefich = string(ll_cbanque) + "," + string(ld_montpaie,"0.00")
		FileWrite(li_filenum,ls_linefich)
	end if
	i++
	ls_typefp = dw_exportquickbook.getItemString(i,'typefp')

loop

update t_options set nodepot = :ll_nodepot where ortho_id = :v_no_ortho;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

FileClose(li_filenum)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Export'
end if
end event

