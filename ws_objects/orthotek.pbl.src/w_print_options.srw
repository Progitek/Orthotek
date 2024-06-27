$PBExportHeader$w_print_options.srw
forward
global type w_print_options from window
end type
type cb_4 from commandbutton within w_print_options
end type
type cb_3 from commandbutton within w_print_options
end type
type cb_2 from commandbutton within w_print_options
end type
type cb_ok from commandbutton within w_print_options
end type
type dw_print_options from u_dw within w_print_options
end type
end forward

global type w_print_options from window
integer width = 2533
integer height = 1632
windowtype windowtype = response!
long backcolor = 15780518
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
global w_print_options w_print_options

type variables
 string is_prntrs, is_courriel, is_idforeignkey
 DataWindow idw_print
 DataStore ids_print
 DataWindowChild dddw_printers
 private string is_serial
 private boolean ib_mrgh = false, ib_mrgg = false
 string is_piecejointe
 long il_idpatient
end variables

forward prototypes
public subroutine wf_print ()
public subroutine wf_set_printer ()
public function integer of_envoidocument ()
public function integer of_creerpiecejointe ()
end prototypes

event ue_ok();integer li_bac2
long ll_margeg, ll_margeh
// Appeller la fonction print d'une datawindow

wf_print()
if gb_imp = false then 
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("imprimanteselectionner", is_prntrs)
	li_bac2 = dw_print_options.getItemNumber(dw_print_options.getRow(),'bac')
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("bacimprimante", li_bac2)
	ll_margeh = dw_print_options.object.etqmargeh[1]
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("margehaut", ll_margeh)
	ll_margeg = dw_print_options.object.etqmargeg[1]	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("margegauche", ll_margeg)
end if
gi_qteimp = dw_print_options.Object.copies[1]
gb_imp = true
if gb_datawindow then
	CloseWithReturn(this,idw_print)
else
	CloseWithReturn(this,ids_print)
end if

end event

event ue_cancel();// Fermer la fenêtre

gi_qteimp = 0
if gb_datawindow then
	if not gb_imp then
		destroy idw_print
		setNull(idw_print)
	end if
	closeWithReturn(this, idw_print)
else
	if not gb_imp then
		destroy ids_print
		setNull(ids_print)
	end if
	closeWithReturn(this, ids_print)
end if

end event

event ue_printer();// Setup de l'imprimante

if PrintSetup() = 1 then
	setnull(is_prntrs)
end if
wf_set_printer()
end event

public subroutine wf_print ();/********************************************************
 Sélectionner les configuations désirées à l'imprimante
 et appeller l'impression
*********************************************************/

string ls_collate, ls_range, ls_printer, ls_imprimante, ls_docname
long ll_margeh, ll_margeg, ll_pos, ll_ret, i
integer li_copies, li_rangetype, li_rangeinclude, li_bac, li_bac1, li_bac2, li_bac3, li_bac4, li_bac5
n_cst_filesrvwin32 lnv_file
n_cst_dirattrib lnv_listfile[]
str_mail st_mail
string ls_tempimp[]

if dw_print_options.acceptText() = -1 then return
ls_printer = dw_print_options.object.printer[1]
ls_collate = dw_print_options.object.Collate[1]
li_copies = dw_print_options.object.copies[1]
li_rangetype = dw_print_options.object.range_type[1]
ls_range = dw_print_options.object.range[1]
li_rangeinclude = dw_print_options.object.range_include[1]
li_bac = dw_print_options.object.bac[1]
ll_margeh = dw_print_options.object.etqmargeh[1]
ll_margeg = dw_print_options.object.etqmargeg[1]

if ib_mrgh then
	if gb_datawindow then
		gf_orthoini("printer", is_prntrs + '.' + idw_print.dataobject + '.h', string(ll_margeh), true)
	else
		gf_orthoini("printer", is_prntrs + '.' + ids_print.dataobject + '.h', string(ll_margeh), true)
	end if
end if

if ib_mrgg then
	if gb_datawindow then
		gf_orthoini("printer", is_prntrs + '.' + idw_print.dataobject + '.g', string(ll_margeg), true)
	else
		gf_orthoini("printer", is_prntrs + '.' + ids_print.dataobject + '.g', string(ll_margeg), true)
	end if
end if

select bac1,bac2,bac3,bac4,bac5 into :li_bac1,:li_bac2,:li_bac3,:li_bac4,:li_bac5 
from t_printers 
where pname = :ls_printer and serialnumber = :is_serial and id_personnel = :gl_idpers;

if isnull(li_bac1) then li_bac1 = 1
if isnull(li_bac2) then li_bac2 = 1
if isnull(li_bac3) then li_bac3 = 1
if isnull(li_bac4) then li_bac4 = 1
if isnull(li_bac5) then li_bac5 = 1

if gb_datawindow then
	idw_print.object.datawindow.print.PrinterName = ls_printer
	choose case li_bac
		case 1
			idw_print.object.datawindow.print.Paper.Source = li_bac1
		case 2
			idw_print.object.datawindow.print.Paper.Source = li_bac2
		case 3
			idw_print.object.datawindow.print.Paper.Source = li_bac3
		case 4
			idw_print.object.datawindow.print.Paper.Source = li_bac4
		case 5
			idw_print.object.datawindow.print.Paper.Source = li_bac5
	end choose
	
	idw_print.object.datawindow.print.collate = ls_collate
	if li_copies > 0 then
		idw_print.object.datawindow.print.copies = li_copies
	end if
	idw_print.object.datawindow.print.margin.top = ll_margeh
	idw_print.object.datawindow.print.margin.left = ll_margeg
	if li_rangetype = 2 then
		if not isnull(ls_range) then
			idw_print.object.datawindow.print.page.range = ls_range
		end if
	end if
	
	CHOOSE CASE dw_print_options.object.typeimp[1]
		CASE 1
			if gb_imp then idw_print.print()
		CASE 2
			
			of_envoidocument()
			
//			IF lnv_file.of_directoryexists("c:\ii4net\orthotek\rapports") = FALSE THEN
//				lnv_file.of_createdirectory("c:\ii4net\orthotek\rapports")
//				do while yield()
//				loop
//			END IF
			
//			FileDelete("c:\ii4net\orthotek\rapports\rapportorthotek.pdf")
//			ls_imprimante = PrintGetPrinters ( )
//			ls_tempimp = split(ls_imprimante,"~n")
//			for i = 1 to upperbound(ls_tempimp)
//				if match(ls_tempimp[i],"PDFCreator") then 
//					exit
//				end if
//			next
//			ls_imprimante = ls_tempimp[i]
//			ll_ret = printsetprinter(ls_imprimante)
//			idw_print.Object.DataWindow.Printer = "PDFCreator"
//			dw_print_options.object.printer[1] = idw_print.object.datawindow.Printer
//			idw_print.print()
//			st_mail.as_destinataire = is_courriel
//			st_mail.as_attachment = "c:\ii4net\orthotek\rapports\rapportorthotek.pdf"		
//			ls_docname = dw_print_options.Object.document[1]
//			st_mail.as_sujet = "Envoi de " + string(ls_docname)
//			st_mail.ai_typeimp = 1
//			openwithparm(w_mail,st_mail)
			
		CASE 3
			
//			GetFileSaveName ("Nom du document", ls_path, ls_file, "XLS","EXCEL (*.xls),*.xls" , "C:\ii4net\dentitek\rapports")
//			idw_print.saveas(ls_path,Excel8!,TRUE)
		
	END CHOOSE	
	
else
	ids_print.object.datawindow.print.PrinterName = ls_printer
	choose case li_bac
		case 1
			ids_print.object.datawindow.print.Paper.Source = li_bac1
		case 2
			ids_print.object.datawindow.print.Paper.Source = li_bac2
		case 3
			ids_print.object.datawindow.print.Paper.Source = li_bac3
		case 4
			ids_print.object.datawindow.print.Paper.Source = li_bac4
		case 5
			ids_print.object.datawindow.print.Paper.Source = li_bac5
	end choose
	
	ids_print.object.datawindow.print.collate = ls_collate
	if li_copies > 0 then
		ids_print.object.datawindow.print.copies = li_copies
	end if
	ids_print.object.datawindow.print.margin.top = ll_margeh
	ids_print.object.datawindow.print.margin.left = ll_margeg
	if li_rangetype = 2 then
		if not isnull(ls_range) then
			ids_print.object.datawindow.print.page.range = ls_range
		end if
	end if
	
	CHOOSE CASE dw_print_options.object.typeimp[1]
		CASE 1
			if gb_imp then ids_print.print()
		CASE 2
			
			of_envoidocument()
			
//			IF lnv_file.of_directoryexists("c:\ii4net\orthotek\rapports") = FALSE THEN
//				lnv_file.of_createdirectory("c:\ii4net\orthotek\rapports")
//				do while yield()
//				loop
//			END IF
			
//			FileDelete("c:\ii4net\orthotek\rapports\rapportorthotek.pdf")
//			ls_imprimante = PrintGetPrinters ( )
//			ls_tempimp = split(ls_imprimante,"~n")
//			for i = 1 to upperbound(ls_tempimp)
//				if match(ls_tempimp[i],"PDFCreator") then 
//					exit
//				end if
//			next
//			ls_imprimante = ls_tempimp[i]
//			ll_ret = printsetprinter(ls_imprimante)
//			ids_print.Object.DataWindow.Printer = "PDFCreator"
//			dw_print_options.object.printer[1] = ids_print.object.datawindow.Printer
//			ids_print.print()
//			st_mail.as_destinataire = is_courriel
//			st_mail.as_attachment = "c:\ii4net\orthotek\rapports\rapportorthotek.pdf"		
//			ls_docname = dw_print_options.Object.document[1]
//			st_mail.as_sujet = "Envoi de " + string(ls_docname)
//			st_mail.ai_typeimp = 1
//			openwithparm(w_mail,st_mail)
			
			
		CASE 3
		
	//		GetFileSaveName ("Nom du document", ls_path, ls_file, "XLS","EXCEL (*.xls),*.xls" , "C:\ii4net\dentitek\rapports")
	//		ids_print.saveas(ls_path,Excel8!,TRUE)
		
	END CHOOSE	
	
end if

end subroutine

public subroutine wf_set_printer ();if isnull(is_prntrs) then
	is_prntrs = PrintGetPrinter()
end if
PrintSetPrinter (is_prntrs)
if gb_datawindow then
	dw_print_options.object.printer[1] = idw_print.object.datawindow.Printer
else
	dw_print_options.object.printer[1] = ids_print.object.datawindow.Printer
end if

end subroutine

public function integer of_envoidocument ();string ls_imprimante, ls_docname, ls_req, ls_syntaxe, ls_erreurs, ls_prntrs, ls_courriel_expediteur, ls_email[], ls_courriel
long ll_pos, ll_ret, ll_row, ll_userid
long i
str_mail st_mail
n_ds lnv_imps

of_creerpiecejointe()

//IF gnv_app.inv_filesrv.of_directoryexists("c:\ii4net\orthotek\rapports") = FALSE THEN
//	gnv_app.inv_filesrv.of_createdirectory("c:\ii4net\orthotek\rapports")
//	do while yield()
//	loop
//END IF
//
//FileDelete("c:\ii4net\orthotek\rapports\rapportorthotek.pdf")
//
//if gb_datawindow then
//	idw_print.SaveAs("c:\ii4net\orthotek\rapports\rapportorthotek.pdf", PDF!, true)
//else
//	choose case ids_print.dataobject
//		case 'd_recunueimp'
//			lnv_imps = gnv_app.inv_entrepotglobal.of_retournedonnee("recu standard pour impression courriel")
//			lnv_imps.SaveAs("c:\ii4net\orthotek\rapports\rapportorthotek.pdf", PDF!, true)
//		case 'd_etatcomptepat'
//			lnv_imps = gnv_app.inv_entrepotglobal.of_retournedonnee("etatcompte pour impression courriel")
//			lnv_imps.SaveAs("c:\ii4net\orthotek\rapports\rapportorthotek.pdf", PDF!, true)
//		case else
//			ids_print.SaveAs("c:\ii4net\orthotek\rapports\rapportorthotek.pdf", PDF!, true)
//	end choose
//
//end if

ll_userid = long(gnv_app.of_getuserid())
select courriel into :ls_courriel_expediteur from t_personnels where id_personnel = :ll_userid;

i = 0
if	dw_print_options.Object.chkcourriel_1[1] = 1 then
	i++
	ls_email[i] = dw_print_options.Object.courriel_1[1] 
end if
if dw_print_options.Object.chkcourriel_2[1] = 1 then
	i++
	ls_email[i] = dw_print_options.Object.courriel_2[1] 
end if
if dw_print_options.Object.chkcourriel_3[1] = 1 then
	i++
	ls_email[i] = dw_print_options.Object.courriel_3[1] 
end if
ls_courriel = unsplit(ls_email,";")

st_mail.as_destinataire = ls_courriel
st_mail.as_idforeignkey = is_idforeignkey
st_mail.as_expediteur = ls_courriel_expediteur
st_mail.as_attachment = is_piecejointe		
ls_docname = dw_print_options.Object.document[1]
st_mail.as_sujet = "Envoi de " + string(ls_docname)
st_mail.ai_typeimp = 1

openwithparm(w_mail,st_mail)

return 0
end function

public function integer of_creerpiecejointe ();string ls_corrpath
long li_ret
n_ds lnv_imps

SetPointer(HourGlass!)
			
select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
if not isnull(il_idpatient) then
	if not  DirectoryExists(ls_corrpath + "\" + string(il_idpatient)) then createdirectory(ls_corrpath + "\" + string(il_idpatient))
	is_piecejointe = ls_corrpath + "\" + string(il_idpatient) + "\doc" + string(now(),"ddmmyyyyhhmmss") + ".pdf"
else
	if not  DirectoryExists(ls_corrpath + "\divers") then createdirectory(ls_corrpath + "\divers")
	is_piecejointe = ls_corrpath + "\divers\" + string(now(),"ddmmyyyyhhmmss") + ".pdf"
end if
		
if gb_datawindow then
	idw_print.SaveAs(is_piecejointe, PDF!, true)
else
	choose case ids_print.dataobject
		case 'd_recunueimp'
			lnv_imps = gnv_app.inv_entrepotglobal.of_retournedonnee("recu standard pour impression courriel")
			lnv_imps.SaveAs(is_piecejointe, PDF!, true)
		case 'd_etatcomptepat'
			lnv_imps = gnv_app.inv_entrepotglobal.of_retournedonnee("etatcompte pour impression courriel")
			lnv_imps.SaveAs(is_piecejointe, PDF!, true)
		case else
			ids_print.SaveAs(is_piecejointe, PDF!, true)
	end choose		
end if

//if ib_dw then
//	li_ret = inv_imp.idw_imp.saveas(is_piecejointe, PDF!, false)
//else
//	li_ret = inv_imp.ids_imp.saveas(is_piecejointe, PDF!, false)
//end if

return 0
end function

on w_print_options.create
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

on w_print_options.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_ok)
destroy(this.dw_print_options)
end on

event open;/********************************************************
 * Initialise les variables d'instance
 * Insert une ligne et initialise les valeurs des colonnes
 **********************************************************/

//w_print_options.move(200,400)
long ll_margeh = -1, ll_margeg = -1, ll_typerecu
string ls_email[]

dw_print_options.InsertRow(0)
dw_print_options.Object.copies[1] = 1
dw_print_options.Object.range_type[1] = 1
dw_print_options.Object.collate[1] = 'No'
dw_print_options.Object.bac[1] = 0

is_courriel = gnv_app.inv_entrepotglobal.of_retournedonnee("impemail")
is_idforeignkey = string(gnv_app.inv_entrepotglobal.of_retournedonnee("idforeignkey"))
il_idpatient = long(gnv_app.inv_entrepotglobal.of_retournedonnee("id_patient_imp"))
select typerecu into :ll_typerecu from t_options where ortho_id = :v_no_ortho;


ls_email = split(is_courriel,";")
if upperbound(ls_email) >= 1 then
	dw_print_options.Object.courriel_1[1] = ls_email[1]
//	dw_print_options.Object.chkcourriel_1.visible = true
end if
if  upperbound(ls_email) >= 2 then
	dw_print_options.Object.courriel_2[1] = ls_email[2]
//	dw_print_options.Object.chkcourriel_2.visible = true
end if
if  upperbound(ls_email) >= 3 then
	dw_print_options.Object.courriel_3[1] = ls_email[3]
//	dw_print_options.Object.chkcourriel_3.visible = true
end if

// dw_print_options.object.t_courriel.text = is_courriel

if gb_datawindow then
	idw_print = Message.PowerObjectParm
	dw_print_options.Object.document[1] = idw_print.Object.DataWindow.Print.DocumentName
	dw_print_options.Object.etqmargeh[1] = long(idw_print.Object.DataWindow.Print.Margin.Top)
	dw_print_options.Object.etqmargeg[1] = long(idw_print.Object.DataWindow.Print.Margin.Left)
else
	ids_print = Message.PowerObjectParm
 	dw_print_options.Object.document[1] = ids_print.Object.DataWindow.Print.DocumentName
	dw_print_options.Object.etqmargeh[1] = long(ids_print.Object.DataWindow.Print.Margin.Top)
	dw_print_options.Object.etqmargeg[1] = long(ids_print.Object.DataWindow.Print.Margin.Left)
end if

select isnull(etqmargeg, -1), isnull(etqmargeh, -1) into :ll_margeg, :ll_margeh 
from t_printers 
where pname = :is_prntrs and serialnumber = :is_serial and id_personnel = :gl_idpers;

if ll_margeh > -1 then dw_print_options.object.etqmargeh[1] = ll_margeh
if ll_margeg > -1 then dw_print_options.object.etqmargeg[1] = ll_margeg

if gb_datawindow then
	ll_margeh = long(gf_orthoini("printer", is_prntrs + '.' + idw_print.dataobject + '.h', '-1', false))
	ll_margeg = long(gf_orthoini("printer", is_prntrs + '.' + idw_print.dataobject + '.g', '-1', false))
else
	ll_margeh = long(gf_orthoini("printer", is_prntrs + '.' + ids_print.dataobject + '.h', '-1', false))
	ll_margeg = long(gf_orthoini("printer", is_prntrs + '.' + ids_print.dataobject + '.g', '-1', false))
end if

if ll_margeh > -1 then dw_print_options.object.etqmargeh[1] = ll_margeh
if ll_margeg > -1 then dw_print_options.object.etqmargeg[1] = ll_margeg


dw_print_options.Object.typeimp[1] = 1

wf_set_printer()

end event

event close;string ls_tag
window activesheet

activesheet = w_principal.GetActiveSheet()

IF IsValid(activesheet) THEN
	ls_tag = activesheet.Tag
ELSE
	ls_tag = 'Unknow windows'
END IF

// place l'imprimante rapport comme imprimante par defaut
gi_imp = 1
if ls_tag = 'Étiquettes' or ls_tag = 'Depot' or ls_tag = 'recuauto' then
	// ne pas remplacer l'imprimante
else
	// replace l'imprimante par default
	PrintSetPrinter(gs_defaultprinter)
end if
end event

type cb_4 from commandbutton within w_print_options
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

type cb_3 from commandbutton within w_print_options
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

type cb_2 from commandbutton within w_print_options
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

type cb_ok from commandbutton within w_print_options
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
boolean default = true
end type

event clicked;Parent.event ue_ok()
end event

type dw_print_options from u_dw within w_print_options
integer x = 41
integer y = 32
integer width = 2455
integer height = 1572
integer taborder = 10
string title = "print_options"
string dataobject = "d_ext_print_options"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
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
	this.object.collate.checkbox.text = 'Collate'
	this.object.t_1.text = 'To type # of pages and/or the groups of pages to be printed'
	this.object.t_2.text = 'separated by points and commas (2,5,8-10)'
else
	this.object.range_type.values = 'Tous~t1/Pages~t2'
end if

select first pname into :is_prntrs from t_printers 
where jobtype = :gi_imp and serialnumber = :is_serial and id_personnel = :gl_idpers
order by ordre asc;

if GetChild('printer', dddw_printers) = -1 then
	error_type(0)
end if
dddw_printers.SetTransObject(SQLCA)
dddw_printers.retrieve(is_serial,gl_idpers)

end event

event itemchanged;long ll_margeh = -1, ll_margeg = -1

if dwo.name = 'printer' then
	setRedraw(false)
	PrintSetPrinter(data)
	
	if gb_datawindow then
		object.etqmargeh[1] = long(idw_print.Object.DataWindow.Print.Margin.Top)
		object.etqmargeg[1] = long(idw_print.Object.DataWindow.Print.Margin.Left)
	else
		object.etqmargeh[1] = long(ids_print.Object.DataWindow.Print.Margin.Top)
		object.etqmargeg[1] = long(ids_print.Object.DataWindow.Print.Margin.Left)
	end if

	select isnull(etqmargeg, -1), isnull(etqmargeh, -1) into :ll_margeg, :ll_margeh 
	from t_printers 
	where pname = :data and serialnumber = :is_serial and id_personnel = :gl_idpers;
	
	if ll_margeh > -1 then object.etqmargeh[1] = ll_margeh
	if ll_margeg > -1 then object.etqmargeg[1] = ll_margeg
	
	if gb_datawindow then
		ll_margeh = long(gf_orthoini("printer", is_prntrs + '.' + idw_print.dataobject + '.h', '-1', false))
		ll_margeg = long(gf_orthoini("printer", is_prntrs + '.' + idw_print.dataobject + '.g', '-1', false))
	else
		ll_margeh = long(gf_orthoini("printer", is_prntrs + '.' + ids_print.dataobject + '.h', '-1', false))
		ll_margeg = long(gf_orthoini("printer", is_prntrs + '.' + ids_print.dataobject + '.g', '-1', false))
	end if
	
	if ll_margeh > -1 then dw_print_options.object.etqmargeh[1] = ll_margeh
	if ll_margeg > -1 then dw_print_options.object.etqmargeg[1] = ll_margeg
	
	ib_mrgh = false
	ib_mrgg = false

	setRedraw(true)
end if


if dwo.name = 'typeimp' then
	
	if long(data) = 2 then
		
		if len(string(dw_print_options.Object.courriel_1[1])) >= 1 then
			dw_print_options.Object.chkcourriel_1.visible = true
			dw_print_options.Object.courriel_1.visible = true
		end if
		if len(string(dw_print_options.Object.courriel_2[1])) >= 1 then
			dw_print_options.Object.courriel_2.visible = true
			dw_print_options.Object.chkcourriel_2.visible = true
		end if
		if len(string(dw_print_options.Object.courriel_3[1])) >= 1 then
			dw_print_options.Object.courriel_3.visible = true
			dw_print_options.Object.chkcourriel_3.visible = true
		end if
		
	else
		dw_print_options.Object.courriel_1.visible = false
		dw_print_options.Object.courriel_2.visible = false
		dw_print_options.Object.courriel_3.visible = false
		dw_print_options.Object.chkcourriel_3.visible = false
		dw_print_options.Object.chkcourriel_2.visible = false
		dw_print_options.Object.chkcourriel_1.visible = false
		
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

event editchanged;call super::editchanged;choose case dwo.name
	case "etqmargeh"
		ib_mrgh = true
	case "etqmargeg"
		ib_mrgg = true
end choose

end event

