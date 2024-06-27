$PBExportHeader$w_options.srw
forward
global type w_options from w_child
end type
type tab_options from tab within w_options
end type
type tabpage_gen from userobject within tab_options
end type
type dw_options from u_dw within tabpage_gen
end type
type tabpage_gen from userobject within tab_options
dw_options dw_options
end type
type tabpage_hor from userobject within tab_options
end type
type dw_optionshoraire from u_dw within tabpage_hor
end type
type tabpage_hor from userobject within tab_options
dw_optionshoraire dw_optionshoraire
end type
type tabpage_dosspat from userobject within tab_options
end type
type dw_optionsdosspat from u_dw within tabpage_dosspat
end type
type tabpage_dosspat from userobject within tab_options
dw_optionsdosspat dw_optionsdosspat
end type
type tabpage_traitreq from userobject within tab_options
end type
type dw_optionstraitreq from u_dw within tabpage_traitreq
end type
type tabpage_traitreq from userobject within tab_options
dw_optionstraitreq dw_optionstraitreq
end type
type tabpage_img from userobject within tab_options
end type
type dw_optionsimg from u_dw within tabpage_img
end type
type tabpage_img from userobject within tab_options
dw_optionsimg dw_optionsimg
end type
type tabpage_corr from userobject within tab_options
end type
type dw_optionscorr from u_dw within tabpage_corr
end type
type tabpage_corr from userobject within tab_options
dw_optionscorr dw_optionscorr
end type
type tabpage_paperless from userobject within tab_options
end type
type dw_optionspaperless from datawindow within tabpage_paperless
end type
type tabpage_paperless from userobject within tab_options
dw_optionspaperless dw_optionspaperless
end type
type tabpage_comp from userobject within tab_options
end type
type dw_optionscomp from u_dw within tabpage_comp
end type
type tabpage_comp from userobject within tab_options
dw_optionscomp dw_optionscomp
end type
type tabpage_cincout from userobject within tab_options
end type
type dw_optionscincout from u_dw within tabpage_cincout
end type
type tabpage_cincout from userobject within tab_options
dw_optionscincout dw_optionscincout
end type
type tabpage_backup from userobject within tab_options
end type
type pb_browsedirchupd from picturebutton within tabpage_backup
end type
type st_chmupd from statictext within tabpage_backup
end type
type cbx_updt from checkbox within tabpage_backup
end type
type rb_ftp from radiobutton within tabpage_backup
end type
type cbx_srv from checkbox within tabpage_backup
end type
type rb_server from radiobutton within tabpage_backup
end type
type st_adrsrv from statictext within tabpage_backup
end type
type sle_adrsrv from singlelineedit within tabpage_backup
end type
type pb_browsediradr from picturebutton within tabpage_backup
end type
type dw_optionsbackup from u_dw within tabpage_backup
end type
type sle_chmupd from singlelineedit within tabpage_backup
end type
type tabpage_backup from userobject within tab_options
pb_browsedirchupd pb_browsedirchupd
st_chmupd st_chmupd
cbx_updt cbx_updt
rb_ftp rb_ftp
cbx_srv cbx_srv
rb_server rb_server
st_adrsrv st_adrsrv
sle_adrsrv sle_adrsrv
pb_browsediradr pb_browsediradr
dw_optionsbackup dw_optionsbackup
sle_chmupd sle_chmupd
end type
type tabpage_defaut from userobject within tab_options
end type
type dw_optionsdefaut from u_dw within tabpage_defaut
end type
type tabpage_defaut from userobject within tab_options
dw_optionsdefaut dw_optionsdefaut
end type
type tabpage_mailing from userobject within tab_options
end type
type dw_optionsemail from u_dw within tabpage_mailing
end type
type tabpage_mailing from userobject within tab_options
dw_optionsemail dw_optionsemail
end type
type tabpage_charges from userobject within tab_options
end type
type cb_delete from commandbutton within tabpage_charges
end type
type cb_insert from commandbutton within tabpage_charges
end type
type dw_charges from u_dw within tabpage_charges
end type
type tabpage_charges from userobject within tab_options
cb_delete cb_delete
cb_insert cb_insert
dw_charges dw_charges
end type
type tabpage_mon from userobject within tab_options
end type
type dw_optionsmon from u_dw within tabpage_mon
end type
type tabpage_mon from userobject within tab_options
dw_optionsmon dw_optionsmon
end type
type tabpage_sys from userobject within tab_options
end type
type sle_pdf from singlelineedit within tabpage_sys
end type
type cb_pdf from commandbutton within tabpage_sys
end type
type st_6 from statictext within tabpage_sys
end type
type cb_31 from commandbutton within tabpage_sys
end type
type cb_30 from commandbutton within tabpage_sys
end type
type cb_29 from commandbutton within tabpage_sys
end type
type cb_28 from commandbutton within tabpage_sys
end type
type rte_conv from richtextedit within tabpage_sys
end type
type cb_upload from commandbutton within tabpage_sys
end type
type cb_27 from commandbutton within tabpage_sys
end type
type st_3 from statictext within tabpage_sys
end type
type st_2 from statictext within tabpage_sys
end type
type rb_user from radiobutton within tabpage_sys
end type
type rb_mac from radiobutton within tabpage_sys
end type
type cb_26 from commandbutton within tabpage_sys
end type
type ddlb_orthodest from u_ddlb within tabpage_sys
end type
type cb_25 from commandbutton within tabpage_sys
end type
type cb_24 from commandbutton within tabpage_sys
end type
type cb_23 from commandbutton within tabpage_sys
end type
type cb_22 from commandbutton within tabpage_sys
end type
type cb_21 from commandbutton within tabpage_sys
end type
type cb_20 from commandbutton within tabpage_sys
end type
type cb_19 from commandbutton within tabpage_sys
end type
type cb_18 from commandbutton within tabpage_sys
end type
type cb_17 from commandbutton within tabpage_sys
end type
type cb_16 from commandbutton within tabpage_sys
end type
type cb_chrgs from commandbutton within tabpage_sys
end type
type cb_15 from commandbutton within tabpage_sys
end type
type cb_14 from commandbutton within tabpage_sys
end type
type cb_img from commandbutton within tabpage_sys
end type
type cb_13 from commandbutton within tabpage_sys
end type
type st_1 from statictext within tabpage_sys
end type
type st_start from statictext within tabpage_sys
end type
type sle_end from singlelineedit within tabpage_sys
end type
type sle_start from singlelineedit within tabpage_sys
end type
type cb_12 from commandbutton within tabpage_sys
end type
type em_nbyear from editmask within tabpage_sys
end type
type cb_archive from commandbutton within tabpage_sys
end type
type cb_11 from commandbutton within tabpage_sys
end type
type cb_10 from commandbutton within tabpage_sys
end type
type cb_9 from commandbutton within tabpage_sys
end type
type cb_noboite from commandbutton within tabpage_sys
end type
type cb_8 from commandbutton within tabpage_sys
end type
type cb_7 from commandbutton within tabpage_sys
end type
type cb_6 from commandbutton within tabpage_sys
end type
type cb_entente from commandbutton within tabpage_sys
end type
type cb_setquote from commandbutton within tabpage_sys
end type
type cb_monthly from commandbutton within tabpage_sys
end type
type cb_mens from commandbutton within tabpage_sys
end type
type cb_5 from commandbutton within tabpage_sys
end type
type cb_4 from commandbutton within tabpage_sys
end type
type cb_3 from commandbutton within tabpage_sys
end type
type cb_2 from commandbutton within tabpage_sys
end type
type cb_1 from commandbutton within tabpage_sys
end type
type cb_cpdenc from commandbutton within tabpage_sys
end type
type gb_archive from groupbox within tabpage_sys
end type
type gb_horaire from groupbox within tabpage_sys
end type
type gb_2 from groupbox within tabpage_sys
end type
type ddlb_orthoscr from u_ddlb within tabpage_sys
end type
type gb_corr from groupbox within tabpage_sys
end type
type tabpage_sys from userobject within tab_options
sle_pdf sle_pdf
cb_pdf cb_pdf
st_6 st_6
cb_31 cb_31
cb_30 cb_30
cb_29 cb_29
cb_28 cb_28
rte_conv rte_conv
cb_upload cb_upload
cb_27 cb_27
st_3 st_3
st_2 st_2
rb_user rb_user
rb_mac rb_mac
cb_26 cb_26
ddlb_orthodest ddlb_orthodest
cb_25 cb_25
cb_24 cb_24
cb_23 cb_23
cb_22 cb_22
cb_21 cb_21
cb_20 cb_20
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_chrgs cb_chrgs
cb_15 cb_15
cb_14 cb_14
cb_img cb_img
cb_13 cb_13
st_1 st_1
st_start st_start
sle_end sle_end
sle_start sle_start
cb_12 cb_12
em_nbyear em_nbyear
cb_archive cb_archive
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_noboite cb_noboite
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_entente cb_entente
cb_setquote cb_setquote
cb_monthly cb_monthly
cb_mens cb_mens
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cpdenc cb_cpdenc
gb_archive gb_archive
gb_horaire gb_horaire
gb_2 gb_2
ddlb_orthoscr ddlb_orthoscr
gb_corr gb_corr
end type
type tab_options from tab within w_options
tabpage_gen tabpage_gen
tabpage_hor tabpage_hor
tabpage_dosspat tabpage_dosspat
tabpage_traitreq tabpage_traitreq
tabpage_img tabpage_img
tabpage_corr tabpage_corr
tabpage_paperless tabpage_paperless
tabpage_comp tabpage_comp
tabpage_cincout tabpage_cincout
tabpage_backup tabpage_backup
tabpage_defaut tabpage_defaut
tabpage_mailing tabpage_mailing
tabpage_charges tabpage_charges
tabpage_mon tabpage_mon
tabpage_sys tabpage_sys
end type
type cb_update_close from commandbutton within w_options
end type
end forward

global type w_options from w_child
integer x = 214
integer y = 221
integer width = 4640
integer height = 2620
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
tab_options tab_options
cb_update_close cb_update_close
end type
global w_options w_options

type variables
boolean change = false

public string is_test
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();integer v_hor_fin_am, v_hor_depart_pm, v_hor_aff_pm, li_valeur_ini

tab_options.tabpage_gen.dw_options.accepttext()
tab_options.tabpage_hor.dw_optionshoraire.accepttext()
tab_options.tabpage_dosspat.dw_optionsdosspat.accepttext()
tab_options.tabpage_traitreq.dw_optionstraitreq.accepttext()
tab_options.tabpage_img.dw_optionsimg.accepttext()
tab_options.tabpage_corr.dw_optionscorr.accepttext()
tab_options.tabpage_paperless.dw_optionspaperless.accepttext()
tab_options.tabpage_comp.dw_optionscomp.accepttext()
tab_options.tabpage_backup.dw_optionsbackup.accepttext()
tab_options.tabpage_defaut.dw_optionsdefaut.accepttext()
tab_options.tabpage_cincout.dw_optionscincout.accepttext()
tab_options.tabpage_charges.dw_charges.accepttext()
tab_options.tabpage_mon.dw_optionsmon.accepttext()

if tab_options.tabpage_hor.dw_optionshoraire.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_gen.dw_options.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_dosspat.dw_optionsdosspat.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_traitreq.dw_optionstraitreq.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_img.dw_optionsimg.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_corr.dw_optionscorr.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_paperless.dw_optionspaperless.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_comp.dw_optionscomp.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_backup.dw_optionsbackup.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_defaut.dw_optionsdefaut.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_mailing.dw_optionsemail.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_cincout.dw_optionscincout.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_cincout.dw_optionscincout.rowCount() > 0 then
	li_valeur_ini = tab_options.tabpage_cincout.dw_optionscincout.object.cc_int_ref_console[1]
end if

if isNull(li_valeur_ini) then li_valeur_ini = 3
if li_valeur_ini < 1 or li_valeur_ini > 60 then li_valeur_ini = 3

SetProfileString(gnv_app.of_getAppIniFile(), "Console", "Frequence rafraichissement", string(li_valeur_ini))

if tab_options.tabpage_charges.dw_charges.update() = 1 then
	COMMIT USING SQLCA;
	change = false
else
	ROLLBACK USING SQLCA;
	error_type(50)
end if

if tab_options.tabpage_mon.dw_optionsmon.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback USING SQLCA;
	error_type(50)
end if

// Si le fichier ini n'existe pas, on le crée
if not fileExists(gnv_app.of_getAppIniFile()) then
	integer li_file
	
	li_file = fileOpen(gnv_app.of_getAppIniFile(), LineMode!, Write!, LockReadWrite!, Replace!)
	if li_file = -1 then
		error_type(63)
		return
	end if
	fileClose(li_file)
end if

if tab_options.tabpage_backup.cbx_updt.checked then
	SetProfileString(gnv_app.of_getAppIniFile(), "Update", "Check", "Yes")
	
	if tab_options.tabpage_backup.rb_ftp.checked then
		SetProfileString(gnv_app.of_getAppIniFile(), "Update", "From", "FTP")
		
		if tab_options.tabpage_backup.cbx_srv.checked then
			SetProfileString(gnv_app.of_getAppIniFile(), "Update", "Server", "Yes")
			SetProfileString(gnv_app.of_getAppIniFile(), "Update", "SavePath", tab_options.tabpage_backup.sle_chmupd.text)
		else
			SetProfileString(gnv_app.of_getAppIniFile(), "Update", "Server", "No")
		end if				
	elseif tab_options.tabpage_backup.rb_server.checked then
		SetProfileString(gnv_app.of_getAppIniFile(), "Update", "From", "Server")
		SetProfileString(gnv_app.of_getAppIniFile(), "Update", "Address", tab_options.tabpage_backup.sle_adrsrv.text)
	end if
else
	SetProfileString(gnv_app.of_getAppIniFile(), "Update", "Check", "No")
end if

end subroutine

on w_options.create
int iCurrent
call super::create
this.tab_options=create tab_options
this.cb_update_close=create cb_update_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_options
this.Control[iCurrent+2]=this.cb_update_close
end on

on w_options.destroy
call super::destroy
destroy(this.tab_options)
destroy(this.cb_update_close)
end on

type tab_options from tab within w_options
event create ( )
event destroy ( )
integer x = 5
integer width = 4613
integer height = 2492
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 134217747
boolean multiline = true
boolean focusonbuttondown = true
boolean showpicture = false
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_gen tabpage_gen
tabpage_hor tabpage_hor
tabpage_dosspat tabpage_dosspat
tabpage_traitreq tabpage_traitreq
tabpage_img tabpage_img
tabpage_corr tabpage_corr
tabpage_paperless tabpage_paperless
tabpage_comp tabpage_comp
tabpage_cincout tabpage_cincout
tabpage_backup tabpage_backup
tabpage_defaut tabpage_defaut
tabpage_mailing tabpage_mailing
tabpage_charges tabpage_charges
tabpage_mon tabpage_mon
tabpage_sys tabpage_sys
end type

on tab_options.create
this.tabpage_gen=create tabpage_gen
this.tabpage_hor=create tabpage_hor
this.tabpage_dosspat=create tabpage_dosspat
this.tabpage_traitreq=create tabpage_traitreq
this.tabpage_img=create tabpage_img
this.tabpage_corr=create tabpage_corr
this.tabpage_paperless=create tabpage_paperless
this.tabpage_comp=create tabpage_comp
this.tabpage_cincout=create tabpage_cincout
this.tabpage_backup=create tabpage_backup
this.tabpage_defaut=create tabpage_defaut
this.tabpage_mailing=create tabpage_mailing
this.tabpage_charges=create tabpage_charges
this.tabpage_mon=create tabpage_mon
this.tabpage_sys=create tabpage_sys
this.Control[]={this.tabpage_gen,&
this.tabpage_hor,&
this.tabpage_dosspat,&
this.tabpage_traitreq,&
this.tabpage_img,&
this.tabpage_corr,&
this.tabpage_paperless,&
this.tabpage_comp,&
this.tabpage_cincout,&
this.tabpage_backup,&
this.tabpage_defaut,&
this.tabpage_mailing,&
this.tabpage_charges,&
this.tabpage_mon,&
this.tabpage_sys}
end on

on tab_options.destroy
destroy(this.tabpage_gen)
destroy(this.tabpage_hor)
destroy(this.tabpage_dosspat)
destroy(this.tabpage_traitreq)
destroy(this.tabpage_img)
destroy(this.tabpage_corr)
destroy(this.tabpage_paperless)
destroy(this.tabpage_comp)
destroy(this.tabpage_cincout)
destroy(this.tabpage_backup)
destroy(this.tabpage_defaut)
destroy(this.tabpage_mailing)
destroy(this.tabpage_charges)
destroy(this.tabpage_mon)
destroy(this.tabpage_sys)
end on

event constructor;if gl_idpers = 0 then tab_options.tabpage_sys.visible = true

//if v_langue = 'an' then
//	tab_options.tabpage_gen.text = 'General'
//	tab_options.tabpage_hor.text = 'Schedule'
//	tab_options.tabpage_dosspat.text = 'Patient File'
//	tab_options.tabpage_traitreq.text = 'Treatment Request'
//	tab_options.tabpage_img.text = 'Imaging'
//	tab_options.tabpage_corr.text = 'Correspondence'
//	tab_options.tabpage_comp.text = 'Financial'
//	tab_options.tabpage_backup.text = 'Backup'
//	tab_options.tabpage_defaut.text = 'Default'
//	tab_options.tabpage_sys.text = 'System function'
//end if
end event

type tabpage_gen from userobject within tab_options
event create ( )
event destroy ( )
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Général"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_options dw_options
end type

on tabpage_gen.create
this.dw_options=create dw_options
this.Control[]={this.dw_options}
end on

on tabpage_gen.destroy
destroy(this.dw_options)
end on

type dw_options from u_dw within tabpage_gen
integer width = 4567
integer height = 2264
integer taborder = 30
string title = "options"
string dataobject = "d_options"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.mes_cpd.checkbox.text = 'Warning: There is a due amount and no PDC in hand'
	this.object.mes_facture.checkbox.text = 'Warning: There is a balance and no PDC in hand'
	this.object.entente.checkbox.text = 'Warning: There is a due amount'
	this.object.rapidsearch.checkbox.text = 'Activate the rapid search'
//	this.object.recuimpnue.checkbox.text = 'Activate printing on  tree part receipts'
	this.object.recuauto.checkbox.text = 'Activate automatic receipt'
	this.object.recure.checkbox.text = 'Eliminate RE on the receipts'
	this.object.factconsult.checkbox.text = 'In the insurance form, the consult is included in the treatment cost'
	this.object.eliminertrait1.checkbox.text = 'Eliminate the NULL treatment'
	this.object.eliminernsfcred.checkbox.text = 'Eliminate the NSF and the credits from the cashing report'
	this.object.createfact.checkbox.text = 'Create an automatic invoice for a payment'
	this.object.typeform.checkbox.text = 'Choose the insurance form type'
	this.object.rapppaie.checkbox.text = 'See the Postdated cheque in account summary'
	this.object.wsync.checkbox.text = 'Synchronize the stations on the network'
	this.object.adjustsector.checkbox.text = 'Adjust schedule sector'
	this.object.cachechart.checkbox.text = "Hide the dental chart in request treatment"
	this.object.asst1.checkbox.text = 'Hide the financial agreement in the insurance form'
	this.object.rdvtoday.checkbox.text = 'Include the current day in the appointment list'
	this.object.openhor.checkbox.text = 'Open Orthotek in squedule'
	this.object.lowerview.checkbox.text = 'Active lower case'
	this.object.photo.checkbox.text = 'Activate picture'
	this.object.alphaorder.checkbox.text = 'Sort by name the referents, dentists and referred dentists'
	this.object.typeimaging.checkbox.text = "Imaging + Planmeca with patient's file"
	//this.object.debarrer_rappre.checkbox.text = "Do not lock preliminary reports"
	//this.object.debarrer_traitreq.checkbox.text = "Do not lock treatment requests"
	//this.object.debarrer_cons.checkbox.text = "Do not lock consultation reports"
	this.object.t_rdvm.text = 'Missed appointment.'
	this.object.t_retard.text = 'Late appointment.'
	this.object.t_recu.text = 'Type of receipt'
	this.object.recuimpnue.values = 'Normal~t0/Paper~t1/2 sections~t2'
	this.object.generalist.checkbox.text = 'Customer is a generalist that also does orthodontics'
	this.object.utiliser_biometrie.checkbox.text = 'Use biometry'
	this.object.envoicourriel.checkbox.text = 'Send receipts by email automatically'
	this.object.t_2.text = 'Percentage attributed to the cost of equipment'
	this.object.signalersolderdv.checkbox.text = 'Indicate whether the patient has a balance due to pay on appointment'
	
end if
end event

event clicked;call super::clicked;string ls_docpath, ls_docname[]

if dwo.name = 'p_folder' then
	GetFileOpenName("Select File", ls_docpath, ls_docname[], "", "All Files (*.*), *.*", "C:\ii4net\", 18)
	setItem(getRow(),'chemin_logo',ls_docpath)
	change = true
end if
end event

type tabpage_hor from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Horaire"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionshoraire dw_optionshoraire
end type

on tabpage_hor.create
this.dw_optionshoraire=create dw_optionshoraire
this.Control[]={this.dw_optionshoraire}
end on

on tabpage_hor.destroy
destroy(this.dw_optionshoraire)
end on

type dw_optionshoraire from u_dw within tabpage_hor
integer width = 4567
integer height = 2264
integer taborder = 30
string title = "optionshoraire"
string dataobject = "d_optionshoraire"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

integer v_hor_aff_pm

SetTransObject(SQLCA)
Retrieve(v_no_ortho)
select hor_aff_pm into :v_hor_aff_pm from t_options where ortho_id = :v_no_ortho;
//if v_hor_aff_pm = 0 then
//	tab_options.tabpage_hor.dw_optionshoraire.object.t_start_pm.visible = false
//	tab_options.tabpage_hor.dw_optionshoraire.object.hor_depart_pm.visible = false
//	tab_options.tabpage_hor.dw_optionshoraire.object.t_end_pm.visible = false
//	tab_options.tabpage_hor.dw_optionshoraire.object.hor_fin_pm.visible = false
//else
//	tab_options.tabpage_hor.dw_optionshoraire.object.t_start_pm.visible = true
//	tab_options.tabpage_hor.dw_optionshoraire.object.hor_depart_pm.visible = true
//	tab_options.tabpage_hor.dw_optionshoraire.object.t_end_pm.visible = true
//	tab_options.tabpage_hor.dw_optionshoraire.object.hor_fin_pm.visible = true
//end if
if v_langue = 'an' then
	this.object.hor_aff_pm.checkbox.text = 'Activate the PM App. grid'
	this.object.horcolor.checkbox.text = 'Activate the color printing of the App. grid'
	this.object.horimpaff.checkbox.text = 'Print the treatment name and the file number in the App. grid'
	this.object.horaffdetailpat.checkbox.text = 'Activate the detail of the patient in the App. grid'
	this.object.horimplistetel.checkbox.text = 'Activate the phone list printing'
	this.object.horimpdetail.checkbox.text = 'Activate the printing of the detailled App. list'
	this.object.horarrow.checkbox.text = 'Place an arrow for Apointments in the schedule'
	this.object.horcolpers.checkbox.text = 'Show the personal name for the rows'
	this.object.horfinmenu.checkbox.text = 'Add financial function to squedule menu'
	this.object.horcalcolor.checkbox.text = 'Calendar color Activation'
	this.object.hordelrvm.checkbox.text = 'Erase patient from the schedule automatically'
	this.object.hordosspat.checkbox.text = 'Double click to search patient'
	this.object.horalpha.checkbox.text = 'Detailed Schedule in alphabetical order'
	this.object.horprintdu.checkbox.text = 'Write due amounts on printing'
	this.object.horimpdubalance.checkbox.text = 'Identify good payers on printing of schedule'
	this.object.cincoutdelall.checkbox.text = 'Delete all patients from console at the end of the day'
	this.object.hidemedical.checkbox.text = 'Hide medical alert image from schedule'
	this.object.imphorlist.checkbox.text = 'Print detailed schedule with memo'
	this.object.liste_trait_par_spec.checkbox.text = 'List of treatment by doctor with common schedule'
	this.object.t_horfontsize.text = 'Font size on schedule grid:'
	this.object.horresize.checkbox.text = 'Resize schedule'
	this.object.t_hormenuchoix1.text = 'Add this choice in schedule menu:'
	this.object.hortransdirect.checkbox.text = 'Transfert immediately without ask a question'
	this.object.modimphor.values = 'Schedule print template 1~tA/Schedule print template 2~tB'
	this.object.hormodele.values = 'Standard~t1/6 colunms~t3/8 columns~t4/11 (compressed)~t2'
	this.object.t_startam.text = 'Starting time AM'
//	this.object.t_endam.text = 'Ending time AM'
	this.object.t_start_pm.text = 'Starting time PM'
//	this.object.t_end_pm.text = 'Ending time PM'
	this.object.t_jump.text = 'Unit time jumps'
	this.object.t_sharehor.text = 'Share Apointment grid with'
	this.object.t_nbcol.text = 'Number of columns'
	this.object.t_c1.text = 'Column 1'
	this.object.t_c2.text = 'Column 2'
	this.object.t_c3.text = 'Column 3'
	this.object.t_c4.text = 'Column 4'
	this.object.t_c5.text = 'Column 5'
	this.object.t_c6.text = 'Column 6'
	this.object.t_c7.text = 'Column 7'
	this.object.t_c8.text = 'Column 8'
	this.object.t_c9.text = 'Column 9'
	this.object.t_c10.text = 'Column 10'
	this.object.patarchivehor.checkbox.text = 'Add archived patients into schedule'
	this.object.lgnbleuhor.checkbox.text = 'Take off blue lines in scedule'
	this.object.gb_1.text = 'Schedule model'
end if
this.object.hor_depart_am.values = '5h00~t5/6h00~t6/7h00~t7/8h00~t8/9h00~t9'
this.object.hor_fin_am.values = '10h00~t9/11h00~t10/12h00~t11/13h00~t12/14h00~t13/15h00~t14/16h00~t15/17h00~t16/18h00~t17/19h00~t18/20h00~t19/21h00~t20/22h00~t21'
this.object.hor_depart_pm.values = '12h00~t12/13h00~t13/14h00~t14/15h00~t15'
this.object.hor_fin_pm.values = '16h00~t15/17h00~t16/18h00~t17/19h00~t18/20h00~t19/21h00~t20/22h00~t21'
end event

event clicked;pro_resize luo_size
luo_size.uf_resizedw(this)

if dwo.Name = "hor_aff_pm" then
	if GetItemNumber(1, "hor_aff_pm") = 0 then
		tab_options.tabpage_hor.dw_optionshoraire.object.t_start_pm.visible = true
		tab_options.tabpage_hor.dw_optionshoraire.object.hor_depart_pm.visible = true
		tab_options.tabpage_hor.dw_optionshoraire.object.t_end_pm.visible = true
		tab_options.tabpage_hor.dw_optionshoraire.object.hor_fin_pm.visible = true
	else
		tab_options.tabpage_hor.dw_optionshoraire.object.t_start_pm.visible = false
		tab_options.tabpage_hor.dw_optionshoraire.object.hor_depart_pm.visible = false
		tab_options.tabpage_hor.dw_optionshoraire.object.t_end_pm.visible = false
		tab_options.tabpage_hor.dw_optionshoraire.object.hor_fin_pm.visible = false
	end if
end if

end event

type tabpage_dosspat from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Dossier patient"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionsdosspat dw_optionsdosspat
end type

on tabpage_dosspat.create
this.dw_optionsdosspat=create dw_optionsdosspat
this.Control[]={this.dw_optionsdosspat}
end on

on tabpage_dosspat.destroy
destroy(this.dw_optionsdosspat)
end on

type dw_optionsdosspat from u_dw within tabpage_dosspat
integer y = 8
integer width = 4576
integer height = 2252
integer taborder = 40
string dataobject = "d_optionsdosspat"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.opendossauto.checkbox.text = 'Automatic file opening date when creating'
	this.object.dosspatresp.checkbox.text = "Responsible party in patient's file"
	this.object.hidearchive.checkbox.text = 'Archived patients'
//	this.object.delassmal.checkbox.text = 'Health insurance'
	this.object.nopatientauto.checkbox.text = 'Automatic patient number'
	this.object.newdossierauto.checkbox.text = 'Automatic file number'
	this.object.boiteauto.checkbox.text = 'Automatic box number'
	this.object.lockrefdent.checkbox.text = 'Referrents and dentists list'
	this.object.validnodoss.checkbox.text = 'Patient number'
	this.object.validnewdoss.checkbox.text = 'File number'
	this.object.validdosspat.checkbox.text = "Patient's first name and last name"
	this.object.ortho2vistadent.checkbox.text = 'Create files in Vistadent'
	this.object.ortho2consultpro.checkbox.text = 'Export patients to CONSULT-PRO'
//	this.object.delemail.checkbox.text = 'E-mail'
	this.object.vistadentpic.checkbox.text = 'Vistadent image'
	this.object.dolphinpic.checkbox.text = 'Dolphin image'
	this.object.planmeca.checkbox.text = 'Planmeca image'
	this.object.resptopat.checkbox.text = 'Transfer phone numbers from responsible party to patient'
	this.object.nodoss2vistadent.checkbox.text = 'The file number is the same as the Vistadent number'
	this.object.noboite_inc.checkbox.text = 'Use the smallest number available'
	this.object.gb_hide.text = 'Hide'
	this.object.t_8.text = 'Label for the interchangeable field'
	this.object.gb_auto.text = 'Automatize'
	this.object.t_9.text = 'File #'
	this.object.newdosscpd.checkbox.text = 'Take specific file number in the postdated check logs'
	this.object.t_10.text = 'Box #'
	this.object.nodos2noboite.checkbox.text = 'File number = Box number'
	this.object.validdosstel.checkbox.text = 'Home telephone'
	this.object.gb_compatibility.text = 'Compatibility'
	this.object.gb_1.text = 'Treatment Card'
end if


end event

type tabpage_traitreq from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Traitement requis"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionstraitreq dw_optionstraitreq
end type

on tabpage_traitreq.create
this.dw_optionstraitreq=create dw_optionstraitreq
this.Control[]={this.dw_optionstraitreq}
end on

on tabpage_traitreq.destroy
destroy(this.dw_optionstraitreq)
end on

type dw_optionstraitreq from u_dw within tabpage_traitreq
integer y = 12
integer width = 4562
integer height = 2252
integer taborder = 50
string title = "optionstraitreq"
string dataobject = "d_optionstraitreq"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.t_1.text = 'Line 1 fr:'
	this.object.t_2.text = 'Line 2 fr:'
	this.object.t_3.text = 'Line 3 fr:'
	this.object.t_4.text = 'Line 4 fr:'
	this.object.t_5.text = 'Line 5 fr:'
	this.object.t_6.text = 'Line 6 fr:'
	this.object.t_7.text = 'Line 7 fr:'
	this.object.t_8.text = 'Line 8 fr:'
	this.object.t_9.text = 'Line 9 fr:'
	this.object.t_10.text = 'Line 10 fr:'
	this.object.t_11.text = 'Line 1 en:'
	this.object.t_12.text = 'Line 2 en:'
	this.object.t_13.text = 'Line 3 en:'
	this.object.t_14.text = 'Line 4 en:'
	this.object.t_15.text = 'Line 5 en:'
	this.object.t_16.text = 'Line 6 en:'
	this.object.t_17.text = 'Line 7 en:'
	this.object.t_18.text = 'Line 8 en:'
	this.object.t_19.text = 'Line 9 en:'
	this.object.t_20.text = 'Line 10 en:'
	this.object.t_21.text = 'Line 0 fr:'
	this.object.t_22.text = 'Line 0 en:'
end if
end event

type tabpage_img from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Imagerie"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionsimg dw_optionsimg
end type

on tabpage_img.create
this.dw_optionsimg=create dw_optionsimg
this.Control[]={this.dw_optionsimg}
end on

on tabpage_img.destroy
destroy(this.dw_optionsimg)
end on

type dw_optionsimg from u_dw within tabpage_img
integer width = 4567
integer height = 2256
integer taborder = 50
string title = "optionsimg"
string dataobject = "d_optionsimg"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.imghiderect.checkbox.text = 'Hide header on the form'
	this.object.t_cheminphoto.text = 'Access path for the pictures:'
	this.object.t_4.text = "Filing of patients' pictures:"
	this.object.imgfolder.values = "Patient id~tp/File number~td/Vistadent id~tv"
	this.object.t_1.text = 'Consultation report header information:'
	this.object.t_2.text = 'Path for pictures import:'
	this.object.t_3.text = 'Path for Dolphin Imaging:'
end if
end event

event clicked;string ls_path

if dwo.name = 'p_folder' then
	select corrpath into :ls_path from t_options where ortho_id = :v_no_ortho;
	if isnull(ls_path) or ls_path = '' then ls_path = "c:\ii4net\orthotek\corr"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'chemphoto',ls_path)
	change = true
end if
if dwo.name = 'p_folder1' then
	select corrpath into :ls_path from t_options where ortho_id = :v_no_ortho;
	if isnull(ls_path) or ls_path = '' then ls_path = "c:\ii4net\orthotek\corr"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'imgpathimport',ls_path)
	change = true
end if
if dwo.name = 'p_folder2' then
	ls_path = "c:\dolphin"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'pathdolphin',ls_path)
	change = true
end if
if dwo.name = 'p_folder3' then
	ls_path = "c:\"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'imgpath',ls_path)
	change = true
end if
if dwo.name = 'p_folder4' then
	ls_path = "c:\"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'chprogmdl3d',ls_path)
	change = true
end if
if dwo.name = 'p_folder5' then
	ls_path = "c:\"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'chmdl3d',ls_path)
	change = true
end if
if dwo.name = 'p_folder6' then
	ls_path = "c:\"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'cheminvistadent',ls_path)
	change = true
end if
if dwo.name = 'p_folder7' then
	ls_path = "c:\"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'cheminxray',ls_path)
	change = true
end if
end event

type tabpage_corr from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Correspondances"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionscorr dw_optionscorr
end type

on tabpage_corr.create
this.dw_optionscorr=create dw_optionscorr
this.Control[]={this.dw_optionscorr}
end on

on tabpage_corr.destroy
destroy(this.dw_optionscorr)
end on

type dw_optionscorr from u_dw within tabpage_corr
integer width = 4562
integer height = 2264
integer taborder = 30
string title = "Correspondance"
string dataobject = "d_optionscorr"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.hidesecformnorm.checkbox.text = 'Hide section in the N form'
	this.object.logorappre.checkbox.text = 'Eliminate the outline on the preliminary report'
	this.object.logotraitreq.checkbox.text = 'Eliminate the outline on the required treatment'
	this.object.recudelassnumber.checkbox.text = 'Eliminate the association # on the receipt'
	this.object.doscons.checkbox.text = 'Eliminate the file number in the consultation report'
	this.object.estdelheader.checkbox.text = 'Eliminate the header on the estimate'
	this.object.logorapcons.checkbox.text = 'Eliminate the header on the consultation report'
	this.object.hideteeth.checkbox.text = 'Hide teeth on the requiert treatment'
	this.object.norminvoice.checkbox.text = 'Print Invoice on insurance form'
	this.object.ententetypefusion.checkbox.text = 'Use fusion with contract'
	this.object.modrdv.values = 'App. label template 1~tS/App. label template 2~tM/App. card template~tC/App. card template2~tA'
	this.object.gb_imp.text = "Appointment printing"
	this.object.typeimg.checkbox.text = "Use imaging with patient file"
	this.object.asshidetobedetermined.checkbox.text = "Hide 'to be determined' in insurance form"
	this.object.t_factnote1.text = 'Bill note 1:'
	this.object.t_factnote2.text = 'Bill note 2:'
	this.object.t_5.text = 'Path for correspondence:'
	this.object.t_6.text = 'Path for system correspondence:'
	this.object.t_word.text = 'Path for word processor application:'
	
	this.object.hidedepositsheader.checkbox.text = 'Eliminate the header on the deposits.'
	this.object.hideinvoiceheader.checkbox.text = 'Eliminate the header on the invoices and receipts.'
	this.object.hideabsencevoucherheader.checkbox.text = 'Eliminate the header on the absence vouchers.'
	this.object.hideaccountsummaryheader.checkbox.text = 'Eliminate the header on the account summaries.'
	this.object.hideinsuranceheader.checkbox.text = 'Eliminate the header on the insurance forms.'
end if

end event

event clicked;string ls_path, ls_filename

if dwo.name = 'p_folder' then
	select corrpath into :ls_path from t_options where ortho_id = :v_no_ortho;
	if isnull(ls_path) or ls_path = '' then ls_path = "c:\ii4net\orthotek\correspondance"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'corrpath',ls_path)
	change = true
end if

if dwo.name = 'p_folder1' then
	select corrpath into :ls_path from t_options where ortho_id = :v_no_ortho;
	if isnull(ls_path) or ls_path = '' then ls_path = "c:\ii4net\orthotek\corr"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'corrpathsys',ls_path)
	change = true
end if

if dwo.name = 'p_folder2' then
	select wordpath into :ls_path from t_options where ortho_id = :v_no_ortho;
	if isnull(ls_path) or ls_path = '' then ls_path = "C:\Program Files\Microsoft Office\OFFICE11\winword.exe"
	if v_langue = 'an' then
		GetFolder( "Choose a folder", ls_path )
	else
		GetFolder( "Choisir répertoire", ls_path )
	end if
	setItem(row,'wordpath',ls_path + "\winword.exe")
	change = true
end if

if dwo.name = 'p_sonmsg' then
	GetFileOpenName("Fichier du son", ls_path, ls_filename, "*.*","Tous (*.*), *.*","C:\ii4net\dentitek", 18)
	setItem(row,'sonmessage',ls_path)
	change = true
end if
end event

type tabpage_paperless from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "PaperLess"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionspaperless dw_optionspaperless
end type

on tabpage_paperless.create
this.dw_optionspaperless=create dw_optionspaperless
this.Control[]={this.dw_optionspaperless}
end on

on tabpage_paperless.destroy
destroy(this.dw_optionspaperless)
end on

type dw_optionspaperless from datawindow within tabpage_paperless
integer width = 4562
integer height = 2264
integer taborder = 110
string title = "none"
string dataobject = "d_optionspaperless"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.t_typerapcons.text = 'Consultation report type:'
end if

end event

type tabpage_comp from userobject within tab_options
event create ( )
event destroy ( )
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Comptabilité"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionscomp dw_optionscomp
end type

on tabpage_comp.create
this.dw_optionscomp=create dw_optionscomp
this.Control[]={this.dw_optionscomp}
end on

on tabpage_comp.destroy
destroy(this.dw_optionscomp)
end on

type dw_optionscomp from u_dw within tabpage_comp
integer y = 8
integer width = 4558
integer height = 2256
integer taborder = 30
string title = "optionscomp"
string dataobject = "d_optionscomp"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.t_typerecu.text = 'Type of receipt:'
	this.object.impotrecu.checkbox.text = 'Put tax exemption on the receipt'
	this.object.t_typerappaie.text = 'Type of summary report:'
	this.object.delpondepot.checkbox.text = 'Combined postdated and current payments in the deposit'
	this.object.t_bordereaux.text = 'Choice forms of deposit :'
	this.object.somdepot.values = 'Temp. 1~t1/Temp. 2~t2/Temp. 3~t3/Temp. 4~t4'
	this.object.compsat.checkbox.text = 'Accountancy by satellite'
	this.object.supppaiefact.checkbox.text = 'Password required for deleting bills and paiements'
	this.object.hidecredits.checkbox.text = 'Do not accept credit card'
	this.object.cochedepot.checkbox.text = 'Check all payments in the deposit report'
	this.object.signelectro.checkbox.text = 'Digital signature'
	this.object.sigass.checkbox.text = 'Signature on insurance form'
	this.object.sigrecu.checkbox.text = 'Signature on receipts'
	this.object.t_path.text = 'Set the path for Acomba'
	this.object.t_2.text = 'Income account:'
	this.object.t_3.text = 'Account receivable:'
	this.object.t_4.text = 'Cash on hand account:'
	this.object.t_5.text = 'Receipt note (fr):'
	this.object.t_6.text = 'Receipt note (en):'
	this.object.chrgarret.checkbox.text = 'Automaticaly stop charges'
end if
end event

event clicked;call super::clicked;integer li_rtn
string ls_path, ls_fileselect[]

CHOOSE CASE dwo.name 
	CASE 'p_signfile'
		li_rtn = GetFileOpenName("Choisir un fichier", ls_path, ls_fileselect[], "All Files (*.*)"," *.*", "C:\ii4net\orthotek", 18)	
		setItem(row,'signfile',ls_path)
		change = true
	CASE 'p_chemtd'
		li_rtn = GetFolder( "Chemin du TD Merchant Bank", ls_path )
		setItem(row,'chemintd',ls_path)
		change = true
END CHOOSE
end event

type tabpage_cincout from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "CinCout"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionscincout dw_optionscincout
end type

on tabpage_cincout.create
this.dw_optionscincout=create dw_optionscincout
this.Control[]={this.dw_optionscincout}
end on

on tabpage_cincout.destroy
destroy(this.dw_optionscincout)
end on

type dw_optionscincout from u_dw within tabpage_cincout
integer y = 12
integer width = 4562
integer height = 2248
integer taborder = 50
string title = "optionscincout"
string dataobject = "d_optionscincout"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;integer li_valeur_ini

pro_resize luo_size
luo_size.uf_resizedw(this)
SetTransObject(SQLCA)
if Retrieve(v_no_ortho) < 1 then return 0

if v_langue = 'an' then
	this.object.cincoutheurerdv.checkbox.text = 'Time sit = time of appointement'
	this.object.t_intervalle.text = 'Refresh interval, in seconds, of the console'
	this.object.gb_color.text = 'Console color'
	this.object.t_late.text = 'Late color:'
	this.object.t_cancel.text = 'cancelled color:'
	this.object.t_miss.text = 'Missed color:'
	this.object.t_early.text = 'Early color:'
	this.object.t_ontime.text = 'On time color:'
end if

li_valeur_ini = profileInt(gnv_app.of_getAppIniFile(), "Console", "Frequence rafraichissement", 3)

this.object.cc_int_ref_console[1] = li_valeur_ini
end event

event clicked;	long ll_null
	setnull(ll_null)

choose case dwo.name
	case 'p_rlate'
		setitem(row,'cincoutcretard',ll_null)
	case 'p_rcancel'
		setitem(row,'cincoutcancel',ll_null)
	case 'p_rmiss'
		setitem(row,'cincoutmiss',ll_null)
	case 'p_rearly'
		setitem(row,'cincoutearly',ll_null)
	case 'p_rontime'
		setitem(row,'cincoutontime',ll_null)
end choose
end event

event retrieveend;call super::retrieveend;long i
integer li_pr

for i = 1 to rowcount
	li_pr = getItemNumber(i, 'pret1')
	if isNull(li_pr) then setItem(i, 'pret1', 0)

	li_pr = getItemNumber(i, 'pret2')
	if isNull(li_pr) then setItem(i, 'pret2', 0)

	li_pr = getItemNumber(i, 'pret3')
	if isNull(li_pr) then setItem(i, 'pret3', 0)

	li_pr = getItemNumber(i, 'pret4')
	if isNull(li_pr) then setItem(i, 'pret4', 0)

	li_pr = getItemNumber(i, 'pret5')
	if isNull(li_pr) then setItem(i, 'pret5', 0)

	li_pr = getItemNumber(i, 'pret6')
	if isNull(li_pr) then setItem(i, 'pret6', 0)

	li_pr = getItemNumber(i, 'pret7')
	if isNull(li_pr) then setItem(i, 'pret7', 0)

	li_pr = getItemNumber(i, 'pret8')
	if isNull(li_pr) then setItem(i, 'pret8', 0)
	
	li_pr = getItemNumber(i, 'pret9')
	if isNull(li_pr) then setItem(i, 'pret9', 0)
	
	li_pr = getItemNumber(i, 'pret10')
	if isNull(li_pr) then setItem(i, 'pret10', 0)
	
next

end event

type tabpage_backup from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Backup"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_browsedirchupd pb_browsedirchupd
st_chmupd st_chmupd
cbx_updt cbx_updt
rb_ftp rb_ftp
cbx_srv cbx_srv
rb_server rb_server
st_adrsrv st_adrsrv
sle_adrsrv sle_adrsrv
pb_browsediradr pb_browsediradr
dw_optionsbackup dw_optionsbackup
sle_chmupd sle_chmupd
end type

on tabpage_backup.create
this.pb_browsedirchupd=create pb_browsedirchupd
this.st_chmupd=create st_chmupd
this.cbx_updt=create cbx_updt
this.rb_ftp=create rb_ftp
this.cbx_srv=create cbx_srv
this.rb_server=create rb_server
this.st_adrsrv=create st_adrsrv
this.sle_adrsrv=create sle_adrsrv
this.pb_browsediradr=create pb_browsediradr
this.dw_optionsbackup=create dw_optionsbackup
this.sle_chmupd=create sle_chmupd
this.Control[]={this.pb_browsedirchupd,&
this.st_chmupd,&
this.cbx_updt,&
this.rb_ftp,&
this.cbx_srv,&
this.rb_server,&
this.st_adrsrv,&
this.sle_adrsrv,&
this.pb_browsediradr,&
this.dw_optionsbackup,&
this.sle_chmupd}
end on

on tabpage_backup.destroy
destroy(this.pb_browsedirchupd)
destroy(this.st_chmupd)
destroy(this.cbx_updt)
destroy(this.rb_ftp)
destroy(this.cbx_srv)
destroy(this.rb_server)
destroy(this.st_adrsrv)
destroy(this.sle_adrsrv)
destroy(this.pb_browsediradr)
destroy(this.dw_optionsbackup)
destroy(this.sle_chmupd)
end on

type pb_browsedirchupd from picturebutton within tabpage_backup
integer x = 1294
integer y = 1008
integer width = 101
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "C:\ii4net\dentitek\images\foldopen.bmp"
string disabledname = "C:\ii4net\dentitek\images\folder.bmp"
alignment htextalign = left!
end type

event clicked;integer li_res
string ls_chemin

if sle_chmupd.text = "" then ls_chemin = "C:\ii4net\dentitek" else ls_chemin = sle_chmupd.text

if v_langue = 'an' then
	li_res = getFolder("Choose the folder where the update files will be kept", ls_chemin)
else
	li_res = getFolder("Choisissez le répertoire où seront conservés les fichiers de la mise-à-jour", ls_chemin)
end if

if li_res = 1 then
	sle_chmupd.text = ls_chemin
	change = true
end if

end event

type st_chmupd from statictext within tabpage_backup
integer x = 809
integer y = 952
integer width = 626
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chemin pour la mise-à-jour"
boolean focusrectangle = false
boolean disabledlook = true
end type

type cbx_updt from checkbox within tabpage_backup
integer x = 105
integer y = 820
integer width = 1307
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vérifier automatiquement les mises-à-jour disponibles"
end type

event clicked;rb_ftp.enabled = checked
rb_server.enabled = checked
if checked then
	cbx_srv.enabled = rb_ftp.checked
	st_chmupd.enabled = rb_ftp.checked and cbx_srv.checked
	sle_chmupd.enabled = rb_ftp.checked and cbx_srv.checked
	pb_browsedirchupd.enabled = rb_ftp.checked and cbx_srv.checked
	st_adrsrv.enabled = rb_server.checked
	sle_adrsrv.enabled = rb_server.checked
	pb_browsediradr.enabled = rb_server.checked
else
	cbx_srv.enabled = false
	st_chmupd.enabled = false
	sle_chmupd.enabled = false
	pb_browsedirchupd.enabled = false
	st_adrsrv.enabled = false
	sle_adrsrv.enabled = false
	pb_browsediradr.enabled = false
end if
change = true

end event

type rb_ftp from radiobutton within tabpage_backup
integer x = 105
integer y = 884
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Sur internet"
boolean checked = true
end type

event clicked;cbx_srv.enabled = checked
st_chmupd.enabled = cbx_srv.checked
sle_chmupd.enabled = cbx_srv.checked
pb_browsedirchupd.enabled = cbx_srv.checked
st_adrsrv.enabled = not checked
sle_adrsrv.enabled = not checked
pb_browsediradr.enabled = not checked
change = true

end event

type cbx_srv from checkbox within tabpage_backup
integer x = 128
integer y = 948
integer width = 645
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Ce poste est le serveur"
end type

event clicked;st_chmupd.enabled = checked
sle_chmupd.enabled = checked
pb_browsedirchupd.enabled = checked
change = true

end event

type rb_server from radiobutton within tabpage_backup
integer x = 105
integer y = 1104
integer width = 389
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Sur le réseau"
end type

event clicked;cbx_srv.enabled = not checked
st_chmupd.enabled = not checked
sle_chmupd.enabled = not checked
pb_browsedirchupd.enabled = not checked
st_adrsrv.enabled = checked
sle_adrsrv.enabled = checked
pb_browsediradr.enabled = checked
change = true

end event

type st_adrsrv from statictext within tabpage_backup
integer x = 128
integer y = 1168
integer width = 928
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chemin pour la mise-à-jour sur le serveur"
boolean focusrectangle = false
boolean disabledlook = true
end type

type sle_adrsrv from singlelineedit within tabpage_backup
integer x = 123
integer y = 1232
integer width = 1143
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;if directoryExists(text) then
	if right(text, 1) = '\' then text = left(text, len(text) - 1)
	change = true
else
	error_type(1103)
end if

end event

type pb_browsediradr from picturebutton within tabpage_backup
integer x = 1294
integer y = 1228
integer width = 101
integer height = 88
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "C:\ii4net\dentitek\images\foldopen.bmp"
string disabledname = "C:\ii4net\dentitek\images\folder.bmp"
alignment htextalign = left!
end type

event clicked;integer li_res
string ls_chemin

if sle_adrsrv.text = "" then ls_chemin = "Favoris réseau" else ls_chemin = sle_adrsrv.text

if v_langue = 'an' then
	li_res = getFolder("Choose the romote server folder where the update files will be kept", ls_chemin)
else
	li_res = getFolder("Choisissez le répertoire sur le serveur où seront conservés les fichiers de la mise-à-jour", ls_chemin)
end if

if li_res = 1 then
	sle_adrsrv.text = ls_chemin
	change = true
end if

end event

type dw_optionsbackup from u_dw within tabpage_backup
integer width = 4558
integer height = 2252
integer taborder = 30
string title = "optionsbackup"
string dataobject = "d_optionsbackup"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

long ll_newrow
string ls_tmp

SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_datebackup.text = 'Date of the last Backup:'
	this.object.t_destdrive.text = 'Destination drive:'
	this.object.log.checkbox.text = 'Compress the log file'
end if
if Retrieve(v_no_ortho) = 0 then
	ll_newrow = insertrow(0)
	setitem(ll_newrow,'commandline','uid=dba;pwd=ii4clmam;dsn=orthotek')
end if

ls_tmp = lower(profileString(gnv_app.of_getAppIniFile(), "Update", "Check", "Yes"))

if ls_tmp = "no" then
	cbx_updt.checked = false
	rb_ftp.enabled = false
	cbx_srv.enabled = false
	st_chmupd.enabled = false
	sle_chmupd.enabled = false
	pb_browsedirchupd.enabled = false
	rb_server.enabled = false
	st_adrsrv.enabled = false
	sle_adrsrv.enabled = false
	pb_browsediradr.enabled = false
	return 0
end if

cbx_updt.checked = true
rb_ftp.enabled = true
rb_server.enabled = true
ls_tmp = lower(profileString(gnv_app.of_getAppIniFile(), "Update", "From", "FTP"))

if ls_tmp = "ftp" then
	rb_ftp.checked = true
	cbx_srv.enabled = true
	
	ls_tmp = lower(profileString(gnv_app.of_getAppIniFile(), "Update", "Server", "No"))
	
	if ls_tmp = 'yes' then
		cbx_srv.checked = true
		sle_chmupd.text = profileString(gnv_app.of_getAppIniFile(), "Update", "SavePath", "")
		st_chmupd.enabled = true
		sle_chmupd.enabled = true
		pb_browsedirchupd.enabled = true
	else
		cbx_srv.checked = false
		st_chmupd.enabled = false
		sle_chmupd.enabled = false
		pb_browsedirchupd.enabled = false
	end if
	
	rb_server.checked = false
	st_adrsrv.enabled = false
	sle_adrsrv.enabled = false
	pb_browsediradr.enabled = false
elseif ls_tmp = "server" then
	rb_server.checked = true
	sle_adrsrv.text = profileString(gnv_app.of_getAppIniFile(), "Update", "Address", "")
	st_adrsrv.enabled = true
	sle_adrsrv.enabled = true
	pb_browsediradr.enabled = true

	cbx_srv.enabled = false
	st_chmupd.enabled = false
	sle_chmupd.enabled = false
	pb_browsedirchupd.enabled = false
end if

end event

type sle_chmupd from singlelineedit within tabpage_backup
integer x = 128
integer y = 1012
integer width = 1143
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;if directoryExists(text) then
	if right(text, 1) = '\' then text = left(text, len(text) - 1)
	change = true
else
	error_type(1103)
end if

end event

type tabpage_defaut from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Défaut"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionsdefaut dw_optionsdefaut
end type

on tabpage_defaut.create
this.dw_optionsdefaut=create dw_optionsdefaut
this.Control[]={this.dw_optionsdefaut}
end on

on tabpage_defaut.destroy
destroy(this.dw_optionsdefaut)
end on

type dw_optionsdefaut from u_dw within tabpage_defaut
integer width = 4581
integer height = 2260
integer taborder = 50
string title = "optionsdefaut"
string dataobject = "d_optionsdefaut"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

time lt_horam1,lt_horam2,lt_horpm1,lt_horpm2

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.t_defprov.text = 'Province:'
	this.object.t_deflangue.text = 'Language:'
	this.object.t_1.text = 'City:'
	this.object.t_defhoram1.text = 'Sheet #1:'
	this.object.t_defhorpm1.text = 'Sheet #2:'
	this.object.t_from1.text = 'From'
	this.object.t_from2.text = 'From'
	this.object.t_to1.text = 'To'
	this.object.t_to2.text = 'To'
	this.object.t_method.text = 'Method by default:'
else
	
end if
this.object.defprov.values = gf_prov(v_langue)

select hor_depart_am,hor_fin_am,hor_depart_pm,hor_fin_pm 
into :lt_horam1,:lt_horam2,:lt_horpm1,:lt_horpm2 
from t_options 
where ortho_id = :v_no_ortho;

if isnull(getitemtime(1,'defhoram1')) then
	setitem(1,'defhoram1',lt_horam1)
end if
if isnull(getitemtime(1,'defhoram2')) then
	setitem(1,'defhoram2',lt_horam2)
end if
if isnull(getitemtime(1,'defhorpm1')) then
	setitem(1,'defhorpm1',lt_horpm1)
end if
if isnull(getitemtime(1,'defhorpm2')) then
	setitem(1,'defhorpm2',lt_horpm2)
end if

this.object.method.values = gf_method(v_langue)
end event

type tabpage_mailing from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Courriel"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionsemail dw_optionsemail
end type

on tabpage_mailing.create
this.dw_optionsemail=create dw_optionsemail
this.Control[]={this.dw_optionsemail}
end on

on tabpage_mailing.destroy
destroy(this.dw_optionsemail)
end on

type dw_optionsemail from u_dw within tabpage_mailing
integer width = 4535
integer height = 2260
integer taborder = 40
string title = "Mailing"
string dataobject = "d_optionsemail"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;//string ls_path
//
//if dwo.name = 'p_folder' then
//	select corrpath into :ls_path from t_options where ortho_id = :v_no_ortho;
//	if isnull(ls_path) or ls_path = '' then ls_path = "c:\ii4net\orthotek\correspondance"
//	if v_langue = 'an' then
//		GetFolder( "Choose a folder", ls_path )
//	else
//		GetFolder( "Choisir répertoire", ls_path )
//	end if
//	setItem(row,'corrpath',ls_path)
//	change = true
//end if
//
//if dwo.name = 'p_folder1' then
//	select corrpath into :ls_path from t_options where ortho_id = :v_no_ortho;
//	if isnull(ls_path) or ls_path = '' then ls_path = "c:\ii4net\orthotek\corr"
//	if v_langue = 'an' then
//		GetFolder( "Choose a folder", ls_path )
//	else
//		GetFolder( "Choisir répertoire", ls_path )
//	end if
//	setItem(row,'corrpathsys',ls_path)
//	change = true
//end if
//
//if dwo.name = 'p_folder2' then
//	select wordpath into :ls_path from t_options where ortho_id = :v_no_ortho;
//	if isnull(ls_path) or ls_path = '' then ls_path = "C:\Program Files\Microsoft Office\OFFICE11\winword.exe"
//	if v_langue = 'an' then
//		GetFolder( "Choose a folder", ls_path )
//	else
//		GetFolder( "Choisir répertoire", ls_path )
//	end if
//	setItem(row,'wordpath',ls_path + "\winword.exe")
//	change = true
//end if
//
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)
//if v_langue = 'an' then
//	this.object.hidesecformnorm.checkbox.text = 'Hide section in the N form'
//	this.object.logorappre.checkbox.text = 'Eliminate the outline on the preliminary report'
//	this.object.logotraitreq.checkbox.text = 'Eliminate the outline on the required treatment'
//	this.object.recudelassnumber.checkbox.text = 'Eliminate the association # on the receipt'
//	this.object.doscons.checkbox.text = 'Eliminate the file number in the consultation report'
//	this.object.estdelheader.checkbox.text = 'Eliminate the header on the estimate'
//	this.object.logorapcons.checkbox.text = 'Eliminate the header on the consultation report'
//	this.object.hideteeth.checkbox.text = 'Hide teeth on the requiert treatment'
//	this.object.norminvoice.checkbox.text = 'Print Invoice on insurance form'
//	this.object.ententetypefusion.checkbox.text = 'Use fusion with contract'
//	this.object.modrdv.values = 'App. label template 1~tS/App. label template 2~tM/App. card template~tC/App. card template2~tA'
//	this.object.gb_imp.text = "Appointment printing"
//	this.object.typeimg.checkbox.text = "Use imaging with patient file"
//	this.object.asshidetobedetermined.checkbox.text = "Hide 'to be determined' in insurance form"
//	this.object.t_typerapcons.text = 'Consultation report type:'
//	this.object.t_factnote1.text = 'Bill note 1:'
//	this.object.t_factnote2.text = 'Bill note 2:'
//	this.object.t_5.text = 'Path for correspondence:'
//	this.object.t_6.text = 'Path for system correspondence:'
//	this.object.t_word.text = 'Path for word processor application:'
//end if
//

end event

event rbuttondown;call super::rbuttondown;scrolltorow(row)
if row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.uf_translate()
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
end if
end event

type tabpage_charges from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Charges"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_delete cb_delete
cb_insert cb_insert
dw_charges dw_charges
end type

on tabpage_charges.create
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.dw_charges=create dw_charges
this.Control[]={this.cb_delete,&
this.cb_insert,&
this.dw_charges}
end on

on tabpage_charges.destroy
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.dw_charges)
end on

type cb_delete from commandbutton within tabpage_charges
integer x = 727
integer y = 2176
integer width = 727
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_charges.deleterow(dw_charges.getrow())
end event

type cb_insert from commandbutton within tabpage_charges
integer y = 2176
integer width = 727
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long ll_newrow

ll_newrow = dw_charges.insertrow(0)
dw_charges.setitem(ll_newrow,'chargdate',today())
dw_charges.setitem(ll_newrow,'chargtaux',0)
dw_charges.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_charges.scrolltorow(ll_newrow)
dw_charges.SetFocus()
end event

type dw_charges from u_dw within tabpage_charges
integer width = 3584
integer height = 2160
integer taborder = 50
string title = "Charges"
string dataobject = "d_charges"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.chargdate_t.text = 'Effective date'
	this.object.chargtaux_t.text = 'Rate (by minute)'
end if


end event

type tabpage_mon from userobject within tab_options
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string text = "Exportation comptable"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_optionsmon dw_optionsmon
end type

on tabpage_mon.create
this.dw_optionsmon=create dw_optionsmon
this.Control[]={this.dw_optionsmon}
end on

on tabpage_mon.destroy
destroy(this.dw_optionsmon)
end on

type dw_optionsmon from u_dw within tabpage_mon
integer y = 4
integer width = 4558
integer height = 2252
integer taborder = 11
string dataobject = "d_optionsmon"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
string is_updatesallowed = "U"
end type

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)

if v_langue = 'an' then
	object.monerishost_t.text = 'Host :'
	object.monerisuser_t.text = 'User name :'
	object.monerispw_t.text = 'Password :'
	object.monerisstore_t.text = 'Store ID :'
	object.monerisapit_t.text = 'API Token :'
	object.moneristransno_t.text = 'Next Order ID :'
end if

end event

type tabpage_sys from userobject within tab_options
boolean visible = false
integer x = 18
integer y = 208
integer width = 4576
integer height = 2268
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Système"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_pdf sle_pdf
cb_pdf cb_pdf
st_6 st_6
cb_31 cb_31
cb_30 cb_30
cb_29 cb_29
cb_28 cb_28
rte_conv rte_conv
cb_upload cb_upload
cb_27 cb_27
st_3 st_3
st_2 st_2
rb_user rb_user
rb_mac rb_mac
cb_26 cb_26
ddlb_orthodest ddlb_orthodest
cb_25 cb_25
cb_24 cb_24
cb_23 cb_23
cb_22 cb_22
cb_21 cb_21
cb_20 cb_20
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_chrgs cb_chrgs
cb_15 cb_15
cb_14 cb_14
cb_img cb_img
cb_13 cb_13
st_1 st_1
st_start st_start
sle_end sle_end
sle_start sle_start
cb_12 cb_12
em_nbyear em_nbyear
cb_archive cb_archive
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_noboite cb_noboite
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_entente cb_entente
cb_setquote cb_setquote
cb_monthly cb_monthly
cb_mens cb_mens
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cpdenc cb_cpdenc
gb_archive gb_archive
gb_horaire gb_horaire
gb_2 gb_2
ddlb_orthoscr ddlb_orthoscr
gb_corr gb_corr
end type

on tabpage_sys.create
this.sle_pdf=create sle_pdf
this.cb_pdf=create cb_pdf
this.st_6=create st_6
this.cb_31=create cb_31
this.cb_30=create cb_30
this.cb_29=create cb_29
this.cb_28=create cb_28
this.rte_conv=create rte_conv
this.cb_upload=create cb_upload
this.cb_27=create cb_27
this.st_3=create st_3
this.st_2=create st_2
this.rb_user=create rb_user
this.rb_mac=create rb_mac
this.cb_26=create cb_26
this.ddlb_orthodest=create ddlb_orthodest
this.cb_25=create cb_25
this.cb_24=create cb_24
this.cb_23=create cb_23
this.cb_22=create cb_22
this.cb_21=create cb_21
this.cb_20=create cb_20
this.cb_19=create cb_19
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_16=create cb_16
this.cb_chrgs=create cb_chrgs
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_img=create cb_img
this.cb_13=create cb_13
this.st_1=create st_1
this.st_start=create st_start
this.sle_end=create sle_end
this.sle_start=create sle_start
this.cb_12=create cb_12
this.em_nbyear=create em_nbyear
this.cb_archive=create cb_archive
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_noboite=create cb_noboite
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_entente=create cb_entente
this.cb_setquote=create cb_setquote
this.cb_monthly=create cb_monthly
this.cb_mens=create cb_mens
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cpdenc=create cb_cpdenc
this.gb_archive=create gb_archive
this.gb_horaire=create gb_horaire
this.gb_2=create gb_2
this.ddlb_orthoscr=create ddlb_orthoscr
this.gb_corr=create gb_corr
this.Control[]={this.sle_pdf,&
this.cb_pdf,&
this.st_6,&
this.cb_31,&
this.cb_30,&
this.cb_29,&
this.cb_28,&
this.rte_conv,&
this.cb_upload,&
this.cb_27,&
this.st_3,&
this.st_2,&
this.rb_user,&
this.rb_mac,&
this.cb_26,&
this.ddlb_orthodest,&
this.cb_25,&
this.cb_24,&
this.cb_23,&
this.cb_22,&
this.cb_21,&
this.cb_20,&
this.cb_19,&
this.cb_18,&
this.cb_17,&
this.cb_16,&
this.cb_chrgs,&
this.cb_15,&
this.cb_14,&
this.cb_img,&
this.cb_13,&
this.st_1,&
this.st_start,&
this.sle_end,&
this.sle_start,&
this.cb_12,&
this.em_nbyear,&
this.cb_archive,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_noboite,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_entente,&
this.cb_setquote,&
this.cb_monthly,&
this.cb_mens,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cpdenc,&
this.gb_archive,&
this.gb_horaire,&
this.gb_2,&
this.ddlb_orthoscr,&
this.gb_corr}
end on

on tabpage_sys.destroy
destroy(this.sle_pdf)
destroy(this.cb_pdf)
destroy(this.st_6)
destroy(this.cb_31)
destroy(this.cb_30)
destroy(this.cb_29)
destroy(this.cb_28)
destroy(this.rte_conv)
destroy(this.cb_upload)
destroy(this.cb_27)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.rb_user)
destroy(this.rb_mac)
destroy(this.cb_26)
destroy(this.ddlb_orthodest)
destroy(this.cb_25)
destroy(this.cb_24)
destroy(this.cb_23)
destroy(this.cb_22)
destroy(this.cb_21)
destroy(this.cb_20)
destroy(this.cb_19)
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_16)
destroy(this.cb_chrgs)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_img)
destroy(this.cb_13)
destroy(this.st_1)
destroy(this.st_start)
destroy(this.sle_end)
destroy(this.sle_start)
destroy(this.cb_12)
destroy(this.em_nbyear)
destroy(this.cb_archive)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_noboite)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_entente)
destroy(this.cb_setquote)
destroy(this.cb_monthly)
destroy(this.cb_mens)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cpdenc)
destroy(this.gb_archive)
destroy(this.gb_horaire)
destroy(this.gb_2)
destroy(this.ddlb_orthoscr)
destroy(this.gb_corr)
end on

type sle_pdf from singlelineedit within tabpage_sys
integer x = 3045
integer y = 1092
integer width = 526
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event constructor;sle_pdf.text = "c:\ii4net\test.pdf"
end event

type cb_pdf from commandbutton within tabpage_sys
integer x = 3035
integer y = 976
integer width = 535
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "TEST PDF"
end type

event clicked;n_ds lnv_imps

lnv_imps = create n_ds

lnv_imps.dataobject = 'd_liste_referents'
lnv_imps.settransobject(SQLCA)
lnv_imps.retrieve(1)

lnv_imps.saveas(sle_pdf.text,PDF!,true)
end event

type st_6 from statictext within tabpage_sys
integer x = 1696
integer y = 1676
integer width = 402
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type cb_31 from commandbutton within tabpage_sys
integer x = 873
integer y = 1660
integer width = 809
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Arranger RDV"
end type

event clicked;setpointer(hourglass!)

real lr_etape
string ls_etape

ls_etape = inputbox("Correction des rendez-vous", "Commencer à quelle étape ?","")
if isNumber(ls_etape) then lr_etape = real(ls_etape) else lr_etape = 0

st_6.visible = true

if lr_etape < 1.01 then
	st_6.text = "étape : 1.01 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 1
	update horaire set patient_id_1 = 0,
							 duree1 = null
	 where not exists(select 1 from patient where patient_id = patient_id_1);
	commit using SQLCA;
end if

if lr_etape < 1.02 then
	st_6.text = "étape : 1.02 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 2
	update horaire set patient_id_2 = 0,
							 duree2 = null
	 where not exists(select 1 from patient where patient_id = patient_id_2);
	commit using SQLCA;
end if

if lr_etape < 1.03 then
	st_6.text = "étape : 1.03 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 3
	update horaire set patient_id_3 = 0,
							 duree3 = null
	 where not exists(select 1 from patient where patient_id = patient_id_3);
	commit using SQLCA;
end if

if lr_etape < 1.04 then
	st_6.text = "étape : 1.04 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 4
	update horaire set patient_id_4 = 0,
							 duree4 = null
	 where not exists(select 1 from patient where patient_id = patient_id_4);
	commit using SQLCA;
end if

if lr_etape < 1.05 then
	st_6.text = "étape : 1.05 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 5
	update horaire set patient_id_5 = 0,
							 duree5 = null
	 where not exists(select 1 from patient where patient_id = patient_id_5);
	commit using SQLCA;
end if

if lr_etape < 1.06 then
	st_6.text = "étape : 1.06 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 6
	update horaire set patient_id_6 = 0,
							 duree6 = null
	 where not exists(select 1 from patient where patient_id = patient_id_6);
	commit using SQLCA;
end if

if lr_etape < 1.07 then
	st_6.text = "étape : 1.07 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 7
	update horaire set patient_id_7 = 0,
							 duree7 = null
	 where not exists(select 1 from patient where patient_id = patient_id_7);
	commit using SQLCA;
end if

if lr_etape < 1.08 then
	st_6.text = "étape : 1.08 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 8
	update horaire set patient_id_8 = 0,
							 duree8 = null
	 where not exists(select 1 from patient where patient_id = patient_id_8);
	commit using SQLCA;
end if

if lr_etape < 1.09 then
	st_6.text = "étape : 1.09 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 9
	update horaire set patient_id_9 = 0,
							 duree9 = null
	 where not exists(select 1 from patient where patient_id = patient_id_9);
	commit using SQLCA;
end if

if lr_etape < 1.1 then
	st_6.text = "étape : 1.10 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 10
	update horaire set patient_id_10 = 0,
							 duree10 = null
	 where not exists(select 1 from patient where patient_id = patient_id_10);
	commit using SQLCA;
end if

if lr_etape < 1.11 then
	st_6.text = "étape : 1.11 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 11
	update horaire set patient_id_11 = 0,
							 duree11 = null
	 where not exists(select 1 from patient where patient_id = patient_id_11);
	commit using SQLCA;
end if
if lr_etape < 1.12 then
	st_6.text = "étape : 1.12 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 12
	update horaire set patient_id_12 = 0,
							 duree12 = null
	 where not exists(select 1 from patient where patient_id = patient_id_12);
	commit using SQLCA;
end if
if lr_etape < 1.13 then
	st_6.text = "étape : 1.13 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 13
	update horaire set patient_id_13 = 0,
							 duree13 = null
	 where not exists(select 1 from patient where patient_id = patient_id_13);
	commit using SQLCA;
end if
if lr_etape < 1.14 then
	st_6.text = "étape : 1.14 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 14
	update horaire set patient_id_14 = 0,
							 duree14 = null
	 where not exists(select 1 from patient where patient_id = patient_id_14);
	commit using SQLCA;
end if
if lr_etape < 1.15 then
	st_6.text = "étape : 1.15 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des ID patients
	// colonne 15
	update horaire set patient_id_15 = 0,
							 duree15 = null
	 where not exists(select 1 from patient where patient_id = patient_id_15);
	commit using SQLCA;
end if

if lr_etape < 2.01 then
	st_6.text = "étape : 2.01 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des rendez-vous
	// colonne 1
	update t_rdv set 	  colonne = 1,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree1,
							  patient_id = horaire.patient_id_1,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_1 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.02 then
	st_6.text = "étape : 2.02 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 2
	update t_rdv set 	  colonne = 2,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree2,
							  patient_id = horaire.patient_id_2,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_2 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.03 then
	st_6.text = "étape : 2.03 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 3
	update t_rdv set 	  colonne = 3,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree3,
							  patient_id = horaire.patient_id_3,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_3 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.04 then
	st_6.text = "étape : 2.04 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 4
	update t_rdv set 	  colonne = 4,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree4,
							  patient_id = horaire.patient_id_4,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_4 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.05 then
	st_6.text = "étape : 2.05 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 5
	update t_rdv set 	  colonne = 5,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree5,
							  patient_id = horaire.patient_id_5,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_5 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.06 then
	st_6.text = "étape : 2.06 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 6
	update t_rdv set 	  colonne = 6,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree6,
							  patient_id = horaire.patient_id_6,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_6 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.07 then
	st_6.text = "étape : 2.07 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 7
	update t_rdv set 	  colonne = 7,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree7,
							  patient_id = horaire.patient_id_7,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_7 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.08 then
	st_6.text = "étape : 2.08 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 8
	update t_rdv set 	  colonne = 8,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree8,
							  patient_id = horaire.patient_id_8,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_8 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.09 then
	st_6.text = "étape : 2.09 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 9
	update t_rdv set 	  colonne = 9,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree9,
							  patient_id = horaire.patient_id_9,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_9 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.1 then
	st_6.text = "étape : 2.10 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 10
	update t_rdv set 	  colonne = 10,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree10,
							  patient_id = horaire.patient_id_10,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_10 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.11 then
	st_6.text = "étape : 2.11 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 11
	update t_rdv set 	  colonne = 11,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree11,
							  patient_id = horaire.patient_id_11,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_11 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.12 then
	st_6.text = "étape : 2.12 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 12
	update t_rdv set 	  colonne = 12,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree12,
							  patient_id = horaire.patient_id_12,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_12 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.13 then
	st_6.text = "étape : 2.13 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 13
	update t_rdv set 	  colonne = 13,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree13,
							  patient_id = horaire.patient_id_13,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_13 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.14 then
	st_6.text = "étape : 2.14 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 14
	update t_rdv set 	  colonne = 14,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree14,
							  patient_id = horaire.patient_id_14,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_14 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 2.15 then
	st_6.text = "étape : 2.15 de 4"
	yield()
	setpointer(hourglass!)
	// colonne 15
	update t_rdv set 	  colonne = 15,
							  rdvdate = horaire.datecal,
							  rdvheure = horaire.heure,
							  duree = horaire.duree15,
							  patient_id = horaire.patient_id_15,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on t_rdv.patient_id = horaire.patient_id_15 and 
	  											  t_rdv.rdvdate = horaire.datecal and 
	  											  t_rdv.rdvheure = horaire.heure;
	commit using SQLCA;
end if

if lr_etape < 3.01 then
	st_6.text = "étape : 3.01 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des rendez-vous existant quand spécialist est null
	// Première colonne
	update t_rdv set 	  colonne = 1,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_1 = t_rdv.patient_id
	 where isnull(horaire.duree1, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.02 then
	st_6.text = "étape : 3.02 de 4"
	yield()
	setpointer(hourglass!)
	// Deuxième colonne
	update t_rdv set 	  colonne = 2,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_2 = t_rdv.patient_id
	 where isnull(horaire.duree2, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.03 then
	st_6.text = "étape : 3.03 de 4"
	yield()
	setpointer(hourglass!)
	// Troisième colonne
	update t_rdv set 	  colonne = 3,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_3 = t_rdv.patient_id
	 where isnull(horaire.duree3, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.04 then
	st_6.text = "étape : 3.04 de 4"
	yield()
	setpointer(hourglass!)
	// Quatrième colonne
	update t_rdv set 	  colonne = 4,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_4 = t_rdv.patient_id
	 where isnull(horaire.duree4, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.05 then
	st_6.text = "étape : 3.05 de 4"
	yield()
	setpointer(hourglass!)
	// Cinquième colonne
	update t_rdv set 	  colonne = 5,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_5 = t_rdv.patient_id
	 where isnull(horaire.duree5, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.06 then
	st_6.text = "étape : 3.06 de 4"
	yield()
	setpointer(hourglass!)
	// Sixième colonne
	update t_rdv set 	  colonne = 6,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_6 = t_rdv.patient_id
	 where isnull(horaire.duree6, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.07 then
	st_6.text = "étape : 3.07 de 4"
	yield()
	setpointer(hourglass!)
	// Septième colonne
	update t_rdv set 	  colonne = 7,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_7 = t_rdv.patient_id
	 where isnull(horaire.duree7, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.08 then
	st_6.text = "étape : 3.08 de 4"
	yield()
	setpointer(hourglass!)
	// Huitième colonne
	update t_rdv set 	  colonne = 8,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_8 = t_rdv.patient_id
	 where isnull(horaire.duree8, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.09 then
	st_6.text = "étape : 3.09 de 4"
	yield()
	setpointer(hourglass!)
	// Neuvième colonne
	update t_rdv set 	  colonne = 9,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_9 = t_rdv.patient_id
	 where isnull(horaire.duree9, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.1 then
	st_6.text = "étape : 3.10 de 4"
	yield()
	setpointer(hourglass!)
	// Dixième colonne
	update t_rdv set 	  colonne = 10,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_10 = t_rdv.patient_id
	 where isnull(horaire.duree10, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.11 then
	st_6.text = "étape : 3.11 de 4"
	yield()
	setpointer(hourglass!)
	// Onzième colonne
	update t_rdv set 	  colonne = 11,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_11 = t_rdv.patient_id
	 where isnull(horaire.duree11, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.12 then
	st_6.text = "étape : 3.12 de 4"
	yield()
	setpointer(hourglass!)
	// Douzième colonne
	update t_rdv set 	  colonne = 12,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_12 = t_rdv.patient_id
	 where isnull(horaire.duree12, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.13 then
	st_6.text = "étape : 3.13 de 4"
	yield()
	setpointer(hourglass!)
	// Treizième colonne
	update t_rdv set 	  colonne = 13,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_13 = t_rdv.patient_id
	 where isnull(horaire.duree13, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.14 then
	st_6.text = "étape : 3.14 de 4"
	yield()
	setpointer(hourglass!)
	// Quatorzième colonne
	update t_rdv set 	  colonne = 14,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_14 = t_rdv.patient_id
	 where isnull(horaire.duree14, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 3.15 then
	st_6.text = "étape : 3.15 de 4"
	yield()
	setpointer(hourglass!)
	// Quinzième colonne
	update t_rdv set 	  colonne = 15,
							  ortho_id = horaire.no_ortho
	  from t_rdv inner join horaire on 	  horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_15 = t_rdv.patient_id
	 where isnull(horaire.duree15, 0) > 0
		and t_rdv.ortho_id is null
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if


if lr_etape < 4.01 then
	st_6.text = "étape : 4.01 de 4"
	yield()
	setpointer(hourglass!)
	// Correction des rendez-vous existant quand colonne est null
	//Première colonne
	update t_rdv set colonne = 1
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_1 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree1, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.02 then
	st_6.text = "étape : 4.02 de 4"
	yield()
	setpointer(hourglass!)
	// Deuxième colonne
	update t_rdv set colonne = 2
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_2 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree2, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.03 then
	st_6.text = "étape : 4.03 de 4"
	yield()
	setpointer(hourglass!)
	// Troisième colonne
	update t_rdv set colonne = 3
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_3 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree3, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.04 then
	st_6.text = "étape : 4.04 de 4"
	yield()
	setpointer(hourglass!)
	// Quatrième colonne
	update t_rdv set colonne = 4
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_4 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree4, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.05 then
	st_6.text = "étape : 4.05 de 4"
	yield()
	setpointer(hourglass!)
	// Cinquième colonne
	update t_rdv set colonne = 5
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_5 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree5, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.06 then
	st_6.text = "étape : 4.06 de 4"
	yield()
	setpointer(hourglass!)
	// Sixième colonne
	update t_rdv set colonne = 6
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_6 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree6, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.07 then
	st_6.text = "étape : 4.07 de 4"
	yield()
	setpointer(hourglass!)
	// Septième colonne
	update t_rdv set colonne = 7
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_7 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree7, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.08 then
	st_6.text = "étape : 4.08 de 4"
	yield()
	setpointer(hourglass!)
	// Huitième colonne
	update t_rdv set colonne = 8
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_8 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree8, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.09 then
	st_6.text = "étape : 4.09 de 4"
	yield()
	setpointer(hourglass!)
	// Neuvième colonne
	update t_rdv set colonne = 9
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_9 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree9, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.1 then
	st_6.text = "étape : 4.10 de 4"
	yield()
	setpointer(hourglass!)
	// Dixième colonne
	update t_rdv set colonne = 10
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_10 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree10, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.11 then
	st_6.text = "étape : 4.11 de 4"
	yield()
	setpointer(hourglass!)
	// Dixième colonne
	update t_rdv set colonne = 11
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_11 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree11, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.12 then
	st_6.text = "étape : 4.12 de 4"
	yield()
	setpointer(hourglass!)
	// Dixième colonne
	update t_rdv set colonne = 12
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_12 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree12, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.13 then
	st_6.text = "étape : 4.13 de 4"
	yield()
	setpointer(hourglass!)
	// Dixième colonne
	update t_rdv set colonne = 13
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_13 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree13, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.14 then
	st_6.text = "étape : 4.14 de 4"
	yield()
	setpointer(hourglass!)
	// Dixième colonne
	update t_rdv set colonne = 14
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_14 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree14, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

if lr_etape < 4.15 then
	st_6.text = "étape : 4.15 de 4"
	yield()
	setpointer(hourglass!)
	// Dixième colonne
	update t_rdv set colonne = 15
	  from t_rdv inner join horaire on horaire.datecal = t_rdv.rdvdate
												 and horaire.heure = t_rdv.rdvheure
												 and horaire.patient_id_15 = t_rdv.patient_id
	 where t_rdv.colonne is null
		and isnull(horaire.duree15, 0) > 0
		and exists (select 1 from patient where patient_id = t_rdv.patient_id);
	commit using SQLCA;
end if

st_6.visible = false

end event

type cb_30 from commandbutton within tabpage_sys
integer x = 41
integer y = 1652
integer width = 768
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mettre RDV dans horaire"
end type

event clicked;insert into horaire(datecal,heure,patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,patient_id_11,patient_id_12,patient_id_13,patient_id_14,patient_id_15,
                    patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10,patient_nom_11,patient_nom_12,patient_nom_13,patient_nom_14,patient_nom_15,no_ortho,
                    couleur_text_1,couleur_text_2,couleur_text_3,couleur_text_4,couleur_text_5,couleur_text_6,couleur_text_7,couleur_text_8,couleur_text_9,couleur_text_10,couleur_text_11,couleur_text_12,couleur_text_13,couleur_text_14,couleur_text_15,
                    traitementid1,traitementid2,traitementid3,traitementid4,traitementid5,traitementid6,traitementid7,traitementid8,traitementid9,traitementid10,traitementid11,traitementid12,traitementid13,traitementid14,traitementid15,
                    duree1,duree2,duree3,duree4,duree5,duree6,duree7,duree8,duree9,duree10,duree11,duree12,duree13,duree14,duree15,
                    memo1,memo2,memo3,memo4,memo5,memo6,memo7,memo8,memo9,memo10,memo11,memo12,memo13,memo14,memo15)
(select  dte.d,
        hre.h,
        r1.patient_id as patid1,
        r2.patient_id as patid2,
        r3.patient_id as patid3,
        r4.patient_id as patid4,
        r5.patient_id as patid5,
        r6.patient_id as patid6,
        r7.patient_id as patid7,
        r8.patient_id as patid8,
        r9.patient_id as patid9,
        r10.patient_id as patid10,
		  r11.patient_id as patid11,
		  r12.patient_id as patid12,
		  r13.patient_id as patid13,
		  r14.patient_id as patid14,
		  r15.patient_id as patid15,
        (if r1.rdvheure = hre.h and r1.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r1.patient_id)
         else
            if dateadd(minute, 15, r1.rdvheure) = hre.h and r1.rdvdate = dte.d then
                t1.nom_traitement
            else
                'X'
            endif
         endif) as patnom1,
        (if r2.rdvheure = hre.h and r2.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r2.patient_id)
         else
            if dateadd(minute, 15, r2.rdvheure) = hre.h and r2.rdvdate = dte.d then
                t2.nom_traitement
            else
                'X'
            endif
         endif) as patnom2,
        (if r3.rdvheure = hre.h and r3.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r3.patient_id)
         else
            if dateadd(minute, 15, r3.rdvheure) = hre.h and r3.rdvdate = dte.d then
                t3.nom_traitement
            else
                'X'
            endif
         endif) as patnom3,
        (if r4.rdvheure = hre.h and r4.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r4.patient_id)
         else
            if dateadd(minute, 15, r4.rdvheure) = hre.h and r4.rdvdate = dte.d then
                t4.nom_traitement
            else
                'X'
            endif
         endif) as patnom4,
       (if r5.rdvheure = hre.h and r5.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r5.patient_id)
         else
            if dateadd(minute, 15, r5.rdvheure) = hre.h and r5.rdvdate = dte.d then
                t5.nom_traitement
            else
                'X'
            endif
         endif) as patnom5,
       (if r6.rdvheure = hre.h and r6.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r6.patient_id)
         else
            if dateadd(minute, 15, r6.rdvheure) = hre.h and r6.rdvdate = dte.d then
                t6.nom_traitement
            else
                'X'
            endif
         endif) as patnom6,
       (if r7.rdvheure = hre.h and r7.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r7.patient_id)
         else
            if dateadd(minute, 15, r7.rdvheure) = hre.h and r7.rdvdate = dte.d then
                t7.nom_traitement
            else
                'X'
            endif
         endif) as patnom7,
        (if r8.rdvheure = hre.h and r8.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r8.patient_id)
         else
            if dateadd(minute, 15, r8.rdvheure) = hre.h and r8.rdvdate = dte.d then
                t8.nom_traitement
            else
                'X'
            endif
         endif) as patnom8,
        (if r1.rdvheure = hre.h and r9.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r9.patient_id)
         else
            if dateadd(minute, 15, r9.rdvheure) = hre.h and r9.rdvdate = dte.d then
                t9.nom_traitement
            else
                'X'
            endif
         endif) as patnom9,
        (if r10.rdvheure = hre.h and r10.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r10.patient_id)
         else
            if dateadd(minute, 15, r10.rdvheure) = hre.h and r10.rdvdate = dte.d then
                t10.nom_traitement
            else
                'X'
            endif
         endif) as patnom10,
		  (if r11.rdvheure = hre.h and r11.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r11.patient_id)
         else
            if dateadd(minute, 15, r11.rdvheure) = hre.h and r11.rdvdate = dte.d then
                t11.nom_traitement
            else
                'X'
            endif
         endif) as patnom11,
			(if r12.rdvheure = hre.h and r12.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r12.patient_id)
         else
            if dateadd(minute, 15, r12.rdvheure) = hre.h and r12.rdvdate = dte.d then
                t12.nom_traitement
            else
                'X'
            endif
         endif) as patnom12,
			(if r13.rdvheure = hre.h and r13.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r13.patient_id)
         else
            if dateadd(minute, 15, r13.rdvheure) = hre.h and r13.rdvdate = dte.d then
                t13.nom_traitement
            else
                'X'
            endif
         endif) as patnom13,
			(if r14.rdvheure = hre.h and r14.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r14.patient_id)
         else
            if dateadd(minute, 15, r14.rdvheure) = hre.h and r14.rdvdate = dte.d then
                t14.nom_traitement
            else
                'X'
            endif
         endif) as patnom14,
			(if r15.rdvheure = hre.h and r15.rdvdate = dte.d then
            (select patient_nom || ', ' || patient_prenom from patient where patient_id = r15.patient_id)
         else
            if dateadd(minute, 15, r15.rdvheure) = hre.h and r15.rdvdate = dte.d then
                t15.nom_traitement
            else
                'X'
            endif
         endif) as patnom15,
        1,
        c1.color,
        c2.color,
        c3.color,
        c4.color,
        c5.color,
        c6.color,
        c7.color,
        c8.color,
        c9.color,
        c10.color,
		  c11.color,
        c12.color,
        c13.color,
        c14.color,
        c15.color,
        t1.type_traitement_id,
        t2.type_traitement_id,
        t3.type_traitement_id,
        t4.type_traitement_id,
        t5.type_traitement_id,
        t6.type_traitement_id,
        t7.type_traitement_id,
        t8.type_traitement_id,
        t9.type_traitement_id,
        t10.type_traitement_id,
		  t11.type_traitement_id,
		  t12.type_traitement_id,
		  t13.type_traitement_id,
		  t14.type_traitement_id,
		  t15.type_traitement_id,
        (if r1.rdvheure = hre.h and r1.rdvdate = dte.d then r1.duree else 0 endif) as duree1,
        (if r2.rdvheure = hre.h and r2.rdvdate = dte.d then r2.duree else 0 endif) as duree2,
        (if r3.rdvheure = hre.h and r3.rdvdate = dte.d then r3.duree else 0 endif) as duree3,
        (if r4.rdvheure = hre.h and r4.rdvdate = dte.d then r4.duree else 0 endif) as duree4,
        (if r5.rdvheure = hre.h and r5.rdvdate = dte.d then r5.duree else 0 endif) as duree5,
        (if r6.rdvheure = hre.h and r6.rdvdate = dte.d then r6.duree else 0 endif) as duree6,
        (if r7.rdvheure = hre.h and r7.rdvdate = dte.d then r7.duree else 0 endif) as duree7,
        (if r8.rdvheure = hre.h and r8.rdvdate = dte.d then r8.duree else 0 endif) as duree8,
        (if r9.rdvheure = hre.h and r9.rdvdate = dte.d then r9.duree else 0 endif) as duree9,
        (if r10.rdvheure = hre.h and r10.rdvdate = dte.d then r10.duree else 0 endif) as duree10,
		  (if r11.rdvheure = hre.h and r11.rdvdate = dte.d then r11.duree else 0 endif) as duree11,
		  (if r12.rdvheure = hre.h and r12.rdvdate = dte.d then r12.duree else 0 endif) as duree12,
		  (if r13.rdvheure = hre.h and r13.rdvdate = dte.d then r13.duree else 0 endif) as duree13,
		  (if r14.rdvheure = hre.h and r14.rdvdate = dte.d then r14.duree else 0 endif) as duree14,
		  (if r15.rdvheure = hre.h and r15.rdvdate = dte.d then r15.duree else 0 endif) as duree15,
        (if duree1 > 0 then r1.memo else null endif) as memo1,
        (if duree2 > 0 then r2.memo else null endif) as memo2,
        (if duree3 > 0 then r3.memo else null endif) as memo3,
        (if duree4 > 0 then r4.memo else null endif) as memo4,
        (if duree5 > 0 then r5.memo else null endif) as memo5,
        (if duree6 > 0 then r6.memo else null endif) as memo6,
        (if duree7 > 0 then r7.memo else null endif) as memo7,
        (if duree8 > 0 then r8.memo else null endif) as memo8,
        (if duree9 > 0 then r9.memo else null endif) as memo9,
        (if duree10 > 0 then r10.memo else null endif) as memo10,
		  (if duree11 > 0 then r11.memo else null endif) as memo11,
		  (if duree12 > 0 then r12.memo else null endif) as memo12,
		  (if duree13 > 0 then r13.memo else null endif) as memo13,
		  (if duree14 > 0 then r14.memo else null endif) as memo14,
		  (if duree15 > 0 then r15.memo else null endif) as memo15
FROM    ((select cast('00:00' as time) as h
            union select '00:15'
            union select '00:30'
            union select '00:45'
            union select '01:00'
            union select '01:15'
            union select '01:30'
            union select '01:45'
            union select '02:00'
            union select '02:15'
            union select '02:30'
            union select '02:45'
            union select '03:00'
            union select '03:15'
            union select '03:30'
            union select '03:45'
            union select '04:00'
            union select '04:15'
            union select '04:30'
            union select '04:45'
            union select '05:00'
            union select '05:15'
            union select '05:30'
            union select '05:45'
            union select '06:00'
            union select '06:15'
            union select '06:30'
            union select '06:45'
            union select '07:00'
            union select '07:15'
            union select '07:30'
            union select '07:45'
            union select '08:00'
            union select '08:15'
            union select '08:30'
            union select '08:45'
            union select '09:00'
            union select '09:15'
            union select '09:30'
            union select '09:45'
            union select '10:00'
            union select '10:15'
            union select '10:30'
            union select '10:45'
            union select '11:00'
            union select '11:15'
            union select '11:30'
            union select '11:45'
            union select '12:00'
            union select '12:15'
            union select '12:30'
            union select '12:45'
            union select '13:00'
            union select '13:15'
            union select '13:30'
            union select '13:45'
            union select '14:00'
            union select '14:15'
            union select '14:30'
            union select '14:45'
            union select '15:00'
            union select '15:15'
            union select '15:30'
            union select '15:45'
            union select '16:00'
            union select '16:15'
            union select '16:30'
            union select '16:45'
            union select '17:00'
            union select '17:15'
            union select '17:30'
            union select '17:45'
            union select '18:00'
            union select '18:15'
            union select '18:30'
            union select '18:45'
            union select '19:00'
            union select '19:15'
            union select '19:30'
            union select '19:45'
            union select '20:00'
            union select '20:15'
            union select '20:30'
            union select '20:45'
            union select '21:00'
            union select '21:15'
            union select '21:30'
            union select '21:45'
            union select '22:00'
            union select '22:15'
            union select '22:30'
            union select '22:45'
            union select '23:00'
            union select '23:15'
            union select '23:30'
            union select '23:45') as hre,
        (select distinct rdvdate as d from t_rdv) as dte) LEFT OUTER JOIN t_rdv as r1 ON r1.rdvdate = dte.d and 
                                                                                    hre.h between r1.rdvheure and dateadd(minute,r1.duree * 15 - 1,r1.rdvheure) and
                                                                                    r1.colonne = 1
                                                          LEFT OUTER JOIN type_de_traitement as t1 ON t1.type_traitement_id = r1.typetraitid
                                                          LEFT OUTER JOIN t_color as c1 ON c1.color_id = t1.color_id
                                                          LEFT OUTER JOIN t_rdv as r2 ON r2.rdvdate = dte.d and 
                                                                                    hre.h between r2.rdvheure and dateadd(minute,r2.duree * 15 - 1,r2.rdvheure) and
                                                                                    r2.colonne = 2
                                                          LEFT OUTER JOIN type_de_traitement as t2 ON t2.type_traitement_id = r2.typetraitid
                                                          LEFT OUTER JOIN t_color as c2 ON c2.color_id = t2.color_id
                                                          LEFT OUTER JOIN t_rdv as r3 ON r3.rdvdate = dte.d and 
                                                                                    hre.h between r3.rdvheure and dateadd(minute,r3.duree * 15 - 1,r3.rdvheure) and
                                                                                    r3.colonne = 3
                                                          LEFT OUTER JOIN type_de_traitement as t3 ON t3.type_traitement_id = r3.typetraitid
                                                          LEFT OUTER JOIN t_color as c3 ON c3.color_id = t3.color_id
                                                          LEFT OUTER JOIN t_rdv as r4 ON r4.rdvdate = dte.d and 
                                                                                    hre.h between r4.rdvheure and dateadd(minute,r4.duree * 15 - 1,r4.rdvheure) and
                                                                                    r4.colonne = 4
                                                          LEFT OUTER JOIN type_de_traitement as t4 ON t4.type_traitement_id = r4.typetraitid
                                                          LEFT OUTER JOIN t_color as c4 ON c4.color_id = t4.color_id
                                                          LEFT OUTER JOIN t_rdv as r5 ON r5.rdvdate = dte.d and 
                                                                                    hre.h between r5.rdvheure and dateadd(minute,r5.duree * 15 - 1,r5.rdvheure) and
                                                                                    r5.colonne = 5
                                                          LEFT OUTER JOIN type_de_traitement as t5 ON t5.type_traitement_id = r5.typetraitid
                                                          LEFT OUTER JOIN t_color as c5 ON c5.color_id = t5.color_id
                                                          LEFT OUTER JOIN t_rdv as r6 ON r6.rdvdate = dte.d and 
                                                                                    hre.h between r6.rdvheure and dateadd(minute,r6.duree * 15 - 1,r6.rdvheure) and
                                                                                    r6.colonne = 6
                                                          LEFT OUTER JOIN type_de_traitement as t6 ON t6.type_traitement_id = r6.typetraitid
                                                          LEFT OUTER JOIN t_color as c6 ON c6.color_id = t6.color_id
                                                          LEFT OUTER JOIN t_rdv as r7 ON r7.rdvdate = dte.d and 
                                                                                    hre.h between r7.rdvheure and dateadd(minute,r7.duree * 15 - 1,r7.rdvheure) and
                                                                                    r7.colonne = 7
                                                          LEFT OUTER JOIN type_de_traitement as t7 ON t7.type_traitement_id = r7.typetraitid
                                                          LEFT OUTER JOIN t_color as c7 ON c7.color_id = t7.color_id
                                                          LEFT OUTER JOIN t_rdv as r8 ON r8.rdvdate = dte.d and 
                                                                                    hre.h between r8.rdvheure and dateadd(minute,r8.duree * 15 - 1,r8.rdvheure) and
                                                                                    r8.colonne = 8
                                                          LEFT OUTER JOIN type_de_traitement as t8 ON t8.type_traitement_id = r8.typetraitid
                                                          LEFT OUTER JOIN t_color as c8 ON c8.color_id = t8.color_id
                                                          LEFT OUTER JOIN t_rdv as r9 ON r9.rdvdate = dte.d and 
                                                                                    hre.h between r9.rdvheure and dateadd(minute,r9.duree * 15 - 1,r9.rdvheure) and
                                                                                    r9.colonne = 9
                                                          LEFT OUTER JOIN type_de_traitement as t9 ON t9.type_traitement_id = r9.typetraitid
                                                          LEFT OUTER JOIN t_color as c9 ON c9.color_id = t9.color_id
                                                          LEFT OUTER JOIN t_rdv as r10 ON r10.rdvdate = dte.d and 
                                                                                    hre.h between r10.rdvheure and dateadd(minute,r10.duree * 15 - 1,r10.rdvheure) and
                                                                                    r10.colonne = 10
                                                          LEFT OUTER JOIN type_de_traitement as t10 ON t10.type_traitement_id = r10.typetraitid
                                                          LEFT OUTER JOIN t_color as c10 ON c10.color_id = t10.color_id
																			 
																			 LEFT OUTER JOIN t_rdv as r11 ON r11.rdvdate = dte.d and 
                                                                                    hre.h between r11.rdvheure and dateadd(minute,r11.duree * 15 - 1,r11.rdvheure) and
                                                                                    r11.colonne = 11
                                                          LEFT OUTER JOIN type_de_traitement as t11 ON t11.type_traitement_id = r11.typetraitid
                                                          LEFT OUTER JOIN t_color as c11 ON c11.color_id = t11.color_id
																			 LEFT OUTER JOIN t_rdv as r12 ON r12.rdvdate = dte.d and 
                                                                                    hre.h between r12.rdvheure and dateadd(minute,r12.duree * 15 - 1,r12.rdvheure) and
                                                                                    r12.colonne = 12
                                                          LEFT OUTER JOIN type_de_traitement as t12 ON t12.type_traitement_id = r12.typetraitid
                                                          LEFT OUTER JOIN t_color as c12 ON c12.color_id = t12.color_id
																			 LEFT OUTER JOIN t_rdv as r13 ON r13.rdvdate = dte.d and 
                                                                                    hre.h between r13.rdvheure and dateadd(minute,r13.duree * 15 - 1,r13.rdvheure) and
                                                                                    r13.colonne = 13
                                                          LEFT OUTER JOIN type_de_traitement as t13 ON t13.type_traitement_id = r13.typetraitid
                                                          LEFT OUTER JOIN t_color as c13 ON c13.color_id = t13.color_id
																			 LEFT OUTER JOIN t_rdv as r14 ON r14.rdvdate = dte.d and 
                                                                                    hre.h between r14.rdvheure and dateadd(minute,r14.duree * 15 - 1,r14.rdvheure) and
                                                                                    r14.colonne = 14
                                                          LEFT OUTER JOIN type_de_traitement as t14 ON t14.type_traitement_id = r14.typetraitid
                                                          LEFT OUTER JOIN t_color as c14 ON c14.color_id = t14.color_id
																			 LEFT OUTER JOIN t_rdv as r15 ON r15.rdvdate = dte.d and 
                                                                                    hre.h between r15.rdvheure and dateadd(minute,r15.duree * 15 - 1,r15.rdvheure) and
                                                                                    r15.colonne = 15
                                                          LEFT OUTER JOIN type_de_traitement as t15 ON t15.type_traitement_id = r15.typetraitid
                                                          LEFT OUTER JOIN t_color as c15 ON c15.color_id = t15.color_id
																			 
where patid1 is not null or
      patid2 is not null or
      patid3 is not null or
      patid4 is not null or
      patid5 is not null or
      patid6 is not null or
      patid7 is not null or
      patid8 is not null or
      patid9 is not null or
      patid10 is not null or
		patid11 is not null or
		patid12 is not null or
		patid13 is not null or
		patid14 is not null or
		patid15 is not null 
                                                order by dte.d, hre.h);
end event

type cb_29 from commandbutton within tabpage_sys
integer x = 3159
integer y = 804
integer width = 517
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actes facturables"
end type

event clicked;long ll_orthoscr, ll_orthodest

ll_orthoscr = ddlb_orthoscr.of_getSelectedData()
ll_orthodest = ddlb_orthodest.of_getSelectedData()

insert into t_status(code,description,affect,jan,fev,mars,avr,mai,juin,juil,aout,sept,oct,nov,prixsugg,ordrepaie,ortho_id)
(select code,description,affect,jan,fev,mars,avr,mai,juin,juil,aout,sept,oct,nov,prixsugg,ordrepaie,:ll_orthodest
 from t_status where ortho_id = :ll_orthoscr);
 
if error_type(-1) = 1 then
	commit using SQLCA;
else 
	rollback using SQLCA;
end if
end event

type cb_28 from commandbutton within tabpage_sys
integer x = 2962
integer y = 1576
integer width = 613
integer height = 112
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Passer carte en RTF"
end type

event clicked;string ls_cartenote, ls_richtext
long ll_couleur, ll_idtrait

DECLARE listcartetrait CURSOR FOR
	select cartenote, couleur_texte, id_cartetrait from t_cartetrait where trim(isnull(cartenote, '')) <> '';
	
OPEN listcartetrait;

FETCH listcartetrait INTO :ls_cartenote, :ll_couleur, :ll_idtrait;

DO WHILE SQLCA.SQLCode = 0
	
	tab_options.tabpage_sys.rte_conv.SelectTextAll()
	tab_options.tabpage_sys.rte_conv.replaceText(ls_cartenote)
	if isnull(ll_couleur) then ll_couleur = 0
	tab_options.tabpage_sys.rte_conv.SelectTextAll()
	tab_options.tabpage_sys.rte_conv.SetTextColor(ll_couleur)
	ls_richtext = tab_options.tabpage_sys.rte_conv.CopyRTF(false)
	
	update t_cartetrait set cartenote = :ls_richtext where id_cartetrait = :ll_idtrait;
	error_type(-1)
	
	FETCH listcartetrait INTO :ls_cartenote, :ll_couleur, :ll_idtrait;
	
LOOP

CLOSE listcartetrait;
commit using SQLCA;
end event

type rte_conv from richtextedit within tabpage_sys
integer x = 2542
integer y = 1572
integer width = 402
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type cb_upload from commandbutton within tabpage_sys
integer x = 1719
integer y = 1288
integer width = 1243
integer height = 112
integer taborder = 140
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Téléverser une version d~'Orthotek"
end type

event clicked;//Mettre la version sur le web

n_tr 		lnv_transweb
string	ls_fichier, ls_version, ls_repertoire
datetime	ldt_today
blob		lblob_contenu
integer 	li_retour
long		ll_len

lnv_transweb = create n_tr

SQLCA.of_copyto(lnv_transweb)

// Profile progitek_web
lnv_transweb.DBMS = "OLE DB"
lnv_transweb.LogPass = "10progitek01"
lnv_transweb.LogId = "progitek"
lnv_transweb.AutoCommit = False
lnv_transweb.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='www.atmtech.biz',PROVIDERSTRING='database=progitek;'"

if lnv_transweb.of_connect() <> 0 then
	return -2
end if

ldt_today = datetime(today(),now())

li_retour = GetFileOpenName ( "Sélectionner le fichier", ls_repertoire, ls_fichier , "exe","orthotekmaj*.exe", "C:\public\orthotekmaj" )

IF li_retour <> 1 THEN RETURN

SetPointer(HourGlass!)

//Décomposer pour détecter le numéro de version
ls_version = MID(ls_fichier,13)
ls_version = LEFT(ls_version, LEN(ls_version) - 4)

IF gnv_app.inv_filesrv.of_fileread( ls_repertoire, lblob_contenu) = - 1 THEN
	Messagebox("Attention", "Le fichier est invalide.")
	RETURN
END IF

ll_len = LEN(lblob_contenu)

//S'il y a eu une autre version du même numéro, on drop la ligne
DELETE FROM t_progitek_automatisme
WHERE type_fichier = 'orthotekmaj' AND version = :ls_version AND nom_fichier = :ls_fichier
USING lnv_transweb;
IF lnv_transweb.SqlCode <> 0 THEN
	Messagebox("Attention", "Il y a eu une erreur au delete.")
	RETURN
END IF
COMMIT USING lnv_transweb;

INSERT INTO t_progitek_automatisme (date_fichier,type_fichier, version, nom_fichier, grosseur_fichier)
VALUES (:ldt_today, 'orthotekmaj', :ls_version, :ls_fichier, :ll_len)
USING lnv_transweb;

IF lnv_transweb.SqlCode <> 0 THEN
	Messagebox("Attention", "Il y a eu une erreur au insert.")
	RETURN
END IF
COMMIT USING lnv_transweb;

SetPointer(HourGlass!)

UPDATEBLOB t_progitek_automatisme 
SET contenu_blob = :lblob_contenu 
WHERE date_fichier = :ldt_today AND type_fichier = 'orthotekmaj'
USING lnv_transweb;
IF lnv_transweb.SqlCode <> 0 THEN
	Messagebox("Attention", "Il y a eu une erreur au updateblob.")
	RETURN
END IF

COMMIT USING lnv_transweb;

destroy lnv_transweb

Messagebox("Terminé", "Terminé")
end event

type cb_27 from commandbutton within tabpage_sys
integer x = 3159
integer y = 692
integer width = 402
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fournisseurs"
end type

event clicked;long ll_orthoscr, ll_orthodest, ll_fourn, ll_nouvfourn
string ls_compagnie, ls_ville, ls_province, ls_zip, ls_tel, ls_adresse, ls_contact1, ls_contact2
string ls_note1, ls_tel2, ls_fax, ls_telautre, ls_telpos, ls_tel2pos, ls_faxpos, ls_autpos
string ls_courriel, ls_compte, ls_siteweb

ll_orthoscr = ddlb_orthoscr.of_getSelectedData()
ll_orthodest = ddlb_orthodest.of_getSelectedData()

if ll_orthoscr <= 0 or ll_orthodest <= 0 then return 0

declare curFourn cursor for
Select id_fournisseur,
		 compagnie,
		 adresse,
		 ville,
		 province,
		 zip,
		 tel,
		 contact1,
		 contact2,
		 note1,
		 tel2,
		 fax,
		 telautre,
		 telpos,
		 tel2pos,
		 faxpos,
		 autpos,
		 courriel,
		 compte,
		 siteweb
  from t_fournisseurs
 where ortho_id = :ll_orthoscr;

open curFourn;

fetch curFourn into :ll_fourn,
						  :ls_compagnie,
						  :ls_adresse,
						  :ls_ville,
						  :ls_province,
						  :ls_zip,
						  :ls_tel,
						  :ls_contact1,
						  :ls_contact2,
						  :ls_note1,
						  :ls_tel2,
						  :ls_fax,
						  :ls_telautre,
						  :ls_telpos,
						  :ls_tel2pos,
						  :ls_faxpos,
						  :ls_autpos,
						  :ls_courriel,
						  :ls_compte,
						  :ls_siteweb;

do while SQLCA.SQLCode = 0
	insert into t_fournisseurs (ortho_id, compagnie, adresse, ville, province, zip, tel,
										 contact1, contact2, note1, tel2, fax, telautre, telpos, tel2pos,
										 faxpos, autpos, courriel, compte, siteweb)
							  values (:ll_orthodest, :ls_compagnie, :ls_adresse, :ls_ville, :ls_province, :ls_zip, :ls_tel,
										 :ls_contact1, :ls_contact2, :ls_note1, :ls_tel2, :ls_fax, :ls_telautre, :ls_telpos, :ls_tel2pos,
										 :ls_faxpos, :ls_autpos, :ls_courriel, :ls_compte, :ls_siteweb);
	
	error_type(-1)
	
	select max(id_fournisseur) into :ll_nouvfourn from t_fournisseurs;
	
	insert into t_fourncontact (nom, tel, ext, dept, id_fournisseur)
	(Select nom, tel, ext, dept, :ll_nouvfourn
	 from t_fourncontact where id_fournisseur = :ll_fourn);
	error_type(-1)
	
	fetch curFourn into :ll_fourn,
							  :ls_compagnie,
							  :ls_adresse,
							  :ls_ville,
							  :ls_province,
							  :ls_zip,
							  :ls_tel,
							  :ls_contact1,
							  :ls_contact2,
							  :ls_note1,
							  :ls_tel2,
							  :ls_fax,
							  :ls_telautre,
							  :ls_telpos,
							  :ls_tel2pos,
							  :ls_faxpos,
							  :ls_autpos,
							  :ls_courriel,
							  :ls_compte,
							  :ls_siteweb;
loop

close curFourn;

end event

type st_3 from statictext within tabpage_sys
integer x = 1742
integer y = 736
integer width = 82
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "à"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_sys
integer x = 1742
integer y = 608
integer width = 82
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "de"
boolean focusrectangle = false
end type

type rb_user from radiobutton within tabpage_sys
integer x = 2153
integer y = 1052
integer width = 274
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "User"
end type

type rb_mac from radiobutton within tabpage_sys
integer x = 1760
integer y = 1052
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Machine"
end type

type cb_26 from commandbutton within tabpage_sys
integer x = 1760
integer y = 1140
integer width = 594
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter au registre"
end type

event clicked;string ls_pathword, ls_reg

select wordpath into :ls_pathword from t_options where ortho_id = :v_no_ortho;

if rb_mac.checked then
	ls_reg = "HKEY_LOCAL_MACHINE"
else
	ls_reg = "HKEY_CURRENT_USER"
end if

RegistrySet(ls_reg + "\Software\Progitek", "Produit", RegString!, "Orthotek")
RegistrySet(ls_reg + "\Software\Progitek\Orthotek\corr", "cheminTPL", RegString!, "c:\ii4net\orthotek")
RegistrySet(ls_reg + "\Software\Progitek\Orthotek\corr", "cheminWord", RegString!, ls_pathword )
RegistrySet(ls_reg + "\Software\Progitek\Orthotek\corr", "chfusion", RegString!, "c:\ii4net\orthotek\pat.xls")
RegistrySet(ls_reg + "\Software\Progitek\Orthotek\corr", "imgmdl", RegString!, "c:\ii4net\word")
RegistrySet(ls_reg + "\Software\Progitek\Orthotek\corr", "pathimg", RegString!, "c:\ii4net\orthotek\img.xml")
RegistrySet(ls_reg + "\Software\Progitek\Orthotek\corr", "fichtexte", RegString!, "c:\ii4net\orthotek\img.html")

end event

type ddlb_orthodest from u_ddlb within tabpage_sys
integer x = 1824
integer y = 728
integer width = 1001
integer height = 472
integer taborder = 11
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;string ls_nom
long ll_orthoid

DECLARE listortho CURSOR FOR
	SELECT dr_nom_complet, ortho_id from ortho_id;

OPEN listortho;

FETCH listortho INTO :ls_nom, :ll_orthoid;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_nom,ll_orthoid)
	FETCH listortho INTO :ls_nom, :ll_orthoid;
	
LOOP

CLOSE listortho;
end event

type cb_25 from commandbutton within tabpage_sys
integer x = 2830
integer y = 804
integer width = 329
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Étiquettes"
end type

event clicked;long ll_orthoscr, ll_orthodest

ll_orthoscr = ddlb_orthoscr.of_getSelectedData()
ll_orthodest = ddlb_orthodest.of_getSelectedData()

insert into t_etiqchoix(etiqnom,choix,ortho_id,line1,line2,line3,line4,line5,line6,line7,line8,line9,line10,line11,line12,line13,line14,
			line15,line16,line17,line18,line19,line20,refdw1,refdw2,refdw3,refdw4,refdw5,bold1, bold2,bold3,bold4,bold5,bold6,bold7,
			bold8,bold9,bold10,bold11,bold12,bold13,bold14,bold15,bold16,bold17,bold18,bold19,bold20,italic1,italic2,italic3,italic4,
			italic5,italic6,italic7,italic8,italic9,italic10,italic11,italic12,italic13,italic14,italic15,italic16,italic17,italic18,
			italic19,italic20,underline1,underline2,underline3,underline4,underline5,underline6,underline7,underline8,underline9,
			underline10,underline11,underline12,underline13,underline14,underline15,underline16,underline17,underline18,underline19,
			underline20,align1,align2,align3,align4,align5,align6,align7,align8,align9,align10,align11,align12,align13,align14,align15,
			align16,align17,align18,align19,align20)
(Select  etiqnom,choix,:ll_orthodest,line1,line2,line3,line4,line5,line6,line7,line8,line9,line10,line11,line12,line13,line14,
			line15,line16,line17,line18,line19,line20,refdw1,refdw2,refdw3,refdw4,refdw5,bold1, bold2,bold3,bold4,bold5,bold6,bold7,
			bold8,bold9,bold10,bold11,bold12,bold13,bold14,bold15,bold16,bold17,bold18,bold19,bold20,italic1,italic2,italic3,italic4,
			italic5,italic6,italic7,italic8,italic9,italic10,italic11,italic12,italic13,italic14,italic15,italic16,italic17,italic18,
			italic19,italic20,underline1,underline2,underline3,underline4,underline5,underline6,underline7,underline8,underline9,
			underline10,underline11,underline12,underline13,underline14,underline15,underline16,underline17,underline18,underline19,
			underline20,align1,align2,align3,align4,align5,align6,align7,align8,align9,align10,align11,align12,align13,align14,align15,
			align16,align17,align18,align19,align20 from t_etiqchoix where ortho_id = :ll_orthoscr and refdw1 is null);
 
if error_type(-1) = 1 then
	commit using SQLCA;
else 
	rollback using SQLCA;
end if


end event

type cb_24 from commandbutton within tabpage_sys
integer x = 2830
integer y = 692
integer width = 329
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Référents"
end type

event clicked;long ll_orthoscr, ll_orthodest

ll_orthoscr = ddlb_orthoscr.of_getSelectedData()
ll_orthodest = ddlb_orthodest.of_getSelectedData()

insert into t_referents(ref_nom,ref_prenom,ref_nom_complet,ref_adresse,ref_email,ref_langue,ref_note,ref_province,ref_sexe,ref_suffix,ref_tel_bur,
		  ref_tel_fax,ref_ville,ref_zip,ortho_id,id_sal,actif,inclist)
(Select ref_nom,ref_prenom,ref_nom_complet,ref_adresse,ref_email,ref_langue,ref_note,ref_province,ref_sexe,ref_suffix,ref_tel_bur,
		  ref_tel_fax,ref_ville,ref_zip,:ll_orthodest,id_sal,actif,inclist from t_referents where ortho_id = :ll_orthoscr);
 
if error_type(-1) = 1 then
	commit using SQLCA;
else 
	rollback using SQLCA;
end if





end event

type cb_23 from commandbutton within tabpage_sys
integer x = 2830
integer y = 580
integer width = 329
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Dentistes"
end type

event clicked;long ll_orthoscr, ll_orthodest

ll_orthoscr = ddlb_orthoscr.of_getSelectedData()
ll_orthodest = ddlb_orthodest.of_getSelectedData()

insert into t_dentists (det_nom,det_prenom,det_add,det_ville,det_prov,det_zip,det_telbur,det_fax,det_langue,det_email,det_note,ortho_id,det_sex,det_suf,
		 id_conttype1,id_conttype2,id_conttype3,id_conttype4,id_conttype5,id_conttype6, id_speciality, id_sal,detcheck1,detnote1,id_intro,id_concl,
		 actif,inclist)
(Select det_nom,det_prenom,det_add,det_ville,det_prov,det_zip,det_telbur,det_fax,det_langue,det_email,det_note,:ll_orthodest,det_sex,det_suf,
		 id_conttype1,id_conttype2,id_conttype3,id_conttype4,id_conttype5,id_conttype6, id_speciality, id_sal,detcheck1,detnote1,id_intro,id_concl,
		 actif,inclist 
 from t_dentists as d where ortho_id = :ll_orthoscr);
 
if error_type(-1) = 1 then
	commit using SQLCA;
else 
	rollback using SQLCA;
end if
end event

type cb_22 from commandbutton within tabpage_sys
integer x = 873
integer y = 1412
integer width = 809
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Accès imagerie"
end type

event clicked;UPDATE t_options SET acces_img = 'o';

commit using SQLCA;
end event

type cb_21 from commandbutton within tabpage_sys
integer x = 873
integer y = 1288
integer width = 809
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Compiler le PBR"
end type

event clicked;n_cst_dirattrib   lnv_dirlist[]
long ll_acc
n_cst_filesrvwin32 lnv_file
lnv_file = CREATE n_cst_filesrvwin32
integer li_FileNum
long ll_rtn

If FileExists("C:\ii4net\orthotek\orthotek.PBR") THEN FileDelete("C:\ii4net\orthotek\orthotek.PBR")

lnv_file.of_DirList("C:\ii4net\orthotek\images\*.*", 0, lnv_dirlist)
IF upperbound(lnv_dirlist) > 0 THEN
	for ll_acc=1 to upperbound(lnv_dirlist)
		li_FileNum = FileOpen("C:\ii4net\orthotek\orthotek.pbr", LineMode!, Write!, LockWrite!, Append!)
		ll_rtn = FileWrite(li_FileNum, "C:\ii4net\orthotek\images\" + lnv_dirlist[ll_acc].is_FileName)
		FileClose(li_FileNum)
	next
END IF 

lnv_file.of_DirList("C:\ii4net\imgpro\*.*", 0, lnv_dirlist)
IF upperbound(lnv_dirlist) > 0 THEN
	for ll_acc=1 to upperbound(lnv_dirlist)
		li_FileNum = FileOpen("C:\ii4net\orthotek\orthotek.pbr", LineMode!, Write!, LockWrite!, Append!)
		ll_rtn = FileWrite(li_FileNum, "C:\ii4net\imgpro\" + lnv_dirlist[ll_acc].is_FileName)
		FileClose(li_FileNum)
	next
END IF 

Messagebox("Terminé","Construction du fichier orthotek.PBR complété")
end event

type cb_20 from commandbutton within tabpage_sys
integer x = 873
integer y = 1536
integer width = 809
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mettre satellite"
end type

event clicked;update factures_traitements set id_satellite = (select id_satellite from patient INNER JOIN traitements ON patient.patient_id = traitements.patient_id where factures_traitements.traitement_id = traitements.traitement_id) where id_satellite is null;
error_type(-1)
update paiement set id_satellite = (select id_satellite from patient INNER JOIN traitements ON patient.patient_id = traitements.patient_id where paiement.traitement_patient_id = traitements.traitement_id) where id_satellite is null;
error_type(-1)
update cheques_postdates set id_satellite = (select id_satellite from patient INNER JOIN traitements ON patient.patient_id = traitements.patient_id where cheques_postdates.traitement_patient_id = traitements.traitement_id) where id_satellite is null;
error_type(-1)
end event

type cb_19 from commandbutton within tabpage_sys
integer x = 3159
integer y = 580
integer width = 402
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sujet, cat, det"
end type

event clicked;long ll_ortho1, ll_ortho2, ll_oldidsujet, ll_oldidcatplan, ll_ordre1, ll_newidsujet
long ll_ordre2, ll_newidcatplan, ll_ordre3
string ls_sujet, ls_filename, ls_cat, ls_corps, ls_desc, ls_descan, ls_descruserfr
string ls_descruseran

ll_ortho1 = ddlb_orthoscr.of_getSelectedData()
ll_ortho2 = ddlb_orthodest.of_getSelectedData()


DECLARE listsujet CURSOR FOR
	select	id_sujet,
				sujet,
				filename,
				ordre
	from		t_sujets
	where		ortho_id = :ll_ortho1;
	
OPEN listsujet;

FETCH listsujet INTO :ll_oldidsujet,
							:ls_sujet,
							:ls_filename,
							:ll_ordre1;

DO WHILE SQLCA.SQLCode = 0
	
	insert into t_sujets(sujet,filename,ordre, ortho_id)
	values(:ls_sujet,:ls_filename,:ll_ordre1,:ll_ortho2);
	error_type(-1)
	
	select max(id_sujet) into :ll_newidsujet from t_sujets;
	
	DECLARE listcatplan CURSOR FOR
		select	id_catplan,
					categorie,
					ordre,
					corps
		from		t_catplans
		where		id_sujet = :ll_oldidsujet;
		
	OPEN listcatplan;
	
	FETCH listcatplan INTO 	:ll_oldidcatplan,
									:ls_cat,
									:ll_ordre2,
									:ls_corps;
	
	DO WHILE SQLCA.SQLCode = 0
		
		insert into t_catplans(categorie,ortho_id,id_sujet,ordre,corps)
		values(:ls_cat,:ll_ortho2,:ll_newidsujet,:ll_ordre2,:ls_corps);
		error_type(-1)
		
		select max(id_catplan) into :ll_newidcatplan from t_catplans;
		
		DECLARE listplan CURSOR FOR
			select 	description,
						ordre,
						descriptionan,
						descruserfr,
						descruseran
			from t_plans where id_catplan = :ll_oldidcatplan;
			
			OPEN listplan;
			
			FETCH listplan INTO 	:ls_desc,
										:ll_ordre3,
										:ls_descan,
										:ls_descruserfr,
										:ls_descruseran;
			
			DO WHILE SQLCA.SQLCode = 0
				
				insert into t_plans(id_catplan,description,descriptionan,descruserfr,descruseran)
				values(:ll_newidcatplan,:ls_desc,:ls_descan,:ls_descruserfr,:ls_descruseran);
				error_type(-1)
				
				FETCH listplan INTO 	:ls_desc,
											:ll_ordre3,
											:ls_descan,
											:ls_descruserfr,
											:ls_descruseran;
				
			LOOP
						
			CLOSE listplan;
			
		FETCH listcatplan INTO 	:ll_oldidcatplan,
										:ls_cat,
										:ll_ordre2,
										:ls_corps;
		
	LOOP
	
	CLOSE listcatplan;
	
	FETCH listsujet INTO :ll_oldidsujet,
							:ls_sujet,
							:ls_filename,
							:ll_ordre1;
		
LOOP

CLOSE listsujet;
				
end event

type cb_18 from commandbutton within tabpage_sys
integer x = 873
integer y = 1164
integer width = 809
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter orrho_id RDV"
end type

event clicked;update t_rdv set ortho_id = (select (if min(ortho_id) = 0 then (select min(ortho_id) from ortho_id) else min(ortho_id) endif) from type_de_traitement where type_traitement_id = t_rdv.typetraitid) where ortho_id is null;
commit using SQLCA;
end event

type cb_17 from commandbutton within tabpage_sys
integer x = 1280
integer y = 1040
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modif horaire"
end type

event clicked;if isvalid(w_horaire) then
	w_horaire.cb_aug.visible = true
	w_horaire.cb_dim.visible = true
	w_horaire.pb_delete.visible = true
end if

end event

type cb_16 from commandbutton within tabpage_sys
integer x = 873
integer y = 1040
integer width = 407
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cliniview"
end type

event clicked;w_patient.sle_firstname.visible = true
w_patient.sle_lastname.visible = true
w_patient.sle_ss.visible = true
w_patient.sle_id.visible = true
w_patient.sle_dob.visible = true
end event

type cb_chrgs from commandbutton within tabpage_sys
integer x = 873
integer y = 916
integer width = 809
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Initialiser les charges"
end type

event clicked;integer li_chrg,li_horstep
long i = 1,ll_traitid,ll_tot,ll_idrdv
decimal{2} ld_chrgduree,ld_taux,ld_duree,ld_chrgarrdep,ld_chrgasslib
date ldt_rdvdate
time lt_heurearr,lt_heuredep,lt_seated,lt_released
w_progressbar iw_progressbar

open(iw_progressbar)
iw_progressbar.of_tache('Initialisation des charges....')
select count(*) into :ll_tot from t_rdv inner join patient on t_rdv.patient_id = patient.patient_id where t_rdv.duree > 0 and patient.no_ortho = :v_no_ortho;
iw_progressbar.of_max(ll_tot)

select hor_step into :li_horstep from t_options where ortho_id = :v_no_ortho;

declare cur cursor for

	select id_rdv,
			 typetraitid,
			 rdvdate,
			 duree,
			 heurearr,
			 heuredep,
			 seated,
			 released
	from	 t_rdv inner join patient on t_rdv.patient_id = patient.patient_id
	where  t_rdv.duree > 0 and
			 patient.no_ortho = :v_no_ortho;

open cur;

fetch cur into :ll_idrdv,:ll_traitid,:ldt_rdvdate,:ld_duree,:lt_heurearr,:lt_heuredep,:lt_seated,:lt_released;

do while sqlca.sqlcode = 0
	select addtocharge into :li_chrg from type_de_traitement where ortho_id = :v_no_ortho and type_traitement_id = :ll_traitid;
	if li_chrg = 1 then
		select max(chargtaux) into :ld_taux from t_charges where ortho_id = :v_no_ortho and chargdate <= :ldt_rdvdate;
		ld_chrgduree = ld_duree * li_horstep * ld_taux
		ld_chrgarrdep = (SecondsAfter(lt_heurearr,lt_heuredep) / 60) * ld_taux
		ld_chrgasslib = (SecondsAfter(lt_seated,lt_released) / 60) * ld_taux
		update t_rdv set chrgduree = :ld_chrgduree where (chrgduree is null or chrgduree = 0) and id_rdv = :ll_idrdv;
		error_type(-1)
		update t_rdv set chrgarrdep = :ld_chrgarrdep where (chrgarrdep is null or chrgarrdep = 0) and id_rdv = :ll_idrdv;
		error_type(-1)
		update t_rdv set chrgasslib = :ld_chrgasslib where (chrgasslib is null or chrgasslib = 0) and id_rdv = :ll_idrdv;
		error_type(-1)
	else
		update t_rdv set chrgduree = 0,chrgarrdep = 0,chrgasslib = 0 where id_rdv = :ll_idrdv;
		error_type(-1)
	end if
	iw_progressbar.of_position(i)
	i++
	fetch cur into :ll_idrdv,:ll_traitid,:ldt_rdvdate,:ld_duree,:lt_heurearr,:lt_heuredep,:lt_seated,:lt_released;
loop

close cur;
close(iw_progressbar)
end event

type cb_15 from commandbutton within tabpage_sys
integer x = 873
integer y = 792
integer width = 809
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enlever msg sécurité Word"
end type

event clicked;uLong ll_valeur

//office 2000
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word","UserData",ReguLong!,ll_valeur) = 1 then
	if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
		RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
	end if
end if

//office 2003
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word","UserData",ReguLong!,ll_valeur) = 1 then
	if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
		RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
	end if
end if


if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word","UserData",ReguLong!,ll_valeur) = 1 then
	if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
		RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
	end if
end if

if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word","UserData",ReguLong!,ll_valeur) = 1 then
	if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
		RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
	end if
end if
//office 2010
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word","UserData",ReguLong!,ll_valeur) = 1 then
	if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
		RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
	end if
end if

if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word","UserData",ReguLong!,ll_valeur) = 1 then
	if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
		RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
	end if
end if
end event

type cb_14 from commandbutton within tabpage_sys
integer x = 873
integer y = 668
integer width = 809
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Test nom fichier"
end type

event clicked;string ls_car = "", ls_car1 = ""
integer i, j
long ll_nb, ll_pos[], ll_vide[], ll_tmp
n_cst_dirattrib lo_dirList[]
pfc_n_cst_filesrvwin32 file

//file = create pfc_n_cst_filesrvwin32
//
//open(w_test, w_options)
//
//if DirectoryExists(is_test) then
//	//Pour chacun des fichiers dans ce dossier
//	ll_nb = file.of_dirList(is_test + "\*", 33, lo_dirList)
// i = 1
//	do while i <= ll_nb and ls_car = ""
//		//Traiter le fichier
//		if left(lo_dirList[i].is_FileName, 1) <> '[' then
//			if messagebox('Fichier', "Est-ce que " + lo_dirList[i].is_FileName + " est le fichier que vous voulez tester ?", Information!, YesNo!) = 1 then
//				for j = 1 to len(lo_dirList[i].is_FileName)
//					ls_car += string(asc(mid(lo_dirList[i].is_FileName, j, 1))) + " "
//				next
//				messagebox('Code ASCII','Code ASCII du fichier :~n' + ls_car)
//			end if
//		end if
//		i++
//	loop
//end if
//
//destroy file


file = create pfc_n_cst_filesrvwin32

open(w_test, w_options)

if DirectoryExists(is_test) then
	//Pour chacun des fichiers dans ce dossier
	ll_nb = file.of_dirList(is_test + "\*", 33, lo_dirList)
	for i = 1 to ll_nb
		//Traiter le fichier
		if left(lo_dirList[i].is_FileName, 1) <> '[' then
			ll_pos = ll_vide
			do
				if upperbound(ll_pos) = 0 then ll_tmp = 0 else ll_tmp = ll_pos[upperbound(ll_pos)] + 1
				ll_pos[upperbound(ll_pos) + 1] = pos(lo_dirList[i].is_FileName, '?', ll_tmp)
			loop while ll_pos[upperbound(ll_pos)] <> 0
			if upperbound(ll_pos) > 1 then
				ls_car = left(lo_dirList[i].is_FileName, ll_pos[1] - 1)
				ls_car1 = ls_car + '%'
				ll_pos[upperbound(ll_pos)] = len(lo_dirList[i].is_FileName) + 1
				for j = 1 to upperbound(ll_pos) - 1
					ls_car+= mid(lo_dirList[i].is_FileName, ll_pos[j] + 1, ll_pos[j + 1] - ll_pos[j] - 1)
					ls_car1+= mid(lo_dirList[i].is_FileName, ll_pos[j] + 1, ll_pos[j + 1] - ll_pos[j] - 1) + '%'
				next
				
				ls_car1 = left(ls_car1, len(ls_car1) - 1)
				file.of_filerename( is_test + '\' + ls_car1, is_test + '\' + ls_car)
			end if
		end if
	next
end if

destroy file


end event

type cb_img from commandbutton within tabpage_sys
integer x = 873
integer y = 544
integer width = 809
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Old imaging"
end type

event clicked;long ll_patid
integer li_seq
string ls_frontsmile,ls_lateral,ls_frontal,ls_leftoccl,ls_rightoccl,ls_anterior,ls_upperoccl,ls_loweroccl,ls_xray31,ls_xray32

delete from t_imagerie;

DECLARE cur CURSOR FOR

	select patient_id,
			 type,
			 front_smile,
			 "lateral",
			 frontal,
			 leftoccl,
			 rightoccl,
			 anterioroccl,
			 upperoccl,
			 loweroccl,
			 xray3_1,
			 xray3_2
	from	 t_imaging;

OPEN cur;

FETCH cur INTO :ll_patid,
					:li_seq,
					:ls_frontsmile,
					:ls_lateral,
					:ls_frontal,
					:ls_leftoccl,
					:ls_rightoccl,
					:ls_anterior,
					:ls_upperoccl,
					:ls_loweroccl,
					:ls_xray31,
					:ls_xray32;

DO WHILE SQLCA.SQLCODE = 0
	
	insert into t_imagerie(patient_id,sequence,front_smile,"lateral",frontal,leftoccl,rightoccl,anterioroccl,upperoccl,loweroccl,xray3_1,xray3_2)
	values(:ll_patid,:li_seq,:ls_frontsmile,:ls_lateral,:ls_frontal,:ls_leftoccl,:ls_rightoccl,:ls_anterior,:ls_upperoccl,:ls_loweroccl,:ls_xray31,:ls_xray32);
//	if error_type(-1) <> 1 then
//		messagebox('ll_patid,li_seq',string(ll_patid)+','+string(li_seq))
//	end if
	
	FETCH cur INTO :ll_patid,
						:li_seq,
						:ls_frontsmile,
						:ls_lateral,
						:ls_frontal,
						:ls_leftoccl,
						:ls_rightoccl,
						:ls_anterior,
						:ls_upperoccl,
						:ls_loweroccl,
						:ls_xray31,
						:ls_xray32;
LOOP

CLOSE cur;
end event

type cb_13 from commandbutton within tabpage_sys
integer x = 873
integer y = 420
integer width = 809
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set ordrepaie = 0"
end type

event clicked;update t_status set ordrepaie = 0 where ordrepaie is null;
commit using sqlca;
end event

type st_1 from statictext within tabpage_sys
integer x = 2185
integer y = 148
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Heure2:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_start from statictext within tabpage_sys
integer x = 1765
integer y = 148
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Heure1:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_end from singlelineedit within tabpage_sys
integer x = 2441
integer y = 124
integer width = 169
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "00"
borderstyle borderstyle = stylelowered!
end type

type sle_start from singlelineedit within tabpage_sys
integer x = 2025
integer y = 124
integer width = 169
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "00"
borderstyle borderstyle = stylelowered!
end type

type cb_12 from commandbutton within tabpage_sys
integer x = 1774
integer y = 312
integer width = 850
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Creation"
end type

event clicked;/////////////////////////////////////
//
// Créé par		: Éric Vézina ing.
// Date			: 20 Janvier 2005
// Description : Fonction qui ajoute des heures ds l'horaire
//
/////////////////////////////////////

integer h,m,li_step,li_heurestartam,li_heureendam
long w,ll_ortho
string ls_nom
date ldt_caldate
time lt_heure

SetNull(w)
select hor_step into :li_step from t_options where ortho_id = :v_no_ortho;
li_heurestartam = integer(sle_start.text)
li_heureendam = integer(sle_end.text)

DECLARE hor CURSOR FOR

	select no_ortho,
			 datecal
	from	 horaire
	where	 datecal >= today();

OPEN hor;

FETCH hor INTO :ll_ortho,
					:ldt_caldate;

DO WHILE SQLCA.SQLCODE = 0
	
	CHOOSE CASE li_step
			
		CASE 5
			for h = li_heurestartam to li_heureendam
				for m=0 to 55 step 5
					lt_heure=time(string(h)+":"+string(m))
					ls_nom=''
					insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10, &
					patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,colortemplate1,colortemplate2,colortemplate3, &
					colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,no_ortho)
					values (:ldt_caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:ll_ortho);
				next
			next
		CASE 10
			for h = li_heurestartam to li_heureendam
				for m=0 to 50 step 10
					lt_heure=time(string(h)+":"+string(m))
					ls_nom=''
					insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10, &
					patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,colortemplate1,colortemplate2,colortemplate3, &
					colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,no_ortho)
					values (:ldt_caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:ll_ortho);
				next
			next
		
		CASE 15
			for h = li_heurestartam to li_heureendam
				for m=0 to 45 step 15
					lt_heure=time(string(h)+":"+string(m))
					ls_nom=''
					insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10, &
					patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,colortemplate1,colortemplate2,colortemplate3, &
					colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,no_ortho)
					values (:ldt_caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:ll_ortho);
				next
			next

		CASE ELSE
			error_type(60)
			
	END CHOOSE

	FETCH hor INTO :ll_ortho,
						:ldt_caldate;
LOOP

CLOSE hor;
end event

type em_nbyear from editmask within tabpage_sys
integer x = 2958
integer y = 152
integer width = 402
integer height = 104
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " 0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "#"
string minmax = "1~~9"
end type

type cb_archive from commandbutton within tabpage_sys
integer x = 2834
integer y = 300
integer width = 658
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Archive"
end type

event clicked;long ll_patid,ll_idtrait,li_nbrow,i = 1,j = 0
integer li_nbjour
decimal{2} ld_totfact,ld_totpaie
date ldt_max
w_progressbar iw_progressbar
select count(*) into :li_nbrow from patient;
SetPointer(HourGlass!)
open(iw_progressbar)
if v_langue = 'an' then
	iw_progressbar.of_tache('Please wait. Nb. archive : 0 / '+ string(li_nbrow))
else
	iw_progressbar.of_tache('Veuillez patienter. Nb. archivé : 0 / '+ string(li_nbrow))
end if
iw_progressbar.of_max(li_nbrow)
li_nbjour = integer(em_nbyear.text) * 365

if li_nbjour > 0 then
	
	DECLARE cur CURSOR FOR

		select patient_id
		from patient
		where archivedate is null;
	
	OPEN cur;
	
	FETCH cur INTO :ll_patid;
	
	DO WHILE SQLCA.SQLCODE = 0
		iw_progressbar.of_position(i)
		select max(traitement_id) into :ll_idtrait from traitements where patient_id = :ll_patid;
		select sum(montant) into :ld_totfact from factures_traitements where traitement_id = :ll_idtrait;
		if isnull(ld_totfact) then ld_totfact = 0
		select sum(montant_recu) into :ld_totpaie from paiement where traitement_patient_id = :ll_idtrait;
		if isnull(ld_totpaie) then ld_totpaie = 0
		select max(date_paiement) into :ldt_max from paiement where traitement_patient_id = :ll_idtrait;
		if (ld_totfact - ld_totpaie) = 0 then
			if daysafter(ldt_max,today()) > li_nbjour then
				if v_langue = 'an' then
					iw_progressbar.of_tache('Please wait. Nb. archive : ' + string(j) + ' / '+ string(li_nbrow))
				else
					iw_progressbar.of_tache('Veuillez patienter. Nb. archivé : ' + string(j) + ' / '+ string(li_nbrow))
				end if
				update patient set archivedate = today() where patient_id = :ll_patid;
				j++
			end if
		end if
		i++
		FETCH cur INTO :ll_patid;
	LOOP
	
	CLOSE cur;
end if
close(iw_progressbar)
end event

type cb_11 from commandbutton within tabpage_sys
integer x = 873
integer y = 296
integer width = 809
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set t_consultations_id"
end type

event clicked;long idpat,i = 1

DECLARE cur CURSOR FOR

	select patient_id from t_consultations;

OPEN cur;

FETCH cur INTO :idpat;

DO WHILE SQLCA.SQLCODE = 0
	update t_consultations set id = :i where patient_id = :idpat;
	i++
	FETCH cur INTO :idpat;
LOOP

CLOSE cur;
end event

type cb_10 from commandbutton within tabpage_sys
integer x = 873
integer y = 172
integer width = 809
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration de l~'imagerie"
end type

event clicked;gf_migimaging()
end event

type cb_9 from commandbutton within tabpage_sys
integer x = 873
integer y = 48
integer width = 809
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set open date"
end type

event clicked;UPDATE patient 
SET opendoss =	
(SELECT min(date_facture) FROM factures_traitements WHERE traitement_id = 
(SELECT min(traitement_id) FROM traitements WHERE patient_id = patient.patient_id)) 
WHERE opendoss is null;
end event

type cb_noboite from commandbutton within tabpage_sys
integer x = 27
integer y = 1536
integer width = 809
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Initialiser le # de boîte"
end type

event clicked;//update patient set no_boite = null;
//commit using sqlca;
end event

type cb_8 from commandbutton within tabpage_sys
integer x = 27
integer y = 1412
integer width = 818
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set responsable default"
end type

event clicked;long ll_id,ll_idcontact,ll_patid,ll_patidtmp,ll_orthoid,ll_idcontactdef
string ls_nom,ls_prenom,ls_patadd,ls_patcity,ls_prov,ls_patzip,ls_telmais,ls_telbur,ls_email,ls_sex,ls_langue,ls_telcell,ls_telautre
integer li_pat

Declare patdefcontact Cursor For
 
	SELECT id_contact,patient_id
	FROM patient;
           			
OPEN patdefcontact;

Fetch patdefcontact Into :ll_idcontact,:ll_patid;

Do While SQLCA.SQLCode = 0
	// Verification du responsable financier par defo
   if not ll_idcontact > 0 or isnull(ll_idcontact) then
		// si le id_contact est null, retracer le id_contact et l'associer sinon le creer
		select id_contact into :ll_id from t_contact where patient_id = :ll_patid and pat = 1;
		if ll_id > 0 then
			update patient set id_contact = :ll_id where patient_id = :ll_patid;
		else
//			messagebox('Avertissement!','Le patient id : ' + string(ll_patid) + ' n_est pas présent ds les contacts')
			select no_ortho,patient_nom,patient_prenom,adresse,ville,province,code_postale,tel_maison,tel_bureau,email,sex,langue,telcell,telautre
			into :ll_orthoid,:ls_nom,:ls_prenom,:ls_patadd,:ls_patcity,:ls_prov,:ls_patzip,:ls_telmais,:ls_telbur,:ls_email,:ls_sex,:ls_langue,:ls_telcell,:ls_telautre
			from patient
			where patient_id = :ll_patid;
			insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,email,sex,langue,pat,telcell,telautre,resptype)
			values(:ll_orthoid,:ll_patid,:ls_nom,:ls_prenom,:ls_patadd,:ls_patcity,:ls_patzip,:ls_telmais,:ls_telbur,:ls_prov,:ls_email,:ls_sex,:ls_langue,1,:ls_telcell,:ls_telautre,'pat');
			error_type(-1)
			select max(id_contact) into :ll_idcontactdef from t_contact where patient_id = :ll_patid;
//			messagebox('ll_idcontactdef',string(ll_idcontactdef))
			update patient set id_contact = :ll_idcontactdef where patient_id = :ll_patid;
			error_type(-1)
		end if
	else
		// si le id_contact n'est pas null, verifier si il est bon sinon le creer
		select patient_id,pat into :ll_patidtmp,:li_pat from t_contact where id_contact = :ll_idcontact;
		if ll_patidtmp <> ll_patid then
//			messagebox('Avertissement!','Le patient id : ' + string(ll_patid) + ' n_est pas présent ds les contacts')
			select no_ortho,patient_nom,patient_prenom,adresse,ville,province,code_postale,tel_maison,tel_bureau,email,sex,langue,telcell,telautre
			into :ll_orthoid,:ls_nom,:ls_prenom,:ls_patadd,:ls_patcity,:ls_prov,:ls_patzip,:ls_telmais,:ls_telbur,:ls_email,:ls_sex,:ls_langue,:ls_telcell,:ls_telautre
			from patient
			where patient_id = :ll_patid;
			insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,email,sex,langue,pat,telcell,telautre,resptype)
			values(:ll_orthoid,:ll_patid,:ls_nom,:ls_prenom,:ls_patadd,:ls_patcity,:ls_patzip,:ls_telmais,:ls_telbur,:ls_prov,:ls_email,:ls_sex,:ls_langue,1,:ls_telcell,:ls_telautre,'pat');
			error_type(-1)
			select max(id_contact) into :ll_idcontactdef from t_contact where patient_id = :ll_patid;
//			messagebox('ll_idcontactdef',string(ll_idcontactdef))
			update patient set id_contact = :ll_idcontactdef where patient_id = :ll_patid;
			error_type(-1)
		elseif li_pat <> 1 or isnull(li_pat) then
//			messagebox('ASSOCIATION','Patient_id: ' + string(ll_patid))
			update t_contact set pat = 1 where id_contact = :ll_idcontact and patient_id = :ll_patid;
			error_type(-1)
		end if
		
//		if ll_patid = 3361 or ll_patid = 3403 then
//			messagebox(string(ll_patid),string(ll_idcontact))
//		end if
	end if
	Fetch patdefcontact Into :ll_idcontact,:ll_patid;
Loop

CLOSE patdefcontact;
end event

type cb_7 from commandbutton within tabpage_sys
integer x = 27
integer y = 1288
integer width = 818
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Histo lettre"
end type

event clicked;datetime ldtt_idlettre
string ls_nomdoc

SetPointer(HourGlass!)
Declare histolettre Cursor For
 
SELECT id_lettre,nomdoc
FROM t_histolettre;
           			
OPEN histolettre;

Fetch histolettre Into :ldtt_idlettre,:ls_nomdoc;

Do While SQLCA.SQLCode = 0
	ls_nomdoc = trim(ls_nomdoc) + '.ltr'
   update t_histolettre set nomdoc = :ls_nomdoc where id_lettre = :ldtt_idlettre;
	Fetch histolettre Into :ldtt_idlettre,:ls_nomdoc;
Loop

CLOSE histolettre;
this.enabled = false
end event

type cb_6 from commandbutton within tabpage_sys
integer x = 27
integer y = 1164
integer width = 818
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Orthocom CPD"
end type

event clicked;dec{2} ld_mont
string ls_date, ls_patnum, ls_jour, ls_mois, ls_annee
string ls_ptype
date ldt_date
long ll_patid, ll_idcont, ll_traitid

delete from cheques_postdates;
commit using SQLCA;

setPointer(hourglass!)

DECLARE listCPD CURSOR FOR

	SELECT amount,
	       cdate,
			 patnumr,
			 ptype
	FROM cheqonhd
	ORDER BY cdate DESC;
	
	OPEN listCPD;
	
		FETCH listCPD into :ld_mont,
		                   :ls_date,
								 :ls_patnum,
								 :ls_ptype;
								 
		DO WHILE SQLCA.SQLCode = 0
			
			ll_patid = long(ls_patnum)
			ls_jour = right(ls_date,2)
			ls_mois = mid(ls_date,5,2)
			ls_annee = left(ls_date,4)
			ldt_date = date(ls_jour + '-' + ls_mois + '-' + ls_annee)
			select id_contact into :ll_idcont from t_contact where patient_id = :ll_patid;
			select max(traitement_id) into :ll_traitid from traitements where patient_id = :ll_patid;
			if ldt_date > today() then
				if ls_ptype = 'V' then
					insert into cheques_postdates(affect,date_cheque,id_contact,indicateur,modalite,paiement,traitement_patient_id)
					values(1,:ldt_date,:ll_idcont,0,'pVisa',:ld_mont,:ll_traitid);
				else
					insert into cheques_postdates(affect,date_cheque,id_contact,indicateur,modalite,paiement,traitement_patient_id)
					values(1,:ldt_date,:ll_idcont,0,'P',:ld_mont,:ll_traitid);
				end if
			end if
			FETCH listCPD into :ld_mont,
		                   :ls_date,
								 :ls_patnum,
								 :ls_ptype;
			
		LOOP
	
	CLOSE listCPD;
end event

type cb_entente from commandbutton within tabpage_sys
integer x = 32
integer y = 1040
integer width = 809
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set Entente Fin."
end type

event clicked;long ll_idpat,ll_idcontact

Declare entente Cursor For
 
SELECT patient_id
FROM t_entente;
           			
OPEN entente;

Fetch entente Into :ll_idpat;

Do While SQLCA.SQLCode = 0
   
	select id_contact into :ll_idcontact from t_contact where patient_id = :ll_idpat;
	update t_entente set id_contact = :ll_idcontact where patient_id = :ll_idpat;
	Fetch entente Into :ll_idpat;
	
Loop

CLOSE entente;
end event

type cb_setquote from commandbutton within tabpage_sys
integer x = 32
integer y = 916
integer width = 809
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set Quote"
end type

event clicked;update patient set rvmanques = 0 where rvmanques is null;
commit using sqlca;
update patient set rvcancel = 0 where rvcancel is null;
commit using sqlca;
update patient set retards = 0 where retards is null;
commit using sqlca;
update patient set caba = 0 where caba is null;
commit using sqlca;
end event

type cb_monthly from commandbutton within tabpage_sys
integer x = 439
integer y = 796
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Monthly"
end type

event clicked;long ll_count

select count(*) into :ll_count from t_status where status_id = 1;
if ll_count = 1 then
	update t_status set code = 'Monthly charge',description = 'Monthly charge' where status_id = 1;
	commit using sqlca;
else
	insert into t_status(status_id,code,description,affect,prixsugg) values(1,'Monthly charge','Monthly charge',1,0);
	commit using sqlca;
end if
error_type(-1)
end event

type cb_mens from commandbutton within tabpage_sys
integer x = 32
integer y = 792
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mens"
end type

event clicked;long ll_count

select count(*) into :ll_count from t_status where status_id = 1;
if ll_count = 1 then
	update t_status set code = 'mens',description = 'mens' where status_id = 1;
	commit using sqlca;
else
	insert into t_status(status_id,code,description,affect,prixsugg) values(1,'mens','mens',1,0);
	commit using sqlca;
end if
error_type(-1)
end event

type cb_5 from commandbutton within tabpage_sys
integer x = 32
integer y = 296
integer width = 809
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Set the last autoupdate"
end type

event clicked;integer li_ver

select ver into :li_ver from t_ver;
li_ver =li_ver + 1
update t_ver set ver = :li_ver;
commit using sqlca;
end event

type cb_4 from commandbutton within tabpage_sys
integer x = 32
integer y = 668
integer width = 809
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set Phase Auto"
end type

event clicked;update traitements set id_phase = phase where id_phase is null;
commit using sqlca;
error_type(-1)
end event

type cb_3 from commandbutton within tabpage_sys
integer x = 32
integer y = 544
integer width = 809
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer satellite"
end type

event clicked;open(w_satellitedelete)
end event

type cb_2 from commandbutton within tabpage_sys
integer x = 32
integer y = 420
integer width = 809
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Set date dépôt"
end type

event clicked;update paiement set datedepot = date_paiement;
commit using sqlca;
end event

type cb_1 from commandbutton within tabpage_sys
integer x = 32
integer y = 172
integer width = 809
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Reset the last autoupdate"
end type

event clicked;integer li_ver

select ver into :li_ver from t_ver;
li_ver =li_ver - 1
update t_ver set ver = :li_ver;
commit using sqlca;
end event

type cb_cpdenc from commandbutton within tabpage_sys
integer x = 32
integer y = 48
integer width = 809
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Activer encaissement cpd"
end type

event clicked;update lock_cheques set flag = '2003-12-01';
commit using sqlca;
end event

event constructor;if v_langue = 'an' then
	this.text = 'Activate cashing of PDC'
end if
end event

type gb_archive from groupbox within tabpage_sys
integer x = 2734
integer y = 52
integer width = 818
integer height = 400
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archive"
end type

type gb_horaire from groupbox within tabpage_sys
integer x = 1733
integer y = 16
integer width = 933
integer height = 444
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Horaire"
end type

type gb_2 from groupbox within tabpage_sys
integer x = 1728
integer y = 476
integer width = 1851
integer height = 496
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copie de plusieurs tables d~'un ortho à l~'autre"
end type

type ddlb_orthoscr from u_ddlb within tabpage_sys
integer x = 1824
integer y = 604
integer width = 1001
integer height = 560
integer taborder = 11
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;string ls_nom
long ll_orthoid

DECLARE listortho CURSOR FOR
	SELECT dr_nom_complet, ortho_id from ortho_id;

OPEN listortho;

FETCH listortho INTO :ls_nom, :ll_orthoid;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_nom,ll_orthoid)
	FETCH listortho INTO :ls_nom, :ll_orthoid;
	
LOOP

CLOSE listortho;
end event

type gb_corr from groupbox within tabpage_sys
integer x = 1728
integer y = 984
integer width = 946
integer height = 296
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Options de correspondance"
end type

type cb_update_close from commandbutton within w_options
integer y = 2500
integer width = 4626
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Enregistrer et quitter"
end type

event clicked;long ll_corr, ll_number

sauve()

ll_corr = tab_options.tabpage_paperless.dw_optionspaperless.getitemnumber(1,'debarrer_corr')
IF isnull(ll_corr) then ll_corr = 10000
SetProfileString("c:\ii4net\orthotek\ortho.ini", "corr", "dateadd", string(ll_corr))

close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Save and exit"
end if

end event

