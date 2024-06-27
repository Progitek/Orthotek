$PBExportHeader$w_ftpbackup.srw
forward
global type w_ftpbackup from w_child
end type
type cb_1 from commandbutton within w_ftpbackup
end type
type dw_ftpbackup from u_dw within w_ftpbackup
end type
type hpb_total from hprogressbar within w_ftpbackup
end type
type st_status from statictext within w_ftpbackup
end type
type st_title from statictext within w_ftpbackup
end type
type st_1 from statictext within w_ftpbackup
end type
type cb_update from commandbutton within w_ftpbackup
end type
type cb_close from commandbutton within w_ftpbackup
end type
end forward

global type w_ftpbackup from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
cb_1 cb_1
dw_ftpbackup dw_ftpbackup
hpb_total hpb_total
st_status st_status
st_title st_title
st_1 st_1
cb_update cb_update
cb_close cb_close
end type
global w_ftpbackup w_ftpbackup

type variables
Private pfc_n_cst_filesrvwin32 io_file
Private u_ftp uo_ftpobj

//Private String sProgressMessage
//Private Double dTransferedFileSize = 0

//Private string is_ftpservername, is_ftpusername, is_ftppassword, is_ftpuploadpath
end variables

forward prototypes
public subroutine ftpfiles ()
public subroutine ftpliredossier (string dossier)
public subroutine ftplirefichier (string fichier)
public subroutine envoi (string liste[])
end prototypes

public subroutine ftpfiles ();string ls_dossier
long ll_count

SELECT Count(*) INTO :ll_count FROM t_ftpfiles;
UPDATE t_ftpfiles set statut = 'D';

commit using SQLCA;

hpb_total.SetRange(0, ll_count)
hpb_total.MaxPosition = ll_count

DECLARE curDos CURSOR FOR
	SELECT folder FROM t_ftpbackfldr;

OPEN curDos;

FETCH curDos INTO :ls_dossier;

do while SQLCA.SQLCode = 0
	if right(ls_dossier, 1) = '\' then ls_dossier = left(ls_dossier,len(ls_dossier)-1)
	ftpliredossier(ls_dossier)
	
	FETCH curDos INTO :ls_dossier;
loop

CLOSE curDos;
end subroutine

public subroutine ftpliredossier (string dossier);integer i
long ll_nb
n_cst_dirattrib lo_dirList[]
n_cst_dirattrib lo_empty[]
boolean lb_rdo, lb_hid, lb_system, lb_subdir, lb_archive 

if DirectoryExists(dossier) then
	io_file.of_getFileAttributes(dossier, lb_rdo, lb_hid, lb_system, lb_subdir, lb_archive)
	if not (lb_hid or lb_system) then
		//Pour chaque sous-dossier
		lo_dirList = lo_empty
		ll_nb = io_file.of_dirList(dossier + "\*", 32784, lo_dirList)
		For i = 2 To ll_nb
			//Rappeler récursivement cette fonction
			ftpliredossier(dossier + "\" + mid(lo_dirList[i].is_FileName, 2, len(lo_dirList[i].is_FileName) - 2))
		Next
		
		//Pour chacun des fichiers dans ce dossier
		lo_dirList = lo_empty
		ll_nb = io_file.of_dirList(dossier + "\*", 33, lo_dirList)
		For i = 1 To ll_nb
			//Traiter le fichier
			if left(lo_dirList[i].is_FileName, 1) <> '[' then
				ftplirefichier(dossier + "\" + lo_dirList[i].is_FileName)
			end if
		Next
	end if
else
	messagebox("Erreur","Le dossier ~"" + dossier + "~" n'existe pas.")
end if
end subroutine

public subroutine ftplirefichier (string fichier);date ldt_date
time ldt_time
datetime ldt_mod
datetime ldt_datetable
boolean lb_rdo, lb_hid, lb_system, lb_subdir, lb_archive 

if fileExists(fichier) then
	io_file.of_getFileAttributes(fichier, lb_rdo, lb_hid, lb_system, lb_subdir, lb_archive)
	if not (lb_hid or lb_system) then
		if io_file.of_getlastwritedatetime(fichier, ldt_date, ldt_time) = 1 then
			setPointer(Hourglass!)
			ldt_mod = datetime(ldt_date, ldt_time)
			SELECT MAX(moddate) INTO :ldt_datetable FROM t_ftpfiles WHERE filename = :fichier;
			
			if isNull(ldt_datetable) or ldt_datetable = datetime(date('1900-01-01'),time('00:00:00:00')) then
				INSERT INTO t_ftpfiles (filename, moddate, statut)
				VALUES (:fichier, :ldt_mod, 'N');
			elseif ldt_mod <> ldt_datetable then
				UPDATE t_ftpfiles SET moddate = :ldt_mod, statut = 'M'
				WHERE filename = :fichier;
			else
				UPDATE t_ftpfiles SET statut = 'E'
				WHERE filename = :fichier;
			end if
			setPointer(Arrow!)
			
			if hpb_total.Position <= hpb_total.maxPosition then
				hpb_total.Position++
			end if
		end if
	end if
else
	messagebox("Erreur","Le fichier ~"" + fichier + "~" n'existe pas.")	
end if
end subroutine

public subroutine envoi (string liste[]);//Envoi de fichiers
long i

for i = 1 to upperbound(liste)
	// Connect
	uo_ftpobj.of_connect()
	
	if uo_ftpobj.ulfichier(liste[i]) then
		UPDATE t_ftpfiles SET statut = 'E' WHERE filename = :liste[i];
		COMMIT USING SQLCA;
	end if
	
	// Clean up
	uo_ftpobj.of_disconnect()
next

end subroutine

on w_ftpbackup.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_ftpbackup=create dw_ftpbackup
this.hpb_total=create hpb_total
this.st_status=create st_status
this.st_title=create st_title
this.st_1=create st_1
this.cb_update=create cb_update
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_ftpbackup
this.Control[iCurrent+3]=this.hpb_total
this.Control[iCurrent+4]=this.st_status
this.Control[iCurrent+5]=this.st_title
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_update
this.Control[iCurrent+8]=this.cb_close
end on

on w_ftpbackup.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_ftpbackup)
destroy(this.hpb_total)
destroy(this.st_status)
destroy(this.st_title)
destroy(this.st_1)
destroy(this.cb_update)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

io_file = Create pfc_n_cst_filesrvwin32
uo_ftpobj = Create u_ftp

select ftpservername, ftpusername, ftppassword, ftpuploadpath 
into :uo_ftpobj.is_servername, :uo_ftpobj.is_ftpusername, :uo_ftpobj.is_ftppassword, :uo_ftpobj.sRemoteUploadPath
from t_backup;
end event

event close;Destroy uo_ftpobj
Destroy io_file
end event

type cb_1 from commandbutton within w_ftpbackup
integer x = 3259
integer y = 1796
integer width = 361
integer height = 68
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "List"
end type

event clicked;ftpfiles()
dw_ftpbackup.retrieve()
end event

type dw_ftpbackup from u_dw within w_ftpbackup
integer y = 88
integer width = 3602
integer height = 1704
integer taborder = 10
string dataobject = "d_ftpackup"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve()
end event

event clicked;choose case dwo.name
	case 'filename_t'
		this.setsort("filename A")
		this.sort()
	case 'moddate_t'
		this.setsort("moddate A")
		this.sort()
	case 'statut_t'
		this.setsort("statut A")
		this.sort()
end choose
end event

type hpb_total from hprogressbar within w_ftpbackup
integer x = 18
integer y = 1872
integer width = 3598
integer height = 48
unsignedinteger maxposition = 100
integer setstep = 10
end type

type st_status from statictext within w_ftpbackup
integer x = 18
integer y = 1932
integer width = 2693
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_title from statictext within w_ftpbackup
integer width = 3602
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "FTP Backup"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ftpbackup
integer x = 18
integer y = 1800
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total progress"
boolean focusrectangle = false
end type

type cb_update from commandbutton within w_ftpbackup
integer x = 2715
integer y = 1924
integer width = 544
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Send Backup"
end type

event clicked;string ls_fich, ls_fichUL[], ls_fichDel[]
long ll_countUL = 0, ll_countDel = 0
char lc_st

If Text <> "Done" Then
	if dw_ftpbackup.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if

	Text = "Done"

	Enabled = false

	DECLARE curFich CURSOR FOR
	SELECT filename, statut FROM t_ftpfiles;
	
	OPEN curFich;
	
	FETCH curFich INTO :ls_fich, :lc_st;
	
	do while SQLCA.SQLCode = 0
		if lc_st = 'N' or lc_st = 'M' then
			ll_countUL++
			ls_fichUL[ll_countUL] = ls_fich
//		elseif lc_st = 'D' then
//			ll_countDel++
//			ls_fichDel[ll_countDel] = ls_fich
		end if
		
		FETCH curFich INTO :ls_fich, :lc_st;
	loop
	
	CLOSE curFich;
	
	// Envoi des fichiers
	envoi(ls_fichUL)
	
	Enabled = true

Else
	Close(Parent)
End If

end event

type cb_close from commandbutton within w_ftpbackup
integer x = 3259
integer y = 1924
integer width = 361
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;Close(Parent)
end event

