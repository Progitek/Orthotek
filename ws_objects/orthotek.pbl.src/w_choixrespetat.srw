$PBExportHeader$w_choixrespetat.srw
forward
global type w_choixrespetat from w_response
end type
type st_1 from statictext within w_choixrespetat
end type
type ddlb_resp from u_ddlb within w_choixrespetat
end type
type cb_annuler from commandbutton within w_choixrespetat
end type
type cb_select from commandbutton within w_choixrespetat
end type
type rr_1 from roundrectangle within w_choixrespetat
end type
end forward

global type w_choixrespetat from w_response
integer width = 1285
integer height = 752
boolean titlebar = false
boolean controlmenu = false
long backcolor = 67108864
boolean center = true
st_1 st_1
ddlb_resp ddlb_resp
cb_annuler cb_annuler
cb_select cb_select
rr_1 rr_1
end type
global w_choixrespetat w_choixrespetat

type variables
public long il_patid
end variables

on w_choixrespetat.create
int iCurrent
call super::create
this.st_1=create st_1
this.ddlb_resp=create ddlb_resp
this.cb_annuler=create cb_annuler
this.cb_select=create cb_select
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.ddlb_resp
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_select
this.Control[iCurrent+5]=this.rr_1
end on

on w_choixrespetat.destroy
call super::destroy
destroy(this.st_1)
destroy(this.ddlb_resp)
destroy(this.cb_annuler)
destroy(this.cb_select)
destroy(this.rr_1)
end on

type st_1 from statictext within w_choixrespetat
integer x = 46
integer y = 20
integer width = 841
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Veuillez choisir un responsable"
boolean focusrectangle = false
end type

type ddlb_resp from u_ddlb within w_choixrespetat
integer x = 9
integer y = 108
integer width = 1257
integer height = 504
integer taborder = 20
end type

event constructor;call super::constructor;long i, ll_idresp
string ls_contact

il_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientidchoixresp"))

// Ajout du choix tous

of_addItem("Tous",0)

// Ajout des responsables

DECLARE listresp CURSOR FOR
	SELECT id_contact, prenom + ' ' + nom from t_contact where patient_id = :il_patid;
	
OPEN listresp;

FETCH listresp INTO :ll_idresp, :ls_contact;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_contact,ll_idresp)
	FETCH listresp INTO :ll_idresp, :ls_contact;
	
LOOP

CLOSE listresp;

of_selectItem(1)
end event

type cb_annuler from commandbutton within w_choixrespetat
integer x = 709
integer y = 636
integer width = 562
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("idreponsableetat",-1)
close(parent)
end event

type cb_select from commandbutton within w_choixrespetat
integer x = 5
integer y = 636
integer width = 562
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Selectionner"
end type

event clicked;long ll_idresp

ll_idresp = long(ddlb_resp.of_getselecteddata( ))
gnv_app.inv_entrepotglobal.of_ajoutedonnee("idreponsableetat",ll_idresp)
close(parent)
end event

type rr_1 from roundrectangle within w_choixrespetat
integer linethickness = 4
long fillcolor = 16777215
integer x = 9
integer y = 8
integer width = 1253
integer height = 84
integer cornerheight = 40
integer cornerwidth = 46
end type

