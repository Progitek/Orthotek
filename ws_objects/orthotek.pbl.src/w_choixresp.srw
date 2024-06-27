$PBExportHeader$w_choixresp.srw
forward
global type w_choixresp from window
end type
type lb_resp from listbox within w_choixresp
end type
type cb_2 from commandbutton within w_choixresp
end type
type cb_1 from commandbutton within w_choixresp
end type
type st_1 from statictext within w_choixresp
end type
end forward

global type w_choixresp from window
integer width = 1650
integer height = 904
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
boolean center = true
lb_resp lb_resp
cb_2 cb_2
cb_1 cb_1
st_1 st_1
end type
global w_choixresp w_choixresp

on w_choixresp.create
this.lb_resp=create lb_resp
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.lb_resp,&
this.cb_2,&
this.cb_1,&
this.st_1}
end on

on w_choixresp.destroy
destroy(this.lb_resp)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
end on

event open;long ll_patid
string ls_nom1, ls_nom2, ls_nom3, ls_nom, ls_prenom, ls_nomcomplet


 ll_patid = message.doubleparm
 
 // Déclaration du curseur
 
 Declare cur_resp Cursor For
 
 SELECT 	patient.nomresp1,
			patient.nomresp2,
         patient.nomresp3,
			patient.patient_nom,
			patient.patient_prenom
	FROM  patient
   WHERE patient.patient_id = :ll_patid;
           			
OPEN cur_resp;

Do While SQLCA.SQLCode = 0
   Fetch cur_resp Into :ls_nom1,
							  :ls_nom2,
         				  :ls_nom3,
							  :ls_nom, 
							  :ls_prenom;
	
   if SQLCA.SQLCode = 0 then
		ls_nomcomplet = ls_nom + ' ' + ls_prenom
		lb_resp.additem(ls_nomcomplet)
		lb_resp.addItem(ls_nom1)
		lb_resp.addItem(ls_nom2)
		lb_resp.addItem(ls_nom3)
		
	end if
Loop

CLOSE cur_resp;
end event

type lb_resp from listbox within w_choixresp
integer x = 37
integer y = 128
integer width = 1559
integer height = 536
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_choixresp
integer x = 987
integer y = 704
integer width = 608
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
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

type cb_1 from commandbutton within w_choixresp
integer x = 37
integer y = 704
integer width = 608
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ok"
boolean default = true
end type

event clicked;CloseWithReturn(Parent, lb_resp.selecteditem())
end event

type st_1 from statictext within w_choixresp
integer x = 37
integer y = 16
integer width = 1499
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Veuillez choisir le nom du responsable"
boolean focusrectangle = false
end type

