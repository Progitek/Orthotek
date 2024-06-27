$PBExportHeader$w_membfamille.srw
forward
global type w_membfamille from window
end type
type st_title from statictext within w_membfamille
end type
type dw_famille from u_dw within w_membfamille
end type
type cb_cancel from commandbutton within w_membfamille
end type
type cb_insert from commandbutton within w_membfamille
end type
end forward

global type w_membfamille from window
integer width = 1623
integer height = 1304
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_title st_title
dw_famille dw_famille
cb_cancel cb_cancel
cb_insert cb_insert
end type
global w_membfamille w_membfamille

type variables
private long il_idfamille
end variables

event open;il_idfamille = message.doubleparm
if il_idfamille > 0 then
	dw_famille.Retrieve(il_idfamille)
end if
end event

on w_membfamille.create
this.st_title=create st_title
this.dw_famille=create dw_famille
this.cb_cancel=create cb_cancel
this.cb_insert=create cb_insert
this.Control[]={this.st_title,&
this.dw_famille,&
this.cb_cancel,&
this.cb_insert}
end on

on w_membfamille.destroy
destroy(this.st_title)
destroy(this.dw_famille)
destroy(this.cb_cancel)
destroy(this.cb_insert)
end on

type st_title from statictext within w_membfamille
integer x = 14
integer y = 32
integer width = 1582
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Membre de la famille"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Family member'
end if
end event

type dw_famille from u_dw within w_membfamille
integer x = 14
integer y = 176
integer width = 1582
integer height = 944
integer taborder = 10
string title = "famille"
string dataobject = "d_famille"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
end event

event doubleclicked;long ll_patid

ll_patid = getItemNumber(row,'patient_id')
close(w_dossier_patients)
Opensheetwithparm(w_dossier_patients,ll_patid,w_principal,2,layered!)
w_dossier_patients.title = 'Dossier du patient'
end event

type cb_cancel from commandbutton within w_membfamille
integer x = 942
integer y = 1144
integer width = 654
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_insert from commandbutton within w_membfamille
integer x = 14
integer y = 1144
integer width = 677
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;string ls_adresse, ls_ville, ls_prov, ls_zip, ls_telres
long ll_idsat, ll_iddent, ll_ortho, ll_refid, ll_retour
string ls_email, ls_langue, ls_telbur, ls_ext1, ls_ext2
string ls_ext3, ls_ext4, ls_nom_mere, ls_nom_pere, ls_tel_mere, ls_tel_pere

if il_idfamille <= 0 or isnull(il_idfamille) then
	select max(id_famille) into :il_idfamille from patient;
	if isnull(il_idfamille) or il_idfamille = 0 then
		il_idfamille = 1
	else
		il_idfamille++
	end if
end if
update patient set id_famille = :il_idfamille where patient_id = :w_dossier_patients.il_patid;
select adresse, ville, province, code_postale, tel_maison, id_satellite, email, id_dentist, langue, no_ortho, referant_nom, tel_bureau, text1, text2, text3, text4, nom_pere, nom_mere, no_tel_pere, no_tel_mere
into :ls_adresse, :ls_ville, :ls_prov, :ls_zip, :ls_telres, :ll_idsat, :ls_email, :ll_iddent, :ls_langue, :ll_ortho, :ll_refid, :ls_telbur, :ls_ext1, :ls_ext2, :ls_ext3, :ls_ext4, :ls_nom_pere, :ls_nom_mere, :ls_tel_pere, :ls_tel_mere
from patient where patient_id = :w_dossier_patients.il_patid;
w_dossier_patients.cb_insert.event clicked() 
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'id_famille',il_idfamille)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'adresse',ls_adresse)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'ville',ls_ville)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'province',ls_prov)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'code_postale',ls_zip)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'tel_maison',ls_telres)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'no_tel_mere',ls_tel_mere)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'no_tel_pere',ls_tel_pere)

ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'nom_mere',ls_nom_mere)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'nom_pere',ls_nom_pere)

ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'id_satellite',ll_idsat)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'email',ls_email)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'id_dentist',ll_iddent)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'langue',ls_langue)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'no_ortho',ll_ortho)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'referant_nom',ll_refid)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'tel_bureau',ls_telbur)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'text1',ls_ext1)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'text2',ls_ext2)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'text3',ls_ext3)
ll_retour = w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.setItem(w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.getRow(),'text4',ls_ext4)
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

