$PBExportHeader$w_statistique_referent.srw
forward
global type w_statistique_referent from w_child
end type
type cb_printlabel from commandbutton within w_statistique_referent
end type
type cb_close from commandbutton within w_statistique_referent
end type
type cb_print from commandbutton within w_statistique_referent
end type
type dw_statref from u_dw within w_statistique_referent
end type
end forward

global type w_statistique_referent from w_child
integer x = 5
integer y = 4
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean ib_isupdateable = false
cb_printlabel cb_printlabel
cb_close cb_close
cb_print cb_print
dw_statref dw_statref
end type
global w_statistique_referent w_statistique_referent

on w_statistique_referent.create
int iCurrent
call super::create
this.cb_printlabel=create cb_printlabel
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_statref=create dw_statref
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_printlabel
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.dw_statref
end on

on w_statistique_referent.destroy
call super::destroy
destroy(this.cb_printlabel)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_statref)
end on

type cb_printlabel from commandbutton within w_statistique_referent
integer x = 1202
integer y = 1916
integer width = 1253
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type cb_close from commandbutton within w_statistique_referent
integer x = 2455
integer y = 1916
integer width = 1184
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_print from commandbutton within w_statistique_referent
integer x = 23
integer y = 1916
integer width = 1179
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_statref)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_statref from u_dw within w_statistique_referent
event retourner ( long ortho_id )
integer x = 837
integer y = 12
integer width = 2789
integer height = 1900
integer taborder = 50
string dataobject = "d_statref"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ortho_id);//long ll_ref_id, ll_qte, ll_row
//string ls_nom_complet
//date ldt_start, ldt_end
//
//setpointer(hourglass!)
//
//ldt_start = date(w_liste_referants.em_debut.text)
//ldt_end = date(w_liste_referants.em_fin.text)
// 
//Declare stat Cursor For
//
//SELECT t_referents.ref_nom_complet
//FROM patient INNER JOIN t_referents ON patient.referant_nom = t_referents.id
//             INNER JOIN traitements ON patient.patient_id = traitements.patient_id
//group by patient.referant_nom;
//
//
// 
////SELECT		count(t_referents.ref_nom_complet),
////				t_referents.ref_nom_complet
////FROM			t_referents INNER JOIN patient ON t_referents.id = patient.referant_nom,
////				patient INNER JOIN traitements ON patient.patient_id = traitements.patient_id
////WHERE			t_referents.ortho_id = :ortho_id and
////				traitements.debut_traitement between :ldt_start and :ldt_end
//	
//			
//OPEN stat;
//
//Do While SQLCA.SQLCode = 0
//   Fetch stat Into   :ll_qte,
//	                  :ls_nom_complet;
//						 
//if SQLCA.SQLCode = 0 then
//	ll_row = dw_statistique_referents.insertrow(0)
//	dw_statistique_referents.scrolltorow(ll_row)
//	dw_statistique_referents.setitem(ll_row,'ref_nom_complet',ls_nom_complet)
//	dw_statistique_referents.setitem(ll_row,'qte',ll_qte)
// end if
//Loop
//
//close stat;
end event

event constructor;settransobject(SQLCA)

if v_langue = 'an' then
	object.t_title.text = "Referral stats"
	object.t_refnom.text = "Referral's name"
	object.b_refnom.text = "Referral's name"
	object.t_qte.text = "Qty"
	object.b_qte.text = "Qty"
end if


long ll_ref_id, ll_qte, ll_row
string ls_nom_complet
date ldt_start, ldt_end

setpointer(hourglass!)

ldt_start = date(w_liste_referants.em_debut.text)
ldt_end = date(w_liste_referants.em_fin.text)
 
retrieve(ldt_start,ldt_end, v_no_ortho)

 

						 


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

event clicked;choose case dwo.name
	case 'b_refnom'
		this.setsort("t_referents_ref_nom A")
		this.sort()
	case 'b_qte'
		this.setsort("qte A")
		this.sort()
end choose
end event

