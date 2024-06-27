$PBExportHeader$w_scan.srw
forward
global type w_scan from w_response
end type
type p_size from picture within w_scan
end type
type cb_1 from commandbutton within w_scan
end type
type sle_filename from singlelineedit within w_scan
end type
type st_filename from statictext within w_scan
end type
type p_1 from picture within w_scan
end type
type cb_scan from commandbutton within w_scan
end type
type cb_close from commandbutton within w_scan
end type
type ole_twain from olecontrol within w_scan
end type
end forward

global type w_scan from w_response
string tag = "scan"
integer width = 3040
integer height = 2196
string title = "ORTHOTEK - SCAN"
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
event ue_resize ( )
p_size p_size
cb_1 cb_1
sle_filename sle_filename
st_filename st_filename
p_1 p_1
cb_scan cb_scan
cb_close cb_close
ole_twain ole_twain
end type
global w_scan w_scan

type variables
//oleobject iole_twain
end variables

event ue_resize();ulong lul_width, lul_height, picwidth, picheight
dec {5} var = 1
blob b

if len(p_size.pictureName) > 0 then
	p_size.OriginalSize = True

	lul_width = p_size.Width
	lul_height = p_size.Height
	if lul_width > 3000 then
		var = lul_width / 3000
	end if
	if lul_height / var > 1800 then
		var = lul_height / 1800
	end if
	picwidth = lul_width / var
	picheight = lul_height / var
	
	p_1.width = picwidth
	p_1.height = picheight
	p_1.PictureName = p_size.pictureName
	p_1.visible = true
else
	p_1.visible = false
end if
end event

on w_scan.create
int iCurrent
call super::create
this.p_size=create p_size
this.cb_1=create cb_1
this.sle_filename=create sle_filename
this.st_filename=create st_filename
this.p_1=create p_1
this.cb_scan=create cb_scan
this.cb_close=create cb_close
this.ole_twain=create ole_twain
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_size
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.sle_filename
this.Control[iCurrent+4]=this.st_filename
this.Control[iCurrent+5]=this.p_1
this.Control[iCurrent+6]=this.cb_scan
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.ole_twain
end on

on w_scan.destroy
call super::destroy
destroy(this.p_size)
destroy(this.cb_1)
destroy(this.sle_filename)
destroy(this.st_filename)
destroy(this.p_1)
destroy(this.cb_scan)
destroy(this.cb_close)
destroy(this.ole_twain)
end on

event close;call super::close;if w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.dataobject = 'd_dosspatcorrletter' then w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
end event

type p_size from picture within w_scan
boolean visible = false
integer x = 5
integer y = 88
integer width = 165
integer height = 144
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_scan
integer x = 859
integer y = 1984
integer width = 1285
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type sle_filename from singlelineedit within w_scan
integer x = 398
integer width = 1015
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "scan1"
borderstyle borderstyle = stylelowered!
end type

type st_filename from statictext within w_scan
integer y = 8
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "File name :"
boolean focusrectangle = false
end type

type p_1 from picture within w_scan
boolean visible = false
integer y = 124
integer width = 2999
integer height = 1800
string pointer = "Arrow!"
boolean focusrectangle = false
end type

type cb_scan from commandbutton within w_scan
integer y = 1984
integer width = 859
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Scan"
end type

event clicked;string ls_filename, ls_corrpath, ls_patid
boolean lb_ui
ls_corrpath = w_dossier_patients.is_corrpath
ls_patid = string(w_dossier_patients.il_patid)
ls_filename = sle_filename.text + ".jpg"

if sle_filename.text = '' then
   error_type(125)
else
	if not DirectoryExists(ls_corrpath + '\' + ls_patid) then CreateDirectory(ls_corrpath + '\' + ls_patid)
	if not DirectoryExists(ls_corrpath + '\' + ls_patid + "\scan") then CreateDirectory(ls_corrpath + '\' + ls_patid + "\scan")
	if FileExists(ls_corrpath + '\' + ls_patid + '\scan\' + ls_filename) = false then
		ole_twain.Activate(InPlace!)
		ole_twain.object.SelectSource()
		ole_twain.object.ShowUI = "True"
//		lb_ui = iole_twain.ShowUI
//		iole_twain.object.CloseOnCancel = "True"
//		iole_twain.cancel true
//		iole_twain.PreScan(True)
//		ole_twain.object.SetAutomationTimeout ( 5000 )
		ole_twain.object.StartSession()
//		messagebox('save',ls_corrpath + "\" + ls_patid + "\scan\" + ls_filename)
		ole_twain.object.SaveJPEGChromFactor(36)
		ole_twain.object.SaveFile(ls_corrpath + "\" + ls_patid + "\scan\" + ls_filename)
//		messagebox('save','OK')
		p_size.pictureName = ls_corrpath + "\" + ls_patid + "\scan\" + ls_filename
//		messagebox('save','OK1')
		event ue_resize()
	else
		//un fichier du même nom exit déjà
		messagebox('Error','File : ' + ls_filename + ' Already exist.')
	end if
end if

sle_filename.SetFocus()
end event

type cb_close from commandbutton within w_scan
integer x = 2144
integer y = 1984
integer width = 859
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

event clicked;close(w_scan)
end event

type ole_twain from olecontrol within w_scan
event prescan ( boolean cancel )
event postscan ( boolean cancel )
boolean visible = false
integer x = 1317
integer width = 146
integer height = 128
integer taborder = 20
boolean border = false
boolean focusrectangle = false
string binarykey = "w_scan.win"
omcontentsallowed contentsallowed = containsany!
sizemode sizemode = clip!
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_scan.bin 
2D00000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000019eb329ef41f741194e805faed8eb7c28000000000000000000000000bceae32001c78bff000000030000014000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000134000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000020000000300000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
28ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0042000800450000003800330037003800380035003300330044003300330035004600440039003300360032003600330036004100410046003200450031003800330046000000385915273a9ed5dcdd000007100000034f0000034f000000080013000000000000520300098f910be3e39d11ce4b00aa00000151b802bc00000001388020534d0d736e615372655320000866690000000200080000000000020008000000000002000800000000000200030000ffffffff0001000b00200003000300000000002400020003000b000000080000000000000000000800080000000000000000000800030000000000000000000b0000000300030000000000000000000300030000000000000001000b0000000b0000000300030000000000000001000b0001000b000000030003000000000000000000000001ce72000000000001cefe000000000001cf92000000000001d020000000000001d0a2000000000001d124000000000001d1a8000000000001d23e000000000001d2d6000000000001d370000000000001d40c000000000001d4a0000000000001d534000000000001d5c0000000000001d650000000000001d6e6000000000001d76c000000000001d7f2000000000001d882000000000001d90e000000000001d99a000000000001da26000000000001daaa000000000001db30000000000001dbbc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_scan.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
