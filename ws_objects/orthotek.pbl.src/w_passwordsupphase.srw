$PBExportHeader$w_passwordsupphase.srw
forward
global type w_passwordsupphase from window
end type
type sle_password from singlelineedit within w_passwordsupphase
end type
type st_1 from statictext within w_passwordsupphase
end type
type cb_1 from commandbutton within w_passwordsupphase
end type
type cb_2 from commandbutton within w_passwordsupphase
end type
end forward

global type w_passwordsupphase from window
integer x = 1161
integer y = 904
integer width = 1257
integer height = 508
boolean titlebar = true
string title = "Suppression d~'une phase"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
boolean center = true
sle_password sle_password
st_1 st_1
cb_1 cb_1
cb_2 cb_2
end type
global w_passwordsupphase w_passwordsupphase

on w_passwordsupphase.create
this.sle_password=create sle_password
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.Control[]={this.sle_password,&
this.st_1,&
this.cb_1,&
this.cb_2}
end on

on w_passwordsupphase.destroy
destroy(this.sle_password)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;string v_password, code

code = "supp"
select password into :v_password from password where typepass = :code;
if v_password = "" then
	insert into password (password, typepass) values ('12345', 'supp');
	commit;
	messagebox("Avertissement!","Le mot de passe est 12345, vous devez le changer!",Information!)
end if
end event

type sle_password from singlelineedit within w_passwordsupphase
integer x = 462
integer y = 88
integer width = 686
integer height = 92
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
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_passwordsupphase
integer x = 64
integer y = 96
integer width = 393
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Mot de passe:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_passwordsupphase
integer x = 59
integer y = 248
integer width = 498
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ok"
end type

event clicked;string v_password
long nb_row, ll_traitid
SetPointer(HourGlass!)
ll_traitid = w_traitements.il_traitid
if ll_traitid > 0 then
	if sle_password.text <> "" then
		select password into :v_password from password where typepass = 'supp';
		if v_password = sle_password.text then
			//debut algo
			delete from cheques_postdates where indicateur = '1' and traitement_patient_id = :ll_traitid;
			select count(*) into :nb_row from cheques_postdates where traitement_patient_id = :ll_traitid;
			if nb_row <> 0 then
				error_type(131)
				close(parent)
				return
			end if
			select count(*) into :nb_row from factures_traitements where traitement_id = :ll_traitid;
			if nb_row <> 0 then
				error_type(132)
				close(parent)
				return
			end if
			select count(*) into :nb_row from paiement where traitement_patient_id = :ll_traitid;
			if nb_row <> 0 then
				error_type(133)
				close(parent)
				return
			end if
			delete from t_pourcentages where traitement_id = :ll_traitid;
			f_logs('del','',ll_traitid,w_traitements.il_patid,today(),'0') //log
			w_traitements.tab_dossfin.tabpage_tous.dw_traitements.deleterow(w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow())
			if w_traitements.tab_dossfin.tabpage_tous.dw_traitements.Update() = 1 then
				delete from t_pourcentages where traitement_id = :ll_traitid;
				commit using SQLCA;
			else
				rollback using SQLCA;
				error_type(50)
			end if				
		else
			error_type(129)
		end if
	else
		error_type(130)
	end if
else
	error_type(113)
end if
close(parent)
w_patient.dw_patient_master.SetFocus()
end event

type cb_2 from commandbutton within w_passwordsupphase
integer x = 649
integer y = 248
integer width = 498
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;close(parent)
end event

