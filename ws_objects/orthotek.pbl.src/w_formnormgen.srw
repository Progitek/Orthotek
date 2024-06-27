$PBExportHeader$w_formnormgen.srw
forward
global type w_formnormgen from w_child
end type
type cb_phasesuiv from commandbutton within w_formnormgen
end type
type st_3 from statictext within w_formnormgen
end type
type st_2 from statictext within w_formnormgen
end type
type st_1 from statictext within w_formnormgen
end type
type cb_phaseprec from commandbutton within w_formnormgen
end type
type cb_print from commandbutton within w_formnormgen
end type
type dw_formnormgen from u_dw within w_formnormgen
end type
type cb_close from commandbutton within w_formnormgen
end type
type dw_formulaire_normalise_choisir_factures from u_dw within w_formnormgen
end type
end forward

global type w_formnormgen from w_child
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
cb_phasesuiv cb_phasesuiv
st_3 st_3
st_2 st_2
st_1 st_1
cb_phaseprec cb_phaseprec
cb_print cb_print
dw_formnormgen dw_formnormgen
cb_close cb_close
dw_formulaire_normalise_choisir_factures dw_formulaire_normalise_choisir_factures
end type
global w_formnormgen w_formnormgen

type variables
private long il_traitid = 0
public long il_patid = 0
private long il_phase
end variables

on w_formnormgen.create
int iCurrent
call super::create
this.cb_phasesuiv=create cb_phasesuiv
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_phaseprec=create cb_phaseprec
this.cb_print=create cb_print
this.dw_formnormgen=create dw_formnormgen
this.cb_close=create cb_close
this.dw_formulaire_normalise_choisir_factures=create dw_formulaire_normalise_choisir_factures
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_phasesuiv
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_phaseprec
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.dw_formnormgen
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.dw_formulaire_normalise_choisir_factures
end on

on w_formnormgen.destroy
call super::destroy
destroy(this.cb_phasesuiv)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_phaseprec)
destroy(this.cb_print)
destroy(this.dw_formnormgen)
destroy(this.cb_close)
destroy(this.dw_formulaire_normalise_choisir_factures)
end on

event open;long ll_count

pro_resize luo_size
luo_size.uf_resizew(this,1,1)


il_patid = message.doubleparm
select max(traitement_id) into :il_traitid from traitements where patient_id = :il_patid;
if il_traitid > 0 then
	select phase into :il_phase from traitements where traitement_id = :il_traitid;
	select count(*) into :ll_count from traitements where patient_id = :il_patid;
	if ll_count > 1 then
		cb_phaseprec.enabled = true
		cb_phasesuiv.enabled = false
	else
		cb_phaseprec.enabled = false
		cb_phasesuiv.enabled = false
	end if
	dw_formulaire_normalise_choisir_factures.Retrieve(il_traitid)
end if
end event

type cb_phasesuiv from commandbutton within w_formnormgen
integer x = 1033
integer y = 1900
integer width = 1029
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Phase suivante"
end type

event clicked;integer  li_demandphase
long ll_traitid, ll_count

li_demandphase = il_phase + 1
if li_demandphase > 0 then
	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
	if isnull(ll_traitid) = false and ll_traitid > 0 then
		il_traitid = ll_traitid
		il_phase = li_demandphase
		cb_phaseprec.enabled = true
		dw_formulaire_normalise_choisir_factures.retrieve(il_traitid)
	end if
end if

li_demandphase = li_demandphase + 1
select count(*) into :ll_count from traitements where patient_id = :il_patid and phase = :li_demandphase;
if ll_count > 1 then
	cb_phaseprec.enabled = true
	cb_phasesuiv.enabled = true
else
	cb_phasesuiv.enabled = false
end if
end event

type st_3 from statictext within w_formnormgen
integer x = 9
integer y = 36
integer width = 1047
integer height = 104
integer textsize = -14
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

type st_2 from statictext within w_formnormgen
integer y = 288
integer width = 1339
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
string text = "Seulement les factures cochées seront imprimées"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Only the notched invoices will be printed'
end if
end event

type st_1 from statictext within w_formnormgen
integer y = 372
integer width = 1678
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
string text = "Le nombre maximal de factures cochées ne doit pas excéder 8"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'The maximum number of notched invoices should not exceed 8'
end if
end event

type cb_phaseprec from commandbutton within w_formnormgen
integer x = 5
integer y = 1900
integer width = 1029
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Phase précédente"
end type

event clicked;integer  li_demandphase
long ll_traitid, ll_count

li_demandphase = il_phase - 1
if li_demandphase > 0 then
	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
	if isnull(ll_traitid) = false and ll_traitid > 0 then
		il_traitid = ll_traitid
		il_phase = li_demandphase
		cb_phasesuiv.enabled = true
		dw_formulaire_normalise_choisir_factures.retrieve(il_traitid)
	end if
end if

li_demandphase = li_demandphase - 1
select count(*) into :ll_count from traitements where patient_id = :il_patid and phase = :li_demandphase;
if ll_count > 1 then
	cb_phaseprec.enabled = true
	cb_phasesuiv.enabled = true
else
	cb_phaseprec.enabled = false
end if
end event

type cb_print from commandbutton within w_formnormgen
integer x = 2062
integer y = 1900
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

event clicked;int v_count,v_reste,i, j
long ll_factid[]
//string ls_langue

SetPointer(HourGlass!)
//dw_formulaire_normalise_choisir_factures.update()
//commit;
//ne doit pas depasser 8
SELECT count(*) into :v_count from factures_traitements where traitement_id = :il_traitid and imp = 1;
v_reste = 8 - v_count
if v_count > 8 then
	error_type(110)
else
	j = 0
	for i = 1 to dw_formulaire_normalise_choisir_factures.rowcount()
		if dw_formulaire_normalise_choisir_factures.getItemNumber(i,'imp') = 1 then
			j++
			ll_factid[j] =  dw_formulaire_normalise_choisir_factures.getItemNumber(i,'facture_id')
		end if
	next

	dw_formnormgen.retrieve(il_traitid,ll_factid)
	gb_datawindow = true
	openwithparm(w_print_options,dw_formnormgen)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_formnormgen from u_dw within w_formnormgen
boolean visible = false
integer y = 488
integer width = 1659
integer height = 1396
integer taborder = 10
string title = "Formulaire normalisé"
string dataobject = "d_formnormgen"
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

type cb_close from commandbutton within w_formnormgen
integer x = 2843
integer y = 1900
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

type dw_formulaire_normalise_choisir_factures from u_dw within w_formnormgen
integer x = 1691
integer width = 1938
integer height = 1892
integer taborder = 20
string title = "none"
string dataobject = "d_formulaire_normalise_choisir_factures"
borderstyle borderstyle = StyleBox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

dw_formulaire_normalise_choisir_factures.SetTransObject(SQLCA)
dw_formulaire_normalise_choisir_factures.SetRowFocusIndicator(Hand!)
//dw_formulaire_normalise_choisir_factures.retrieve(message.doubleparm)
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

