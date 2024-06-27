$PBExportHeader$w_pour_fact.srw
forward
global type w_pour_fact from w_child
end type
type em_year from editmask within w_pour_fact
end type
type cbx_2 from checkbox within w_pour_fact
end type
type cbx_1 from checkbox within w_pour_fact
end type
type dw_sat from uo_sat within w_pour_fact
end type
type st_1 from statictext within w_pour_fact
end type
type cb_find from commandbutton within w_pour_fact
end type
type cb_quit from commandbutton within w_pour_fact
end type
type cb_imp from commandbutton within w_pour_fact
end type
type dw_pour_fact from u_dw within w_pour_fact
end type
end forward

shared variables

end variables

global type w_pour_fact from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string pointer = "Arrow!"
boolean ib_isupdateable = false
event ue_post_open ( )
em_year em_year
cbx_2 cbx_2
cbx_1 cbx_1
dw_sat dw_sat
st_1 st_1
cb_find cb_find
cb_quit cb_quit
cb_imp cb_imp
dw_pour_fact dw_pour_fact
end type
global w_pour_fact w_pour_fact

type variables
dec {2} total_neg, total_pos
string vv_date
end variables

forward prototypes
public subroutine calcul_paiement ()
end prototypes

public subroutine calcul_paiement ();/*long nb_row, i, id
date v_date_fin
dec {2} montant = 0
v_date_fin = date(vv_date)
total_neg = 0 
total_pos = 0
nb_row = dw_pour_fact.rowcount()
dw_pour_fact.scrolltorow(1)
sle_2.text = string(nb_row)
for i = 1 to nb_row
	sle_1.text = string(i)
	id = dw_pour_fact.getitemnumber(i,"traitements_traitement_id")
	select sum(montant_recu) into :montant from paiement where traitement_patient_id = :id and date_paiement <= :v_date_fin;
	if isnull(montant) then
		montant = 0
	end if
	dw_pour_fact.setitem(i,"traitements_montant_paye_pourc",montant)
	if dw_pour_fact.object.diff[i] >= 0 then
		total_pos = total_pos + dw_pour_fact.object.diff[i]
	else
		total_neg = total_neg + dw_pour_fact.object.diff[i]
	end if
	dw_pour_fact.setitem(dw_pour_fact.getrow(),"traitements_date_rapport",date(vv_date))
	dw_pour_fact.scrollnextrow()
next
if dw_pour_fact.update() = 1 then
	commit;
else
	rollback;
	messagebox("Information","Aucune possibilité de calculer les montants payés!",information!)
end if
dw_pour_fact.object.total_pos.text = string(total_pos) + " $"
dw_pour_fact.object.total_neg.text = string(total_neg) + " $"*/
end subroutine

on w_pour_fact.create
int iCurrent
call super::create
this.em_year=create em_year
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.dw_sat=create dw_sat
this.st_1=create st_1
this.cb_find=create cb_find
this.cb_quit=create cb_quit
this.cb_imp=create cb_imp
this.dw_pour_fact=create dw_pour_fact
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_year
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.dw_sat
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_find
this.Control[iCurrent+7]=this.cb_quit
this.Control[iCurrent+8]=this.cb_imp
this.Control[iCurrent+9]=this.dw_pour_fact
end on

on w_pour_fact.destroy
call super::destroy
destroy(this.em_year)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.dw_sat)
destroy(this.st_1)
destroy(this.cb_find)
destroy(this.cb_quit)
destroy(this.cb_imp)
destroy(this.dw_pour_fact)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_year.text = string(year(today()))
end event

type em_year from editmask within w_pour_fact
integer x = 1710
integer y = 1920
integer width = 430
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type cbx_2 from checkbox within w_pour_fact
integer x = 1253
integer width = 850
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Éliminer <> 0"
end type

event clicked;if cbx_2.checked then
	dw_pour_fact.SetFilter("diff <> 0")
else
	dw_pour_fact.SetFilter("")
end if
dw_pour_fact.Filter()
dw_pour_fact.SetSort("patient.patient_nom A")
dw_pour_fact.Sort()
end event

type cbx_1 from checkbox within w_pour_fact
integer width = 1248
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Trier avec les dates de début de traitement"
end type

event clicked;if cbx_1.checked then
	dw_pour_fact.SetFilter("year(traitements_debut_traitement) <= integer('" + string(em_year.text) + "')")
else
	dw_pour_fact.SetFilter("")
end if
dw_pour_fact.Filter()
dw_pour_fact.SetSort("patient.patient_nom A")
dw_pour_fact.Sort()
end event

type dw_sat from uo_sat within w_pour_fact
integer x = 2112
integer taborder = 10
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_pour_fact.setFilter("")
	dw_pour_fact.filter()
else
	dw_pour_fact.setFilter("patient_id_satellite = " + string(il_idsat))
	dw_pour_fact.filter()
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

type st_1 from statictext within w_pour_fact
integer x = 1134
integer y = 1936
integer width = 553
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 134217750
boolean enabled = false
string text = "Date d~'imposition :"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "For year:"
end if
end event

type cb_find from commandbutton within w_pour_fact
integer x = 14
integer y = 1912
integer width = 827
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;string nom_ortho
integer li_year
date ldt_date

setpointer(hourglass!)
em_year.getdata(ldt_date)
dw_pour_fact.object.t_date.text = string(ldt_date,'dd-mm-yyyy')

dw_pour_fact.retrieve(v_no_ortho,ldt_date)
SELECT dr_nom_complet INTO :nom_ortho FROM ortho_id WHERE ortho_id = :v_no_ortho;
dw_pour_fact.setitem(1,"ortho_id_dr_nom_complet",nom_ortho)



//int i, li_pouract
//string ls_date, ls_nom_ortho, ls_patient_nom, ls_patient_prenom, ls_drnomcomplt
//dec{2} ld_montantorg, ld_frais, ld_montant_paye, ld_montantglobal, ld_montantpaye, ld_revenugagne, ld_diff, ld_montantpayepour
//long ll_traitid, ll_row
//date ld_fin, ldt_daterapport
//
//ld_fin = date(string("31-"+"12-"+em_fin.text))
//dw_pour_fact.RowsDiscard(1, dw_pour_fact.Rowcount(), Primary!)
//setpointer(hourglass!)
//
//DECLARE pour_fact CURSOR FOR
//
//SELECT   patient.patient_nom ,
//		   patient.patient_prenom ,
//		   traitements.pourcentage_actuel ,
//		   traitements.montant_original ,
//		   traitements.traitement_id as trait,
//		   ortho_id.dr_nom_complet ,
//         traitements.frais ,
//		   traitements.montant_paye ,
//         (select sum(montant) from factures_traitements where traitement_id = trait) as montantglobal ,
//         (select sum(montant_recu) from paiement where date_paiement <= :ld_fin and traitement_patient_id = trait) as montantpaye,
//			(traitements.frais *  traitements.pourcentage_actuel) / 100 as revenugagnee,
//			(revenugagnee - montantpaye) as diff,
//		   traitements.date_rapport     
//FROM     patient INNER JOIN traitements ON patient.patient_id = traitements.patient_id 
//		           INNER JOIN ortho_id ON patient.no_ortho = ortho_id.ortho_id      
//WHERE    patient.no_ortho = ortho_id.ortho_id  and        
//		   patient.no_ortho = :v_no_ortho  and        
//		   montantglobal > 0  and         
//		   ((traitements.debut_traitement <= :ld_fin  and      
//		   traitements.pourcentage_actuel < 100) or          
//	  	   (traitements.pourcentage_actuel = 100 and  
//         years(traitements.fin_traitement) = years(:ld_fin)))   
//ORDER BY patient.patient_nom ASC;
//			
//OPEN pour_fact;
//
//DO WHILE SQLCA.SQLCode = 0
//   FETCH pour_fact INTO :ls_patient_nom,
//	                     :ls_patient_prenom,
//								:li_pouract,
//								:ld_montantorg,
//								:ll_traitid,
//								:ls_drnomcomplt,
//								:ld_frais,
//								:ld_montant_paye,
//								:ld_montantglobal,
//								:ld_montantpaye,
//								:ld_revenugagne,
//								:ld_diff,
//								:ldt_daterapport;
//								
//   IF SQLCA.SQLCode = 0 THEN
//	   ll_row = dw_pour_fact.insertrow(0)
//		dw_pour_fact.scrolltorow(ll_row)
//		dw_pour_fact.setitem(ll_row,'patient_nom',ls_patient_nom)
//		dw_pour_fact.setitem(ll_row,'patient_prenom',ls_patient_prenom)
//		dw_pour_fact.setitem(ll_row,'pourcentage_actuel',li_pouract)
//		dw_pour_fact.setitem(ll_row,'montant_original',ld_montantorg)
//		dw_pour_fact.setitem(ll_row,'traitement_id',ll_traitid)
//		dw_pour_fact.setitem(ll_row,'dr_nom_complet',ls_drnomcomplt)
//		dw_pour_fact.setitem(ll_row,'frais',ld_frais)
//		dw_pour_fact.setitem(ll_row,'montant_paye',ld_montant_paye)
//		dw_pour_fact.setitem(ll_row,'montantglobal',ld_montantglobal)
//		dw_pour_fact.setitem(ll_row,'montantpaye',ld_montantpaye)
//		dw_pour_fact.setitem(ll_row,'revenu_gagne',ld_revenugagne)
//		dw_pour_fact.setitem(ll_row,'diff',ld_diff)
//		dw_pour_fact.setitem(ll_row,'date_rapport',ldt_daterapport)
//   END IF
//LOOP
//
//CLOSE pour_fact;
//
//
//
//
//
//
//
//

end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_quit from commandbutton within w_pour_fact
integer x = 3040
integer y = 1912
integer width = 571
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	cb_quit.Text = "Close window"
end if
end event

type cb_imp from commandbutton within w_pour_fact
integer x = 2423
integer y = 1912
integer width = 617
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Lancer l~'impression"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_pour_fact)
end event

event constructor;if v_langue = 'an' then
	cb_imp.Text = "Launch printing"
end if
end event

type dw_pour_fact from u_dw within w_pour_fact
integer y = 100
integer width = 3621
integer height = 1804
integer taborder = 30
string dataobject = "d_pour_fact"
boolean hscrollbar = true
boolean border = false
boolean hsplitscroll = true
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_pour_fact.settransobject(sqlca)
if v_langue = 'an' then
dw_pour_fact.object.patient_nom_t.text = 'Patient Name:'
dw_pour_fact.object.patient_prenom_t.text = 'First name:'
dw_pour_fact.object.montant_original_t.text = 'Global amount:'
dw_pour_fact.object.t_2.text = 'Income:'
dw_pour_fact.object.montant_paye_t.text = 'Cash received:'
dw_pour_fact.object.t_3.text = 'Difference:'
dw_pour_fact.object.t_6.text = 'Receivable total:'
dw_pour_fact.object.t_7.text = 'Total:'
dw_pour_fact.object.t_8.text = 'Payable total:'
dw_pour_fact.object.t_1.text = 'Percentage list for:'
end if



end event

event retrieverow;setpointer(hourglass!)
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

event doubleclicked;call super::doubleclicked;w_patient.event ue_dossfin(getitemnumber(row,'patient_patient_id'))
end event

