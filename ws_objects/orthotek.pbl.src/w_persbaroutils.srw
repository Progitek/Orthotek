$PBExportHeader$w_persbaroutils.srw
forward
global type w_persbaroutils from w_child
end type
type dw_toolbar from u_dw within w_persbaroutils
end type
type st_titre from statictext within w_persbaroutils
end type
type tv_menu from u_tv within w_persbaroutils
end type
end forward

global type w_persbaroutils from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
dw_toolbar dw_toolbar
st_titre st_titre
tv_menu tv_menu
end type
global w_persbaroutils w_persbaroutils

forward prototypes
public function string of_getdesc (string as_text)
end prototypes

public function string of_getdesc (string as_text);//////////////////////////////////////////////////////////////////////////////
//	Function:				of_GetMenuDesc
//	Description:  		Return the text of an object.
//////////////////////////////////////////////////////////////////////////////
long ll_idx, ll_cnt, ll_pos
string ls_desc, ls_piece1, ls_piece2

SetPointer ( HourGlass! )

ls_desc = trim(as_text)

If ls_desc <> "" Then
	ls_desc = rep(ls_desc, "~"", "")
	ll_pos = Pos ( ls_desc, "&&" ) 
	If ll_pos > 0 Then
		ls_piece1 = Mid(ls_desc, 1, ll_pos - 1)
		ls_piece2 = Mid(ls_desc, ll_pos)
		ls_piece1 = rep(ls_piece1, "&", "")
		ls_piece2 = rep(ls_piece2, "&", "")
		ls_desc = ls_piece1 + "&" + ls_piece2
	Else
		ls_desc = rep(ls_desc, "&", "")
	End If
	ll_pos = Pos ( ls_desc, "~t" ) 
	If ll_pos > 0 Then
		ls_desc = Mid(ls_desc, 1, ll_pos - 1)
	End If
End If

Return ls_desc
end function

on w_persbaroutils.create
int iCurrent
call super::create
this.dw_toolbar=create dw_toolbar
this.st_titre=create st_titre
this.tv_menu=create tv_menu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_toolbar
this.Control[iCurrent+2]=this.st_titre
this.Control[iCurrent+3]=this.tv_menu
end on

on w_persbaroutils.destroy
call super::destroy
destroy(this.dw_toolbar)
destroy(this.st_titre)
destroy(this.tv_menu)
end on

event open;call super::open;long ll_cnt, ll_idx

title = "Personalisation de la barre d'outils système"

ll_cnt = UpperBound(w_principal.menuID.Item)
For ll_idx = 1 To ll_cnt
	tv_menu.event ue_refresh(w_principal.menuID.Item[ll_idx], w_principal.menuName + ".", 0)
Next

end event

type dw_toolbar from u_dw within w_persbaroutils
event type boolean ue_create ( integer ai_nbcol )
integer x = 9
integer y = 1856
integer width = 2816
integer height = 180
integer taborder = 20
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event type boolean ue_create(integer ai_nbcol);integer i
string ls_dbstx, ls_fnstx, ls_cols, ls_texts, ls_champs, ls_erreur

ls_dbstx = "release 10.5;~r~n&
datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.printername=~"~" print.documentname=~"~" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes print.preview.outline=yes hidegrayline=no )~r~n&
header(height=0 color=~"536870912~" )~r~n&
summary(height=0 color=~"536870912~" )~r~n&
footer(height=0 color=~"536870912~" )~r~n&
detail(height=0 color=~"536870912~" )~r~n&
table("

ls_fnstx = "htmltable(border=~"1~" )~r~n&
htmlgen(clientevents=~"1~" clientvalidation=~"1~" clientcomputedfields=~"1~" clientformatting=~"0~" clientscriptable=~"0~" generatejavascript=~"1~" encodeselflinkargs=~"1~" netscapelayers=~"0~" pagingmethod=0 generatedddwframes=~"1~" )~r~n&
xhtmlgen() cssgen(sessionspecific=~"0~" )~r~n&
xmlgen(inline=~"0~" )~r~n&
xsltgen()~r~n&
jsgen()~r~n&
export.xml(headgroups=~"1~" includewhitespace=~"0~" metadatatype=0 savemetadata=0 )~r~n&
import.xml()~r~n&
export.pdf(method=0 distill.custompostscript=~"0~" xslfop.print=~"0~" )~r~n&
 "

ls_cols = ""
ls_texts = ""
ls_champs = ""
For i = 1 To ai_nbcol
	ls_cols += "column=(type=char(200) updatewhereclause=no name=c" + string(i) + " dbname=~"c" + string(i) + "~" )~r~n"
	ls_texts += "text(band=header alignment=~"2~" text=~"~" border=~"0~" color=~"33554432~" x=~"" + string((i - 1) * 504) + "~" y=~"4~" height=~"76~" width=~"500~" html.valueishtml=~"0~"  name=t" + string(i) + " visible=~"1~"  font.face=~"Arial~" font.height=~"-12~" font.weight=~"700~"  font.family=~"2~" font.pitch=~"2~" font.charset=~"0~" background.mode=~"1~" background.color=~"536870912~" )~r~n"
	ls_champs += "column(band=detail id=" + string(i) + " alignment=~"2~" tabsequence=0 border=~"0~" color=~"0~" x=~"" + string((i - 1) * 504) + "~" y=~"4~" height=~"76~" width=~"500~" format=~"[General]~" html.valueishtml=~"0~"  name=c" + string(i) + " visible=~"1~" edit.limit=200 edit.case=any edit.autoselect=no edit.autohscroll=yes edit.imemode=0 edit.displayonly=yes font.face=~"Arial~" font.height=~"-12~" font.weight=~"400~"  font.family=~"2~" font.pitch=~"2~" font.charset=~"0~" background.mode=~"1~" background.color=~"536870912~" )~r~n"
Next

this.create(ls_dbstx + ls_cols + ' )~r~n' + ls_texts + ls_champs + ls_fnstx, ls_erreur)

if len(ls_erreur) > 0 then
	messagebox('Erreur Système', ls_erreur)
	return false
end if

return true

end event

type st_titre from statictext within w_persbaroutils
integer x = 5
integer y = 4
integer width = 1714
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Personalisation de la barre d~'outils système"
boolean focusrectangle = false
end type

type tv_menu from u_tv within w_persbaroutils
event ue_refresh ( menu am_menu,  string as_nom,  long al_parent )
integer x = 9
integer y = 108
integer width = 1810
integer height = 1748
integer taborder = 10
boolean linesatroot = true
boolean disabledragdrop = false
boolean hideselection = false
integer picturewidth = 16
integer pictureheight = 16
end type

event ue_refresh(menu am_menu, string as_nom, long al_parent);long ll_cnt, ll_idx, ll_hndl
string ls_name, ls_desc
treeViewItem ltvi_object
n_cst_string lnv_str
s_picname lstr_info

SetPointer ( HourGlass! )

if not isValid(am_menu) then return

// get the class itself
ls_name = lower(classname(am_menu))
ls_name = as_nom + ls_name

ls_desc = of_getDesc(am_menu.text)

if ls_desc = "" and al_parent <> 0 then return
if lnv_str.of_isFormat(ls_desc) then return

select count(*)
  into :ll_cnt
  from t_persdroits
 where (id_personnel = :gl_idpers
		 or id_personnel in (select id_group
									  from t_groupeusagers
									 where id_user = :gl_idpers))
	and objet = :ls_name;

if ll_cnt = 0 then return

ltvi_object.Label = ls_desc
lstr_info.s_name = ls_name
lstr_info.s_picture = am_menu.toolbarItemName
ltvi_object.Data = lstr_info
if am_menu.toolbarItemName <> "" then
	ltvi_object.PictureIndex = addPicture(am_menu.toolbarItemName)
	ltvi_object.SelectedPictureIndex = ltvi_object.PictureIndex
end if

ll_hndl = insertItemLast(al_parent, ltvi_object)

// see how many objects to be scaned
ll_cnt = UpperBound(am_menu.Item)
// get the controls on the object
For ll_idx = 1 To ll_cnt
	event ue_refresh(am_menu.Item[ll_idx], ls_name + ".", ll_hndl)
Next

end event

event begindrag;call super::begindrag;TreeViewItem	ltvi_This

this.GetItem(handle, ltvi_This)
if ltvi_this.PictureIndex = 0 then 
	this.drag(cancel!)
else
//	this.DragIcon = icône du toolbaritemname
	this.selectitem(handle)
end if

end event

