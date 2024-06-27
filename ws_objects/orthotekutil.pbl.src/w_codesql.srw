$PBExportHeader$w_codesql.srw
forward
global type w_codesql from w_child
end type
type st_split from u_st_splitbar within w_codesql
end type
type pb_next from picturebutton within w_codesql
end type
type pb_prior from picturebutton within w_codesql
end type
type cb_5 from commandbutton within w_codesql
end type
type cb_4 from commandbutton within w_codesql
end type
type cb_3 from commandbutton within w_codesql
end type
type cb_2 from commandbutton within w_codesql
end type
type cb_1 from commandbutton within w_codesql
end type
type mle_req from multilineedit within w_codesql
end type
type st_1 from statictext within w_codesql
end type
type dw_sql from u_dw within w_codesql
end type
type mle_sql from multilineedit within w_codesql
end type
end forward

global type w_codesql from w_child
integer width = 4640
integer height = 2688
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
st_split st_split
pb_next pb_next
pb_prior pb_prior
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_req mle_req
st_1 st_1
dw_sql dw_sql
mle_sql mle_sql
end type
global w_codesql w_codesql

type variables
private:
string is_requetes[]
long il_cpt
boolean ib_aff = false
end variables

forward prototypes
public subroutine uf_execute (string as_req)
public subroutine uf_traduction ()
end prototypes

public subroutine uf_execute (string as_req);string ls_newsyntax, ls_errorfromsql, ls_errorcreate, ls_req

ls_req = trim(rep(as_req, '~r~n', ' '))

setPointer(HourGlass!)
// Exécute la requête
if left(lower(ls_req), 6) = 'select' then
	ib_aff = false
	ls_newsyntax = SQLCA.SyntaxFromSQL(ls_req, "Style(Type=Grid)", ls_errorfromSQL)
	if Len(ls_errorfromSQL) > 0 then
		messagebox("Erreur",ls_errorfromSQL)
		return
	end if
	
	dw_sql.create(ls_newsyntax, ls_errorcreate)
	if Len(ls_errorcreate) > 0 then
		messagebox("Erreur","Erreur de création de la datawindow :~r~n" + ls_errorcreate)
		return
	end if
	
	ls_errorcreate = dw_sql.inv_report.of_addCompute("getRow()", "Detail", Left!, VCenter!)
	if Len(ls_errorcreate) > 0 then
		messagebox("Erreur","Erreur de création de la datawindow :~r~n" + ls_errorcreate)
		return
	end if
	
	dw_sql.SetTransObject(SQLCA)
	dw_sql.Retrieve()
	ib_aff = true
else
	execute immediate :ls_req using SQLCA;
	if sqlca.sqlcode <> 0 then
		messagebox("Erreur",SQLCA.SQLErrText)
		return
	end if
	
	if ib_aff then dw_sql.Retrieve()
end if

end subroutine

public subroutine uf_traduction ();if v_langue = 'an' then
	this.title = "SQL query"
	st_1.text = "SQL query"
	cb_1.text = "Print"
	cb_5.text = "Export to Excel"
	cb_3.text = "Execute"
	cb_2.text = "Close"
else
	this.title = "Requête SQL"
end if
end subroutine

on w_codesql.create
int iCurrent
call super::create
this.st_split=create st_split
this.pb_next=create pb_next
this.pb_prior=create pb_prior
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_req=create mle_req
this.st_1=create st_1
this.dw_sql=create dw_sql
this.mle_sql=create mle_sql
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_split
this.Control[iCurrent+2]=this.pb_next
this.Control[iCurrent+3]=this.pb_prior
this.Control[iCurrent+4]=this.cb_5
this.Control[iCurrent+5]=this.cb_4
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.mle_req
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.dw_sql
this.Control[iCurrent+12]=this.mle_sql
end on

on w_codesql.destroy
call super::destroy
destroy(this.st_split)
destroy(this.pb_next)
destroy(this.pb_prior)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_req)
destroy(this.st_1)
destroy(this.dw_sql)
destroy(this.mle_sql)
end on

type st_split from u_st_splitbar within w_codesql
string tag = "resize=mbar"
integer x = 18
integer y = 1324
integer width = 4622
end type

event constructor;call super::constructor;of_register(mle_req, ABOVE)
of_register(dw_sql, BELOW)
of_setbarcolor(rgb(25, 0, 200))
of_setbarmovecolor(rgb(60, 10, 255))
end event

type pb_next from picturebutton within w_codesql
string tag = "resize=n"
integer x = 690
integer width = 101
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "Redo!"
string disabledname = "Next!"
alignment htextalign = left!
end type

event clicked;if il_cpt < upperbound(is_requetes) then
	il_cpt ++
	mle_req.text = is_requetes[il_cpt]
	pb_prior.enabled = true
end if

if il_cpt = upperbound(is_requetes) then this.enabled = false

end event

type pb_prior from picturebutton within w_codesql
string tag = "resize=n"
integer x = 585
integer width = 101
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "Undo!"
string disabledname = "Prior!"
alignment htextalign = left!
end type

event clicked;if il_cpt > 1 then
	il_cpt --
	mle_req.text = is_requetes[il_cpt]
	pb_next.enabled = true
end if

if il_cpt = 1 then this.enabled = false

end event

type cb_5 from commandbutton within w_codesql
string tag = "resize=frmbsr"
integer x = 2235
integer y = 2608
integer width = 805
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exporter vers Excel"
end type

event clicked;string ls_fich, ls_bidon

if not ib_aff then return 0

ls_fich = "c:\ii4net\orthotek\requete.xls"

if getFileSaveName("Enregistrer requête", ls_fich, ls_bidon, "xls", "Fichiers excel (*.xls), *.xls", "c:\ii4net\orthotek", 9234) = 1 then
	dw_sql.saveAs(ls_fich,Excel8!,True)
end if

end event

type cb_4 from commandbutton within w_codesql
string tag = "resize=frmbsr"
integer x = 818
integer y = 2608
integer width = 1417
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_3 from commandbutton within w_codesql
string tag = "resize=frmbsr"
integer x = 3045
integer y = 2608
integer width = 805
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exécuter"
end type

event clicked;il_cpt = upperbound(is_requetes) + 1
is_requetes[il_cpt] = mle_req.text
if il_cpt > 1 then pb_prior.enabled = true
pb_next.enabled = false

uf_execute(is_requetes[il_cpt])

end event

type cb_2 from commandbutton within w_codesql
string tag = "resize=frmbsr"
integer x = 3854
integer y = 2608
integer width = 805
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_codesql
string tag = "resize=frmbsr"
integer x = 14
integer y = 2608
integer width = 805
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;dw_sql.event pfc_print()
end event

type mle_req from multilineedit within w_codesql
string tag = "resize=arb"
integer x = 23
integer y = 80
integer width = 4626
integer height = 1244
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_codesql
string tag = "resize=n"
integer x = 32
integer width = 480
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Requête SQL"
boolean focusrectangle = false
end type

type dw_sql from u_dw within w_codesql
string tag = "resize=mbar"
integer x = 18
integer y = 1344
integer width = 4631
integer height = 1252
integer taborder = 30
string title = "none"
boolean hscrollbar = true
boolean hsplitscroll = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
string is_objet_rbutton = "0"
end type

event dberror;if sqldbcode <> -308 and &
	sqldbcode <> -195 and &
	sqldbcode <> -194 and &
	sqldbcode <> -193 and &
	sqldbcode <> -85 then
	str_error  ErrorStr
	//populate the error structure
	ErrorStr.sqldbcode = sqldbcode
	ErrorStr.sqlerrtext = sqlerrtext
	ErrorStr.sqlsyntax = sqlsyntax
	ErrorStr.buffer = buffer
	ErrorStr.row = row
	
	//open the error window
	OpenWithParm ( w_error , ErrorStr )
	//do not display the error message
end if
RETURN 1

end event

event constructor;call super::constructor;of_setreport(true)
end event

type mle_sql from multilineedit within w_codesql
boolean visible = false
integer x = 18
integer y = 1412
integer width = 3589
integer height = 836
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

