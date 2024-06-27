$PBExportHeader$w_chcontact.srw
forward
global type w_chcontact from w_response
end type
type cb_ok from u_cb within w_chcontact
end type
type cb_annul from u_cb within w_chcontact
end type
type st_titre from statictext within w_chcontact
end type
type ddlb_contrat from u_ddlb within w_chcontact
end type
end forward

global type w_chcontact from w_response
integer width = 2258
integer height = 504
boolean ib_isupdateable = false
cb_ok cb_ok
cb_annul cb_annul
st_titre st_titre
ddlb_contrat ddlb_contrat
end type
global w_chcontact w_chcontact

on w_chcontact.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_annul=create cb_annul
this.st_titre=create st_titre
this.ddlb_contrat=create ddlb_contrat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_annul
this.Control[iCurrent+3]=this.st_titre
this.Control[iCurrent+4]=this.ddlb_contrat
end on

on w_chcontact.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_annul)
destroy(this.st_titre)
destroy(this.ddlb_contrat)
end on

type cb_ok from u_cb within w_chcontact
integer x = 1522
integer y = 320
integer taborder = 30
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Ok"
end type

event clicked;call super::clicked;closewithreturn(parent, long(ddlb_contrat.of_getSelectedData()))

end event

type cb_annul from u_cb within w_chcontact
integer x = 1874
integer y = 320
integer taborder = 20
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;call super::clicked;closewithreturn(parent, -1)

end event

type st_titre from statictext within w_chcontact
integer x = 14
integer y = 12
integer width = 713
integer height = 88
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choix du contrat"
boolean focusrectangle = false
end type

type ddlb_contrat from u_ddlb within w_chcontact
integer x = 14
integer y = 120
integer width = 2226
integer height = 304
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;string ls_ids, ls_nom
long ll_patient, ll_phase, ll_contact

ls_ids = message.stringParm

ll_patient = long(left(ls_ids, pos(ls_ids, '~t') - 1))
ll_phase = long(mid(ls_ids, pos(ls_ids, '~t') + 1))

of_setsorted('')
of_additem('Total', 0)

declare curContrats cursor for
	select isnull(nom, '') || ', ' || isnull(prenom, '') as n,
			 t_contact.id_contact
	  from t_contact inner join t_contrats on t_contrats.id_contact = t_contact.id_contact
	 where t_contrats.patient_id = :ll_patient
		and t_contrats.id_phase = :ll_phase
 order by n asc;

open curContrats;

fetch curContrats into :ls_nom, :ll_contact;

do while SQLCA.SQLCode = 0
	of_additem(ls_nom, ll_contact)
	
	fetch curContrats into :ls_nom, :ll_contact;
loop

close curContrats;

if totalItems() > 0 then of_selectItem(1)

end event

