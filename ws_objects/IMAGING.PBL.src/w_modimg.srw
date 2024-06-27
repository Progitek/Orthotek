$PBExportHeader$w_modimg.srw
forward
global type w_modimg from w_child
end type
type shl_visionner from uo_hyperlink_transparent within w_modimg
end type
type cbx_inverser from checkbox within w_modimg
end type
type st_5 from statictext within w_modimg
end type
type st_4 from statictext within w_modimg
end type
type st_3 from statictext within w_modimg
end type
type st_2 from statictext within w_modimg
end type
type p_1 from picture within w_modimg
end type
type st_im from st_uo_transparent within w_modimg
end type
type st_op from st_uo_transparent within w_modimg
end type
type p_18 from picture within w_modimg
end type
type st_rognage from statictext within w_modimg
end type
type shl_annuler_rog from uo_hyperlink_transparent within w_modimg
end type
type shl_undo from uo_hyperlink_transparent within w_modimg
end type
type shl_moins_luminosite from uo_hyperlink_transparent within w_modimg
end type
type shl_rognage from uo_hyperlink_transparent within w_modimg
end type
type shl_plus_luminosite from uo_hyperlink_transparent within w_modimg
end type
type shl_rotation from uo_hyperlink_transparent within w_modimg
end type
type shl_symetrie_hor from uo_hyperlink_transparent within w_modimg
end type
type shl_symetrie_vert from uo_hyperlink_transparent within w_modimg
end type
type uo_toolbar from u_cst_toolbarstrip within w_modimg
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_modimg
end type
type p_image from picture within w_modimg
end type
type p_carre from picture within w_modimg
end type
type cb_undo from commandbutton within w_modimg
end type
type lb_histo from listbox within w_modimg
end type
type cb_ok from commandbutton within w_modimg
end type
type p_l4 from picture within w_modimg
end type
type p_l3 from picture within w_modimg
end type
type p_l2 from picture within w_modimg
end type
type p_l1 from picture within w_modimg
end type
type cb_annuler_rog from commandbutton within w_modimg
end type
type p_size from picture within w_modimg
end type
type cb_moins_luminosite from commandbutton within w_modimg
end type
type cb_plus_luminosite from commandbutton within w_modimg
end type
type cb_rogne from commandbutton within w_modimg
end type
type cb_rotation from commandbutton within w_modimg
end type
type cb_symetrie_hor from commandbutton within w_modimg
end type
type st_1 from statictext within w_modimg
end type
type cb_symetrie_vert from commandbutton within w_modimg
end type
type cb_annuler from commandbutton within w_modimg
end type
type p_image_base from picture within w_modimg
end type
type gb_historique from u_gb within w_modimg
end type
type rr_1 from roundrectangle within w_modimg
end type
type rr_2 from roundrectangle within w_modimg
end type
type rr_3 from roundrectangle within w_modimg
end type
type rr_4 from roundrectangle within w_modimg
end type
end forward

global type w_modimg from w_child
integer width = 4677
integer height = 2640
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
boolean ib_isupdateable = false
shl_visionner shl_visionner
cbx_inverser cbx_inverser
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
p_1 p_1
st_im st_im
st_op st_op
p_18 p_18
st_rognage st_rognage
shl_annuler_rog shl_annuler_rog
shl_undo shl_undo
shl_moins_luminosite shl_moins_luminosite
shl_rognage shl_rognage
shl_plus_luminosite shl_plus_luminosite
shl_rotation shl_rotation
shl_symetrie_hor shl_symetrie_hor
shl_symetrie_vert shl_symetrie_vert
uo_toolbar uo_toolbar
uo_toolbar2 uo_toolbar2
p_image p_image
p_carre p_carre
cb_undo cb_undo
lb_histo lb_histo
cb_ok cb_ok
p_l4 p_l4
p_l3 p_l3
p_l2 p_l2
p_l1 p_l1
cb_annuler_rog cb_annuler_rog
p_size p_size
cb_moins_luminosite cb_moins_luminosite
cb_plus_luminosite cb_plus_luminosite
cb_rogne cb_rogne
cb_rotation cb_rotation
cb_symetrie_hor cb_symetrie_hor
st_1 st_1
cb_symetrie_vert cb_symetrie_vert
cb_annuler cb_annuler
p_image_base p_image_base
gb_historique gb_historique
rr_1 rr_1
rr_2 rr_2
rr_3 rr_3
rr_4 rr_4
end type
global w_modimg w_modimg

type prototypes
FUNCTION Long GetDC(Long lhWnd) LIBRARY "USER32"
FUNCTION Long DrawFocusRect(Long lhDC, s_rect astrect) LIBRARY "USER32"
FUNCTION Int ReleaseDC(Long lhWnd, Long lhDC) LIBRARY "USER32"

end prototypes

type variables
Private:
s_imaging_parm istr_imgparm
string is_pathimg,is_pathimgsmall,is_pathimgcopy

n_runandwait iuo_rnw

// pour le crop
Boolean ib_isdrawrect = false, ib_lbuttondown = false
Boolean ib_crop = false, ib_size = false
uint ii_act = 0 // 0 = create, 1 = move, 2 = resize
Long il_x, il_y
Long il_dc
s_rect istr_rect, istr_rectdwn

// pour l'historique
string is_histo[]
string is_listop[]
string is_listopsmall[]

end variables

forward prototypes
public subroutine uf_translate ()
public subroutine uf_traduction ()
end prototypes

public subroutine uf_translate ();
end subroutine

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)
uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)

if gs_langue = 'an' then
	cb_symetrie_vert.text = "Vertical Flip"
	shl_symetrie_vert.text = "Vertical Flip"
	cb_symetrie_hor.text = "Horizontal Flip"
	shl_symetrie_hor.text = "Horizontal Flip"
	cb_rotation.text = "Rotation..."
	shl_rotation.text = "Rotation..."
	cb_rogne.text = "Crop"
	shl_rognage.text = "Crop"
	cb_plus_luminosite.text = "+ Brightness"
	shl_plus_luminosite.text = "+ Brightness"
	cb_moins_luminosite.text = "- Brightness"
	shl_moins_luminosite.text = "- Brightness"
	cb_annuler_rog.text = "Cancel Crop"
	shl_annuler_rog.text = "Cancel Crop"
	cb_ok.text = "Apply"
	cb_annuler.text = "Cancel"
	cb_undo.text = "Undo"
	shl_undo.text = "Undo"
	cbx_inverser.text = "Reverse proportions"
	shl_visionner.text = "Visualize..."

	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Cancel", "C:\ii4net\imgpro\annuler.gif")

ELSE
	uo_toolbar.of_AddItem("OK", "C:\ii4net\imgpro\ok.gif")
	uo_toolbar2.of_AddItem("Annuler", "C:\ii4net\imgpro\annuler.gif")
end if
uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)

end subroutine

on w_modimg.create
int iCurrent
call super::create
this.shl_visionner=create shl_visionner
this.cbx_inverser=create cbx_inverser
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.p_1=create p_1
this.st_im=create st_im
this.st_op=create st_op
this.p_18=create p_18
this.st_rognage=create st_rognage
this.shl_annuler_rog=create shl_annuler_rog
this.shl_undo=create shl_undo
this.shl_moins_luminosite=create shl_moins_luminosite
this.shl_rognage=create shl_rognage
this.shl_plus_luminosite=create shl_plus_luminosite
this.shl_rotation=create shl_rotation
this.shl_symetrie_hor=create shl_symetrie_hor
this.shl_symetrie_vert=create shl_symetrie_vert
this.uo_toolbar=create uo_toolbar
this.uo_toolbar2=create uo_toolbar2
this.p_image=create p_image
this.p_carre=create p_carre
this.cb_undo=create cb_undo
this.lb_histo=create lb_histo
this.cb_ok=create cb_ok
this.p_l4=create p_l4
this.p_l3=create p_l3
this.p_l2=create p_l2
this.p_l1=create p_l1
this.cb_annuler_rog=create cb_annuler_rog
this.p_size=create p_size
this.cb_moins_luminosite=create cb_moins_luminosite
this.cb_plus_luminosite=create cb_plus_luminosite
this.cb_rogne=create cb_rogne
this.cb_rotation=create cb_rotation
this.cb_symetrie_hor=create cb_symetrie_hor
this.st_1=create st_1
this.cb_symetrie_vert=create cb_symetrie_vert
this.cb_annuler=create cb_annuler
this.p_image_base=create p_image_base
this.gb_historique=create gb_historique
this.rr_1=create rr_1
this.rr_2=create rr_2
this.rr_3=create rr_3
this.rr_4=create rr_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.shl_visionner
this.Control[iCurrent+2]=this.cbx_inverser
this.Control[iCurrent+3]=this.st_5
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.p_1
this.Control[iCurrent+8]=this.st_im
this.Control[iCurrent+9]=this.st_op
this.Control[iCurrent+10]=this.p_18
this.Control[iCurrent+11]=this.st_rognage
this.Control[iCurrent+12]=this.shl_annuler_rog
this.Control[iCurrent+13]=this.shl_undo
this.Control[iCurrent+14]=this.shl_moins_luminosite
this.Control[iCurrent+15]=this.shl_rognage
this.Control[iCurrent+16]=this.shl_plus_luminosite
this.Control[iCurrent+17]=this.shl_rotation
this.Control[iCurrent+18]=this.shl_symetrie_hor
this.Control[iCurrent+19]=this.shl_symetrie_vert
this.Control[iCurrent+20]=this.uo_toolbar
this.Control[iCurrent+21]=this.uo_toolbar2
this.Control[iCurrent+22]=this.p_image
this.Control[iCurrent+23]=this.p_carre
this.Control[iCurrent+24]=this.cb_undo
this.Control[iCurrent+25]=this.lb_histo
this.Control[iCurrent+26]=this.cb_ok
this.Control[iCurrent+27]=this.p_l4
this.Control[iCurrent+28]=this.p_l3
this.Control[iCurrent+29]=this.p_l2
this.Control[iCurrent+30]=this.p_l1
this.Control[iCurrent+31]=this.cb_annuler_rog
this.Control[iCurrent+32]=this.p_size
this.Control[iCurrent+33]=this.cb_moins_luminosite
this.Control[iCurrent+34]=this.cb_plus_luminosite
this.Control[iCurrent+35]=this.cb_rogne
this.Control[iCurrent+36]=this.cb_rotation
this.Control[iCurrent+37]=this.cb_symetrie_hor
this.Control[iCurrent+38]=this.st_1
this.Control[iCurrent+39]=this.cb_symetrie_vert
this.Control[iCurrent+40]=this.cb_annuler
this.Control[iCurrent+41]=this.p_image_base
this.Control[iCurrent+42]=this.gb_historique
this.Control[iCurrent+43]=this.rr_1
this.Control[iCurrent+44]=this.rr_2
this.Control[iCurrent+45]=this.rr_3
this.Control[iCurrent+46]=this.rr_4
end on

on w_modimg.destroy
call super::destroy
destroy(this.shl_visionner)
destroy(this.cbx_inverser)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.st_im)
destroy(this.st_op)
destroy(this.p_18)
destroy(this.st_rognage)
destroy(this.shl_annuler_rog)
destroy(this.shl_undo)
destroy(this.shl_moins_luminosite)
destroy(this.shl_rognage)
destroy(this.shl_plus_luminosite)
destroy(this.shl_rotation)
destroy(this.shl_symetrie_hor)
destroy(this.shl_symetrie_vert)
destroy(this.uo_toolbar)
destroy(this.uo_toolbar2)
destroy(this.p_image)
destroy(this.p_carre)
destroy(this.cb_undo)
destroy(this.lb_histo)
destroy(this.cb_ok)
destroy(this.p_l4)
destroy(this.p_l3)
destroy(this.p_l2)
destroy(this.p_l1)
destroy(this.cb_annuler_rog)
destroy(this.p_size)
destroy(this.cb_moins_luminosite)
destroy(this.cb_plus_luminosite)
destroy(this.cb_rogne)
destroy(this.cb_rotation)
destroy(this.cb_symetrie_hor)
destroy(this.st_1)
destroy(this.cb_symetrie_vert)
destroy(this.cb_annuler)
destroy(this.p_image_base)
destroy(this.gb_historique)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.rr_3)
destroy(this.rr_4)
end on

event open;call super::open;double ldb_ratasp, ldb_ratorg
long ll_w, ll_h

ll_w = UnitsToPixels(p_image.width, XUnitsToPixels!)
ll_h = UnitsToPixels(p_image.height, YUnitsToPixels!)
ldb_ratasp = ll_w / double(ll_h)

//is_pathimg = w_imaging.is_pathphoto+"\"+string(istr_imgparm.sl_patid)+"\"+string(istr_imgparm.sl_progressid)+"\"+istr_imgparm.ss_imgname
//is_pathimgcopy = w_imaging.is_pathphoto+"\"+string(istr_imgparm.sl_patid)+"\"+string(istr_imgparm.sl_progressid)+"\tmp.jpg"
is_pathimg = w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(istr_imgparm.sl_progressid)+"\"+istr_imgparm.ss_imgname
is_pathimgcopy = w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(istr_imgparm.sl_progressid)+"\tmp.jpg"

if fileExists(is_pathimgcopy) then fileDelete(is_pathimgcopy)
fileCopy(is_pathimg, is_pathimgcopy)
//is_pathimgsmall = w_imaging.is_pathphoto+"\"+string(istr_imgparm.sl_patid)+"\"+string(istr_imgparm.sl_progressid)+"\small\"+istr_imgparm.ss_imgname
is_pathimgsmall = w_imaging.is_pathphoto + "\" + w_imaging.is_imgfolder + "\" + string(istr_imgparm.sl_progressid)+"\small\"+istr_imgparm.ss_imgname
p_size.picturename = is_pathimg
p_size.originalSize = true

ldb_ratorg = UnitsToPixels(p_size.width, XUnitsToPixels!) / double(UnitsToPixels(p_size.height, YUnitsToPixels!))

if ldb_ratorg > ldb_ratasp then
	p_image_base.resize(p_image.width, PixelsToUnits(integer(ll_w / ldb_ratorg), YPixelsToUnits!))
else
	p_image_base.resize(PixelsToUnits(integer(ll_h * ldb_ratorg), XPixelsToUnits!), p_image.height)
end if

p_image_base.picturename = is_pathimgcopy
end event

event pfc_preopen;call super::pfc_preopen;istr_imgparm = message.powerobjectparm
end event

type shl_visionner from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 1984
integer y = 2292
integer width = 553
integer height = 72
integer textsize = -10
long backcolor = 15793151
string text = "Visionner..."
alignment alignment = right!
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;SetPointer(HourGlass!)

n_cst_syncproc luo_sync
luo_sync = CREATE n_cst_syncproc

luo_sync.of_setwindow('normal')
luo_sync.of_RunAndWait(p_image_base.picturename)

IF IsValid(luo_sync) THEN destroy luo_sync



end event

type cbx_inverser from checkbox within w_modimg
string tag = "resize=frbsr"
boolean visible = false
integer x = 3017
integer y = 836
integer width = 690
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Inverser les proportions"
end type

type st_5 from statictext within w_modimg
boolean visible = false
integer x = 2619
integer y = 532
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 255
boolean focusrectangle = false
end type

type st_4 from statictext within w_modimg
boolean visible = false
integer x = 2619
integer y = 460
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 255
boolean focusrectangle = false
end type

type st_3 from statictext within w_modimg
boolean visible = false
integer x = 2619
integer y = 384
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 255
boolean focusrectangle = false
end type

type st_2 from statictext within w_modimg
boolean visible = false
integer x = 2619
integer y = 312
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 255
boolean focusrectangle = false
end type

type p_1 from picture within w_modimg
string tag = "resize=frb"
integer x = 178
integer y = 100
integer width = 73
integer height = 60
boolean originalsize = true
string picturename = "C:\ii4net\imgpro\listview_picture.bmp"
boolean focusrectangle = false
end type

type st_im from st_uo_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 288
integer y = 100
integer width = 782
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 15793151
string text = "Aperçu de l~'image"
end type

type st_op from st_uo_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 2930
integer y = 100
integer width = 782
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 15793151
string text = "Opérations sur l~'image"
end type

type p_18 from picture within w_modimg
string tag = "resize=frb"
integer x = 2821
integer y = 96
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "C:\ii4net\imgpro\listview_userobject.bmp"
boolean focusrectangle = false
end type

type st_rognage from statictext within w_modimg
string tag = "resize=frbsr"
boolean visible = false
integer x = 3008
integer y = 776
integer width = 1275
integer height = 64
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "* Sélectionnez la partie de l~'image avec la souris"
boolean focusrectangle = false
end type

type shl_annuler_rog from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
boolean visible = false
integer x = 3698
integer y = 688
integer width = 494
integer height = 72
integer textsize = -10
string text = "Annuler rognage"
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;cb_annuler_rog.event clicked( )
end event

type shl_undo from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
boolean visible = false
integer x = 3872
integer y = 2088
integer height = 72
integer textsize = -10
string text = "Défaire"
alignment alignment = right!
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;SetPointer(HourGlass!)
cb_undo.event clicked( )
end event

type shl_moins_luminosite from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 3698
integer y = 380
integer width = 485
integer height = 68
integer textsize = -10
string text = "- luminosité"
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;cb_moins_luminosite.event clicked( )
end event

type shl_rognage from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 3008
integer y = 688
integer width = 485
integer height = 68
integer textsize = -10
string text = "Rognage"
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;SetPointer(HourGlass!)
cb_rogne.event clicked( )
end event

type shl_plus_luminosite from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 3008
integer y = 380
integer width = 402
integer height = 68
integer textsize = -10
string text = "+ luminosité"
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;cb_plus_luminosite.event clicked( )
end event

type shl_rotation from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 3008
integer y = 544
integer width = 402
integer height = 68
integer textsize = -10
string text = "Rotation..."
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;cb_rotation.event clicked( )
end event

type shl_symetrie_hor from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 3698
integer y = 244
integer width = 599
integer height = 72
integer textsize = -10
string text = "Symétrie horizontale"
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;cb_symetrie_hor.event clicked( )
end event

type shl_symetrie_vert from uo_hyperlink_transparent within w_modimg
string tag = "resize=frbsr"
integer x = 3008
integer y = 244
integer width = 613
integer height = 68
integer textsize = -10
string text = "Symétrie verticale"
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;cb_symetrie_vert.event clicked( )
end event

type uo_toolbar from u_cst_toolbarstrip within w_modimg
event destroy ( )
string tag = "resize=mrb"
integer x = 3397
integer y = 2384
integer width = 507
integer taborder = 10
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_ok.event clicked( )
end event

type uo_toolbar2 from u_cst_toolbarstrip within w_modimg
event destroy ( )
string tag = "resize=mrb"
integer x = 4000
integer y = 2384
integer width = 507
integer taborder = 20
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_annuler.event clicked( )
end event

type p_image from picture within w_modimg
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
string tag = "resize=n"
boolean visible = false
integer x = 142
integer y = 248
integer width = 2391
integer height = 1992
boolean enabled = false
boolean focusrectangle = false
end type

type p_carre from picture within w_modimg
event lbuttondown pbm_lbuttondown
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
string tag = "resize=n"
boolean visible = false
integer x = 2857
integer y = 32
integer width = 46
integer height = 40
string pointer = "SizeNWSE!"
string picturename = "C:\ii4net\orthotek\images\black.gif"
boolean border = true
boolean focusrectangle = false
end type

event lbuttondown;if ib_crop then
//	p_l1.hide()
//	p_l2.hide()
//	p_l3.hide()
//	p_l4.hide()
//	p_carre.hide()
	
	il_x = p_image_base.PointerX()
	il_y = p_image_base.PointerY()
	
	ib_lbuttondown = true
	ii_act = 2
	
	istr_rectdwn.left = istr_rect.left
	istr_rectdwn.right = istr_rect.right
	istr_rectdwn.top = istr_rect.top
	istr_rectdwn.bottom = istr_rect.bottom
end if

end event

event mousemove;p_image_base.event mousemove(flags, p_image_base.PointerX(), p_image_base.PointerY())

end event

event lbuttonup;p_image_base.event lbuttonup(flags, p_image_base.PointerX(), p_image_base.PointerY())

end event

type cb_undo from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 3977
integer y = 2184
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Défaire"
end type

event clicked;string ls_ops[], ls_opstbn[], ls_hst[]
integer i, li_nbops, li_idx = 1, li_fich,j
string ls_filename

if lb_histo.totalSelected() = 0 then return 0

setPointer(HourGlass!)

for j = 1 to j 
	if not fileexists("C:\ii4net\img"+string(j)+".bat") then
		ls_filename = "C:\ii4net\img"+string(j)+".bat"
		exit
	else
		filedelete("C:\ii4net\img"+string(j)+".bat")
		j++
	end if
next

//li_fich = fileOpen("C:\ii4net\img.bat", linemode!, write!, lockreadwrite!, replace!)
li_fich = fileOpen(ls_filename, linemode!, write!, lockreadwrite!, replace!)
if li_fich < 0 then return 0

if fileExists(is_pathimgcopy) then fileDelete(is_pathimgcopy)
fileCopy(is_pathimg, is_pathimgcopy)

li_nbops = lb_histo.totalItems()
for i = 1 to li_nbops
	if lb_histo.state(li_idx) = 0 then
		ls_ops[li_idx] = is_listop[i]
		ls_opstbn[li_idx] = is_listopsmall[i]
		ls_hst[li_idx] = is_histo[i]
		fileWrite(li_fich, "convert " + is_pathimgcopy + " " + ls_opstbn[li_idx] + " " + is_pathimgcopy)
		li_idx ++
	else
		lb_histo.deleteItem(li_idx)
	end if
next

fileClose(li_fich)
SetPointer(HourGlass!)
//iuo_rnw.of_run("C:\ii4net\img.bat", hide!)
iuo_rnw.of_run(ls_filename, hide!)
SetPointer(HourGlass!)
if lb_histo.totalItems() = 0 then 
	enabled = false
	shl_undo.visible = false
END IF

is_listop = ls_ops
is_listopsmall = ls_opstbn
is_histo = ls_hst

sleep(2)

p_image_base.pictureName = ''

//Reformatage de l'image
double ldb_ratasp, ldb_ratorg
long	ll_w, ll_h
ll_w = UnitsToPixels(p_image.width, XUnitsToPixels!)
ll_h = UnitsToPixels(p_image.height, YUnitsToPixels!)
ldb_ratasp = ll_w / double(ll_h)	

p_size.picturename = is_pathimgcopy
p_size.originalSize = true
ldb_ratorg = UnitsToPixels(p_size.width, XUnitsToPixels!) / double(UnitsToPixels(p_size.height, YUnitsToPixels!))
if ldb_ratorg > ldb_ratasp then
	p_image_base.resize(p_image.width, PixelsToUnits(integer(ll_w / ldb_ratorg), YPixelsToUnits!))
else
	p_image_base.resize(PixelsToUnits(integer(ll_h * ldb_ratorg), XPixelsToUnits!), p_image.height)
end if


p_image_base.pictureName = is_pathimgcopy

end event

type lb_histo from listbox within w_modimg
integer x = 3008
integer y = 1088
integer width = 1207
integer height = 992
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//Selectionner jusqu'à la fin
long	ll_upper, ll_cpt

ll_upper = THIS.TotalItems()
FOR ll_cpt = index + 1 TO ll_upper
	THIS.SetState ( ll_cpt, TRUE)
END FOR

FOR ll_cpt = 1 TO index - 1
	THIS.SetState ( ll_cpt, FALSE)
END FOR
end event

type cb_ok from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 1033
integer y = 2456
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;integer i, li_nbops, li_fich,j=1
string	ls_currentdir
string ls_filename

if lb_histo.totalItems() > 0 then
	setPointer(HourGlass!)
	
	for j = 1 to j 
		if not fileexists("C:\ii4net\img"+string(j)+".bat") then
			ls_filename = "C:\ii4net\img"+string(j)+".bat"
			exit
		else
			filedelete("C:\ii4net\img"+string(j)+".bat")
			j++
		end if
	next
	
	//li_fich = fileOpen("C:\ii4net\img.bat", linemode!, write!, lockreadwrite!, replace!)
	li_fich = fileOpen(ls_filename, linemode!, write!, lockreadwrite!, replace!)
	if li_fich < 0 then return 0
	
	li_nbops = lb_histo.totalItems()
	
	ls_currentdir = GetCurrentDirectory()
//	ChangeDirectory("C:\Program Files\ImageMagick-6.3.4-Q16\")
	
	for i = 1 to li_nbops
		
		fileWrite(li_fich, '"c:\ii4net\orthotek\imagemagick\convert.exe" "' + is_pathimg + '" ' + is_listop[i] + ' "' + is_pathimg + '"')
		fileWrite(li_fich, '"c:\ii4net\orthotek\imagemagick\convert.exe" "' + is_pathimgsmall + '" ' + is_listopsmall[i] + ' "' + is_pathimgsmall + '"')
		setPointer(HourGlass!)
		//fileWrite(li_fich, 'C:\ii4net\convert.exe ' + is_pathimg + ' ' + is_listop[i] + ' ' + is_pathimg)
		//fileWrite(li_fich, 'C:\ii4net\convert.exe ' + is_pathimgsmall + ' ' + is_listopsmall[i] + ' ' + is_pathimgsmall)
	next

	fileClose(li_fich)
	//iuo_rnw.of_run("C:\ii4net\img.bat", hide!)
	iuo_rnw.of_run(ls_filename, hide!)
	
	fileDelete(is_pathimgcopy)
	
	sleep(2)
	
end if

if isValid(w_imaging_print) then
	w_imaging_print.uf_refreshpic(is_pathimg)
end if

If IsValid(w_imaging) THEN
	w_imaging.trigger event get_image()
	w_imaging.uf_montage()
END IF

//ChangeDirectory(ls_currentdir)

close(parent)
end event

type p_l4 from picture within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2857
integer y = 32
integer width = 178
integer height = 144
boolean border = true
boolean focusrectangle = false
end type

type p_l3 from picture within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2857
integer y = 32
integer width = 178
integer height = 144
boolean border = true
boolean focusrectangle = false
end type

type p_l2 from picture within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2857
integer y = 32
integer width = 178
integer height = 144
boolean border = true
boolean focusrectangle = false
end type

type p_l1 from picture within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2857
integer y = 32
integer width = 178
integer height = 144
boolean border = true
boolean focusrectangle = false
end type

type cb_annuler_rog from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2738
integer y = 2496
integer width = 507
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler Rognage"
end type

event clicked;if gs_langue = 'an' then
	cb_rogne.text = "Crop"
	shl_rognage.text = "Crop"
else
	cb_rogne.text = "Rognage"
	shl_rognage.text = "Rognage"
end if
visible = false
shl_annuler_rog.visible = FALSE
st_rognage.visible = FALSE
cbx_inverser.visible = FALSE

if ib_isdrawrect then
	DrawFocusRect(il_dc, istr_rect)
	ib_isdrawrect = false
end if

p_l1.hide()
p_l2.hide()
p_l3.hide()
p_l4.hide()
p_carre.hide()
ib_crop = false

end event

type p_size from picture within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 142
integer y = 2360
integer width = 165
integer height = 144
boolean enabled = false
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_moins_luminosite from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2999
integer y = 2368
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "- Luminosité"
end type

event clicked;OLEObject myImage
int result

string dwresult

SetPointer(HourGlass!)


MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

myImage.mogrify( "-modulate", "90", is_pathimgcopy)

destroy MyImage

p_image_base.picturename = ''
p_image_base.picturename = is_pathimgcopy

long ll_idx

ll_idx = upperbound(is_histo) + 1

if gs_langue = 'an' then
	is_histo[ll_idx] = "- Brightness"
else
	is_histo[ll_idx] = "- Luminosité"
end if

is_listop[ll_idx] = "-modulate 90"
is_listopsmall[ll_idx] = "-modulate 90"
lb_histo.addItem(is_histo[ll_idx])
cb_undo.enabled = true
shl_undo.visible = TRUE

end event

type cb_plus_luminosite from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2578
integer y = 2368
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "+ Luminosité"
end type

event clicked;OLEObject myImage
int result
string dwresult

SetPointer(HourGlass!)

MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

myImage.mogrify( "-modulate", "110", is_pathimgcopy)

destroy MyImage

p_image_base.picturename = ''
p_image_base.picturename = is_pathimgcopy

long ll_idx
ll_idx = upperbound(is_histo) + 1

if gs_langue = 'an' then
	is_histo[ll_idx] = "+ Brightness"
else
	is_histo[ll_idx] = "+ Luminosité"
end if

is_listop[ll_idx] = "-modulate 110"
is_listopsmall[ll_idx] = "-modulate 110"
lb_histo.addItem(is_histo[ll_idx])
cb_undo.enabled = true
shl_undo.visible = TRUE

end event

type cb_rogne from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2999
integer y = 2240
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rognage"
end type

event clicked;long ll_x, ll_y, ll_w, ll_h
string	ls_currentdir

if ib_crop then
	long ll_xi, ll_yi, ll_wi, ll_hi, ll_wj, ll_hj, ll_xf, ll_yf, ll_hf, ll_wf

	SetPointer(HourGlass!)
	
	if gs_langue = 'an' then
		text = "Crop"
		shl_rognage.text = "Crop"
	else
		text = "Rognage"
		shl_rognage.text = "Rognage"
	end if
	cb_annuler_rog.visible = false
	shl_annuler_rog.visible = false
	st_rognage.visible = FALSE
	cbx_inverser.visible = FALSE
	
	if ib_isdrawrect then
		DrawFocusRect(il_dc, istr_rect)
		ib_isdrawrect = false
	end if
	
	p_l1.hide()
	p_l2.hide()
	p_l3.hide()
	p_l4.hide()
	p_carre.hide()
	ib_crop = false
	
	ll_x = istr_rect.left 
	ll_y = istr_rect.top
	ll_w = istr_rect.right - istr_rect.left
	ll_h = istr_rect.bottom - istr_rect.top
	//ll_xi = UnitsToPixels(p_image_base.x, XUnitsToPixels!)
	ll_xi = 0
	//ll_yi = UnitsToPixels(p_image_base.y, YUnitsToPixels!)
	ll_yi = 0
	IF cbx_inverser.checked = FALSE THEN
		ll_wi = UnitsToPixels(p_image_base.width, XUnitsToPixels!)
		ll_hi = UnitsToPixels(p_image_base.height, YUnitsToPixels!)
	ELSE
		ll_hi = UnitsToPixels(p_image_base.width, XUnitsToPixels!)
		ll_wi = UnitsToPixels(p_image_base.height, YUnitsToPixels!)
	END IF

	long ll_idx
	ll_idx = upperbound(is_histo) + 1
	
	p_size.PictureName = is_pathimgcopy
	p_size.OriginalSize = True
	
	IF cbx_inverser.checked = FALSE THEN
		ll_wj = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		ll_hj = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	ELSE
		ll_hj = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		ll_wj = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	END IF
	
//	ll_xf = long(ll_wj * double((ll_x - ll_xi) / ll_hi))
//	ll_yf = long(ll_hj * double((ll_y - ll_yi) / ll_wi))
	ll_xf = long(ll_wj * double((ll_x - ll_xi) / ll_wi))
	ll_yf = long(ll_hj * double((ll_y - ll_yi) / ll_hi))
	ll_hf = long(ll_hj * double(ll_h / ll_hi))
	ll_wf = long(ll_wj * double(ll_w / ll_wi))
	
//	ls_currentdir = GetCurrentDirectory()
//	ChangeDirectory("C:\Program Files\ImageMagick-6.3.4-Q16\")
	SetPointer(HourGlass!)
	
	iuo_rnw.of_run("c:\ii4net\orthotek\imagemagick\convert " + is_pathimgcopy + " -crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf) + " -resize " + string(ll_wj) + "x" + string(ll_hj) + "! " + is_pathimgcopy, hide!)
	//iuo_rnw.of_run("c:\ii4net\orthotek\imagemagick\convert " + is_pathimgcopy + " -crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf) + " -resize " + string(1396) + "x" + string(1463) + "! " + is_pathimgcopy, hide!)
	

	is_listop[ll_idx] = "-crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf) + " -resize " + string(ll_wj) + "x" + string(ll_hj) + "!"
	//is_listop[ll_idx] = "-crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf)

	p_size.PictureName = is_pathimgsmall
	p_size.OriginalSize = True
	
	IF cbx_inverser.checked = FALSE THEN
		ll_wj = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		ll_hj = UnitsToPixels(p_size.Height, YUnitsToPixels!)
		//ll_wj = 1463
		//ll_hj = 1396
	ELSE
		ll_hj = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		ll_wj = UnitsToPixels(p_size.Height, YUnitsToPixels!)
		//ll_hj = 1463
		//ll_wj = 800
	END IF
	
//	ll_xf = long(ll_wj * double((ll_x - ll_xi) / ll_hi))
//	ll_yf = long(ll_hj * double((ll_y - ll_yi) / ll_wi))
	ll_xf = long(ll_wj * double((ll_x - ll_xi) / ll_wi))
	ll_yf = long(ll_hj * double((ll_y - ll_yi) / ll_hi))
	ll_hf = long(ll_hj * double(ll_h / ll_hi))
	ll_wf = long(ll_wj * double(ll_w / ll_wi))

	is_listopsmall[ll_idx] = "-crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf) + " -resize " + string(ll_wj) + "x" + string(ll_hj) + "!"
	//is_listopsmall[ll_idx] = "-crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf)
	
	p_image_base.picturename = ''
	
	/**/
	double ldb_ratasp, ldb_ratorg
	ll_w = UnitsToPixels(p_image.width, XUnitsToPixels!)
	ll_h = UnitsToPixels(p_image.height, YUnitsToPixels!)
	ldb_ratasp = ll_w / double(ll_h)	
	
	p_size.picturename = is_pathimgcopy
	p_size.originalSize = true
	ldb_ratorg = UnitsToPixels(p_size.width, XUnitsToPixels!) / double(UnitsToPixels(p_size.height, YUnitsToPixels!))
	if ldb_ratorg > ldb_ratasp then
		p_image_base.resize(p_image.width, PixelsToUnits(integer(ll_w / ldb_ratorg), YPixelsToUnits!))
	else
		p_image_base.resize(PixelsToUnits(integer(ll_h * ldb_ratorg), XPixelsToUnits!), p_image.height)
	end if
	
	/**/
	p_image_base.picturename = is_pathimgcopy

	if gs_langue = 'an' then
		is_histo[ll_idx] = "Crop"
	else
		is_histo[ll_idx] = "Rognage"
	end if
	
	lb_histo.addItem(is_histo[ll_idx])
//	ChangeDirectory(ls_currentdir)
	cb_undo.enabled = true
	shl_undo.visible = TRUE
else
	text = "Ok"
	shl_rognage.text = "Ok"
	st_rognage.visible = TRUE
	cbx_inverser.visible = TRUE
	//cb_annuler_rog.visible = true
	shl_annuler_rog.visible = true
	
	ib_crop = true
	
	istr_rect.left = 0
	istr_rect.right = 0
	istr_rect.top = 0
	istr_rect.bottom = 0
end if

end event

type cb_rotation from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2578
integer y = 2240
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rotation"
end type

event clicked;OLEObject myImage
int result
string ls_angle
long ll_idx
string	ls_currentdir
string ls_width, ls_height
long ll_w, ll_h
double ldb_ratasp, ldb_ratorg
		
open(w_rotation)
ls_angle = message.stringParm

if ls_angle = "" then return 0

SetPointer(HourGlass!)

ll_idx = upperbound(is_histo) + 1

choose case ls_angle
	case "-90", "90", "180"
		
		MyImage = CREATE OLEObject
		
		SetPointer(HourGlass!)
		result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
		
		is_listop[ll_idx] = "-rotate " + ls_angle
		is_listopsmall[ll_idx] = "-rotate " + ls_angle
		
		SetPointer(HourGlass!)
		myImage.mogrify( "-rotate", ls_angle, is_pathimgcopy)
	
		destroy MyImage
		
		p_size.PictureName = is_pathimgcopy
		p_size.OriginalSize = True
		ldb_ratorg = UnitsToPixels(p_size.width, XUnitsToPixels!) / double(UnitsToPixels(p_size.height, YUnitsToPixels!))

		ldb_ratasp = UnitsToPixels(p_image.width, XUnitsToPixels!) / double(UnitsToPixels(p_image.height, YUnitsToPixels!))
		
		if ldb_ratorg > ldb_ratasp then
			p_image_base.resize(p_image.width, PixelsToUnits(integer(UnitsToPixels(p_image.width, XUnitsToPixels!) / ldb_ratorg), YPixelsToUnits!))
		else
			p_image_base.resize(PixelsToUnits(integer(UnitsToPixels(p_image.height, YUnitsToPixels!) * ldb_ratorg), XPixelsToUnits!), p_image.height)
		end if
		
		if gs_langue = 'an' then
			if left(ls_angle, 1) = '-' then
				is_histo[ll_idx] = "Rotate " + mid(ls_angle, 2) + "° counterclockwise"
			else
				is_histo[ll_idx] = "Rotate " + ls_angle + "° clockwise"
			end if			
		else
			if left(ls_angle, 1) = '-' then
				is_histo[ll_idx] = "Rotation " + mid(ls_angle, 2) + "° anti horaire"
			else
				is_histo[ll_idx] = "Rotation " + ls_angle + "° horaire"
			end if
		end if
	case else
		if right(ls_angle, 1) = 'R' then
	
			
			MyImage = CREATE OLEObject
			
			result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
			
			SetPointer(HourGlass!)
			ls_angle = left(ls_angle, len(ls_angle) - 1)
		
			p_size.PictureName = is_pathimgcopy
			p_size.OriginalSize = True
			ls_width = string(UnitsToPixels(p_size.Width, XUnitsToPixels!))
			ls_height = string(UnitsToPixels(p_size.Height, YUnitsToPixels!))
		
			is_listop[ll_idx] = "-rotate " + ls_angle + " -resize " + ls_width + "x" + ls_height + "!"
		
			p_size.PictureName = is_pathimgsmall
			p_size.OriginalSize = True
			ls_width = string(UnitsToPixels(p_size.Width, XUnitsToPixels!))
			ls_height = string(UnitsToPixels(p_size.Height, YUnitsToPixels!))
			SetPointer(HourGlass!)
			
			myImage.mogrify( "-rotate", ls_angle, "-resize", ls_width+"x"+ls_height+"!", is_pathimgcopy)
		
			destroy MyImage
			
			is_listopsmall[ll_idx] = "-rotate " + ls_angle + " -resize " + ls_width + "x" + ls_height + "!"
			
			if gs_langue = 'an' then
				if left(ls_angle, 1) = '-' then
					is_histo[ll_idx] = "Resized rotate " + mid(ls_angle, 2) + "° counterclockwise"
				else
					is_histo[ll_idx] = "Resize rotate " + ls_angle + "° clockwise"
				end if			
			else
				if left(ls_angle, 1) = '-' then
					is_histo[ll_idx] = "Rotation redimentionnée " + mid(ls_angle, 2) + "° anti horaire"
				else
					is_histo[ll_idx] = "Rotation redimentionnée " + ls_angle + "° horaire"
				end if
			end if
		else
			
			MyImage = CREATE OLEObject
			
			SetPointer(HourGlass!)
			result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
			
			is_listop[ll_idx] = "-rotate " + ls_angle
			is_listopsmall[ll_idx] = "-rotate " + ls_angle
			
			SetPointer(HourGlass!)
			myImage.mogrify( "-rotate", ls_angle, is_pathimgcopy)
		
			destroy MyImage
			
			p_size.PictureName = is_pathimgcopy
			p_size.OriginalSize = True
			ldb_ratorg = UnitsToPixels(p_size.width, XUnitsToPixels!) / double(UnitsToPixels(p_size.height, YUnitsToPixels!))
	
			ldb_ratasp = UnitsToPixels(p_image.width, XUnitsToPixels!) / double(UnitsToPixels(p_image.height, YUnitsToPixels!))
			
			if ldb_ratorg > ldb_ratasp then
				//p_image_base.resize(p_image.width, PixelsToUnits(integer(UnitsToPixels(p_image.width, XUnitsToPixels!) / ldb_ratorg), YPixelsToUnits!))
			else
				//p_image_base.resize(PixelsToUnits(integer(UnitsToPixels(p_image.height, YUnitsToPixels!) * ldb_ratorg), XPixelsToUnits!), p_image.height)
			end if
			
			if gs_langue = 'an' then
				if left(ls_angle, 1) = '-' then
					is_histo[ll_idx] = "Rotate " + mid(ls_angle, 2) + "° counterclockwise"
				else
					is_histo[ll_idx] = "Rotate " + ls_angle + "° clockwise"
				end if			
			else
				if left(ls_angle, 1) = '-' then
					is_histo[ll_idx] = "Rotation " + mid(ls_angle, 2) + "° anti horaire"
				else
					is_histo[ll_idx] = "Rotation " + ls_angle + "° horaire"
				end if
			end if
			
			
//			ls_currentdir = GetCurrentDirectory()
//			ChangeDirectory("C:\Program Files\ImageMagick-6.3.4-Q16\")
//			SetPointer(HourGlass!)
			
//			iuo_rnw.of_run("convert " + is_pathimgcopy + " ( +clone -rotate " + ls_angle + " ) -gravity center -compose src -composite " + is_pathimgcopy, hide!)
			
//			ChangeDirectory(ls_currentdir)
			
/*			is_listop[ll_idx] = "( +clone -rotate " + ls_angle + " ) -gravity center -compose src -composite"
			is_listopsmall[ll_idx] = "( +clone -rotate " + ls_angle + " ) -gravity center -compose src -composite"
			
			if gs_langue = 'an' then
				if left(ls_angle, 1) = '-' then
					is_histo[ll_idx] = "Rotate " + mid(ls_angle, 2) + "° counterclockwise"
				else
					is_histo[ll_idx] = "Rotate " + ls_angle + "° clockwise"
				end if			
			else
				if left(ls_angle, 1) = '-' then
					is_histo[ll_idx] = "Rotation " + mid(ls_angle, 2) + "° anti horaire"
				else
					is_histo[ll_idx] = "Rotation " + ls_angle + "° horaire"
				end if
			end if*/
		end if
end choose

p_image_base.picturename = ''
p_image_base.picturename = is_pathimgcopy

lb_histo.addItem(is_histo[ll_idx])
cb_undo.enabled = true
shl_undo.visible = TRUE

end event

type cb_symetrie_hor from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2999
integer y = 2112
integer width = 608
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Symétrie Horizontale"
end type

event clicked;OLEObject myImage
int result

string dwresult

SetPointer(HourGlass!)


MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
SetPointer(HourGlass!)
//myImage.mogrify( "-flop", is_pathimg )
myImage.mogrify( "-flop", is_pathimgcopy)

destroy MyImage

p_image_base.picturename = ''
p_image_base.picturename = is_pathimgcopy

long ll_idx
ll_idx = upperbound(is_histo) + 1

if gs_langue = 'an' then
	is_histo[ll_idx] = "Horizontal flip"
else
	is_histo[ll_idx] = "Symétrie horizontale"
end if

is_listop[ll_idx] = "-flop"
is_listopsmall[ll_idx] = "-flop"
lb_histo.addItem(is_histo[ll_idx])
cb_undo.enabled = true
shl_undo.visible = TRUE

end event

type st_1 from statictext within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 434
integer y = 2340
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_symetrie_vert from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 2437
integer y = 2112
integer width = 544
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Symétrie Verticale"
end type

event clicked;OLEObject myImage
int result

string dwresult

SetPointer(HourGlass!)

MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
SetPointer(HourGlass!)
//myImage.mogrify( "-flip", is_pathimg )
myImage.mogrify( "-flip", is_pathimgcopy)

destroy MyImage

p_image_base.picturename = ''
p_image_base.picturename = is_pathimgcopy

long ll_idx
ll_idx = upperbound(is_histo) + 1

if gs_langue = 'an' then
	is_histo[ll_idx] = "Vertical flip"
else
	is_histo[ll_idx] = "Symétrie verticale"
end if

is_listop[ll_idx] = "-flip"
is_listopsmall[ll_idx] = "-flip"
lb_histo.addItem(is_histo[ll_idx])
cb_undo.enabled = true
shl_undo.visible = TRUE
end event

type cb_annuler from commandbutton within w_modimg
string tag = "resize=n"
boolean visible = false
integer x = 1842
integer y = 2456
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;fileDelete(is_pathimgcopy)
	
close(parent)
end event

type p_image_base from picture within w_modimg
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
integer x = 142
integer y = 248
integer width = 2391
integer height = 1992
boolean focusrectangle = false
end type

event lbuttondown;if ib_crop then
	long ll_x, ll_y
	
//	p_l1.hide()
//	p_l2.hide()
//	p_l3.hide()
//	p_l4.hide()
//	p_carre.hide()

	il_x = xpos
	il_y = ypos
	ib_lbuttondown = true
	
	ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
	ll_y = UnitsToPixels(ypos, YUnitsToPixels!)
	
	if ii_act = 0 and &
		ll_x >= istr_rect.left and &
		ll_x <= istr_rect.right and &
		ll_y >= istr_rect.top and &
		ll_y <= istr_rect.bottom then
		ii_act = 1
	end if
	
	istr_rectdwn.left = istr_rect.left
	istr_rectdwn.right = istr_rect.right
	istr_rectdwn.top = istr_rect.top
	istr_rectdwn.bottom = istr_rect.bottom
end if

end event

event lbuttonup;ib_lbuttondown = false
ii_act = 0

if ib_isdrawrect then
	DrawFocusRect(il_dc, istr_rect)
	ib_isdrawrect = false
end if

if ib_crop then
	long ll_left, ll_right, ll_top, ll_bottom
	
	ll_left = PixelsToUnits(istr_rect.left, XPixelsToUnits!) + this.x
	ll_right = PixelsToUnits(istr_rect.right, XPixelsToUnits!) + this.x
	ll_top = PixelsToUnits(istr_rect.top, YPixelsToUnits!) + this.y
	ll_bottom = PixelsToUnits(istr_rect.bottom, YPixelsToUnits!) + this.y
	
	p_l1.move(ll_left, ll_top)
	p_l1.resize(ll_right - ll_left, 7)
	p_l2.move(ll_right, ll_top)
	p_l2.resize(7, ll_bottom - ll_top)
	p_l3.move(ll_left, ll_bottom)
	p_l3.resize(ll_right - ll_left, 7)
	p_l4.move(ll_left, ll_top)
	p_l4.resize(7, ll_bottom - ll_top)
	p_carre.move(ll_right - 8, ll_bottom - 8)
	p_carre.resize(24, 20)
	p_l1.show()
	p_l2.show()
	p_l3.show()
	p_l4.show()
	p_carre.show()
end if

end event

event mousemove;TRY
	if ib_crop and ib_lbuttondown then
		long ll_x, ll_y, ll_x1, ll_y1, ll_w, ll_h
		long ll_xp, ll_yp, ll_wp, ll_hp
		double ldb_ratioasporg, ldb_ratioaspfin
	
		if ib_isdrawrect then
			DrawFocusRect(il_dc, istr_rect)
		end if
		
		st_2.text = string(xpos)
		st_3.text = string(ypos)
		st_4.text = string(istr_rect.left)
		st_5.text = string(istr_rect.TOP)	
	
		choose case ii_act
		case 0
			//Mode création du carré
			
			if xpos > p_image_base.width then xpos = p_image_base.width
			//if xpos < p_image_base.x then xpos = p_image_base.x
			
			if ypos > p_image_base.height then ypos = p_image_base.height
			//if ypos < p_image_base.y then ypos = p_image_base.y
			
			if xpos < 0 THEN xpos = 0
			if ypos < 0 THEN ypos = 0
		
			if il_x <= xpos then
				istr_rect.left = il_x
				istr_rect.right = xpos
			else
				istr_rect.Left = xpos
				istr_rect.right = il_x
			end if
			if il_y <= ypos then
				istr_rect.top = il_y
				istr_rect.bottom = ypos
			else
				istr_rect.top = ypos
				istr_rect.bottom = il_y
			end if
		
			istr_rect.Left = UnitsToPixels(istr_rect.Left, XUnitsToPixels!)
			istr_rect.right = UnitsToPixels(istr_rect.right, XUnitsToPixels!)
			istr_rect.top = UnitsToPixels(istr_rect.top, YUnitsToPixels!)
			istr_rect.bottom = UnitsToPixels(istr_rect.bottom, YUnitsToPixels!)
			
			ll_x = istr_rect.left
			ll_y = istr_rect.top
			ll_w = istr_rect.right - istr_rect.left
			ll_h = istr_rect.bottom - istr_rect.top
			
			IF NOT cbx_inverser.checked THEN
				ldb_ratioasporg = UnitsToPixels(p_image_base.width, XUnitsToPixels!) / double(UnitsToPixels(p_image_base.height, YUnitsToPixels!))
				//ldb_ratioasporg = 0.9
				IF ll_h <> 0 THEN
					ldb_ratioaspfin = ll_w / double(ll_h)
				END IF
			ELSE
				ldb_ratioasporg = UnitsToPixels(p_image_base.height , YUnitsToPixels!) / double(UnitsToPixels(p_image_base.width, XUnitsToPixels!))
				//ldb_ratioasporg = 0.9
				IF ll_w <> 0 THEN
					ldb_ratioaspfin = ll_h / double(ll_w)
				END IF
			END IF

			if ldb_ratioasporg < ldb_ratioaspfin then
				if il_x <= xpos then
					istr_rect.right = ll_x + long(ll_h * ldb_ratioasporg)
				else
					istr_rect.left = istr_rect.right - long(ll_h * ldb_ratioasporg)
				end if
			elseif ldb_ratioasporg > ldb_ratioaspfin then
				if il_y <= ypos then
					istr_rect.bottom = ll_y + long(ll_w / ldb_ratioasporg)
				else
					istr_rect.top = istr_rect.bottom - long(ll_w / ldb_ratioasporg)
				end if
			end if
			
		case 1

			//Mode déplacement du carré
			ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
			ll_y = UnitsToPixels(ypos, YUnitsToPixels!)
			ll_x1 = UnitsToPixels(il_x, XUnitsToPixels!)
			ll_y1 = UnitsToPixels(il_y, YUnitsToPixels!)
			
			istr_rect.left = istr_rectdwn.left + ll_x - ll_x1
			istr_rect.right = istr_rectdwn.right + ll_x - ll_x1
			istr_rect.top = istr_rectdwn.top + ll_y - ll_y1
			istr_rect.bottom = istr_rectdwn.bottom + ll_y - ll_y1
	
			ll_xp = UnitsToPixels(p_image_base.x, XUnitsToPixels!)
			ll_yp = UnitsToPixels(p_image_base.y, YUnitsToPixels!)
			ll_wp = UnitsToPixels(p_image_base.width, XUnitsToPixels!)
			ll_hp = UnitsToPixels(p_image_base.height, YUnitsToPixels!)
			
			if (istr_rect.left + ll_xp) < ll_xp then
				istr_rect.left = 0
				istr_rect.right = 0 + (istr_rectdwn.right - istr_rectdwn.left)
				//istr_rect.left = ll_xp
				//istr_rect.right = ll_xp + (istr_rectdwn.right - istr_rectdwn.left)
			elseif istr_rect.right > ll_wp then
				istr_rect.right = ll_wp
				istr_rect.left = ll_wp - (istr_rectdwn.right - istr_rectdwn.left)
			end if
				
			if (istr_rect.top + ll_yp) < ll_yp then
				istr_rect.top = 0
				istr_rect.bottom = 0 + (istr_rectdwn.bottom - istr_rectdwn.top)
				//istr_rect.top = ll_yp
				//istr_rect.bottom = ll_yp + (istr_rectdwn.bottom - istr_rectdwn.top)
			elseif istr_rect.bottom > ll_hp then
				istr_rect.bottom = ll_hp
				istr_rect.top = ll_hp - (istr_rectdwn.bottom - istr_rectdwn.top)
			end if
			
		case 2
			//Mode resize du carré
			if xpos > p_image_base.width then xpos = p_image_base.width
			//if xpos < p_image_base.x then xpos = p_image_base.x
			if ypos > p_image_base.height then ypos = p_image_base.height
			//if ypos < p_image_base.y then ypos = p_image_base.y
			if xpos < 0 THEN xpos = 0
			if ypos < 0 THEN ypos = 0

	
			ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
			ll_y = UnitsToPixels(ypos, YUnitsToPixels!)
			ll_x1 = UnitsToPixels(il_x, XUnitsToPixels!)
			ll_y1 = UnitsToPixels(il_y, YUnitsToPixels!)
			
			if istr_rectdwn.right + ll_x - ll_x1 > istr_rectdwn.left then
				istr_rect.right = istr_rectdwn.right + ll_x - ll_x1
				istr_rect.left = istr_rectdwn.left
			else
				istr_rect.right = istr_rectdwn.left
				istr_rect.left = istr_rectdwn.right + ll_x - ll_x1
			end if
	
			if istr_rectdwn.bottom + ll_y - ll_y1 > istr_rectdwn.top then
				istr_rect.bottom = istr_rectdwn.bottom + ll_y - ll_y1
				istr_rect.top = istr_rectdwn.top
			else
				istr_rect.bottom = istr_rectdwn.top
				istr_rect.top = istr_rectdwn.bottom + ll_y - ll_y1
			end if
			
			ll_x = istr_rect.left
			ll_y = istr_rect.top
			ll_w = istr_rect.right - istr_rect.left
			ll_h = istr_rect.bottom - istr_rect.top
			
			IF NOT cbx_inverser.checked THEN
				ldb_ratioasporg = UnitsToPixels(p_image_base.width, XUnitsToPixels!) / double(UnitsToPixels(p_image_base.height, YUnitsToPixels!))
				IF ll_h <> 0 THEN
					ldb_ratioaspfin = ll_w / double(ll_h)
				END IF
			ELSE
				ldb_ratioasporg = UnitsToPixels(p_image_base.height, YUnitsToPixels!) / double(UnitsToPixels(p_image_base.width, XUnitsToPixels!))
				IF ll_w <> 0 THEN
					ldb_ratioaspfin = ll_h / double(ll_w)
				END IF
			END IF

			if ldb_ratioasporg < ldb_ratioaspfin then
				if istr_rect.left = istr_rectdwn.left then
					istr_rect.right = ll_x + long(ll_h * ldb_ratioasporg)
				else
					istr_rect.left = istr_rect.right - long(ll_h * ldb_ratioasporg)
				end if
			elseif ldb_ratioasporg > ldb_ratioaspfin then
				if istr_rect.top = istr_rectdwn.top then
					istr_rect.bottom = ll_y + long(ll_w / ldb_ratioasporg)
				else
					istr_rect.top = istr_rect.bottom - long(ll_w / ldb_ratioasporg)
				end if
			end if
		end choose
		
		DrawFocusRect(il_dc, istr_rect)
		ib_isdrawrect = true
	end if
CATCH ( runtimeerror l_Error )
END TRY
end event

event constructor;il_dc = GetDC(Handle(This))

end event

event destructor;ReleaseDC(Handle(This), il_dc)

end event

event doubleclicked;shl_visionner.event ue_vrai_clicked(0,0,0)
end event

type gb_historique from u_gb within w_modimg
integer x = 2949
integer y = 1004
integer width = 1330
integer height = 1220
integer taborder = 0
long backcolor = 15780518
string text = "Historique"
end type

type rr_1 from roundrectangle within w_modimg
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 41
integer y = 12
integer width = 2601
integer height = 2484
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_modimg
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 2729
integer y = 12
integer width = 1769
integer height = 2304
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_modimg
string tag = "resize=frbsr"
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 2789
integer y = 80
integer width = 1609
integer height = 100
integer cornerheight = 75
integer cornerwidth = 75
end type

type rr_4 from roundrectangle within w_modimg
string tag = "resize=frbsr"
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 142
integer y = 80
integer width = 2395
integer height = 100
integer cornerheight = 75
integer cornerwidth = 75
end type

