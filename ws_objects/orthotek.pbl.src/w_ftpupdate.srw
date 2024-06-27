$PBExportHeader$w_ftpupdate.srw
forward
global type w_ftpupdate from window
end type
type p_2 from picture within w_ftpupdate
end type
type p_1 from picture within w_ftpupdate
end type
type hpb_total from hprogressbar within w_ftpupdate
end type
type lb_1 from listbox within w_ftpupdate
end type
type st_status from statictext within w_ftpupdate
end type
type st_title from statictext within w_ftpupdate
end type
type st_flood from statictext within w_ftpupdate
end type
type st_1 from statictext within w_ftpupdate
end type
end forward

global type w_ftpupdate from window
integer width = 2743
integer height = 1880
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_post_open ( )
p_2 p_2
p_1 p_1
hpb_total hpb_total
lb_1 lb_1
st_status st_status
st_title st_title
st_flood st_flood
st_1 st_1
end type
global w_ftpupdate w_ftpupdate

type variables
Private u_ftp uo_ftp
Private String sProgressMessage
Private Double dTransferedFileSize = 0
Private Double dTotalSize = 0
end variables

forward prototypes
public subroutine floodhide ()
public subroutine floodupdatetextpc (double upperlimit, double progress)
public subroutine floodshowtransferresult (boolean success, string sfile, double filesize)
public subroutine resetstuff ()
public subroutine floodshowconnectaction (string sconnectmsg)
public function string parsefilefromlist (string sselection)
public subroutine flooddisplay (double upperlimit, string floodmessage)
public subroutine totaldisplay (double upperlimit)
end prototypes

event ue_post_open();string ls_vide[]

//Connect
if uo_ftp.of_connect("", "C:\ii4net\") <> 0 then

	totalDisplay(uo_ftp.totalSize({"/orthotek/update/"}, ls_vide))
	uo_ftp.dl({"/orthotek/update/"})
end if

//clean up
uo_ftp.of_disconnect()

close(this)

end event

public subroutine floodhide ();//hpb_flood.Visible = False

end subroutine

public subroutine floodupdatetextpc (double upperlimit, double progress);String pc

If progress <= upperLimit Then

//	If progress > hpb_flood.MaxPosition Then
//		progress = hpb_flood.MaxPosition
//	End If
	
//	hpb_flood.SetRange(0,Long(upperLimit))
	
	//format the progress into a percentage string to display
	pc = String(Long((progress / upperLimit) * 100)) + "%"

	//print the percentage string in the text colour
	st_flood.Text = sProgressMessage + " " + pc
	
	//update the flood bar to the new progress length
//	hpb_flood.Position = Long(progress)
	
	//format the progress into a percentage string to display
	pc = String(Long(((dTransferedFileSize + progress) / &
		hpb_total.MaxPosition) * 100)) + "%"

	//print the percentage string in the text colour
	st_flood.Text = "Total progress : " + pc

	//update the total progress bar to the new progress length
	hpb_total.Position = Long(dTransferedFileSize + progress)
	
End If

end subroutine

public subroutine floodshowtransferresult (boolean success, string sfile, double filesize);Choose Case success
	Case True
		st_flood.TextColor = H('3A633D')
		sProgressMessage = "Transfer of " + sFile + " completed successfully."
	Case False
		st_flood.TextColor = H('3D2785')
		sProgressMessage = "Transfer of " + sFile + " failed."
End Choose

//print the percentage string in the text colour
st_flood.Text = sProgressMessage

//update the flood bar to the new progress length
//hpb_flood.Position = hpb_flood.MaxPosition

//add the size of the transfered file to the total
dTransferedFileSize += fileSize

//update the total progress bar to the new progress length
hpb_total.Position = Long(dTransferedFileSize / dTotalSize * 10000)

end subroutine

public subroutine resetstuff ();st_status.Text = ""

lb_1.Reset()

uo_ftp.FtpErrorMessage = ""

uo_ftp.pub_BytesSent = 0
uo_ftp.pub_BytesRecieved = 0

end subroutine

public subroutine floodshowconnectaction (string sconnectmsg);st_flood.TextColor = H('800000')

//print the percentage string in the text colour
st_flood.Text = sConnectMsg

end subroutine

public function string parsefilefromlist (string sselection);Long p

p = Pos(sSelection, "~t")

If p > 0 Then
	Return Left(sSelection, p - 1)
Else
	Return sSelection
End If

end function

public subroutine flooddisplay (double upperlimit, string floodmessage);//initialize the control by setting range 0 to file size
//hpb_flood.setRange(0, Long(upperLimit))
//hpb_flood.Position = 0
//  
//hpb_flood.Visible = True

//set a form-level variable for the flood message
//to avoid the need for continually passing a string
sProgressMessage = floodMessage

end subroutine

public subroutine totaldisplay (double upperlimit);//initialize the control by setting range 0 to total files size
dTotalSize = upperLimit
hpb_total.setRange(0, hpb_total.MaxPosition)

end subroutine

on w_ftpupdate.create
this.p_2=create p_2
this.p_1=create p_1
this.hpb_total=create hpb_total
this.lb_1=create lb_1
this.st_status=create st_status
this.st_title=create st_title
this.st_flood=create st_flood
this.st_1=create st_1
this.Control[]={this.p_2,&
this.p_1,&
this.hpb_total,&
this.lb_1,&
this.st_status,&
this.st_title,&
this.st_flood,&
this.st_1}
end on

on w_ftpupdate.destroy
destroy(this.p_2)
destroy(this.p_1)
destroy(this.hpb_total)
destroy(this.lb_1)
destroy(this.st_status)
destroy(this.st_title)
destroy(this.st_flood)
destroy(this.st_1)
end on

event open;uo_ftp = Create u_ftp

Title = "FTP AutoUpdate"

st_status.Text = ""

lb_1.Reset()

//hpb_flood.Position = 0
hpb_total.Position = 0

//cb_1.Text = "Start AutoUpdate"

//cb_1.Text = "Done"

Enabled = false

postEvent('ue_post_open')
end event

event close;integer li_file
string ls_path

Destroy uo_ftp

// Si on est sur le serveur, faire une copie du fichier de mise-à-jour
if lower(profileString(gnv_app.of_getAppIniFile(), "Update", "Server", "No")) = "yes" then
	ls_path = profileString(gnv_app.of_getAppIniFile(), "Update", "SavePath", "")
	if ls_path <> "" then
		integer li_res, li_nbf, i
		string ls_reps[], ls_ptmp
		
		if right(ls_path, 1) = '\' then ls_path = left(ls_path, len(ls_path) - 1)
		
		// Si le répertoire spécifié n'existe pas, le créer
		if not directoryExists(ls_path) then
			ls_reps = Split(ls_path, '\')
			
				ls_ptmp = ls_reps[1]
				
				if ls_ptmp = '' then
					ls_ptmp = '\\' + ls_reps[3]
					li_nbf = 4
				else
					li_nbf = 2
				end if
					
				For i = li_nbf To UpperBound(ls_reps)
					ls_ptmp += '\' + ls_reps[i]
					If Not DirectoryExists(ls_ptmp) Then CreateDirectory(ls_ptmp)
				Next
		end if
		
		if fileExists(ls_path + "\orthotekmaj.exe") then fileDelete(ls_path + "\orthotekmaj.exe")
		if fileExists(ls_path + "\version.txt") then fileDelete(ls_path + "\version.txt")
		li_res += fileCopy("C:\ii4net\orthotek\update\orthotekmaj.exe", ls_path + "\orthotekmaj.exe")
		li_res += fileCopy("C:\ii4net\orthotek\update\version.txt", ls_path + "\version.txt")
		li_nbf = 2
		if not fileExists(ls_path + "\pskill.exe") then
			li_res += fileCopy("C:\ii4net\orthotek\update\pskill.exe", ls_path + "\pskill.exe")
			li_nbf ++
		end if
		if not fileExists(ls_path + "\pskilllis.reg") then
			li_res += fileCopy("C:\ii4net\orthotek\update\pskilllis.reg", ls_path + "\pskilllis.reg")
			li_nbf ++
		end if
		
		if li_res < li_nbf then error_type(66)
	end if
end if

li_file = fileOpen("C:\ii4net\orthotek\update.bat", LineMode!, Write!, LockReadWrite!, Replace!)
fileWrite(li_file, "echo off~r~ncls~r~nregedit /s C:\ii4net\orthotek\update\pskilllis.reg~r~nC:\ii4net\orthotek\update\pskill orthotek.exe~r~nC:\ii4net\orthotek\update\orthotekmaj.exe~r~ncls~r~nexit")
fileClose(li_file)
Run("C:\ii4net\orthotek\update.bat", Minimized!)

post close(w_principal)

end event

type p_2 from picture within w_ftpupdate
integer x = 5
integer y = 1408
integer width = 2693
integer height = 40
string picturename = "C:\ii4net\orthotek\images\anim2.gif"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type p_1 from picture within w_ftpupdate
integer x = 2299
integer width = 389
integer height = 308
boolean originalsize = true
string picturename = "C:\ii4net\orthotek\images\anim1.gif"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type hpb_total from hprogressbar within w_ftpupdate
integer x = 5
integer y = 1648
integer width = 2697
integer height = 48
unsignedinteger maxposition = 10000
integer setstep = 1
end type

type lb_1 from listbox within w_ftpupdate
integer x = 5
integer y = 396
integer width = 2693
integer height = 1000
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;String sNewPath, sPath

//get the desired directory from the list
sNewPath = Text(index)

//If a root item selected, exit; the routine
//will navigate a level higher. If it is
//a file, we don't want to navigate.
If Right(sNewPath, 1) = "/" Then

	//Show the wait cursor
	SetPointer(Hourglass!)
	
	//retrieve the current FTP path
	//using GetFTPDirectory
	sPath = uo_ftp.GetFtpDirectory(uo_ftp.hConnection)
	
	//qualify it if necessary, and append
	//the new path to it
	If Right(sPath, 1) <> "/" Then
		sPath += "/" + sNewPath
	Else
		sPath += sNewPath
	End If

	//set the new path using the
	//FtpSetCurrentDirectory API
	uo_ftp.FtpSetCurrentDirectory(uo_ftp.hConnection, sPath)
	
	//reload the list with the current directory
	uo_ftp.GetFtpDirectoryContents()

	//Show the wait cursor
	SetPointer(Arrow!)

End If

end event

type st_status from statictext within w_ftpupdate
integer x = 5
integer y = 1708
integer width = 2697
integer height = 88
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

type st_title from statictext within w_ftpupdate
integer y = 284
integer width = 901
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "ORTHOTEK update"
boolean focusrectangle = false
end type

type st_flood from statictext within w_ftpupdate
integer x = 9
integer y = 1464
integer width = 2688
integer height = 84
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

type st_1 from statictext within w_ftpupdate
integer x = 5
integer y = 1560
integer width = 402
integer height = 80
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

