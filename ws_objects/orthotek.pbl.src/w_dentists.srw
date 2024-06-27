$PBExportHeader$w_dentists.srw
forward
global type w_dentists from w_child
end type
type cb_corr from commandbutton within w_dentists
end type
type cb_pat from commandbutton within w_dentists
end type
type cb_implist from commandbutton within w_dentists
end type
type cb_1 from commandbutton within w_dentists
end type
type cb_delete from commandbutton within w_dentists
end type
type cb_print from commandbutton within w_dentists
end type
type st_2 from statictext within w_dentists
end type
type dw_dentistslist from u_dw within w_dentists
end type
type sle_rech from singlelineedit within w_dentists
end type
type st_label from statictext within w_dentists
end type
type cb_insert from commandbutton within w_dentists
end type
type dw_dentists from u_dw within w_dentists
end type
type cb_update from commandbutton within w_dentists
end type
type cb_close from commandbutton within w_dentists
end type
end forward

global type w_dentists from w_child
string tag = "Dentist"
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
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_corr cb_corr
cb_pat cb_pat
cb_implist cb_implist
cb_1 cb_1
cb_delete cb_delete
cb_print cb_print
st_2 st_2
dw_dentistslist dw_dentistslist
sle_rech sle_rech
st_label st_label
cb_insert cb_insert
dw_dentists dw_dentists
cb_update cb_update
cb_close cb_close
end type
global w_dentists w_dentists

type variables
int changement = 0
boolean ib_newrow = false
long il_dentist
end variables

forward prototypes
public function integer save ()
end prototypes

public function integer save ();string v_nom, v_prenom
int row,enr
long ll_dentid, no_row

dw_dentistslist.setRedraw(false)
dw_dentists.setRedraw(false)
dw_dentists.AcceptText()
row = dw_dentistslist.getrow()
//implantation du nom_complet
enr = dw_dentists.getrow()
v_nom = dw_dentists.getitemstring(enr,"det_nom")
v_prenom = dw_dentists.getitemstring(enr,"det_prenom")
if isnull(v_nom) or isnull(v_prenom) then
	messagebox("Erreur", "L'un des champs suivant est manquant: nom ou prénom")
	dw_dentistslist.setRedraw(true)
	dw_dentists.setRedraw(true)
	return 0
else
	if dw_dentists.update() = 1 then
		commit using SQLCA;
		changement = 0
		dw_dentistslist.retrieve(v_no_ortho)
		//selectionner le referent cree
		if ib_newrow then
			Select max(id_dentist) into :ll_dentid from t_dentists;
			no_row = dw_dentistslist.Find("string(id_dentist) = '" +string(ll_dentid)+"'",0,dw_dentistslist.rowcount())
			dw_dentistslist.scrolltorow(no_row)
			dw_dentistslist.setfocus()
		else
			dw_dentistslist.scrolltorow(row)
		end if
		if isvalid(w_dossier_patients) then
			w_dossier_patients.dddw_dentist.setfilter("ortho_id = " + string(v_no_ortho))
			w_dossier_patients.dddw_dentist.retrieve()
		end if
		ib_newrow = false
	else
		rollback using SQLCA;
		error_type(50)
	end if
	dw_dentistslist.setRedraw(true)
	dw_dentists.setRedraw(true)
	return 1
end if
end function

on w_dentists.create
int iCurrent
call super::create
this.cb_corr=create cb_corr
this.cb_pat=create cb_pat
this.cb_implist=create cb_implist
this.cb_1=create cb_1
this.cb_delete=create cb_delete
this.cb_print=create cb_print
this.st_2=create st_2
this.dw_dentistslist=create dw_dentistslist
this.sle_rech=create sle_rech
this.st_label=create st_label
this.cb_insert=create cb_insert
this.dw_dentists=create dw_dentists
this.cb_update=create cb_update
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_corr
this.Control[iCurrent+2]=this.cb_pat
this.Control[iCurrent+3]=this.cb_implist
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_delete
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.dw_dentistslist
this.Control[iCurrent+9]=this.sle_rech
this.Control[iCurrent+10]=this.st_label
this.Control[iCurrent+11]=this.cb_insert
this.Control[iCurrent+12]=this.dw_dentists
this.Control[iCurrent+13]=this.cb_update
this.Control[iCurrent+14]=this.cb_close
end on

on w_dentists.destroy
call super::destroy
destroy(this.cb_corr)
destroy(this.cb_pat)
destroy(this.cb_implist)
destroy(this.cb_1)
destroy(this.cb_delete)
destroy(this.cb_print)
destroy(this.st_2)
destroy(this.dw_dentistslist)
destroy(this.sle_rech)
destroy(this.st_label)
destroy(this.cb_insert)
destroy(this.dw_dentists)
destroy(this.cb_update)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

sle_rech.SetFocus()
end event

event closequery;call super::closequery;dw_dentists.AcceptText()
if changement = 1 then
	choose case error_type(259)
		case 1
			if save() = 0 then return 1
		case 3
			return 1
	end choose
end if

end event

type cb_corr from commandbutton within w_dentists
integer x = 1161
integer y = 1800
integer width = 654
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Correspondance"
end type

event clicked;s_corrletter s_corr
boolean lb_2k3 = false
integer li_FileNum, li_result
long ll_ident[]
string ls_corrpath, ls_versword

select corrpath into :ls_corrpath from t_options where ortho_id = :v_no_ortho;

li_result = RegistryGet("HKEY_CLASSES_ROOT\Word.Application\CurVer", "", RegString!, ls_versword)

if li_result = 1 then
	if not isNull(ls_versword) then
		if ls_versword = "Word.Application.11" then lb_2k3 = true
	end if
end if

ll_ident[1] = il_dentist
s_corr.patid = il_dentist
s_corr.letter = ''
s_corr.flag = 'w'
s_corr.mode = 'd'
gf_det2excel(ll_ident)
if fileExists("C:\ii4net\orthotek\img.xml") then fileDelete("C:\ii4net\orthotek\img.xml")
li_FileNum = fileOpen("C:\ii4net\orthotek\filedel.bat", LineMode!, Write!, lockReadWrite!, replace!)
fileWrite(li_FileNum, 'del /F ' + ls_corrpath + '\dentistes\' + string(il_dentist) + '\.*.doc~r~nexit')
fileClose(li_FileNum)

run("C:\ii4net\orthotek\filedel.bat",minimized!)

sleep(2)

openwithparm(w_dosspatcorrletters,s_corr,w_principal)

end event

type cb_pat from commandbutton within w_dentists
integer x = 585
integer y = 1800
integer width = 576
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Patient lié"
end type

event clicked;opensheetwithparm(w_dentists_patient,dw_dentists.getitemnumber(dw_dentists.getrow(),'id_dentist'),w_principal,2,layered!)
w_dentists_patient.title = "Liste des patients par dentists"
end event

type cb_implist from commandbutton within w_dentists
integer x = 1161
integer y = 1912
integer width = 654
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Liste"
end type

event clicked;opensheet(w_listdentists,w_principal,2,layered!)
end event

event constructor;if v_langue = 'an' then
	this.Text = "List"
end if
end event

type cb_1 from commandbutton within w_dentists
integer x = 9
integer y = 1800
integer width = 576
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Passer référent"
end type

event clicked;long ll_iddentist, ll_orthoid, ll_row, ll_count, ll_idsal
string ls_detnom, ls_detprenom, ls_detadd, ls_detville, ls_detprov
string ls_detzip, ls_detlang, ls_dettelbur, ls_detfax, ls_detemail
string ls_detnote, ls_detsex, ls_nomcomp

ll_row = dw_dentists.getrow()
ll_iddentist = dw_dentists.getitemnumber(ll_row,'id_dentist')
ls_detnom = dw_dentists.getitemstring(ll_row,'det_nom')
ls_detprenom = dw_dentists.getitemstring(ll_row,'det_prenom')
ls_detadd = dw_dentists.getitemstring(ll_row,'det_add')
ls_detville = dw_dentists.getitemstring(ll_row,'det_ville')
ls_detprov = dw_dentists.getitemstring(ll_row,'det_prov')
ls_detzip = dw_dentists.getitemstring(ll_row,'det_zip')
ls_detlang = dw_dentists.getitemstring(ll_row,'det_langue')
ls_dettelbur = dw_dentists.getitemstring(ll_row,'det_telbur')
ls_detfax = dw_dentists.getitemstring(ll_row,'det_fax')
ls_detemail = dw_dentists.getitemstring(ll_row,'det_email')
ls_detnote = dw_dentists.getitemstring(ll_row,'det_note')
ls_detsex = dw_dentists.getItemString(ll_row,'det_sex')
ll_idsal = dw_dentists.getItemnumber(ll_row,'id_sal')
if ls_detsex = 'F' then
	ls_detsex = 'f'
else
	ls_detsex = 'h'
end if
ll_orthoid = dw_dentists.getitemnumber(ll_row,'ortho_id')
ls_nomcomp = ls_detprenom + ' ' + ls_detnom
select count(*) into :ll_count from t_referents where ref_nom = :ls_detnom and ref_prenom = :ls_detprenom and ortho_id = :ll_orthoid;
if ll_count > 0 then
	if error_type(225) = 1 then
	   insert into t_referents(ref_adresse,ref_ville,ref_sexe,ref_province,ref_zip,ref_tel_bur,ref_tel_fax,ref_langue,ref_note,ref_email,ref_prenom,ref_nom,ref_nom_complet,id_sal,ortho_id) 
		values(:ls_detadd,:ls_detville,:ls_detsex,:ls_detprov,:ls_detzip,:ls_dettelbur,:ls_detfax,:ls_detlang,:ls_detnote,:ls_detemail,:ls_detprenom,:ls_detnom,:ls_nomcomp,:ll_idsal,:ll_orthoid);
	end if
else
	insert into t_referents(ref_adresse,ref_ville,ref_sexe,ref_province,ref_zip,ref_tel_bur,ref_tel_fax,ref_langue,ref_note,ref_email,ref_prenom,ref_nom,ref_nom_complet,id_sal,ortho_id) 
	values(:ls_detadd,:ls_detville,:ls_detsex,:ls_detprov,:ls_detzip,:ls_dettelbur,:ls_detfax,:ls_detlang,:ls_detnote,:ls_detemail,:ls_detprenom,:ls_detnom,:ls_nomcomp,:ll_idsal,:ll_orthoid);
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Pass as referral"
end if
end event

type cb_delete from commandbutton within w_dentists
integer x = 585
integer y = 1912
integer width = 576
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;//////////////////////////////
//
// Créé par: Dave Tremblay
// Créé le : 14-11-2003
// Demande : 
// Version : 7.6.4
// Modifié par: Dave Tremblay
// Modifié le: 14-11-2003
// 
////////////////////////////////

long ll_iddentist, ll_count, ll_row, ll_cursor
string ls_detnom
date ldt
setnull(ldt)
ll_row = dw_dentists.getRow()
ll_iddentist = dw_dentists.getItemNumber(ll_row,'id_dentist')
select count(*) into :ll_count from patient where id_dentist = :ll_iddentist;
if ll_count > 0 then
	if error_type(236) = 1 then
		update patient set id_dentist = null where id_dentist = :ll_iddentist;
		commit using SQLCA;
		ll_row = dw_dentists.getrow()
		//log
		select det_prenom + ' ' + det_nom into :ls_detnom from t_dentists where id_dentist = :ll_iddentist;
		f_logs('del',ls_detnom,ll_iddentist,0,ldt,'del in pat file')
		dw_dentists.deleterow(ll_row)
		if dw_dentists.update() = 1 then
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
		dw_dentistslist.retrieve(v_no_ortho)
		if ll_row = 1 then
			dw_dentistslist.event rowfocuschanged(1)
		end if
	else
		return
	end if
else
	//log
	select det_prenom + ' ' + det_nom into :ls_detnom from t_dentists where id_dentist = :ll_iddentist;
	f_logs('del',ls_detnom,ll_iddentist,0,ldt,'')
	dw_dentists.deleterow(ll_row)
	if dw_dentists.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	ll_cursor = dw_dentistslist.getrow()
	dw_dentistslist.setredraw(false)
	dw_dentistslist.retrieve(v_no_ortho)
	if ll_row = 1 then
		dw_dentistslist.event rowfocuschanged(1)
	end if
	dw_dentistslist.scrolltorow(ll_cursor - 1)
	dw_dentistslist.setredraw(true)
end if

end event

event constructor;if v_langue = 'an' then
	this.Text = "Delete"
end if
end event

type cb_print from commandbutton within w_dentists
integer x = 1815
integer y = 1912
integer width = 690
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer étiquette"
end type

event clicked;long ll_iddent

datastore ds_etiquette_dentist
ds_etiquette_dentist = create datastore
ds_etiquette_dentist.dataobject = "d_etiquettes_dentist"
ds_etiquette_dentist.SetTransObject(SQLCA)
ll_iddent = dw_dentistslist.getitemnumber(dw_dentistslist.getrow(),'id_dentist')
if ds_etiquette_dentist.retrieve(ll_iddent) > 0 then
	if ds_etiquette_dentist.getItemString(ds_etiquette_dentist.getRow(),'det_prov') <> 'USA' then
		ds_etiquette_dentist.modify("det_zip.EditMask.Mask = '!#! #!#'")
	else
		ds_etiquette_dentist.modify("det_zip.EditMask.Mask = ''")
	end if
	gi_imp = 2
	gb_datawindow = false
	gb_imp = true
	openwithparm(w_print_options,ds_etiquette_dentist)
end if
destroy ds_etiquette_dentist

end event

event constructor;if v_langue = 'an' then
	this.Text = "Print label"
end if
end event

type st_2 from statictext within w_dentists
integer x = 2272
integer y = 8
integer width = 1289
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrez le nom du dentiste à rechercher :"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Enter the name of dentist to search"
end if
end event

type dw_dentistslist from u_dw within w_dentists
integer x = 2272
integer y = 200
integer width = 1326
integer height = 1700
integer taborder = 30
string title = "Dentists List"
string dataobject = "d_dentistslist"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
dw_dentists.SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
retrieve(v_no_ortho)



end event

event rowfocuschanged;long enr, ll_un, ll_deux, ll_trois

enr = dw_dentistslist.getrow()
if enr > 0 then
	il_dentist = dw_dentistslist.getitemnumber(enr,"id_dentist")
	dw_dentists.retrieve(il_dentist)
	if dw_dentists.getItemString(dw_dentists.getRow(),'det_prov') <> 'USA' then
		dw_dentists.modify("det_zip.EditMask.Mask = '!#! #!#'")
	else
		dw_dentists.modify("det_zip.EditMask.Mask = ''")
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

event rowfocuschanging;call super::rowfocuschanging;dw_dentists.AcceptText()
if changement = 1 then
	CHOOSE CASE error_type(259) 
		CASE 1
			if save() = 0 then
				return 1
			end if
		CASE 2 
			changement = 0
		CASE 3
			return 1
	END CHOOSE
end if
end event

type sle_rech from singlelineedit within w_dentists
integer x = 2272
integer y = 88
integer width = 1321
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event modified;string ls_dnom
integer no_row, v_nb

//pour regler le bug des apostrophes
ls_dnom = Trim(sle_rech.text)+'%'
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if
//**********************************
no_row = dw_dentistslist.Find("upper(det_nom) like '" +upper(ls_dnom)+"'",0,dw_dentistslist.rowcount())
if no_row > 0 then
	dw_dentistslist.scrolltorow(no_row)
	dw_dentists.setfocus()	
else
	sle_rech.setfocus()	
end if
end event

type st_label from statictext within w_dentists
integer width = 672
integer height = 80
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "DENTISTES"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "DENTISTS"
end if
end event

type cb_insert from commandbutton within w_dentists
integer x = 9
integer y = 1912
integer width = 576
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long ll_newrow,ll_idmax
string ls_note1
dw_dentists.SetFocus()
ll_newrow = dw_dentists.InsertRow(0)
dw_dentists.ScrollToRow(ll_newrow)
dw_dentists.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_dentists.setitem(ll_newrow,'det_suf','Dr')
dw_dentists.setitem(ll_newrow,'det_langue','fr')
dw_dentists.setitem(ll_newrow,'det_prov','QC')
dw_dentists.setitem(ll_newrow,'actif',1)
//inscrire la derniere info entré ds la case
select max(id_dentist) into :ll_idmax from t_dentists where detnote1 is not null;
select detnote1 into :ls_note1 from t_dentists where id_dentist = :ll_idmax;
dw_dentists.setitem(ll_newrow,'detnote1',ls_note1)
if dw_dentists.getItemString(dw_dentists.getRow(),'det_prov') <> 'USA' then
	dw_dentists.modify("det_zip.EditMask.Mask = '!#! #!#'")
else
	dw_dentists.modify("det_zip.EditMask.Mask = ''")
end if
changement=1
ib_newrow = true

end event

event constructor;if v_langue = 'an' then
	this.Text = "Add"
end if
end event

type dw_dentists from u_dw within w_dentists
integer x = 14
integer y = 88
integer width = 2245
integer height = 1704
integer taborder = 10
string title = "Dentist"
string dataobject = "d_dentists"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event editchanged;changement = 1
end event

event itemchanged;if dwo.name = 'province' then
	if data = 'USA' then
		dw_dentists.modify("zip.EditMask.Mask = ''")
	else
		dw_dentists.modify("zip.EditMask.Mask = '!#! #!#'")
	end if
end if
changement = 1
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

//if sqldbcode = -198 then
//	error_type(59)
//	return 1
//end if
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	this.Object.t_sal.Text = "Greetings:"
	this.Object.nom_t.Text = "Last name:"
	this.Object.t_1.Text = "First name:"
	this.Object.adresse_t.Text = "Address:"
	this.Object.ville_t.Text = "City:"
	this.Object.t_2.Text = "Sex:"
	this.Object.zip_t.Text = "Postal code:"
	this.Object.langue_t.Text = "Language:"
	this.Object.t_3.Text = "Title:"
	this.Object.tel_bur_t.Text = "Tel office:"
	this.Object.gb_tri.text = 'Sort key'
//	this.object.det_suf.values = 'Dr~tDr/Dre~tDre/Mr~tMonsieur/Miss~tMadame'
	this.object.det_sex.values = 'Male~tM/Female~tF'
	this.object.det_langue.values = 'French~tfr/English~tan/Spanish~tes'
	this.object.t_email.text = 'Email:'
	this.object.t_spec.text = 'Speciality:'
	this.object.det_prov.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/British Columbia~tBritish Colombia/NewFoundland~tNewFoundland/New Brunswick~tNew Brunswick/Nova Scotia~tNova Scotia/Price Edward island~tPrice Edward island/Yukon~tYukon/North West Territory~tNorthwest Territories'
else
	this.object.det_prov.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/Colombie Britanique~tColombie Britanique/Terre neuve~tTerre Neuve/Nouveau Brunswick~tNouveau Brunswick/Nouvelle Écosse~tNouvelle Écosse/Île-du-Price-Edward~tÎle-du-Price-Edward/Yukon~tYukon/Territoires du Nord-Ouest~tTerritoire du Nord-Ouest'
//	this.object.det_suf.values = 'Dr~tDr/Dre~tDre/Monsieur~tMonsieur/Madame~tMadame'
	this.object.det_sex.values = 'Homme~tM/Femme~tF'
	this.object.det_langue.values = 'Français~tfr/Anglais~tan/Espagnol~tes'
end if
end event

type cb_update from commandbutton within w_dentists
integer x = 2505
integer y = 1912
integer width = 571
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;save()

dw_dentists.setfocus()
dw_dentists.setColumn('det_nom')

end event

event constructor;if v_langue = 'an' then
	this.Text = "Save"
end if
end event

type cb_close from commandbutton within w_dentists
integer x = 3077
integer y = 1912
integer width = 526
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
if isvalid(w_dossier_patients) then
	w_dossier_patients.dddw_dentist.SetTransObject(SQLCA)
	w_dossier_patients.dddw_dentist.retrieve()
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Close"
end if
end event

