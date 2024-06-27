$PBExportHeader$w_ententefinsplit.srw
forward
global type w_ententefinsplit from w_child
end type
type cb_print from commandbutton within w_ententefinsplit
end type
type cb_1 from commandbutton within w_ententefinsplit
end type
type cb_update from commandbutton within w_ententefinsplit
end type
type dw_ententefinsplit from u_dw within w_ententefinsplit
end type
type cb_close from commandbutton within w_ententefinsplit
end type
end forward

global type w_ententefinsplit from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_print cb_print
cb_1 cb_1
cb_update cb_update
dw_ententefinsplit dw_ententefinsplit
cb_close cb_close
end type
global w_ententefinsplit w_ententefinsplit

type variables
int changement = 0
private int ii_modeajout = 0
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();dw_ententefinsplit.accepttext()
if dw_ententefinsplit.update() = 1 then
	commit using sqlca;
	ii_modeajout = 0
else
	rollback using sqlca;
	error_type(50)
end if
changement = 0
cb_print.enabled = true
end subroutine

on w_ententefinsplit.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_1=create cb_1
this.cb_update=create cb_update
this.dw_ententefinsplit=create dw_ententefinsplit
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.dw_ententefinsplit
this.Control[iCurrent+5]=this.cb_close
end on

on w_ententefinsplit.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.cb_update)
destroy(this.dw_ententefinsplit)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

long row

if dw_ententefinsplit.retrieve(numero_patient) <> 1 then
	row = dw_ententefinsplit.insertrow(0)
	dw_ententefinsplit.scrolltorow(row)
	dw_ententefinsplit.setitem(row,"t_entente_patient_id",numero_patient)
	dw_ententefinsplit.setitem(row,"traitement",1)
	dw_ententefinsplit.setitem(row,"debut",today())
	dw_ententefinsplit.setitem(row,"cout_total",0)
	dw_ententefinsplit.setitem(row,"cout_total1",0)
	dw_ententefinsplit.setitem(row,"cout_total2",0)
	dw_ententefinsplit.setitem(row,"cout_total3",0)
	dw_ententefinsplit.setitem(row,"diag_anal1",0)
	dw_ententefinsplit.setitem(row,"diag_anal2",0)
	dw_ententefinsplit.setitem(row,"diag_anal3",0)
	dw_ententefinsplit.setitem(row,"paiement_init1",0)
	dw_ententefinsplit.setitem(row,"paiement_init2",0)
	dw_ententefinsplit.setitem(row,"paiement_init3",0)
	dw_ententefinsplit.setitem(row,"mensualite1",0)
	dw_ententefinsplit.setitem(row,"mensualite2",0)
	dw_ententefinsplit.setitem(row,"mensualite3",0)
	dw_ententefinsplit.setitem(row,"t_entente_duree1",0)
	dw_ententefinsplit.setitem(row,"t_entente_duree2",0)
	dw_ententefinsplit.setitem(row,"t_entente_duree3",0)
	dw_ententefinsplit.setitem(row,"paiement_fin1",0)
	dw_ententefinsplit.setitem(row,"paiement_fin2",0)
	dw_ententefinsplit.setitem(row,"paiement_fin3",0)
	ii_modeajout = 1
end if
dw_ententefinsplit.SetFocus()
changement = 0
end event

type cb_print from commandbutton within w_ententefinsplit
integer x = 1559
integer y = 1904
integer width = 640
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Imprimer"
end type

event clicked;string v_langue_pat

select langue into :v_langue_pat from patient where patient_id = :numero_patient;
CHOOSE CASE v_langue_pat
CASE 'F'
	datastore ds_entente_imp_fr
	ds_entente_imp_fr = create datastore
//	ds_entente_imp_fr.dataobject = "d_entente_financiere_imp_fr"
	ds_entente_imp_fr.dataobject = "d_entfinfr"
	ds_entente_imp_fr.SetTransObject(SQLCA)
	if ds_entente_imp_fr.retrieve(numero_patient) = 1 then
		ds_entente_imp_fr.Modify("DataWindow.Print.Margin.Top=400")
		ds_entente_imp_fr.Modify("DataWindow.Print.Margin.left=400")
		gb_datawindow = false
		openwithparm(w_print_options,ds_entente_imp_fr)
	else
		error_type(0)
	end if
	destroy ds_entente_imp_fr
CASE 'A'
	datastore ds_entente_imp_an
	ds_entente_imp_an = create datastore
//	ds_entente_imp_an.dataobject = "d_entente_financiere_imp_an"
	ds_entente_imp_an.dataobject = "d_entfinan"
	ds_entente_imp_an.SetTransObject(SQLCA)
	if ds_entente_imp_an.retrieve(numero_patient) = 1 then
		ds_entente_imp_an.Modify("DataWindow.Print.Margin.Top=400")
		ds_entente_imp_an.Modify("DataWindow.Print.Margin.left=400")
		gb_datawindow = false
		openwithparm(w_print_options,ds_entente_imp_an)
	else
		error_type(0)
	end if
	destroy ds_entente_imp_an
CASE ELSE
		error_type(0)
END CHOOSE

end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type cb_1 from commandbutton within w_ententefinsplit
integer x = 41
integer y = 1904
integer width = 1518
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_update from commandbutton within w_ententefinsplit
integer x = 2199
integer y = 1904
integer width = 745
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
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

type dw_ententefinsplit from u_dw within w_ententefinsplit
integer x = 46
integer width = 3557
integer height = 1900
integer taborder = 10
string title = "ententefinsplit"
string dataobject = "d_ententefinsplit"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_8.text = 'Financial agreement for'
	this.object.traitement_t.text = 'Treatment:'
	this.object.cout_total_t.text = 'Total treatment cost:'
	this.object.debut_t.text = 'Treatment beginning:'
	this.object.t_1.text = 'to'
	this.object.cout_total2_t.text = 'Case analysis and diagnostic'
	this.object.cout_total3_t.text = 'Initial payment:'
	this.object.diag_anal1_t.text = 'Balance:'
	this.object.paiement_init1_t.text = 'Final payment:'
	this.object.t_2.text = 'monthly during'
	this.object.t_4.text = 'Case analysis and diagnostic'
	this.object.t_5.text = 'Initial payment:'
	this.object.t_6.text = 'Balance:'
	this.object.t_7.text = 'Final payment:'
	this.object.t_14.text = 'monthly during'
	this.object.t_10.text = 'Case analysis and diagnostic'
	this.object.t_11.text = 'Initial payment:'
	this.object.t_12.text = 'Balance:'
	this.object.t_13.text = 'Final payment:'
	this.object.t_15.text = 'monthly during'
end if
end event

event itemchanged;changement = 1
cb_print.enabled = false
end event

event editchanged;decimal{2} v_phase, v_mens, v_final, v_init, v_diag_anal
int v_duree, li_duree_reel

if isnull(data) = false then
	CHOOSE CASE getcolumnname()
	
	CASE "mensualite1"
			dw_ententefinsplit.accepttext()
			v_phase = dw_ententefinsplit.getitemnumber(row,'cout_total1')
			v_mens = dw_ententefinsplit.getitemnumber(row,'mensualite1')
			v_init = dw_ententefinsplit.getitemnumber(row,'paiement_init1')
			v_diag_anal = dw_ententefinsplit.getitemnumber(row,'diag_anal1')
			if v_mens <> 0 and isnull(v_mens) = false then
				v_duree = (v_phase - v_init - v_diag_anal) / v_mens
				dw_ententefinsplit.setitem(row, "t_entente_duree1", v_duree)
				v_final = v_phase - (v_duree * v_mens + v_init + v_diag_anal)
				dw_ententefinsplit.setitem(row, "paiement_fin1", v_final)
			end if
			changement = 1
	CASE "mensualite2"
			dw_ententefinsplit.accepttext()
			v_phase = dw_ententefinsplit.getitemnumber(row,'cout_total2')
			v_mens = dw_ententefinsplit.getitemnumber(row,'mensualite2')
			v_init = dw_ententefinsplit.getitemnumber(row,'paiement_init2')
			v_diag_anal = dw_ententefinsplit.getitemnumber(row,'diag_anal2')
			if v_mens <> 0 and isnull(v_mens) = false then
				v_duree = (v_phase - v_init - v_diag_anal) / v_mens
				dw_ententefinsplit.setitem(row, "t_entente_duree2", v_duree)
				v_final = v_phase - (v_duree * v_mens + v_init + v_diag_anal)
				dw_ententefinsplit.setitem(row, "paiement_fin2", v_final)
			end if
			changement = 1
	CASE "mensualite3"
			dw_ententefinsplit.accepttext()
			v_phase = dw_ententefinsplit.getitemnumber(row,'cout_total3')
			v_mens = dw_ententefinsplit.getitemnumber(row,'mensualite3')
			v_init = dw_ententefinsplit.getitemnumber(row,'paiement_init3')
			v_diag_anal = dw_ententefinsplit.getitemnumber(row,'diag_anal3')
			if v_mens <> 0 and isnull(v_mens) = false then
				v_duree = (v_phase - v_init - v_diag_anal) / v_mens
				dw_ententefinsplit.setitem(row, "t_entente_duree3", v_duree)
				v_final = v_phase - (v_duree * v_mens + v_init + v_diag_anal)
				dw_ententefinsplit.setitem(row, "paiement_fin3", v_final)
			end if
			changement = 1
		CASE "t_entente_duree1"
			v_phase = dw_ententefinsplit.getitemnumber(row,'cout_total1')
			v_mens = dw_ententefinsplit.getitemnumber(row,'mensualite1')
			v_init = dw_ententefinsplit.getitemnumber(row,'paiement_init1')
			v_diag_anal = dw_ententefinsplit.getitemnumber(row,'diag_anal1')
			li_duree_reel = integer(data)
			if v_mens <> 0 and isnull(v_mens) = false then
		 	   v_final = v_phase - (li_duree_reel * v_mens + v_init + v_diag_anal)
			   dw_ententefinsplit.setitem(row, "paiement_fin1", v_final)
		   end if
			changement = 1
		CASE "t_entente_duree2"
			v_phase = dw_ententefinsplit.getitemnumber(row,'cout_total2')
			v_mens = dw_ententefinsplit.getitemnumber(row,'mensualite2')
			v_init = dw_ententefinsplit.getitemnumber(row,'paiement_init2')
			v_diag_anal = dw_ententefinsplit.getitemnumber(row,'diag_anal2')
			li_duree_reel = integer(data)
			if v_mens <> 0 and isnull(v_mens) = false then
		 	   v_final = v_phase - (li_duree_reel * v_mens + v_init + v_diag_anal)
			   dw_ententefinsplit.setitem(row, "paiement_fin2", v_final)
		   end if
			changement = 1
		CASE "t_entente_duree3"
			v_phase = dw_ententefinsplit.getitemnumber(row,'cout_total3')
			v_mens = dw_ententefinsplit.getitemnumber(row,'mensualite3')
			v_init = dw_ententefinsplit.getitemnumber(row,'paiement_init3')
			v_diag_anal = dw_ententefinsplit.getitemnumber(row,'diag_anal3')
			li_duree_reel = integer(data)
			if v_mens <> 0 and isnull(v_mens) = false then
		 	   v_final = v_phase - (li_duree_reel * v_mens + v_init + v_diag_anal)
			   dw_ententefinsplit.setitem(row, "paiement_fin3", v_final)
		   end if
			changement = 1
	END CHOOSE
end if
cb_print.enabled = false
end event

event updateend;long ll_row, ll_ententeid
integer test
if rowsinserted <> 0 then
	ll_row = dw_ententefinsplit.getrow()
	select max(entente_id) into :ll_ententeid from t_entente;
	dw_ententefinsplit.setitem(ll_row,'entente_id',ll_ententeid)
	if ii_modeajout = 1 then   
     	test = dw_ententefinsplit.setitemstatus(ll_row,'entente_id',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'traitement',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'debut',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'fin',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'cout_total',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'cout_total1',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'cout_total2',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'cout_total3',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'diag_anal1',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'diag_anal2',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'diag_anal3',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'paiement_init1',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'paiement_init2',primary!,notmodified!)
	   test = dw_ententefinsplit.setitemstatus(ll_row,'paiement_init3',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'paiement_fin1',primary!,notmodified!) 
		test = dw_ententefinsplit.setitemstatus(ll_row,'paiement_fin2',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'paiement_fin3',primary!,notmodified!)
		test = dw_ententefinsplit.setitemstatus(ll_row,'mensualite1',primary!,notmodified!)  
		test = dw_ententefinsplit.setitemstatus(ll_row,'mensualite2',primary!,notmodified!) 
		test = dw_ententefinsplit.setitemstatus(ll_row,'mensualite3',primary!,notmodified!) 
		test = dw_ententefinsplit.setitemstatus(ll_row,'t_entente_duree1',primary!,notmodified!) 
		test = dw_ententefinsplit.setitemstatus(ll_row,'t_entente_duree2',primary!,notmodified!) 
		test = dw_ententefinsplit.setitemstatus(ll_row,'t_entente_duree3',primary!,notmodified!) 
		test = dw_ententefinsplit.setitemstatus(ll_row,'t_entente_patient_id',primary!,notmodified!) 
	end if
end if
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

type cb_close from commandbutton within w_ententefinsplit
integer x = 2944
integer y = 1904
integer width = 640
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if changement = 1 then
	if error_type(200) = 1 then
		sauve()
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

