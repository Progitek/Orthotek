$PBExportHeader$n_cst_orthotek_appmanager.sru
forward
global type n_cst_orthotek_appmanager from n_cst_appmanager
end type
end forward

global type n_cst_orthotek_appmanager from n_cst_appmanager
end type
global n_cst_orthotek_appmanager n_cst_orthotek_appmanager

type prototypes
FUNCTION long GetComputerNameW (REF string lpBuffer, ref long nSize) LIBRARY "kernel32.dll"
Function ulong GetCurrentProcessId() Library "kernel32.dll"
end prototypes

type variables
n_cst_messagerie inv_messagerie
string is_langue
n_cst_string inv_string
n_cst_filesrvwin32 inv_filesrv

string	is_versiondispo = "", is_nom_fichier = "", is_odbc
end variables

forward prototypes
public function integer of_setlangue (string as_langue)
public function string of_getlangue ()
public function integer of_majrequise ()
public function integer of_majprogreq ()
public function long of_miseajourfichier (string as_fichier)
public function integer of_majpossible ()
public function string of_nom_fichier_maj ()
public function long of_telechargerfichiermaj (string as_fichier)
public function string of_obtenir_nom_ordinateur ()
public subroutine of_getprinterlist (ref string as_imp[], ref string as_printlist)
end prototypes

public function integer of_setlangue (string as_langue);if isnull(as_langue) then
	return -1
end if

is_langue = as_langue
return 1
end function

public function string of_getlangue ();return is_langue
end function

public function integer of_majrequise ();string ls_versrv[], ls_verprg[]
integer i
n_tr lnv_transweb

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

  select TOP 1 version
	 into :is_versiondispo
	 from t_progitek_automatisme
	where lower(type_fichier) = 'orthotekmaj'
order by date_fichier desc
	using lnv_transweb;

destroy lnv_transweb

ls_verprg = split(is_version, '.')
ls_versrv = split(is_versiondispo, '.')

if upperbound(ls_versrv) <> 4 or upperbound(ls_verprg) <> 4 then return 1

for i = 1 to 4
	if long(ls_verprg[i]) < long(ls_versrv[i]) then
		if i < 3 then return 1 else return 0
	elseif long(ls_verprg[i]) > long(ls_versrv[i]) then
		return -1
	end if
Next

return 0

end function

public function integer of_majprogreq ();string ls_versrv[], ls_verprg[], ls_dispoBD
integer i

select version_soft
  into :ls_dispoBD
  from t_miseajour;

if SQLCA.SQLCode < 0 then
	return 0
end if

ls_verprg = split(is_version, '.')
ls_versrv = split(ls_dispoBD, '.')

if upperbound(ls_versrv) <> 4 or upperbound(ls_verprg) <> 4 then return -1

for i = 1 to 4
	if long(ls_verprg[i]) < long(ls_versrv[i]) then
		return 1
	elseif long(ls_verprg[i]) > long(ls_versrv[i]) then
		return -1
	end if
Next

return 0

end function

public function long of_miseajourfichier (string as_fichier);blob		lblob_contenu

SetPointer(HourGlass!)

//Vider le répertoire
THIS.inv_filesrv.of_delTree("C:\ii4net\orthotek\version\")

THIS.inv_filesrv.of_CreateDirectory("C:\ii4net\orthotek\version\")

//Récupérer le fichier de la base de données locale
SELECTBLOB executable
INTO :lblob_contenu
FROM t_miseajour;
IF SQLCA.SQLCode < 0 THEN
	error_type(1013)
	RETURN 0
END IF

if Len(lblob_contenu) <= 0 then
	error_type(1013)
	return 0
end if

SetPointer(HourGlass!)

//Écrire le fichier
IF THIS.inv_filesrv.of_filewrite( "C:\ii4net\orthotek\version\" + as_fichier, lblob_contenu) <= 0 THEN
	error_type(1014)
	RETURN 0
ELSE
	// Exécuter la mise-à-jour
	run("C:\ii4net\orthotek\version\" + as_fichier)
	halt close
END IF

RETURN 1
end function

public function integer of_majpossible ();string ls_versrv[], ls_verprg[]
integer i
n_tr lnv_transweb

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

select TOP 1 version
into :is_versiondispo
from t_progitek_automatisme
where lower(type_fichier) = 'orthotekmaj'
ORDER BY date_fichier desc
using lnv_transweb;
 
destroy lnv_transweb

is_versiondispo = TRIM(is_versiondispo)

ls_verprg = split(is_version, '.')
ls_versrv = split(is_versiondispo, '.')

if upperbound(ls_versrv) <> 4 or upperbound(ls_verprg) <> 4 then return 1

for i = 1 to 4
	if long(ls_verprg[i]) < long(ls_versrv[i]) then
		return 1
	elseif long(ls_verprg[i]) > long(ls_versrv[i]) then
		return -1
	end if
Next

return 0
end function

public function string of_nom_fichier_maj ();string ls_versrv[], ls_verprg[]
integer i
n_tr lnv_transweb

lnv_transweb = create n_tr

SQLCA.of_copyto(lnv_transweb)

// Profile progitek_web
lnv_transweb.DBMS = "OLE DB"
lnv_transweb.LogPass = "10progitek01"
lnv_transweb.LogId = "progitek"
lnv_transweb.AutoCommit = False
lnv_transweb.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='www.atmtech.biz',PROVIDERSTRING='database=progitek;'"

if lnv_transweb.of_connect() <> 0 then
	return ""
end if

select TOP 1 nom_fichier
  into :is_nom_fichier
  from t_progitek_automatisme
 where lower(type_fichier) = 'orthotekmaj'
 ORDER BY date_fichier desc
 using lnv_transweb;
 
destroy lnv_transweb

RETURN is_nom_fichier
end function

public function long of_telechargerfichiermaj (string as_fichier);n_tr 		lnv_transweb
blob		lblob_contenu
long		ll_grosseur
string	ls_version

lnv_transweb = create n_tr

SQLCA.of_copyto(lnv_transweb)

// Profile progitek_web
lnv_transweb.DBMS = "OLE DB"
lnv_transweb.LogPass = "10progitek01"
lnv_transweb.LogId = "progitek"
lnv_transweb.AutoCommit = False
lnv_transweb.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='www.atmtech.biz',PROVIDERSTRING='database=progitek;'"

if lnv_transweb.of_connect() <> 0 then
	return -1
end if

SetPointer(HourGlass!)

SELECTBLOB contenu_blob
INTO  :lblob_contenu
FROM t_progitek_automatisme
WHERE nom_fichier = :as_fichier
USING lnv_transweb;

IF lnv_transweb.SQLCode < 0 THEN
	error_type(1015)
	destroy lnv_transweb
	RETURN 0
END IF

SetPointer(HourGlass!)

//vérifier la grosseur
SELECT grosseur_fichier, version
INTO  :ll_grosseur, :ls_version
FROM t_progitek_automatisme
WHERE nom_fichier = :as_fichier
USING lnv_transweb;	

IF ll_grosseur <> LEN(lblob_contenu) THEN
	error_type(1015)
	destroy lnv_transweb
	RETURN 0
END IF

//Mettre le fichier dans la base de données locale
UPDATEBLOB t_miseajour
SET executable = :lblob_contenu USING SQLCA;
IF SQLCA.SQLCode < 0 THEN
	error_type(1018)
	destroy lnv_transweb
	RETURN 0
END IF
COMMIT USING SQLCA;

UPDATE t_miseajour
SET version_soft = :ls_version USING SQLCA;
IF SQLCA.SQLCode < 0 THEN
	error_type(1018)
	destroy lnv_transweb
	RETURN 0
END IF
COMMIT USING SQLCA;

destroy lnv_transweb

RETURN 1
end function

public function string of_obtenir_nom_ordinateur ();String	ls_compname
long		ll_size

ll_size = 255
ls_compname = Space(ll_size)

GetComputerNameW(ls_compname, ll_size)

return ls_compname
end function

public subroutine of_getprinterlist (ref string as_imp[], ref string as_printlist);string lstr_keys[], label_printer, driver_printer, port_printer
string ls_nomprint[]
integer li_cntr
string lstr_key, ls_printers, ls_printer[]
long i = 1, j, ll_index, ll_count
n_cst_array luo_array

as_printlist = ""


ls_printers = PrintgetPrinters()
ls_printer = split(ls_printers,"~n")

if upperbound(ls_printer) > 0 then
	for j = 1 to upperbound(ls_printer)
		ls_nomprint[j] = mid(ls_printer[j],1,pos(ls_printer[j],'winspool')-1)
		as_printlist += ls_printer[j] + "~n"
		as_imp[i] = ls_printer[j] + "~n"
		i++
	next
end if

registrykeys("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\", lstr_keys)

for li_cntr = 1 to upperbound(lstr_keys)
	ll_count = 0
	lstr_key = lstr_keys[li_cntr]
	//if luo_array.of_find(ls_nomprint,lstr_key) = 0 then fonctionne pas !!!!
	for i = 1 to upperbound(ls_nomprint)
		if mid(ls_nomprint[i],1,len(ls_nomprint[i])-1) = lstr_key then ll_count += 1
	next
	if ll_count = 0 then
		registryget("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\" + lstr_key, "Name", label_printer)
		registryget("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\" + lstr_key, "Printer Driver", driver_printer)
		registryget("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\" + lstr_key, "Port", port_printer)
		if label_printer <> "" then
			as_printlist += label_printer + "~t" + driver_printer + "~t" + port_printer + "~n"
			as_imp[i] = label_printer + "~t" + driver_printer + "~t" + port_printer + "~n"
			i++
		end if
	end if
	label_printer = ""
	driver_printer = ""
	port_printer = ""
next


end subroutine

on n_cst_orthotek_appmanager.create
call super::create
end on

on n_cst_orthotek_appmanager.destroy
call super::destroy
end on

event pfc_open;call super::pfc_open;f_setFileSrv(inv_filesrv, true)
end event

