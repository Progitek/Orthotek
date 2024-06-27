$PBExportHeader$gestion_patients.sra
forward
global type gestion_patients from application
end type
global n_tr sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
/*  Application Manager  */
n_cst_orthotek_appmanager gnv_app 

long v_no_ortho, cpt, gl_serial,gl_idpers = -1
long  numero_patient, patientrech, rech
string patientnom, nodossier, gs_postocc, v_langue, gs_drspecial, gs_user, gs_ver, gs_defaultprinter
string gs_formatdate, gs_verdispo, gs_langue
boolean gb_datawindow,gb_updtsoftware,ib_updateok = true,gb_imp = true
s_calendar istr_cal
s_calendar istr_cal2
s_calendar istr_caltpl
s_calendar istr_calutil
s_img gstr_img
int gi_qteimp, gi_imp = 1, gi_photo = 0

window	gw_frame
end variables

global type gestion_patients from application
string appname = "gestion_patients"
boolean toolbartext = true
string toolbarframetitle = "Tool bar Orthotek"
boolean toolbarusercontrol = false
string dwmessagetitle = "ORTHOTEK !"
string displayname = "ORTHOTEK"
boolean freedblibraries = true
string appruntimeversion = "22.1.0.2828"
end type
global gestion_patients gestion_patients

type prototypes
function int CreateDirectoryA (string ls_Dir, long ll_Null) library "kernel32.dll" alias for "CreateDirectoryA;Ansi"
SUBROUTINE keyb_event (int bVk, int bScan, int dwFlags, int dwExtraInfo) LIBRARY "user32.dll"
Function integer PESelectPrinter(Integer printJob, String driverName, String printerName, String portName, Long mode)  Library "CRPE32.DLL" alias for "PESelectPrinter;Ansi" 
Function Integer PEOpenPrintJob(String reportFilePath) Library  "CRPE32.DLL" alias for "PEOpenPrintJob;Ansi"  
Function Integer PEOpenEngine() Library "CRPE32.DLL" 
Function Integer PEOutputToPrinter(Integer printJob, Integer nCopies) Library "CRPE32.DLL"
Function Integer PEStartPrintJob(Integer printJob, Integer waitUntilDone)  Library "CRPE32.DLL"
subroutine PEClosePrintJob(Integer printJob) Library "CRPE32.DLL" 
subroutine PECloseEngine() Library "CRPE32.DLL"
Function Integer PESetFormula(Integer printJob, String formulaName, String formulaString) Library "CRPE32.DLL" alias for "PESetFormula;Ansi"
Function Integer PEOutputToWindow(Integer printJob, String title, Integer left, Integer top, Integer width, Integer height, Long style, Integer parWindow) Library "CRPE32.DLL" alias for "PEOutputToWindow;Ansi"
Function Integer PESetSelectionFormula(Integer printJob, String formulaString) Library "CRPE32.DLL" alias for "PESetSelectionFormula;Ansi"
Function Integer PELogOnServer(string dllname, s_logoninfo loginfo) LIBRARY "CRPE32.DLL" alias for "PELogOnServer;Ansi"

FUNCTION boolean ChooseColorA (REF gs_choosecolor as_color ) Library "comdlg32.dll" alias for "ChooseColorA;Ansi"
FUNCTION boolean GetVolumeInformationA(string lpRootPathName,REF string lpVolumeNameBuffer,ulong nVolumeNameSize,REF ulong lpVolumeSerialNumber,REF ulong lpMaximumComponentLength,REF ulong lpFileSystemFlags,REF string lpFileSystemNameBuffer,ulong nFileSystemNameSize) LIBRARY "kernel32.dll" alias for "GetVolumeInformationA;Ansi"
FUNCTION ulong   GetWindowsDirectoryA (REF string dirtext, ulong textlen) LIBRARY "KERNEL32.DLL" alias for "GetWindowsDirectoryA;Ansi"
Function boolean CopyFileA (ref string lpszExistingFile, ref string lpszNewFile, boolean fFailIfExists) library "KERNEL32.DLL" alias for "CopyFileA;Ansi"
FUNCTION long ShellExecuteA(long hwnd, REF string lpOperation, REF string stringlpFile,REF string lpParameters, REF string lpDirectory, Long nShowCmd) Library "shell32.dll" alias for "ShellExecuteA;Ansi"
FUNCTION int GetSystemMetrics (int index) LIBRARY "USER32.DLL"
end prototypes

forward prototypes
public function boolean f_checkdate ()
public subroutine af_nbconn (ref integer ai_nbconn)
public subroutine of_checkexecutable ()
public subroutine uf_cmdline (string as_cmdline, ref string as_odbc, ref string as_pwd, ref boolean ab_backup, ref boolean ab_lic)
public subroutine of_setvalueregistre ()
end prototypes

public function boolean f_checkdate ();//format date
w_etat.sle_status.text = 'Vérification date système'
integer i
gs_formatdate = ''
RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sShortDate", RegString!, gs_formatdate)
if gs_formatdate <> 'dd/MM/yyyy' and gs_formatdate <> 'dd-MM-yyyy' and gs_formatdate <> 'jj/MM/aaaa' and gs_formatdate <> 'jj-MM-aaaa' and gs_formatdate <> 'MM/dd/yyyy' and gs_formatdate <> 'MM-dd-yyyy' and gs_formatdate <> 'MM/jj/aaaa' and gs_formatdate <> 'MM-jj-aaaa' then
	w_etat.sle_status.textcolor = rgb(255,0,0)
	w_etat.sle_status.text = 'ERREUR DATE SYSTÈME INCORRECTE'	
//	if error_type(202) = 1 then
//		if Match(from_reg, "[A a]") = true then
//			RegistrySet ("HKEY_CURRENT_USER\Control Panel\International", "sShortDate", RegString!, 'jj/MM/aaaa' )
//		end if
//		if Match(from_reg, "[Y y]") = true then
//			RegistrySet ("HKEY_CURRENT_USER\Control Panel\International", "sShortDate", RegString!, 'dd/MM/yyyy' )
//		end if
//	end if
	return false
else
	return true
end if
end function

public subroutine af_nbconn (ref integer ai_nbconn);string s_command, sName, sUserid, sLastReqTime, sProcessTime, sReqType, sCommLink, sNodeAddr, sNumber, sDBNumber, sPort, sLastidle, sCurrTaskSw 
string sBlockedOn,sLockName, sUncmtOps 
ai_nbconn = 0

DECLARE conn_info PROCEDURE FOR dbo.sa_conn_info; 
EXECUTE conn_info; 


	IF SQLCA.SQLCode <> 0 THEN 
		MessageBox("DB Error", SQLCA.SQLErrText) 
	END IF 


	do while sqlca.sqlcode = 0 
		
		FETCH conn_info 
		
		INTO  :sNumber, 
				:sName, 
				:sUserid, 
				:sDBNumber, 
				:sLastReqTime, 
				:sProcessTime, 
				:sPort, 
				:sReqType, 
				:sCommLink, 
				:sNodeAddr, 
				:sLastidle, 
				:sCurrTaskSw, 
				:sBlockedOn,
				:sLockName,
				:sUncmtOps; 
		  
// nodeaddr", sNumber+"/"+sName+"/"+sUserid+"/"+sDBNumber+"/"+sPort+"/"+sCommLink+"/"+sNodeAddr) 
//	s_command = "DROP CONNECTION " + sNumber 
	
//	messagebox("sql", s_command) 
//         EXECUTE IMMEDIATE :sNumber; 
	
	IF SQLCA.SQLCode <> 0 THEN 
//		 MessageBox("DB Error", SQLCA.SQLErrText) 
	else 
		 ai_nbconn++
//		 messagebox("User dropped", "Dropped connection # " + sNumber) 
	END IF 
loop 
//messagebox('Nb',string(ai_nbconn))

CLOSE conn_info;
end subroutine

public subroutine of_checkexecutable ();//Vérifier la date de l'exécutable - si trop tard crasher
//Après un an sans update, l'utilisateur ne peut plus utiliser l'application

n_cst_filesrvwin32	lnv_file
n_cst_datetime			lnv_date
date		ldt_date
string 	ls_file, ls_registre
long		ll_days, ll_mois, ll_diff

lnv_file = CREATE n_cst_filesrvwin32
ls_file = lnv_file.of_getexecutablename()
IF IsNull(ls_file) = FALSE AND ls_file <> "" THEN
	lnv_file.of_GetCreationDate( ls_file, ldt_date)
	ll_days = DaysAfter(ldt_date, today())
	IF ll_days > 365 THEN
		
		//Vérifier le registre pour savoir si la date a été remise
		
		// La façon de corriger le crash chez le client pour un an est d'ajouter le nombre 12 à la clé
		// HKEY_LOCAL_MACHINE\SOFTWARE\date_os  . Il faut créer la clé de type string avant. Si elle
		// est déjà là, il faut ajouter 12 à ce chiffre pour que ce soit bon pour un an. 
		
		RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE", "date_os", RegString! ,ls_registre)
		
		ll_mois = long(ls_registre)
		ll_diff = lnv_date.of_MonthsAfter ( ldt_date, today() )
		
		IF (isnull(ls_registre) OR ls_registre = "") OR ll_diff > ll_mois  THEN
			Messagebox("Unexpected error","Windows has triggered an unexpected error. Please try to restart or contact support. Error number 0x0045C0A.")
			HALT CLOSE
		END IF
	END IF
END IF
If IsValid(lnv_file) THEN DESTROY(lnv_file)
end subroutine

public subroutine uf_cmdline (string as_cmdline, ref string as_odbc, ref string as_pwd, ref boolean ab_backup, ref boolean ab_lic);integer li_posn,li_posp,li_posb,li_post,li_posl

li_posn = pos(as_cmdline,'-n') + 3
li_posp = pos(as_cmdline,'-p') + 3
li_posb = pos(as_cmdline,'-b')
li_posl = pos(as_cmdline,'-licpr0')

if li_posp > 3 then
	li_post = pos(as_cmdline,' ',li_posp)
	if li_post = 0 then li_post = len(as_cmdline) + 3
	
	as_pwd = mid(as_cmdline,li_posp,li_post - li_posp)
end if

if li_posn > 3 then
	li_post = pos(as_cmdline,' ',li_posn)
	if li_post = 0 then li_post = len(as_cmdline) + 3
	
	as_odbc = mid(as_cmdline,li_posn,li_post - li_posn)
end if
	
if as_odbc = '' then as_odbc = 'orthotek'

ab_backup = li_posb > 0

ab_lic = li_posl > 0

end subroutine

public subroutine of_setvalueregistre ();uLong ll_valeur
string ls_pathword

 //office 2000

ls_pathword = "C:\Program Files\Microsoft Office\OFFICE10\winword.exe"
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
end if

//office 2003

ls_pathword = "C:\Program Files\Microsoft Office\OFFICE11\winword.exe"
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
end if

 
ls_pathword = "C:\Program Files\Microsoft Office\OFFICE112\winword.exe"
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
end if

ls_pathword = "C:\Program Files\Microsoft Office\OFFICE13\winword.exe"
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
end if

//office 2010

ls_pathword = "C:\Program Files\Microsoft Office\OFFICE14\winword.exe"
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
end if

ls_pathword = "C:\Program Files\Microsoft Office\OFFICE15\winword.exe"
if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Options","SQLSecurityCheck",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Options","SQLSecurityCheck",ReguLong!,0)
end if

if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Security","Level",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Security","Level",ReguLong!,1)
end if

if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word\Security","Level",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word\Security","Level",ReguLong!,1)
end if

if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word\Security","Level",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word\Security","Level",ReguLong!,1)
end if

if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\Security","Level",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\Security","Level",ReguLong!,1)
end if

if RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Security","Level",ReguLong!,ll_valeur) = -1 then
	RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Security","Level",ReguLong!,1)
end if

// Correpondance

RegistrySet("HKEY_LOCAL_MACHINE\Software\Progitek", "Produit", RegString!, "Orthotek")
RegistrySet("HKEY_LOCAL_MACHINE\Software\Progitek\Orthotek\corr", "cheminTPL", RegString!, "c:\ii4net\orthotek")
RegistrySet("HKEY_LOCAL_MACHINE\Software\Progitek\Orthotek\corr", "cheminWord", RegString!, ls_pathword )
RegistrySet("HKEY_LOCAL_MACHINE\Software\Progitek\Orthotek\corr", "chfusion", RegString!, "c:\ii4net\orthotek\pat.xls")
RegistrySet("HKEY_LOCAL_MACHINE\Software\Progitek\Orthotek\corr", "imgmdl", RegString!, "c:\ii4net\word")
RegistrySet("HKEY_LOCAL_MACHINE\Software\Progitek\Orthotek\corr", "pathimg", RegString!, "c:\ii4net\orthotek\img.xml")
RegistrySet("HKEY_LOCAL_MACHINE\Software\Progitek\Orthotek\corr", "fichtexte", RegString!, "c:\ii4net\orthotek\img.html")

end subroutine

on gestion_patients.create
appname="gestion_patients"
message=create message
sqlca=create n_tr
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on gestion_patients.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;///////////////////////////////////////////////////
//	Réalisé par 	:	Éric Vézina ing.
//	Date création	:	1997/06/03
///////////////////////////////
////////////////////

open(w_etat)
if handle(this) = 0 then w_etat.visible = false
//commandline
string ls_commline,ls_odbc,ls_pwd, ls_noserie, ls_sql, ls_macadr, ls_serialprint
boolean lb_backup, lb_license
long ll_ortho, ll_temp, ll_pos
n_adapter luo_adapter

if isnull(commandline) then commandline = ''
if pos(commandline, '-n') <= 0 then
	ls_commline = commandline + ' -n orthotek'
else
	ls_commline = commandline
end if

//ls_commline = ' -n orthov11' 
//ls_commline += ' -b'
uf_cmdline(ls_commline,ls_odbc,ls_pwd,lb_backup,lb_license)
//messagebox(ls_commline,'*' + ls_odbc + '* *' + ls_pwd + '*')
//verification des repertoires
//createdir()

ls_odbc = "migortho"

w_etat.sle_status.text = 'Connection à la base de données'
SQLCA.DBMS       = 'ODBC'
SQLCA.LOCK		  = "0"
SQLCA.AutoCommit = True
SQLCA.DbParm     = "ConnectString='DSN="+ls_odbc+";UID=dba;PWD=ii4clmam',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
//SQLCA.LOCK = "RC"
connect using SQLCA;
if sqlca.sqlcode <> 0 then
	w_etat.sle_status.text = "Impossible de se connecter!"
	MessageBox ("Cannot Connect to Database", sqlca.sqlerrtext)
	close(w_etat)
	return
end if

//ls_commline = "-m1"
//ls_commline = "-m"

// Authentifier la connection pour la version 11

ls_sql = "SET TEMPORARY OPTION CONNECTION_AUTHENTICATION='Company=Progitek;Application=Progitek;Signature=000fa55157edb8e14d818eb4fe3db41447146f1571g7cf6b1c162e7a4e4925570fc8104c82ac6d466c6'"
execute immediate :ls_sql using SQLCA;
if sqlca.sqlcode <> 0 then
	MessageBox ("Validation d'authentification", sqlca.sqlerrtext)
	return
end if

long ll_count

gnv_app = create n_cst_orthotek_appmanager
gnv_app.Event pfc_open ( commandline )
gnv_app.of_SetVersion("8.5.18.12")
gnv_app.of_setAppIniFile("C:\ii4net\orthotek\ortho.ini")
gnv_app.is_odbc = ls_odbc
w_etat.st_verprog.text = "Version " + gnv_app.of_GetVersion()

// Mettre le programme à jour si nécessaire
if handle(this) <> 0 then
	if gnv_app.of_majprogreq() > 0 then
		w_etat.sle_status.text = 'Une nouvelle version doit être installée, veuillez patienter...'
		gnv_app.of_miseajourfichier("orthotekmajnew.exe")
	end if
end if

if handle(this) <> 0 and not lb_license then
	
	ls_macadr = luo_adapter.of_getmacaddr()	
	ls_serialprint = string(h64(rep(ls_macadr,'-','')))	
	setProfileString(gnv_app.of_getAppIniFile(), "printer", "UniqueId", ls_serialprint)
	
	gl_serial = getSerialNumber("c:\")
	if not gl_serial = 680641887 and not gl_serial = -1470839007 and not gl_serial = 613687435 then
		select count(*) into :ll_count from t_validuser where serialnumber = :gl_serial;
		if ll_count < 1 then
			messagebox("Numéro de série: " + string(gl_serial),"Vous n'êtes pas autorisé à utiliser ce programme, veuillez communiquer avec le service à la clientèle")
			close(w_etat)
			return
		end if
	end if
	ls_noserie = gnv_app.of_obtenir_nom_ordinateur()
	update t_validuser set ordinateur = :ls_noserie where serialnumber = :gl_serial;
	commit using SQLCA;
end if

// Backup
if lb_backup then
	close(w_etat)
	open(w_mdibackup)
	opensheet(w_ftpbackup, w_mdibackup, 1, layered!)
	w_ftpbackup.title = 'Backup'
	
	w_ftpbackup.cb_1.event clicked()
	w_ftpbackup.cb_update.event clicked()
	close(w_ftpbackup)
	close(w_mdibackup)
	this.triggerevent("close()")
else
	
	
	//initialise l'imprimante par default
	RegistryGet("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows","Device", RegString!, gs_defaultprinter)
	
	of_setvalueregistre()
	
	long ll_place
	
	ll_place = pos(gs_defaultprinter,"~,")
	gs_defaultprinter = Left(gs_defaultprinter,ll_place - 1)
	
	//Web Auto Update
	string ls_verprg[]
	integer i
	
	gb_updtsoftware = false
	ls_verprg = split(gnv_app.of_getVersion(), '.')
	if lower(profileString(gnv_app.of_getAppIniFile(), "Update", "Check", "Yes")) = "yes" then
		w_etat.sle_status.text = 'Vérification des nouvelles versions disponibles'
		
		gb_updtsoftware = (gnv_app.of_majrequise() > 0)
	end if
	
	//Mise à jour des tables

	// On ajoute le nouveau champs vertable a t_ver
	string ls_verbd[], ls_ver
	boolean lb_upd = false
	
	select isnull(vertable,'8.2.9') into :ls_ver from t_ver;
	if SQLCA.SQLCode <> 0 then
		ls_sql = "ALTER TABLE t_ver ADD vertable VARCHAR(10) NULL"
		execute immediate :ls_sql using sqlca;
		
		select isnull(vertable,'8.2.9') into :ls_ver from t_ver;
	end if
	
	w_etat.st_verbd.text = "BD Version " + ls_ver
	
	ls_verbd = split(ls_ver, '.')
	
	If upperbound(ls_verbd) = 3 Then
		for i = 1 to 3
			If long(ls_verprg[i]) > long(ls_verbd[i]) Then
				lb_upd = True
				exit
			ElseIf long(ls_verprg[i]) < long(ls_verbd[i]) Then
				lb_upd = False
				exit
			End If
		Next
	else
		lb_upd = True
	End If

	
	if lb_upd then
		integer li_nbconn = 0
		w_etat.sle_status.text = 'Vérification du nombre de connection à la base de données'
		af_nbconn(li_nbconn)
		if li_nbconn > 1 then
			if messagebox('Avertissement!', "Impossible de mettre à jour la base de données car il y a présentement "+string(li_nbconn - 1)+" autre(s) utilisateur(s) connecté(s).~r~nSi vous vous connectez au programme, vous pourriez rencontrer des problèmes sérieux.~r~nIl est recommandé de fermer tous les autres Orthotek se branchant à la même base de données et de redémarrer celui-ci.~r~nVoulez-vous quand même vous connecter sans mettre à jour la base de données ?", stopSign!, YesNo!, 2) = 2 then
				close(w_etat)
				return
			end if
		else
			w_etat.sle_status.text = 'Mise-à-jour de la version'
			gf_autoupdate()
			gf_updatetable()
		end if
	end if
	
	if not  FileExists("c:\ii4net\orthotek\pbsmtpclient.tlb") then run("c:\ii4net\orthotek\regasm.exe /codebase /tlb c:\ii4net\orthotek\pbsmtpclient.dll",Minimized!)
	
	//initialisation des options au premier demarrage
	w_etat.sle_status.text = 'Vérification des options'
	int v_check
	
	//choisir la langue par defaut
	select first langue into :v_langue from password;
	gs_langue = v_langue
	
	//Admin password
	select count(*) into :v_check from password where typepass = 'admin' using sqlca;
	if v_check = 0 then
		insert into password (ortho_id,password,typepass,langue) VALUES (0,'ii4net','admin','fr');
	end if
	
	//Securite pour demo
	w_etat.sle_status.text = 'Vérification de la sécurité'
	int v_compteur, v_days , v_decompte
	date v_flag
	string v_serie
	select count(*) into :v_compteur from lock_cheques;
	
	//premier demarrage
	if v_compteur <= 0 then
		insert into lock_cheques (flag) values (today());
	end if
	select compteur into :v_compteur from lock_cheques;
	select flag into :v_flag from lock_cheques;
	select no_serie into :v_serie from lock_cheques;
	
	//(creation version demo)
	if (isnull(v_compteur)=true) or (v_compteur <= 0) or (isnull(v_serie))=true then
		w_etat.sle_status.text = 'License'
		Open (w_registration)
	//pour ne pas compter deux fois la meme journee (version complete)
	elseif (today() = v_flag) or (v_serie = "P2001-03061-97647") then 
		if f_checkdate() then
			w_etat.sle_status.text = 'Login'
		end if
		ll_pos = pos(ls_commline,'-m')
		if ll_pos > 0 then
			ll_temp = long(mid(ls_commline, ll_pos + 2))
			if ll_temp = 0 then
				ll_ortho = 0
			else
				setNull(ll_ortho)
				select horshareid into :ll_ortho from t_options where ortho_id = :ll_temp;
				if isNull(ll_ortho) then
					ll_ortho = 0
				end if
			end if
			openwithparm(w_cincoutreg,ll_ortho)
			close(w_etat)
		else
			Openwithparm(w_password_logon,ls_pwd)
		end if
	else
		//(version demo)
		v_days=abs(DaysAfter(v_flag, today()))
		v_decompte = v_compteur - v_days
		update lock_cheques set compteur = :v_decompte;
		commit using SQLCA;
		if f_checkdate() then
			w_etat.sle_status.text = 'Login'
		end if
		if pos(left(ls_commline,2),'-m') > 0 then
			// ne fonctionnera pas !!
			// impossible qu'il y ait quelque chose 3 caractères après
			// les 2 derniers caractères de la chaîne !
			ll_temp = long(mid(ls_commline,3))
			select horshareid into :ll_ortho from t_options where ortho_id = :ll_temp;
			openwithparm(w_cincoutreg,ll_ortho)
		else
			Openwithparm(w_password_logon,ls_pwd)
			of_checkexecutable()
		end if
	end if

end if

end event

event systemerror;//close(w_etat)
end event

event close;gnv_app.Event pfc_close ( )

Destroy gnv_app
end event

event connectionbegin;Return gnv_app.Event pfc_connectionbegin ( userid, password, connectstring )
end event

event connectionend;gnv_app.Event pfc_connectionend (  )
end event

event idle;gnv_app.Event pfc_idle (  )
end event

