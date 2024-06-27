$PBExportHeader$w_printers.srw
forward
global type w_printers from w_child
end type
type cb_update from commandbutton within w_printers
end type
type cb_reinit from commandbutton within w_printers
end type
type st_title from statictext within w_printers
end type
type dw_printers from u_dw within w_printers
end type
type cb_close from commandbutton within w_printers
end type
end forward

global type w_printers from w_child
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
cb_update cb_update
cb_reinit cb_reinit
st_title st_title
dw_printers dw_printers
cb_close cb_close
end type
global w_printers w_printers

type variables
boolean change = false
private string is_serial
end variables

forward prototypes
public function string deltab (string fs_text)
public function long of_reinit ()
end prototypes

public function string deltab (string fs_text);long ll_place

ll_place = pos (fs_text, "~t" )
do while ll_place > 0
	fs_text = replace(fs_text,ll_place,1,' - ')
	ll_place = pos (fs_text, "~t" )
loop
return fs_text
end function

public function long of_reinit ();//////////////////////////////
//
// Créé par: Eric Vézina
// Créé le : 29-10-2003
// Demande : Louis Cadotte
// Version : 7.6.1
//
// Modifié par: Dave Tremblay
// Modifié le: 29-10-2003
//
// Modifié par: Sébastien Tremblay
// Modifié le: 2009-11-04
// 
////////////////////////////////

long ll_cpt, ll_rangee, ll_nb_rangees, ll_count, ll_user
string ls_req, ls_syntaxe, ls_erreurs, ls_prntrs, ls_noserie, ls_imp[]
n_ds lnv_imps

// Créer la table temporaire
ls_req = "create table #tmp_impsys(nom_imp varchar(255) not null,~r~n" + &
											 "pilote varchar(255) null,~r~n" + &
											 "port varchar(255) null)"
execute immediate :ls_req;
gf_sqlerr()

ls_syntaxe = SQLCA.syntaxfromsql("select * from #tmp_impsys", "", ls_erreurs)
if ls_syntaxe = '' then
	gnv_app.inv_error.of_message("pfc_systemerror", {ls_erreurs})
	return -1
end if

// ls_prntrs  = PrintGetPrinters()
gnv_app.of_getprinterlist( ls_imp, ls_prntrs)

lnv_imps = create n_ds
lnv_imps.create(ls_syntaxe)
lnv_imps.importstring(ls_prntrs)
lnv_imps.setSort("nom_imp A")
lnv_imps.Sort()
ll_count = lnv_imps.rowCount()

ll_nb_rangees = dw_printers.rowCount()
for ll_cpt = 1 to ll_nb_rangees
	dw_printers.object.sel[ll_cpt] = 0
next

ls_noserie = string(gf_orthoini('printer','UniqueId', '', false))
ll_user = gl_idpers

dw_printers.setRedraw(false)

// Boucle pour déterminer le nombre d'imprimante
for ll_cpt = 1 to ll_count
	ll_rangee = dw_printers.find("pname = '" + lnv_imps.object.nom_imp[ll_cpt] + "'", 1, dw_printers.rowCount())
	
	if ll_rangee > 0 then
		dw_printers.object.sel[ll_rangee] = 1
	else
		ll_rangee = dw_printers.insertRow(0)
		dw_printers.object.pname[ll_rangee] = lnv_imps.object.nom_imp[ll_cpt]
		dw_printers.object.id_personnel[ll_rangee] = ll_user
		dw_printers.object.serialnumber[ll_rangee] = ls_noserie
		dw_printers.object.ortho_id[ll_rangee] = v_no_ortho
	end if
next

// Ménage
destroy lnv_imps
ls_req = "drop table #tmp_impsys"
execute immediate :ls_req;
gf_sqlerr()

ll_cpt = 1

do while ll_cpt <= dw_printers.rowCount()
	if dw_printers.object.sel[ll_cpt] = 0 then
		dw_printers.deleteRow(ll_cpt)
	else
		ll_cpt ++
	end if
loop

dw_printers.sort()

dw_printers.setRedraw(true)

if dw_printers.update() < 1 then return -1

return dw_printers.rowCount()
end function

on w_printers.create
int iCurrent
call super::create
this.cb_update=create cb_update
this.cb_reinit=create cb_reinit
this.st_title=create st_title
this.dw_printers=create dw_printers
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_update
this.Control[iCurrent+2]=this.cb_reinit
this.Control[iCurrent+3]=this.st_title
this.Control[iCurrent+4]=this.dw_printers
this.Control[iCurrent+5]=this.cb_close
end on

on w_printers.destroy
call super::destroy
destroy(this.cb_update)
destroy(this.cb_reinit)
destroy(this.st_title)
destroy(this.dw_printers)
destroy(this.cb_close)
end on

event open;call super::open;is_serial = gf_orthoini('printer','UniqueId', '', false)
dw_printers.retrieve(is_serial,gl_idpers)

end event

type cb_update from commandbutton within w_printers
integer x = 1449
integer y = 1928
integer width = 1307
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;if dw_printers.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_reinit from commandbutton within w_printers
integer y = 1928
integer width = 1440
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Réinitialiser"
end type

event clicked;of_reinit()

////////////////////////////////
////
//// Créé par: Eric Vézina
//// Créé le : 29-10-2003
//// Demande : Louis Cadotte
//// Version : 7.6.1
//// Modifié par: Dave Tremblay
//// Modifié le: 29-10-2003
//// 
//////////////////////////////////
//
//long ll_place, ll_end, ll_result, i, k = 1, j, ll_nbcar
//string ls_left,ls_prntrs
//
//delete from t_printers where serialnumber = :il_serial;
//ls_prntrs  = PrintGetPrinters()
//
//// Boucle pour déterminer le nombre d'imprimante
//
//DO WHILE ls_prntrs <> ''
//	ll_place = pos (ls_prntrs, "~n" ) 
//	ll_end = pos (ls_prntrs, "~t")
//	ls_left = Left (ls_prntrs, ll_end - 1)
//	ls_prntrs = Mid (ls_prntrs, ll_place + 1)
//	if ll_place = 0 then
//		exit
//	else
//		k = k + 1
//	end if
//LOOP
//ls_prntrs  = PrintGetPrinters()
//FOR i = k to 1  STEP -1 
//	ll_place = pos (ls_prntrs, "~n" ) 
//	ll_end = pos (ls_prntrs, "~t")
//	ls_left = Left (ls_prntrs, ll_end - 1)
//	insert into t_printers(serialnumber,pname,ortho_id,jobtype) values(:il_serial,:ls_left,:v_no_ortho,1);
//	error_type(-1)
//	ls_prntrs = Mid (ls_prntrs, ll_place + 1)
//NEXT
////ll_end = pos (ls_prntrs, "~t")
////ls_left = Left (ls_prntrs, ll_end - 1)
////insert into t_printers(serialnumber,pname,ortho_id) values(:il_serial,:ls_left,:v_no_ortho);
//dw_printers.retrieve(il_serial)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Refresh'
end if
end event

type st_title from statictext within w_printers
integer width = 1646
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "GESTION DES IMPRIMANTES"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Printer management'
end if
end event

type dw_printers from u_dw within w_printers
integer x = 37
integer y = 96
integer width = 3570
integer height = 1824
integer taborder = 10
string title = "printers"
string dataobject = "d_printers"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_name.text = "Printer's name"
end if
end event

event editchanged;change = true
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

event itemchanged;change = true
end event

type cb_close from commandbutton within w_printers
integer x = 2761
integer y = 1928
integer width = 869
integer height = 112
integer taborder = 20
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
		if dw_printers.update() = 1 then
			commit using SQLCA;
			change = false
		else
			rollback;
			error_type(50)
		end if
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

