$PBExportHeader$w_dosspatselectdent.srw
forward
global type w_dosspatselectdent from window
end type
type sle_rech from singlelineedit within w_dosspatselectdent
end type
type dw_dentistslist from u_dw within w_dosspatselectdent
end type
type cb_cancel from commandbutton within w_dosspatselectdent
end type
type cb_insert from commandbutton within w_dosspatselectdent
end type
end forward

global type w_dosspatselectdent from window
integer width = 1399
integer height = 1772
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
sle_rech sle_rech
dw_dentistslist dw_dentistslist
cb_cancel cb_cancel
cb_insert cb_insert
end type
global w_dosspatselectdent w_dosspatselectdent

on w_dosspatselectdent.create
this.sle_rech=create sle_rech
this.dw_dentistslist=create dw_dentistslist
this.cb_cancel=create cb_cancel
this.cb_insert=create cb_insert
this.Control[]={this.sle_rech,&
this.dw_dentistslist,&
this.cb_cancel,&
this.cb_insert}
end on

on w_dosspatselectdent.destroy
destroy(this.sle_rech)
destroy(this.dw_dentistslist)
destroy(this.cb_cancel)
destroy(this.cb_insert)
end on

type sle_rech from singlelineedit within w_dosspatselectdent
integer x = 14
integer y = 8
integer width = 1349
integer height = 112
integer taborder = 10
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
	sle_rech.setfocus()	
else
	sle_rech.setfocus()	
end if
end event

type dw_dentistslist from u_dw within w_dosspatselectdent
integer x = 14
integer y = 136
integer width = 1349
integer height = 1488
integer taborder = 10
string title = "dentistslist"
string dataobject = "d_dentistslist"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetFilter("actif = 1")
Retrieve(v_no_ortho)
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

type cb_cancel from commandbutton within w_dosspatselectdent
integer x = 745
integer y = 1636
integer width = 617
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_insert from commandbutton within w_dosspatselectdent
integer x = 14
integer y = 1636
integer width = 617
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;long ll_iddentist
string ls_sal,ls_drprenom,ls_drnom

ll_iddentist = dw_dentistslist.getitemnumber(dw_dentistslist.getrow(),'id_dentist')
choose case w_dossier_patients.ii_index
	case 4
		if ll_iddentist > 0 then
			update patient set id_dentist = :ll_iddentist where patient_id = :message.doubleparm;
			commit;
		end if
	case 11
		w_dossier_patients.tab_dosspat.tabpage_rappre.dw_rapppre.setItem(w_dossier_patients.tab_dosspat.tabpage_rappre.dw_rapppre.getRow(),'t_consultations_id_dentist',ll_iddentist)
		w_dossier_patients.tab_dosspat.tabpage_rappre.dw_rapppre.event ue_update()
		w_dossier_patients.tab_dosspat.tabpage_rappre.dw_rapppre.event ue_affinfo()
//		select salutation,det_prenom,det_nom into :ls_sal,:ls_drprenom,:ls_drnom from t_dentists inner join t_salutation on t_dentists.id_sal = t_salutation.id_sal where id_dentist = :ll_iddentist;
//		w_dossier_patients.is_spec = ls_sal+' '+ls_drprenom+' '+ls_drnom
//		if v_langue = 'an' then
//			w_dossier_patients.tab_dosspat.tabpage_rappre.dw_rapppre.object.t_title.text = "PRELIMINARY REPORT FOR : " +upper(ls_sal+' '+ls_drprenom+' '+ls_drnom)
//		else
//			w_dossier_patients.tab_dosspat.tabpage_rappre.dw_rapppre.object.t_title.text = "RAPPORT PRÉLIMINAIRE POUR : " +upper(ls_sal+' '+ls_drprenom+' '+ls_drnom)
//		end if
	case 12
		w_dossier_patients.tab_dosspat.tabpage_traitreq.dw_traitreq.setItem(w_dossier_patients.tab_dosspat.tabpage_traitreq.dw_traitreq.getRow(),'t_consultations_id_dentist',ll_iddentist)
//		w_dossier_patients.tab_dosspat.tabpage_traitreq.dw_traitreq.event ue_update()
//		w_dossier_patients.tab_dosspat.tabpage_traitreq.dw_traitreq.event ue_affinfo()
//		select salutation,det_prenom,det_nom into :ls_sal,:ls_drprenom,:ls_drnom from t_dentists inner join t_salutation on t_dentists.id_sal = t_salutation.id_sal where id_dentist = :ll_iddentist;
//		w_dossier_patients.is_spec = ls_sal+' '+ls_drprenom+' '+ls_drnom
//		if v_langue = 'an' then
//			w_dossier_patients.tab_dosspat.tabpage_traitreq.dw_traitreq.object.t_title.text = "REQUIRED TREATMENT FOR : " +upper(ls_sal+' '+ls_drprenom+' '+ls_drnom)
//		else
//			w_dossier_patients.tab_dosspat.tabpage_traitreq.dw_traitreq.object.t_title.text = "TRAITEMENT REQUIS POUR : " +upper(ls_sal+' '+ls_drprenom+' '+ls_drnom)
//		end if
end choose
close(parent)
end event

