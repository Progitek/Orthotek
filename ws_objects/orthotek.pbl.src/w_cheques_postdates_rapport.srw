$PBExportHeader$w_cheques_postdates_rapport.srw
forward
global type w_cheques_postdates_rapport from w_child
end type
type ddplb_1 from dropdownpicturelistbox within w_cheques_postdates_rapport
end type
type cb_1 from commandbutton within w_cheques_postdates_rapport
end type
type dw_sat from uo_sat within w_cheques_postdates_rapport
end type
type cb_export from commandbutton within w_cheques_postdates_rapport
end type
type em_fin from editmask within w_cheques_postdates_rapport
end type
type em_debut from editmask within w_cheques_postdates_rapport
end type
type cb_close from commandbutton within w_cheques_postdates_rapport
end type
type st_2 from statictext within w_cheques_postdates_rapport
end type
type st_1 from statictext within w_cheques_postdates_rapport
end type
type cb_find from commandbutton within w_cheques_postdates_rapport
end type
type cb_print from commandbutton within w_cheques_postdates_rapport
end type
type dw_cheques_postdates from u_dw within w_cheques_postdates_rapport
end type
type gb_date from groupbox within w_cheques_postdates_rapport
end type
type gb_mod from groupbox within w_cheques_postdates_rapport
end type
type rr_1 from roundrectangle within w_cheques_postdates_rapport
end type
end forward

global type w_cheques_postdates_rapport from w_child
integer x = 5
integer y = 4
integer width = 4640
integer height = 2620
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
ddplb_1 ddplb_1
cb_1 cb_1
dw_sat dw_sat
cb_export cb_export
em_fin em_fin
em_debut em_debut
cb_close cb_close
st_2 st_2
st_1 st_1
cb_find cb_find
cb_print cb_print
dw_cheques_postdates dw_cheques_postdates
gb_date gb_date
gb_mod gb_mod
rr_1 rr_1
end type
global w_cheques_postdates_rapport w_cheques_postdates_rapport

type variables

end variables

forward prototypes
public subroutine of_td ()
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

on w_cheques_postdates_rapport.create
int iCurrent
call super::create
this.ddplb_1=create ddplb_1
this.cb_1=create cb_1
this.dw_sat=create dw_sat
this.cb_export=create cb_export
this.em_fin=create em_fin
this.em_debut=create em_debut
this.cb_close=create cb_close
this.st_2=create st_2
this.st_1=create st_1
this.cb_find=create cb_find
this.cb_print=create cb_print
this.dw_cheques_postdates=create dw_cheques_postdates
this.gb_date=create gb_date
this.gb_mod=create gb_mod
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddplb_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_sat
this.Control[iCurrent+4]=this.cb_export
this.Control[iCurrent+5]=this.em_fin
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_find
this.Control[iCurrent+11]=this.cb_print
this.Control[iCurrent+12]=this.dw_cheques_postdates
this.Control[iCurrent+13]=this.gb_date
this.Control[iCurrent+14]=this.gb_mod
this.Control[iCurrent+15]=this.rr_1
end on

on w_cheques_postdates_rapport.destroy
call super::destroy
destroy(this.ddplb_1)
destroy(this.cb_1)
destroy(this.dw_sat)
destroy(this.cb_export)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.cb_close)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.dw_cheques_postdates)
destroy(this.gb_date)
destroy(this.gb_mod)
destroy(this.rr_1)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

dw_cheques_postdates.SetTransObject(SQLCA)
end event

type ddplb_1 from dropdownpicturelistbox within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 78
integer y = 568
integer width = 832
integer height = 648
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

event constructor;long i
string ls_modan[22] = {'Cash','Cheque','Visa','MasterCard','AmericanExpress','Direct payment','N.S.F.','Credit','Transfer','Loss','Postdated','Monthly Charge','pVisa','pMasterCard','pAmex','pDirect payment','Others','Adjustment','N.S.F. Visa','N.S.F. Mastercard','Money Order','Insurance refund'} 
string ls_modfr[22] = {'Comptant','Chèque','Visa','MasterCard','American Express','Paiement Direct','N.S.F.','Crédit','Transfert','Perte','Postdaté','Mensualité','pVisa','pMasterCard','pAmex','Paiement Pré-Autorisé','Autres','Ajustement','N.S.F. Visa','N.S.F. Mastercard','Mandat poste','Remboursement assurance'} 

if v_langue = 'an' then

this.additem('All',-1)
for i = 1 to upperbound(ls_modan)
	this.additem(ls_modan[i])
next

else
	
this.additem('Tous',-1)
for i = 1 to upperbound(ls_modfr)
	this.additem(ls_modfr[i])
next

end if

this.selectitem(1)
	
end event

type cb_1 from commandbutton within w_cheques_postdates_rapport
string tag = "resize=mb"
integer x = 1385
integer y = 2492
integer width = 384
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

ll_nbcheque = dw_cheques_postdates.rowcount( )
if ll_nbcheque = 0 then
	messagebox("Avertissement!","Il n'y a pas de chèques sélectionnés")
else
	
	of_td()
	
end if
end event

event constructor;if v_langue = 'an' then
cb_close.text = 'Export'
end if
end event

type dw_sat from uo_sat within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 3081
integer y = 12
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

type cb_export from commandbutton within w_cheques_postdates_rapport
string tag = "resize=mbr"
integer x = 3657
integer y = 2496
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

type em_fin from editmask within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 521
integer y = 308
integer width = 402
integer height = 100
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

type em_debut from editmask within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 91
integer y = 308
integer width = 411
integer height = 100
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

type cb_close from commandbutton within w_cheques_postdates_rapport
string tag = "resize=mbr"
integer x = 4233
integer y = 2496
integer width = 384
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

type st_2 from statictext within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 530
integer y = 228
integer width = 233
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 16777215
string text = "fin"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
st_2.text = 'Ending:'
end if
end event

type st_1 from statictext within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 91
integer y = 228
integer width = 398
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 16777215
string text = "début"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
st_1.text = 'Starting:'
end if
end event

type cb_find from commandbutton within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 494
integer y = 720
integer width = 421
integer height = 124
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

event clicked;string ls_mod
date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_cheques_postdates.object.date_debut.text = em_debut.text
dw_cheques_postdates.object.date_fin.text = em_fin.text
//dw_cheques_postdates.setfilter("cheques_postdates_date_cheque > '"+debut+"' and cheques_postdates_date_cheque < '"+fin+"'")

choose case ddplb_1.text
	case 'Cash','Comptant'
		ls_mod = '$'
	case 'Cheque','Chèque'
		ls_mod = 'C'	
	case 'Visa','Visa'
		ls_mod = 'Visa'	
	case 'MasterCard','MasterCard'
		ls_mod = 'MC'
	case 'AmericanExpress','American Express'
		ls_mod = 'AmEx'
	case 'Direct payment','Paiement Direct'
		ls_mod = 'PD'
	case 'N.S.F.'
		ls_mod = 'NSF'
	case 'Credit','Crédit'
		ls_mod = 'credit'
	case 'Transfer','Transfert'
		ls_mod = 'trans'
	case 'Loss','Perte'
		ls_mod = 'perte'
	case 'Postdated','Postdaté'
		ls_mod = 'P'
	case 'Monthly Charge','Mensualité'
		ls_mod = 'mens'
	case 'pVisa'
		ls_mod = 'pVisa'
	case 'pMasterCard'
		ls_mod = 'pMC'
	case 'pAmex'
		ls_mod = 'pAmex'
	case 'pDirect payment','Paiement Pré-Autorisé'
		ls_mod = 'pPD'
	case 'Others','Autres'
		ls_mod = 'A'
	case 'Adjustment','Ajustement'
		ls_mod = 'mod'
	case 'N.S.F. Visa','N.S.F. Visa'
		ls_mod = 'nsfv'
	case 'N.S.F. Mastercard','N.S.F. Mastercard'
		ls_mod = 'msfm'
	case 'Money Order','Mandat poste'
		ls_mod = 'mo'
	case else
		setnull(ls_mod)
end choose

dw_cheques_postdates.retrieve(v_no_ortho,debut,fin,ls_mod)
end event

event constructor;if v_langue = 'an' then
cb_find.text = 'Search'
end if
end event

type cb_print from commandbutton within w_cheques_postdates_rapport
string tag = "resize=mbr"
integer x = 992
integer y = 2492
integer width = 389
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

event clicked;//datastore ds_chequepostdate
//date debut, fin
//
//debut = date(em_debut.text)
//fin = date(em_fin.text)
//
//dw_cheques_postdates.object.date_debut.text = em_debut.text
//dw_cheques_postdates.object.date_fin.text = em_fin.text
//
//gb_datawindow = false
//
//ds_chequepostdate = create datastore
//ds_chequepostdate.dataobject = "d_cheques_postdates"
//ds_chequepostdate.settransobject(sqlca)
//ds_chequepostdate.retrieve(v_no_ortho,debut,fin)
//
//openwithparm(w_print_options, ds_chequepostdate)
//
//destroy ds_chequepostdate

gb_datawindow = true
openwithparm(w_print_options, dw_cheques_postdates)
end event

event constructor;if v_langue = 'an' then
cb_print.text = 'Print'
end if
end event

type dw_cheques_postdates from u_dw within w_cheques_postdates_rapport
string tag = "resize=abar"
integer x = 997
integer y = 124
integer width = 3616
integer height = 2348
integer taborder = 50
string dataobject = "d_cheques_postdates"
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

type gb_date from groupbox within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 59
integer y = 156
integer width = 891
integer height = 284
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Date"
end type

type gb_mod from groupbox within w_cheques_postdates_rapport
string tag = "resize=n"
integer x = 55
integer y = 476
integer width = 891
integer height = 216
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Modalité(s)"
end type

type rr_1 from roundrectangle within w_cheques_postdates_rapport
string tag = "resize=ab"
integer linethickness = 4
long fillcolor = 16777215
integer x = 23
integer y = 120
integer width = 960
integer height = 2472
integer cornerheight = 40
integer cornerwidth = 46
end type

