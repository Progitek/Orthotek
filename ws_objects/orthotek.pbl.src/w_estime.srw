$PBExportHeader$w_estime.srw
forward
global type w_estime from w_child
end type
type rb_ang from radiobutton within w_estime
end type
type rb_fran from radiobutton within w_estime
end type
type st_2 from statictext within w_estime
end type
type st_nom from statictext within w_estime
end type
type cb_passer from commandbutton within w_estime
end type
type cb_delete from commandbutton within w_estime
end type
type cb_supp from commandbutton within w_estime
end type
type cb_ajout from commandbutton within w_estime
end type
type dw_estimed from u_dw within w_estime
end type
type st_1 from statictext within w_estime
end type
type cb_update from commandbutton within w_estime
end type
type cb_print from commandbutton within w_estime
end type
type cb_insert from commandbutton within w_estime
end type
type cb_close from commandbutton within w_estime
end type
type dw_estime from u_dw within w_estime
end type
end forward

global type w_estime from w_child
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
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
boolean ib_isupdateable = false
rb_ang rb_ang
rb_fran rb_fran
st_2 st_2
st_nom st_nom
cb_passer cb_passer
cb_delete cb_delete
cb_supp cb_supp
cb_ajout cb_ajout
dw_estimed dw_estimed
st_1 st_1
cb_update cb_update
cb_print cb_print
cb_insert cb_insert
cb_close cb_close
dw_estime dw_estime
end type
global w_estime w_estime

type variables
private long il_patid = 0
private long il_idestime = 0
private long il_idfact = 0
private int ii_modeajout = 0
private int ii_modeajout1 = 0
public boolean change = false
private DataWindowChild dddwin
end variables

forward prototypes
public subroutine dwinrefresh ()
public subroutine creerfact (date p_factdate, long p_statusid, decimal p_montant)
end prototypes

public subroutine dwinrefresh ();int i

for i = 1 to dw_estime.rowcount()
	dw_estime.setITem(i,'traiter',0)
	dw_estime.event ue_update()
next

end subroutine

public subroutine creerfact (date p_factdate, long p_statusid, decimal p_montant);long ll_traitid, ll_affect

ll_traitid = w_traitements.il_traitid
select affect into :ll_affect from t_status where status_id = :p_statusid;
insert into factures_traitements(date_facture,montant,affect,imp,cache,status_id, traitement_id)
values(:p_factdate, :p_montant, :ll_affect,0,0,:p_statusid,:ll_traitid);
end subroutine

on w_estime.create
int iCurrent
call super::create
this.rb_ang=create rb_ang
this.rb_fran=create rb_fran
this.st_2=create st_2
this.st_nom=create st_nom
this.cb_passer=create cb_passer
this.cb_delete=create cb_delete
this.cb_supp=create cb_supp
this.cb_ajout=create cb_ajout
this.dw_estimed=create dw_estimed
this.st_1=create st_1
this.cb_update=create cb_update
this.cb_print=create cb_print
this.cb_insert=create cb_insert
this.cb_close=create cb_close
this.dw_estime=create dw_estime
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_ang
this.Control[iCurrent+2]=this.rb_fran
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_nom
this.Control[iCurrent+5]=this.cb_passer
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.cb_supp
this.Control[iCurrent+8]=this.cb_ajout
this.Control[iCurrent+9]=this.dw_estimed
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.cb_update
this.Control[iCurrent+12]=this.cb_print
this.Control[iCurrent+13]=this.cb_insert
this.Control[iCurrent+14]=this.cb_close
this.Control[iCurrent+15]=this.dw_estime
end on

on w_estime.destroy
call super::destroy
destroy(this.rb_ang)
destroy(this.rb_fran)
destroy(this.st_2)
destroy(this.st_nom)
destroy(this.cb_passer)
destroy(this.cb_delete)
destroy(this.cb_supp)
destroy(this.cb_ajout)
destroy(this.dw_estimed)
destroy(this.st_1)
destroy(this.cb_update)
destroy(this.cb_print)
destroy(this.cb_insert)
destroy(this.cb_close)
destroy(this.dw_estime)
end on

event open;string ls_nom, ls_prenom, ls_langue

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_patid = message.doubleparm
select patient_nom, patient_prenom, langue into :ls_nom, :ls_prenom, :ls_langue from patient where patient_id = :il_patid;
if ls_langue = 'F' then
	rb_fran.checked = true
else
	if ls_langue = 'A' then 
		rb_ang.checked = true
	else
		rb_fran.checked = true
	end if
end if

if dw_estime.GetChild('status_id', dddwin) = -1 then
	error_type(0)
end if
dddwin.SetTransObject(SQLCA)
if rb_fran.checked then
	dddwin.setfilter("Mid(code,7,1) = 'F'")
	dddwin.retrieve()
else
	if rb_ang.checked then
		dddwin.setfilter("Mid(code,7,1) = 'A'")
	dddwin.retrieve()
	end if
end if

st_nom.text = ls_nom + ' ' + ls_prenom
dw_estimed.retrieve(il_patid)
if dw_estime.rowcount() > 0 then
	dwinrefresh()
	cb_print.enabled = true
end if
end event

type rb_ang from radiobutton within w_estime
integer x = 1070
integer y = 612
integer width = 457
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anglais"
end type

event clicked;if rb_fran.checked then
	dddwin.setfilter("Mid(code,7,1) = 'F'")
	dddwin.retrieve()
else
	if rb_ang.checked then
		dddwin.setfilter("Mid(code,7,1) = 'A'")
	dddwin.retrieve()
	end if
end if
end event

type rb_fran from radiobutton within w_estime
integer x = 640
integer y = 612
integer width = 457
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Français"
boolean checked = true
end type

event clicked;if rb_fran.checked then
	dddwin.setfilter("Mid(code,7,1) = 'F'")
	dddwin.retrieve()
else
	if rb_ang.checked then
		dddwin.setfilter("Mid(code,7,1) = 'A'")
	dddwin.retrieve()
	end if
end if
end event

type st_2 from statictext within w_estime
integer x = 23
integer y = 620
integer width = 599
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Langue du patient "
boolean focusrectangle = false
end type

type st_nom from statictext within w_estime
integer x = 37
integer y = 116
integer width = 1225
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_passer from commandbutton within w_estime
integer x = 1815
integer y = 1916
integer width = 599
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Passer traitement"
end type

event clicked;dec{2} ld_montant, ld_prixlab
int i
long ll_traiter, ll_statusid, ll_traitid, ll_flag
date ldt_fact

dw_estime.event ue_update()
ll_traitid = w_traitements.il_traitid
if ll_traitid > 0 then
	for i = 1 to dw_estime.rowcount()
		ll_traiter = dw_estime.getItemNumber(i,'traiter')
		ll_flag = dw_estime.getItemNumber(i,'flag')
		if ll_traiter = 1 and ll_flag = 0 then
			ll_statusid = dw_estime.getItemNumber(i,'status_id')
			ldt_fact = dw_estime.getItemDate(i,'factdate')
			ld_prixlab = dw_estime.getItemNumber(i,'prixlab')
			ld_montant = dw_estime.getItemNumber(i,'t_factest_prix')
			creerfact(ldt_fact,ll_statusid,ld_montant)
			dw_estime.setItem(i,'flag',1)
		end if 
	next
	dw_estime.event ue_update()
else
	error_type(113)
end if
end event

type cb_delete from commandbutton within w_estime
integer x = 617
integer y = 1916
integer width = 599
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;dw_estime.event ue_delete()
end event

type cb_supp from commandbutton within w_estime
integer x = 2798
integer y = 608
integer width = 795
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimé estimé"
end type

event clicked;dw_estimed.event ue_delete()

end event

type cb_ajout from commandbutton within w_estime
integer x = 2057
integer y = 608
integer width = 741
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouté  estimé"
end type

event clicked;long ll_row

ll_row = dw_estimed.insertrow(0)
dw_estimed.scrollToRow(ll_row)
dw_estimed.setItem(ll_row,'dateest',today())
dw_estimed.setItem(ll_row,'typetrait','p')
dw_estimed.setItem(ll_row,'patient_id',il_patid)
ii_modeajout = 1
dw_estimed.event ue_update()

end event

type dw_estimed from u_dw within w_estime
event ue_update ( )
event ue_dwnlbup pbm_dwnlbuttonup
event ue_delete ( )
integer x = 2053
integer y = 32
integer width = 1545
integer height = 568
integer taborder = 10
string title = "none"
string dataobject = "d_estimed"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();if update() = 1 then
	commit using SQLCA;
	ii_modeajout = 0
else
	rollback using SQLCA;
end if

end event

event ue_dwnlbup;int i

if getcolumnname() = 'typetrait' then
	dw_estimed.event ue_update()
	if dw_estimed.getItemString(row,'typetrait') = 'c' then
		for i = 1 to dw_estime.rowCount()
			dw_estime.setItem(i,'imprimer',0)
			dw_estime.event ue_update()
		next
	end if
end if
end event

event ue_delete();dw_estimed.deleteRow(dw_estimed.getRow())
dw_estimed.event ue_update()
end event

event constructor;string ls_langue


dw_estimed.setTransObject(SQLCA)
dw_estimed.setRowFocusIndicator(hand!)
dw_estime.setTransObject(SQLCA)
dw_estime.setRowFocusIndicator(hand!)
//if dw_estime.GetChild('status_id', dddwin) = -1 then
//	error_type(0)
//end if
//dddwin.SetTransObject(SQLCA)
//if rb_fran.checked then
//	dddwin.setfilter("Mid(code,7,1) = 'F'")
//	dddwin.retrieve()
//else
//	if rb_ang.checked then
//		dddwin.setfilter("Mid(code,7,1) = 'A'")
//	dddwin.retrieve()
//	end if
//end if
end event

event itemchanged;if dwo.name = 'dateest' then
	dw_estimed.event ue_update()
end if
end event

event rowfocuschanged;/* Copyright II4net Inc.
   créer le: 11-04-2003
	modifier le: 11-04-2003
	Auteur dernière modif: Dave Tremblay
*/

if currentrow > 0 then
	dw_estime.retrieve(dw_estimed.getItemNumber(currentrow,'id_estime'))
else
	dw_estime.retrieve(0)
end if
end event

event updateend;long ll_row
integer test

if rowsinserted <> 0 then
	ll_row = this.getrow()
	select max(id_estime) into :il_idestime from t_estime;
	if isnull(il_idestime) then il_idestime = 1
	this.setitem(ll_row,'id_estime',il_idestime)
	if ii_modeajout = 1 then
		test = this.setitemstatus(ll_row,'id_estime',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'dateest',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'typetrait',primary!,notmodified!)
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

type st_1 from statictext within w_estime
integer x = 18
integer y = 20
integer width = 1609
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Estimé pour formulaire standard pour:"
boolean focusrectangle = false
end type

type cb_update from commandbutton within w_estime
integer x = 2414
integer y = 1916
integer width = 599
integer height = 112
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

event clicked;dw_estime.event ue_update()
if dw_estime.rowcount() > 0 then
	cb_print.enabled = true
end if
end event

type cb_print from commandbutton within w_estime
integer x = 1216
integer y = 1916
integer width = 599
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Imprimer"
end type

event clicked;long ll_idestime

ll_idestime = dw_estimed.getItemNumber(dw_estimed.getRow(),'id_estime')
opensheetwithparm(w_assstand,ll_idestime,w_principal,2,layered!)
w_assstand.title = 'Formulaire assurance standard'
end event

type cb_insert from commandbutton within w_estime
integer x = 18
integer y = 1916
integer width = 599
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 09-04-2003
	modifier le: 24-04-2003
	Auteur dernière modif: Dave Tremblay
*/

long ll_row, ll_estime 
string ls_typetrait

if il_idestime = 0 then
	ll_estime = dw_estimed.getItemNumber(dw_estimed.getRow(),'id_estime')
else
	ll_estime = il_idestime
end if
ls_typetrait = dw_estimed.getItemString(dw_estimed.getRow(),'typetrait')
ll_row = dw_estime.insertrow(0)
dw_estime.scrollToRow(ll_row)
dw_estime.setItem(ll_row,'patient_id',il_patid)
dw_estime.setItem(ll_row,'factdate',today())
dw_estime.setItem(ll_row,'t_factest_id_estime',ll_estime)
dw_estime.setItem(ll_row,'traiter',0)
if ls_typetrait = 'p' then
	dw_estime.setItem(ll_row,'imprimer',1)
else
	dw_estime.setItem(ll_row,'imprimer',0)
end if
dw_estime.setItem(ll_row,'flag',0)
dw_estime.setItem(ll_row,'prixlab',0)
change = true
ii_modeajout1 = 1
end event

type cb_close from commandbutton within w_estime
integer x = 3013
integer y = 1916
integer width = 599
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if change then
	if error_type(200) = 1 then
		dw_estime.event ue_update()
	end if
end if
if isvalid(w_traitements) then
	if w_traitements.il_traitid > 0 then
		w_traitements.tab_dossfin.tabpage_tous.dw_traitements.retrieve(w_traitements.il_traitid)
		w_traitements.tab_sommaires.tabpage_factures.dw_factures_sommaire.retrieve(w_traitements.il_traitid)
		w_traitements.cbrefresh()
	end if
end if
close(parent)
end event

type dw_estime from u_dw within w_estime
event ue_update ( )
event ue_delete ( )
integer x = 23
integer y = 728
integer width = 3579
integer height = 1168
integer taborder = 10
string title = "none"
string dataobject = "d_estime"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();if update() = 1 then
	commit using SQLCA;
	change = false
	ii_modeajout1 = 0
else
	rollback using SQLCA;
end if
end event

event ue_delete();dw_estime.deleterow(dw_estime.getRow())
dw_estime.event ue_update()
if rowcount() = 0 then
	cb_print.enabled = false
end if
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

event itemfocuschanged;string ls_desc
dec ld_prix
long ll_statutid

ll_statutid = this.getItemNumber(row,'status_id')
if dwo.name = 't_factest_descrip' then
	select description, prixsugg into :ls_desc, :ld_prix from t_status where status_id = :ll_statutid;
	this.setITem(row,'t_factest_descrip',ls_desc)
	this.setITem(row,'t_factest_prix',ld_prix)
end if
end event

event rowfocuschanged;/* Copyright II4net Inc.
   créer le: 18-04-2003
	modifier le: 18-04-2003
	Auteur dernière modif: Dave Tremblay
*/

long ll_flag


if currentrow > 0 then
	ll_flag = dw_estime.getItemNumber(currentrow,'flag')
	if ll_flag = 1 then
			dw_estime.object.factdate.edit.displayOnly = TRUE
			dw_estime.object.dent.edit.displayOnly = TRUE
	//		dw_estime.object.status_id.edit.displayOnly = TRUE
			dw_estime.object.t_factest_descrip.edit.displayOnly = TRUE
			dw_estime.object.prixlab.edit.displayOnly = TRUE
			dw_estime.object.t_factest_prix.edit.displayOnly = TRUE
	else
			dw_estime.object.factdate.edit.displayOnly = FALSE
			dw_estime.object.dent.edit.displayOnly = FALSE
	//		dw_estime.object.status_id.edit.displayOnly = FALSE
			dw_estime.object.t_factest_descrip.edit.displayOnly = FALSE
			dw_estime.object.prixlab.edit.displayOnly = FALSE
			dw_estime.object.t_factest_prix.edit.displayOnly = FALSE
	end if
end if
end event

event updateend;long ll_row
integer test

if rowsinserted <> 0 then
	ll_row = this.getrow()
	select max(id_fact) into :il_idfact from t_factest;
	if isnull(il_idfact) then il_idfact = 1
		this.setitem(ll_row,'id_fact',il_idfact)
	if ii_modeajout1 = 1 then
		test = this.setitemstatus(ll_row,'id_fact',primary!,notmodified!)   
		test = this.setitemstatus(ll_row,'status_id',primary!,notmodified!)   
		test = this.setitemstatus(ll_row,'factdate',primary!,notmodified!)   
		test = this.setitemstatus(ll_row,'prixlab',primary!,notmodified!)   
		test = this.setitemstatus(ll_row,'patient_id',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'t_factest_id_estime',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'t_factest_descrip',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'dent',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'t_factest_prix',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'traiter',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'flag',primary!,notmodified!)
		test = this.setitemstatus(ll_row,'imprimer',primary!,notmodified!)
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

