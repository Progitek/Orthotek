$PBExportHeader$w_formulaire_normalise.srw
forward
global type w_formulaire_normalise from w_child
end type
type cb_2 from commandbutton within w_formulaire_normalise
end type
type st_3 from statictext within w_formulaire_normalise
end type
type st_2 from statictext within w_formulaire_normalise
end type
type st_1 from statictext within w_formulaire_normalise
end type
type cb_1 from commandbutton within w_formulaire_normalise
end type
type cb_print from commandbutton within w_formulaire_normalise
end type
type dw_formulaire_normalise from u_dw within w_formulaire_normalise
end type
type cb_close from commandbutton within w_formulaire_normalise
end type
type dw_formulaire_normalise_choisir_factures from u_dw within w_formulaire_normalise
end type
end forward

global type w_formulaire_normalise from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_2 cb_2
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
cb_print cb_print
dw_formulaire_normalise dw_formulaire_normalise
cb_close cb_close
dw_formulaire_normalise_choisir_factures dw_formulaire_normalise_choisir_factures
end type
global w_formulaire_normalise w_formulaire_normalise

type variables
private long il_traitid = 0
end variables

on w_formulaire_normalise.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_print=create cb_print
this.dw_formulaire_normalise=create dw_formulaire_normalise
this.cb_close=create cb_close
this.dw_formulaire_normalise_choisir_factures=create dw_formulaire_normalise_choisir_factures
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.dw_formulaire_normalise
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.dw_formulaire_normalise_choisir_factures
end on

on w_formulaire_normalise.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.dw_formulaire_normalise)
destroy(this.cb_close)
destroy(this.dw_formulaire_normalise_choisir_factures)
end on

event open;call super::open;il_traitid = message.doubleparm
end event

type cb_2 from commandbutton within w_formulaire_normalise
integer x = 2107
integer y = 1912
integer width = 736
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imp. formulaire séparé"
end type

event clicked;int v_count,v_reste,i,j = 1, k
long ll_idcontact, ll_cont[], l, ll_rowfind, ll_ind[], ll_status, ll_job
string ls_langue, ls_code
datastore ds_formpaie
datastore lds_test
date ldt_datepaie
dec{2} ld_montant


ds_formpaie = create datastore
SetPointer(HourGlass!)
dw_formulaire_normalise_choisir_factures.update()
commit;

for i = 1 to dw_formulaire_normalise_choisir_factures.rowcount()
	ll_idcontact = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'id_contact')
	if isnull(ll_idcontact) then 
		error_type(1010)
		return
	end if
next

ll_job = PrintOpen("Formulaire d'assurance", true)

select langue into :ls_langue from patient where patient_id = (select patient_id from traitements where traitement_id = :il_traitid);

// Création des formulaires

for i = 1 to dw_formulaire_normalise_choisir_factures.rowcount()
	
	if dw_formulaire_normalise_choisir_factures.getItemNumber(i,'aimp') = 1 then
		
		ll_idcontact = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'id_contact')
		if ls_langue = 'A' then
			ds_formpaie.dataobject = 'd_formnormenautoold'
		else
			ds_formpaie.dataobject = 'd_formnormpaiefrold'
		end if
		ds_formpaie.setTransObject(SQLCA)
		ds_formpaie.retrieve(il_traitid,today(),today(),ll_idcontact)
		ldt_datepaie = dw_formulaire_normalise_choisir_factures.getItemDate(i,'date_facture')
		ld_montant = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'montant')
		ll_status = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'status_id')
		select code into :ls_code from t_status where status_id = :ll_status;
		ds_formpaie.modify("codeacte1.visible = true")
		ds_formpaie.modify("factures_traitements_date1.visible = true")
		ds_formpaie.modify("factures_traitements_montant1.visible = true")
		ds_formpaie.modify("factures_traitements_montant1_1.visible = true")
		ds_formpaie.setItem(ds_formpaie.getRow(),'factures_traitements_date1',ldt_datepaie)
		ds_formpaie.setItem(ds_formpaie.getRow(),'factures_traitements_montant1',ld_montant)
		ds_formpaie.setItem(ds_formpaie.getRow(),'codeacte1',ls_code)
		PrintDataWindow(ll_job, ds_formpaie)
	end if
	
next

destroy ds_formpaie
PrintClose(ll_job)

end event

type st_3 from statictext within w_formulaire_normalise
integer width = 987
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Formulaire normalisé"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Standardized form'
end if
end event

type st_2 from statictext within w_formulaire_normalise
integer x = 1797
integer width = 1778
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seulement les factures cochées seront imprimées"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Only the notched invoices will be printed'
end if
end event

type st_1 from statictext within w_formulaire_normalise
integer x = 1797
integer y = 64
integer width = 1778
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Le nombre maximal de factures cochées ne doit pas excéder 8"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'The maximum number of notched invoices should not exceed 8'
end if
end event

type cb_1 from commandbutton within w_formulaire_normalise
integer x = 5
integer y = 1912
integer width = 1326
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_print from commandbutton within w_formulaire_normalise
integer x = 1330
integer y = 1912
integer width = 777
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;int v_count,v_reste,i,j = 1, k
long ll_idcontact, ll_cont[], l, ll_rowfind, ll_ind[], ll_status
string ls_langue, ls_code, ls_acte, ls_courriel, ls_email, ls_email2, ls_email3
datastore ds_formpaie[]
datastore lds_test
date ldt_datepaie
dec{2} ld_montant


select isnull(email,''), isnull(email2,''), isnull(email3,'') 
into :ls_email, :ls_email2,:ls_email3 
from traitements 
inner join patient on patient.patient_id = traitements.patient_id 
where traitement_id = :il_traitid;

ls_courriel = ls_email
if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3
gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)

SetPointer(HourGlass!)
dw_formulaire_normalise_choisir_factures.update()
commit;

v_count = 0
for i = 1 to dw_formulaire_normalise_choisir_factures.rowcount()
	if dw_formulaire_normalise_choisir_factures.getItemNumber(i,'aimp') = 1 then
		v_count++
	end if
	ll_idcontact = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'id_contact')
	if isnull(ll_idcontact) then 
		error_type(1010)
		return
	end if
next

if v_count > 8 then
	error_type(110)
else

	select langue into :ls_langue from patient where patient_id = (select patient_id from traitements where traitement_id = :il_traitid);
	if isnull(ll_idcontact) then 
		error_type(1010)
		return
	end if
	
	// Création des formulaires
	
	k = 1
	
	DECLARE listform CURSOR FOR
		select id_contact from t_contact 
		where patient_id = (select patient_id from traitements where traitement_id = :il_traitid);
		
	OPEN listform;
	
	FETCH listform INTO :ll_idcontact;
	
	DO WHILE SQLCA.SQLCode = 0
	
		ll_rowfind = dw_formulaire_normalise_choisir_factures.find('id_contact = ' + string(ll_idcontact),1,dw_formulaire_normalise_choisir_factures.rowcount())
		if ll_rowfind > 0 then
			ds_formpaie[k] = create datastore
			if ls_langue = 'A' then
				ds_formpaie[k].dataobject = 'd_formnormenautoold'
			else
				ds_formpaie[k].dataobject = 'd_formnormpaiefrold'
			end if
			ds_formpaie[k].setTransObject(SQLCA)
			ds_formpaie[k].retrieve(il_traitid,today(),today(),ll_idcontact)			
			ll_cont[k] = ll_idcontact
			ll_ind[k] = 1
			k++
		end if
		
		FETCH listform INTO :ll_idcontact;
		
	
	LOOP
	
	CLOSE listform;
	
	if upperbound(ds_formpaie) > 0 then
	
		for i = 1 to dw_formulaire_normalise_choisir_factures.rowcount()
			if dw_formulaire_normalise_choisir_factures.getItemNumber(i,'aimp') = 1 then
				
				ll_idcontact = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'id_contact')
				
				// Retrouver l'indice
				
				for l = 1 to upperbound(ll_cont)
					if ll_idcontact = ll_cont[l] then
						k = l
					end if
				next
				
				ldt_datepaie = dw_formulaire_normalise_choisir_factures.getItemDate(i,'date_facture')
				ld_montant = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'montant')
				ll_status = dw_formulaire_normalise_choisir_factures.getItemNumber(i,'status_id')
				select code into :ls_code from t_status where status_id = :ll_status;
				ds_formpaie[k].modify("codeacte" + string(ll_ind[k]) + ".visible = true")
				ds_formpaie[k].modify("factures_traitements_date" + string(ll_ind[k]) + ".visible = true")
				ds_formpaie[k].modify("factures_traitements_montant" + string(ll_ind[k]) + ".visible = true")
				ds_formpaie[k].modify("factures_traitements_montant" + string(ll_ind[k]) + "_1.visible = true")
				ds_formpaie[k].setItem(ds_formpaie[k].getRow(),'factures_traitements_date' + string(ll_ind[k]),ldt_datepaie)
				ds_formpaie[k].setItem(ds_formpaie[k].getRow(),'factures_traitements_montant' + string(ll_ind[k]),ld_montant)
				ds_formpaie[k].setItem(ds_formpaie[k].getRow(),'codeacte' + string(ll_ind[k]),ls_code)
				ll_ind[k]++
				
			end if
		next
		
		gb_datawindow = false
		gb_imp = false
		openwithparm(w_print_options,ds_formpaie[1])
		lds_test = message.powerObjectParm
		if not isNull(lds_test) then
			for i = 1 to upperbound(ds_formpaie)
				if ll_ind[i] <> 1 then 
					ds_formpaie[i].object.datawindow.print.PrinterName = lds_test.object.datawindow.print.PrinterName
					ds_formpaie[i].Object.Datawindow.Print.Paper.Source = lds_test.Object.Datawindow.Print.Paper.Source
					ds_formpaie[i].Object.Datawindow.Print.Collate = 'yes'
					ds_formpaie[i].Object.Datawindow.Print.Copies = lds_test.Object.Datawindow.Print.Copies
					ds_formpaie[i].Object.Datawindow.Print.Margin.Top = lds_test.Object.Datawindow.Print.Margin.Top
					ds_formpaie[i].Object.Datawindow.Print.Margin.Left = lds_test.Object.Datawindow.Print.Margin.Left
					ds_formpaie[i].Object.Datawindow.Print.Page.Range = lds_test.Object.Datawindow.Print.Page.Range
					ds_formpaie[i].print()
				end if
			next
		end if
		gb_imp = true
	
		for i = 1 to upperbound(ds_formpaie)
			destroy ds_formpaie[i]
		next
	end if
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_formulaire_normalise from u_dw within w_formulaire_normalise
boolean visible = false
integer x = 3259
integer y = 1308
integer width = 361
integer height = 276
integer taborder = 10
string title = "Formulaire normalisé"
string dataobject = "d_formulaire_normalise"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;integer li_hidesecformnorm
SetTransObject(SQLCA)
select hidesecformnorm into :li_hidesecformnorm from t_options where ortho_id = :v_no_ortho;
if li_hidesecformnorm = 1 then
	object.t_12.visible = false
	object.t_13.visible = false
	object.t_14.visible = false
	object.t_15.visible = false
	object.t_16.visible = false
	object.l_7.visible = false
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

type cb_close from commandbutton within w_formulaire_normalise
integer x = 2843
integer y = 1912
integer width = 786
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

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type dw_formulaire_normalise_choisir_factures from u_dw within w_formulaire_normalise
integer y = 164
integer width = 3630
integer height = 1728
integer taborder = 20
string title = "none"
string dataobject = "d_formulaire_normalise_choisir_factures"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

dw_formulaire_normalise_choisir_factures.SetTransObject(SQLCA)
dw_formulaire_normalise_choisir_factures.SetRowFocusIndicator(Hand!)
dw_formulaire_normalise_choisir_factures.retrieve(message.doubleparm)
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

event itemchanged;call super::itemchanged;if dwo.name = 'aimp' then
	setItem(row,'imp',long(data))
end if
end event

