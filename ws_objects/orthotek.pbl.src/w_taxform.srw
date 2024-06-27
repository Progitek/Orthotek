$PBExportHeader$w_taxform.srw
forward
global type w_taxform from w_child
end type
type em_year from editmask within w_taxform
end type
type dw_sat from uo_sat within w_taxform
end type
type cb_search from commandbutton within w_taxform
end type
type cb_close from commandbutton within w_taxform
end type
type cb_print from commandbutton within w_taxform
end type
type dw_taxform from u_dw within w_taxform
end type
end forward

global type w_taxform from w_child
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
em_year em_year
dw_sat dw_sat
cb_search cb_search
cb_close cb_close
cb_print cb_print
dw_taxform dw_taxform
end type
global w_taxform w_taxform

on w_taxform.create
int iCurrent
call super::create
this.em_year=create em_year
this.dw_sat=create dw_sat
this.cb_search=create cb_search
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_taxform=create dw_taxform
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_year
this.Control[iCurrent+2]=this.dw_sat
this.Control[iCurrent+3]=this.cb_search
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_taxform
end on

on w_taxform.destroy
call super::destroy
destroy(this.em_year)
destroy(this.dw_sat)
destroy(this.cb_search)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_taxform)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type em_year from editmask within w_taxform
integer x = 1733
integer y = 1920
integer width = 425
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
end type

event constructor;em_year.text = string(year(today()))
end event

type dw_sat from uo_sat within w_taxform
integer x = 2117
integer taborder = 10
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_taxform.setFilter("")
	dw_taxform.filter()
else
	dw_taxform.setFilter("id_satellite = " + string(il_idsat))
	dw_taxform.filter()
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

type cb_search from commandbutton within w_taxform
integer x = 654
integer y = 1916
integer width = 654
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Recherche"
end type

event clicked;integer li_year

li_year = integer(em_year.text)
dw_taxform.event retourner(v_no_ortho,li_year)
end event

type cb_close from commandbutton within w_taxform
integer x = 2962
integer y = 1916
integer width = 658
integer height = 108
integer taborder = 60
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
	this.text = 'Close'
end if
end event

type cb_print from commandbutton within w_taxform
integer y = 1916
integer width = 654
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
openwithparm(w_print_options,dw_taxform)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_taxform from u_dw within w_taxform
event retourner ( long ortho_id,  integer ai_year )
integer y = 72
integer width = 3621
integer height = 1844
integer taborder = 50
string dataobject = "d_taxform"
boolean hscrollbar = true
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ortho_id, integer ai_year);Long ll_traitement_id, ll_row, ll_nbrow, ll_trait, i, ll_idsat
String ls_nom_complet, ls_patient_nom, ls_patient_prenom
dec{2} montant_paye, montant_facture, montant_original, ld_montantfact1, ld_montantpaye1, globalcost1, globalcost, totpaie1, totpaie, balance
date dernpaiement, ldt_paiement
int li_nbcpd

setpointer(hourglass!)
// Déclaration du curseur
dw_taxform.reset()
Declare souffrance Cursor For
 
SELECT  patient.patient_nom ,
        patient.patient_prenom ,
		  patient.id_satellite,
        ortho_id.dr_nom_complet ,
        traitements.traitement_id as trait ,
		  traitements.montant_original ,
        (select sum(montant_recu) FROM paiement WHERE traitement_patient_id = trait and year(date_paiement) = :ai_year) as montantpaye1,
		  (if montantpaye1 is null then 0 else montantpaye1 endif) as montantpaye,
        (select sum(montant) FROM factures_traitements WHERE traitement_id = trait and year(date_facture) = :ai_year) as montantfacture1,
		  (if montantfacture1 is null then 0 else montantfacture1 endif) as montantfacture,
		  (select sum(montant) FROM factures_traitements WHERE traitement_id = trait) as globalcost1,
		  (if globalcost1 is null then 0 else globalcost1 endif) as globalcost,
		  (select sum(montant_recu) FROM paiement WHERE traitement_patient_id = trait) as totpaie1,
		  (if totpaie1 is null then 0 else totpaie1 endif) as totpaie
FROM    ortho_id INNER JOIN patient ON ortho_id.ortho_id = patient.no_ortho,
	     patient INNER JOIN traitements ON patient.patient_id = traitements.patient_id
WHERE   ortho_id.ortho_id = :ortho_id and
        (montantpaye > 0 or montantfacture > 0)
ORDER BY patient.patient_nom          ASC,
	      patient.patient_prenom       ASC;
			
OPEN souffrance;

Do While SQLCA.SQLCode = 0
   Fetch souffrance Into    :ls_patient_nom,
	                         :ls_patient_prenom,
									 :ll_idsat,
	                         :ls_nom_complet,
									 :ll_traitement_id,
									 :montant_original,
									 :ld_montantpaye1,
							       :montant_paye,
									 :ld_montantfact1,
									 :montant_facture,
									 :globalcost1,
									 :globalcost,
									 :totpaie1,
									 :totpaie;
						 
if SQLCA.SQLCode = 0 then
	ll_row = dw_taxform.insertrow(0)
	dw_taxform.scrolltorow(ll_row)
	dw_taxform.setitem(ll_row,'patient_nom',ls_patient_nom)
	dw_taxform.setitem(ll_row,'patient_prenom',ls_patient_prenom)
	dw_taxform.setitem(ll_row,'dr_nom_complet',ls_nom_complet)
	dw_taxform.setitem(ll_row,'traitement_id',ll_traitement_id)
	dw_taxform.setitem(ll_row,'cout_traitement',montant_original)
	dw_taxform.setitem(ll_row,'montant_paye',montant_paye)
	dw_taxform.setitem(ll_row,'montant_facture',montant_facture)
	dw_taxform.setitem(ll_row,'globalcost',globalcost)
	dw_taxform.setitem(ll_row,'totpaie',totpaie)
	dw_taxform.setitem(ll_row,'id_satellite',ll_idsat)
 end if
Loop

close souffrance;

//ll_nbrow = this.rowcount()
//for i = 1 to ll_nbrow
//	ll_trait = this.getitemnumber(i,'traitement_id')
//	select first date_paiement into :ldt_paiement from paiement where traitement_patient_id = :ll_trait order by date_paiement desc;
//	select count(*) into :li_nbcpd from cheques_postdates where traitement_patient_id = :ll_trait and indicateur <> 1;
//	if isnull(li_nbcpd) = true  then
//		li_nbcpd = 0
//	end if
//	this.setitem(i,'dernier_paiement',ldt_paiement)
//next
//
end event

event constructor;if v_langue = 'an' then
	this.object.t_titre.text = 'TAX FORM ' + em_year.text
	this.object.t_nom.text = 'Name'
	this.object.t_couttrait.text = 'Treatment cost'
	this.object.t_montantfact.text = 'Factured amount'
	this.object.t_montantpaye.text = 'Paid amount'
	this.object.t_balance.text = 'Balance'
	this.object.t_patnb.text = 'Qty:'
	this.object.t_printedon.text = 'Printed on'
else
	this.object.t_titre.text = "Formulaire d'impôt pour l'année " + em_year.text
end if
settransobject(SQLCA)

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

