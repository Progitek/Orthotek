$PBExportHeader$w_billet_fr.srw
forward
global type w_billet_fr from w_child
end type
type dw_print_billet_fr from u_dw within w_billet_fr
end type
type cb_2 from commandbutton within w_billet_fr
end type
type cb_update from commandbutton within w_billet_fr
end type
type cb_close from commandbutton within w_billet_fr
end type
type cb_print from commandbutton within w_billet_fr
end type
type dw_billet_fr from u_dw within w_billet_fr
end type
end forward

global type w_billet_fr from w_child
integer x = 214
integer y = 221
integer width = 3593
integer height = 2028
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
dw_print_billet_fr dw_print_billet_fr
cb_2 cb_2
cb_update cb_update
cb_close cb_close
cb_print cb_print
dw_billet_fr dw_billet_fr
end type
global w_billet_fr w_billet_fr

type variables
private long il_idpat
public int changement = 0
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();if dw_billet_fr.Update() = -1 Then
	rollback using SQLCA;
else
	commit using SQLCA;
end if
changement = 0
end subroutine

on w_billet_fr.create
int iCurrent
call super::create
this.dw_print_billet_fr=create dw_print_billet_fr
this.cb_2=create cb_2
this.cb_update=create cb_update
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_billet_fr=create dw_billet_fr
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_print_billet_fr
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_billet_fr
end on

on w_billet_fr.destroy
call super::destroy
destroy(this.dw_print_billet_fr)
destroy(this.cb_2)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_billet_fr)
end on

event open;long ret, patient_id, enr
string  nom, prenom, ortho_nom, ortho_ville, ortho_adresse, ortho_tel 
time heure

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_idpat = message.doubleparm // ext parm

dw_billet_fr.Settransobject (SQLCA)
enr = dw_billet_fr.insertrow(0)

SELECT patient_id, patient_nom, patient_prenom INTO :patient_id, :nom, :prenom FROM patient WHERE patient_id = :il_idpat;
SELECT min(rdvheure) into :heure from t_rdv where patient_id = :il_idpat and rdvdate = today();
SELECT dr_nom_complet, dr_ville_province_code_postale, dr_adresse, dr_tel_bur INTO :ortho_nom, :ortho_ville, :ortho_adresse, :ortho_tel FROM ortho_id WHERE ortho_id = :v_no_ortho;

dw_billet_fr.setitem(enr,"patient",patient_id)
dw_billet_fr.setitem(enr,"ortho_nom",ortho_nom)
dw_billet_fr.setitem(enr,"ortho_ville",ortho_ville)
dw_billet_fr.setitem(enr,"ortho_adresse",ortho_adresse)
dw_billet_fr.setitem(enr,"ortho_tel",ortho_tel)
dw_billet_fr.setitem(enr,"nom_ab",nom)
dw_billet_fr.setitem(enr,"prenom_ab",prenom)
dw_billet_fr.setitem(enr,"date_debut_ab",today())
dw_billet_fr.setitem(enr,"heure",heure)
dw_billet_fr.SetFocus()
changement = 1
end event

type dw_print_billet_fr from u_dw within w_billet_fr
boolean visible = false
integer x = 2665
integer y = 48
integer width = 494
integer height = 360
integer taborder = 40
boolean enabled = false
string dataobject = "d_print_billet_fr"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type cb_2 from commandbutton within w_billet_fr
integer x = 1568
integer y = 1920
integer width = 1253
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
end type

type cb_update from commandbutton within w_billet_fr
integer x = 786
integer y = 1920
integer width = 782
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()
end event

event constructor;if v_langue = 'an' then
	this.text = "Update"
end if
end event

type cb_close from commandbutton within w_billet_fr
integer x = 2825
integer y = 1920
integer width = 773
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if changement =1 then 
	if error_type(200) =1 then
		sauve()
	end if
end if
delete from absence;
commit;
close (parent)

end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

type cb_print from commandbutton within w_billet_fr
integer x = 5
integer y = 1920
integer width = 782
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;long v_print , billet
string ls_data, ls_courriel_destinataire
boolean lb_hideabsencevoucherheader

billet = dw_billet_fr.getitemnumber(dw_billet_fr.getrow(),"patient")
if isnull(billet) = true or changement = 1 then
	error_type(109)
else
	dw_print_billet_fr.SetTransObject (SQLCA)
	dw_print_billet_fr.retrieve(billet,v_no_ortho)
	dw_print_billet_fr.Modify("DataWindow.Print.Margin.Top=500")
	dw_print_billet_fr.Modify("DataWindow.Print.Margin.left=500")
	
	select hideabsencevoucherheader
	into :lb_hideabsencevoucherheader
	from t_options
	where ortho_id = :v_no_ortho;
	
	if lb_hideabsencevoucherheader then
		dw_print_billet_fr.object.ortho_nom.visible = 0
		dw_print_billet_fr.object.ortho_adresse.visible = 0
		dw_print_billet_fr.object.ortho_ville.visible = 0
		dw_print_billet_fr.object.ortho_tel.visible = 0
		dw_print_billet_fr.object.rr_1.visible = 0
	end if
	
	//Impression
	gb_datawindow = true
	
	select email into :ls_courriel_destinataire from patient where patient_id = :il_idpat;
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail", ls_courriel_destinataire)
	
	openwithparm(w_print_options,dw_print_billet_fr)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type dw_billet_fr from u_dw within w_billet_fr
integer x = 14
integer y = 4
integer width = 2414
integer height = 1900
integer taborder = 40
string dataobject = "d_billet_fr"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;changement = 1
end event

event editchanged;changement = 1
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

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)
end event

