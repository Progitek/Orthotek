$PBExportHeader$w_sysdebugrdv.srw
forward
global type w_sysdebugrdv from window
end type
type cb_correction from commandbutton within w_sysdebugrdv
end type
type cb_close from commandbutton within w_sysdebugrdv
end type
type dw_sysdebugrdv from datawindow within w_sysdebugrdv
end type
type cb_1 from commandbutton within w_sysdebugrdv
end type
end forward

global type w_sysdebugrdv from window
integer width = 3671
integer height = 2408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_correction cb_correction
cb_close cb_close
dw_sysdebugrdv dw_sysdebugrdv
cb_1 cb_1
end type
global w_sysdebugrdv w_sysdebugrdv

on w_sysdebugrdv.create
this.cb_correction=create cb_correction
this.cb_close=create cb_close
this.dw_sysdebugrdv=create dw_sysdebugrdv
this.cb_1=create cb_1
this.Control[]={this.cb_correction,&
this.cb_close,&
this.dw_sysdebugrdv,&
this.cb_1}
end on

on w_sysdebugrdv.destroy
destroy(this.cb_correction)
destroy(this.cb_close)
destroy(this.dw_sysdebugrdv)
destroy(this.cb_1)
end on

type cb_correction from commandbutton within w_sysdebugrdv
integer x = 869
integer y = 2172
integer width = 864
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Corriger rdv"
end type

event clicked;long i,ll_traitid,ll_patid,ll_nb
integer li_duree,li_count
date ldt_rdv
time lt_rdv

w_progressbar iw_progressbar
open(iw_progressbar)
iw_progressbar.title = 'Correction de la liste des rendez-vous'
iw_progressbar.of_tache('Rechercher les rendez-vous à corriger.')


ll_nb = dw_sysdebugrdv.rowcount()
iw_progressbar.of_tache('Il y a ' + string(ll_nb) + ' rendez-vous a corriger')
iw_progressbar.of_max(ll_nb)
for i = 1 to ll_nb
	iw_progressbar.of_position(i)
	ldt_rdv = dw_sysdebugrdv.getitemdate(i,'datecal')
	lt_rdv = dw_sysdebugrdv.getitemtime(i,'heure')
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_1')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree1')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count1')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid1')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne) 
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,1);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_2')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree2')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count2')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid2')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,2);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_3')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree3')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count3')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid3')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,3);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_4')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree4')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count4')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid4')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,4);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_5')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree5')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count5')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid5')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,5);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_6')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree6')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count6')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid6')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,6);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_7')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree7')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count7')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid7')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,7);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_8')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree8')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count8')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid8')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,8);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_9')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree9')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count9')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid9')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,9);
	end if
	ll_patid = dw_sysdebugrdv.getitemnumber(i,'patient_id_10')
	li_duree = dw_sysdebugrdv.getitemnumber(i,'duree10')
	li_count = dw_sysdebugrdv.getitemnumber(i,'count10')
	if ll_patid > 0 and li_duree > 0 and li_count = 0 then
		ll_traitid = dw_sysdebugrdv.getitemnumber(i,'traitementid10')
		insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
		values(:ldt_rdv,:lt_rdv,:ll_traitid,:ll_patid,:li_duree,10);
	end if
next
close(iw_progressbar)
end event

type cb_close from commandbutton within w_sysdebugrdv
integer x = 2761
integer y = 2172
integer width = 864
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type dw_sysdebugrdv from datawindow within w_sysdebugrdv
integer width = 3625
integer height = 2152
integer taborder = 10
string title = "sysdebugrdv"
string dataobject = "d_sysdebugrdv"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_1 from commandbutton within w_sysdebugrdv
integer y = 2172
integer width = 864
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Patient avec problème de rdv"
end type

event clicked;dw_sysdebugrdv.retrieve()
end event

