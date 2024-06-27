$PBExportHeader$w_paiement_batch.srw
forward
global type w_paiement_batch from w_child
end type
type cb_print from commandbutton within w_paiement_batch
end type
type sle_quantite from singlelineedit within w_paiement_batch
end type
type cb_exe from commandbutton within w_paiement_batch
end type
type cb_close from commandbutton within w_paiement_batch
end type
type cb_insert from commandbutton within w_paiement_batch
end type
type cb_update from commandbutton within w_paiement_batch
end type
type cb_supprimer from commandbutton within w_paiement_batch
end type
type dw_paiement_batch from u_dw within w_paiement_batch
end type
end forward

global type w_paiement_batch from w_child
integer width = 1536
integer height = 2008
boolean border = false
windowtype windowtype = child!
long backcolor = 79741120
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
event ue_post_open ( )
cb_print cb_print
sle_quantite sle_quantite
cb_exe cb_exe
cb_close cb_close
cb_insert cb_insert
cb_update cb_update
cb_supprimer cb_supprimer
dw_paiement_batch dw_paiement_batch
end type
global w_paiement_batch w_paiement_batch

type variables
integer changement = 0


end variables

forward prototypes
public subroutine maj ()
end prototypes

event ue_post_open();
// Ajuste la disponibilité des boutons
if dw_paiement_batch.rowcount() = 0 then
	cb_update.enabled = false
	cb_supprimer.enabled = false
	cb_exe.enabled = false
	cb_supprimer.enabled = false
end if
changement = 0
end event

public subroutine maj ();decimal{2} v_paiement
date v_date_cheque
long enr
string ls_modalite
dw_paiement_batch.accepttext()
cb_supprimer.enabled = true
enr = dw_paiement_batch.getrow()
if enr > 0 then
	v_date_cheque=dw_paiement_batch.getitemdate(enr,"date_paiement")
	ls_modalite=dw_paiement_batch.getitemstring(enr,"paiement")
	v_paiement=dw_paiement_batch.getitemnumber(enr,"montant_recu")
	if isnull(v_date_cheque)=true or isnull(v_paiement)=true or isnull(ls_modalite)=true then
		messagebox("Erreur!","La date et le paiement ne peuvent pas être null!",StopSign!)
	else
		if dw_paiement_batch.Update() = 1 then
			commit using SQLCA;
			dw_paiement_batch.retrieve(message.doubleparm)
			if dw_paiement_batch.rowcount() = 0 then
				cb_update.enabled = false
				cb_supprimer.enabled = false
				cb_exe.enabled = false
			end if
		else
			rollback using SQLCA;
			messagebox("Information","Aucune modification n'a été enregistrée!",information!)
		end if
	end if
end if
changement=0

end subroutine

on w_paiement_batch.create
this.cb_print=create cb_print
this.sle_quantite=create sle_quantite
this.cb_exe=create cb_exe
this.cb_close=create cb_close
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_supprimer=create cb_supprimer
this.dw_paiement_batch=create dw_paiement_batch
this.Control[]={this.cb_print,&
this.sle_quantite,&
this.cb_exe,&
this.cb_close,&
this.cb_insert,&
this.cb_update,&
this.cb_supprimer,&
this.dw_paiement_batch}
end on

on w_paiement_batch.destroy
destroy(this.cb_print)
destroy(this.sle_quantite)
destroy(this.cb_exe)
destroy(this.cb_close)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_supprimer)
destroy(this.dw_paiement_batch)
end on

event open;w_paiement_batch.postevent('ue_post_open')
end event

type cb_print from commandbutton within w_paiement_batch
integer x = 352
integer y = 1688
integer width = 439
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;datastore ds_cpd
ds_cpd = create datastore
ds_cpd.dataobject = "d_paiement_batch"
ds_cpd.SetTransObject(SQLCA)
ds_cpd.retrieve(message.doubleparm)
gb_datawindow = false
openwithparm(w_print_options,ds_cpd)
destroy ds_cpd
end event

type sle_quantite from singlelineedit within w_paiement_batch
integer x = 1147
integer y = 1692
integer width = 229
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_exe from commandbutton within w_paiement_batch
integer x = 791
integer y = 1688
integer width = 347
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Quantité"
end type

event clicked;// Déclaration de variables
long i, enr, annee, mois, jour, v_jour
decimal{2} montant
dec{0} mois1
date date_premier
string ls_modalite
dw_paiement_batch.accepttext()
enr = dw_paiement_batch.getrow()
if enr > 0 then 
	date_premier = dw_paiement_batch.getitemdate(enr,"date_paiement")
	montant = dw_paiement_batch.getitemnumber(enr,"montant_recu")
	ls_modalite = dw_paiement_batch.getitemstring(enr,"paiement")
	jour=day(date_premier)
	mois=month(date_premier)
	annee=year(date_premier)
	for i = 1 to (integer(sle_quantite.text) -1)
		SetPointer(hourglass!)
		enr = dw_paiement_batch.insertrow(0)
		mois = mois + 1
			if mois > 12 then
				mois = 1
				annee = annee + 1
			end if
		v_jour = correction_jour(jour,mois,annee)
		dw_paiement_batch.setitem(enr,"montant_recu",montant)
		dw_paiement_batch.setitem(enr,"date_paiement",date(annee,mois,v_jour))
		dw_paiement_batch.setitem(enr,"paiement",ls_modalite)
		dw_paiement_batch.setitem(enr,"traitement_patient_id",message.doubleparm)
		dw_paiement_batch.setitem(enr,"recu",'0')
		dw_paiement_batch.setitem(enr,"imp",0)
		dw_paiement_batch.setitem(enr,"affect",1)
		dw_paiement_batch.setitem(enr,"cache",0)
	next
	changement = 1
end if
end event

event constructor;if v_langue = 'an' then
	cb_exe.Text = "Quantity"
end if
end event

type cb_close from commandbutton within w_paiement_batch
event clicked pbm_bnclicked
integer x = 928
integer y = 1796
integer width = 462
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if changement = 1 then
	if messagebox("Mise-à-jour","Voulez-vous enregistrer les modifications?",Question!,YesNo!) =1 then
		maj()
		w_paiement.dw_paiements_traitement.retrieve(w_paiement.il_traitid)
	end if
end if
Close (parent)

end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_paiement_batch
event clicked pbm_bnclicked
integer x = 14
integer y = 1688
integer width = 338
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajout"
end type

event clicked;// Déclaration de variables
long enr,ll_cour,ic_cour

enr = dw_paiement_batch.InsertRow(0)
dw_paiement_batch.scrolltorow(enr)
dw_paiement_batch.setitem(enr,"traitement_patient_id",message.doubleparm) 
dw_paiement_batch.setitem(enr,"recu",'0')
dw_paiement_batch.setitem(enr,"imp",0)
dw_paiement_batch.setitem(enr,"affect",1)
dw_paiement_batch.setitem(enr,"cache",0)

// Ajuste la disponibilité des boutons
if cb_update.enabled = false then cb_update.enabled = true
if cb_exe.enabled = false then cb_exe.enabled = true
if cb_supprimer.enabled = false then cb_supprimer.enabled = true
changement =1
dw_paiement_batch.setcolumn(1)
dw_paiement_batch.setfocus()
end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "Add"
end if
end event

type cb_update from commandbutton within w_paiement_batch
event clicked pbm_bnclicked
integer x = 18
integer y = 1796
integer width = 471
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;maj()
end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type cb_supprimer from commandbutton within w_paiement_batch
event clicked pbm_bnclicked
integer x = 489
integer y = 1796
integer width = 439
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;if changement = 1 then
	messagebox("Avertissement","Vous devez faire une mise a jour avant de supprimer",Information!)
else
	dw_paiement_batch.deleterow(dw_paiement_batch.getrow())
	if dw_paiement_batch.update() = 1 then
		commit;
		changement = 0
	else
		rollback;
		messagebox("Erreur!","Aucune modification n'a été enregistrée!",StopSign!)
	end if
end if

end event

event constructor;if v_langue = 'an' then
	cb_supprimer.Text = "Delete"
end if
end event

type dw_paiement_batch from u_dw within w_paiement_batch
integer x = 14
integer y = 12
integer width = 1499
integer height = 1664
integer taborder = 10
string dataobject = "d_paiement_batch"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;changement = 1
end event

event itemchanged;changement = 1
end event

event constructor;this.SetTransObject (SQLCA)
this.setrowfocusindicator(hand!)

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

