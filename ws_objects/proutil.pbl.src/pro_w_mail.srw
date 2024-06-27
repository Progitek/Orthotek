$PBExportHeader$pro_w_mail.srw
forward
global type pro_w_mail from w_response
end type
type pb_del from u_pb within pro_w_mail
end type
type st_1 from u_st within pro_w_mail
end type
type sle_from from u_sle within pro_w_mail
end type
type cbx_sendhtml from checkbox within pro_w_mail
end type
type cbx_receipt from checkbox within pro_w_mail
end type
type sle_to from u_sle within pro_w_mail
end type
type uo_toolbar from u_cst_toolbarstrip within pro_w_mail
end type
type uo_toolbar2 from u_cst_toolbarstrip within pro_w_mail
end type
type st_attachement from u_st within pro_w_mail
end type
type pb_add from u_pb within pro_w_mail
end type
type mle_message from u_mle within pro_w_mail
end type
type sle_subject from u_sle within pro_w_mail
end type
type st_subject from u_st within pro_w_mail
end type
type st_dest from u_st within pro_w_mail
end type
type cb_annuler from u_cb within pro_w_mail
end type
type cb_envoyer from u_cb within pro_w_mail
end type
type lb_attachements from u_lb within pro_w_mail
end type
end forward

global type pro_w_mail from w_response
integer x = 214
integer y = 221
integer width = 2789
integer height = 2012
string title = "Contacter le support technique"
long backcolor = 15780518
boolean center = true
event type integer ue_sendmail ( )
pb_del pb_del
st_1 st_1
sle_from sle_from
cbx_sendhtml cbx_sendhtml
cbx_receipt cbx_receipt
sle_to sle_to
uo_toolbar uo_toolbar
uo_toolbar2 uo_toolbar2
st_attachement st_attachement
pb_add pb_add
mle_message mle_message
sle_subject sle_subject
st_subject st_subject
st_dest st_dest
cb_annuler cb_annuler
cb_envoyer cb_envoyer
lb_attachements lb_attachements
end type
global pro_w_mail pro_w_mail

type variables
private long il_idcont[]
private long il_indcont
private boolean change = false
private int ii_typeimp

str_mail ist_mail
long il_patid
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_addattachement (string as_filename)
end prototypes

event type integer ue_sendmail();string ls_commandline, ls_body, ls_filename, ls_tab[], ls_nomemail, ls_nomordi, ls_nomreel
integer li_max, li_idx
long ll_confirmenvoi

If sle_to.text = "" Then
	MessageBox("Avertissement", "Un destinataire est nécessaire pour envoyer un courriel")
	Return -2
End If


If sle_from.text = "" Then
	MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
	Return -3
End If

If sle_subject.text = "" Then
	MessageBox("Avertissement", "Un sujet est nécessaire pour envoyer un courriel")
	Return -4
End If

If mle_message.text = "" Then
	MessageBox("Avertissement", "Un message est nécessaire pour envoyer un courriel")
	Return -5
End If

ls_body = "<html>"
ls_body +="<head></head></html>"
ls_body +="<body><PRE>"+mle_message.text+"</PRE></body>"
ls_body +="</html>"
	
// add any attachments
li_max = lb_attachements.TotalItems()
For li_idx = 1 To li_max
	ls_tab[li_idx] = lb_attachements.Text(li_idx)
Next
ls_filename = unsplit(ls_tab,';')
ls_filename = rep(ls_filename,'\','\\')

select isnull(cie,dr_nom_complet) into :ls_nomemail from ortho_id where ortho_id = :v_no_ortho;
ls_nomordi = gnv_app.of_obtenir_nom_ordinateur( )

select confirmenvoi into :ll_confirmenvoi from t_options where ortho_id = :v_no_ortho;
if ll_confirmenvoi = 1 then sle_to.text = sle_from.text + ";" + sle_to.text

ls_nomreel = ist_mail.as_destinataire
if isnull(ls_nomreel) then ls_nomreel = "Inconnu"

if ist_mail.as_idforeignkey = "" then ist_mail.as_idforeignkey = 'P' + + string(il_patid)

insert into t_message(dateenvoye, priorite, message_de, message_a, sujet, message_texte, fichier_attache, source, statut,
                      statut_lu, statut_affiche, typemessagerie, couleur, email, envoyer, sms, nomemail, id_user, nomordinateur, nomreel, idforeignkey)
values(now(), 0, :sle_from.text, :sle_to.text, :sle_subject.text, :ls_body, :ls_filename, 'e', 'a', 'o','o', 'U', 15780518, 1, 0, 0, :ls_nomemail, :gl_idpers,:ls_nomordi, :ls_nomreel,:ist_mail.as_idforeignkey);
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

return 0



end event

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)
uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)
uo_toolbar.of_AddItem("OK", "C:\ii4net\orthotek\images\ok.gif")

if gnv_app.of_getlangue() = 'an' then
	st_dest.text = "To:"
	st_subject.text = "Subject:"
	st_attachement.text = "Attachment:"
	uo_toolbar2.of_AddItem("Cancel", "C:\ii4net\orthotek\images\annuler.gif")
	THIS.title = "Technical support"
ELSE
	uo_toolbar2.of_AddItem("Annuler", "C:\ii4net\orthotek\images\annuler.gif")
END IF

uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)

end subroutine

public subroutine of_addattachement (string as_filename);String ls_pathname, ls_filename, ls_filter, ls_fname[], ls_attachement, ls_corrpath, ls_msg
Integer li_rc,i
long ll_patid

if as_filename = "" then
	ls_filter = "All files,*.*"
	
	li_rc = GetFileOpenName("Select File to Attach", ls_pathname, ls_filename, "", ls_filter)

	If li_rc = 1 Then
		
		ls_filename = rep(ls_filename,' ','')
		
		select isnull(corrpath,'') into :ls_corrpath from t_options where ortho_id = :v_no_ortho;
		if not isnull(il_patid) then
			if not  DirectoryExists(ls_corrpath + "\" + string(il_patid)) then createdirectory(ls_corrpath + "\" + string(il_patid))
			ls_attachement = ls_corrpath + "\" + string(il_patid) + "\" + ls_filename
		else
			if not  DirectoryExists(ls_corrpath + "\divers") then createdirectory(ls_corrpath + "\divers")
			ls_attachement = ls_corrpath + "\divers\" + ls_filename
		end if
		
		if FileExists(ls_attachement) then
			if gnv_app.of_getlangue() = 'an' then
				ls_msg = "This attachment already exists, do you want to do a copy where name will be changed by unique or do you prefered to change it yourself?"
			else
				ls_msg = "Cette pièce jointe existe déjà, Désirez-vous effectuer une copie où le nom sera modifié par un nom unique ou le changer vous-même?"
			end if
			if messagebox("Question!",ls_msg,Question!,YesNo!,2) = 1 then
				if not isnull(il_patid) then
					ls_attachement = ls_corrpath + "\" + string(il_patid) + "\" + string(now(),"dd-mm-yyyy-hh-mm-ss") + "." + right(ls_filename,3)
					if FileCopy(ls_pathname, ls_attachement) = 1 then
						lb_attachements.AddItem(ls_attachement)
					end if
				else
					ls_attachement = ls_corrpath + "\divers\" + string(now(),"dd-mm-yyyy-hh-mm-ss") + "." + right(ls_filename,3)
					if FileCopy(ls_pathname, ls_attachement) = 1 then
						lb_attachements.AddItem(ls_attachement)
					end if
				end if
			end if
		else
			if FileCopy(ls_pathname, ls_attachement) = 1 then
				lb_attachements.AddItem(ls_attachement)
			end if
		end if
	End If
	
else
	//lb_attachements.of_AddItem(as_filename)
	ls_fname = split(as_filename,';')
	for i = 1 to Upperbound(ls_fname)
		if fileExists(ls_fname[i]) then
			lb_attachements.AddItem(ls_fname[i])
		else
			Messagebox("Avertissement","Le fichier en pièce jointe n'existe pas ! ~n " + ls_fname[i])
		end if
	next
end if




end subroutine

on pro_w_mail.create
int iCurrent
call super::create
this.pb_del=create pb_del
this.st_1=create st_1
this.sle_from=create sle_from
this.cbx_sendhtml=create cbx_sendhtml
this.cbx_receipt=create cbx_receipt
this.sle_to=create sle_to
this.uo_toolbar=create uo_toolbar
this.uo_toolbar2=create uo_toolbar2
this.st_attachement=create st_attachement
this.pb_add=create pb_add
this.mle_message=create mle_message
this.sle_subject=create sle_subject
this.st_subject=create st_subject
this.st_dest=create st_dest
this.cb_annuler=create cb_annuler
this.cb_envoyer=create cb_envoyer
this.lb_attachements=create lb_attachements
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_del
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_from
this.Control[iCurrent+4]=this.cbx_sendhtml
this.Control[iCurrent+5]=this.cbx_receipt
this.Control[iCurrent+6]=this.sle_to
this.Control[iCurrent+7]=this.uo_toolbar
this.Control[iCurrent+8]=this.uo_toolbar2
this.Control[iCurrent+9]=this.st_attachement
this.Control[iCurrent+10]=this.pb_add
this.Control[iCurrent+11]=this.mle_message
this.Control[iCurrent+12]=this.sle_subject
this.Control[iCurrent+13]=this.st_subject
this.Control[iCurrent+14]=this.st_dest
this.Control[iCurrent+15]=this.cb_annuler
this.Control[iCurrent+16]=this.cb_envoyer
this.Control[iCurrent+17]=this.lb_attachements
end on

on pro_w_mail.destroy
call super::destroy
destroy(this.pb_del)
destroy(this.st_1)
destroy(this.sle_from)
destroy(this.cbx_sendhtml)
destroy(this.cbx_receipt)
destroy(this.sle_to)
destroy(this.uo_toolbar)
destroy(this.uo_toolbar2)
destroy(this.st_attachement)
destroy(this.pb_add)
destroy(this.mle_message)
destroy(this.sle_subject)
destroy(this.st_subject)
destroy(this.st_dest)
destroy(this.cb_annuler)
destroy(this.cb_envoyer)
destroy(this.lb_attachements)
end on

event open;call super::open;long ll_idpers
string ls_courriel

sle_to.text = ist_mail.as_destinataire
sle_subject.text = ist_mail.as_sujet
sle_from.text = ist_mail.as_expediteur
//sle_attachment.text = ist_mail.as_attachment
if ist_mail.as_attachment <> "" then of_addattachement(ist_mail.as_attachment)
mle_message.text  = ist_mail.as_message
ii_typeimp = ist_mail.ai_typeimp


// On place les informations de supplémentaire

ll_idpers = gl_idpers
select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :ll_idpers;
sle_from.text = ls_courriel


end event

event pfc_preopen;call super::pfc_preopen;ist_mail = message.powerobjectparm
il_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientpourpiecejointe"))
end event

type pb_del from u_pb within pro_w_mail
integer x = 2638
integer y = 432
integer width = 128
integer height = 112
integer taborder = 40
string text = ""
boolean originalsize = false
string picturename = "C:\ii4net\orthotek\images\stop.gif"
end type

event clicked;call super::clicked;Integer li_row

li_row = lb_attachements.SelectedIndex()
If li_row > 0 Then
	lb_attachements.DeleteItem(li_row)
End If

end event

type st_1 from u_st within pro_w_mail
integer x = 32
integer y = 124
integer width = 370
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Expéditeur: "
end type

type sle_from from u_sle within pro_w_mail
integer x = 402
integer y = 124
integer width = 2354
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean ib_rmbmenu = false
end type

type cbx_sendhtml from checkbox within pro_w_mail
integer x = 1445
integer y = 1824
integer width = 791
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Envoyé message comme HTML"
end type

type cbx_receipt from checkbox within pro_w_mail
integer x = 549
integer y = 1824
integer width = 878
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Demande confirmation de reception"
end type

type sle_to from u_sle within pro_w_mail
integer x = 402
integer y = 40
integer width = 2354
integer height = 84
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean ib_rmbmenu = false
end type

type uo_toolbar from u_cst_toolbarstrip within pro_w_mail
integer x = 27
integer y = 1816
integer width = 507
integer taborder = 60
end type

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_envoyer.event clicked( )
end event

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

type uo_toolbar2 from u_cst_toolbarstrip within pro_w_mail
integer x = 2249
integer y = 1816
integer width = 507
integer taborder = 60
end type

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_annuler.event clicked( )
end event

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

type st_attachement from u_st within pro_w_mail
integer x = 32
integer y = 328
integer width = 361
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Pièce jointe: "
end type

type pb_add from u_pb within pro_w_mail
integer x = 2638
integer y = 328
integer width = 119
integer height = 104
integer taborder = 40
string text = ""
string picturename = "C:\ii4net\orthotek\images\ajout.jpg"
end type

event clicked;call super::clicked;of_addattachement("")
//string ls_path, ls_name[]
//
//getFileOpenName("Fichier en attachement",ls_path,ls_name[], getCurrentDirectory())
//sle_attachment.text = ls_path
end event

type mle_message from u_mle within pro_w_mail
integer x = 27
integer y = 616
integer width = 2729
integer height = 1184
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type sle_subject from u_sle within pro_w_mail
integer x = 402
integer y = 236
integer width = 2354
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean ib_rmbmenu = false
end type

type st_subject from u_st within pro_w_mail
integer x = 32
integer y = 236
integer width = 343
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Sujet: "
end type

type st_dest from u_st within pro_w_mail
integer x = 32
integer y = 40
integer width = 370
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Destinataire: "
end type

type cb_annuler from u_cb within pro_w_mail
boolean visible = false
integer x = 27
integer y = 1972
integer width = 562
integer height = 112
integer taborder = 0
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Annuler"
boolean cancel = true
end type

event clicked;call super::clicked;close(parent)
end event

type cb_envoyer from u_cb within pro_w_mail
boolean visible = false
integer x = 2185
integer y = 1976
integer width = 562
integer height = 112
integer taborder = 0
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Envoyer"
end type

event clicked;call super::clicked;if parent.event ue_sendmail() = 0 then
	close(parent)
end if
end event

type lb_attachements from u_lb within pro_w_mail
integer x = 402
integer y = 328
integer width = 2226
integer height = 264
integer taborder = 50
end type

