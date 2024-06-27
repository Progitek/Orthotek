$PBExportHeader$w_liste_no_dossier.srw
forward
global type w_liste_no_dossier from w_child
end type
type shl_deselectionner from statichyperlink within w_liste_no_dossier
end type
type shl_selectionner from statichyperlink within w_liste_no_dossier
end type
type cb_publipostage from commandbutton within w_liste_no_dossier
end type
type cb_1 from commandbutton within w_liste_no_dossier
end type
type cb_search from commandbutton within w_liste_no_dossier
end type
type cb_printlabel from commandbutton within w_liste_no_dossier
end type
type cb_sort_byboxnumber from commandbutton within w_liste_no_dossier
end type
type st_2 from statictext within w_liste_no_dossier
end type
type st_1 from statictext within w_liste_no_dossier
end type
type em_end from editmask within w_liste_no_dossier
end type
type em_start from editmask within w_liste_no_dossier
end type
type cb_sort_bynumber from commandbutton within w_liste_no_dossier
end type
type cb_sort from commandbutton within w_liste_no_dossier
end type
type cb_close from commandbutton within w_liste_no_dossier
end type
type cb_print from commandbutton within w_liste_no_dossier
end type
type dw_anniversaires from u_dw within w_liste_no_dossier
end type
end forward

global type w_liste_no_dossier from w_child
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
event ue_post_open ( )
shl_deselectionner shl_deselectionner
shl_selectionner shl_selectionner
cb_publipostage cb_publipostage
cb_1 cb_1
cb_search cb_search
cb_printlabel cb_printlabel
cb_sort_byboxnumber cb_sort_byboxnumber
st_2 st_2
st_1 st_1
em_end em_end
em_start em_start
cb_sort_bynumber cb_sort_bynumber
cb_sort cb_sort
cb_close cb_close
cb_print cb_print
dw_anniversaires dw_anniversaires
end type
global w_liste_no_dossier w_liste_no_dossier

type variables

end variables

event ue_post_open();dw_anniversaires.retrieve(v_no_ortho,0,99999999)
end event

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

w_liste_no_dossier.postevent('ue_post_open')



end event

on w_liste_no_dossier.create
int iCurrent
call super::create
this.shl_deselectionner=create shl_deselectionner
this.shl_selectionner=create shl_selectionner
this.cb_publipostage=create cb_publipostage
this.cb_1=create cb_1
this.cb_search=create cb_search
this.cb_printlabel=create cb_printlabel
this.cb_sort_byboxnumber=create cb_sort_byboxnumber
this.st_2=create st_2
this.st_1=create st_1
this.em_end=create em_end
this.em_start=create em_start
this.cb_sort_bynumber=create cb_sort_bynumber
this.cb_sort=create cb_sort
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_anniversaires=create dw_anniversaires
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.shl_deselectionner
this.Control[iCurrent+2]=this.shl_selectionner
this.Control[iCurrent+3]=this.cb_publipostage
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_search
this.Control[iCurrent+6]=this.cb_printlabel
this.Control[iCurrent+7]=this.cb_sort_byboxnumber
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.em_end
this.Control[iCurrent+11]=this.em_start
this.Control[iCurrent+12]=this.cb_sort_bynumber
this.Control[iCurrent+13]=this.cb_sort
this.Control[iCurrent+14]=this.cb_close
this.Control[iCurrent+15]=this.cb_print
this.Control[iCurrent+16]=this.dw_anniversaires
end on

on w_liste_no_dossier.destroy
call super::destroy
destroy(this.shl_deselectionner)
destroy(this.shl_selectionner)
destroy(this.cb_publipostage)
destroy(this.cb_1)
destroy(this.cb_search)
destroy(this.cb_printlabel)
destroy(this.cb_sort_byboxnumber)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_end)
destroy(this.em_start)
destroy(this.cb_sort_bynumber)
destroy(this.cb_sort)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_anniversaires)
end on

type shl_deselectionner from statichyperlink within w_liste_no_dossier
integer x = 608
integer y = 1832
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Désélectionner tous"
boolean focusrectangle = false
end type

event clicked;long	ll_cpt

FOR ll_cpt = 1 TO dw_anniversaires.rowcount()
	if dw_anniversaires.IsSelected(ll_cpt) then
		dw_anniversaires.SelectRow(ll_cpt,false)
	end if
end FOR
end event

event constructor;if v_langue = 'an' then
	shl_selectionner.Text = "Unselect all"
end if
end event

type shl_selectionner from statichyperlink within w_liste_no_dossier
integer x = 41
integer y = 1832
integer width = 475
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Sélectionner tous"
boolean focusrectangle = false
end type

event clicked;long	ll_cpt

FOR ll_cpt = 1 TO dw_anniversaires.rowcount()
	if dw_anniversaires.IsSelected(ll_cpt) = false then
		dw_anniversaires.SelectRow(ll_cpt,true)
	end if
end FOR
end event

event constructor;if v_langue = 'an' then
	shl_selectionner.Text = "Select all"
end if
end event

type cb_publipostage from commandbutton within w_liste_no_dossier
integer x = 2327
integer y = 1820
integer width = 809
integer height = 108
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Publipostage"
end type

event clicked;long i, ll_patid[], ll_contactid[],ll_phase[]
boolean lb_2k3 = false, lb_premier = true
string ls_versword, ls_corrpath
integer li_result, li_FileNum
s_corrletter s_corr

ls_corrpath = "c:\ii4net\orthotek"

s_corr.patid = -1
s_corr.letter = ''
s_corr.flag = 'w'
s_corr.mode = 'l'

li_result = RegistryGet("HKEY_CLASSES_ROOT\Word.Application\CurVer", "", RegString!, ls_versword)
if li_result = 1 then
	if not isNull(ls_versword) then
		if ls_versword = "Word.Application.11" then lb_2k3 = true
	end if
end if

setpointer(hourglass!)

for i = 1 to dw_anniversaires.rowcount()
	IF dw_anniversaires.isselected(i) = TRUE THEN
		ll_patid[i] = dw_anniversaires.getItemNumber(i,'patient_patient_id')
		select id_contact into :ll_contactid[i] from patient where patient_id = :ll_patid[i];
		ll_phase[i] = 1
		gf_pat2excel(ll_patid,ll_contactid,ll_phase)
		lb_premier = false
	END IF
next

li_FileNum = fileOpen("C:\ii4net\orthotek\filedel.bat", LineMode!, Write!, lockReadWrite!, replace!)
fileWrite(li_FileNum, 'del /F ' + ls_corrpath + '\.*.doc~r~nexit')
fileClose(li_FileNum)
run("C:\ii4net\orthotek\filedel.bat",minimized!)

openwithparm(w_dosspatcorrletters,s_corr,w_principal)

end event

event constructor;if gs_langue = 'an' then
	this.text =  "Mailmerge"
end if
end event

type cb_1 from commandbutton within w_liste_no_dossier
integer x = 1655
integer y = 1932
integer width = 315
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Add Zero"
end type

event clicked;string ls_new_dossier, ls_dosmodif
long ll_patid

 // Déclaration du curseur
 
 Declare nodos Cursor For
 
 SELECT 	patient.new_dossier,
         patient.patient_id
 FROM    patient;
           			
OPEN nodos;

Do While SQLCA.SQLCode = 0
   Fetch nodos Into :ls_new_dossier,
	                 :ll_patid;
	
	if SQLCA.SQLCode = 0 then
		if isnumber(ls_new_dossier) then
			ls_dosmodif = remplir_zerosign(5,long(ls_new_dossier))
			update patient set new_dossier = :ls_dosmodif where patient_id = :ll_patid; 
		end if
	end if
Loop

CLOSE nodos;
dw_anniversaires.retrieve(v_no_ortho,0,99999999)
end event

type cb_search from commandbutton within w_liste_no_dossier
integer x = 1975
integer y = 1932
integer width = 357
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;string ls_new_dossier, ls_dosmodif
long ll_patid

 // Déclaration du curseur
 
 Declare nodos Cursor For
 
 SELECT 	patient.new_dossier,
         patient.patient_id
 FROM    patient;
           			
OPEN nodos;

Do While SQLCA.SQLCode = 0
   Fetch nodos Into :ls_new_dossier,
	                 :ll_patid;
	
	if SQLCA.SQLCode = 0 then
		if isnumber(ls_new_dossier) then
			ls_dosmodif = remplir_zerosign(5,long(ls_new_dossier))
			update patient set new_dossier = :ls_dosmodif where patient_id = :ll_patid; 
		end if
	end if
Loop

CLOSE nodos;
dw_anniversaires.retrieve(v_no_ortho,0,99999999)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type cb_printlabel from commandbutton within w_liste_no_dossier
integer x = 160
integer y = 1932
integer width = 293
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp. Étiq."
end type

event clicked;long vcount,i,vpatientid
printsetup()
datastore ds_etiquette_patient
ds_etiquette_patient = create datastore
ds_etiquette_patient.dataobject = "d_etiquette_patient"
ds_etiquette_patient.SetTransObject(SQLCA)
vcount = dw_anniversaires.rowcount()
for i = 1 to vcount
	if dw_anniversaires.IsSelected(i) then
		vpatientid = dw_anniversaires.getitemnumber(i,'patient_patient_id')
		ds_etiquette_patient.retrieve(vpatientid)
		ds_etiquette_patient.print()
	end if
next
destroy ds_etiquette_patient
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print label"
end if
end event

type cb_sort_byboxnumber from commandbutton within w_liste_no_dossier
integer x = 1243
integer y = 1932
integer width = 407
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Tri par # boîte"
end type

event constructor;if v_langue = 'an' then
	cb_sort_byboxnumber.Text = "Sort by box #"
end if
end event

event clicked;dw_anniversaires.SetRedraw(false)
dw_anniversaires.SetSort('patient_no_boite A')
dw_anniversaires.Sort()
dw_anniversaires.SetRedraw(true)
end event

type st_2 from statictext within w_liste_no_dossier
integer x = 2848
integer y = 1952
integer width = 73
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
string text = "à"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "to"
end if
end event

type st_1 from statictext within w_liste_no_dossier
integer x = 2322
integer y = 1952
integer width = 169
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
string text = "De:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "From"
end if
end event

type em_end from editmask within w_liste_no_dossier
integer x = 2926
integer y = 1932
integer width = 366
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
boolean autoskip = true
end type

event constructor;em_end.text = string(999999999)
end event

event modified;dw_anniversaires.setredraw(false)
dw_anniversaires.setfilter("nodos >= '" + em_start.text + "' and nodos <= '" + em_end.text + "'") 
dw_anniversaires.filter()
dw_anniversaires.setredraw(true)
end event

type em_start from editmask within w_liste_no_dossier
integer x = 2491
integer y = 1932
integer width = 357
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
boolean autoskip = true
end type

event constructor;em_start.text = string(000000000)
end event

event modified;dw_anniversaires.setredraw(false)
dw_anniversaires.setfilter("nodos >= '" + em_start.text + "' and nodos <= '" + em_end.text + "'") 
dw_anniversaires.filter()
dw_anniversaires.setredraw(true)
end event

type cb_sort_bynumber from commandbutton within w_liste_no_dossier
integer x = 809
integer y = 1932
integer width = 434
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Tri par # doss."
end type

event clicked;long c,d
//c = long(em_start.text)
//d = long(em_end.text)

dw_anniversaires.retrieve(v_no_ortho,em_start.text,em_end.text)
dw_anniversaires.SetRedraw(false)
//dw_anniversaires.SetSort('patient_new_dossier A')
dw_anniversaires.setSort('nodos A')
dw_anniversaires.Sort()
dw_anniversaires.SetRedraw(true)
end event

event constructor;if v_langue = 'an' then
	cb_sort_bynumber.Text = "Sort by file #"
end if
end event

type cb_sort from commandbutton within w_liste_no_dossier
integer x = 457
integer y = 1932
integer width = 347
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Tri par date"
end type

event clicked;dw_anniversaires.SetRedraw(false)
dw_anniversaires.SetSort('patient_date_naissance A')
dw_anniversaires.Sort()
dw_anniversaires.SetRedraw(true)
end event

event constructor;if v_langue = 'an' then
	cb_sort.Text = "Sort by date"
end if
end event

type cb_close from commandbutton within w_liste_no_dossier
integer x = 3301
integer y = 1932
integer width = 329
integer height = 108
integer taborder = 30
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
	cb_close.Text = "Close"
end if
end event

type cb_print from commandbutton within w_liste_no_dossier
integer y = 1932
integer width = 160
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp."
end type

event clicked;dw_anniversaires.Modify("DataWindow.Print.Margin.Top=200")
dw_anniversaires.Modify("DataWindow.Print.Margin.left=200")
gb_datawindow = true
openwithparm(w_print_options,dw_anniversaires)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type dw_anniversaires from u_dw within w_liste_no_dossier
integer x = 55
integer width = 3451
integer height = 1808
integer taborder = 10
string dataobject = "d_liste_no_dossier"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_anniversaires.SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_title.text = 'File number list for:'
	this.object.t_datenais.text = 'Birthdate'
	this.object.t_nodoss.text = 'File'
	this.object.t_noboite.text = 'Box number'
	this.object.t_patnom.text = "Patient's name"
	this.object.t_assexp.text = "Expiration date"
	this.object.b_datenais.text = 'Birth date'
	this.object.b_nodoss.text = 'File'
	this.object.b_noboite.text = 'Box number'
	this.object.b_patnom.text = "Patient's name"
	this.object.b_assexp.text = "Expiration date"
	this.object.t_printedon.text = "Printed on"
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

event clicked;Choose case dwo.name		
	case 'b_datenais'
		SetSort('patient_date_naissance A')
		Sort()
	case 'b_nodoss'
		SetSort('nodos A')
		Sort()
	case 'b_noboite'
		SetSort('noboite A')
		Sort()
	case 'b_patnom'
		SetSort('compute_2 A')
		Sort()		
	case 'b_assexp'
		SetSort('patient_nas A')
		Sort()		
end choose
if row > 0 then
	if IsSelected(row) then
		SelectRow(row,false)
	else
		SelectRow(row,true)
	end if
end if
end event

