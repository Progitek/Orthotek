$PBExportHeader$w_registration.srw
forward
global type w_registration from window
end type
type st_etat from statictext within w_registration
end type
type em_serial from editmask within w_registration
end type
type st_4 from statictext within w_registration
end type
type st_2 from statictext within w_registration
end type
type st_1 from statictext within w_registration
end type
type cb_validate from commandbutton within w_registration
end type
end forward

global type w_registration from window
integer width = 2542
integer height = 1156
boolean titlebar = true
string title = "REGISTRATION"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean center = true
st_etat st_etat
em_serial em_serial
st_4 st_4
st_2 st_2
st_1 st_1
cb_validate cb_validate
end type
global w_registration w_registration

on w_registration.create
this.st_etat=create st_etat
this.em_serial=create em_serial
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.cb_validate=create cb_validate
this.Control[]={this.st_etat,&
this.em_serial,&
this.st_4,&
this.st_2,&
this.st_1,&
this.cb_validate}
end on

on w_registration.destroy
destroy(this.st_etat)
destroy(this.em_serial)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_validate)
end on

event open;string v_serie
int v_compteur
w_registration.move(400,450)
select compteur into :v_compteur from lock_cheques;
select no_serie into :v_serie from lock_cheques;
if v_serie = "P2001-03061-97647" then
	em_serial.text = "0010306197647"
	em_serial.enabled=false
	st_1.text = "Voici les information concernant votre enregistrement sur le logiciel ORTHOTEK"
	st_2.text = "Type de contrat: Accès illimité"
	st_4.text = "Voici votre numéro de série"
//	st_5.text = ""
	cb_validate.text = "Fermer"
elseif v_serie = "P2000-00000-00000" and v_compteur > 0 then
	em_serial.text = "000000000000"
	em_serial.enabled=false
	st_1.text = "Voici les information concernant votre enregistrement sur le logiciel ORTHOTEK"
	st_2.text = "Type de contrat: Démo 30 jours"
	st_4.text = "Voici votre numéro d'essai"
//	st_5.text = ""
	cb_validate.text = "Fermer"
elseif v_serie = "P2000-00000-00000" and v_compteur <= 0 then
	em_serial.text = "000000000000"
	em_serial.enabled=true
	st_1.text = "Voici les information concernant votre enregistrement sur le logiciel ORTHOTEK"
	st_2.text = "Type de contrat: Démo 30 jours expiré"
	st_4.text = "Inscrivez votre numéro d'enregistrement ici:"
//	st_5.text = ""
	cb_validate.text = "VALIDATION"
end if
end event

type st_etat from statictext within w_registration
integer x = 608
integer y = 728
integer width = 1344
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type em_serial from editmask within w_registration
integer x = 613
integer y = 480
integer width = 1349
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "P2000-#####-#####"
boolean autoskip = true
end type

event losefocus;if em_serial.text = "P2000-00000-00000" then
	st_etat.text = "Cliquez sur VALIDATION pour un essai de 30 jours d'ORTHOTEK"
elseif em_serial.text = "P2001-03061-97647" then
	st_etat.text = "Cliquez sur VALIDATION pour utiliser la version illimitée d'ORTHOTEK"
end if
end event

type st_4 from statictext within w_registration
integer x = 585
integer y = 400
integer width = 1417
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Entrer votre numéro de série et appuyer sur validation"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_registration
integer x = 174
integer y = 172
integer width = 2080
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "II4NET inc. Tél.: (418) 952-7011"
boolean focusrectangle = false
end type

type st_1 from statictext within w_registration
integer x = 169
integer y = 76
integer width = 2437
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Votre version d~'ORTHOTEK est expiré, veuillez nous contacter pour renouvellement"
boolean focusrectangle = false
end type

type cb_validate from commandbutton within w_registration
integer x = 608
integer y = 844
integer width = 1344
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "VALIDATION"
boolean default = true
end type

event clicked;string v_serie
int v_compteur

select no_serie into :v_serie from lock_cheques;
select compteur into :v_compteur from lock_cheques;
if (v_serie="P2000-00000-00000" or v_serie="P2001-03061-97647") and v_compteur > 0 then
	close(w_registration)
else
	if em_serial.text = "P2000-00000-00000" then
		if v_serie = "P2000-00000-00000" then
			messagebox("AVERTISSEMENT!","Vous utilisez déjà la version démo, pour vous procurer la version complète,&
 veuillez contacter Proclinique inc. au 1 (418) 571-1369",StopSign!)
			close(w_registration)
		else
			update lock_cheques set flag = today(),compteur = 30,no_serie='P2000-00000-00000';
			commit;
			close(w_registration)
		end if
	elseif em_serial.text = "P2001-03061-97647" then
		update lock_cheques set flag = today(),compteur = 3000,no_serie='P2001-03061-97647';
		commit using SQLCA;
		close(w_registration)
	else
		messagebox("ERREUR!","Mauvais numéro de série!",StopSign!)
		close(w_registration)
	end if
end if
close(w_etat)
end event

