$PBExportHeader$w_cpd.srw
forward
global type w_cpd from w_child
end type
type cb_recu from commandbutton within w_cpd
end type
type cb_1 from commandbutton within w_cpd
end type
type st_phase from statictext within w_cpd
end type
type pb_receipt from picturebutton within w_cpd
end type
type cbx_pastcpd from checkbox within w_cpd
end type
type st_cpd from statictext within w_cpd
end type
type cb_print from commandbutton within w_cpd
end type
type sle_quantite from singlelineedit within w_cpd
end type
type cb_exe from commandbutton within w_cpd
end type
type cb_close from commandbutton within w_cpd
end type
type cb_insert from commandbutton within w_cpd
end type
type cb_update from commandbutton within w_cpd
end type
type cb_supprimer from commandbutton within w_cpd
end type
type dw_cheques_today from u_dw within w_cpd
end type
end forward

global type w_cpd from w_child
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
boolean toolbarvisible = false
boolean ib_isupdateable = false
event ue_post_open ( )
cb_recu cb_recu
cb_1 cb_1
st_phase st_phase
pb_receipt pb_receipt
cbx_pastcpd cbx_pastcpd
st_cpd st_cpd
cb_print cb_print
sle_quantite sle_quantite
cb_exe cb_exe
cb_close cb_close
cb_insert cb_insert
cb_update cb_update
cb_supprimer cb_supprimer
dw_cheques_today dw_cheques_today
end type
global w_cpd w_cpd

type variables
public integer changement = 0
private long il_traitid
private long il_patid
public long il_idcontact
private datawindowchild dddwin
private boolean ib_cccarte = false
private boolean ib_edition = false
end variables

forward prototypes
public subroutine maj ()
public subroutine if_close ()
public subroutine recalculer ()
public subroutine imprecufr ()
public subroutine of_masquenumcarte ()
end prototypes

event ue_post_open();long ll_idphase
int i
string ls_phase

il_traitid = Message.doubleParm  //parametre externe
//type phase
select id_phase into :ll_idphase from traitements where traitement_id = :il_traitid;
select phase into :ls_phase from t_phase where id_phase = :ll_idphase;
st_phase.text = ls_phase
select patient_id into :il_patid from traitements where traitement_id = :il_traitid;
dw_cheques_today.SetFilter('cheques_postdates.date_cheque > today() ')
dw_cheques_today.Retrieve(il_traitid,v_no_ortho)
//for i = 1 to dw_cheques_today.rowcount()
	if dw_cheques_today.GetItemString(1, 'modalite') = "P" then
//		dw_cheques_today.Object.nocheque.Visible = true
//		//dw_cheques_today.Object.nocarte.Visible = false
		dw_cheques_today.Object.t_4.Text = "# Chèque"
//		dw_cheques_today.SetTabOrder('nocheque',40)
//		dw_cheques_today.SetTabOrder('nocarte',0)
//		dw_cheques_today.SetTabOrder('datecarte',0)
		dw_cheques_today.object.datecarte.background.color = rgb(128,128,128)
	else
//		dw_cheques_today.Object.nocheque.Visible = false
//		//dw_cheques_today.Object.nocarte.Visible = true
		dw_cheques_today.Object.t_4.Text = "# Carte"
//		dw_cheques_today.SetTabOrder('nocheque',0)
//		dw_cheques_today.SetTabOrder('nocarte',40)
//		dw_cheques_today.SetTabOrder('datecarte',50)	
		dw_cheques_today.object.datecarte.background.color = rgb(255,255,255)
	end if
//next
dddwin.setTransObject(SQLCA)
dddwin.setFilter("patient_id = " + string(il_patid)) 
dddwin.retrieve()

// Ajuste la disponibilité des boutons
if dw_cheques_today.rowcount() = 0 then
	cb_update.enabled = false
	cb_supprimer.enabled = false
	cb_exe.enabled = false
	cb_supprimer.enabled = false
else
	recalculer()
end if
changement = 0
end event

public subroutine maj ();decimal{2} v_paiement
date v_date_cheque
long enr

dw_cheques_today.accepttext()
recalculer()
cb_supprimer.enabled = true
enr = dw_cheques_today.getrow()
if enr > 0 then
	v_date_cheque=dw_cheques_today.getitemdate(enr,"date_cheque")
	v_paiement=dw_cheques_today.getitemnumber(enr,"paiement")
	if isnull(v_date_cheque)=true or isnull(v_paiement)=true then
		error_type(135)
	else
		if dw_cheques_today.Update() = 1 then
			commit using SQLCA;
			//refresh w_traitement
			w_traitements.tabrefresh()
			dw_cheques_today.retrieve(il_traitid,v_no_ortho)
			if dw_cheques_today.rowcount() = 0 then
				cb_update.enabled = false
				cb_supprimer.enabled = false
				cb_exe.enabled = false
			end if
		else
			rollback using SQLCA;
			error_type(50)
		end if
	end if
end if
changement = 0

end subroutine

public subroutine if_close ();if changement = 1 then
	if error_type(200) = 1 then
		maj()
	end if
end if
close(w_cpd)
end subroutine

public subroutine recalculer ();long nb_enr, i, row
decimal{2} solde, ld_frais, ld_montantpaye

row = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow()
ld_frais = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(row,'v_frais')
ld_montantpaye = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(row,'montantpaye')
solde = ld_frais - ld_montantpaye

for i = 1 to dw_cheques_today.rowcount()
	solde = solde - dw_cheques_today.getitemnumber(i,"paiement")
	dw_cheques_today.setitem(i,"solde_ligne",solde)
next
end subroutine

public subroutine imprecufr ();//long ll_recu,ll_trait
//date ldt_date1,ldt_date2
//
//datastore ds_recupimpfr
//ds_recupimpfr = create datastore
//ds_recupimpfr.dataobject = "d_recupimpfr"
//ds_recupimpfr.SetTransObject(SQLCA)
//ds_recupimpfr.retrieve(il_paiementid)
////numero du recu
//ldt_date1 = ds_recupimpfr.getitemdate(1,'paiement_date_debut_recu')
//ldt_date2 = ds_recupimpfr.getitemdate(1,'paiement_date_fin_recu')
//select traitement_patient_id into :ll_trait from paiement where paiement_id = :il_paiementid;
//select min(paiement_id) into :ll_recu from paiement where traitement_patient_id = :ll_trait and recu <> '1' and date_paiement between :ldt_date1 and :ldt_date2;
//if isnull(ll_recu) then
//	select min(paiement_id) into :ll_recu from paiement where traitement_patient_id = :ll_trait and date_paiement between :ldt_date1 and :ldt_date2;
//end if
//ds_recupimpfr.object.t_recu1.text = string(ll_recu)
//ds_recupimpfr.object.t_recu2.text = string(ll_recu)
//ds_recupimpfr.object.t_recu3.text = string(ll_recu)
//if uf_receiptchecked() then
//	ds_recupimpfr.object.t_copy1.visible = true
//	ds_recupimpfr.object.t_copy2.visible = true
//	ds_recupimpfr.object.t_copy3.visible = true
//end if
//gb_datawindow = false
//openwithparm(w_print_options,ds_recupimpfr)
//if error_type(205) = 1 then
//	cocherecu()
//	sauve()
//end if
//destroy ds_recupimpfr
end subroutine

public subroutine of_masquenumcarte ();Long ll_row
String ls_modalite

for ll_row = 1 to dw_cheques_today.rowcount( )
	ls_modalite = dw_cheques_today.getitemstring( ll_row, 'modalite')
	choose case ls_modalite
		case 'pVisa'
			dw_cheques_today.Object.nocarte.editmask.mask = '#### **** ####'
		case 'MC'
			dw_cheques_today.Object.nocarte.editmask.mask = '#### **** ####'
		case 'AmEx'
			dw_cheques_today.Object.nocarte.editmask.mask = '#### ****** #####'
	end choose
next
end subroutine

on w_cpd.create
int iCurrent
call super::create
this.cb_recu=create cb_recu
this.cb_1=create cb_1
this.st_phase=create st_phase
this.pb_receipt=create pb_receipt
this.cbx_pastcpd=create cbx_pastcpd
this.st_cpd=create st_cpd
this.cb_print=create cb_print
this.sle_quantite=create sle_quantite
this.cb_exe=create cb_exe
this.cb_close=create cb_close
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_supprimer=create cb_supprimer
this.dw_cheques_today=create dw_cheques_today
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_recu
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.st_phase
this.Control[iCurrent+4]=this.pb_receipt
this.Control[iCurrent+5]=this.cbx_pastcpd
this.Control[iCurrent+6]=this.st_cpd
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.sle_quantite
this.Control[iCurrent+9]=this.cb_exe
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.cb_insert
this.Control[iCurrent+12]=this.cb_update
this.Control[iCurrent+13]=this.cb_supprimer
this.Control[iCurrent+14]=this.dw_cheques_today
end on

on w_cpd.destroy
call super::destroy
destroy(this.cb_recu)
destroy(this.cb_1)
destroy(this.st_phase)
destroy(this.pb_receipt)
destroy(this.cbx_pastcpd)
destroy(this.st_cpd)
destroy(this.cb_print)
destroy(this.sle_quantite)
destroy(this.cb_exe)
destroy(this.cb_close)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_supprimer)
destroy(this.dw_cheques_today)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_idcontact = long(gnv_app.inv_entrepotglobal.of_retournedonnee("contactcpd"))

this.postevent('ue_post_open')

end event

type cb_recu from commandbutton within w_cpd
integer x = 928
integer y = 1912
integer width = 320
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Reçu"
end type

event constructor;if v_langue = 'an' then
	cb_exe.Text = "Receipt"
end if
end event

event clicked;datastore ds_recu
long ll_cpdid

if dw_cheques_today.rowcount() > 0 then
	ll_cpdid = dw_cheques_today.getItemNumber(dw_cheques_today.getRow(),'cheques_postdates_id')
	ds_recu = create datastore
	ds_recu.dataobject = 'd_recupost'
	ds_recu.setTransObject(SQLCA)
	ds_recu.retrieve(ll_cpdid)
	
	gb_datawindow = false
	openwithparm(w_print_options,ds_recu)
end if
end event

type cb_1 from commandbutton within w_cpd
integer x = 2158
integer y = 1912
integer width = 503
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Formulaire"
end type

event constructor;
if v_langue = 'an' then
	cb_supprimer.Text = "Form"
end if
end event

event clicked;SetPointer(HourGlass!)
OpenWithParm (w_formcpd,il_traitid, w_cpd)
end event

type st_phase from statictext within w_cpd
integer x = 1015
integer width = 1253
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_receipt from picturebutton within w_cpd
integer x = 2309
integer width = 110
integer height = 96
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Custom004!"
alignment htextalign = left!
end type

event constructor;if v_langue = 'an' then
	powertiptext = 'Print receipt'
else
	powertiptext = 'Impression des recus'
end if
end event

event clicked;long ll_idcpd, ll_type
date ldt_datech

ll_idcpd = dw_cheques_today.getitemnumber(dw_cheques_today.getrow(),'cheques_postdates_id')
select typerecu into :ll_type from t_options where ortho_id = :v_no_ortho;
if ll_type = 1 then
	datastore ds_recupost
	ds_recupost = create datastore
	ds_recupost.dataobject = "d_recupost"
	ds_recupost.SetTransObject(SQLCA)
	ds_recupost.retrieve(ll_idcpd)

	gb_datawindow = false
	openwithparm(w_print_options,ds_recupost)
	if error_type(205) = 1 then
		dw_cheques_today.setitem(dw_cheques_today.getrow(),'recu','1')
		maj()
	end if
	destroy ds_recupost
else
	opensheetwithparm(w_invoice, il_traitid, w_principal, 2, Layered!)
	ldt_datech = dw_cheques_today.getItemDate(dw_cheques_today.getRow(), 'date_cheque')
	w_invoice.em_start.text = string(ldt_datech, "yyyy-mm-dd")
	w_invoice.em_end.text = string(relativedate(today(), -60), "yyyy-mm-dd")
	w_invoice.cb_search.event clicked()	
end if
end event

type cbx_pastcpd from checkbox within w_cpd
integer x = 2455
integer width = 1166
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Afficher tous les chèques"
end type

event clicked;if checked then
	dw_cheques_today.SetFilter('')
else
	dw_cheques_today.SetFilter('cheques_postdates.date_cheque > today() ')
end if
dw_cheques_today.Filter()
cb_supprimer.enabled = true
cb_update.enabled = true
end event

event constructor;if v_langue = 'an' then
	this.text = 'Display all cheques'
end if
end event

type st_cpd from statictext within w_cpd
integer width = 1019
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Chèques postdatés"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_cpd.text = 'Postdated'
end if
end event

type cb_print from commandbutton within w_cpd
integer x = 1248
integer y = 1912
integer width = 434
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;string ls_mail[], ls_courriel
long k

datastore ds_cpd
ds_cpd = create datastore
ds_cpd.dataobject = "d_cheque_postdatesimp"
if v_langue = 'an' then
	ds_cpd.object.t_title.text = 'Postdated report'
	ds_cpd.object.t_date.text = 'Date'
	ds_cpd.object.t_nocheque.text = 'Cheque #'
	ds_cpd.object.t_montant.text = 'Amount'
	ds_cpd.object.t_method.text = 'Method'
	ds_cpd.object.t_solde.text = 'Balance'
	ds_cpd.object.t_printedon.text = 'Printed on'
end if
ds_cpd.SetTransObject(SQLCA)
if cbx_pastcpd.checked then
	ds_cpd.SetFilter('')
else
	ds_cpd.SetFilter('date_cheque > today() ')
end if
ds_cpd.Filter()
ds_cpd.retrieve(il_traitid)
if ds_cpd.getItemString(ds_cpd.getRow(),'patient_province') <> 'usa' then
	ds_cpd.modify("patient_code_postale.EditMask.Mask = 'XXX XXX'")
else
	ds_cpd.modify("patient_code_postale.EditMask.Mask = ''")
end if
ds_cpd.object.cheques_postdates_modalite.values = gf_method(v_langue)

k = 1
DECLARE listemail CURSOR FOR 

	select top 3 courriel from (
		select email as courriel from t_contact where patient_id = :il_patid and isnull(email,'') <> ''
		union
		select email from patient where patient_id = :il_patid and isnull(email,'') <> ''
		union
		select email2 from patient where patient_id = :il_patid and isnull(email2,'') <> ''
		union
		select email3 from patient where patient_id = :il_patid and isnull(email3,'') <> ''
	) as t_courlist;

OPEN listemail;

	FETCH listemail INTO :ls_mail[k];
		
	DO WHILE SQLCA.SQLCODE = 0
		k++
		FETCH listemail INTO :ls_mail[k];
	LOOP
CLOSE listemail;


ls_courriel = unsplit(ls_mail,';')

gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)

gb_datawindow = false
openwithparm(w_print_options,ds_cpd)
destroy ds_cpd
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type sle_quantite from singlelineedit within w_cpd
integer x = 677
integer y = 1916
integer width = 224
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_exe from commandbutton within w_cpd
integer x = 302
integer y = 1912
integer width = 347
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Quantité"
end type

event clicked;integer li_nocheque,li_taxe
long i, enr, annee, mois, jour, v_jour, ll_resp, ll_idsat
decimal{2} montant
dec{0} mois1
date date_premier, ldt_carte
string ls_mod, ls_nocarte

dw_cheques_today.accepttext()
enr = dw_cheques_today.getrow()
if enr > 0 then 
	date_premier = dw_cheques_today.getitemdate(enr,"date_cheque")
	montant = dw_cheques_today.getitemnumber(enr,"paiement")
	ll_resp = dw_cheques_today.getitemnumber(enr,"id_contact")
	li_nocheque = dw_cheques_today.getitemnumber(enr,"nocheque")
	ls_nocarte = dw_cheques_today.getitemString(enr,"nocarte")
	ldt_carte = dw_cheques_today.getitemdate(enr,"datecarte")
	ls_mod = dw_cheques_today.getitemstring(enr,"modalite")
	li_taxe = dw_cheques_today.getitemnumber(enr,"taxe")
	ll_idsat = dw_cheques_today.getItemNumber(enr,"id_satellite")
	jour=day(date_premier)
	mois=month(date_premier)
	annee=year(date_premier)
	for i = 1 to (integer(sle_quantite.text) -1)
		SetPointer(hourglass!)
		enr = dw_cheques_today.insertrow(0)
		mois = mois + 1
			if mois > 12 then
				mois = 1
				annee = annee + 1
			end if
		v_jour = correction_jour(jour,mois,annee)
		dw_cheques_today.setitem(enr,"paiement",montant)
		dw_cheques_today.setitem(enr,"date_cheque",date(annee,mois,v_jour))
		dw_cheques_today.setitem(enr,"traitement_patient_id",il_traitid)
		dw_cheques_today.setitem(enr,"indicateur",'0')
		dw_cheques_today.setitem(enr,"recu",'0')
		dw_cheques_today.setitem(enr,"id_contact",ll_resp)
		dw_cheques_today.setitem(enr,"affect",1)
		dw_cheques_today.setitem(enr,"modalite",ls_mod)
		li_nocheque++
		dw_cheques_today.setitem(enr,"nocheque",li_nocheque)
		dw_cheques_today.setitem(enr,"nocarte",ls_nocarte)
		dw_cheques_today.setitem(enr,"datecarte",ldt_carte)
		dw_cheques_today.setitem(enr,"taxe",li_taxe)
		dw_cheques_today.setitem(enr,"id_satellite",ll_idsat)
	next
	changement = 1
	recalculer()
end if
end event

event constructor;if v_langue = 'an' then
	cb_exe.Text = "Quantity"
end if
end event

type cb_close from commandbutton within w_cpd
event clicked pbm_bnclicked
integer x = 3182
integer y = 1912
integer width = 443
integer height = 108
integer taborder = 70
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
end if
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_cpd
event clicked pbm_bnclicked
integer x = 14
integer y = 1912
integer width = 288
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajout"
end type

event clicked;string ls_nom, ls_prenom, ls_r1, ls_r2, ls_r3, ls_nompatient,ls_taxe
integer li_resp
long enr, ll_idcontact, ll_idstallite, ll_droitvoirnumcarte

enr = dw_cheques_today.InsertRow(0)
dw_cheques_today.scrolltorow(enr)
dddwin.setTransObject(SQLCA)
dddwin.setFilter("patient_id = " + string(il_patid)) 
dddwin.retrieve()
select id_contact, id_satellite into :ll_idcontact, :ll_idstallite from patient where patient_id = :il_patid;
dw_cheques_today.setitem(enr,"id_contact",il_idcontact)
dw_cheques_today.setitem(enr,"traitement_patient_id",il_traitid) 
dw_cheques_today.setitem(enr,"indicateur",'0') 
dw_cheques_today.setitem(enr,"recu",'0') 
dw_cheques_today.setitem(enr,"paiement",0)
dw_cheques_today.setitem(enr,"affect",1)
dw_cheques_today.setitem(enr,"modalite","P")
dw_cheques_today.setitem(enr,"edition",1)

//Mettre le id du satellite du patient si celui-ci est présent - MG 2007-09-04
IF ll_idstallite <> 0 AND isnull(ll_idstallite) = FALSE THEN
	dw_cheques_today.setitem(enr,"id_satellite",ll_idstallite)
END IF

select phasetype into :ls_taxe from traitements where traitement_id = :il_traitid;
if ls_taxe = 'e' then 
	dw_cheques_today.setitem(enr,"taxe",1)
else
	dw_cheques_today.setitem(enr,"taxe",0)
end if
// Ajuste la disponibilité des boutons
if cb_update.enabled = false then cb_update.enabled = true
if cb_exe.enabled = false then cb_exe.enabled = true
if cb_supprimer.enabled = false then cb_supprimer.enabled = true
changement =1
dw_cheques_today.setcolumn(3)
dw_cheques_today.setfocus()
end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "Add"
end if
end event

type cb_update from commandbutton within w_cpd
event clicked pbm_bnclicked
integer x = 2661
integer y = 1912
integer width = 521
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;maj()
end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type cb_supprimer from commandbutton within w_cpd
event clicked pbm_bnclicked
integer x = 1682
integer y = 1912
integer width = 475
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;if changement = 1 then
	error_type(127)
else
	dw_cheques_today.deleterow(dw_cheques_today.getrow())
	if dw_cheques_today.update() = 1 then
		commit;
		//refresh w_traitement
		w_traitements.tabrefresh()
		changement = 0
	else
		rollback;
		error_type(50)
	end if
end if
recalculer()
end event

event constructor;if v_langue = 'an' then
	cb_supprimer.Text = "Delete"
end if
end event

type dw_cheques_today from u_dw within w_cpd
event ue_changenumero ( long al_row,  date adt_date )
integer x = 14
integer y = 96
integer width = 3602
integer height = 1808
integer taborder = 10
string dataobject = "d_cheques_today"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_changenumero(long al_row, date adt_date);long i, ll_idcont, ll_idcontcur
string ls_nocarte
date ldt_date, ldt_dateexp

ldt_dateexp = dw_cheques_today.getItemDate(al_row,'datecarte')
ls_nocarte = dw_cheques_today.getItemString(al_row,'nocarte')
ll_idcont = dw_cheques_today.getItemNumber(al_row,'id_contact')

for i = 1 to rowcount()
	ldt_date = dw_cheques_today.getItemDate(i,'date_cheque')
	ll_idcontcur = dw_cheques_today.getItemNumber(i,'id_contact')
	
	if ldt_date > adt_date and ll_idcont = ll_idcontcur then
		dw_cheques_today.setItem(i,'nocarte',ls_nocarte)
		dw_cheques_today.setItem(i,'datecarte',ldt_dateexp)
		dw_cheques_today.setItem(i,'id_contact',ll_idcont)
	end if
next
end event

event editchanged;string ls_null

setNull(ls_null)
setItem(row, 'envmon', 0)
setItem(row, 'monorderid', ls_null)
changement = 1
end event

event itemchanged;/////////////////////
// Créé par: Sebastien Tremblay
// Créé le: 28/10/2003
// Demande: Fberube
// Version: 7.6.1
// Modifié par: Eric Vézina
// Modifié le: 29/10/2003
// Modifié par: Dave Tremblay
// Modifié le: 04/12/2003
// Modifié par: Dave Tremblay
// Modifié le: 05/08/2006
//////////////////////
date dt_date
string ls_null
long i

dw_cheques_today.accepttext()
if dwo.name = 'date_cheque' then
	dt_date = date(data)
	if dt_date < today() then
		error_type(134)
		parent.BringToTop = true
	end if
elseif dwo.name = 'modalite' then
	if this.GetItemString(row, 'modalite') = "P" then
		if v_langue = 'an' then
			this.Object.t_4.Text = "Check #"
		else
			this.Object.t_4.Text = "# Chèque"
		end if
		this.SetTabOrder('datecarte',0)
		this.object.datecarte.background.color = rgb(128,128,128)
	else
		if data = "pAmex" then
			this.Object.nocarte.editmask.mask = '#### ###### #####'
		else
			this.Object.nocarte.editmask.mask = '#### #### #### ####'
		end if
		if v_langue = 'an' then
			this.Object.t_4.Text = "Card #"
		else
			this.Object.t_4.Text = "# Carte"
		end if
		this.SetTabOrder('datecarte',50)	
		this.object.datecarte.background.color = rgb(255,255,255)
	end if
elseif dwo.name = 'nocarte' or dwo.name = 'datecarte' then
	
	dt_date = getItemDate(row,'date_cheque') 
	post event ue_changenumero(row,dt_date)
	
end if

setNull(ls_null)
setItem(row, 'envmon', 0)
setItem(row, 'monorderid', ls_null)
changement = 1
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
setrowfocusindicator(FocusRect!)
if dw_cheques_today.GetChild('id_contact', dddwin) = -1 then
	error_type(0)
end if
//dw_cheques_today.SetValidate("date_cheque","Date(GetText( )) >= today()")
//dw_cheques_today.Object.date_cheque.ValidationMsg = "La date ne doit pas être inférieure à celle d'aujourd'hui"

if v_langue = 'an' then
	this.object.paiement_t.text = 'Payment'
	this.object.t_2.text = 'Affects'
	this.object.t_3.text = 'Receipt'
	this.object.t_4.text = 'Check #'
	this.object.t_resp.text = 'Responsible'
	this.object.t_1.text = 'Balance'
	this.object.t_5.text = 'Method'
	this.object.t_6.text = 'Exp date'
	this.object.modalite.values = 'Check~tP/Visa~tpVisa/MasterCard~tpMC/American Express~tpAmex/Preautorized payment~tpPD'
else
	this.object.modalite.values = 'Chèque~tP/Visa~tpVisa/MasterCard~tpMC/American Express~tpAmex/Paiement pré-autorisé~tpPD'
end if
end event

event losefocus;recalculer()
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

event itemerror;call super::itemerror;return 3

end event

event clicked;call super::clicked;long ll_masquernumcarte, ll_row, ll_droitvoirnumcarte

//if row > 0 and dwo.name = 'cc_carte' then
//	this.setrow(row)
//	ib_cccarte = true
//end if

scrollToRow(row)

select isnull(masquernumcarte,0) into :ll_masquernumcarte from t_options;
select isnull(droitvoirnumcarte,0) into :ll_droitvoirnumcarte from t_personnels where id_personnel = :gl_idpers;


if this.GetItemString(row, 'modalite') = "P" then
	if v_langue = 'an' then
		this.Object.t_4.Text = "Check #"
	else
		this.Object.t_4.Text = "# Chèque"
	end if
	this.SetTabOrder('datecarte',0)
	this.object.datecarte.background.color = rgb(128,128,128)

else
	
	if v_langue = 'an' then
		this.Object.t_4.Text = "Card #"
	else
		this.Object.t_4.Text = "# Carte"
	end if
	
	if ll_masquernumcarte = 1 then
		if ll_droitvoirnumcarte = 1  then
			if ib_edition = false then
				ib_edition = true
				for ll_row = 1 to dw_cheques_today.rowcount( )
					dw_cheques_today.setitem( ll_row, 'edition', 1)
				next
				dw_cheques_today.settaborder('datecarte',55)
				this.object.datecarte.background.color = rgb(255,255,255)
				if this.GetItemString(row, 'modalite') = "pAmex" then
					this.Object.nocarte.editmask.mask = '#### ###### #####'
				else
					this.Object.nocarte.editmask.mask = '#### #### #### ####'
				end if
			elseif ib_edition = true and row = 0 then
				ib_edition = false
				for ll_row = 1 to dw_cheques_today.rowcount( )
					dw_cheques_today.setitem( ll_row, 'edition', 0)
				next
				dw_cheques_today.settaborder('datecarte',0)
				this.object.datecarte.background.color = rgb(128,128,128)
			else
				dw_cheques_today.settaborder('datecarte',55)
				this.object.datecarte.background.color = rgb(255,255,255)
			end if
		else
			dw_cheques_today.setitem( ll_row, 'edition', 0)
			dw_cheques_today.settaborder('datecarte',0)
			this.object.datecarte.background.color = rgb(128,128,128)
		end if
	else
		dw_cheques_today.settaborder('datecarte',55)
		this.object.datecarte.background.color = rgb(255,255,255)
		if this.GetItemString(row, 'modalite') = "pAmex" then
			this.Object.nocarte.editmask.mask = '#### ###### #####'
		else
			this.Object.nocarte.editmask.mask = '#### #### #### ####'
		end if
	end if

end if
end event

event lbuttonup;call super::lbuttonup;if ib_cccarte = true then
	this.setcolumn('nocarte')
	ib_cccarte = false
end if
end event

