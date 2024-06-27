$PBExportHeader$pro_u_biometrie.sru
forward
global type pro_u_biometrie from u_base
end type
type ole_bioplugin from olecustomcontrol within pro_u_biometrie
end type
end forward

global type pro_u_biometrie from u_base
integer width = 901
integer height = 820
event ue_onscan ( any aa_result )
ole_bioplugin ole_bioplugin
end type
global pro_u_biometrie pro_u_biometrie

type variables
Long il_id
Char ic_type
String is_personid
end variables

forward prototypes
public function any of_identify ()
public function any of_isregistered (string as_registrationid)
public function any of_updateprint (string as_registrationid)
public function any of_changeid (string as_oldregistrationid, string as_newregistrationid)
public function any of_startactiveidentification (string as_position)
public subroutine of_stopactiveidentification ()
public function any of_updatesingleprintshortu (string as_registrationid)
public function any of_updatesingleprintu (string as_registrationid)
public function any of_deleteprint (string as_registrationid)
public function any of_cancelregistrationrequest ()
public function any of_capturefingerdata (string as_position)
public function any of_getfingerdata ()
public subroutine of_setresult ()
public function boolean of_isclientinstalled ()
public function boolean of_isclientrunning ()
public function string of_getserverinfo ()
public subroutine of_setserverinfo (string as_serverinfo, integer ai_port)
public function any of_getnomatchfoundvalue ()
public subroutine of_setnomatchfoundvalue (string as_nomatchfoundvalue)
public function any of_getlocationid ()
public subroutine of_setlocationid (string as_locationid)
public subroutine of_setdefaultfinger (integer ai_leftfingerid, integer ai_rightfingerid)
public function any of_getscannerstatus ()
public function any of_getscannercount ()
public function any of_getscannerlist ()
public subroutine of_setimagedisplaymode ()
public subroutine of_saveasbitmap (string as_saveasfilename)
public subroutine of_suppresserrormessages ()
public function integer of_getlasterror ()
public function string of_geterrordetails ()
public subroutine of_refreshcache ()
public function any of_updateprintshort (string as_registrationidtoupdate)
public function any of_updatesingleprint (string as_registrationidtoupdate)
public function any of_updatesingleprintshort (string as_registrationidtoupdate)
public function any of_verifyprint (string as_registrationidtoverify)
public function any of_verifyquick (string as_registrationidtoverify)
public function any of_verifyquicku (string as_registrationidtoverify)
public function any of_verifysingleprint (string as_registrationidtoverify)
public function any of_verifyfingerdata (any aa_fingerdata, integer ai_size)
public function any of_registerprint (string as_registrationid)
public function any of_registerprintshort (string as_registrationidtoadd)
public function any of_registersingleprint (string as_registrationidtoadd)
public function any of_registersingleprintshort (string as_registrationidtoadd)
public function any of_registersingleprintu (string as_registrationid)
public function integer of_getid ()
public function any of_registersingleprintshortu (ref long al_id, character ac_type, long al_registrationid)
public function string of_identifyquick (string as_position)
end prototypes

public function any of_identify ();Any la_return
la_return = ole_bioplugin.object.identify()
return la_return
end function

public function any of_isregistered (string as_registrationid);Any la_return
la_return = ole_bioplugin.object.isregistered(as_registrationid)
return la_return

end function

public function any of_updateprint (string as_registrationid);Any la_return
la_return = ole_bioplugin.object.updateprint(as_registrationid)
return la_return
end function

public function any of_changeid (string as_oldregistrationid, string as_newregistrationid);Any la_return
la_return = ole_bioplugin.object.changeid(as_oldregistrationid, as_newregistrationid)
return la_return
end function

public function any of_startactiveidentification (string as_position);Any la_return
la_return = ole_bioplugin.object.StartActiveIdentification(as_position)
return la_return
end function

public subroutine of_stopactiveidentification ();ole_bioplugin.object.stopactiveidentification()
end subroutine

public function any of_updatesingleprintshortu (string as_registrationid);Any la_return
la_return = ole_bioplugin.object.updatesingleprintshortu(as_registrationid)
return la_return
end function

public function any of_updatesingleprintu (string as_registrationid);Any la_return
la_return = ole_bioplugin.object.updatesingleprintu(as_registrationid)
return la_return
end function

public function any of_deleteprint (string as_registrationid);Any la_return
la_return = ole_bioplugin.object.deleteprint(as_registrationid)
return la_return
end function

public function any of_cancelregistrationrequest ();Any la_return
la_return = ole_bioplugin.object.cancelregistrationrequest()
return la_return
end function

public function any of_capturefingerdata (string as_position);Any la_return
la_return = ole_bioplugin.object.capturefingerdata(as_position)
return la_return
end function

public function any of_getfingerdata ();Any la_return
la_return = ole_bioplugin.object.getfingerdata()
return la_return
end function

public subroutine of_setresult ();
end subroutine

public function boolean of_isclientinstalled ();boolean lb_result
lb_result = ole_bioplugin.object.isclientinstalled()
return lb_result
end function

public function boolean of_isclientrunning ();boolean lb_result
lb_result = ole_bioplugin.object.isclientrunning()
return lb_result
end function

public function string of_getserverinfo ();String ls_result
ls_result = ole_bioplugin.object.getserverinfo()
return ls_result

end function

public subroutine of_setserverinfo (string as_serverinfo, integer ai_port);ole_bioplugin.object.setserverinfo(as_serverinfo,ai_port)
end subroutine

public function any of_getnomatchfoundvalue ();Any la_result
la_result = ole_bioplugin.object.getnomatchfoundvalue()
return la_result
end function

public subroutine of_setnomatchfoundvalue (string as_nomatchfoundvalue);ole_bioplugin.object.setnomatchfoundvalue(as_nomatchfoundvalue)
end subroutine

public function any of_getlocationid ();Any la_result
la_result = ole_bioplugin.object.getlocationid()
return la_result
end function

public subroutine of_setlocationid (string as_locationid);ole_bioplugin.object.setlocationid(as_locationid)
end subroutine

public subroutine of_setdefaultfinger (integer ai_leftfingerid, integer ai_rightfingerid);ole_bioplugin.object.setdefaultfinger(ai_leftfingerid,ai_rightfingerid)
end subroutine

public function any of_getscannerstatus ();Any la_result
la_result = ole_bioplugin.object.of_getscannerstatus()
return la_result
end function

public function any of_getscannercount ();Any la_result
la_result = ole_bioplugin.object.getscannercount()
Return la_result
end function

public function any of_getscannerlist ();Any la_return
la_return = ole_bioplugin.object.getscannerlist()
return la_return
end function

public subroutine of_setimagedisplaymode ();ole_bioplugin.object.setimagedisplaymode()
end subroutine

public subroutine of_saveasbitmap (string as_saveasfilename);ole_bioplugin.object.saveasbitmap(as_saveasfilename)
end subroutine

public subroutine of_suppresserrormessages ();ole_bioplugin.object.suppresserrormessages()
end subroutine

public function integer of_getlasterror ();Integer li_result
if li_result <> 0 then
	li_result = ole_bioplugin.object.getlasterror()
end if
return li_result
end function

public function string of_geterrordetails ();String ls_result
if ls_result <> "" then
	ls_result = ole_bioplugin.object.geterrordetails()
end if
return ls_result
end function

public subroutine of_refreshcache ();ole_bioplugin.object.refreshcache()
end subroutine

public function any of_updateprintshort (string as_registrationidtoupdate);Any la_result
la_result = ole_bioplugin.object.updateprintshort(as_registrationidtoupdate)
return la_result
end function

public function any of_updatesingleprint (string as_registrationidtoupdate);Any la_result
la_result = ole_bioplugin.object.updatesingleprint(as_registrationidtoupdate)
return la_result
end function

public function any of_updatesingleprintshort (string as_registrationidtoupdate);Any la_result
la_result = ole_bioplugin.object.updatesingleprintshort(as_registrationidtoupdate)
Return la_result
end function

public function any of_verifyprint (string as_registrationidtoverify);Any la_result
la_result = ole_bioplugin.object.verifyprint(as_registrationidtoverify)
return la_result
end function

public function any of_verifyquick (string as_registrationidtoverify);Any la_result
la_result = ole_bioplugin.object.verifyquick(as_registrationidtoverify)
return la_result
end function

public function any of_verifyquicku (string as_registrationidtoverify);Any la_result
la_result = ole_bioplugin.object.verifyquicku(as_registrationidtoverify)
return la_result
end function

public function any of_verifysingleprint (string as_registrationidtoverify);Any la_result
la_result = ole_bioplugin.object.verifysingleprint(as_registrationidtoverify)
return la_result
end function

public function any of_verifyfingerdata (any aa_fingerdata, integer ai_size);Any la_result
la_result = ole_bioplugin.object.verifyfingerdata(aa_fingerdata, ai_size)
Return la_result
end function

public function any of_registerprint (string as_registrationid);Any la_return
la_return = ole_bioplugin.object.RegisterPrint(as_registrationid)
return la_return
end function

public function any of_registerprintshort (string as_registrationidtoadd);Any la_result
la_result = ole_bioplugin.object.registerprintshort(as_registrationidtoadd)
return la_result
end function

public function any of_registersingleprint (string as_registrationidtoadd);any la_result
la_result = ole_bioplugin.object.registersingleprint(as_registrationidtoadd)
return la_result
end function

public function any of_registersingleprintshort (string as_registrationidtoadd);Any la_return
la_return = ole_bioplugin.object.registersingleprintshort(as_registrationidtoadd)
return la_return
end function

public function any of_registersingleprintu (string as_registrationid);Any la_return
la_return = ole_bioplugin.object.registersingleprintu(as_registrationid)
return la_return
end function

public function integer of_getid ();return il_id
end function

public function any of_registersingleprintshortu (ref long al_id, character ac_type, long al_registrationid);Any la_return
is_personid = string(al_registrationid)
la_return = ole_bioplugin.object.registersingleprintshortu(is_personid)
il_id = al_id
ic_type = ac_type
return la_return
end function

public function string of_identifyquick (string as_position);String ls_return
ls_return = string(ole_bioplugin.object.IdentifyQuick(as_position))
return ls_return
end function

on pro_u_biometrie.create
int iCurrent
call super::create
this.ole_bioplugin=create ole_bioplugin
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_bioplugin
end on

on pro_u_biometrie.destroy
call super::destroy
destroy(this.ole_bioplugin)
end on

type ole_bioplugin from olecustomcontrol within pro_u_biometrie
event sendresult ( )
event onverify ( )
event ondelete ( )
event onchange ( )
event onidentify ( )
event onregister ( )
event onscannerstatus ( )
event onscan ( )
event onconfiguration ( )
event oncapture ( )
event onerror ( )
integer x = 5
integer y = 4
integer width = 891
integer height = 808
integer taborder = 20
boolean border = false
boolean focusrectangle = false
string binarykey = "pro_u_biometrie.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

event onverify();String ls_result
Integer li_result
ls_result = ole_bioplugin.object.result
if (ls_result = "-1") then
	li_result = ole_bioplugin.object.getlasterror()
	messagebox("Error", string(li_result))
elseif (ls_result = "BADSCAN") then
	MessageBox("BADSCAN","Empreinte de mauvaise qualité")
else
	MessageBox(ls_result,"The fingerprints scanned matched with " + ls_result)
end if
end event

event ondelete();String ls_result
ls_result = ole_bioplugin.object.result
if (ls_result = "-1") then
	MessageBox("-1","Échec de la supression")
end if
end event

event onidentify();String ls_result
Integer li_result
Long ll_iduser, ll_idpatient
ls_result = ole_bioplugin.object.result
if (ls_result = "-1") then
	li_result = ole_bioplugin.object.getlasterror()
	messagebox("Error", string(li_result))
	ole_bioplugin.object.stopactiveidentification()
elseif (ls_result = "000000000") then
//	messagebox("000000000","L'empreinte n'est pas enregistré dans le systèm")
	parent.getparent().triggerevent("of_identificationnotfounderror")
elseif (ls_result = "BADSCAN") then
//	messagebox("BADSCAN","Empreinte de mauvaise qualité")
	parent.getparent().triggerevent("of_identificationerror")
elseif (ls_result = "LICENCE_ERROR") then
	ole_bioplugin.object.stopactiveidentification()
//	messagebox("LICENCE_ERROR","Il y a plus de personnes enregistrées dans le serveur que la licence le permet")
	parent.getparent().triggerevent("of_identificationlicenseerror")
else
	
	SELECT isnull(IDUSER,0), isnull(IDPATIENT,0)
	INTO :ll_iduser, :ll_idpatient
	from PERSON
	WHERE REGISTRATIONNO = :ls_result
	USING SQLCA;
	
	if ll_iduser <> 0 then
		il_id = ll_iduser
	elseif ll_idpatient <> 0 then
		il_id = ll_idpatient
	else
		il_id = 0
	end if
	ole_bioplugin.object.stopactiveidentification()
	parent.getparent().triggerevent("of_identification")
	
	sleep(1)
	
	close(parent.getparent())
end if
end event

event onregister();String ls_result
Integer li_result
ls_result = ole_bioplugin.object.result
if (ls_result = "-1") then
	li_result = ole_bioplugin.object.getlasterror()
	//messagebox("Error", string(li_result))
	parent.getparent().triggerevent("of_registererror")
elseif (ls_result = "0") then
	//MessageBox("Complet","L'enregistrement a été réussi")
	if ic_type = 'p' then
	
	UPDATE PERSON
	SET IDPATIENT = :il_id, STATUSUSER = :ic_type
	WHERE REGISTRATIONNO = :is_personid;
	COMMIT USING SQLCA;
	
	elseif ic_type = 'e' then
		
	UPDATE PERSON
	SET IDUSER = :il_id,  STATUSUSER = :ic_type
	WHERE REGISTRATIONNO = :is_personid;
	COMMIT USING SQLCA;
		
	end if
	
	parent.getparent().triggerevent("of_register")
	
	sleep(1)
	
	close(parent.getparent())
	
else
//	MessageBox(ls_result,"L'empreinte existe déjà dans le système")
	parent.getparent().triggerevent("of_registererror")
end if
end event

event onscannerstatus();String ls_result
ls_result = ole_bioplugin.object.result
if (ls_result = "SCANNER_FOUND") then
//	MessageBox("SCANNER_FOUND","L'instrument d'analyse est prêt")
elseif (ls_result = "NO_SCANNER_FOUND") then
//	MessageBox("NO_SCANNER_FOUND","Empreinte de mauvaise qualité")
end if
end event

event onscan();String ls_result
ls_result = ole_bioplugin.object.result
if (ls_result = "READY") then
//	MessageBox("En attente","L'instrument d'analyse est prêt")
elseif (ls_result = "BADSCAN") then
//	MessageBox("BADSCAN","Empreinte de mauvaise qualité")
elseif (ls_result = "-1") then
//	MessageBox("-1","Recommencer l'analyse de l'empreinte")
end if

end event

event onerror();Integer li_error
String ls_error
li_error = ole_bioplugin.object.getlasterror()
ls_error = ole_bioplugin.object.geterrordetails()
MessageBox(string(li_error),ls_error)
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Bpro_u_biometrie.bin 
2C00000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000035c932c001c9b6af00000003000001400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000d400000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff0000000305e8280c494fd45a0a8442aeff4a44400000000035c932c001c9b6af35c932c001c9b6af000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000040000001000000000000000010000000200000003fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe0002010505e8280c494fd45a0a8442aeff4a444000000001fb8f0821101b01640008ed8413c72e2b00000030000000a400000005000001000000003000000101000000380000010200000040000001030000004800000000000000500000000300010000000000030000142700000003000014e100000003000000000000000500000000000000010001030000000c0074735f00706b636f73706f72000101000000090078655f00746e65740102007800090000655f00006e65747800007974090000015f00000073726576006e6f6900640065006f006c0067006e00680020006c006500630070006e006f00650074007400780020002c006500720001000000001427000014e100000000006f00690061006e00740063006f00690020006e0063006100690074006e006f0020002c0065007200200066006e0061002000790065007200750074006e0072006100760075006c00200065002000290065007200750074006e007200200073006e0028006e006f00290065000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Bpro_u_biometrie.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
