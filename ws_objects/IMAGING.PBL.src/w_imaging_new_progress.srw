$PBExportHeader$w_imaging_new_progress.srw
forward
global type w_imaging_new_progress from window
end type
type st_ve from statictext within w_imaging_new_progress
end type
type uo_toolbar from u_cst_toolbarstrip within w_imaging_new_progress
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_imaging_new_progress
end type
type sle_nom from singlelineedit within w_imaging_new_progress
end type
type cb_annuler from commandbutton within w_imaging_new_progress
end type
type cb_ok from commandbutton within w_imaging_new_progress
end type
type rb_progress from radiobutton within w_imaging_new_progress
end type
type rb_final from radiobutton within w_imaging_new_progress
end type
type rr_1 from roundrectangle within w_imaging_new_progress
end type
end forward

global type w_imaging_new_progress from window
integer width = 1431
integer height = 644
boolean titlebar = true
string title = "Étape"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 15793151
string icon = "AppIcon!"
boolean center = true
st_ve st_ve
uo_toolbar uo_toolbar
uo_toolbar2 uo_toolbar2
sle_nom sle_nom
cb_annuler cb_annuler
cb_ok cb_ok
rb_progress rb_progress
rb_final rb_final
rr_1 rr_1
end type
global w_imaging_new_progress w_imaging_new_progress

type variables
private:

long il_progressid
long il_current_progress
end variables

on w_imaging_new_progress.create
this.st_ve=create st_ve
this.uo_toolbar=create uo_toolbar
this.uo_toolbar2=create uo_toolbar2
this.sle_nom=create sle_nom
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.rb_progress=create rb_progress
this.rb_final=create rb_final
this.rr_1=create rr_1
this.Control[]={this.st_ve,&
this.uo_toolbar,&
this.uo_toolbar2,&
this.sle_nom,&
this.cb_annuler,&
this.cb_ok,&
this.rb_progress,&
this.rb_final,&
this.rr_1}
end on

on w_imaging_new_progress.destroy
destroy(this.st_ve)
destroy(this.uo_toolbar)
destroy(this.uo_toolbar2)
destroy(this.sle_nom)
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.rb_progress)
destroy(this.rb_final)
destroy(this.rr_1)
end on

event open;long ll_transfert

il_progressid = message.doubleparm

ll_transfert = long(gnv_app.inv_entrepotglobal.of_retournedonnee("Imagerie Transfert Etape"))
if isNull(ll_transfert) then ll_transfert = 0

if ll_transfert = 1 then
	il_current_progress = il_progressid
	
	select nomseq
	  into :sle_nom.text
	  from t_sequence
	 where patient_id = :w_imaging.il_patid
		and sequence = :il_current_progress;
	
	if il_current_progress = 99 then
		select max(sequence) + 1 into :il_progressid
		from t_sequence
		where patient_id = :w_imaging.il_patid and sequence < 99;
		
		rb_final.checked = true
//		rb_progress.checked = false
	end if
else
	il_current_progress = 0
end if

uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)

uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)

if gs_langue = "an" THEN
	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Cancel", "C:\ii4net\imgpro\annuler.gif")
	
	st_ve.text = "Pleasse specify step"
	
	rb_progress.text = "Progress " + string(il_progressid)
	
ELSE
	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Annuler", "C:\ii4net\imgpro\annuler.gif")
	
	rb_progress.text = "Étape " + string(il_progressid)
END IF

uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)
end event

type st_ve from statictext within w_imaging_new_progress
integer x = 101
integer y = 76
integer width = 649
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Veuillez spécifier l~'étape:"
boolean focusrectangle = false
end type

type uo_toolbar from u_cst_toolbarstrip within w_imaging_new_progress
event destroy ( )
string tag = "resize=n"
integer x = 41
integer y = 420
integer width = 507
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_ok.event clicked( )
end event

type uo_toolbar2 from u_cst_toolbarstrip within w_imaging_new_progress
event destroy ( )
string tag = "resize=n"
integer x = 878
integer y = 420
integer width = 507
integer taborder = 20
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_annuler.event clicked( )
end event

type sle_nom from singlelineedit within w_imaging_new_progress
integer x = 635
integer y = 164
integer width = 658
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_annuler from commandbutton within w_imaging_new_progress
boolean visible = false
integer x = 741
integer y = 928
integer width = 526
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
end type

event clicked;close(w_imaging_new_progress)
end event

type cb_ok from commandbutton within w_imaging_new_progress
boolean visible = false
integer x = 114
integer y = 928
integer width = 526
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
boolean default = true
end type

event clicked;string ls_nom

ls_nom = sle_nom.text

if rb_progress.checked then
	if isnull(ls_nom) or ls_nom = "" then
		IF gs_langue = "an" THEN
			messagebox("Warning","You must specify step.",Information!,Ok!)
		ELSE
			messagebox("Avertissement","Vous devez entrer le nom d'étape",Information!,Ok!)
		END IF
		return
	end if
else
	il_progressid = 99
	ls_nom = 'Final'
end if

if il_current_progress > 0 then
	update t_sequence
		set sequence = :il_progressid,
			 nomseq = :ls_nom
	 where patient_id = :w_imaging.il_patid
		and sequence = :il_current_progress;
	if gf_sqlerr() then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	
	update t_imagerie
		set sequence = :il_progressid
	 where patient_id = :w_imaging.il_patid
		and sequence = :il_current_progress;
	if gf_sqlerr() then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	
	if il_current_progress <> il_progressid then
		gnv_app.inv_filesrv.of_filerename(w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_current_progress)+ "\", w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid)+ "\")
	end if
else
	insert into t_sequence(patient_id,sequence,nomseq) values(:w_imaging.il_patid,:il_progressid,:ls_nom);
	if gf_sqlerr() then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	gnv_app.inv_filesrv.of_createdirectory(w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid)+ "\")
	gnv_app.inv_filesrv.of_createdirectory(w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid)+ "\small")
	gnv_app.inv_filesrv.of_createdirectory(w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid)+ "\original")
end if

w_imaging.il_progressid = il_progressid
// reconstruire la liste
w_imaging.ddlb_1.event ue_setlist(ls_nom);
// reconstruire le montage
w_imaging.uf_montage()
close(w_imaging_new_progress)
end event

type rb_progress from radiobutton within w_imaging_new_progress
integer x = 101
integer y = 164
integer width = 494
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Étape"
boolean checked = true
end type

type rb_final from radiobutton within w_imaging_new_progress
integer x = 101
integer y = 264
integer width = 494
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Final"
end type

type rr_1 from roundrectangle within w_imaging_new_progress
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 37
integer y = 24
integer width = 1358
integer height = 356
integer cornerheight = 40
integer cornerwidth = 46
end type

