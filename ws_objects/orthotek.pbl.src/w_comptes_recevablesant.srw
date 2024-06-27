$PBExportHeader$w_comptes_recevablesant.srw
forward
global type w_comptes_recevablesant from w_child
end type
type dw_sat from uo_sat within w_comptes_recevablesant
end type
type cb_1 from commandbutton within w_comptes_recevablesant
end type
type em_datefin from editmask within w_comptes_recevablesant
end type
type st_1 from statictext within w_comptes_recevablesant
end type
type cb_close from commandbutton within w_comptes_recevablesant
end type
type cb_print from commandbutton within w_comptes_recevablesant
end type
type dw_comptes_recevables from u_dw within w_comptes_recevablesant
end type
end forward

global type w_comptes_recevablesant from w_child
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
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
dw_sat dw_sat
cb_1 cb_1
em_datefin em_datefin
st_1 st_1
cb_close cb_close
cb_print cb_print
dw_comptes_recevables dw_comptes_recevables
end type
global w_comptes_recevablesant w_comptes_recevablesant

type variables
int arret
boolean lb_asc = true
end variables

on w_comptes_recevablesant.create
int iCurrent
call super::create
this.dw_sat=create dw_sat
this.cb_1=create cb_1
this.em_datefin=create em_datefin
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_comptes_recevables=create dw_comptes_recevables
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sat
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.em_datefin
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.dw_comptes_recevables
end on

on w_comptes_recevablesant.destroy
call super::destroy
destroy(this.dw_sat)
destroy(this.cb_1)
destroy(this.em_datefin)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_comptes_recevables)
end on

event open;arret = 0

pro_resize luo_size
luo_size.uf_resizew(this,1,1)


//ajustmontantdu()
end event

type dw_sat from uo_sat within w_comptes_recevablesant
integer x = 2089
integer taborder = 40
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_comptes_recevables.setFilter("")
	dw_comptes_recevables.filter()
else
	dw_comptes_recevables.setFilter("id_satellite = " + string(il_idsat))
	dw_comptes_recevables.filter()
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

type cb_1 from commandbutton within w_comptes_recevablesant
integer x = 791
integer y = 1928
integer width = 786
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Recherche"
end type

event clicked;int i;
string ls_patient_nom, ls_patient_prenom, ls_nom_complet
dec{2} ld_montant_du, ld_montant_paye, ld_total_cpd, ld_cpd_venir, ld_frais, ld_montant_paye1,ld_frais1
long ll_traitement_id, ll_row, ll_idsat
date ldt_cpd_venir_date, ldt_prochain_paiement_date, ldt_datefin 
long nb_row, v_traitement_id
dec {2} montant_cpd, total_montant_cpd, tot_pos, tot_neg, v_montant_du, montant_total_fact, v_montant_paye, ld_totfact1, ld_totfact
dec{2} ld_couttrait,ld_coutglobal
date date_cpd, date_paiement

setpointer(hourglass!)
ldt_datefin = date(em_datefin.text)
dw_comptes_recevables.RowsDiscard(1, dw_comptes_recevables.Rowcount(), Primary!)
//dw_comptes_recevables.object.t_date.text = em_datefin.text

		  
DECLARE recevable CURSOR FOR

SELECT  patient.patient_nom ,
        patient.patient_prenom ,
		  patient.id_satellite,
        ortho_id.dr_nom_complet ,
        traitements.traitement_id as trait ,
		  (select sum(montant_recu) from paiement where date_paiement <= :ldt_datefin and traitement_patient_id = trait) as montantpaye1 ,
        (if montantpaye1 is null then 0 else montantpaye1 endif) as montantpaye,
		  (select sum(montant) from factures_traitements where date_facture <= :ldt_datefin and traitement_id = trait) as totfact1,
		  (if totfact1 is null then 0 else totfact1 endif) as totfact,
		  (totfact - montantpaye) as montantdu,
		  traitements.montant_original,
		  //(select sum(montant) from factures_traitements where traitement_id = trait) 
		  (select ISNULL(SUM(ISNULL(montant, 0)), 0) from factures_traitements where traitement_id = trait) as coutglobal,
		  (select sum(montant) from factures_traitements where traitement_id = trait and status_id = 11 and year(date_facture) <= year(:ldt_datefin)) as credit1,
        (if credit1 is null then 0 else credit1 endif) as credit,
        traitements.cpd_venir_date ,
        (select max(date_paiement)from paiement where traitement_patient_id = trait ) as datepaiement ,
        (select SUM(montant) from factures_traitements where traitement_id = trait) as v_frais1,
		  (if v_frais1 is null then 0 else v_frais1 endif) as v_frais   
FROM    patient INNER JOIN ortho_id ON ortho_id.ortho_id = patient.no_ortho
	             INNER JOIN traitements ON patient.patient_id = traitements.patient_id

WHERE   ortho_id.ortho_id = :v_no_ortho  AND 
		  traitements.debut_traitement <= :ldt_datefin AND
		  (v_frais <> montantpaye OR montantdu <> 0)
		  
ORDER BY patient.patient_nom          ASC,
	      patient.patient_prenom       ASC;
			
OPEN recevable;

DO WHILE SQLCA.SQLCode = 0
   FETCH recevable INTO :ls_patient_nom,
	                     :ls_patient_prenom,
								:ll_idsat,
								:ls_nom_complet,
								:ll_traitement_id,
								:ld_montant_paye1, 
								:ld_montant_paye,
								:ld_totfact1,
								:ld_totfact,
								:ld_montant_du,
								:ld_couttrait,
								:ld_coutglobal,
								:ld_total_cpd,
								:ld_cpd_venir,
								:ldt_cpd_venir_date,
								:ldt_prochain_paiement_date,
								:ld_frais1,
								:ld_frais;
								
   IF SQLCA.SQLCode = 0 THEN
	   ll_row = dw_comptes_recevables.insertrow(0)
		dw_comptes_recevables.scrolltorow(ll_row)
		dw_comptes_recevables.setitem(ll_row,'patient_nom',ls_patient_nom)
		dw_comptes_recevables.setitem(ll_row,'patient_prenom',ls_patient_prenom)
		dw_comptes_recevables.setitem(ll_row,'id_satellite',ll_idsat)
		dw_comptes_recevables.setitem(ll_row,'dr_nom_complet',ls_nom_complet)
		dw_comptes_recevables.setitem(ll_row,'montant_du',ld_montant_du)
		dw_comptes_recevables.setitem(ll_row,'traitement_id',ll_traitement_id)
		dw_comptes_recevables.setitem(ll_row,'montant_paye',ld_montant_paye)
		dw_comptes_recevables.setitem(ll_row,'montant_paye1',ld_montant_paye1)
		dw_comptes_recevables.setitem(ll_row,'total_cpd',ld_total_cpd)
		dw_comptes_recevables.setitem(ll_row,'cpd_venir',ld_cpd_venir)
		dw_comptes_recevables.setitem(ll_row,'cpd_venir_date',ldt_cpd_venir_date)
		dw_comptes_recevables.setitem(ll_row,'prochain_paiement_date',ldt_prochain_paiement_date)
		dw_comptes_recevables.setitem(ll_row,'frais',ld_frais)
		dw_comptes_recevables.setitem(ll_row,'couttrait',ld_couttrait)
		dw_comptes_recevables.setitem(ll_row,'coutglobal',ld_coutglobal)
		dw_comptes_recevables.setitem(ll_row,'totfact',ld_cpd_venir)
   END IF
LOOP

CLOSE recevable;

//nb_row = dw_comptes_recevables.rowcount()
//sle_2.text = string(nb_row)
//tot_pos = 0
//tot_neg = 0
//
//for i = 1 to nb_row
//	montant_cpd = 0
//	SetNull(date_cpd) 
//	sle_1.text = string(i)
//	v_traitement_id = dw_comptes_recevables.getitemnumber(i,"traitement_id")
//	select first date_cheque, paiement into :date_cpd, :montant_cpd from cheques_postdates where traitement_patient_id = :v_traitement_id and date_cheque > today() order by date_cheque asc;
//	select sum(paiement) into :total_montant_cpd from cheques_postdates where traitement_patient_id = :v_traitement_id and date_cheque >= :ldt_datefin; //apres modif
////	select sum(paiement) into :total_montant_cpd from cheques_postdates where traitement_patient_id = :v_traitement_id and indicateur <> '1'; //avant modif
//	if isnull(total_montant_cpd) = true then
//		total_montant_cpd = 0
//	end if
//	// Ajustement montant du
//	dw_comptes_recevables.setitem(i,'cpd_venir_date',date_cpd)
//	dw_comptes_recevables.setitem(i,'cpd_venir',montant_cpd)
//	dw_comptes_recevables.setitem(i,'total_cpd',total_montant_cpd)
//	dw_comptes_recevables.scrollnextrow()
//next
end event

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

type em_datefin from editmask within w_comptes_recevablesant
integer x = 2181
integer y = 1936
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
end type

event constructor;em_datefin.text = string(today())
end event

type st_1 from statictext within w_comptes_recevablesant
integer x = 1815
integer y = 1944
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date de fin :"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "From:"
end if
end event

type cb_close from commandbutton within w_comptes_recevablesant
integer x = 2839
integer y = 1928
integer width = 786
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
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
	this.Text = "Close"
end if
end event

type cb_print from commandbutton within w_comptes_recevablesant
integer x = 5
integer y = 1928
integer width = 786
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

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_comptes_recevables)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type dw_comptes_recevables from u_dw within w_comptes_recevablesant
event retourner ( long ll_ortho_id,  date ld_datefin )
integer width = 3634
integer height = 1920
integer taborder = 30
string title = "compte_recevable"
string dataobject = "d_compte_recevableant"
boolean hscrollbar = true
boolean border = false
boolean hsplitscroll = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ll_ortho_id, date ld_datefin);int i
string ls_patient_nom, ls_patient_prenom, ls_nom_complet
dec{2} ld_montant_du, ld_montant_paye, ld_total_cpd, ld_cpd_venir, ld_frais, ld_montant_paye1
long ll_traitement_id, ll_row
date ldt_cpd_venir_date, ldt_prochain_paiement_date 

dw_comptes_recevables.RowsDiscard(1, dw_comptes_recevables.Rowcount(), Primary!)
setpointer(hourglass!)

DECLARE recevable CURSOR FOR

SELECT  patient.patient_nom ,
        patient.patient_prenom ,
        ortho_id.dr_nom_complet ,
        traitements.traitement_id as trait ,
		  (select sum(montant_recu) FROM paiement (index i_paiement) WHERE traitement_patient_id = trait and date_paiement <= today())  as montantpaye1,
		  (if montantpaye1 is null then 0 else montantpaye1 endif) as montantpaye,
		  (select sum(montant) FROM factures_traitements (index i_traitementid) WHERE traitement_id = trait and date_facture <= today()) - montantpaye as montantdu, 
		  traitements.total_cpd ,
        traitements.cpd_venir ,
        traitements.cpd_venir_date ,
        (select max(date_paiement )from paiement (index i_paiement) where traitement_patient_id = trait ) as datepaiement ,
        traitements.frais   
FROM    ortho_id (index i_ortho_id) INNER JOIN patient ON ortho_id.ortho_id = patient.no_ortho,
	     patient INNER JOIN traitements (index i_patientid) ON patient.patient_id = traitements.patient_id

WHERE    ortho_id.ortho_id = :ll_ortho_id  AND 
		   (traitements.frais <> traitements.montant_paye  OR       
	      (traitements.montant_du = 0  AND       
	      traitements.frais - traitements.montant_paye <> 0 ) OR
	 	   (traitements.montant_du <> 0  AND       
	      traitements.frais - traitements.montant_paye = 0 ))

ORDER BY patient.patient_nom          ASC,
	      patient.patient_prenom       ASC;
			
OPEN recevable;

DO WHILE SQLCA.SQLCode = 0
   FETCH recevable INTO :ls_patient_nom,
	                     :ls_patient_prenom,
								:ls_nom_complet,
								:ll_traitement_id,
								:ld_montant_paye1,
								:ld_montant_paye,
								:ld_montant_du,
								:ld_total_cpd,
								:ld_cpd_venir,
								:ldt_cpd_venir_date,
								:ldt_prochain_paiement_date,
								:ld_frais;
								
   IF SQLCA.SQLCode = 0 THEN
	   ll_row = dw_comptes_recevables.insertrow(0)
		dw_comptes_recevables.scrolltorow(ll_row)
		dw_comptes_recevables.setitem(ll_row,'patient_nom',ls_patient_nom)
		dw_comptes_recevables.setitem(ll_row,'patient_prenom',ls_patient_prenom)
		dw_comptes_recevables.setitem(ll_row,'dr_nom_complet',ls_nom_complet)
		dw_comptes_recevables.setitem(ll_row,'montant_du',ld_montant_du)
		dw_comptes_recevables.setitem(ll_row,'traitement_id',ll_traitement_id)
		dw_comptes_recevables.setitem(ll_row,'montant_paye1',ld_montant_paye1)
		dw_comptes_recevables.setitem(ll_row,'montant_paye',ld_montant_paye)
		dw_comptes_recevables.setitem(ll_row,'total_cpd',ld_total_cpd)
		dw_comptes_recevables.setitem(ll_row,'cpd_venir',ld_cpd_venir)
		dw_comptes_recevables.setitem(ll_row,'cpd_venir_date',ldt_cpd_venir_date)
		dw_comptes_recevables.setitem(ll_row,'prochain_paiement_date',ldt_prochain_paiement_date)
		dw_comptes_recevables.setitem(ll_row,'frais',ld_frais)
   END IF
LOOP

CLOSE recevable;
end event

event buttonclicked;choose case dwo.name
	case 'b_nom'
		if lb_asc then
			dw_comptes_recevables.setsort("patient_nom A, patient_prenom A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("patient_nom D, patient_prenom A")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_cout'
		if lb_asc then
			dw_comptes_recevables.setsort("frais A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("frais D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_montantpaye'
		if lb_asc then
			dw_comptes_recevables.setsort("montantpaye A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("montantpaye D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_date'
		if lb_asc then
			dw_comptes_recevables.setsort("prochain_paiement_date A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("prochain_paiement_date D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_solde'
		if lb_asc then
			dw_comptes_recevables.setsort("solde A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("solde D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_datecpd'
		if lb_asc then
			dw_comptes_recevables.setsort("cpd_venir_date A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("cpd_venir_date D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_montantcpd'
		if lb_asc then
			dw_comptes_recevables.setsort("cpd_venir A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("cpd_venir D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_totalcpd'
		if lb_asc then
			dw_comptes_recevables.setsort("total_cpd A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("total_cpd D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_cpdvenir'
		if lb_asc then
			dw_comptes_recevables.setsort("compute_2 A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("compute_2 D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_montantdu'
		if lb_asc then
			dw_comptes_recevables.setsort("montant_du A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("montant_du D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
	case 'b_coutglob'
		if lb_asc then
			dw_comptes_recevables.setsort("coutglobal A")
			dw_comptes_recevables.sort()
			lb_asc = false
		else
			dw_comptes_recevables.setsort("coutglobal D")
			dw_comptes_recevables.sort()
			lb_asc = true
		end if
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

event constructor;if v_langue = 'an' then
	this.object.t_titre.text = "Receivable account for "
	this.object.b_nom.text = "Patient's name"
	this.object.b_cout.text = "Total charged"
	this.object.b_montantpaye.text = "Paid amount"
	this.object.b_coutglobal.text = "Global cost"
	this.object.b_montantdu.text = "Due Amount"
	this.object.b_couttrait.text = "Treatment cost"
//	this.object.b_totalcpd.text = "PDC Total"
//	this.object.b_montantcpd.text = "PDC's to come"
//	this.object.b_montantdu.text = 'Due'
	this.object.t_nom.text = "Patient's name"
	this.object.t_cout.text = "Total charged"
	this.object.t_montantpaye.text = "Paid amount"
	this.object.t_coutglobal.text = "Global cost"
	this.object.t_montantdu.text = "Due Amount"
	this.object.t_couttrait.text = "Treatment cost"
//	this.object.t_totalcpd.text = "PDC Total"
//	this.object.b_montantcpd.text = "PDC's to come"
//	this.object.t_montantdu.text = 'Due'
//	this.object.t_totneg.text = 'Negative total'
//	this.object.t_totpos.text = 'Positive total'
	this.object.t_printedon.text = 'Printed on'
end if
end event

