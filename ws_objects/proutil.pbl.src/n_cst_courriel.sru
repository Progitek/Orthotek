$PBExportHeader$n_cst_courriel.sru
forward
global type n_cst_courriel from n_base
end type
end forward

global type n_cst_courriel from n_base
end type
global n_cst_courriel n_cst_courriel

forward prototypes
public function integer of_envoicourriel (string as_attachement, string as_sujet, string as_message, string as_destinataire[])
public function string of_creerattachement (datastore auo_recu, long al_patid)
end prototypes

public function integer of_envoicourriel (string as_attachement, string as_sujet, string as_message, string as_destinataire[]);mailSession  mSes
mailReturnCode mRet
mailMessage  mMsg
mailFileDescription mAttach
long i = 1
string ls_recept[], ls_chaine

mSes = CREATE mailSession

mRet = mSes.mailLogon(mailNewSession!)
IF mRet <> mailReturnSuccess! THEN
	 MessageBox ("Erreur", 'Il est impossible de se connecter au serveur MAPI')
	 RETURN -1
END IF

mattach.filetype = mailAttach!
mattach.Filename = as_attachement
mattach.Pathname = as_attachement
mMsg.AttachmentFile[1] = mAttach
mMsg.subject = as_sujet
mMsg.notetext = as_message

// ON place en ordre les destinataires

//if il_indcont <> 0 then
//
//	select adresse into :ls_chaine from t_contactmail where id_contact = :il_idcont[il_indcont];

for i = 1 to upperbound(as_destinataire)
	mMsg.recipient[i].name = as_destinataire[i]
	mmsg.recipient[i].address = as_destinataire[i]
next
//	
//else
	
//	mMsg.recipient[1].name = ddlb_dest.text
//	mmsg.recipient[1].address = ddlb_dest.text
	
//end if
// On envoie le courrier

IF mRet <> mailReturnSuccess! THEN
	RETURN -1
END IF

mRet = mSes.mailSend(mMsg)

IF mRet <> mailReturnSuccess! THEN
	choose case mret
		case mailReturnFailure!
				  MessageBox ("mailReturnFailure",'')
		case mailReturnInsufficientMemory!
				  MessageBox ("mailReturnInsufficientMemory",'')
		case mailReturnUserAbort!
				  MessageBox ("mailReturnUserAbort", '')
		case mailReturnDiskFull!
				  MessageBox ("mailReturnDiskFull", '')
		case mailReturnTooManySessions!
				  MessageBox ("mailReturnTooManySessions", '')
		case mailReturnTooManyFiles!
				  MessageBox ("mailReturnTooManyFiles!", '')
		case mailReturnTooManyRecipients!
				  MessageBox ("mailReturnTooManyRecipients", '')
		case mailReturnUnknownRecipient!
				  MessageBox ("mailReturnUnknownRecipient", '')
		case mailReturnAttachmentNotFound!
				  MessageBox ("mailReturnAttachmentNotFound",'')
		case    else
				  MessageBox ("Mail", '')
 	end choose
	RETURN -1
END IF
mSes.mailLogoff()
DESTROY mSes
return 0

end function

public function string of_creerattachement (datastore auo_recu, long al_patid);string ls_oldprinter, ls_allprinter, ls_printerlist[], ls_newprinter, ls_corrpath, ls_filename
long i = 1

select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;

if FileExists("c:\ii4net\orthotek\rapports\rapportorthotek.pdf") then FileDelete("c:\ii4net\orthotek\rapports\rapportorthotek.pdf")
ls_oldprinter = PrintGetPrinter ( )
ls_allprinter = PrintGetPrinters ( )
ls_printerlist = split(ls_allprinter,"~n")
for i = 1 to upperbound(ls_printerlist)
	if left(upper(ls_printerlist[i]),10) = "PDFCREATOR" then
		ls_newprinter = ls_printerlist[i]
	end if
next
PrintSetPrinter ( ls_newprinter )
auo_recu.print()
PrintSetPrinter ( ls_oldprinter )
DO WHILE NOT FileExists("c:\ii4net\orthotek\rapports\rapportorthotek.pdf") and i <= 10
	i++
	sleep(1)
LOOP

if not  DirectoryExists(ls_corrpath + "\" + string(al_patid)) then createdirectory(ls_corrpath + "\" + string(al_patid))
ls_filename = ls_corrpath + "\" + string(al_patid) + "\recu-" + string(today(),"dd-mm-yyyy") + ".pdf"
if FileCopy("c:\ii4net\orthotek\rapports\rapportorthotek.pdf",ls_filename,true) = 1 then
	FileDelete("c:\ii4net\orthotek\rapports\rapportorthotek.pdf")
	return ls_filename
else
	return ""
end if
end function

on n_cst_courriel.create
call super::create
end on

on n_cst_courriel.destroy
call super::destroy
end on

