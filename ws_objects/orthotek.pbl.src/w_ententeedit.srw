$PBExportHeader$w_ententeedit.srw
forward
global type w_ententeedit from w_child
end type
type ddlb_contrattype from dropdownlistbox within w_ententeedit
end type
type st_patient from statictext within w_ententeedit
end type
type st_phase from statictext within w_ententeedit
end type
type st_contact from statictext within w_ententeedit
end type
type st_pat from statictext within w_ententeedit
end type
type st_cont from statictext within w_ententeedit
end type
type st_phase1 from statictext within w_ententeedit
end type
type rb_preview from radiobutton within w_ententeedit
end type
type rb_edition from radiobutton within w_ententeedit
end type
type cb_print from commandbutton within w_ententeedit
end type
type cb_fusion from commandbutton within w_ententeedit
end type
type cb_3 from commandbutton within w_ententeedit
end type
type st_title from statictext within w_ententeedit
end type
type cb_update from commandbutton within w_ententeedit
end type
type cb_close from commandbutton within w_ententeedit
end type
type rte_corps from richtextedit within w_ententeedit
end type
end forward

global type w_ententeedit from w_child
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
string icon = "AppIcon!"
boolean ib_isupdateable = false
event ue_post_open ( )
ddlb_contrattype ddlb_contrattype
st_patient st_patient
st_phase st_phase
st_contact st_contact
st_pat st_pat
st_cont st_cont
st_phase1 st_phase1
rb_preview rb_preview
rb_edition rb_edition
cb_print cb_print
cb_fusion cb_fusion
cb_3 cb_3
st_title st_title
cb_update cb_update
cb_close cb_close
rte_corps rte_corps
end type
global w_ententeedit w_ententeedit

type variables
public string is_corps = ""
public boolean change = false
public long il_prov = 0
public datetime idtt_lettre
public long il_patid, il_idphase, il_idsujet, il_idcontact
private long il_idcontrattype[]
private string is_filename[]
private string is_corrpath
end variables

event ue_post_open();//datawindowchild ddwc_plancat

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

long ll_row, ll_idcontrattype
string ls_nomdoc, ls_pat, ls_cont, ls_phase, ls_nom, ls_prenom, ls_nomcontrat

select corrpath into :is_corrpath from t_options where ortho_id = :v_no_ortho;

CHOOSE CASE il_prov
	CASE 1
		// provient de la fenetre type de contrat edition
		ddlb_contrattype.enabled = false
		ls_nomdoc = w_contrattype.is_filename
		if isnull(ls_nomdoc) or ls_nomdoc = "" then
			// Demander le nom du document
			open(w_choosefile)
			ls_nomdoc = message.stringparm
			if isnull(ls_nomdoc) or ls_nomdoc = "" then
				close(w_ententeedit)
			end if
		end if
		w_contrattype.is_filename = ls_nomdoc
		rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
		//-------
		select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where patient_id = :il_patid;
		ls_pat = ls_prenom + ' ' + ls_nom
		select nom, prenom into :ls_nom, :ls_prenom from t_contact where id_contact = :il_idcontact;
		ls_cont = ls_prenom + ' ' + ls_nom
		select phase into :ls_phase from t_phase where id_phase = :il_idphase;
		//-------
//		dw_contrattype.visible = false
//		rb_edition.visible = false
//		rb_preview.visible = false
//		st_patient.visible = false
//		st_pat.visible = false
//		st_contact.visible = false
//		st_cont.visible = false
//		st_phase.visible = false
//		st_phase1.visible = false
		change = false
	CASE 2
		// provient du contrat ds le dossier patient
//		ls_nomdoc = dw_contrattype.getItemString(1,'filename')
		ls_nomdoc = is_filename[1]
		rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
		select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where patient_id = :il_patid;
		ls_pat = ls_prenom + ' ' + ls_nom
		select nom, prenom into :ls_nom, :ls_prenom from t_contact where id_contact = :il_idcontact;
		ls_cont = ls_prenom + ' ' + ls_nom
		select phase into :ls_phase from t_phase where id_phase = :il_idphase;
		change = true
	CASE 3
		// provient de l'historique correspondance
		ddlb_contrattype.enabled = false
		idtt_lettre = w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.getItemDateTime(w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.getRow(),'id_lettre')
		select patient_id, id_sujet, id_contact, id_phase, nomdoc, id_contrattype
		into :il_patid, :il_idsujet, :il_idcontact, :il_idphase, :ls_nomdoc, :ll_idcontrattype
		from t_histolettre where id_lettre = :idtt_lettre;
		rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
//		ll_row = dw_contrattype.find("id_contrattype = " + string(dw_contrattype.getItemNumber(dw_contrattype.getRow(),'id_contrattype')),1,dw_contrattype.rowcount())
//		dw_contrattype.scrolltoRow(ll_row)
//		dw_contrattype.enabled = false
		select nomcontrat into :ls_nomcontrat from t_contrattype where id_contrattype = :ll_idcontrattype;
		ddlb_contrattype.selectItem(ls_nomcontrat,1)
		select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where patient_id = :il_patid;
		ls_pat = ls_prenom + ' ' + ls_nom
		select nom, prenom into :ls_nom, :ls_prenom from t_contact where id_contact = :il_idcontact;
		ls_cont = ls_prenom + ' ' + ls_nom
		select phase into :ls_phase from t_phase where id_phase = :il_idphase;
		change = false
	CASE 4
		// provient de entente financière
		ls_nomdoc = is_filename[1]
		rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
		select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where patient_id = :il_patid;
		ls_pat = ls_prenom + ' ' + ls_nom
		select nom, prenom into :ls_nom, :ls_prenom from t_contact where id_contact = :il_idcontact;
		ls_cont = ls_prenom + ' ' + ls_nom
		select phase into :ls_phase from t_phase where id_phase = :il_idphase;
		change = true
END CHOOSE

st_patient.text = ls_pat
st_contact.text = ls_cont
st_phase.text = ls_phase
end event

on w_ententeedit.create
int iCurrent
call super::create
this.ddlb_contrattype=create ddlb_contrattype
this.st_patient=create st_patient
this.st_phase=create st_phase
this.st_contact=create st_contact
this.st_pat=create st_pat
this.st_cont=create st_cont
this.st_phase1=create st_phase1
this.rb_preview=create rb_preview
this.rb_edition=create rb_edition
this.cb_print=create cb_print
this.cb_fusion=create cb_fusion
this.cb_3=create cb_3
this.st_title=create st_title
this.cb_update=create cb_update
this.cb_close=create cb_close
this.rte_corps=create rte_corps
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_contrattype
this.Control[iCurrent+2]=this.st_patient
this.Control[iCurrent+3]=this.st_phase
this.Control[iCurrent+4]=this.st_contact
this.Control[iCurrent+5]=this.st_pat
this.Control[iCurrent+6]=this.st_cont
this.Control[iCurrent+7]=this.st_phase1
this.Control[iCurrent+8]=this.rb_preview
this.Control[iCurrent+9]=this.rb_edition
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_fusion
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.st_title
this.Control[iCurrent+14]=this.cb_update
this.Control[iCurrent+15]=this.cb_close
this.Control[iCurrent+16]=this.rte_corps
end on

on w_ententeedit.destroy
call super::destroy
destroy(this.ddlb_contrattype)
destroy(this.st_patient)
destroy(this.st_phase)
destroy(this.st_contact)
destroy(this.st_pat)
destroy(this.st_cont)
destroy(this.st_phase1)
destroy(this.rb_preview)
destroy(this.rb_edition)
destroy(this.cb_print)
destroy(this.cb_fusion)
destroy(this.cb_3)
destroy(this.st_title)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.rte_corps)
end on

type ddlb_contrattype from dropdownlistbox within w_ententeedit
integer x = 2021
integer y = 224
integer width = 1586
integer height = 672
integer taborder = 30
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
end type

event constructor;string ls_nomcontrat, ls_filename
long ll_idcontrattype, i

i = 1

DECLARE listtypecontrat CURSOR FOR
	select nomcontrat,
			 filename,
			 id_contrattype
	from   t_contrattype;
	
OPEN listtypecontrat;

FETCH listtypecontrat INTO :ls_nomcontrat, :ls_filename, :ll_idcontrattype;

DO WHILE SQLCA.SQLCode = 0
	
	addItem(ls_nomcontrat)
	il_idcontrattype[i] = ll_idcontrattype
	is_filename[i] = ls_filename
	i++
	FETCH listtypecontrat INTO :ls_nomcontrat, :ls_filename, :ll_idcontrattype;
LOOP
selectItem(1)

CLOSE listtypecontrat;


end event

event selectionchanged;string ls_filename

select filename into :ls_filename from t_contrattype where id_contrattype = :il_idcontrattype[index];
rte_corps.InsertDocument(is_corrpath + "\" + ls_filename, TRUE, FileTypeRichText!)
end event

type st_patient from statictext within w_ententeedit
integer x = 270
integer y = 248
integer width = 1659
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_phase from statictext within w_ententeedit
integer x = 270
integer y = 168
integer width = 1659
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_contact from statictext within w_ententeedit
integer x = 270
integer y = 96
integer width = 1659
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_pat from statictext within w_ententeedit
integer x = 9
integer y = 248
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Patient: "
boolean focusrectangle = false
end type

type st_cont from statictext within w_ententeedit
integer x = 5
integer y = 96
integer width = 256
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Contact: "
boolean focusrectangle = false
end type

type st_phase1 from statictext within w_ententeedit
integer x = 9
integer y = 168
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Phase: "
boolean focusrectangle = false
end type

type rb_preview from radiobutton within w_ententeedit
integer x = 3191
integer y = 116
integer width = 375
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aperçu"
end type

event clicked;string ls_corps
n_cst_fusion luo_fusion

//rte_corps.enabled = false
cb_fusion.enabled = false
//dw_contrattype.enabled = false
rte_corps.selecttextall()
is_corps = rte_corps.copyrtf()
ls_corps = is_corps
rte_corps.clear()
ls_corps = luo_fusion.of_fusion(ls_corps,il_idcontact,il_idphase)
rte_corps.pastertf(ls_corps)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Preview'
end if
end event

type rb_edition from radiobutton within w_ententeedit
integer x = 2843
integer y = 116
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Edition"
boolean checked = true
end type

event clicked;rte_corps.enabled = true
cb_fusion.enabled = true
//dw_contrattype.enabled = true
rte_corps.selecttextall()
rte_corps.clear()
rte_corps.pastertf(is_corps)
is_corps = ""
end event

event constructor;if v_langue = 'an' then
	this.text = 'Edit'
end if
end event

type cb_print from commandbutton within w_ententeedit
integer x = 5
integer y = 1932
integer width = 878
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;//////////////////////////////
//
// Créé par: Dave Tremblay
// Créé le : 05-08-2004
// Demande : Michel Lacourcière (Vente)
// Version : 7.8.4
// Modifié par: Dave Tremblay
// Modifié le: 05-08-2004
// 
////////////////////////////////

long ll_rmarge, ll_lmarge, ll_umarge, ll_dmarge
long ll_sujet, ll_idcontrattype
string ls_nomdoc, ls_part1, ls_part2, ls_part3

select rmarge, lmarge, umarge, dmarge into :ll_rmarge, :ll_lmarge, :ll_umarge, :ll_dmarge from t_options where ortho_id = :v_no_ortho;
select id_sujet into :ll_sujet from t_sujets where sujet = 'Contrat';
//ls_part1 = string(dw_contrattype.getItemNumber(dw_contrattype.getRow(),'id_contrattype'))
ls_part1 = string(il_idcontrattype[ddlb_contrattype.findItem(ddlb_contrattype.text,1)])
ll_idcontrattype = long(ls_part1)
ls_part2 = string(il_idcontact)
ls_part3 = string(il_idphase)
ls_nomdoc = ls_part1 + ls_part2 + ls_part3 + ".rtf"

// Modifier les marges

rte_corps.leftmargin = ll_lmarge
rte_corps.rightmargin = ll_rmarge
rte_corps.topmargin = ll_umarge
rte_corps.bottommargin = ll_dmarge
openwithparm(w_printdocument,'entente')

// Conserver la lettre dans l'historique

if il_prov = 3 then
	update t_histolettre set cdate = today(), cheure = now() where id_lettre = :idtt_lettre;
else
	insert into t_histolettre(patient_id,id_sujet,typelettre,cdate,cheure,nomdoc,id_contact,id_phase,id_contrattype)
	values(:il_patid,:ll_sujet,'c',today(),now(),:ls_nomdoc,:il_idcontact,:il_idphase,:ll_idcontrattype);
	error_type(-1)
end if
commit using SQLCA;
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_fusion from commandbutton within w_ententeedit
integer x = 2021
integer y = 104
integer width = 795
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insérer un champ de fusion"
end type

event clicked;m_insertinfo my_menu
my_menu = create m_insertinfo
message.powerObjectParm = this
rte_corps.setfocus()
my_menu.popmenu (x+pointerx(), y+pointery())
destroy my_menu

end event

event constructor;if v_langue = 'an' then
	this.text = 'Insert field'
end if
end event

type cb_3 from commandbutton within w_ententeedit
integer x = 882
integer y = 1932
integer width = 969
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type st_title from statictext within w_ententeedit
event ue_title ( )
integer width = 3607
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

event ue_title();string ls_prenom,ls_nom

choose case il_prov
	case 1
		if v_langue = 'an' then
		this.text = 'Edit financial agreement : ' + w_contrattype.dw_contrattype.getitemstring(w_contrattype.dw_contrattype.getrow(),'nomcontrat')
		else
			this.text = "Edition de l'entente financière : " + w_contrattype.dw_contrattype.getitemstring(w_contrattype.dw_contrattype.getrow(),'nomcontrat')
		end if
	case 2
		select prenom,nom into :ls_prenom,:ls_nom from t_contact where id_contact = :il_idcontact;
		if v_langue = 'an' then
			this.text = 'Financial agreement for ' + string(ls_prenom) + ' ' + string(ls_nom)
		else
			this.text = 'Entente financière de ' + string(ls_prenom) + ' ' + string(ls_nom)
		end if
	case 3
		select prenom,nom into :ls_prenom,:ls_nom from t_contact where id_contact = :il_idcontact;
		if v_langue = 'an' then
			this.text = 'Financial agreement for ' + string(ls_prenom) + ' ' + string(ls_nom)
		else
			this.text = 'Entente financière de ' + string(ls_prenom) + ' ' + string(ls_nom)
		end if
	case 4
		select prenom,nom into :ls_prenom,:ls_nom from t_contact where id_contact = :il_idcontact;
		if v_langue = 'an' then
			this.text = 'Financial agreement for ' + string(ls_prenom) + ' ' + string(ls_nom)
		else
			this.text = 'Entente financière de ' + string(ls_prenom) + ' ' + string(ls_nom)
		end if
end choose
end event

type cb_update from commandbutton within w_ententeedit
integer x = 1851
integer y = 1932
integer width = 914
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarder"
end type

event clicked;rte_corps.event ue_update()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_close from commandbutton within w_ententeedit
integer x = 2770
integer y = 1932
integer width = 846
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

event clicked;if change then
	if error_type(200) = 1 then
		rte_corps.event ue_update()
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type rte_corps from richtextedit within w_ententeedit
event ue_update ( )
integer y = 324
integer width = 3621
integer height = 1604
integer taborder = 20
string init_pointer = "Arrow!"
boolean init_vscrollbar = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
string init_documentname = "Lettre de correspondance"
borderstyle borderstyle = stylelowered!
end type

event ue_update();//long ll_count
string ls_nomfich
string ls_part1, ls_part2, ls_part3

//if change then
	if rb_preview.checked then
		rb_edition.event clicked()
		rb_edition.checked = true
		is_corps = ""
	end if
	CHOOSE CASE il_prov
		CASE 1
			ls_nomfich = w_contrattype.is_filename
			w_contrattype.dw_contrattype.setItem(w_contrattype.dw_contrattype.getRow(),'filename',ls_nomfich)
			w_contrattype.change = true
			w_contrattype.dw_contrattype.event ue_update()
		CASE 2
			ls_part1 = string(il_idcontrattype[ddlb_contrattype.findItem(ddlb_contrattype.text,1)])
//			ls_part1 = string(dw_contrattype.getItemNumber(dw_contrattype.getRow(),'id_contrattype'))
			ls_part2 = string(il_idcontact)
			ls_part3 = string(il_idphase)
			ls_nomfich = ls_part1 + ls_part2 + ls_part3 + ".rtf"
		CASE 3
			ls_part1 = string(il_idcontrattype[ddlb_contrattype.findItem(ddlb_contrattype.text,1)])
//			ls_part1 = string(dw_contrattype.getItemNumber(dw_contrattype.getRow(),'id_contrattype'))
			ls_part2 = string(il_idcontact)
			ls_part3 = string(il_idphase)
			ls_nomfich = ls_part1 + ls_part2 + ls_part3 + ".rtf"
	END CHOOSE
	rte_corps.SaveDocument(is_corrpath + "\" + ls_nomfich , FileTypeRichText!)
	change = false
//end if
end event

event key;change = true
end event

