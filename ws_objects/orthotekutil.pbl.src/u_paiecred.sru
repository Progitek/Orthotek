$PBExportHeader$u_paiecred.sru
forward
global type u_paiecred from nonvisualobject
end type
end forward

global type u_paiecred from nonvisualobject
end type
global u_paiecred u_paiecred

type variables
// Paramètres par défaut
Public String is_servername	= "esqa.moneris.com"
Public String is_ftpusername	= "store3"
Public String is_ftppassword	= "store3"
Public ULong il_ftpport			= 22
Public String is_xmlfile		= "C:\ii4net\paiecred.xml"
Public String is_storeid		= "store2"
Public String is_apitoken		= "yesguy"

end variables

forward prototypes
public function integer of_init (string as_server, string as_usager, string as_motdepasse, unsignedlong al_portftp, string as_fichier, string as_magid, string as_apitoken)
public function integer of_validepaie (str_paiecredrecur astr_paiement)
public function integer of_creerlotxml (str_paiecredrecur astr_paiements[], unsignedlong al_nocom)
public function boolean of_envoyerlot (long al_nbtrans)
public function any of_lirereponse ()
end prototypes

public function integer of_init (string as_server, string as_usager, string as_motdepasse, unsignedlong al_portftp, string as_fichier, string as_magid, string as_apitoken);is_servername = as_server
is_ftpusername = as_usager
is_ftppassword = as_motdepasse
il_ftpport = al_portftp
is_xmlfile = as_fichier
is_storeid = as_magid
is_apitoken = as_apitoken

return 1
end function

public function integer of_validepaie (str_paiecredrecur astr_paiement);// Valide le numéro de carte de crédit
if isNull(astr_paiement.s_nocarte) then return -1
if not match(rep(rep(astr_paiement.s_nocarte, ' ', ''), '-', ''), "^[0-9]+$") then return -1
astr_paiement.s_nocarte = rep(rep(astr_paiement.s_nocarte, ' ', ''), '-', '')

// Valide la date d'expiration
if isNull(astr_paiement.dt_dateexp) then return -2
if date(year(astr_paiement.dt_dateexp), month(astr_paiement.dt_dateexp), 1) < date(year(today()), month(today()), 1) then return -2

// Valide l'unité de récurrence
if isNull(astr_paiement.c_unitrecur) then return -3
choose case lower(astr_paiement.c_unitrecur)
	case 'j', 'd'
		astr_paiement.c_unitrecur = 'j'
	case 's', 'w'
		astr_paiement.c_unitrecur = 's'
	case 'm'
		astr_paiement.c_unitrecur = 'm'
	case else
		return -3
end choose

// Valide la date de début de la récurrence
if isNull(astr_paiement.dt_debut) then return -4
if astr_paiement.dt_debut <= today() then return -4

// Valide le nombre de récurrences
if isNull(astr_paiement.i_nbrecur) then return -5
if astr_paiement.i_nbrecur < 1 or astr_paiement.i_nbrecur > 999 then return -5

// Valide la période de récurrence
if isNull(astr_paiement.i_periode) then return -6
if astr_paiement.i_periode < 1 or astr_paiement.i_periode > 120 then return -6

// Valide le montant de la récurrence
if isNull(astr_paiement.d_recurmontant) then return -7
if astr_paiement.d_recurmontant <= 0 or astr_paiement.d_recurmontant > 9999999.99 then return -7

return 0
end function

public function integer of_creerlotxml (str_paiecredrecur astr_paiements[], unsignedlong al_nocom);long ll_cpt = 0, ll_file, i, ll_error
string ls_sn

if isNull(al_nocom) then return 0
if al_nocom < 1 then return 0

if fileExists(is_xmlfile) then fileDelete(is_xmlfile)

ll_file = fileOpen(is_xmlfile, LineMode!, Write!, LockWrite!, Replace!)
ll_error = fileOpen("C:\ii4net\erreur.log",LineMode!, Write!, LockWrite!, Replace! )

if isNull(ll_file) then ll_file = -1
if ll_file = -1 then return 0

fileWrite(ll_file, "<?xml version=~"1.0~"?>")
fileWrite(ll_file, "<request>")
fileWrite(ll_file, "~t<store_id>" + is_storeid + "</store_id>")
fileWrite(ll_file, "~t<api_token>" + is_apitoken + "</api_token>")

for i = 1 to upperbound(astr_paiements)
	choose case of_validepaie(astr_paiements[i])
		case 0 // Paiement valide, ajouter au lot xml
			fileWrite(ll_file, "~t<purchase>")
			fileWrite(ll_file, "~t~t<order_id>" + string(al_nocom) + "</order_id>")
			
			// Si le montant est nul, on indique le montant de la récurrence
			if isNull(astr_paiements[i].d_montant) then
				fileWrite(ll_file, "~t~t<amount>" + rep(string(astr_paiements[i].d_recurmontant), ',', '.')  + "</amount>")
				ls_sn = "false"
			else
				fileWrite(ll_file, "~t~t<amount>" + rep(string(astr_paiements[i].d_montant), ',', '.') + "</amount>")
				ls_sn = "true"
			end if
			
			// Informations de la carte de crédit
			fileWrite(ll_file, "~t~t<pan>" + astr_paiements[i].s_nocarte + "</pan>")
			fileWrite(ll_file, "~t~t<expdate>" + string(astr_paiements[i].dt_dateexp, "yymm") + "</expdate>")
			
			// Type d'encryption
			fileWrite(ll_file, "~t~t<crypt_type>7</crypt_type>")
			
			// Informations de la récurrence
			fileWrite(ll_file, "~t~t<recur>")
			
			choose case astr_paiements[i].c_unitrecur
				case 'j'
					fileWrite(ll_file, "~t~t~t<recur_unit>day</recur_unit>")
				case 's'
					fileWrite(ll_file, "~t~t~t<recur_unit>week</recur_unit>")
				case 'm'
					fileWrite(ll_file, "~t~t~t<recur_unit>month</recur_unit>")
			end choose
			
			fileWrite(ll_file, "~t~t~t<start_now>" + ls_sn + "</start_now>")
			fileWrite(ll_file, "~t~t~t<start_date>" + string(astr_paiements[i].dt_debut, "yyyy/mm/dd") + "</start_date>")
			fileWrite(ll_file, "~t~t~t<num_recurs>" + string(astr_paiements[i].i_nbrecur) + "</num_recurs>")
			fileWrite(ll_file, "~t~t~t<period>" + string(astr_paiements[i].i_periode) + "</period>")
			fileWrite(ll_file, "~t~t~t<recur_amount>" + rep(string(astr_paiements[i].d_recurmontant), ',', '.') + "</recur_amount>")
			
			fileWrite(ll_file, "~t~t</recur>")
			fileWrite(ll_file, "~t</purchase>")
			al_nocom ++
			ll_cpt ++
		case -1
			fileWrite(ll_error, string(i) + " - Erreur no carte de crédit")
		case -2
			fileWrite(ll_error, string(i) + " - Erreur date d'expiration carte de crédit")
		case -3
			fileWrite(ll_error, string(i) + " - Erreur unité de récurrence")
		case -4
			fileWrite(ll_error, string(i) + " - Erreur date de début de la récurrence")
		case -5
			fileWrite(ll_error, string(i) + " - Erreur nombre de récurrences")
		case -6
			fileWrite(ll_error, string(i) + " - Erreur période de récurrence")
		case -7
			fileWrite(ll_error, string(i) + " - Erreur montant de la récurrence")
	end choose
next

fileWrite(ll_file, "</request>")
fileClose(ll_file)
fileClose(ll_error)

// Retourne le nombre de demandes valides qui ont été inscrites au fichier xml
return ll_cpt

end function

public function boolean of_envoyerlot (long al_nbtrans);// Envoi le fichier XML à l'adresse désignée dans les paramètres
string ls_repfile, ls_repfoldr, ls_cmd

if DirectoryExists("C:\Program Files\Bitvise Tunnelier\") then
	ls_cmd = "~"C:\Program Files\Bitvise Tunnelier\sftpc~" " + is_ftpusername + &
	"@" + is_servername + ":" + string(il_ftpport) + " -pw=" + is_ftppassword + &
	" -cmd=~"put " + is_xmlfile + "~" -bg"
	
	run(ls_cmd, Minimized!)

	sleep(al_nbtrans * 2)
	
	ls_repfoldr = left(is_xmlfile, lastpos(is_xmlfile, '\'))
	ls_repfile = mid(is_xmlfile, lastpos(is_xmlfile, '\') + 1) + '.out'

	ls_cmd = "~"C:\Program Files\Bitvise Tunnelier\sftpc~" " + is_ftpusername + &
	"@" + is_servername + ":" + string(il_ftpport) + " -pw=" + is_ftppassword + &
	" -cmd=~"cd /out; get " + ls_repfile + " " + ls_repfoldr + &
	" -o; del " + ls_repfile + "~" -bg"
	
	do
		run(ls_cmd, Minimized!)
		sleep(5)
	loop while not fileExists(is_xmlfile + ".out")
	
	return true
else
	return false
end if
end function

public function any of_lirereponse ();string ls_line
long ll_fich, ll_cpt = 0
str_paiecredrep lstr_rep[]

if fileExists(is_xmlfile + '.out') then
	ll_fich = fileOpen(is_xmlfile + '.out')
	
	do while fileRead(ll_fich, ls_line) >= 0
		if pos(ls_line, '<receipt>') > 0 then
			ll_cpt ++
			lstr_rep[ll_cpt].s_receiptid = mid(ls_line, pos(ls_line, '<ReceiptId>') + 11, pos(ls_line, '</ReceiptId>') - pos(ls_line, '<ReceiptId>') - 11)
			lstr_rep[ll_cpt].s_txnnbr = mid(ls_line, pos(ls_line, '<TransId>') + 9, pos(ls_line, '</TransId>') - pos(ls_line, '<TransId>') - 9)
			if mid(ls_line, pos(ls_line, '<Complete>') + 10, pos(ls_line, '</Complete>') - pos(ls_line, '<Complete>') - 10) = 'true' then
				lstr_rep[ll_cpt].i_complete = 1
			else
				lstr_rep[ll_cpt].i_complete = 0
			end if
			lstr_rep[ll_cpt].s_message = mid(ls_line, pos(ls_line, '<Message>') + 9, pos(ls_line, '</Message>') - pos(ls_line, '<Message>') - 9)
			if mid(ls_line, pos(ls_line, '<TimedOut>') + 10, pos(ls_line, '</TimedOut>') - pos(ls_line, '<TimedOut>') - 10) = 'true' then
				lstr_rep[ll_cpt].i_timedout = 1
			else
				lstr_rep[ll_cpt].i_timedout = 0
			end if
			if mid(ls_line, pos(ls_line, '<RecurSuccess>') + 14, pos(ls_line, '</RecurSuccess>') - pos(ls_line, '<RecurSuccess>') - 14) = 'true' then
				lstr_rep[ll_cpt].i_recursuccess = 1
			else
				lstr_rep[ll_cpt].i_recursuccess = 0
			end if
		end if
	loop
	
	fileClose(ll_fich)
end if

return lstr_rep

end function

on u_paiecred.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_paiecred.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

