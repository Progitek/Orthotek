$PBExportHeader$w_moneris.srw
forward
global type w_moneris from w_child
end type
type cb_viewresult from commandbutton within w_moneris
end type
type cb_view from commandbutton within w_moneris
end type
type cb_print from commandbutton within w_moneris
end type
type cb_save from commandbutton within w_moneris
end type
type st_deselectall from statictext within w_moneris
end type
type st_selectall from statictext within w_moneris
end type
type cb_find from commandbutton within w_moneris
end type
type st_1 from statictext within w_moneris
end type
type st_2 from statictext within w_moneris
end type
type em_debut from editmask within w_moneris
end type
type em_fin from editmask within w_moneris
end type
type cbx_ttes from u_cbx within w_moneris
end type
type cb_env from u_cb within w_moneris
end type
type cb_fermer from u_cb within w_moneris
end type
type st_titre from statictext within w_moneris
end type
type dw_envmon from u_dw within w_moneris
end type
type dw_receptmon from u_dw within w_moneris
end type
end forward

global type w_moneris from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_viewresult cb_viewresult
cb_view cb_view
cb_print cb_print
cb_save cb_save
st_deselectall st_deselectall
st_selectall st_selectall
cb_find cb_find
st_1 st_1
st_2 st_2
em_debut em_debut
em_fin em_fin
cbx_ttes cbx_ttes
cb_env cb_env
cb_fermer cb_fermer
st_titre st_titre
dw_envmon dw_envmon
dw_receptmon dw_receptmon
end type
global w_moneris w_moneris

type variables
Private char ic_typeexport
end variables

forward prototypes
public subroutine of_sauvegarder ()
end prototypes

public subroutine of_sauvegarder ();dw_envmon.acceptText()
if dw_envmon.modifiedcount() > 0 then
	if dw_envmon.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
		error_type(50)
	end if
end if
end subroutine

on w_moneris.create
int iCurrent
call super::create
this.cb_viewresult=create cb_viewresult
this.cb_view=create cb_view
this.cb_print=create cb_print
this.cb_save=create cb_save
this.st_deselectall=create st_deselectall
this.st_selectall=create st_selectall
this.cb_find=create cb_find
this.st_1=create st_1
this.st_2=create st_2
this.em_debut=create em_debut
this.em_fin=create em_fin
this.cbx_ttes=create cbx_ttes
this.cb_env=create cb_env
this.cb_fermer=create cb_fermer
this.st_titre=create st_titre
this.dw_envmon=create dw_envmon
this.dw_receptmon=create dw_receptmon
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_viewresult
this.Control[iCurrent+2]=this.cb_view
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.cb_save
this.Control[iCurrent+5]=this.st_deselectall
this.Control[iCurrent+6]=this.st_selectall
this.Control[iCurrent+7]=this.cb_find
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.em_debut
this.Control[iCurrent+11]=this.em_fin
this.Control[iCurrent+12]=this.cbx_ttes
this.Control[iCurrent+13]=this.cb_env
this.Control[iCurrent+14]=this.cb_fermer
this.Control[iCurrent+15]=this.st_titre
this.Control[iCurrent+16]=this.dw_envmon
this.Control[iCurrent+17]=this.dw_receptmon
end on

on w_moneris.destroy
call super::destroy
destroy(this.cb_viewresult)
destroy(this.cb_view)
destroy(this.cb_print)
destroy(this.cb_save)
destroy(this.st_deselectall)
destroy(this.st_selectall)
destroy(this.cb_find)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_debut)
destroy(this.em_fin)
destroy(this.cbx_ttes)
destroy(this.cb_env)
destroy(this.cb_fermer)
destroy(this.st_titre)
destroy(this.dw_envmon)
destroy(this.dw_receptmon)
end on

event open;call super::open;if ic_typeexport = 'C' then
	title = "Envoi Central Taxe"
	st_titre.text = "Envoi Central Taxe"
	cbx_ttes.visible = false
else
	title = "Envoi Moneris"
	st_1.visible = false
	st_2.visible = false
	em_debut.visible = false
	em_fin.visible = false
	cb_save.visible = false
	cb_find.visible = false
	cb_print.visible = false
	st_selectall.visible = false
	st_deselectall.visible = false
	cb_view.visible = false
	cb_viewresult.visible = false
end if

end event

type cb_viewresult from commandbutton within w_moneris
integer x = 2651
integer y = 1948
integer width = 315
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Visionner"
end type

event clicked;String ls_nomcommun, ls_nomcommunCGI, ls_password, ls_userid, ls_servername, ls_filepath, ls_commandline, ls_nomdecrypte, ls_nomcrypte, ls_nomdiminu
String ls_filename[], ls_name, ls_fullname
integer li_i, li_upperbound
boolean lb_return
u_ftp uo_ftp
datastore ds_zip
n_zlib luo_zlib
string ls_import
ULong lul_unzFile
long j

select ftpuploadpath into :ls_nomdiminu from t_options where ortho_id = :v_no_ortho;

uo_ftp = Create u_ftp
ds_zip = create datastore
ds_zip.dataobject = 'd_zipdirectory'

ls_filepath = '\'+ls_nomdiminu+'\Out\'
Select ctnomcommun, ctnomcommunCGI into :ls_nomcommun, :ls_nomcommunCGI from t_options where ortho_id = :v_no_ortho;
select ftppassword, ftpusername, ftpservername into :ls_password, :ls_userid, :ls_servername from t_options where ortho_id = :v_no_ortho;
if uo_ftp.of_connect("","C:\ii4net\",ls_password,ls_userid,ls_servername) <> 0 then
	uo_ftp.FtpSetCurrentDirectory(uo_ftp.hConnection,"\"+ls_nomdiminu+"\Out\")
	uo_ftp.ftpfilegetdirectorycontents("C:\ii4net\orthotek\paiementlot\",ls_filename)
	li_upperbound = upperbound(ls_filename)
	for li_i = 1 to li_upperbound
		uo_ftp.ftpdeletefile(uo_ftp.hConnection, ls_filepath+ls_filename[li_i])
		
		
		// On liste les fichiers dans la datawindow
		ls_import = luo_zlib.of_Directory("C:\ii4net\orthotek\paiementlot\"+ls_filename[li_i], False)
		ds_zip.reset()
		ds_zip.importstring(ls_import)
		for j = 1 to ds_zip.rowcount()
		
			ls_name = ds_zip.GetItemString(j, "name")
			ls_fullname = ds_zip.GetItemString(j, "fullname")
			
			lul_unzFile = luo_zlib.of_unzOpen("C:\ii4net\orthotek\paiementlot\"+ls_filename[li_i])
			luo_zlib.of_ExtractFile(lul_unzFile, "C:\ii4net\orthotek\paiementlot\rep\"+ls_name, ls_fullname)
			luo_zlib.of_unzClose(lul_unzFile)
			
//			if right(ls_filename[li_i],4) = '.enc' then
//				ls_nomcrypte = "C:\ii4net\orthotek\paiementlot\" + ls_filename[li_i]
//				ls_nomdecrypte = "C:\ii4net\orthotek\paiementlot\" + left(ls_filename[li_i],len(ls_filename[li_i]) - 3) + 'dec'
//				ls_commandline = "c:\ii4net\orthotek\encryptr.bat -decrypt -file " + ls_nomcrypte + " -into " + ls_nomdecrypte + " -for " + ls_nomcommun  + " -automatic"
//				run(ls_commandline,Minimized!)
//			end if	
		
		next

		
	next 
end if
Destroy uo_ftp

//uo_ftp = Create u_ftp
//ls_filepath = '\'+ls_nomdiminu+'\'
//Select ctnomcommun, ctnomcommunCGI into :ls_nomcommun, :ls_nomcommunCGI from t_options where ortho_id = :v_no_ortho;
//select ftppassword, ftpusername, ftpservername into :ls_password, :ls_userid, :ls_servername from t_options where ortho_id = :v_no_ortho;
//if uo_ftp.of_connect("","C:\ii4net\",ls_password,ls_userid,ls_servername) <> 0 then
//	uo_ftp.FtpSetCurrentDirectory(uo_ftp.hConnection, '\'+ls_nomdiminu+'\')
//	uo_ftp.ftpfilegetdirectorycontents("C:\ii4net\orthotek\paiementlot\",ls_filename)
//	li_upperbound = upperbound(ls_filename)
//	for li_i = 1 to li_upperbound
//		uo_ftp.ftpdeletefile(uo_ftp.hConnection, ls_filepath+ls_filename[li_i])
//		if right(ls_filename[li_i],4) = '.enc' then
//			ls_nomcrypte = "C:\ii4net\orthotek\paiementlot\" + ls_filename[li_i]
//			ls_nomdecrypte = "C:\ii4net\orthotek\paiementlot\" + left(ls_filename[li_i],len(ls_filename[li_i]) - 3) + 'dec'
//			ls_commandline = "c:\ii4net\orthotek\encryptr.bat -decrypt -file " + ls_nomcrypte + " -into " + ls_nomdecrypte + " -for " + ls_nomcommun  + " -automatic"
//			if run(ls_commandline,Minimized!) = 1 then
//				
//			end if
//		end if
//	next 
//end if
//Destroy uo_ftp
//
opensheet(w_visionenvoilot,w_principal,2,layered!)


end event

type cb_view from commandbutton within w_moneris
integer x = 2277
integer y = 1948
integer width = 375
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultation"
end type

event clicked;Long ll_idlot
date debut, fin

open(w_choixlotenvoi)
ll_idlot = long(message.stringparm)
if ll_idlot > 0 then
	setnull(debut)
	setnull(fin)
	dw_envmon.setTransObject(SQLCA)
	dw_envmon.retrieve(v_no_ortho,debut,fin,ll_idlot)
end if
end event

type cb_print from commandbutton within w_moneris
integer x = 795
integer y = 1948
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_envmon)
end event

type cb_save from commandbutton within w_moneris
integer x = 393
integer y = 1948
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;long ll_idlot

ll_idlot = dw_envmon.getItemNumber(1,'cheques_postdates_idlot')
if isnull(ll_idlot) or ll_idlot = 0 then
	of_sauvegarder()
end if
end event

type st_deselectall from statictext within w_moneris
integer x = 1161
integer y = 32
integer width = 526
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Désélectionner tout"
boolean focusrectangle = false
end type

event clicked;long i, ll_nbrows

ll_nbrows = dw_envmon.rowcount()

for i = 1 to ll_nbrows
	dw_envmon.object.cheques_postdates_envoitrait[i] = 0
next
end event

type st_selectall from statictext within w_moneris
integer x = 631
integer y = 28
integer width = 462
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Sélectionner tout"
boolean focusrectangle = false
end type

event clicked;long i, ll_nbrows

ll_nbrows = dw_envmon.rowcount()

for i = 1 to ll_nbrows
	dw_envmon.object.cheques_postdates_envoitrait[i] = 1
next
end event

type cb_find from commandbutton within w_moneris
integer x = 14
integer y = 1948
integer width = 379
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin
long ll_idlot

debut = date(em_debut.text)
fin = date(em_fin.text)
setnull(ll_idlot)

//dw_cheques_postdates.setfilter("cheques_postdates_date_cheque > '"+debut+"' and cheques_postdates_date_cheque < '"+fin+"'")
dw_envmon.setTransObject(SQLCA)
dw_envmon.retrieve(v_no_ortho,debut,fin,ll_idlot)
end event

event constructor;if v_langue = 'an' then
cb_find.text = 'Search'
end if
end event

type st_1 from statictext within w_moneris
integer x = 1152
integer y = 1956
integer width = 174
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Début:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
st_1.text = 'Starting:'
end if
end event

type st_2 from statictext within w_moneris
integer x = 1751
integer y = 1956
integer width = 96
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
st_2.text = 'Ending:'
end if
end event

type em_debut from editmask within w_moneris
integer x = 1335
integer y = 1940
integer width = 411
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

event constructor;em_debut.text = string(today())
end event

type em_fin from editmask within w_moneris
integer x = 1856
integer y = 1940
integer width = 402
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

event constructor;em_fin.text = string(today())
end event

type cbx_ttes from u_cbx within w_moneris
integer x = 1879
integer y = 1960
integer width = 731
integer height = 68
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Toutes les transactions"
boolean checked = true
end type

event clicked;call super::clicked;setPointer(HourGlass!)

if this.checked then
	dw_envmon.retrieve(1)
else
	dw_envmon.retrieve(0)
end if
end event

type cb_env from u_cb within w_moneris
integer x = 2967
integer y = 1948
integer width = 293
integer taborder = 30
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Envoyer"
end type

event clicked;call super::clicked;u_paiecred luo_paiecred
str_paiecredrecur lstr_cred[]
str_paiecredrep lstr_rep[]
u_ftp uo_ftp
long i, ll_cpt = 0, ll_nocomm, ll_nbtrans, ll_trans, ll_row1, ll_row2, ll_trait[]
long ll_orderid[], ll_idlot, ll_count, ll_nopaie, ll_null
ulong ll_port
dec{2} ld_null, ld_mont[], ld_montant
string ls_host, ls_user, ls_pw, ls_store, ls_apitok, ls_commandline, ls_nomcommun, ls_nomcommunCGI, ls_password, ls_userid, ls_servername, ls_nomdiminu
string ls_nolot, ls_nomarchand, ls_notransact, ls_codetrans, ls_noclient, ls_montant, ls_nocarte, ls_nopaie, ls_nopaieorig,ls_expdate, ls_mod, ls_linefich = "", ls_path, ls_pathenc, ls_pathftp
date ldt_expdate, ldt_datepaie, debut, fin
int li_FileNum, li_FileNum2
boolean lb_selected = false
date ld_debut, ld_fin

if ic_typeexport = 'C' then
	
	// Vérifier si le dossier existes

	if not DirectoryExists("c:\ii4net\orthotek\paiementlot\archive") then
		CreateDirectory ("c:\ii4net\orthotek\paiementlot\archive")
	end if
	
	of_sauvegarder()
	ll_count = 0
	for i = 1 to dw_envmon.rowcount()
		if dw_envmon.getItemNumber(i,'cheques_postdates_envoitrait') = 1 then
			lb_selected = true
			ll_count++
		end if
	next
	
	ll_null = dw_envmon.getItemNumber(1,'cheques_postdates_idlot')
	select nomarchard into :ls_nomarchand from t_options;
	
	if lb_selected and isnull(ll_null) then
		if not isnull(ls_nomarchand) then
			// On ajoute la ligne dans t_lotcentraltaxe
			insert into t_lotcentraltaxe(dateenvoi,id_ortho,id_personnel)
			values(today(),:v_no_ortho,:gl_idpers);
			if gf_sqlerr() then
				commit using SQLCA;
				select max(id_lot) into :ll_idlot from t_lotcentraltaxe;
				update t_lotcentraltaxe set numero = id_lot where id_lot = :ll_idlot;
			else
				rollback using SQLCA;
			end if
			
			// On affecte les paiements avec le lot que l'on vient de créer
			
			ld_debut = date(em_debut.text)
			ld_fin = date(em_fin.text)
			
			update cheques_postdates set id_lotcentraltaxe = :ll_idlot where id_lotcentraltaxe is null and isnull(envoitrait,0) = 1 and date_cheque between :ld_debut and :ld_fin;
			if gf_sqlerr() then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
			
			// Entete de la transaction
		
			select ftpuploadpath into :ls_nomdiminu from t_options where ortho_id = :v_no_ortho;
			ls_path = "c:\ii4net\orthotek\paiementlot\archive\" + string(v_no_ortho) + "-" + string(today()) + ".csv"
			li_FileNum = FileOpen(ls_path, LineMode!, Write!, LockWrite!, Replace!)
			li_FileNum2 = FileOpen("c:\ii4net\orthotek\paiementlot\envoi.csv", LineMode!, Write!, LockWrite!, Replace!)
			ls_nolot = remplir(string(ll_idlot),8,'0',true) // 8 caractères [a-Z, 0-9]
			ls_nomarchand = remplir(ls_nomarchand,8,'0',true) // 8 caractères [0-9]
			ls_notransact = remplir(string(ll_count),8,'0',true) // 8 caractères [0-9]
			ls_linefich = ls_nolot + "," + ls_nomarchand + "," + ls_notransact
			FileWrite(li_FileNum,ls_linefich)
			FileWrite(li_FileNum2,ls_linefich)
			
			// Detail 
		
			for i = 1 to dw_envmon.rowcount()
				
				ls_mod = dw_envmon.getItemString(i,'cheques_postdates_modalite')
				ldt_datepaie = dw_envmon.getItemDate(i,'cheques_postdates_date_cheque')
				
				if (ls_mod = 'pVisa' or ls_mod = 'pMC' or ls_mod = 'pAmex') and dw_envmon.getItemNumber(i,'cheques_postdates_envoitrait') = 1 then
			
					ls_codetrans = "00" // 00 : achat, 01 : préautorisation, 02 : complétion de préautorisation, 03 : remboursement
					ls_noclient = 'Progitek'
					ld_montant = dw_envmon.getItemNumber(i,'cheques_postdates_paiement')
					ls_montant = remplir(rep(string(ld_montant),'.',''),11,'0',true)
					if isnull(ls_montant) then ls_montant = '' 
					ls_nocarte = dw_envmon.getItemString(i,'cheques_postdates_nocarte')
					ls_nocarte =  rep(ls_nocarte,' ','')
					if isnull(ls_nocarte) then ls_nocarte = '' 
					ldt_expdate = dw_envmon.getItemDate(i,'cheques_postdates_datecarte')
					ls_expdate = remplir(string(month(ldt_expdate)),2,'0',true) + right(string(year(ldt_expdate)),2)
					if isnull(ls_expdate) then ls_expdate = '' 
					ll_nopaie = dw_envmon.getItemNumber(i,'cheques_postdates_cheques_postdates_id')
					ls_nopaie = remplir(string(ll_nopaie),12,'0',true)
					if isnull(ls_nopaie) then ls_nopaie = '' 
					ls_linefich = ls_codetrans + "," + ls_noclient + "," + ls_montant + "," + ls_nocarte + "," + ls_expdate + "," + ls_nopaie
					FileWrite(li_FileNum,ls_linefich)
					FileWrite(li_FileNum2,ls_linefich)
					
				end if
				
				/*
				
				Lorsque le code de transaction = 3
				
				 Numéro de transaction : (pour complétion seulement*) maximum 12 caractères [0-9] : le numéro
				de transaction de la préautorisation à compléter.
				 Numéro d’autorisation : (pour complétion seulement*) 8 caractères [a-Z, 0-9, espace] : le numéro
				d’autorisation de la préautorisation à compléter.
				ls_nopaieorig = remplir(string(ll_nopaie),12,'0',true)
				
				*/
				
			next
			
			FileClose(li_FileNum)
			FileClose(li_FileNum2)
			
			// Garder une copie dans le reparchive
			
			
			debut = date(em_debut.text)
			fin = date(em_fin.text)
			setnull(ll_null)
			dw_envmon.setTransObject(SQLCA)
			dw_envmon.retrieve(v_no_ortho,debut,fin,ll_null)
			
		else
			Messagebox('Erreur','Entrez un numéro de marchand')
		end if
	end if
else
	if dw_envmon.rowCount() > 0 then
		setPointer(HourGlass!)
		setNull(ld_null)
		
		select monerishost,
				 monerisport,
				 monerisuser,
				 monerispw,
				 monerisstore,
				 monerisapit,
				 moneristransno
		  into :ls_host,
				 :ll_port,
				 :ls_user,
				 :ls_pw,
				 :ls_store,
				 :ls_apitok,
				 :ll_nocomm
		  from t_options
		 where ortho_id = :v_no_ortho;
		
		if isnull(ll_nocomm) then ll_nocomm = 1
		if ll_nocomm <= 0 then ll_nocomm = 1
		
		for i = 1 to dw_envmon.rowCount()
			if dw_envmon.getItemNumber(i, 'sel') = 1 then
				ll_cpt ++
		
				dw_envmon.object.num[i] = ll_cpt
				
				lstr_cred[ll_cpt].d_montant = ld_null
				lstr_cred[ll_cpt].s_nocarte = dw_envmon.getItemString(i, 'cheques_postdates_nocarte')
				lstr_cred[ll_cpt].dt_dateexp = dw_envmon.getItemDate(i, 'cheques_postdates_datecarte')
				lstr_cred[ll_cpt].c_unitrecur = 'm'
				lstr_cred[ll_cpt].dt_debut = dw_envmon.getItemDate(i, 'debut')
				lstr_cred[ll_cpt].i_nbrecur = dw_envmon.getItemNumber(i, 'nbrec')
				lstr_cred[ll_cpt].i_periode = 1
				lstr_cred[ll_cpt].d_recurmontant = dw_envmon.getItemNumber(i, 'cheques_postdates_paiement')
				
				ll_trait[ll_cpt] = dw_envmon.getItemNumber(i, 'cheques_postdates_traitement_patient_id')
				ld_mont[ll_cpt] = dw_envmon.getItemNumber(i, 'cheques_postdates_paiement')
				ll_orderid[ll_cpt] = ll_nocomm + ll_cpt - 1
			end if
		next
		
		luo_paiecred = create u_paiecred
		
		luo_paiecred.of_init(ls_host, ls_user, ls_pw, ll_port, "C:\ii4net\Orthotek\orthotek" + string(today(), 'yyyymmdd') + string(now(), 'hhmmss') + ".xml", ls_store, ls_apitok)
		
		ll_nbtrans = luo_paiecred.of_creerlotxml(lstr_cred, ll_nocomm)
		
		if ll_nbtrans = ll_cpt then
			update t_options set moneristransno = :ll_nocomm + :ll_nbtrans;
			if error_type(-1) = 1 then
				commit;
			else
				rollback;
			end if
			
			if luo_paiecred.of_envoyerlot(ll_nbtrans) then
				enabled = false
				
				for i = 1 to upperbound(ll_trait)
					if cbx_ttes.checked then
						update cheques_postdates
							set envmon = 1,
								 monorderid = :ll_orderid[i]
						 where indicateur = '0' and isnull(cheques_postdates.envmon, 0) = 0
							and ucase(cheques_postdates.modalite) in ('VISA', 'MC', 'AMEX', 'PVISA', 'PMC', 'PAMEX')
							and cheques_postdates.traitement_patient_id = :ll_trait[i]
							and cheques_postdates.paiement = :ld_mont[i]
							and cheques_postdates.date_cheque > current date;
					else
						update first cheques_postdates
							set envmon = 1,
								 monorderid = :ll_orderid[i]
						 where indicateur = '0' and isnull(cheques_postdates.envmon, 0) = 0
							and ucase(cheques_postdates.modalite) in ('VISA', 'MC', 'AMEX', 'PVISA', 'PMC', 'PAMEX')
							and cheques_postdates.traitement_patient_id = :ll_trait[i]
							and cheques_postdates.paiement = :ld_mont[i]
							and cheques_postdates.date_cheque > current date
					 order by date_cheque asc;
					end if
					if error_type(-1) = 1 then
						commit;
					else
						rollback;
					end if
				next
							
				lstr_rep = luo_paiecred.of_lirereponse()
				
				for i = 1 to upperbound(lstr_rep)
					ll_row1 = dw_envmon.find("sel = 1", ll_row1, dw_envmon.rowCount())
					if ll_row1 > 0 then
						ll_row2 = dw_receptmon.insertRow(0)
						
						dw_receptmon.setItem(ll_row2, 'nompat', dw_envmon.getItemString(ll_row1, 'patnom'))
						dw_receptmon.setItem(ll_row2, 'receiptid', lstr_rep[i].s_receiptid)
						dw_receptmon.setItem(ll_row2, 'txn_number', lstr_rep[i].s_txnnbr)
						dw_receptmon.setItem(ll_row2, 'complete', lstr_rep[i].i_complete)
						dw_receptmon.setItem(ll_row2, 'message', lstr_rep[i].s_message)
						dw_receptmon.setItem(ll_row2, 'timedout', lstr_rep[i].i_timedout)
						dw_receptmon.setItem(ll_row2, 'recursuccess', lstr_rep[i].i_recursuccess)
					end if
				next
				
				dw_receptmon.setPosition(ToTop!)
			else
				error_type(198)
			end if
		else
			error_type(197)
		end if
		
		destroy luo_paiecred
	end if
end if
end event

type cb_fermer from u_cb within w_moneris
integer x = 3259
integer y = 1948
integer width = 370
integer taborder = 20
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;call super::clicked;close(w_moneris)

end event

type st_titre from statictext within w_moneris
integer x = 5
integer y = 8
integer width = 603
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Envoi Moneris"
boolean focusrectangle = false
end type

type dw_envmon from u_dw within w_moneris
integer x = 9
integer y = 124
integer width = 3634
integer height = 1796
integer taborder = 10
string dataobject = "d_envmon"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;pro_resize luo_rs
luo_rs.uf_resizedw(this)


select exportcartecredit into :ic_typeexport from t_options where ortho_id = :v_no_ortho;
if ic_typeexport = 'C' then
	this.dataobject = 'd_cheques_postdates_lot'
else 
	setTransObject(SQLCA)
	setPointer(HourGlass!)
	retrieve(1)
end if




end event

type dw_receptmon from u_dw within w_moneris
integer x = 9
integer y = 124
integer width = 3634
integer height = 1796
integer taborder = 10
string dataobject = "d_receptmon"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_rs
luo_rs.uf_resizedw(this)

setTransObject(SQLCA)

end event

