$PBExportHeader$w_liste_des_rappels_retentions.srw
forward
global type w_liste_des_rappels_retentions from w_child
end type
type cb_emailsms from commandbutton within w_liste_des_rappels_retentions
end type
type cb_publipostage from commandbutton within w_liste_des_rappels_retentions
end type
type cb_print from commandbutton within w_liste_des_rappels_retentions
end type
type pb_printpreview from picturebutton within w_liste_des_rappels_retentions
end type
type pb_all from picturebutton within w_liste_des_rappels_retentions
end type
type pb_noappointment from picturebutton within w_liste_des_rappels_retentions
end type
type pb_print from picturebutton within w_liste_des_rappels_retentions
end type
type pb_find from picturebutton within w_liste_des_rappels_retentions
end type
type pb_nbmois from picturebutton within w_liste_des_rappels_retentions
end type
type pb_dosspat from picturebutton within w_liste_des_rappels_retentions
end type
type pb_sort from picturebutton within w_liste_des_rappels_retentions
end type
type st_4 from statictext within w_liste_des_rappels_retentions
end type
type sle_find from singlelineedit within w_liste_des_rappels_retentions
end type
type cb_delete from commandbutton within w_liste_des_rappels_retentions
end type
type cb_update from commandbutton within w_liste_des_rappels_retentions
end type
type cb_passer_horaire from commandbutton within w_liste_des_rappels_retentions
end type
type dw_rappel_retention from u_dw within w_liste_des_rappels_retentions
end type
type cb_fermer from commandbutton within w_liste_des_rappels_retentions
end type
type cb_insert from commandbutton within w_liste_des_rappels_retentions
end type
end forward

global type w_liste_des_rappels_retentions from w_child
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
cb_emailsms cb_emailsms
cb_publipostage cb_publipostage
cb_print cb_print
pb_printpreview pb_printpreview
pb_all pb_all
pb_noappointment pb_noappointment
pb_print pb_print
pb_find pb_find
pb_nbmois pb_nbmois
pb_dosspat pb_dosspat
pb_sort pb_sort
st_4 st_4
sle_find sle_find
cb_delete cb_delete
cb_update cb_update
cb_passer_horaire cb_passer_horaire
dw_rappel_retention dw_rappel_retention
cb_fermer cb_fermer
cb_insert cb_insert
end type
global w_liste_des_rappels_retentions w_liste_des_rappels_retentions

type variables
public integer changement = 0
private integer ii_modeajout = 0
private long il_patid
public date idt_due
datawindowchild dddw_traitraphor,dddw_typerap
public long il_idraptrait
public date idt_debut = date('01-01-1900'),idt_fin = date('31-12-2999')
public string is_raptype
end variables

forward prototypes
public subroutine sauvegarde ()
public function integer correction_jour (integer jour, integer mois, integer annee)
end prototypes

event ue_post_open();dw_rappel_retention.event ue_retrieve()
end event

public subroutine sauvegarde ();if dw_rappel_retention.update() = 1 then
	commit using SQLCA;
	changement = 0
	ii_modeajout = 0
	// Ajuste la disponibilite des boutons
	if dw_rappel_retention.rowcount() = 0 then
		cb_update.enabled = false
		cb_delete.enabled = false
		cb_passer_horaire.enabled = false
	end if
else
	rollback using SQLCA;
	error_type(50)
end if


end subroutine

public function integer correction_jour (integer jour, integer mois, integer annee);integer v_jour
choose case mois
	case 2
		if jour > 28 then
			if mod(annee,4) = 0 then
				v_jour=29
			else
				v_jour=28
			end if		
		else
			v_jour = jour
		end if
	case 4
		if jour > 30 then
			v_jour=30
		else
			v_jour = jour
		end if
	case 6
		if jour > 30 then
			v_jour=30
		else
			v_jour = jour
		end if
	case 9
		if jour > 30 then
			v_jour=30
		else
			v_jour = jour
		end if
	case 11
		if jour > 30 then
			v_jour=30
		else
			v_jour = jour
		end if
	case else
			v_jour = jour
end choose
return(v_jour)
end function

on w_liste_des_rappels_retentions.create
int iCurrent
call super::create
this.cb_emailsms=create cb_emailsms
this.cb_publipostage=create cb_publipostage
this.cb_print=create cb_print
this.pb_printpreview=create pb_printpreview
this.pb_all=create pb_all
this.pb_noappointment=create pb_noappointment
this.pb_print=create pb_print
this.pb_find=create pb_find
this.pb_nbmois=create pb_nbmois
this.pb_dosspat=create pb_dosspat
this.pb_sort=create pb_sort
this.st_4=create st_4
this.sle_find=create sle_find
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.cb_passer_horaire=create cb_passer_horaire
this.dw_rappel_retention=create dw_rappel_retention
this.cb_fermer=create cb_fermer
this.cb_insert=create cb_insert
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_emailsms
this.Control[iCurrent+2]=this.cb_publipostage
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.pb_printpreview
this.Control[iCurrent+5]=this.pb_all
this.Control[iCurrent+6]=this.pb_noappointment
this.Control[iCurrent+7]=this.pb_print
this.Control[iCurrent+8]=this.pb_find
this.Control[iCurrent+9]=this.pb_nbmois
this.Control[iCurrent+10]=this.pb_dosspat
this.Control[iCurrent+11]=this.pb_sort
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.sle_find
this.Control[iCurrent+14]=this.cb_delete
this.Control[iCurrent+15]=this.cb_update
this.Control[iCurrent+16]=this.cb_passer_horaire
this.Control[iCurrent+17]=this.dw_rappel_retention
this.Control[iCurrent+18]=this.cb_fermer
this.Control[iCurrent+19]=this.cb_insert
end on

on w_liste_des_rappels_retentions.destroy
call super::destroy
destroy(this.cb_emailsms)
destroy(this.cb_publipostage)
destroy(this.cb_print)
destroy(this.pb_printpreview)
destroy(this.pb_all)
destroy(this.pb_noappointment)
destroy(this.pb_print)
destroy(this.pb_find)
destroy(this.pb_nbmois)
destroy(this.pb_dosspat)
destroy(this.pb_sort)
destroy(this.st_4)
destroy(this.sle_find)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.cb_passer_horaire)
destroy(this.dw_rappel_retention)
destroy(this.cb_fermer)
destroy(this.cb_insert)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

postevent('ue_post_open')
end event

event timer;//time v_sync
//date v_daterefresh
//window activesheet
//
//select heure,refreshdate into :v_sync, :v_daterefresh from t_sync;
//if v_sync <> v_refresh and istr_cal.caldate = v_daterefresh then
//	activesheet = w_principal.GetActiveSheet()
//	if activesheet = w_horaire then
//		if w_horaire.rb_am.checked=true then
//			//memoriser la position du pointeur
//			ll_cour = dw_am.getrow()
//			ic_cour = dw_am.GetColumn()
//			if change_am = 1 then
//				sauve_am()
//			end if
//			affichage_creation()
//			//positionner le pointeur
//			dw_am.setcolumn(ic_cour)
//			dw_am.scrolltorow(ll_cour)
//			dw_am.setfocus()
//		else
//			//memoriser la position du pointeur
//			ll_cour = dw_pm.getrow()
//			ic_cour = dw_pm.GetColumn()
//			if change_pm = 1 then
//				sauve_pm()
//			end if
//			affichage_creation()
//			//positionner le pointeur
//			dw_pm.setcolumn(ic_cour)
//			dw_pm.scrolltorow(ll_cour)
//			dw_pm.setfocus()
//		end if
//	end if
//end if
end event

type cb_emailsms from commandbutton within w_liste_des_rappels_retentions
integer x = 1609
integer y = 1936
integer width = 489
integer height = 108
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Envoi"
end type

event clicked;long i, ll_patid[], j = 1
string ls_courriel

for i = 1 to dw_rappel_retention.rowcount()
	ls_courriel = dw_rappel_retention.getItemString(i,'patient_email')
	if len(ls_courriel) > 0 then
		ll_patid[j] = dw_rappel_retention.getItemNumber(i,'patient_patient_id')
		j++
	end if
next

gnv_app.inv_entrepotglobal.of_ajoutedonnee("Liste_patient_courriel",ll_patid)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("type_courriel",1)

open(w_confrappelmail)
end event

event constructor;if gs_langue = 'an' then
	this.text =  "Email and SMS"
end if
end event

type cb_publipostage from commandbutton within w_liste_des_rappels_retentions
integer x = 1015
integer y = 1936
integer width = 599
integer height = 108
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Publipostage"
end type

event constructor;if gs_langue = 'an' then
	this.text =  "Mailmerge"
end if
end event

event clicked;long i, ll_patid[], ll_contactid[], ll_phase[]
boolean lb_2k3 = false, lb_premier = true
string ls_versword, ls_corrpath, ls_msg
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

for i = 1 to dw_rappel_retention.rowcount()
	ll_patid[i] = dw_rappel_retention.getItemNumber(i,'rendezvous_patient_id')
	select id_contact into :ll_contactid[i] from patient where patient_id = :ll_patid[i];
	ll_phase[i] = 1
	gf_pat2excel(ll_patid,ll_contactid,ll_phase)
	lb_premier = false
	
	// Logguer l'envoi de correspondance pour les rappels
		
	if v_langue = 'an' then
		insert into t_histonote(datehisto,histonote,id_personnel,patient_id)
		values(current timestamp, 'Recall correspondance with patient has been printed',:gl_idpers,:ll_patid[i]);
	else
		ls_msg = "L'impression de la correspondance pour les rappels avec le patient a été imprimé"
		insert into t_histonote(datehisto,histonote,id_personnel,patient_id)
		values(current timestamp, :ls_msg,:gl_idpers,:ll_patid[i]);
	end if
	if error_type(-1) = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	
next

li_FileNum = fileOpen("C:\ii4net\orthotek\filedel.bat", LineMode!, Write!, lockReadWrite!, replace!)
fileWrite(li_FileNum, 'del /F ' + ls_corrpath + '\.*.doc~r~nexit')
fileClose(li_FileNum)
run("C:\ii4net\orthotek\filedel.bat",minimized!)

openwithparm(w_dosspatcorrletters,s_corr,w_principal)

end event

type cb_print from commandbutton within w_liste_des_rappels_retentions
integer x = 530
integer y = 1936
integer width = 489
integer height = 108
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;int nb_row,i
long v_patient_id
w_progressbar iw_progressbar

if not isnull(idt_debut) and not isnull(idt_fin) and not isnull(is_raptype) then

	datastore ds_listerapimp
	ds_listerapimp = create datastore
	ds_listerapimp.dataobject = "d_listerapimp"
	if v_langue = 'an' then
		ds_listerapimp.object.t_title.text = 'RECALL LIST'
		ds_listerapimp.object.t_patientname.text = 'Patient name'
		ds_listerapimp.object.t_datenais.text = 'Date of birth'
		ds_listerapimp.object.t_nodoss.text = 'File number'
		ds_listerapimp.object.t_age.text = 'Age'
		ds_listerapimp.object.t_datevenu.text = 'Visit date'
		ds_listerapimp.object.t_datedu.text = 'Due date'
		ds_listerapimp.object.t_duree.text = 'Lenght'
		ds_listerapimp.object.t_trait.text = 'Treatment:'
		ds_listerapimp.object.t_telmais.text = 'Phone (home):'
		ds_listerapimp.object.t_telbur.text = 'Phone (office):'
		ds_listerapimp.object.t_telcell.text = 'Cell phone:'
		ds_listerapimp.object.t_telautre.text = 'Other:'
		ds_listerapimp.object.t_fathername.text = 'Father:'
		ds_listerapimp.object.t_mothername.text = 'Mother:'
		ds_listerapimp.object.t_printedon.text = 'Printed on'
	end if
	ds_listerapimp.SetTransObject(SQLCA)
	ds_listerapimp.Retrieve(v_no_ortho,w_liste_des_rappels_retentions.idt_debut,w_liste_des_rappels_retentions.idt_fin)
	
	if is_raptype <> 'Tous' and is_raptype <> 'All' and is_raptype <> '' then
		ds_listerapimp.SetFilter("rendezvous_prochain_rv >= date('" + string(idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(idt_fin) + "') and rendezvous_id_raptrait = " + string(w_liste_des_rappels_retentions.il_idraptrait))
	else
		ds_listerapimp.SetFilter("rendezvous_prochain_rv >= date('" + string(idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(idt_fin) + "')")
	end if
	ds_listerapimp.Filter()
	gb_datawindow = false
	openwithparm(w_print_options,ds_listerapimp)
	destroy ds_listerapimp
end if
end event

type pb_printpreview from picturebutton within w_liste_des_rappels_retentions
integer x = 2331
integer width = 101
integer height = 88
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Custom074!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Imprimer l~'aperçu"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_rappel_retention)
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'Print preview'
end if
end event

type pb_all from picturebutton within w_liste_des_rappels_retentions
integer x = 2734
integer width = 101
integer height = 88
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Close!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Afficher tous"
end type

event clicked;dw_rappel_retention.setfilter('')
w_liste_des_rappels_retentions.postevent('ue_post_open')
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'ALL'
end if
end event

type pb_noappointment from picturebutton within w_liste_des_rappels_retentions
integer x = 2633
integer width = 101
integer height = 88
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Custom057!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Patient sans rdv"
end type

event clicked;opensheet(w_patactifsansrdvrap,w_principal,2,layered!)
w_patactifsansrdvrap.title = 'Patient sans rdv'
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'No Appointment List'
end if
end event

type pb_print from picturebutton within w_liste_des_rappels_retentions
integer x = 2533
integer width = 101
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Print!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Imprimer"
end type

event clicked;if changement = 1 then
	error_type(109)
else
	Open(w_rappels_retention_imp)
end if
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'Print'
end if
end event

type pb_find from picturebutton within w_liste_des_rappels_retentions
integer x = 2025
integer width = 101
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Find!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Rechercher"
end type

event clicked;sle_find.event modified()
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'Find'
end if
end event

type pb_nbmois from picturebutton within w_liste_des_rappels_retentions
integer x = 2432
integer width = 101
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Browse!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Prochain rendez-vous"
end type

event clicked;long enr,jour,mois,annee, v_jour
date ldt_venue
dec{5} mois1
dw_rappel_retention.accepttext()
enr = dw_rappel_retention.getrow()
idt_due = dw_rappel_retention.getitemdate(dw_rappel_retention.getrow(),'rendezvous_date_vue')
open(w_liste_rappels_retentions_nb_mois)
if idt_due <> dw_rappel_retention.getitemdate(dw_rappel_retention.getrow(),'rendezvous_date_vue') then
	dw_rappel_retention.setitem(enr,"rendezvous_prochain_rv",idt_due)
	changement=1
end if
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'Next appointment'
end if
end event

type pb_dosspat from picturebutton within w_liste_des_rappels_retentions
integer x = 2126
integer width = 101
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Custom050!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Ouvrir le dossier patient"
end type

event clicked;il_patid = dw_rappel_retention.getitemnumber(dw_rappel_retention.getrow(),'patient_patient_id')
Opensheetwithparm(w_dossier_patients,il_patid,w_principal,2,layered! )
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'Open patient file'
end if
end event

type pb_sort from picturebutton within w_liste_des_rappels_retentions
integer x = 2231
integer width = 101
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Sort!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Trier les enregistrements"
end type

event clicked;open(w_selectiontype)
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = 'Sort'
end if
end event

type st_4 from statictext within w_liste_des_rappels_retentions
integer y = 8
integer width = 1029
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Nom du patient à rechercher:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = "an" then
	this.text = "Name of the patient to search"
end if
end event

type sle_find from singlelineedit within w_liste_des_rappels_retentions
integer x = 1051
integer width = 933
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_dnom
integer no_row, v_nb

//pour regler le bug des apostrophes
ls_dnom = Trim(sle_find.text)+'%'
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if
//**********************************
no_row = dw_rappel_retention.Find("upper(nom_complet) like '" +upper(ls_dnom)+"'",0,dw_rappel_retention.rowcount())
dw_rappel_retention.scrolltorow(no_row)
dw_rappel_retention.setfocus()	

end event

type cb_delete from commandbutton within w_liste_des_rappels_retentions
integer x = 2094
integer y = 1936
integer width = 562
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer patient"
end type

event clicked;if error_type(240) = 1 then
	dw_rappel_retention.deleterow(dw_rappel_retention.getrow())
	sauvegarde()
end if

end event

event constructor;if v_langue = 'an' then
	cb_delete.Text = "Delete"
end if
end event

type cb_update from commandbutton within w_liste_des_rappels_retentions
integer x = 2651
integer y = 1936
integer width = 489
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauvegarde()


end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type cb_passer_horaire from commandbutton within w_liste_des_rappels_retentions
boolean visible = false
integer x = 2944
integer width = 521
integer height = 108
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Passer à l~'horaire et MAJ"
end type

event clicked;long row,ll_idhortrans, ll_rv
string ls_sql,ls_col
integer i,li_count
s_pat lstr_pat

row = dw_rappel_retention.getrow()
lstr_pat.patid = dw_rappel_retention.getitemnumber(row,'rendezvous_patient_id')
// vérification si il y a possibilité de transfert
if lstr_pat.patid > 0 then
	// vérifier si le patient est déjà en transfert
	select count(*) into :li_count from t_hortrans where patid = :lstr_pat.patid;
	if li_count > 0 then
		error_type(190)
	else
		ll_rv = dw_rappel_retention.getitemnumber(row,"rendezvous_rv_id")
		// remplir la structure
		lstr_pat.patid = dw_rappel_retention.getitemnumber(row,"rendezvous_patient_id")
		lstr_pat.idspec = v_no_ortho
		lstr_pat.datecal = date('1900-01-01')
		lstr_pat.heure = time('00:00:00')
		lstr_pat.patnom = dw_rappel_retention.getitemstring(row,"patient_nom")+' '+dw_rappel_retention.getitemstring(row,"patient_prenom")
		lstr_pat.traitid = dw_rappel_retention.getitemnumber(row,'rendezvous_type_traitement_id')
		select color into :lstr_pat.backcolor from t_color inner join type_de_traitement on t_color.color_id = type_de_traitement.color_id where type_traitement_id = :lstr_pat.traitid;
		if dw_rappel_retention.getitemnumber(row,"rendezvous_duree") <= 0 then
			lstr_pat.duree = 1
		else
			lstr_pat.duree = dw_rappel_retention.getitemnumber(row,"rendezvous_duree")
		end if
		for i = 1 to lstr_pat.duree - 1
			lstr_pat.l[i]  = 'X'
		next
		select max(id_hortrans) into :ll_idhortrans from t_hortrans;
		if isnull(ll_idhortrans) then ll_idhortrans = 0
		ll_idhortrans++
		ls_sql = "insert into t_hortrans(id_hortrans,id_specialist,datecal,heure,patid,backcolor,idtrait,duree,col,memo,idpers,rv_id) values ("+string(ll_idhortrans)+","+string(lstr_pat.idspec)+",'"+string(lstr_pat.datecal,'yyyy-mm-dd')+"','"+string(lstr_pat.heure)+"',"+string(lstr_pat.patid)+","+string(lstr_pat.backcolor)+","+string(lstr_pat.traitid)+","+string(lstr_pat.duree)+",0,'"+lstr_pat.memo+"',"+string(gl_idpers)+","+string(ll_rv)+")"
//		messagebox('ls_sql',ls_sql)
		execute immediate :ls_sql using sqlca;
		if error_type(-1) = 1 then
			for i = 1 to upperbound(lstr_pat.l[])
				ls_sql = "insert into t_hortransrow(id_hortrans,patnom,ligne) values ("+string(ll_idhortrans)+",'"+lstr_pat.l[i]+"',"+string(i)+")"
//				messagebox('ls_sql',ls_sql)
				execute immediate :ls_sql using sqlca;
				error_type(-1)
			next
			error_type(188)
			if isvalid(w_horaire) = false then
				opensheetwithparm(w_horaire,string(today()),w_principal,2,layered!)
				w_horaire.title = "Horaire"
			end if
			//supprimer l'enregistrement
//			dw_rappel_retention.deleterow(row)
//			sauvegarde()
		end if
	end if
end if

end event

event constructor;if v_langue = 'an' then
	cb_passer_horaire.Text = "Go to Schedule and Save"
end if
end event

type dw_rappel_retention from u_dw within w_liste_des_rappels_retentions
event ue_retrieve ( )
integer y = 92
integer width = 3625
integer height = 1840
integer taborder = 130
string dataobject = "d_liste_retention"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();dw_rappel_retention.Retrieve(v_no_ortho,idt_debut,idt_fin)

// Ajuste la disponibilité des boutons
if dw_rappel_retention.rowcount() = 0 then
	cb_update.enabled = false
	cb_delete.enabled = false
	cb_passer_horaire.enabled = false
end if
end event

event editchanged;changement = 1
end event

event itemchanged;long ll_typetraitid
integer li_duree

if dwo.name = 'rendezvous_type_traitement_id' then
	ll_typetraitid = long(data)
	select duree into :li_duree from type_de_traitement where type_traitement_id = :ll_typetraitid;
	setitem(row,'rendezvous_duree',li_duree)
end if
changement = 1
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
setrowfocusindicator(hand!)

if GetChild('rendezvous_id_raptrait', dddw_typerap) = -1 then
	error_type(0)
end if
dddw_typerap.SetTransObject(SQLCA)
dddw_typerap.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_typerap.retrieve()

if GetChild('rendezvous_type_traitement_id', dddw_traitraphor) = -1 then
	error_type(0)
end if
dddw_traitraphor.SetTransObject(SQLCA)
dddw_traitraphor.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_traitraphor.retrieve()

if v_langue = 'an' then
	this.object.t_nom.text = 'Patient Name'
	this.object.b_nom.text = 'Patient Name'
	this.object.t_1.text = 'File #'
	this.object.b_doss.text = 'File #'
	this.object.b_naissance.text = "Date of birth"
	this.object.age.text = 'Age'
	this.object.b_age.text = 'Age'
	this.object.t_2.text = 'App. Date'
	this.object.b_venue.text = 'App. Date'
	this.object.rendez_vous_prochain_rv_t.text = 'Due'
	this.object.b_du.text = 'Due'
	this.object.t_4.text = 'Length'
	this.object.b_duree.text = 'Length'
	this.object.t_type.text = 'Recall Type'
	this.object.b_type.text = 'Recall Type'
end if

end event

event clicked;ScrollToRow(GetClickedRow())
Choose case dwo.name
	case 'b_nom'
		SetSort('patient_nom A')
		Sort()
	case 'b_doss'
		SetSort('nodoss A')
		Sort()
	case 'b_age'
		SetSort('annee A')
		Sort()
	case 'b_naissance'
		SetSort('patient_date_naissance A')
		Sort()
	case 'b_venue'
		SetSort('rendezvous_date_vue A')
		Sort()
	case 'b_du'
		SetSort('rendezvous_prochain_rv A')
		Sort()
	case 'b_type'
		SetSort('rendezvous_id_raptrait A, rendezvous_prochain_rv A')
		Sort()
	case 'b_typetrait'
		SetSort('rendezvous_type_traitement_id A, rendezvous_prochain_rv A')
		Sort()
	case 'b_duree'
		SetSort('rendezvous_duree A, rendezvous_prochain_rv A')
		Sort()
end choose
end event

event doubleclicked;if dwo.name = "nom_complet" then
   il_patid = dw_rappel_retention.getitemnumber(row,'rendezvous_patient_id')
   Opensheetwithparm(w_dossier_patients,il_patid,w_principal,2,layered! )
end if
end event

event updateend;long ll_row, ll_rvid
integer test
if rowsinserted <> 0 then
	ll_row = dw_rappel_retention.getrow()
	select max(rv_id) into :ll_rvid from rendezvous;
	dw_rappel_retention.setitem(ll_row,'rendezvous_rv_id',ll_rvid)
	if ii_modeajout = 1 then
		test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_rv_id',primary!,notmodified!)  
      test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_prochain_rv',primary!,notmodified!)   
      test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_patient_id',primary!,notmodified!)  
		test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_no_ortho',primary!,notmodified!)
		test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_ortho_id',primary!,notmodified!)
      test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_date_vue',primary!,notmodified!)
      test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_duree',primary!,notmodified!)
      test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_note1',primary!,notmodified!)
		test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_rappel_retention',primary!,notmodified!)
		test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_type_traitement_id',primary!,notmodified!)
		test = dw_rappel_retention.setitemstatus(ll_row,'rendezvous_id_raptrait',primary!,notmodified!)
	end if
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

event buttonclicked;call super::buttonclicked;long ll_idhortrans, ll_rv
string ls_sql,ls_col
integer i,li_count
s_pat lstr_pat

if dwo.name = 'b_passerhor' then
	lstr_pat.patid = dw_rappel_retention.getitemnumber(row,'rendezvous_patient_id')
	// vérification si il y a possibilité de transfert
	if lstr_pat.patid > 0 then
		// vérifier si le patient est déjà en transfert
		select count(*) into :li_count from t_hortrans where patid = :lstr_pat.patid;
		if li_count > 0 then
			error_type(190)
		else
			ll_rv = dw_rappel_retention.getitemnumber(row,"rendezvous_rv_id")
			// remplir la structure
			lstr_pat.patid = dw_rappel_retention.getitemnumber(row,"rendezvous_patient_id")
			lstr_pat.idspec = v_no_ortho
			lstr_pat.datecal = date('1900-01-01')
			lstr_pat.heure = time('00:00:00')
			lstr_pat.patnom = dw_rappel_retention.getitemstring(row,"patient_nom")+' '+dw_rappel_retention.getitemstring(row,"patient_prenom")
			lstr_pat.traitid = dw_rappel_retention.getitemnumber(row,'rendezvous_type_traitement_id')
			select color into :lstr_pat.backcolor from t_color inner join type_de_traitement on t_color.color_id = type_de_traitement.color_id where type_traitement_id = :lstr_pat.traitid;
			if dw_rappel_retention.getitemnumber(row,"rendezvous_duree") <= 0 then
				lstr_pat.duree = 1
			else
				lstr_pat.duree = dw_rappel_retention.getitemnumber(row,"rendezvous_duree")
			end if
			for i = 1 to lstr_pat.duree - 1
				lstr_pat.l[i]  = 'X'
			next
			select max(id_hortrans) into :ll_idhortrans from t_hortrans;
			if isnull(ll_idhortrans) then ll_idhortrans = 0
			ll_idhortrans++
			ls_sql = "insert into t_hortrans(id_hortrans,id_specialist,datecal,heure,patid,backcolor,idtrait,duree,col,memo,idpers,rv_id) values ("+string(ll_idhortrans)+","+string(lstr_pat.idspec)+",'"+string(lstr_pat.datecal,'yyyy-mm-dd')+"','"+string(lstr_pat.heure)+"',"+string(lstr_pat.patid)+","+string(lstr_pat.backcolor)+","+string(lstr_pat.traitid)+","+string(lstr_pat.duree)+",0,'"+lstr_pat.memo+"',"+string(gl_idpers)+","+string(ll_rv)+")"
			execute immediate :ls_sql using sqlca;
			if error_type(-1) = 1 then
				for i = 1 to upperbound(lstr_pat.l[])
					ls_sql = "insert into t_hortransrow(id_hortrans,patnom,ligne) values ("+string(ll_idhortrans)+",'"+lstr_pat.l[i]+"',"+string(i)+")"
					execute immediate :ls_sql using sqlca;
					error_type(-1)
				next
				error_type(188)
				if isvalid(w_horaire) = false then
					opensheetwithparm(w_horaire,string(today()),w_principal,2,layered!)
					w_horaire.title = "Horaire"
				end if
			end if
		end if
	end if
end if
end event

type cb_fermer from commandbutton within w_liste_des_rappels_retentions
integer x = 3141
integer y = 1936
integer width = 498
integer height = 108
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if changement = 1 then
	if error_type(200) = 1 then
		sauvegarde()
	end if
end if
Close (parent)
end event

event constructor;if v_langue = 'an' then
	cb_fermer.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_liste_des_rappels_retentions
integer y = 1936
integer width = 535
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter patient"
end type

event clicked;long enr,no_row,v_check,ll_nodoss,ll_raptrait
string patientnom2, patientprenom, v_patient_id,ls_newdoss
date patientnais, du

open(w_rech_patient_rappels)
if patientrech > 0 then
	select count(*) into :v_check from rendezvous where patient_id = :patientrech and ortho_id = :v_no_ortho and id_rdv is null;
	if v_check > 0 then
		v_patient_id = string(v_check) 
		error_type(121)
		no_row = dw_rappel_retention.Find("string(rendezvous_patient_id) like '" +v_patient_id+"'",0,dw_rappel_retention.rowcount())
		dw_rappel_retention.scrolltorow(no_row)	
	else
		enr = dw_rappel_retention.insertrow(0)
		select patient_nom, patient_prenom, date_naissance, no_dossier, new_dossier into :patientnom2, :patientprenom, :patientnais, :ll_nodoss, :ls_newdoss from patient where patient_id = :patientrech;
		dw_rappel_retention.setitem(enr,"rendezvous_patient_id",patientrech)
		dw_rappel_retention.setitem(enr,"patient_nom",patientnom2)
		dw_rappel_retention.setitem(enr,"patient_prenom",patientprenom)
		dw_rappel_retention.setitem(enr,"patient_date_naissance",patientnais)	
		dw_rappel_retention.setitem(enr,"rendezvous_no_ortho",v_no_ortho)	
		dw_rappel_retention.setitem(enr,"rendezvous_ortho_id",v_no_ortho)
		dw_rappel_retention.setitem(enr,"rendezvous_date_vue",today())
		select id_raptrait into :ll_raptrait from t_raptrait where ortho_id = :v_no_ortho and defo = 1;
		if ll_raptrait > 0 then
			dw_rappel_retention.setitem(enr,"rendezvous_id_raptrait",ll_raptrait)
		end if
		dw_rappel_retention.setitem(enr,"patient_no_dossier",ll_nodoss)
		dw_rappel_retention.setitem(enr,"patient_new_dossier",ls_newdoss)
		//ecart de temps
		du = relativedate(today(),30)
		dw_rappel_retention.setitem(enr,"rendezvous_prochain_rv",du)
		dw_rappel_retention.setitem(enr,"rendezvous_type_traitement_id",1)
		dw_rappel_retention.setitem(enr,"rendezvous_duree",1)
		dw_rappel_retention.ScrollToRow(enr)
		dw_rappel_retention.SetRow(enr)
		ii_modeajout = 1 //bug rowfocuschange
	end if
end if
// Initialise les variables
changement = 1
//Ajuste ls disponibilité des boutons
if cb_update.enabled = false then cb_update.enabled = true
if cb_delete.enabled = false then cb_delete.enabled = true
if cb_passer_horaire.enabled = false then cb_passer_horaire.enabled = true
dw_rappel_retention.setfocus()

end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "Add patient"
end if
end event

