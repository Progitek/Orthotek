$PBExportHeader$w_imaging_import.srw
forward
global type w_imaging_import from w_response
end type
type p_18 from picture within w_imaging_import
end type
type st_sel from st_uo_transparent within w_imaging_import
end type
type st_fichier from st_uo_transparent within w_imaging_import
end type
type p_17 from picture within w_imaging_import
end type
type st_liste from statictext within w_imaging_import
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_imaging_import
end type
type uo_toolbar from u_cst_toolbarstrip within w_imaging_import
end type
type p_13 from picture within w_imaging_import
end type
type p_14 from picture within w_imaging_import
end type
type p_15 from picture within w_imaging_import
end type
type p_16 from picture within w_imaging_import
end type
type p_9 from picture within w_imaging_import
end type
type p_10 from picture within w_imaging_import
end type
type p_11 from picture within w_imaging_import
end type
type p_12 from picture within w_imaging_import
end type
type p_5 from picture within w_imaging_import
end type
type p_6 from picture within w_imaging_import
end type
type p_7 from picture within w_imaging_import
end type
type p_8 from picture within w_imaging_import
end type
type p_4 from picture within w_imaging_import
end type
type p_3 from picture within w_imaging_import
end type
type p_2 from picture within w_imaging_import
end type
type cb_annuler from commandbutton within w_imaging_import
end type
type p_1 from picture within w_imaging_import
end type
type sle_1 from singlelineedit within w_imaging_import
end type
type cb_1 from commandbutton within w_imaging_import
end type
type lb_1 from u_lb within w_imaging_import
end type
type cb_ok from commandbutton within w_imaging_import
end type
type rr_1 from roundrectangle within w_imaging_import
end type
type rr_2 from roundrectangle within w_imaging_import
end type
type rr_infopat from roundrectangle within w_imaging_import
end type
type rr_3 from roundrectangle within w_imaging_import
end type
end forward

global type w_imaging_import from w_response
integer width = 4677
integer height = 2640
boolean titlebar = false
boolean controlmenu = false
boolean border = false
windowtype windowtype = child!
windowstate windowstate = maximized!
boolean ib_isupdateable = false
p_18 p_18
st_sel st_sel
st_fichier st_fichier
p_17 p_17
st_liste st_liste
uo_toolbar2 uo_toolbar2
uo_toolbar uo_toolbar
p_13 p_13
p_14 p_14
p_15 p_15
p_16 p_16
p_9 p_9
p_10 p_10
p_11 p_11
p_12 p_12
p_5 p_5
p_6 p_6
p_7 p_7
p_8 p_8
p_4 p_4
p_3 p_3
p_2 p_2
cb_annuler cb_annuler
p_1 p_1
sle_1 sle_1
cb_1 cb_1
lb_1 lb_1
cb_ok cb_ok
rr_1 rr_1
rr_2 rr_2
rr_infopat rr_infopat
rr_3 rr_3
end type
global w_imaging_import w_imaging_import

type variables
private long  il_progressid = 0 
private string is_imgpathimport

string	is_application = ""
end variables

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)
uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)

if gs_langue = "an" THEN
	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Close", "Exit!")
	
	st_sel.text = "Files selection"
	st_liste.text = "Directory list:"
	st_fichier.text = "Files to be imported - preview"
ELSE
	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Fermer", "Exit!")
END IF

uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)
end subroutine

on w_imaging_import.create
int iCurrent
call super::create
this.p_18=create p_18
this.st_sel=create st_sel
this.st_fichier=create st_fichier
this.p_17=create p_17
this.st_liste=create st_liste
this.uo_toolbar2=create uo_toolbar2
this.uo_toolbar=create uo_toolbar
this.p_13=create p_13
this.p_14=create p_14
this.p_15=create p_15
this.p_16=create p_16
this.p_9=create p_9
this.p_10=create p_10
this.p_11=create p_11
this.p_12=create p_12
this.p_5=create p_5
this.p_6=create p_6
this.p_7=create p_7
this.p_8=create p_8
this.p_4=create p_4
this.p_3=create p_3
this.p_2=create p_2
this.cb_annuler=create cb_annuler
this.p_1=create p_1
this.sle_1=create sle_1
this.cb_1=create cb_1
this.lb_1=create lb_1
this.cb_ok=create cb_ok
this.rr_1=create rr_1
this.rr_2=create rr_2
this.rr_infopat=create rr_infopat
this.rr_3=create rr_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_18
this.Control[iCurrent+2]=this.st_sel
this.Control[iCurrent+3]=this.st_fichier
this.Control[iCurrent+4]=this.p_17
this.Control[iCurrent+5]=this.st_liste
this.Control[iCurrent+6]=this.uo_toolbar2
this.Control[iCurrent+7]=this.uo_toolbar
this.Control[iCurrent+8]=this.p_13
this.Control[iCurrent+9]=this.p_14
this.Control[iCurrent+10]=this.p_15
this.Control[iCurrent+11]=this.p_16
this.Control[iCurrent+12]=this.p_9
this.Control[iCurrent+13]=this.p_10
this.Control[iCurrent+14]=this.p_11
this.Control[iCurrent+15]=this.p_12
this.Control[iCurrent+16]=this.p_5
this.Control[iCurrent+17]=this.p_6
this.Control[iCurrent+18]=this.p_7
this.Control[iCurrent+19]=this.p_8
this.Control[iCurrent+20]=this.p_4
this.Control[iCurrent+21]=this.p_3
this.Control[iCurrent+22]=this.p_2
this.Control[iCurrent+23]=this.cb_annuler
this.Control[iCurrent+24]=this.p_1
this.Control[iCurrent+25]=this.sle_1
this.Control[iCurrent+26]=this.cb_1
this.Control[iCurrent+27]=this.lb_1
this.Control[iCurrent+28]=this.cb_ok
this.Control[iCurrent+29]=this.rr_1
this.Control[iCurrent+30]=this.rr_2
this.Control[iCurrent+31]=this.rr_infopat
this.Control[iCurrent+32]=this.rr_3
end on

on w_imaging_import.destroy
call super::destroy
destroy(this.p_18)
destroy(this.st_sel)
destroy(this.st_fichier)
destroy(this.p_17)
destroy(this.st_liste)
destroy(this.uo_toolbar2)
destroy(this.uo_toolbar)
destroy(this.p_13)
destroy(this.p_14)
destroy(this.p_15)
destroy(this.p_16)
destroy(this.p_9)
destroy(this.p_10)
destroy(this.p_11)
destroy(this.p_12)
destroy(this.p_5)
destroy(this.p_6)
destroy(this.p_7)
destroy(this.p_8)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.cb_annuler)
destroy(this.p_1)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.lb_1)
destroy(this.cb_ok)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.rr_infopat)
destroy(this.rr_3)
end on

event open;call super::open;p_1.visible = false
p_2.visible = false
p_3.visible = false
p_4.visible = false
p_5.visible = false
p_6.visible = false
p_7.visible = false
p_8.visible = false
p_9.visible = false
p_10.visible = false
p_11.visible = false
p_12.visible = false
p_13.visible = false
p_14.visible = false
p_15.visible = false
p_16.visible = false
lb_1.dirlist(is_imgpathimport + '\*.JPG', 0)



end event

type p_18 from picture within w_imaging_import
string tag = "resize=n"
integer x = 160
integer y = 92
integer width = 87
integer height = 72
boolean originalsize = true
string picturename = "C:\ii4net\imgpro\foldopen.bmp"
boolean focusrectangle = false
end type

type st_sel from st_uo_transparent within w_imaging_import
string tag = "resize=n"
integer x = 270
integer y = 96
integer width = 782
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 15793151
string text = "Sélection de fichiers"
end type

type st_fichier from st_uo_transparent within w_imaging_import
string tag = "resize=n"
integer x = 1509
integer y = 96
integer width = 1184
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 15793151
string text = "Aperçu des fichiers qui seront importés"
end type

type p_17 from picture within w_imaging_import
string tag = "resize=n"
integer x = 1385
integer y = 100
integer width = 73
integer height = 60
boolean originalsize = true
string picturename = "C:\ii4net\imgpro\listview_picture.bmp"
boolean focusrectangle = false
end type

type st_liste from statictext within w_imaging_import
string tag = "resize=n"
integer x = 123
integer y = 340
integer width = 663
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Liste des fichiers du répertoire:"
boolean focusrectangle = false
end type

type uo_toolbar2 from u_cst_toolbarstrip within w_imaging_import
event destroy ( )
string tag = "resize=mrb"
integer x = 3909
integer y = 2440
integer width = 507
integer taborder = 30
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_annuler.event clicked( )
end event

type uo_toolbar from u_cst_toolbarstrip within w_imaging_import
event destroy ( )
string tag = "resize=mrb"
integer x = 3323
integer y = 2444
integer width = 507
integer taborder = 30
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_ok.event clicked( )
end event

type p_13 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 1509
integer y = 1760
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_14 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2194
integer y = 1760
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_15 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2880
integer y = 1760
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_16 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 3561
integer y = 1760
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_9 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 1509
integer y = 1240
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_10 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2194
integer y = 1240
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_11 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2880
integer y = 1240
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_12 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 3561
integer y = 1240
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_5 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 1509
integer y = 720
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_6 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2194
integer y = 720
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_7 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2880
integer y = 720
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_8 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 3561
integer y = 720
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_4 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 3561
integer y = 204
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_3 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2880
integer y = 204
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type p_2 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 2194
integer y = 204
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type cb_annuler from commandbutton within w_imaging_import
string tag = "resize=n"
boolean visible = false
integer x = 2144
integer y = 2468
integer width = 846
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

type p_1 from picture within w_imaging_import
string tag = "resize=frb"
boolean visible = false
integer x = 1509
integer y = 204
integer width = 640
integer height = 480
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_imaging_import
string tag = "resize=n"
integer x = 128
integer y = 220
integer width = 818
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
boolean displayonly = true
end type

event constructor;s_imaging_parm temp
temp = Message.PowerObjectParm

//il_patid = temp.sl_patid
il_progressid = temp.sl_progressid

application l_app
l_app = GetApplication()
is_application = l_app.AppName 

IF is_application = "dentitek" THEN
	select imgpathimport into :is_imgpathimport from t_optiongen;
ELSE
	select imgpathimport into :is_imgpathimport from t_options where ortho_id = :v_no_ortho;

END IF

if isnull(is_imgpathimport) then
	is_imgpathimport = "c:\"
end if
this.text = is_imgpathimport

end event

type cb_1 from commandbutton within w_imaging_import
string tag = "resize=n"
integer x = 955
integer y = 220
integer width = 101
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "..."
end type

event clicked;string ls_query

GetFolder ( "", is_imgpathimport )

//ls_query = "Update t_options set imgpathimport = '" + is_path +"' where ortho_id =" + string(v_no_ortho)
//Execute Immediate :ls_query Using SQLCA;	

sle_1.text = is_imgpathimport
lb_1.dirlist(is_imgpathimport + '\*.JPG', 0)



end event

type lb_1 from u_lb within w_imaging_import
string tag = "resize=ab"
integer x = 123
integer y = 400
integer width = 942
integer height = 1848
integer taborder = 20
fontcharset fontcharset = ansi!
boolean multiselect = true
boolean extendedselect = true
end type

event constructor;//int i, li_check

//this.dirlist(is_imgpathimport + '\*.JPG', 0)

//for i = 1 to this.totalitems()
//	this.setState(i,true)
//next
end event

event selectionchanged;string picture_path, ls_file_temp
integer  o_width, o_height, n_width, n_height, i, j, selection[16]
long	ll_height, ll_width, result
oleobject 	myImage
MyImage = CREATE OLEObject

SetPointer(HourGlass!)

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
if result = 0 then

	i = 1
	do while selectedIndex() <> -1 and i <= 16
		selection[i] = selectedIndex()
		setState(selection[i], false)
		
		ls_file_temp = w_imaging.is_pathphoto + "\preimport" + string(i) + ".jpg"
		
		IF FileExists(ls_file_temp) THEN FileDelete(ls_file_temp)
		
		myImage.convert(  this.text(selection[i]), "-resize", "1000x1000" , ls_file_temp ) 
		picture_path = w_imaging.is_pathphoto + "\preimport" + string(i) + ".jpg"
		//picture_path = is_imgpathimport +"\"+ this.text(selection[i])
		
		choose case i
			case 1
				//if p_1.pictureName <> picture_path then
					
					p_1.visible = false
					p_1.setredraw(false)
					p_1.originalsize = true
					p_1.picturename = picture_path
					
					ll_height = p_1.height
					ll_width = p_1.width
					if p_1.width >= p_1.height then
						o_width = p_1.width
						o_height = p_1.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_1.width
						o_height = p_1.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_1.originalsize = false
					p_1.Resize ( n_width, n_height )
					p_1.setredraw(true)
				//end if
				p_1.visible = true
	
			case 2
				//if p_2.pictureName <> picture_path then
					p_2.visible = false
					p_2.setredraw(false)
					p_2.originalsize = true
					p_2.picturename = picture_path
					
					if p_2.width >= p_2.height then
						o_width = p_2.width
						o_height = p_2.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_2.width
						o_height = p_2.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_2.originalsize = false
					p_2.Resize ( n_width, n_height )
					p_2.setredraw(true)
				//end if
				p_2.visible = true
	
			case 3
				//if p_3.pictureName <> picture_path then
					p_3.visible = false
					p_3.setredraw(false)
					p_3.originalsize = true
					p_3.picturename = picture_path
					
					if p_3.width >= p_3.height then
						o_width = p_3.width
						o_height = p_3.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_3.width
						o_height = p_3.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_3.originalsize = false
					p_3.Resize ( n_width, n_height )
					p_3.setredraw(true)
				//end if
				p_3.visible = true
	
			case 4
				//if p_4.pictureName <> picture_path then
					p_4.visible = false
					p_4.setredraw(false)
					p_4.originalsize = true
					p_4.picturename = picture_path
					
					if p_4.width >= p_4.height then
						o_width = p_4.width
						o_height = p_4.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_4.width
						o_height = p_4.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_4.originalsize = false
					p_4.Resize ( n_width, n_height )
					p_4.setredraw(true)
				//end if
				p_4.visible = true
	
			case 5
				//if p_5.pictureName <> picture_path then
					p_5.visible = false
					p_5.setredraw(false)
					p_5.originalsize = true
					p_5.picturename = picture_path
					
					if p_5.width >= p_5.height then
						o_width = p_5.width
						o_height = p_5.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_5.width
						o_height = p_5.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_5.originalsize = false
					p_5.Resize ( n_width, n_height )
					p_5.setredraw(true)
				//end if
				p_5.visible = true
	
			case 6
				//if p_6.pictureName <> picture_path then
					p_6.visible = false
					p_6.setredraw(false)
					p_6.originalsize = true
					p_6.picturename = picture_path
					
					if p_6.width >= p_6.height then
						o_width = p_6.width
						o_height = p_6.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_6.width
						o_height = p_6.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_6.originalsize = false
					p_6.Resize ( n_width, n_height )
					p_6.setredraw(true)
				//end if
				p_6.visible = true
	
			case 7
				//if p_7.pictureName <> picture_path then
					p_7.visible = false
					p_7.setredraw(false)
					p_7.originalsize = true
					p_7.picturename = picture_path
					
					if p_7.width >= p_7.height then
						o_width = p_7.width
						o_height = p_7.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_7.width
						o_height = p_7.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_7.originalsize = false
					p_7.Resize ( n_width, n_height )
					p_7.setredraw(true)
				//end if
				p_7.visible = true
	
			case 8
				//if p_8.pictureName <> picture_path then
					p_8.visible = false
					p_8.setredraw(false)
					p_8.originalsize = true
					p_8.picturename = picture_path
					
					if p_8.width >= p_8.height then
						o_width = p_8.width
						o_height = p_8.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_8.width
						o_height = p_8.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_8.originalsize = false
					p_8.Resize ( n_width, n_height )
					p_8.setredraw(true)
				//end if
				p_8.visible = true
	
			case 9
				//if p_9.pictureName <> picture_path then
					p_9.visible = false
					p_9.setredraw(false)
					p_9.originalsize = true
					p_9.picturename = picture_path
					
					if p_9.width >= p_9.height then
						o_width = p_9.width
						o_height = p_9.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_9.width
						o_height = p_9.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_9.originalsize = false
					p_9.Resize ( n_width, n_height )
					p_9.setredraw(true)
				//end if
				p_9.visible = true
	
			case 10
				//if p_10.pictureName <> picture_path then
					p_10.visible = false
					p_10.setredraw(false)
					p_10.originalsize = true
					p_10.picturename = picture_path
					
					if p_10.width >= p_10.height then
						o_width = p_10.width
						o_height = p_10.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_10.width
						o_height = p_10.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_10.originalsize = false
					p_10.Resize ( n_width, n_height )
					p_10.setredraw(true)
				//end if
				p_10.visible = true
	
			case 11
				//if p_11.pictureName <> picture_path then
					p_11.visible = false
					p_11.setredraw(false)
					p_11.originalsize = true
					p_11.picturename = picture_path
					
					if p_11.width >= p_11.height then
						o_width = p_11.width
						o_height = p_11.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_11.width
						o_height = p_11.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_11.originalsize = false
					p_11.Resize ( n_width, n_height )
					p_11.setredraw(true)
				//end if
				p_11.visible = true
	
			case 12
				//if p_12.pictureName <> picture_path then
					p_12.visible = false
					p_12.setredraw(false)
					p_12.originalsize = true
					p_12.picturename = picture_path
					
					if p_12.width >= p_12.height then
						o_width = p_12.width
						o_height = p_12.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_12.width
						o_height = p_12.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_12.originalsize = false
					p_12.Resize ( n_width, n_height )
					p_12.setredraw(true)
				//end if
				p_12.visible = true
	
			case 13
				//if p_13.pictureName <> picture_path then
					p_13.visible = false
					p_13.setredraw(false)
					p_13.originalsize = true
					p_13.picturename = picture_path
					
					if p_13.width >= p_13.height then
						o_width = p_13.width
						o_height = p_13.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_13.width
						o_height = p_13.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_13.originalsize = false
					p_13.Resize ( n_width, n_height )
					p_13.setredraw(true)
				//end if
				p_13.visible = true
	
			case 14
				//if p_14.pictureName <> picture_path then
					p_14.visible = false
					p_14.setredraw(false)
					p_14.originalsize = true
					p_14.picturename = picture_path
					
					if p_14.width >= p_14.height then
						o_width = p_14.width
						o_height = p_14.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_14.width
						o_height = p_14.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_14.originalsize = false
					p_14.Resize ( n_width, n_height )
					p_14.setredraw(true)
				//end if
				p_14.visible = true
	
			case 15
				//if p_15.pictureName <> picture_path then
					p_15.visible = false
					p_15.setredraw(false)
					p_15.originalsize = true
					p_15.picturename = picture_path
					
					if p_15.width >= p_15.height then
						o_width = p_15.width
						o_height = p_15.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_15.width
						o_height = p_15.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_15.originalsize = false
					p_15.Resize ( n_width, n_height )
					p_15.setredraw(true)
				//end if
				p_15.visible = true
	
			case 16
				//if p_16.pictureName <> picture_path then
					p_16.visible = false
					p_16.setredraw(false)
					p_16.originalsize = true
					p_16.picturename = picture_path
					
					if p_16.width >= p_16.height then
						o_width = p_16.width
						o_height = p_16.height
						n_width = 640;
						n_height = (n_width * o_height)/o_width
					else
						o_width = p_16.width
						o_height = p_16.height
						n_height = 480;
						n_width = (n_height * o_width)/o_height
					end if
					p_16.originalsize = false
					p_16.Resize ( n_width, n_height )
					p_16.setredraw(true)
				//end if
				p_16.visible = true
	
		end choose
		
		i++
	loop
	
	for j = 1 to 16
		if j < i then
			setState(selection[j], true)
		else
			choose case j
				case 1
					p_1.visible = false
				case 2
					p_2.visible = false
				case 3
					p_3.visible = false
				case 4
					p_4.visible = false
				case 5
					p_5.visible = false
				case 6
					p_6.visible = false
				case 7
					p_7.visible = false
				case 8
					p_8.visible = false
				case 9
					p_9.visible = false
				case 10
					p_10.visible = false
				case 11
					p_11.visible = false
				case 12
					p_12.visible = false
				case 13
					p_13.visible = false
				case 14
					p_14.visible = false
				case 15
					p_15.visible = false
				case 16
					p_16.visible = false
			end choose
		end if
	next
ELSE
	IF gs_langue = "an" THEN
		messagebox("Warning!", "You must install imaging library", Information!, OK!)
	ELSE
		messagebox ("Avertissement!","Vous devez installer la library Imaging",Information!,Ok!)
	END IF
END IF
IF IsValid(MyImage) THEN DESTROY MyImage
end event

type cb_ok from commandbutton within w_imaging_import
string tag = "resize=n"
boolean visible = false
integer y = 2464
integer width = 846
integer height = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
end type

event clicked;Long    ll_items, ll_first, ll_index, ll_size
string  ls_selected []
integer li_ret
OLEObject myImage
int result, total

// Création des répertoires s'il n'existe pas 

if directoryexists(w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid)) = false then
	CreateDirectory ( w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid))
	CreateDirectory ( w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid) + "\original")
	CreateDirectory ( w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid) + "\small")
end if

N_cst_filesrv myFileService
f_setFileSrv(myFileService, true)

MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
if result = 0 then

	open(w_immaging_import_progress)

	total = lb_1.TotalSelected( )
	ll_size = 0
	ll_items = lb_1.TotalItems()
	ll_first = lb_1.SelectedIndex()
	FOR ll_index = ll_first  TO ll_items
		IF lb_1.State( ll_index ) = 1 THEN
			ls_selected[ll_size + 1] = is_imgpathimport +"\"+lb_1.text(ll_index)
			//myFileService.of_fileCopy( ls_selected[ll_size + 1], w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid) + "\" + lb_1.text(ll_index)) 
			myImage.convert(  ls_selected[ll_size + 1], "-resize", "1000x1000" , w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid) + "\" + lb_1.text(ll_index)) 
			li_ret = myFileService.of_fileCopy( ls_selected[ll_size + 1], w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid) + "\original\" + lb_1.text(ll_index)) 
			if gs_langue = "an" THEN
				w_immaging_import_progress.st_1.text= "Importating "+ string(ll_size + 1) +" of "+ string(total) +" :" + lb_1.text(ll_index)
			ELSE
				w_immaging_import_progress.st_1.text= "Importation de "+ string(ll_size + 1) +" sur "+ string(total) +" :" + lb_1.text(ll_index)	 				
			END IF

			myImage.convert(  ls_selected[ll_size + 1], "-resize", "200x200" , w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(il_progressid)+"\small\" + lb_1.text(ll_index)) 
			ll_size ++
		END IF
	NEXT
	close(w_immaging_import_progress)
	w_imaging.lb_images.trigger event constructor();
	close(w_imaging_import)
	
else
	IF gs_langue = "an" THEN
		messagebox("Warning!", "You must install imaging library", Information!, OK!)
	ELSE
		messagebox ("Avertissement!","Vous devez installer la library Imaging",Information!,Ok!)
	END IF
end if
end event

type rr_1 from roundrectangle within w_imaging_import
string tag = "resize=arb"
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 1285
integer y = 52
integer width = 3122
integer height = 2324
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_imaging_import
string tag = "resize=ab"
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 32
integer y = 44
integer width = 1115
integer height = 2332
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_infopat from roundrectangle within w_imaging_import
string tag = "resize=ar"
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 1339
integer y = 84
integer width = 2990
integer height = 88
integer cornerheight = 75
integer cornerwidth = 75
end type

type rr_3 from roundrectangle within w_imaging_import
string tag = "resize=n"
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 128
integer y = 84
integer width = 942
integer height = 88
integer cornerheight = 75
integer cornerwidth = 75
end type

