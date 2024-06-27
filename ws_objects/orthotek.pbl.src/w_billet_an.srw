$PBExportHeader$w_billet_an.srw
forward
global type w_billet_an from w_child
end type
type dw_print_billet_an from u_dw within w_billet_an
end type
type cb_update from commandbutton within w_billet_an
end type
type cb_1 from commandbutton within w_billet_an
end type
type cb_close from commandbutton within w_billet_an
end type
type cb_print from commandbutton within w_billet_an
end type
type dw_billet_an from u_dw within w_billet_an
end type
end forward

global type w_billet_an from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
dw_print_billet_an dw_print_billet_an
cb_update cb_update
cb_1 cb_1
cb_close cb_close
cb_print cb_print
dw_billet_an dw_billet_an
end type
global w_billet_an w_billet_an

type variables
private long il_idpat
public int changement = 0
end variables

forward prototypes
public subroutine create_datastore ()
public subroutine sauve ()
end prototypes

public subroutine create_datastore ();//genere datastore
	datastore ds_print_billet_an
	ds_print_billet_an = create datastore
	ds_print_billet_an.dataobject = 'd_print_billet_an'
	ds_print_billet_an.SetTransObject (SQLCA)
	//caracteristique de l'impression
	ds_print_billet_an.Modify("DataWindow.Print.Margin.Top=500")
	ds_print_billet_an.Modify("DataWindow.Print.Margin.left=500")
end subroutine

public subroutine sauve ();if dw_billet_an.Update() = 1 then
	commit using SQLCA;
	changement=0
else
	rollback using SQLCA;
	error_type(50)
end if
end subroutine

on w_billet_an.create
int iCurrent
call super::create
this.dw_print_billet_an=create dw_print_billet_an
this.cb_update=create cb_update
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_billet_an=create dw_billet_an
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_print_billet_an
this.Control[iCurrent+2]=this.cb_update
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_billet_an
end on

on w_billet_an.destroy
call super::destroy
destroy(this.dw_print_billet_an)
destroy(this.cb_update)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_billet_an)
end on

event open;long ret, patient_id, enr 
string  nom, prenom, ortho_nom, ortho_ville, ortho_adresse, ortho_tel 
time heure

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_idpat = message.doubleparm // ext parm

dw_billet_an.Settransobject(SQLCA)
enr = dw_billet_an.insertrow(0)

SELECT patient_id, patient_nom, patient_prenom INTO :patient_id, :nom, :prenom FROM patient WHERE patient_id = :il_idpat;
SELECT min(rdvheure) into :heure from t_rdv where patient_id = :il_idpat and rdvdate = today();
SELECT dr_nom_complet, dr_ville_province_code_postale, dr_adresse, dr_tel_bur INTO :ortho_nom, :ortho_ville, :ortho_adresse, :ortho_tel FROM ortho_id WHERE ortho_id = :v_no_ortho;

dw_billet_an.setitem(enr,"patient",patient_id)
dw_billet_an.setitem(enr,"ortho_nom",ortho_nom)
dw_billet_an.setitem(enr,"ortho_ville",ortho_ville)
dw_billet_an.setitem(enr,"ortho_adresse",ortho_adresse)
dw_billet_an.setitem(enr,"ortho_tel",ortho_tel)
dw_billet_an.setitem(enr,"nom_ab",nom)
dw_billet_an.setitem(enr,"prenom_ab",prenom)
dw_billet_an.setitem(enr,"date_debut_ab",today())
dw_billet_an.setitem(enr,"heure",heure)
dw_billet_an.SetFocus()
changement = 1
end event

type dw_print_billet_an from u_dw within w_billet_an
boolean visible = false
integer x = 2414
integer y = 176
integer width = 494
integer height = 360
integer taborder = 40
boolean enabled = false
string dataobject = "d_print_billet_an"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type cb_update from commandbutton within w_billet_an
integer x = 837
integer y = 1928
integer width = 827
integer height = 108
integer taborder = 10
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

type cb_1 from commandbutton within w_billet_an
integer x = 1664
integer y = 1928
integer width = 1115
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
end type

type cb_close from commandbutton within w_billet_an
integer x = 2784
integer y = 1928
integer width = 827
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

type cb_print from commandbutton within w_billet_an
integer x = 9
integer y = 1928
integer width = 827
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
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

billet = dw_billet_an.getitemnumber(dw_billet_an.getrow(),"patient")
if isnull(billet) = true or changement = 1 then
	error_type(109)
else

	dw_print_billet_an.SetTransObject (SQLCA)
	dw_print_billet_an.retrieve(billet,v_no_ortho)
		
	dw_print_billet_an.Modify("DataWindow.Print.Margin.Top=500")
	dw_print_billet_an.Modify("DataWindow.Print.Margin.left=500")
	
	select hideabsencevoucherheader
	into :lb_hideabsencevoucherheader
	from t_options
	where ortho_id = :v_no_ortho;
	
	if lb_hideabsencevoucherheader then
		dw_print_billet_an.object.ortho_nom.visible = 0
		dw_print_billet_an.object.ortho_adresse.visible = 0
		dw_print_billet_an.object.ortho_ville.visible = 0
		dw_print_billet_an.object.ortho_tel.visible = 0
		dw_print_billet_an.object.rr_1.visible = 0
	end if
	
	//Impression
	
	select email into :ls_courriel_destinataire from patient where patient_id = :il_idpat;
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail", ls_courriel_destinataire)
	
	gb_datawindow = true
	openwithparm(w_print_options,dw_print_billet_an)

end if
end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type dw_billet_an from u_dw within w_billet_an
integer x = 9
integer width = 2286
integer height = 1924
integer taborder = 40
string dataobject = "d_billet_an"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;changement =1
end event

event editchanged;changement =1
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

