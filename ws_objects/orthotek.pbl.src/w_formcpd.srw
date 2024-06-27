$PBExportHeader$w_formcpd.srw
forward
global type w_formcpd from w_child
end type
type st_3 from statictext within w_formcpd
end type
type st_2 from statictext within w_formcpd
end type
type st_1 from statictext within w_formcpd
end type
type cb_1 from commandbutton within w_formcpd
end type
type cb_print from commandbutton within w_formcpd
end type
type cb_close from commandbutton within w_formcpd
end type
type dw_formnormchoix from u_dw within w_formcpd
end type
end forward

global type w_formcpd from w_child
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
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
cb_print cb_print
cb_close cb_close
dw_formnormchoix dw_formnormchoix
end type
global w_formcpd w_formcpd

type variables
private long il_traitid = 0
end variables

on w_formcpd.create
int iCurrent
call super::create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_formnormchoix=create dw_formnormchoix
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.dw_formnormchoix
end on

on w_formcpd.destroy
call super::destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_formnormchoix)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_traitid = message.doubleparm
end event

type st_3 from statictext within w_formcpd
integer x = 14
integer y = 12
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

type st_2 from statictext within w_formcpd
integer x = 1691
integer width = 1536
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seulement les chèque postdatés cochés seront imprimés"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Only the notched invoices will be printed'
end if
end event

type st_1 from statictext within w_formcpd
integer x = 1691
integer y = 84
integer width = 1938
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
string text = "Le nombre maximal de chèques postdatés cochés ne doit pas excéder 8"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'The maximum number of notched invoices should not exceed 8'
end if
end event

type cb_1 from commandbutton within w_formcpd
integer x = 5
integer y = 1920
integer width = 2053
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

type cb_print from commandbutton within w_formcpd
integer x = 2062
integer y = 1920
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
long ll_idcontact, ll_cont[], l, ll_rowfind, ll_ind[]
string ls_langue
datastore ds_formpaie[]
datastore lds_test
date ldt_datepaie
dec{2} ld_montant


SetPointer(HourGlass!)
//dw_formnormchoix.update()
//commit;
//ne doit pas depasser 8

//SELECT count(*) into :v_count from paiement where traitement_patient_id = :il_traitid and imp = 1;
//v_reste = 8 - v_count

v_count = 0
for i = 1 to dw_formnormchoix.rowcount()
	if dw_formnormchoix.getItemNumber(i,'imp') = 1 then
		v_count++
	end if
	ll_idcontact = dw_formnormchoix.getItemNumber(i,'id_contact')
	if isnull(ll_idcontact) then 
		error_type(1010)
		return
	end if
next

if v_count > 8 then
	error_type(110)
else
//	v_reste = 8 - v_count
//	for i=1 to v_reste
//		dw_formulaire_normalise.object.dw_formulaire_normalise_factures.insertrow(0)
//	next

	select langue into :ls_langue from patient where patient_id = (select patient_id from traitements where traitement_id = :il_traitid);


	// Création des formulaires
	
	k = 1
	
	DECLARE listform CURSOR FOR
		select id_contact from t_contact where patient_id = (select patient_id from traitements where traitement_id = :il_traitid);
		
	OPEN listform;
	
	FETCH listform INTO :ll_idcontact;
	
	DO WHILE SQLCA.SQLCode = 0
	
		ll_rowfind = dw_formnormchoix.find('cheques_postdates_id_contact = ' + string(ll_idcontact),1,dw_formnormchoix.rowcount())
		if ll_rowfind > 0 then
			ds_formpaie[k] = create datastore
			if ls_langue = 'A' then
				ds_formpaie[k].dataobject = 'd_formnormenauto'
			else
				ds_formpaie[k].dataobject = 'd_formnormpaiefr'
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
	
		for i = 1 to dw_formnormchoix.rowcount()
			if dw_formnormchoix.getItemNumber(i,'imp') = 1 then
				
				ll_idcontact = dw_formnormchoix.getItemNumber(i,'cheques_postdates_id_contact')
				
				// Retrouver l'indice
				
				for l = 1 to upperbound(ll_cont)
					if ll_idcontact = ll_cont[l] then
						k = l
					end if
				next
				
				ldt_datepaie = dw_formnormchoix.getItemDate(i,'cheques_postdates_date_cheque')
				ld_montant = dw_formnormchoix.getItemNumber(i,'cheques_postdates_paiement')
				ds_formpaie[k].modify("codeacte" + string(ll_ind[k]) + ".visible = true")
				ds_formpaie[k].modify("factures_traitements_date" + string(ll_ind[k]) + ".visible = true")
				ds_formpaie[k].modify("factures_traitements_montant" + string(ll_ind[k]) + ".visible = true")
				ds_formpaie[k].modify("factures_traitements_montant" + string(ll_ind[k]) + "_1.visible = true")
				ds_formpaie[k].setItem(ds_formpaie[k].getRow(),'factures_traitements_date' + string(ll_ind[k]),ldt_datepaie)
				ds_formpaie[k].setItem(ds_formpaie[k].getRow(),'factures_traitements_montant' + string(ll_ind[k]),ld_montant)
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

type cb_close from commandbutton within w_formcpd
integer x = 2843
integer y = 1920
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

type dw_formnormchoix from u_dw within w_formcpd
integer x = 18
integer y = 188
integer width = 3611
integer height = 1704
integer taborder = 20
string title = "none"
string dataobject = "d_formcpdchoix"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

dw_formnormchoix.SetTransObject(SQLCA)
dw_formnormchoix.setRowFocusIndicator(Hand!)
dw_formnormchoix.retrieve(message.doubleparm)
dw_formnormchoix.object.cheques_postdates_modalite.values = gf_method(v_langue)
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

