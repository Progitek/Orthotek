$PBExportHeader$w_description.srw
forward
global type w_description from w_child
end type
type cb_rappcons from commandbutton within w_description
end type
type cb_panel from commandbutton within w_description
end type
type cb_3 from commandbutton within w_description
end type
type ddlb_intro from u_ddlb within w_description
end type
type cb_2 from commandbutton within w_description
end type
type cb_1 from commandbutton within w_description
end type
type cb_preview from commandbutton within w_description
end type
type cb_update from commandbutton within w_description
end type
type cb_close from commandbutton within w_description
end type
type cb_d from commandbutton within w_description
end type
type cb_c from commandbutton within w_description
end type
type cb_b from commandbutton within w_description
end type
type cb_a from commandbutton within w_description
end type
type mle_concl from multilineedit within w_description
end type
type st_3 from statictext within w_description
end type
type st_2 from statictext within w_description
end type
type mle_intro from multilineedit within w_description
end type
type st_1 from statictext within w_description
end type
type st_4 from statictext within w_description
end type
type ddlb_cat from u_ddlb within w_description
end type
type dw_plantrait from u_dw within w_description
end type
type ddlb_sujet from u_ddlb within w_description
end type
type ddlb_concl from u_ddlb within w_description
end type
end forward

global type w_description from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_rappcons cb_rappcons
cb_panel cb_panel
cb_3 cb_3
ddlb_intro ddlb_intro
cb_2 cb_2
cb_1 cb_1
cb_preview cb_preview
cb_update cb_update
cb_close cb_close
cb_d cb_d
cb_c cb_c
cb_b cb_b
cb_a cb_a
mle_concl mle_concl
st_3 st_3
st_2 st_2
mle_intro mle_intro
st_1 st_1
st_4 st_4
ddlb_cat ddlb_cat
dw_plantrait dw_plantrait
ddlb_sujet ddlb_sujet
ddlb_concl ddlb_concl
end type
global w_description w_description

type variables
private integer ii_plantraitdim[2]
public long il_patid = 0
public DatawindowChild dddw_sujet
public DatawindowChild dddw_plancat
public DatawindowChild dddw_intro
public DatawindowChild dddw_concl
public boolean change = false
public datetime idtt_lettre
public long il_prov = 0
public string is_odonto = ""
end variables

forward prototypes
public subroutine sauvegarde ()
public subroutine uf_addnewitems (long al_catid)
public subroutine uf_settrait (long al_idcatplan)
end prototypes

public subroutine sauvegarde ();if dw_plantrait.Update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if


end subroutine

public subroutine uf_addnewitems (long al_catid);long ll_row, ll_idplan
integer li_nb

select count(*) into :li_nb from t_plans where id_catplan = :al_catid;
if dw_plantrait.rowCount() <> li_nb then
	Declare catplan Cursor For
	
		SELECT t_plans.id_plan
		FROM  t_plans
		WHERE t_plans.id_catplan = :al_catid;
		
		OPEN catplan;
		
		Do While SQLCA.SQLCode = 0
			
			Fetch catplan Into :ll_idplan;
			
			if SQLCA.SQLCode = 0 then
				if dw_plantrait.find('id_plan = '+string(ll_idplan),0,dw_plantrait.rowcount()) = 0 then
					ll_row = dw_plantrait.insertrow(0)
					dw_plantrait.setitem(ll_row,'id_plan',ll_idplan)
					dw_plantrait.setitem(ll_row,'patient_id',il_patid)
				end if
			end if
		Loop
		
		CLOSE catplan;
end if
end subroutine

public subroutine uf_settrait (long al_idcatplan);long ll_idplan, ll_row
string ls_descrip, ls_descripan

if al_idcatplan = 0 then
	dw_plantrait.reset()
else
	dw_plantrait.setTransObject(SQLCA)
	if dw_plantrait.retrieve(il_patid,al_idcatplan) <= 0 then
		
		dw_plantrait.setRedraw(false)	 
		Declare catplan Cursor For
		 
		  SELECT	t_plans.id_plan
			 FROM t_plans
			WHERE t_plans.id_catplan = :al_idcatplan
		ORDER BY t_plans.ordre ASC,
					t_plans.id_plan ASC;
		
		OPEN catplan;
		
		Do While SQLCA.SQLCode = 0
			
			Fetch catplan Into :ll_idplan;
			
			if SQLCA.SQLCode = 0 then
				ll_row = dw_plantrait.insertrow(0)
				dw_plantrait.scrolltorow(ll_row)
				dw_plantrait.setitem(ll_row,'id_plan',ll_idplan)
				dw_plantrait.setitem(ll_row,'patient_id',il_patid)
				select t_plans.description,t_plans.descriptionan into :ls_descrip, :ls_descripan from t_plans where id_plan = :ll_idplan;
				dw_plantrait.setitem(ll_row,'t_plans_description',ls_descrip)
				dw_plantrait.setitem(ll_row,'t_plans_descriptionan',ls_descripan)
			end if
		Loop
		
		CLOSE catplan;
		dw_plantrait.scrollToRow(1)
		dw_plantrait.setRedraw(true)
	else
		uf_addnewitems(al_idcatplan)
	end if
	
	long ll_idcontact
	datawindowchild dwc_plan
	select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
	
	if dw_plantrait.getChild('id_plan', dwc_plan) <> 1 then
		error_type(0)
		return
	end if

	dwc_plan.setTransObject(SQLCA)
	dwc_plan.retrieve()
//	pas nécessaire car la fusion est impossible
// si actif le rapport de consult est très lent
//	for ll_row = 1 to dw_plantrait.rowCount()
//		dwc_plan.setitem(ll_row,'description',gf_fusion(dwc_plan.getitemstring(ll_row,'description'),ll_idcontact,0))
//	next
end if

end subroutine

on w_description.create
int iCurrent
call super::create
this.cb_rappcons=create cb_rappcons
this.cb_panel=create cb_panel
this.cb_3=create cb_3
this.ddlb_intro=create ddlb_intro
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_preview=create cb_preview
this.cb_update=create cb_update
this.cb_close=create cb_close
this.cb_d=create cb_d
this.cb_c=create cb_c
this.cb_b=create cb_b
this.cb_a=create cb_a
this.mle_concl=create mle_concl
this.st_3=create st_3
this.st_2=create st_2
this.mle_intro=create mle_intro
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_cat=create ddlb_cat
this.dw_plantrait=create dw_plantrait
this.ddlb_sujet=create ddlb_sujet
this.ddlb_concl=create ddlb_concl
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_rappcons
this.Control[iCurrent+2]=this.cb_panel
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.ddlb_intro
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_preview
this.Control[iCurrent+8]=this.cb_update
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_d
this.Control[iCurrent+11]=this.cb_c
this.Control[iCurrent+12]=this.cb_b
this.Control[iCurrent+13]=this.cb_a
this.Control[iCurrent+14]=this.mle_concl
this.Control[iCurrent+15]=this.st_3
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.mle_intro
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_4
this.Control[iCurrent+20]=this.ddlb_cat
this.Control[iCurrent+21]=this.dw_plantrait
this.Control[iCurrent+22]=this.ddlb_sujet
this.Control[iCurrent+23]=this.ddlb_concl
end on

on w_description.destroy
call super::destroy
destroy(this.cb_rappcons)
destroy(this.cb_panel)
destroy(this.cb_3)
destroy(this.ddlb_intro)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_preview)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.cb_d)
destroy(this.cb_c)
destroy(this.cb_b)
destroy(this.cb_a)
destroy(this.mle_concl)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.mle_intro)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_cat)
destroy(this.dw_plantrait)
destroy(this.ddlb_sujet)
destroy(this.ddlb_concl)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)


end event

type cb_rappcons from commandbutton within w_description
integer x = 1888
integer y = 1916
integer width = 603
integer height = 108
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rapp. consultation"
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("RappConsPatientId", il_patid)
open(w_rappconspopup)
end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Consult report"
end if
end event

type cb_panel from commandbutton within w_description
integer x = 1257
integer y = 1916
integer width = 631
integer height = 108
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Panneau controle"
end type

event clicked;long ll_idsujet

ll_idsujet = long(ddlb_sujet.of_getselecteddata())
opensheetwithparm(w_choix_consult,ll_idsujet,w_principal,2,layered!)
//w_principal.title = "Panneau contrôle"

end event

type cb_3 from commandbutton within w_description
integer x = 626
integer y = 1916
integer width = 631
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Aperçu (Patient)"
end type

event clicked;///////////////////////////////////////////////////
//
// Par			: Eric Vezina ing.
// Date			: Il était une fois...
// Description	: Une structure contenant les informations suivantes
//					  est passé à la fenêtre w_word.
//
//	PatId : patient_id
// Flag	: r (mode lecture seulement)
//			  w (mode lecture et écriture)
// Mode	: t (mode edition du template)
//			: l (mode création de lettre patient)
//
///////////////////////////////////////////////////

long ll_contactid[], ll_patid[], ll_phase[], ll_idsujet
integer li_FileNum,i = 1
string ls_intro,ls_concl,ls_corrpath,ls_wordpath,ls_letter, ls_langue, ls_word
s_corrletter lstr_corrletter

cb_update.event clicked()

ll_idsujet = long(ddlb_sujet.of_getselecteddata())

select corrpath,wordpath into :ls_corrpath,:ls_word from t_options where ortho_id = :v_no_ortho;
ls_wordpath = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", ls_word)

select id_contact,langue into :ll_contactid[1],:ls_langue from patient where patient_id = :il_patid;
ll_patid[1] = il_patid

if ls_Langue = 'A' then
	select filename_patient_an into :lstr_corrletter.letter from t_sujets where id_sujet = :ll_idsujet;
else
	select filename_patient into :lstr_corrletter.letter from t_sujets where id_sujet = :ll_idsujet;
end if

if not isnull(lstr_corrletter.letter) then
	//initialisation des variables
	lstr_corrletter.patid = il_patid
	lstr_corrletter.flag = 'w'
	lstr_corrletter.mode = 'l'
	ll_phase[1] = 1
	gf_pat2excel(ll_patid,ll_contactid,ll_phase)
	ls_intro = mle_intro.text
	ls_concl = mle_concl.text
	gf_patconsult2xml(il_patid,ll_idsujet,ls_intro,ls_concl,2)
	
	if right(ls_corrpath,1) <> '\' then ls_corrpath += '\'
	//creation du repertoire et copier le fichier
	if not DirectoryExists(ls_corrpath + string(lstr_corrletter.patid)) then CreateDirectory(ls_corrpath + string(lstr_corrletter.patid))

	li_FileNum = fileOpen("C:\ii4net\orthotek\filedel.bat", LineMode!, Write!, lockReadWrite!, replace!)
	fileWrite(li_FileNum, 'del /F ' + ls_corrpath + string(lstr_corrletter.patid) + '\.*.doc~r~nexit')
	fileClose(li_FileNum)
	
	run("C:\ii4net\orthotek\filedel.bat",minimized!)
	
	sleep(2)
	
	ls_letter = lstr_corrletter.letter
	
	do while FileExists(ls_corrpath + string(lstr_corrletter.patid) + '\' + ls_letter)
		ls_letter = left(lstr_corrletter.letter, lastpos(lstr_corrletter.letter, '.') - 1) + string(i) + mid(lstr_corrletter.letter, lastpos(lstr_corrletter.letter, '.'))
//		ls_letter = lstr_corrletter.letter + string(i)
		i++
	loop
	
	li_FileNum = FileCopy(ls_corrpath + lstr_corrletter.letter,ls_corrpath + string(lstr_corrletter.patid) + '\.' + ls_letter, FALSE) // add .
	
	choose case li_FileNum
		case -1
			messagebox('Error!',"Error opening sourcefile '" + ls_corrpath + lstr_corrletter.letter + "'")
		case -2
			messagebox('Error!',"Error writing targetfile '" + ls_corrpath + string(lstr_corrletter.patid) + '\.' + ls_letter + "'")
		case else
			//ouverture de word
			Run('"'+ls_wordpath + '"' + '"' + ls_corrpath + string(lstr_corrletter.patid) + '\.' + ls_letter+'"') // add .
			if isvalid(w_dossier_patients) then
				w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
			end if
	end choose
else
	error_type(160)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Preview patient'
end if
end event

type ddlb_intro from u_ddlb within w_description
event ue_fillintro ( )
integer x = 416
integer y = 108
integer width = 1088
integer height = 604
integer taborder = 10
integer textsize = -9
fontcharset fontcharset = ansi!
boolean allowedit = true
boolean sorted = false
boolean ib_rmbmenu = false
boolean ib_search = true
end type

event ue_fillintro();string ls_titre
long ll_idintroconcl

DECLARE listintro CURSOR FOR
	select titre, id_introconcl from t_introconcl where typetexte = 'i' and ortho_id = :v_no_ortho and isnull(actif,0) = 1;

OPEN listintro;

FETCH listintro INTO :ls_titre, :ll_idintroconcl;

DO WHILE SQLCA.SQLCode = 0

	of_additem(ls_titre,ll_idintroconcl)
	
	FETCH listintro INTO :ls_titre, :ll_idintroconcl;

LOOP

CLOSE listintro;
end event

event selectionchanged;call super::selectionchanged;//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 24/10/2003
// Demande  : JMD
// Version  : 7.6.1
// Modifié par:
//	Modifié le :
//////////////////////////////////

long ll_id, ll_idcontact, ll_idintro
string ls_texte
n_cst_fusion luo_fusion

ll_idintro = long(ddlb_intro.of_getSelectedData())
select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
select texte into :ls_texte from t_introconcl where id_introconcl = :ll_idintro;
mle_intro.text = luo_fusion.of_fusion(ls_texte,ll_idcontact,0)
end event

type cb_2 from commandbutton within w_description
integer x = 3511
integer width = 73
integer height = 64
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "-"
end type

event clicked;dw_plantrait.y = ii_plantraitdim[1]
dw_plantrait.height = ii_plantraitdim[2]

//dw_plantrait.y = 592
//dw_plantrait.height = 1316
end event

type cb_1 from commandbutton within w_description
integer x = 3511
integer y = 520
integer width = 73
integer height = 64
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "+"
end type

event clicked;ii_plantraitdim[1] = dw_plantrait.y
ii_plantraitdim[2] = dw_plantrait.height
dw_plantrait.y = 95
dw_plantrait.height = (cb_preview.y - 10) - 95
end event

type cb_preview from commandbutton within w_description
integer x = 14
integer y = 1916
integer width = 608
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Aperçu (Spécialiste)"
end type

event clicked;///////////////////////////////////////////////////
//
// Par			: Eric Vezina ing.
// Date			:
// Description	: Une structure contenant les informations suivantes
//					  est passé à la fenêtre w_word.
//
//	PatId : patient_id
// Flag	: r (mode lecture seulement)
//			  w (mode lecture et écriture)
// Mode	: t (mode edition du template)
//			: l (mode création de lettre patient)
//
///////////////////////////////////////////////////

long ll_contactid[], ll_patid[], ll_phase[], ll_iddent, ll_idsujet
integer li_FileNum,i = 1
string ls_intro,ls_concl,ls_corrpath,ls_wordpath,ls_letter,ls_langue, ls_word
s_corrletter lstr_corrletter

cb_update.event clicked()
ll_idsujet = long(ddlb_sujet.of_getselecteddata())

select corrpath,wordpath into :ls_corrpath,:ls_word from t_options where ortho_id = :v_no_ortho;
ls_wordpath = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", ls_word)
select id_contact,patient.id_dentist into :ll_contactid[1],:ll_iddent from patient where patient_id = :il_patid;
ll_patid[1] = il_patid
ll_phase[1] = 1
select det_langue into :ls_langue from t_dentists where id_dentist = :ll_iddent;

if ls_Langue = 'A' or ls_Langue = 'an' then
	select filenamean into :lstr_corrletter.letter from t_sujets where id_sujet = :ll_idsujet;
else
	select filename into :lstr_corrletter.letter from t_sujets where id_sujet = :ll_idsujet;
end if

if not isnull(lstr_corrletter.letter) then
	//initialisation des variables
	lstr_corrletter.patid = il_patid
	lstr_corrletter.flag = 'w'
	lstr_corrletter.mode = 'l'
	gf_pat2excel(ll_patid,ll_contactid,ll_phase)
	ls_intro = mle_intro.text
	ls_concl = mle_concl.text
	gf_patconsult2xml(il_patid,ll_idsujet,ls_intro,ls_concl,1)
	
	if right(ls_corrpath,1) <> '\' then ls_corrpath += '\'
	//creation du repertoire et copier le fichier
	if not DirectoryExists(ls_corrpath + string(lstr_corrletter.patid)) then CreateDirectory(ls_corrpath + string(lstr_corrletter.patid))

	li_FileNum = fileOpen("C:\ii4net\orthotek\filedel.bat", LineMode!, Write!, lockReadWrite!, replace!)
	fileWrite(li_FileNum, 'del /F ' + ls_corrpath + string(lstr_corrletter.patid) + '\.*.doc~r~nexit')
	fileClose(li_FileNum)
	
	run("C:\ii4net\orthotek\filedel.bat",minimized!)
	
	sleep(2)
	
	ls_letter = lstr_corrletter.letter
	do while FileExists(ls_corrpath + string(lstr_corrletter.patid) + '\' + ls_letter)
		ls_letter = left(lstr_corrletter.letter, lastpos(lstr_corrletter.letter, '.') - 1) + string(i) + mid(lstr_corrletter.letter, lastpos(lstr_corrletter.letter, '.'))
//		ls_letter = lstr_corrletter.letter + string(i)
		i++
	loop
	li_FileNum = FileCopy(ls_corrpath + lstr_corrletter.letter,ls_corrpath + string(lstr_corrletter.patid) + '\.' + ls_letter, FALSE) // add .
	choose case li_FileNum
		case -1
			messagebox('Error!',"Error opening sourcefile '" + ls_corrpath + lstr_corrletter.letter + "'")
		case -2
			messagebox('Error!',"Error writing targetfile '" + ls_corrpath + string(lstr_corrletter.patid) + '\.' + ls_letter + "'")
		case else
			//ouverture de word
			Run('"'+ls_wordpath + '"' + '"' + ls_corrpath + string(lstr_corrletter.patid) + '\.' + ls_letter+'"') // add .
			if isvalid(w_dossier_patients) then
				w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
			end if
	end choose
else
	error_type(160)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Preview (Specialist)'
end if
end event

type cb_update from commandbutton within w_description
integer x = 2491
integer y = 1916
integer width = 571
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;long ll_idintro
long ll_idconcl, ll_idsujet
long ll_concl, ll_intro, ll_iddentist, ll_typelettre

ll_idintro = long(ddlb_intro.of_getselecteddata())
ll_idconcl = long(ddlb_concl.of_getselecteddata())
ll_idsujet = long(ddlb_sujet.of_getselecteddata())
dw_plantrait.setItem(dw_plantrait.getRow(),'t_plantrait_id_introconcl1',ll_idintro)
dw_plantrait.setItem(dw_plantrait.getRow(),'t_plantrait_id_introconcl2',ll_idconcl)
sauvegarde()

// Garder l'historique de la lettre

select id_dentist into :ll_iddentist from patient where patient_id = :il_patid;
if il_prov = 2 then
	update t_histolettre set id_sujet = :ll_idsujet, id_concl = :ll_idconcl, id_intro = :ll_idintro, typelettre = :ll_typelettre, cdate = today(), cheure = now() where id_lettre = :idtt_lettre; 
else
	insert into t_histolettre(id_dentist,patient_id,id_sujet,id_concl,id_intro,cdate,cheure,typelettre) 
	values(:ll_iddentist,:il_patid,:ll_idsujet,:ll_idconcl,:ll_idintro,today(),now(),0);
end if
if (SQLCA.sqlCode <> 0) then
	messagebox("Error:", string(SQLCA.SQLErrText))
	rollback using SQLCA;
else
	commit using SQLCA;
end if

end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Update"
end if
end event

type cb_close from commandbutton within w_description
integer x = 3067
integer y = 1916
integer width = 553
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if change then
	if error_type(200) = 1 then
		sauvegarde()
	end if
end if
close(parent)

if isvalid(w_dossier_patients) then
	w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
end if
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_d from commandbutton within w_description
integer x = 864
integer y = 508
integer width = 288
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "D"
end type

event clicked;opensheetwithparm(w_plantraitdesc,'D',w_principal,2,layered!)
w_plantraitdesc.title = "Description de plan de traitement"
end event

type cb_c from commandbutton within w_description
integer x = 576
integer y = 508
integer width = 288
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C"
end type

event clicked;opensheetwithparm(w_plantraitdesc,'C',w_principal,2,layered!)
w_plantraitdesc.title = "Description de plan de traitement"
end event

type cb_b from commandbutton within w_description
integer x = 288
integer y = 508
integer width = 288
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "B"
end type

event clicked;opensheetwithparm(w_plantraitdesc,'B',w_principal,2,layered!)
w_plantraitdesc.title = "Description de plan de traitement"
end event

type cb_a from commandbutton within w_description
integer y = 508
integer width = 288
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A"
end type

event clicked;opensheetwithparm(w_plantraitdesc,'A',w_principal,2,layered!)
w_plantraitdesc.title = "Description de plan de traitement"
end event

type mle_concl from multilineedit within w_description
integer x = 1792
integer y = 224
integer width = 1787
integer height = 276
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_description
integer x = 1705
integer y = 120
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Conclusion"
boolean focusrectangle = false
end type

event clicked;OpenSheet(w_introconc,w_principal,2,layered!)

end event

type st_2 from statictext within w_description
integer y = 120
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Introduction"
boolean focusrectangle = false
end type

event clicked;OpenSheet(w_introconc,w_principal,2,layered!)

end event

type mle_intro from multilineedit within w_description
integer y = 224
integer width = 1787
integer height = 276
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_description
integer y = 12
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Catégorie"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Categories:'
end if
end event

event clicked;OpenSheet(w_liste_descr,w_principal,2,layered!)

end event

type st_4 from statictext within w_description
integer x = 1705
integer y = 12
integer width = 201
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sujet"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Subject:'
end if
end event

event clicked;opensheet(w_sujet,w_principal,2,layered!)
w_sujet.title = 'Liste des sujets'

end event

type ddlb_cat from u_ddlb within w_description
integer x = 416
integer y = 4
integer width = 1088
integer height = 604
integer taborder = 20
integer textsize = -9
fontcharset fontcharset = ansi!
boolean allowedit = true
boolean sorted = false
boolean ib_rmbmenu = false
boolean ib_search = true
end type

event selectionchanged;call super::selectionchanged;
if change then
//	if error_type(200) = 1 then
		sauvegarde()
//	end if
end if

post uf_setTrait(long(of_getselecteddata()))
end event

type dw_plantrait from u_dw within w_description
integer y = 592
integer width = 3589
integer height = 1316
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_plantrait1"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
//	this.object.t_plan.text= 'Treatment plans'
//	this.object.t_desc.text= 'Description'
//	this.object.t_pres.text= 'Present'
end if
end event

event itemchanged;change = true
end event

event editchanged;change = true
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

event rbuttondown;string ls_description
//m_odonto my_menu
//my_menu = create m_odonto
//my_menu.popmenu (pointerx()+20, pointery()+725)

if dwo.name = 'description' then 
	dw_plantrait.acceptText()
	openwithparm(w_odonto,'d_odontomixte')
	ls_description = dw_plantrait.getItemString(dw_plantrait.getRow(),'description')
	if isnull(ls_description) then ls_description = ""
	is_odonto = message.stringparm
	ls_description += is_odonto
	dw_plantrait.setItem(dw_plantrait.getRow(),'description',ls_description)
end if
end event

event clicked;if dwo.name = 't_desc' then
	opensheetwithparm(w_plantraitdesc,'A',w_principal,2,layered!)
	w_plantraitdesc.title = "Description de plan de traitement"
end if
end event

type ddlb_sujet from u_ddlb within w_description
event ue_fillsujet ( )
integer x = 2080
integer width = 1422
integer height = 808
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
boolean allowedit = true
boolean sorted = false
boolean ib_rmbmenu = false
boolean ib_search = true
end type

event ue_fillsujet();string ls_sujet
long ll_idsujet

DECLARE listsujet CURSOR FOR
	select sujet, id_sujet from t_sujets where ortho_id = :v_no_ortho and actif = 1;

OPEN listsujet;

FETCH listsujet INTO :ls_sujet, :ll_idsujet;

DO WHILE SQLCA.SQLCode = 0
	
	of_additem(ls_sujet,ll_idsujet)
	FETCH listsujet INTO :ls_sujet, :ll_idsujet;
	
LOOP

CLOSE listsujet;

end event

event constructor;call super::constructor;long ll_idcontact,ll_idcatplan, ll_idsujet, ll_idintro, ll_idconcl, ll_typelettre, ll_cpt = 0
string ls_texte, ls_langue
n_cst_fusion luo_fusion

il_prov = message.doubleparm

// Aller chercher le numéro du patient

if il_prov = 1 then
	il_patid = w_dossier_patients.il_patid
else
	idtt_lettre = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getItemDateTime(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'id_lettre')
	select patient_id, id_sujet, id_intro, id_concl, typelettre
	into :il_patid, :ll_idsujet, :ll_idintro, :ll_idconcl, :ll_typelettre
	from t_histolettre where id_lettre = :idtt_lettre;	
end if

// Obtenir le numéro du contact
select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
ls_langue = gnv_app.of_getlangue()

// Retrieve de la datawindow Sujet

event ue_fillsujet()
if il_prov = 1 then
	of_selectItem(1)
	ll_idsujet = long(ddlb_sujet.of_getselecteddata())
else
	of_selectItem(ll_idsujet,0,false)
end if

// Retrieve de la datawindow cat
DECLARE curCat CURSOR FOR
  SELECT t_catplans.id_catplan,
         if :ls_langue = 'an' then t_catplans.catan else t_catplans.categorie endif
    FROM t_catplans
	WHERE t_catplans.id_sujet = :ll_idsujet
ORDER BY t_catplans.ordre ASC;

OPEN curCat;

FETCH curCat INTO :ll_idcatplan, :ls_texte;

do while SQLCA.SQLCode = 0

//	ls_texte = gf_fusion(ls_texte, ll_idcontact, 0)
	ddlb_cat.of_additem(ls_texte,ll_idcatplan)
	
	FETCH curCat INTO :ll_idcatplan, :ls_texte;
loop

CLOSE curCat;

ddlb_cat.of_selectItem(1)

// Retrieve de la datawindow intro
ddlb_intro.event ue_fillintro()
if il_prov = 1 then
	ddlb_intro.of_selectItem(1)
	ll_idintro = long(ddlb_intro.of_getselecteddata())
else
	ddlb_intro.of_selectItem(ll_idintro,0,false)
end if
select texte into :ls_texte from t_introconcl where id_introconcl = :ll_idintro;
mle_intro.text = luo_fusion.of_fusion(ls_texte,ll_idcontact,0)

// Retrieve de la datawindow concl

ddlb_concl.event ue_fillconcl()
if il_prov = 1 then
	ddlb_concl.of_selectItem(1)
	ll_idconcl = long(ddlb_concl.of_getselecteddata())
else
	ddlb_intro.of_selectItem(ll_idconcl,0,false)
end if
select texte into :ls_texte from t_introconcl where id_introconcl = :ll_idconcl;
mle_concl.text = luo_fusion.of_fusion(ls_texte,ll_idcontact,0)

// Retrouve les traitments de la catégorie

if ddlb_cat.TotalItems ( ) > 0 then
	ll_idcatplan = long(ddlb_cat.of_getselecteddata())
else
	ll_idcatplan = 0
end if

post uf_setTrait(ll_idcatplan)
end event

event selectionchanged;call super::selectionchanged;long ll_idcatplan, ll_idcontact, ll_id, ll_cpt = 0, ll_idsujet
string ls_text

ll_idsujet = long(ddlb_sujet.of_getselecteddata())
select id_contact into :ll_idcontact from patient where patient_id = :il_patid;

// Retrieve de la datawindow cat
ddlb_cat.setredraw(false)
ddlb_cat.of_reset()

DECLARE curCat CURSOR FOR
  SELECT t_catplans.id_catplan,
         t_catplans.categorie
    FROM t_catplans
	WHERE id_sujet = :ll_idsujet
ORDER BY t_catplans.ordre ASC;

OPEN curCat;

FETCH curCat INTO :ll_id, :ls_text;

do while SQLCA.SQLCode = 0

//	gf_fusion(ls_text, ll_idcontact, 0)
	ddlb_cat.of_additem(ls_text,ll_id)
	
	FETCH curCat INTO :ll_id, :ls_text;
loop

CLOSE curCat;
ddlb_cat.of_selectItem(1)

if ddlb_cat.TotalItems ( ) > 0 then
	ll_idcatplan = long(ddlb_cat.of_getselecteddata( ))
else
	ll_idcatplan = 0
end if
ddlb_cat.setRedraw(true)
post uf_setTrait(ll_idcatplan)

end event

type ddlb_concl from u_ddlb within w_description
event ue_fillconcl ( )
integer x = 2089
integer y = 108
integer width = 1088
integer height = 604
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
boolean allowedit = true
boolean sorted = false
boolean ib_rmbmenu = false
boolean ib_search = true
end type

event ue_fillconcl();string ls_titre
long ll_idintroconcl

DECLARE listintro CURSOR FOR
	select titre, id_introconcl from t_introconcl where typetexte = 'c' and ortho_id = :v_no_ortho and isnull(actif,0) = 1;

OPEN listintro;

FETCH listintro INTO :ls_titre, :ll_idintroconcl;

DO WHILE SQLCA.SQLCode = 0

	of_additem(ls_titre,ll_idintroconcl)
	
	FETCH listintro INTO :ls_titre, :ll_idintroconcl;

LOOP

CLOSE listintro;

end event

event selectionchanged;call super::selectionchanged;//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 24/10/2003
// Demande  : JMD
// Version  : 7.6.1
// Modifié par:
//	Modifié le :
//////////////////////////////////

long ll_id, ll_idcontact, ll_introconcl
string ls_texte
n_cst_fusion luo_fusion

ll_introconcl = long(of_getSelectedData())
select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
select texte into :ls_texte from t_introconcl where id_introconcl = :ll_introconcl;
mle_concl.text = luo_fusion.of_fusion(ls_texte,ll_idcontact,0)

end event

