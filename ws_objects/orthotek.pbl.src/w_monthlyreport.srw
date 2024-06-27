$PBExportHeader$w_monthlyreport.srw
forward
global type w_monthlyreport from w_child
end type
type cb_excel from commandbutton within w_monthlyreport
end type
type dw_sat from uo_sat within w_monthlyreport
end type
type cb_1 from commandbutton within w_monthlyreport
end type
type cb_close from commandbutton within w_monthlyreport
end type
type cb_print from commandbutton within w_monthlyreport
end type
type dw_monthlyreport from u_dw within w_monthlyreport
end type
end forward

global type w_monthlyreport from w_child
integer x = 5
integer y = 4
integer width = 3621
integer height = 2016
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
cb_excel cb_excel
dw_sat dw_sat
cb_1 cb_1
cb_close cb_close
cb_print cb_print
dw_monthlyreport dw_monthlyreport
end type
global w_monthlyreport w_monthlyreport

on w_monthlyreport.create
int iCurrent
call super::create
this.cb_excel=create cb_excel
this.dw_sat=create dw_sat
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_monthlyreport=create dw_monthlyreport
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_excel
this.Control[iCurrent+2]=this.dw_sat
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_monthlyreport
end on

on w_monthlyreport.destroy
call super::destroy
destroy(this.cb_excel)
destroy(this.dw_sat)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_monthlyreport)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_excel from commandbutton within w_monthlyreport
integer x = 2350
integer y = 1916
integer width = 613
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exporter vers Excel"
end type

event clicked;if dw_monthlyreport.SaveAs("c:\ii4net\orthotek\correspondances\nonzerodueamount.xls", EXCEL5!,True) = 1 then
	if error_type(228) = 1 then
		run('C:\Program Files\Microsoft Office\Office\Excel.EXE c:\ii4net\orthotek\correspondances\nonzerodueamount.xls',maximized!)
	end if
else
	error_type(0)
end if
end event

type dw_sat from uo_sat within w_monthlyreport
integer x = 2094
integer height = 88
integer taborder = 10
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_monthlyreport.setFilter("")
	dw_monthlyreport.filter()
else
	dw_monthlyreport.setFilter("id_satellite = " + string(il_idsat))
	dw_monthlyreport.filter()
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

type cb_1 from commandbutton within w_monthlyreport
integer x = 654
integer y = 1916
integer width = 1696
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_close from commandbutton within w_monthlyreport
integer x = 2962
integer y = 1916
integer width = 658
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
	this.text = 'Close'
end if
end event

type cb_print from commandbutton within w_monthlyreport
integer y = 1916
integer width = 654
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

event clicked;//dw_nonzerodueamount.object.t_dernpaie.border = 0
//dw_nonzerodueamount.object.t_nom.border = 0
//dw_nonzerodueamount.object.t_montantdu.border = 0
//dw_nonzerodueamount.object.t_date.border = 0
//dw_nonzerodueamount.object.t_montant.border = 0
//dw_nonzerodueamount.object.t_totfact.border = 0
//dw_nonzerodueamount.object.t_totpaie.border = 0
//dw_nonzerodueamount.object.t_balance.border = 0

gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_monthlyreport)

//dw_nonzerodueamount.object.t_dernpaie.border = 3
//dw_nonzerodueamount.object.t_nom.border = 3
//dw_nonzerodueamount.object.t_montantdu.border = 3
//dw_nonzerodueamount.object.t_date.border = 3
//dw_nonzerodueamount.object.t_montant.border = 3
//dw_nonzerodueamount.object.t_totfact.border = 3
//dw_nonzerodueamount.object.t_totpaie.border = 3
//dw_nonzerodueamount.object.t_balance.border = 3
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_monthlyreport from u_dw within w_monthlyreport
event retourner ( long ortho_id )
integer x = 27
integer y = 80
integer width = 3593
integer height = 1836
integer taborder = 50
string title = "monthlyreport"
string dataobject = "d_monthlyreport"
boolean hscrollbar = true
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ortho_id);Long ll_traitement_id, ll_row, ll_nbrow, ll_trait, i, ll_idsat
String ls_nom_complet, ls_patient_nom, ls_patient_prenom
dec{2} montant_paye,montant_facture,montant_original,montant_affect,ld_montantfact1,ld_montantpaye1,datedernpaie,totfact1,totfact
date dernpaiement, ldt_paiement
int li_nbcpd
setpointer(hourglass!)
// Déclaration du curseur
 
Declare souffrance Cursor For
 
SELECT  patient.patient_nom ,
        patient.patient_prenom ,
		  patient.id_satellite,
        ortho_id.dr_nom_complet ,
        traitements.traitement_id as trait ,
		  traitements.montant_original ,
		  (select max(date_paiement) FROM paiement WHERE paiement.traitement_patient_id = trait) as dernpaiement,
		  (select first montant_recu from paiement where paiement.traitement_patient_id = trait and date_paiement = dernpaiement) as datedernpaie,
        (select sum(montant_recu) FROM paiement WHERE traitement_patient_id = trait) as montantpaye1,
		  (if montantpaye1 is null then 0 else montantpaye1 endif) as montantpaye,
		  (select sum(montant) FROM factures_traitements WHERE traitement_id = trait) as totfact1,
		  (if totfact1 is null then 0 else totfact1 endif) as totfact,
        (select sum(montant) FROM factures_traitements WHERE traitement_id = trait and date_facture <= today()) as montantfacture1,
		  (if montantfacture1 is null then 0 else montantfacture1 endif) as montantfacture
FROM    patient INNER JOIN ortho_id ON ortho_id.ortho_id = patient.no_ortho
	      		 INNER JOIN traitements ON patient.patient_id = traitements.patient_id
WHERE   ortho_id.ortho_id = :ortho_id and
		  ((totfact - montantpaye) <> 0 or (montantfacture - montantpaye) <> 0)
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
									 :dernpaiement,
									 :datedernpaie,
									 :ld_montantpaye1,
							       :montant_paye,
									 :totfact1,
									 :totfact,
									 :ld_montantfact1,
									 :montant_facture;
						 
	if SQLCA.SQLCode = 0 then
		ll_row = dw_monthlyreport.insertrow(0)
		dw_monthlyreport.scrolltorow(ll_row)
		dw_monthlyreport.setitem(ll_row,'patient_nom',ls_patient_nom)
		dw_monthlyreport.setitem(ll_row,'patient_prenom',ls_patient_prenom)
		dw_monthlyreport.setitem(ll_row,'dr_nom_complet',ls_nom_complet)
		dw_monthlyreport.setitem(ll_row,'traitement_id',ll_traitement_id)
		dw_monthlyreport.setitem(ll_row,'cout_traitement',montant_original)
		dw_monthlyreport.setitem(ll_row,'dernier_paiement',dernpaiement)
		dw_monthlyreport.setitem(ll_row,'dernpaie',datedernpaie)
		dw_monthlyreport.setitem(ll_row,'montant_paye',montant_paye)
		dw_monthlyreport.setitem(ll_row,'totfact',totfact)
		dw_monthlyreport.setitem(ll_row,'montant_facture',montant_facture)
		dw_monthlyreport.setitem(ll_row,'id_satellite',ll_idsat)
	 end if
Loop

close souffrance;
end event

event constructor;if v_langue = 'an' then
	this.object.t_titre.text = 'MONTHLY REPORT'
	this.object.t_nom.text = 'Name'
	this.object.t_totfact.text = 'Total charged'
	this.object.t_totpaie.text = 'Total paid'
	this.object.t_montantdu.text = 'Amount Due'
	this.object.t_balance1.text = 'Contract'
	this.object.t_balance.text = 'Balance'
	this.object.t_dernpaie.text = 'Last payment'
	this.object.t_montant.text = 'Amount'
	this.object.t_qty.text = 'Qty:'
	this.object.t_printedon.text = 'Printed on'
end if
settransobject(SQLCA)
dw_monthlyreport.event retourner(v_no_ortho)

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

event clicked;choose case dwo.name
	case 't_nom'
		this.setsort("patient_nom A, patient_prenom A")
		this.sort()
	case 't_montantdu'
		this.setsort("c_montantdu A")
		this.sort()
	case 't_date'
		this.setsort("dernier_paiement A")
		this.sort()
	case 't_montant'
		this.setsort("dernpaie A")
		this.sort()
	case 't_totfact'
		this.setsort("totfact A")
		this.sort()
	case 't_totpaie'
		this.setsort("montant_paye A")
		this.sort()
	case 't_balance'
		this.setsort("c_solde A")
		this.sort()
end choose
end event

