$PBExportHeader$w_listtraitementnonsigne.srw
forward
global type w_listtraitementnonsigne from w_child
end type
type ddlb_dentist from u_ddlb within w_listtraitementnonsigne
end type
type uo_toolbar from u_cst_toolbarstrip within w_listtraitementnonsigne
end type
type cb_courriel from commandbutton within w_listtraitementnonsigne
end type
type ddlb_envoye from u_ddlb within w_listtraitementnonsigne
end type
type ddlb_signe from u_ddlb within w_listtraitementnonsigne
end type
type st_2 from statictext within w_listtraitementnonsigne
end type
type st_1 from statictext within w_listtraitementnonsigne
end type
type em_fin from editmask within w_listtraitementnonsigne
end type
type em_debut from editmask within w_listtraitementnonsigne
end type
type rr_1 from roundrectangle within w_listtraitementnonsigne
end type
type cb_close from commandbutton within w_listtraitementnonsigne
end type
type cb_search from commandbutton within w_listtraitementnonsigne
end type
type cb_print from commandbutton within w_listtraitementnonsigne
end type
type st_title from statictext within w_listtraitementnonsigne
end type
type dw_listtraitementnonsigne from u_dw within w_listtraitementnonsigne
end type
type gb_date from groupbox within w_listtraitementnonsigne
end type
type gb_signe from groupbox within w_listtraitementnonsigne
end type
type gb_1 from groupbox within w_listtraitementnonsigne
end type
type gb_2 from groupbox within w_listtraitementnonsigne
end type
type rr_2 from roundrectangle within w_listtraitementnonsigne
end type
end forward

global type w_listtraitementnonsigne from w_child
integer x = 214
integer y = 221
integer width = 4640
integer height = 2648
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
ddlb_dentist ddlb_dentist
uo_toolbar uo_toolbar
cb_courriel cb_courriel
ddlb_envoye ddlb_envoye
ddlb_signe ddlb_signe
st_2 st_2
st_1 st_1
em_fin em_fin
em_debut em_debut
rr_1 rr_1
cb_close cb_close
cb_search cb_search
cb_print cb_print
st_title st_title
dw_listtraitementnonsigne dw_listtraitementnonsigne
gb_date gb_date
gb_signe gb_signe
gb_1 gb_1
gb_2 gb_2
rr_2 rr_2
end type
global w_listtraitementnonsigne w_listtraitementnonsigne

type variables

end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_sign ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_settheme("classics")
uo_toolbar.of_displayborder(true)

if gnv_app.of_getlangue( ) = 'an' then
	st_title.text = "Unsigned required traitements list"
	dw_listtraitementnonsigne.object.patient_patient_nom_t.text = "Name of patient"
	dw_listtraitementnonsigne.object.patient_new_dossier_t.text = "File"
	dw_listtraitementnonsigne.object.t_consultations_datecreer_t.text = "Creation date"
	dw_listtraitementnonsigne.object.t_dentist.text = "Dentist"
	
	uo_toolbar.of_additem("Print", "Print!")
	uo_toolbar.of_additem("Send email", "Custom025!")
	uo_toolbar.of_additem("Search", "Search!")
	uo_toolbar.of_additem("Sign", "C:\ii4net\orthotek\images\edit.png")
	uo_toolbar.of_additem("Close", "Exit!")
else
	uo_toolbar.of_additem("Imprimer", "Print!")
	uo_toolbar.of_additem("Envoyer courriel", "Custom025!")
	uo_toolbar.of_additem("Rechercher", "Search!")
	uo_toolbar.of_additem("Signé", "C:\ii4net\orthotek\images\edit.png")
	uo_toolbar.of_additem("Fermer", "Exit!")
end if

uo_toolbar.of_displaytext(true)
end subroutine

public subroutine of_sign ();string ls_sign
string ls_valeur_ini
blob lblob_sign
integer li_num, li_bytes,i
long ll_x, ll_y, ll_consid
n_signature luo_sign

ls_valeur_ini = WordCap(profileString(gnv_app.of_getAppIniFile(), "Config", "Padsign", "No"))
if ls_valeur_ini = 'Yes' then
	ll_x = UnitsToPixels(10, XUnitsToPixels!)
	ll_y = UnitsToPixels(10, YUnitsToPixels!)
	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("DimensionX",ll_x)
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("DimensionY",ll_y)
			
	open(w_signature)
			
	ls_sign = string(gnv_app.inv_entrepotglobal.of_retournedonnee("Signaturedentiste"))
	if isnull(ls_sign) then ls_sign = ""
else
	select isnull(signfile,'') into :ls_sign from t_options where ortho_id = :v_no_ortho;
end if

if ls_sign <> "" then
	for i = 1 to dw_listtraitementnonsigne.rowcount()
		if dw_listtraitementnonsigne.getItemNumber(i,'sign') = 1 then
			ll_consid = dw_listtraitementnonsigne.getItemNumber(i,'t_consultations_id')
			luo_sign.of_setsignature(ls_sign,1, ll_consid)	
		end if
	next
end if

cb_search.event clicked()

end subroutine

on w_listtraitementnonsigne.create
int iCurrent
call super::create
this.ddlb_dentist=create ddlb_dentist
this.uo_toolbar=create uo_toolbar
this.cb_courriel=create cb_courriel
this.ddlb_envoye=create ddlb_envoye
this.ddlb_signe=create ddlb_signe
this.st_2=create st_2
this.st_1=create st_1
this.em_fin=create em_fin
this.em_debut=create em_debut
this.rr_1=create rr_1
this.cb_close=create cb_close
this.cb_search=create cb_search
this.cb_print=create cb_print
this.st_title=create st_title
this.dw_listtraitementnonsigne=create dw_listtraitementnonsigne
this.gb_date=create gb_date
this.gb_signe=create gb_signe
this.gb_1=create gb_1
this.gb_2=create gb_2
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_dentist
this.Control[iCurrent+2]=this.uo_toolbar
this.Control[iCurrent+3]=this.cb_courriel
this.Control[iCurrent+4]=this.ddlb_envoye
this.Control[iCurrent+5]=this.ddlb_signe
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_fin
this.Control[iCurrent+9]=this.em_debut
this.Control[iCurrent+10]=this.rr_1
this.Control[iCurrent+11]=this.cb_close
this.Control[iCurrent+12]=this.cb_search
this.Control[iCurrent+13]=this.cb_print
this.Control[iCurrent+14]=this.st_title
this.Control[iCurrent+15]=this.dw_listtraitementnonsigne
this.Control[iCurrent+16]=this.gb_date
this.Control[iCurrent+17]=this.gb_signe
this.Control[iCurrent+18]=this.gb_1
this.Control[iCurrent+19]=this.gb_2
this.Control[iCurrent+20]=this.rr_2
end on

on w_listtraitementnonsigne.destroy
call super::destroy
destroy(this.ddlb_dentist)
destroy(this.uo_toolbar)
destroy(this.cb_courriel)
destroy(this.ddlb_envoye)
destroy(this.ddlb_signe)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.rr_1)
destroy(this.cb_close)
destroy(this.cb_search)
destroy(this.cb_print)
destroy(this.st_title)
destroy(this.dw_listtraitementnonsigne)
destroy(this.gb_date)
destroy(this.gb_signe)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.rr_2)
end on

type ddlb_dentist from u_ddlb within w_listtraitementnonsigne
integer x = 101
integer y = 596
integer width = 695
integer height = 516
integer taborder = 40
end type

event constructor;call super::constructor;long ll_detid
string ls_detnom

this.of_additem('Tous',-1)

DECLARE listdentists CURSOR FOR 
	
	select isnull(det_suf,'') || ' ' || isnull(det_prenom,'') || ' ' || isnull(det_nom,'') as det_name, id_dentist
   from t_dentists
	where actif = 1
	order by det_name asc;
 
OPEN listdentists;
 
FETCH listdentists INTO :ls_detnom,:ll_detid;
 
DO WHILE SQLCA.SQLCode = 0
	
	of_additem(ls_detnom,ll_detid)
	
	FETCH listdentists INTO :ls_detnom,:ll_detid;

LOOP
 
CLOSE listdentists;

this.of_selectitem(1)
end event

type uo_toolbar from u_cst_toolbarstrip within w_listtraitementnonsigne
event destroy ( )
integer x = 5
integer y = 2544
integer width = 4635
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;boolean lb_sms = false
long i, ll_s

CHOOSE CASE as_button
	CASE "Print","Imprimer"
		cb_print.event clicked()
	CASE "Search","Rechercher"
		cb_search.event clicked()
	CASE "Send email","Envoyer courriel"
		cb_courriel.event clicked()
	CASE "Sign","Signé"
		of_sign()
	CASE "Close","Fermer"
		close(parent)
END CHOOSE



end event

type cb_courriel from commandbutton within w_listtraitementnonsigne
boolean visible = false
integer x = 283
integer y = 2492
integer width = 923
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Courriel"
end type

event clicked;long i, ll_id[], j = 1, ll_envoye,ll_iddentist
string ls_courriel

for i = 1 to dw_listtraitementnonsigne.rowcount()
	ll_envoye = dw_listtraitementnonsigne.getItemNumber(i,'envoyee')
	if ll_envoye = 0 then
		ll_iddentist = dw_listtraitementnonsigne.getItemNumber(i,'t_consultations_id_dentist')
		select isnull(det_email,'') into :ls_courriel from t_dentists where id_dentist = :ll_iddentist;
		if len(ls_courriel) > 0 then
			ll_id[j] = dw_listtraitementnonsigne.getItemNumber(i,'t_consultations_id')
			j++
		end if
	end if
next

gnv_app.inv_entrepotglobal.of_ajoutedonnee("Liste_patient_courriel",ll_id)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("type_courriel",1)

open(w_confrappelmail)
end event

type ddlb_envoye from u_ddlb within w_listtraitementnonsigne
integer x = 101
integer y = 1036
integer width = 695
integer height = 420
integer taborder = 30
end type

event constructor;call super::constructor;this.of_additem('Tous',-1)
this.of_additem('Envoyé',1)
this.of_additem('Non envoyé',0)

this.of_selectitem(1)
end event

type ddlb_signe from u_ddlb within w_listtraitementnonsigne
integer x = 101
integer y = 812
integer width = 695
integer height = 516
integer taborder = 20
end type

event constructor;call super::constructor;this.of_additem('Tous',-1)
this.of_additem('Signé',1)
this.of_additem('Non signé',0)

this.of_selectitem(1)
end event

type st_2 from statictext within w_listtraitementnonsigne
integer x = 91
integer y = 364
integer width = 178
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "À :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_listtraitementnonsigne
integer x = 91
integer y = 244
integer width = 178
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "De :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fin from editmask within w_listtraitementnonsigne
integer x = 288
integer y = 352
integer width = 512
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

event constructor;this.text = string(today())
end event

type em_debut from editmask within w_listtraitementnonsigne
integer x = 288
integer y = 224
integer width = 517
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

event constructor;this.text = string(today())
end event

type rr_1 from roundrectangle within w_listtraitementnonsigne
integer linethickness = 4
long fillcolor = 16777215
integer x = 32
integer y = 124
integer width = 850
integer height = 2340
integer cornerheight = 40
integer cornerwidth = 46
end type

type cb_close from commandbutton within w_listtraitementnonsigne
boolean visible = false
integer x = 3195
integer y = 2492
integer width = 923
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

type cb_search from commandbutton within w_listtraitementnonsigne
boolean visible = false
integer x = 2235
integer y = 2492
integer width = 923
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date debut, fin
long ll_signe
long ll_envoye
long ll_iddentist

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_listtraitementnonsigne.object.date_debut.text = em_debut.text
dw_listtraitementnonsigne.object.date_fin.text = em_fin.text

ll_signe = ddlb_signe.of_getselecteddata()
if ll_signe = -1 then setnull(ll_signe)
ll_envoye = ddlb_envoye.of_getselecteddata()
if ll_envoye = -1 then setnull(ll_envoye)
ll_iddentist = ddlb_dentist.of_getselecteddata()
if ll_iddentist = -1 then setnull(ll_iddentist)

dw_listtraitementnonsigne.retrieve(v_no_ortho,debut,fin,ll_signe,ll_envoye,ll_iddentist)

end event

event constructor;if v_langue = 'an' then
	this.text = "Search"
end if
end event

type cb_print from commandbutton within w_listtraitementnonsigne
boolean visible = false
integer x = 1221
integer y = 2492
integer width = 923
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("idforeignkey","T"+string(dw_listtraitementnonsigne.getItemNumber(dw_listtraitementnonsigne.getrow(),"t_consultations_id")))

gb_datawindow = true
openwithparm(w_print_options,dw_listtraitementnonsigne)
end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type st_title from statictext within w_listtraitementnonsigne
integer x = 18
integer y = 28
integer width = 2121
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Liste des traitements requis"
boolean focusrectangle = false
end type

type dw_listtraitementnonsigne from u_dw within w_listtraitementnonsigne
integer x = 933
integer y = 144
integer width = 3634
integer height = 2272
integer taborder = 10
string dataobject = "d_listtraitementnonsigne"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;if row > 0 then
	dw_listtraitementnonsigne.selectRow(0,false)
	dw_listtraitementnonsigne.selectRow(row,true)
end if

CHOOSE CASE dwo.name 
	CASE 'patient_patient_nom_t'
		setRedraw(false)
		setsort("compute_1 A")
		sort()
		setRedraw(true)
	CASE 'patient_new_dossier_t'
		setRedraw(false)
		setsort("patient_new_dossier A")
		sort()
		setRedraw(true)
	CASE 't_consultations_datecreer_t'
		setRedraw(false)
		setsort("t_consultations_datecreer A")
		sort()
		setRedraw(true)
	CASE 't_dentist'
		setRedraw(false)
		setsort("compute_2 A")
		sort()
		setRedraw(true)
	CASE 't_signe'
		setRedraw(false)
		setsort("p_1 A")
		sort()
		setRedraw(true)
	CASE 't_envoye'
		setRedraw(false)
		setsort("p_2 A")
		sort()
		setRedraw(true)
END CHOOSE
end event

event doubleclicked;call super::doubleclicked;long ll_patid

if row > 0 then
	
	ll_patid = getItemNumber(row,'t_consultations_patient_id')
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("dosspat selectedtab",13)
	
	if isvalid(w_dossier_patients) then
		if error_type(255) = 1 then
			Opensheetwithparm(w_dossier_patients,ll_patid,w_principal,2,layered!)
		else
			w_dossier_patients.cb_close.event clicked()
			Opensheetwithparm(w_dossier_patients,ll_patid,w_principal,2,layered!)
		end if
	else
		Opensheetwithparm(w_dossier_patients,ll_patid,w_principal,2,layered!)
	end if
	
	
END IF
end event

type gb_date from groupbox within w_listtraitementnonsigne
integer x = 82
integer y = 144
integer width = 754
integer height = 360
integer taborder = 20
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

type gb_signe from groupbox within w_listtraitementnonsigne
integer x = 73
integer y = 736
integer width = 754
integer height = 204
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Signé"
end type

type gb_1 from groupbox within w_listtraitementnonsigne
integer x = 73
integer y = 960
integer width = 754
integer height = 204
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Envoyé"
end type

type gb_2 from groupbox within w_listtraitementnonsigne
integer x = 73
integer y = 520
integer width = 754
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Spécialistes"
end type

type rr_2 from roundrectangle within w_listtraitementnonsigne
integer linethickness = 4
long fillcolor = 16777215
integer x = 901
integer y = 124
integer width = 3712
integer height = 2340
integer cornerheight = 40
integer cornerwidth = 46
end type

