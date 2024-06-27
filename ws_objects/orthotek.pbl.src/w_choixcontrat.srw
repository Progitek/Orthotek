$PBExportHeader$w_choixcontrat.srw
forward
global type w_choixcontrat from w_response
end type
type dw_listcontrat from u_dw within w_choixcontrat
end type
type st_nompat from statictext within w_choixcontrat
end type
type st_contract from statictext within w_choixcontrat
end type
type cb_apply from commandbutton within w_choixcontrat
end type
type cb_close from commandbutton within w_choixcontrat
end type
end forward

global type w_choixcontrat from w_response
integer x = 214
integer y = 221
integer width = 1413
integer height = 996
boolean titlebar = false
boolean controlmenu = false
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_listcontrat dw_listcontrat
st_nompat st_nompat
st_contract st_contract
cb_apply cb_apply
cb_close cb_close
end type
global w_choixcontrat w_choixcontrat

type variables
private long il_patid
end variables

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	st_contract.text = "Contract for:"
	cb_apply.text = "Apply"
	cb_close.text = "Cancel"
end if
end subroutine

on w_choixcontrat.create
int iCurrent
call super::create
this.dw_listcontrat=create dw_listcontrat
this.st_nompat=create st_nompat
this.st_contract=create st_contract
this.cb_apply=create cb_apply
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_listcontrat
this.Control[iCurrent+2]=this.st_nompat
this.Control[iCurrent+3]=this.st_contract
this.Control[iCurrent+4]=this.cb_apply
this.Control[iCurrent+5]=this.cb_close
end on

on w_choixcontrat.destroy
call super::destroy
destroy(this.dw_listcontrat)
destroy(this.st_nompat)
destroy(this.st_contract)
destroy(this.cb_apply)
destroy(this.cb_close)
end on

event open;call super::open;string ls_patnom

il_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientchoixcontrat") )
select isnull(patient_nom,'') || ' ' || isnull(patient_prenom,'') into :ls_patnom 
from patient
where patient_id = :il_patid;

st_nompat.text = ls_patnom

dw_listcontrat.retrieve(il_patid)
end event

type dw_listcontrat from u_dw within w_choixcontrat
integer x = 5
integer y = 92
integer width = 1385
integer height = 768
integer taborder = 10
string dataobject = "d_choixcontrat"
end type

event clicked;call super::clicked;if row > 0 then
	selectRow(0,false)
	selectRow(row,true)
end if
end event

type st_nompat from statictext within w_choixcontrat
integer x = 430
integer y = 12
integer width = 901
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_contract from statictext within w_choixcontrat
integer x = 9
integer y = 12
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contrat de: "
boolean focusrectangle = false
end type

type cb_apply from commandbutton within w_choixcontrat
integer x = 5
integer y = 868
integer width = 562
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
end type

event clicked;long ll_patid, ll_contid, ll_phaseid, ll_state

ll_state = dw_listcontrat.getItemNumber(dw_listcontrat.getRow(),'t_contrats_inuse')
if ll_state = 0 then
	ll_patid = dw_listcontrat.getItemNumber(dw_listcontrat.getRow(),'t_contrats_patient_id')
	ll_contid = dw_listcontrat.getItemNumber(dw_listcontrat.getRow(),'t_contrats_id_contact')
	ll_phaseid = dw_listcontrat.getItemNumber(dw_listcontrat.getRow(),'t_contrats_id_phase')
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientcontrat", ll_patid)
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactcontrat", ll_contid)
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("phasecontrat", ll_phaseid)
	close(parent)
else
	messagebox("sdf","Deja appliquer")
end if
end event

type cb_close from commandbutton within w_choixcontrat
integer x = 832
integer y = 868
integer width = 562
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientcontrat", 0)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactcontrat", 0)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("phasecontrat", 0)
close(parent)
end event

