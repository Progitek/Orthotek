$PBExportHeader$w_corpslettre.srw
forward
global type w_corpslettre from w_child
end type
type rb_preview from radiobutton within w_corpslettre
end type
type rb_edition from radiobutton within w_corpslettre
end type
type cb_print from commandbutton within w_corpslettre
end type
type rte_corps from richtextedit within w_corpslettre
end type
type cb_fusion from commandbutton within w_corpslettre
end type
type dw_sujet from u_dw within w_corpslettre
end type
type st_3 from statictext within w_corpslettre
end type
type cb_3 from commandbutton within w_corpslettre
end type
type st_1 from statictext within w_corpslettre
end type
type cb_update from commandbutton within w_corpslettre
end type
type cb_close from commandbutton within w_corpslettre
end type
end forward

global type w_corpslettre from w_child
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
rb_preview rb_preview
rb_edition rb_edition
cb_print cb_print
rte_corps rte_corps
cb_fusion cb_fusion
dw_sujet dw_sujet
st_3 st_3
cb_3 cb_3
st_1 st_1
cb_update cb_update
cb_close cb_close
end type
global w_corpslettre w_corpslettre

type variables
public string is_corps = ""
public boolean change = false
public long il_prov = 0
public datetime idtt_lettre
public long il_patid = 0
public long il_idsujet = 0
private string is_corrpath
private boolean ib_addtohistory = false
end variables

on w_corpslettre.create
int iCurrent
call super::create
this.rb_preview=create rb_preview
this.rb_edition=create rb_edition
this.cb_print=create cb_print
this.rte_corps=create rte_corps
this.cb_fusion=create cb_fusion
this.dw_sujet=create dw_sujet
this.st_3=create st_3
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_update=create cb_update
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_preview
this.Control[iCurrent+2]=this.rb_edition
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.rte_corps
this.Control[iCurrent+5]=this.cb_fusion
this.Control[iCurrent+6]=this.dw_sujet
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_update
this.Control[iCurrent+11]=this.cb_close
end on

on w_corpslettre.destroy
call super::destroy
destroy(this.rb_preview)
destroy(this.rb_edition)
destroy(this.cb_print)
destroy(this.rte_corps)
destroy(this.cb_fusion)
destroy(this.dw_sujet)
destroy(this.st_3)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_update)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type rb_preview from radiobutton within w_corpslettre
integer x = 1289
integer y = 156
integer width = 402
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

event clicked;long ll_idcontact
string ls_corps
n_cst_fusion luo_fusion

cb_update.enabled = false
cb_fusion.enabled = false
rte_corps.selecttextall()
is_corps = rte_corps.copyrtf()
ls_corps = is_corps
rte_corps.clear()
select id_contact into :ll_idcontact from patient where patient_id = :w_patient.il_patid;
ls_corps = luo_fusion.of_fusion(ls_corps,ll_idcontact,0)
rte_corps.pastertf(ls_corps)
//change = true
end event

event constructor;if v_langue = 'an' then
	this.text = "Preview"
end if
end event

type rb_edition from radiobutton within w_corpslettre
integer x = 777
integer y = 156
integer width = 402
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

event clicked;cb_update.enabled = true
cb_fusion.enabled = true
rte_corps.selecttextall()
rte_corps.clear()
rte_corps.pastertf(is_corps)
is_corps = ""
//change = true
end event

event constructor;if v_langue = 'an' then
	this.text = "Edit"
end if
end event

type cb_print from commandbutton within w_corpslettre
integer y = 1920
integer width = 882
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

event clicked;long ll_rmarge, ll_lmarge, ll_umarge, ll_dmarge

select rmarge, lmarge, umarge, dmarge into :ll_rmarge, :ll_lmarge, :ll_umarge, :ll_dmarge from t_options where ortho_id = :v_no_ortho;

rte_corps.leftmargin = ll_lmarge
rte_corps.rightmargin = ll_rmarge
rte_corps.topmargin = ll_umarge
rte_corps.bottommargin = ll_dmarge
openwithparm(w_printdocument,'lettre')
end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type rte_corps from richtextedit within w_corpslettre
event ue_update ( )
integer y = 248
integer width = 3607
integer height = 1664
integer taborder = 20
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
integer init_undodepth = 1
long init_leftmargin = 1
long init_topmargin = 1
long init_rightmargin = 1
long init_bottommargin = 1
string init_documentname = "Lettre de correspondance"
borderstyle borderstyle = stylelowered!
end type

event ue_update();long ll_count
string ls_nomfich

//if change then
	if rb_preview.checked then
		rb_edition.event clicked()
		rb_edition.checked = true
		is_corps = ""
	end if
	
	CHOOSE CASE il_prov
			
		// Cas de la lettre type
		CASE 1
			select nomdoc into :ls_nomfich from t_typelettre where id_sujet = :il_idsujet;
			if isnull(ls_nomfich) or ls_nomfich = "" then
				ls_nomfich = string(il_idsujet) + ".rtf"
				insert into t_typelettre values(:il_idsujet,:ls_nomfich);
				if error_type(-1) = 1 then
					commit using SQLCA;
				else
					rollback using SQLCA;
				end if
			end if
			
			if rte_corps.SaveDocument(is_corrpath + "\" + ls_nomfich , FileTypeRichText!) = -1 then
				if v_langue = 'an' then
					messagebox('Folder not found :',is_corrpath,Information!)
				else
					messagebox('Répertoire introuvable :',is_corrpath,Information!)
				end if
			end if
			
		// Cas de l'edition de la lettre du patient
		CASE 2
			ls_nomfich = string(il_idsujet) + string(il_patid) + ".rtf"
			if not ib_addtohistory then
				insert into t_histolettre(patient_id,id_sujet,cdate,cheure,typelettre,nomdoc)
				values(:w_patient.il_patid,:il_idsujet,today(),now(),1,:ls_nomfich);
				if error_type(-1) = 1 then
					commit using SQLCA;
					ib_addtohistory = true
				else
					rollback using SQLCA;
					error_type(50)
				end if
			end if
			if rte_corps.SaveDocument(is_corrpath + "\" + ls_nomfich , FileTypeRichText!) = -1 then
				if v_langue = 'an' then
					messagebox('Folder not found :',is_corrpath,Information!)
				else
					messagebox('Répertoire introuvable :',is_corrpath,Information!)
				end if
			end if
			
		// Cas de la lettre en historique
		CASE 3
			select nomdoc into :ls_nomfich from t_histolettre where id_lettre = :idtt_lettre;
			if rte_corps.SaveDocument(is_corrpath + "\" + ls_nomfich , FileTypeRichText!) = -1 then
				if v_langue = 'an' then
					messagebox('Folder not found :',is_corrpath,Information!)
				else
					messagebox('Répertoire introuvable :',is_corrpath,Information!)
				end if
			end if
			
			update t_histolettre set cdate = today(), cheure = now() where id_lettre = :idtt_lettre;
			if error_type(-1) = 1 then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
	END CHOOSE
//end if

//rafraichir l'historique
if isvalid(w_dossier_patients) then
	w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.Retrieve(w_dossier_patients.il_patid)
end if
end event

event key;change = true
end event

event fileexists;RETURN 0  // File is saved


end event

type cb_fusion from commandbutton within w_corpslettre
integer y = 128
integer width = 603
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Champs de fusion"
end type

event clicked;m_insertinfo my_menu
my_menu = create m_insertinfo
message.powerObjectParm = this
rte_corps.setfocus()
my_menu.popmenu (x+pointerx(), y+pointery())
destroy my_menu

end event

event constructor;if v_langue = 'an' then
	this.text = "Insert Field"
end if
end event

type dw_sujet from u_dw within w_corpslettre
integer x = 2107
integer y = 148
integer width = 1499
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "d_sujet"
boolean border = false
end type

event constructor;datawindowchild ddwc_plancat
long ll_row
string ls_nomdoc

il_prov = message.doubleparm
select corrpath into :is_corrpath from t_options where ortho_id = :v_no_ortho;
setTransObject(SQLCA)
retrieve(v_no_ortho)
CHOOSE CASE il_prov
	CASE 1
		il_patid = w_patient.il_patid
		il_idsujet = getItemNumber(1,'id_sujet')
		select nomdoc into :ls_nomdoc from t_typelettre where id_sujet = :il_idsujet;
		if isnull(ls_nomdoc) then
			rte_corps.InsertDocument(is_corrpath + "\", TRUE, FileTypeRichText!)
			change = false
		else
			rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
			change = false
		end if
	CASE 2
		il_patid = w_dossier_patients.il_patid
		il_idsujet = getItemNumber(1,'id_sujet')
		select nomdoc into :ls_nomdoc from t_typelettre where id_sujet = :il_idsujet;
		if isnull(ls_nomdoc) then
			rte_corps.InsertDocument(is_corrpath + "\", TRUE, FileTypeRichText!)
			change = false
		else
			rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
			change = false
		end if
	CASE 3
		idtt_lettre = w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.getItemDateTime(w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.getRow(),'id_lettre')
		select patient_id, id_sujet, nomdoc
		into :il_patid, :il_idsujet, :ls_nomdoc
		from t_histolettre where id_lettre = :idtt_lettre;
		rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
		change = false
		ll_row = find("id_sujet = " + string(il_idsujet),1,rowcount())
		scrolltoRow(ll_row)
		dw_sujet.enabled = false
END CHOOSE
end event

event itemchanged;string ls_nomdoc

il_idsujet = long(data)
select nomdoc into :ls_nomdoc from t_typelettre where id_sujet = :il_idsujet;
if isnull(ls_nomdoc) then
	rte_corps.InsertDocument(is_corrpath + "\", TRUE, FileTypeRichText!)
	change = false
else
	rte_corps.InsertDocument(is_corrpath + "\" + ls_nomdoc, TRUE, FileTypeRichText!)
	change = false
end if

end event

event clicked;if change then
	rte_corps.event ue_update()
end if
end event

type st_3 from statictext within w_corpslettre
integer x = 1865
integer y = 160
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sujet"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Subject"
end if
end event

type cb_3 from commandbutton within w_corpslettre
integer x = 1801
integer y = 1920
integer width = 965
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type st_1 from statictext within w_corpslettre
integer width = 1833
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Lettre de correspondance"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Correspondance letter"
end if
end event

type cb_update from commandbutton within w_corpslettre
integer x = 882
integer y = 1920
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
	this.text = "Save"
end if
end event

type cb_close from commandbutton within w_corpslettre
integer x = 2770
integer y = 1920
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
	rte_corps.event ue_update()
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

