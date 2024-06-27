$PBExportHeader$w_printdocument.srw
forward
global type w_printdocument from window
end type
type cb_4 from commandbutton within w_printdocument
end type
type cb_3 from commandbutton within w_printdocument
end type
type cb_2 from commandbutton within w_printdocument
end type
type cb_ok from commandbutton within w_printdocument
end type
type dw_print_options from u_dw within w_printdocument
end type
end forward

global type w_printdocument from window
integer width = 2533
integer height = 1048
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
event ue_ok ( )
event ue_cancel ( )
event ue_printer ( )
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_ok cb_ok
dw_print_options dw_print_options
end type
global w_printdocument w_printdocument

type variables
string is_prntrs
string is_print
DataStore ids_print
DataWindowChild dddw_printers
private string is_serial
end variables

forward prototypes
public subroutine wf_print ()
public subroutine wf_set_printer ()
end prototypes

event ue_ok();// Appeller la fonction print d'une datawindow

wf_print()
Close(this)
end event

event ue_cancel();// Fermer la fenêtre

Close(this)
end event

event ue_printer();// Setup de l'imprimante

PrintSetup()
wf_set_printer()
end event

public subroutine wf_print ();/********************************************************
 Sélectionner les configuations désirées à l'imprimante
 et appeller l'impression
*********************************************************/

string ls_collate, ls_range
integer li_copies, li_rangetype, li_rangeinclude
boolean lb_collate

dw_print_options.accepttext()
ls_collate = dw_print_options.object.Collate[1]
li_copies = dw_print_options.object.copies[1]
li_rangetype = dw_print_options.object.range_type[1]
ls_range = dw_print_options.object.range[1]
li_rangeinclude = dw_print_options.object.range_include[1]
if li_rangetype <> 2 then
	ls_range = ""
end if
if ls_collate = 'yes' then
	lb_collate = true
else
	lb_collate = false
end if
CHOOSE CASE is_print
	CASE 'lettre'
		w_corpslettre.rte_corps.Print(li_copies, ls_range, FALSE, lb_collate)
	CASE 'entente'
		w_ententeedit.rte_corps.Print(li_copies, ls_range, FALSE, lb_collate)
END CHOOSE
end subroutine

public subroutine wf_set_printer ();string ls_print, ls_fullstring,ls_driver, ls_port, ls_temp
long ll_place

ls_fullstring = PrintGetPrinter()
ll_place=pos (ls_fullstring, "~t")
ls_print=left(ls_fullstring, ll_place -1)
ls_temp=mid(ls_fullstring, ll_place +1)
ll_place=pos (ls_temp, "~t")
ls_driver=left(ls_temp, ll_place -1)
ls_port=mid(ls_temp, ll_place +1)
dw_print_options.object.printer[1] = ls_print
end subroutine

on w_printdocument.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_ok=create cb_ok
this.dw_print_options=create dw_print_options
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_ok,&
this.dw_print_options}
end on

on w_printdocument.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_ok)
destroy(this.dw_print_options)
end on

event open;/********************************************************
 * Initialise les varaibles d'instance
 * Insert une ligne et initialise les valeurs des colonnes
 **********************************************************/

//w_print_options.move(200,400)

is_print = message.stringparm
dw_print_options.InsertRow(0)
dw_print_options.Object.document[1] = "Lettre de correspondance"
dw_print_options.object.copies[1] = 1
dw_print_options.Object.range_type[1] = 1
dw_print_options.Object.collate[1] = 'No'
wf_set_printer()
	 
 
 
 
 
end event

event close;// place l'imprimante rapport comme imprimante par defaut
gi_imp = 1

// replace l'imprimante par default
PrintSetPrinter(gs_defaultprinter)

end event

type cb_4 from commandbutton within w_printdocument
integer x = 1888
integer y = 540
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Aide"
end type

type cb_3 from commandbutton within w_printdocument
integer x = 1888
integer y = 408
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimante..."
end type

event clicked;parent.event ue_printer()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Printers..'
end if
end event

type cb_2 from commandbutton within w_printdocument
integer x = 1888
integer y = 280
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Cancel"
end type

event clicked;parent.event ue_cancel()
end event

type cb_ok from commandbutton within w_printdocument
integer x = 1888
integer y = 152
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;Parent.event ue_ok()
end event

type dw_print_options from u_dw within w_printdocument
integer x = 18
integer y = 16
integer width = 2455
integer height = 980
integer taborder = 10
string title = "print_options"
string dataobject = "d_ext_print_options"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;is_serial = string(gf_orthoini('printer','UniqueId', '', false))

if v_langue = 'an' then
	this.object.t_printer.text = 'Printer:'
	this.object.t_copies.text = 'Copy:'
	this.object.gb_manypages.text = 'Many pages'
	this.object.range_type.values = 'All~t1/Pages~t2'
	this.object.t_printer1.text = 'Printer'
	this.object.t_collate.text = 'Collate'
	this.object.t_1.text = 'To type # of pages and/or the groups of pages to be printed'
	this.object.t_2.text = 'separated by points and commas (2,5,8-10)'
else
	this.object.range_type.values = 'Tous~t1/Pages~t2'
end if

select first pname into :is_prntrs 
from t_printers 
where jobtype = :gi_imp AND id_personnel = :gl_idpers AND serialnumber = :is_serial;

if GetChild('printer', dddw_printers) = -1 then
	error_type(0)
end if
dddw_printers.SetTransObject(SQLCA)
dddw_printers.retrieve(is_serial,gl_idpers)
end event

event itemchanged;PrintSetPrinter(data)
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

