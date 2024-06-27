$PBExportHeader$w_ajustement.srw
forward
global type w_ajustement from w_child
end type
type st_3 from statictext within w_ajustement
end type
type dw_montant_du from u_dw within w_ajustement
end type
type st_2 from statictext within w_ajustement
end type
type st_1 from statictext within w_ajustement
end type
type dw_factures from u_dw within w_ajustement
end type
type dw_ajustement from u_dw within w_ajustement
end type
end forward

global type w_ajustement from w_child
integer x = 823
integer y = 360
integer width = 3154
integer height = 1936
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
boolean ib_isupdateable = false
st_3 st_3
dw_montant_du dw_montant_du
st_2 st_2
st_1 st_1
dw_factures dw_factures
dw_ajustement dw_ajustement
end type
global w_ajustement w_ajustement

type variables

end variables

event open;call super::open;date v_date_cheque//,ldt_carte
//string recu = "0" , sinus, ls_nomresp, ls_modalite,ls_nocarte
long /*traitement_id, nb_row, i,*/ nb//, ll_idcontact, ll_idlot, ll_idsat
//decimal{2} montant, v_montant_paye, montant_total_fact
//integer v_affect, li_nocheque,li_ind,li_taxe

select count(*) into :nb from lock_cheques;
if nb = 0 then
	v_date_cheque = relativedate(today(),-1)
	insert into lock_cheques (flag) values (:v_date_cheque);
end if
//si v_date_cheque est < today(), pas ete encaisse aujourd'hui
select flag into :v_date_cheque from lock_cheques;
if v_date_cheque < today() then
	w_etat.sle_status.text = "Barrer les stations de travail"
	update lock_cheques set flag = today();
	commit;
	
	// 2010-03-15 - Sébastien - Changé pour accélérer le processus et ne pas risquer que 2 postes le fassent en même temps
	insert into paiement (montant_recu, date_paiement, datedepot, paiement, recu, traitement_patient_id, affect, cache, nocheque, id_contact, datecarte, nocarte, ind, id_lot, taxe,id_satellite)
	(select paiement, date_cheque, date_cheque, modalite, recu, traitement_patient_id, affect, 0, nocheque, id_contact, datecarte, nocarte, ind, id_lot, taxe, id_satellite
		from cheques_postdates
	  where indicateur <> '1' and date_cheque <= today());
	if error_type(-1) = 0 then
		error_type(53)
		rollback;
		return 0
	end if
	
	update cheques_postdates set indicateur = '1'
	where indicateur <> '1' and date_cheque <= today();
	if error_type(-1) = 1 then
		commit;
	else
		error_type(53)
		rollback;
		return 0
	end if
	
	// Filtre les chèques postdatés de la journée
//	dw_ajustement.Retrieve()
//	nb_row = dw_ajustement.rowcount()
//	w_etat.sle_status.text = string(nb_row)+" cpd à encaisser"
//	if nb_row > 0 then
//		for i = 1 to nb_row
//			// encaissement des chèques (montant_paye)
//			montant = dw_ajustement.getitemnumber(i, "paiement")
//			v_date_cheque = dw_ajustement.getitemdate(i, "date_cheque")
//			traitement_id = dw_ajustement.getitemnumber(i, "traitement_patient_id")
//			v_affect = dw_ajustement.getitemnumber(i, "affect")
//			recu = dw_ajustement.getitemstring(i, "recu")
//			li_nocheque = dw_ajustement.getitemnumber(i, "nocheque")
//			ls_nomresp = dw_ajustement.getitemstring(i, "nomresp")
//			ls_modalite = dw_ajustement.getitemstring(i, "modalite")
//			ll_idcontact = dw_ajustement.getItemNumber(i,"id_contact")
//			ldt_carte = dw_ajustement.getItemDate(i,"datecarte")
//			ls_nocarte = dw_ajustement.getItemString(i,"nocarte")
//			li_ind = dw_ajustement.getItemNumber(i,"ind")
//			ll_idlot = dw_ajustement.getItemNumber(i,"id_lot")
//			li_taxe = dw_ajustement.getItemNumber(i,"taxe")
//			ll_idsat = dw_ajustement.getItemNumber(i,'id_satellite')
//			if isnull(ls_modalite) then ls_modalite = 'P'
//			if isnull(v_affect) = true then
//				v_affect = 1
//			end if
//			// Création du paiement
//			insert into paiement (montant_recu, date_paiement, datedepot, paiement, recu, traitement_patient_id, affect, cache, nocheque, id_contact, datecarte, nocarte, ind, id_lot, taxe,id_satellite)
//			values(:montant, :v_date_cheque, :v_date_cheque, :ls_modalite, :recu, :traitement_id , :v_affect,0,:li_nocheque,:ll_idcontact,:ldt_carte,:ls_nocarte,:li_ind,:ll_idlot,:li_taxe,:ll_idsat);
//			error_type(-1)
//			// Calcul montant_paye
//
//			// Indiquer que les modifications sont faites pour cette encaissement
//			dw_ajustement.setitem(i,"indicateur","1")
//		next
//		// Mise à jour des chèques postdatés.
//		if dw_ajustement.update() = 1 then
//			commit using SQLCA;
//		else
//			rollback using SQLCA;
//			error_type(53)
//		end if
//	end if
end if
close(w_ajustement)
end event

on w_ajustement.create
int iCurrent
call super::create
this.st_3=create st_3
this.dw_montant_du=create dw_montant_du
this.st_2=create st_2
this.st_1=create st_1
this.dw_factures=create dw_factures
this.dw_ajustement=create dw_ajustement
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.dw_montant_du
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_factures
this.Control[iCurrent+6]=this.dw_ajustement
end on

on w_ajustement.destroy
call super::destroy
destroy(this.st_3)
destroy(this.dw_montant_du)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_factures)
destroy(this.dw_ajustement)
end on

type st_3 from statictext within w_ajustement
integer x = 69
integer y = 1120
integer width = 530
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Facture montant dû"
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_3.Text = "Due amount Invoice"
end if
end event

type dw_montant_du from u_dw within w_ajustement
integer x = 78
integer y = 1244
integer width = 1271
integer height = 624
integer taborder = 30
string dataobject = "d_factures_ajustement_montant_du"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_montant_du.SetTransObject (SQLCA)
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

type st_2 from statictext within w_ajustement
integer x = 91
integer y = 36
integer width = 558
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chèques postadatés"
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "Postdated Cheques"
end if
end event

type st_1 from statictext within w_ajustement
integer x = 1751
integer y = 32
integer width = 526
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "factures traitemerts"
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Treatment Invoice"
end if
end event

type dw_factures from u_dw within w_ajustement
integer x = 1751
integer y = 148
integer width = 1280
integer height = 932
integer taborder = 20
string dataobject = "d_factures_ajustement"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_factures.SetTransObject (SQLCA)

if v_langue = 'an' then
dw_factures.object.date_facture_t.text = 'Invoice Date'
dw_factures.object.montant_t.text = 'Amount'

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

type dw_ajustement from u_dw within w_ajustement
integer x = 82
integer y = 136
integer width = 1632
integer height = 944
integer taborder = 10
string dataobject = "d_cheques_avant"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_ajustement.SetTransObject (SQLCA)


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

