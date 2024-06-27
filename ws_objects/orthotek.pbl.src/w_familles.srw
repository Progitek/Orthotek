$PBExportHeader$w_familles.srw
forward
global type w_familles from w_child
end type
type cb_add from commandbutton within w_familles
end type
type cb_2 from commandbutton within w_familles
end type
type cb_1 from commandbutton within w_familles
end type
type sle_1 from singlelineedit within w_familles
end type
type dw_famillemembres from u_dw within w_familles
end type
type st_membre from statictext within w_familles
end type
type st_famille from statictext within w_familles
end type
type dw_familles from u_dw within w_familles
end type
type cb_close from commandbutton within w_familles
end type
end forward

global type w_familles from w_child
integer x = 5
integer y = 4
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_add cb_add
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
dw_famillemembres dw_famillemembres
st_membre st_membre
st_famille st_famille
dw_familles dw_familles
cb_close cb_close
end type
global w_familles w_familles

type variables
private long il_idfam, il_idpat
end variables

on w_familles.create
int iCurrent
call super::create
this.cb_add=create cb_add
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.dw_famillemembres=create dw_famillemembres
this.st_membre=create st_membre
this.st_famille=create st_famille
this.dw_familles=create dw_familles
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_add
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.dw_famillemembres
this.Control[iCurrent+6]=this.st_membre
this.Control[iCurrent+7]=this.st_famille
this.Control[iCurrent+8]=this.dw_familles
this.Control[iCurrent+9]=this.cb_close
end on

on w_familles.destroy
call super::destroy
destroy(this.cb_add)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.dw_famillemembres)
destroy(this.st_membre)
destroy(this.st_famille)
destroy(this.dw_familles)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_add from commandbutton within w_familles
integer x = 14
integer y = 1928
integer width = 965
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Créer une nouvelle famille"
end type

event clicked;if il_idfam > 0 then
	openwithparm(w_familleaddmembre,-1)
	dw_familles.Retrieve(v_no_ortho)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add a new family'
end if
end event

type cb_2 from commandbutton within w_familles
integer x = 1856
integer y = 1928
integer width = 878
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enlever un membre"
end type

event clicked;long nul
setnull(nul)
update patient set id_famille = :nul where patient_id = :il_idpat;
if error_type(-1) = 1 then
	commit using sqlca;
	dw_familles.retrieve(v_no_ortho)
else
	rollback using sqlca;
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete members'
end if
end event

type cb_1 from commandbutton within w_familles
integer x = 978
integer y = 1928
integer width = 878
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter un membre"
end type

event clicked;if il_idfam > 0 then
	openwithparm(w_familleaddmembre,il_idfam)
	dw_famillemembres.retrieve(il_idfam)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add members'
end if
end event

type sle_1 from singlelineedit within w_familles
integer x = 9
integer y = 88
integer width = 1751
integer height = 96
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

type dw_famillemembres from u_dw within w_familles
integer x = 1778
integer y = 88
integer width = 1833
integer height = 1832
integer taborder = 20
string title = "famillemembres"
string dataobject = "d_famillemembres"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)

end event

event rowfocuschanged;il_idpat = getitemnumber(currentrow,'patient_id')
end event

type st_membre from statictext within w_familles
integer x = 1778
integer width = 1833
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Membre de la famille"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Family members'
end if
end event

type st_famille from statictext within w_familles
integer x = 9
integer width = 1751
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Liste des familles"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Families'
end if
end event

type dw_familles from u_dw within w_familles
integer x = 9
integer y = 200
integer width = 1751
integer height = 1720
integer taborder = 10
string title = "familles"
string dataobject = "d_familles"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_fam.text = 'Family'
end if

SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
Retrieve(v_no_ortho)
end event

event rowfocuschanged;il_idfam = getitemnumber(currentrow,'id_famille')
dw_famillemembres.retrieve(il_idfam)
end event

type cb_close from commandbutton within w_familles
integer x = 2734
integer y = 1928
integer width = 878
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

