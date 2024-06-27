$PBExportHeader$w_etiquettes.srw
forward
global type w_etiquettes from w_child
end type
type cb_2 from commandbutton within w_etiquettes
end type
type cb_1 from commandbutton within w_etiquettes
end type
type lb_type from listbox within w_etiquettes
end type
type cb_printpt from commandbutton within w_etiquettes
end type
type st_2 from statictext within w_etiquettes
end type
type cb_previewpt from commandbutton within w_etiquettes
end type
type dw_etiptoutch from u_dw within w_etiquettes
end type
type rr_3 from roundrectangle within w_etiquettes
end type
type rr_2 from roundrectangle within w_etiquettes
end type
type st_title from statictext within w_etiquettes
end type
type cb_preview from commandbutton within w_etiquettes
end type
type cb_print_etiquette from commandbutton within w_etiquettes
end type
type cb_close from commandbutton within w_etiquettes
end type
type dw_etiquette_seule from u_dw within w_etiquettes
end type
type rr_1 from roundrectangle within w_etiquettes
end type
type rr_4 from roundrectangle within w_etiquettes
end type
type rr_5 from roundrectangle within w_etiquettes
end type
type ddlb_labelpt from dropdownlistbox within w_etiquettes
end type
type gb_ptoutch from groupbox within w_etiquettes
end type
type dw_etiq1 from u_dw within w_etiquettes
end type
type dw_etiq2 from u_dw within w_etiquettes
end type
type dw_etiq3 from u_dw within w_etiquettes
end type
type dw_etiq4 from u_dw within w_etiquettes
end type
type dw_etiq5 from u_dw within w_etiquettes
end type
type cb_print from commandbutton within w_etiquettes
end type
end forward

global type w_etiquettes from w_child
string tag = "Étiquettes"
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
cb_2 cb_2
cb_1 cb_1
lb_type lb_type
cb_printpt cb_printpt
st_2 st_2
cb_previewpt cb_previewpt
dw_etiptoutch dw_etiptoutch
rr_3 rr_3
rr_2 rr_2
st_title st_title
cb_preview cb_preview
cb_print_etiquette cb_print_etiquette
cb_close cb_close
dw_etiquette_seule dw_etiquette_seule
rr_1 rr_1
rr_4 rr_4
rr_5 rr_5
ddlb_labelpt ddlb_labelpt
gb_ptoutch gb_ptoutch
dw_etiq1 dw_etiq1
dw_etiq2 dw_etiq2
dw_etiq3 dw_etiq3
dw_etiq4 dw_etiq4
dw_etiq5 dw_etiq5
cb_print cb_print
end type
global w_etiquettes w_etiquettes

type variables
public long il_patid
end variables

forward prototypes
public subroutine wait (long temps)
end prototypes

public subroutine wait (long temps);long N,A
FOR N = 0 TO temps
	FOR N = 0 TO temps
		for N = 0 TO temps
			A = N+10
			A = A * N
		next
	NEXT
NEXT
end subroutine

on w_etiquettes.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.lb_type=create lb_type
this.cb_printpt=create cb_printpt
this.st_2=create st_2
this.cb_previewpt=create cb_previewpt
this.dw_etiptoutch=create dw_etiptoutch
this.rr_3=create rr_3
this.rr_2=create rr_2
this.st_title=create st_title
this.cb_preview=create cb_preview
this.cb_print_etiquette=create cb_print_etiquette
this.cb_close=create cb_close
this.dw_etiquette_seule=create dw_etiquette_seule
this.rr_1=create rr_1
this.rr_4=create rr_4
this.rr_5=create rr_5
this.ddlb_labelpt=create ddlb_labelpt
this.gb_ptoutch=create gb_ptoutch
this.dw_etiq1=create dw_etiq1
this.dw_etiq2=create dw_etiq2
this.dw_etiq3=create dw_etiq3
this.dw_etiq4=create dw_etiq4
this.dw_etiq5=create dw_etiq5
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.lb_type
this.Control[iCurrent+4]=this.cb_printpt
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cb_previewpt
this.Control[iCurrent+7]=this.dw_etiptoutch
this.Control[iCurrent+8]=this.rr_3
this.Control[iCurrent+9]=this.rr_2
this.Control[iCurrent+10]=this.st_title
this.Control[iCurrent+11]=this.cb_preview
this.Control[iCurrent+12]=this.cb_print_etiquette
this.Control[iCurrent+13]=this.cb_close
this.Control[iCurrent+14]=this.dw_etiquette_seule
this.Control[iCurrent+15]=this.rr_1
this.Control[iCurrent+16]=this.rr_4
this.Control[iCurrent+17]=this.rr_5
this.Control[iCurrent+18]=this.ddlb_labelpt
this.Control[iCurrent+19]=this.gb_ptoutch
this.Control[iCurrent+20]=this.dw_etiq1
this.Control[iCurrent+21]=this.dw_etiq2
this.Control[iCurrent+22]=this.dw_etiq3
this.Control[iCurrent+23]=this.dw_etiq4
this.Control[iCurrent+24]=this.dw_etiq5
this.Control[iCurrent+25]=this.cb_print
end on

on w_etiquettes.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.lb_type)
destroy(this.cb_printpt)
destroy(this.st_2)
destroy(this.cb_previewpt)
destroy(this.dw_etiptoutch)
destroy(this.rr_3)
destroy(this.rr_2)
destroy(this.st_title)
destroy(this.cb_preview)
destroy(this.cb_print_etiquette)
destroy(this.cb_close)
destroy(this.dw_etiquette_seule)
destroy(this.rr_1)
destroy(this.rr_4)
destroy(this.rr_5)
destroy(this.ddlb_labelpt)
destroy(this.gb_ptoutch)
destroy(this.dw_etiq1)
destroy(this.dw_etiq2)
destroy(this.dw_etiq3)
destroy(this.dw_etiq4)
destroy(this.dw_etiq5)
destroy(this.cb_print)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

gf_uhelp(il_patid)
if message.doubleparm > 0 then
	il_patid = message.doubleparm  //para ext
end if
end event

type cb_2 from commandbutton within w_etiquettes
integer x = 2181
integer y = 1696
integer width = 402
integer height = 72
integer taborder = 400
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pochette"
end type

event clicked;gi_imp = 1
datastore ds_etiqpochette1
ds_etiqpochette1 = create datastore
ds_etiqpochette1.dataobject = "d_etiqpochette1"
ds_etiqpochette1.SetTransObject(SQLCA)
ds_etiqpochette1.retrieve(il_patid)
ds_etiqpochette1.object.t_age.text = calculage(ds_etiqpochette1.getitemdate(1,'date_naissance'))
gb_datawindow = false
openwithparm(w_print_options,ds_etiqpochette1)
destroy ds_etiqpochette1
end event

type cb_1 from commandbutton within w_etiquettes
boolean visible = false
integer x = 736
integer y = 548
integer width = 338
integer height = 112
integer taborder = 390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;long row
string ls_etiq,ls_1,ls_2,ls_3,ls_4
row = dw_etiq1.getrow()
if isnull(dw_etiq1.getitemstring(row,'line1')) = false then 
	ls_1 = dw_etiq1.getitemstring(row,'line1') + '~n'
else
	ls_1 = ''
end if
if isnull(dw_etiq1.getitemstring(row,'line2')) = false then 
	ls_2 = dw_etiq1.getitemstring(row,'line2') + '~n'
else
	ls_2 = ''
end if
if isnull(dw_etiq1.getitemstring(row,'line3')) = false then 
	ls_3 = dw_etiq1.getitemstring(row,'line3') + '~n'
else
	ls_3 = ''
end if
if isnull(dw_etiq1.getitemstring(row,'line4')) = false then 
	ls_4 = dw_etiq1.getitemstring(row,'line4')
else
	ls_4 = ''
end if
ls_etiq = ls_1 + ls_2 + ls_3 + ls_4
dw_etiquette_seule.setitem(1,'etiquette',ls_etiq)
end event

type lb_type from listbox within w_etiquettes
integer y = 100
integer width = 718
integer height = 1668
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event constructor;long ll_idetiq
integer li_choix
string ls_etiqnom

Declare etiq Cursor For
 
SELECT id_etiq,etiqnom,choix 
FROM t_etiqchoix 
WHERE ortho_id = :v_no_ortho;
           			
OPEN etiq;

Fetch etiq Into :ll_idetiq,:ls_etiqnom,:li_choix;

Do While SQLCA.SQLCode = 0
	if li_choix = 1 then
   	AddItem(ls_etiqnom)
	end if
	Fetch etiq Into :ll_idetiq,:ls_etiqnom,:li_choix;
Loop

CLOSE etiq;
end event

event selectionchanged;cb_preview.event clicked()
end event

type cb_printpt from commandbutton within w_etiquettes
integer x = 1454
integer y = 1124
integer width = 677
integer height = 108
integer taborder = 340
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_etiptoutch)
end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type st_2 from statictext within w_etiquettes
integer x = 782
integer y = 1256
integer width = 1344
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "|-------------------------- 3~" de longueur -----------------------|"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = '|------------------------------ 3" long ------------------------------|'
end if
end event

type cb_previewpt from commandbutton within w_etiquettes
integer x = 782
integer y = 1124
integer width = 672
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Aperçu"
end type

event clicked;date ldt_datenaiss

choose case ddlb_labelpt.text
	case 'Étiquette modèle records'
		dw_etiptoutch.dataobject = 'd_etiptoutchrec'
	case 'Étiquette modèle finals records'
		dw_etiptoutch.dataobject = 'd_etiptoutchfinalrec'
	case 'Étiquette boîte'
		dw_etiptoutch.dataobject = 'd_etiptoutchboite'
	case 'Étiquette dossier consult'
		dw_etiptoutch.dataobject = 'd_etiptoutchdosscons'
	case 'Étiquette dossier actif'
		dw_etiptoutch.dataobject = 'd_etiptoutchdossactif'
	case 'Étiquette boîte appareil'
		dw_etiptoutch.dataobject = 'd_etiptoutchboiteapp'
end choose
dw_etiptoutch.settransobject(sqlca)
if dw_etiptoutch.Retrieve(il_patid) > 0 then
	if dw_etiptoutch.dataobject = 'd_etiptoutchrec' or dw_etiptoutch.dataobject = 'd_etiptoutchfinalrec' then
		ldt_datenaiss = dw_etiptoutch.getitemdate(dw_etiptoutch.getrow(),'date_naissance')
		dw_etiptoutch.object.t_age.text = calculagecomp(ldt_datenaiss)
	end if
	cb_printpt.enabled = true
else
	cb_printpt.enabled = false
end if

end event

event constructor;if v_langue = 'an' then
	this.text = "Preview"
end if
end event

type dw_etiptoutch from u_dw within w_etiquettes
integer x = 782
integer y = 1324
integer width = 1339
integer height = 172
integer taborder = 390
string title = "etiptoutch"
string dataobject = "d_etiptoutchrec"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)

end event

type rr_3 from roundrectangle within w_etiquettes
integer linethickness = 1
long fillcolor = 16777215
integer x = 2171
integer y = 672
integer width = 1467
integer height = 336
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_etiquettes
integer linethickness = 1
long fillcolor = 16777215
integer x = 2171
integer y = 340
integer width = 1467
integer height = 336
integer cornerheight = 40
integer cornerwidth = 46
end type

type st_title from statictext within w_etiquettes
integer width = 654
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Étiquettes"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Labels"
end if
end event

type cb_preview from commandbutton within w_etiquettes
integer y = 1780
integer width = 663
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Aperçu"
end type

event clicked;long ll_idetiq,ll_idcontact
integer v_print, enr = 0, id, v_referents_id
string ls_Item,ls_dw1,ls_dw2,ls_dw3,ls_dw4,ls_dw5, ls_prov
date ldt_datenaiss, ldt_daterdv
n_cst_fusion luo_fusion

dw_etiq1.setRedraw(false)
dw_etiq2.setRedraw(false)
dw_etiq3.setRedraw(false)
dw_etiq4.setRedraw(false)
dw_etiq5.setRedraw(false)

dw_etiq1.reset()
dw_etiq2.reset()
dw_etiq3.reset()
dw_etiq4.reset()
dw_etiq5.reset()
cb_print.enabled = false

ls_Item = lb_type.SelectedItem()
select id_etiq,refdw1,refdw2,refdw3,refdw4,refdw5 into :ll_idetiq,:ls_dw1,:ls_dw2,:ls_dw3,:ls_dw4,:ls_dw5 from t_etiqchoix where etiqnom = :ls_Item and ortho_id = :v_no_ortho;
if isnull(ls_dw1) then
	dw_etiq1.dataobject = 'd_etiq1'
	dw_etiq2.dataobject = 'd_etiq2'
	dw_etiq3.dataobject = 'd_etiq3'
	dw_etiq4.dataobject = 'd_etiq4'
	dw_etiq5.dataobject = 'd_etiq5'
	dw_etiq1.SetTransObject(SQLCA)
	dw_etiq2.SetTransObject(SQLCA)
	dw_etiq3.SetTransObject(SQLCA)
	dw_etiq4.SetTransObject(SQLCA)
	dw_etiq5.SetTransObject(SQLCA)
	dw_etiq1.Retrieve(ll_idetiq)
	dw_etiq2.Retrieve(ll_idetiq)
	dw_etiq3.Retrieve(ll_idetiq)
	dw_etiq4.Retrieve(ll_idetiq)
	dw_etiq5.Retrieve(ll_idetiq)
	select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
	dw_etiq1.setitem(1,'line1',luo_fusion.of_fusion(dw_etiq1.getitemstring(1,'line1'),ll_idcontact,0))
	dw_etiq1.setitem(1,'line2',luo_fusion.of_fusion(dw_etiq1.getitemstring(1,'line2'),ll_idcontact,0))
	dw_etiq1.setitem(1,'line3',luo_fusion.of_fusion(dw_etiq1.getitemstring(1,'line3'),ll_idcontact,0))
	dw_etiq1.setitem(1,'line4',luo_fusion.of_fusion(dw_etiq1.getitemstring(1,'line4'),ll_idcontact,0))
	dw_etiq2.setitem(1,'line5',luo_fusion.of_fusion(dw_etiq2.getitemstring(1,'line5'),ll_idcontact,0))
	dw_etiq2.setitem(1,'line6',luo_fusion.of_fusion(dw_etiq2.getitemstring(1,'line6'),ll_idcontact,0))
	dw_etiq2.setitem(1,'line7',luo_fusion.of_fusion(dw_etiq2.getitemstring(1,'line7'),ll_idcontact,0))
	dw_etiq2.setitem(1,'line8',luo_fusion.of_fusion(dw_etiq2.getitemstring(1,'line8'),ll_idcontact,0))
	dw_etiq3.setitem(1,'line9',luo_fusion.of_fusion(dw_etiq3.getitemstring(1,'line9'),ll_idcontact,0))
	dw_etiq3.setitem(1,'line10',luo_fusion.of_fusion(dw_etiq3.getitemstring(1,'line10'),ll_idcontact,0))
	dw_etiq3.setitem(1,'line11',luo_fusion.of_fusion(dw_etiq3.getitemstring(1,'line11'),ll_idcontact,0))
	dw_etiq3.setitem(1,'line12',luo_fusion.of_fusion(dw_etiq3.getitemstring(1,'line12'),ll_idcontact,0))
	dw_etiq4.setitem(1,'line13',luo_fusion.of_fusion(dw_etiq4.getitemstring(1,'line13'),ll_idcontact,0))
	dw_etiq4.setitem(1,'line14',luo_fusion.of_fusion(dw_etiq4.getitemstring(1,'line14'),ll_idcontact,0))
	dw_etiq4.setitem(1,'line15',luo_fusion.of_fusion(dw_etiq4.getitemstring(1,'line15'),ll_idcontact,0))
	dw_etiq4.setitem(1,'line16',luo_fusion.of_fusion(dw_etiq4.getitemstring(1,'line16'),ll_idcontact,0))
	dw_etiq5.setitem(1,'line17',luo_fusion.of_fusion(dw_etiq5.getitemstring(1,'line17'),ll_idcontact,0))
	dw_etiq5.setitem(1,'line18',luo_fusion.of_fusion(dw_etiq5.getitemstring(1,'line18'),ll_idcontact,0))
	dw_etiq5.setitem(1,'line19',luo_fusion.of_fusion(dw_etiq5.getitemstring(1,'line19'),ll_idcontact,0))
	dw_etiq5.setitem(1,'line20',luo_fusion.of_fusion(dw_etiq5.getitemstring(1,'line20'),ll_idcontact,0))
	dw_etiq1.modify("line1.alignment = " + string(dw_etiq1.getitemnumber(1,'align1')))
	dw_etiq1.modify("line2.alignment = " + string(dw_etiq1.getitemnumber(1,'align2')))
	dw_etiq1.modify("line3.alignment = " + string(dw_etiq1.getitemnumber(1,'align3')))
	dw_etiq1.modify("line4.alignment = " + string(dw_etiq1.getitemnumber(1,'align4')))
	dw_etiq2.modify("line5.alignment = " + string(dw_etiq2.getitemnumber(1,'align5')))
	dw_etiq2.modify("line6.alignment = " + string(dw_etiq2.getitemnumber(1,'align6')))
	dw_etiq2.modify("line7.alignment = " + string(dw_etiq2.getitemnumber(1,'align7')))
	dw_etiq2.modify("line8.alignment = " + string(dw_etiq2.getitemnumber(1,'align8')))
	dw_etiq3.modify("line9.alignment = " + string(dw_etiq3.getitemnumber(1,'align9')))
	dw_etiq3.modify("line10.alignment = " + string(dw_etiq3.getitemnumber(1,'align10')))
	dw_etiq3.modify("line11.alignment = " + string(dw_etiq3.getitemnumber(1,'align11')))
	dw_etiq3.modify("line12.alignment = " + string(dw_etiq3.getitemnumber(1,'align12')))
	dw_etiq4.modify("line13.alignment = " + string(dw_etiq4.getitemnumber(1,'align13')))
	dw_etiq4.modify("line14.alignment = " + string(dw_etiq4.getitemnumber(1,'align14')))
	dw_etiq4.modify("line15.alignment = " + string(dw_etiq4.getitemnumber(1,'align15')))
	dw_etiq4.modify("line16.alignment = " + string(dw_etiq4.getitemnumber(1,'align16')))
	dw_etiq5.modify("line17.alignment = " + string(dw_etiq5.getitemnumber(1,'align17')))
	dw_etiq5.modify("line18.alignment = " + string(dw_etiq5.getitemnumber(1,'align18')))
	dw_etiq5.modify("line19.alignment = " + string(dw_etiq5.getitemnumber(1,'align19')))
	dw_etiq5.modify("line20.alignment = " + string(dw_etiq5.getitemnumber(1,'align20')))
	cb_print.enabled = true
else
	CHOOSE CASE ls_Item
		CASE 'Étiquettes dossier (#pat.)'
			select (new_dossier) into :id from patient where patient_id = :il_patid;
			if isnull(id) = true then
				update patient set new_dossier = '' where patient_id = :il_patid;
				commit;
			end if
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq2.dataobject = ls_dw2
			dw_etiq2.SetTransObject(SQLCA)
			dw_etiq3.dataobject = ls_dw3
			dw_etiq3.SetTransObject(SQLCA)
			dw_etiq4.dataobject = ls_dw4
			dw_etiq4.SetTransObject(SQLCA)
			dw_etiq5.dataobject = ls_dw5
			dw_etiq5.SetTransObject(SQLCA)
			select traitement_id into :id from traitements where patient_id = :il_patid order by traitement_id desc;
			dw_etiq1.retrieve(il_patid, id)
			dw_etiq2.retrieve(il_patid, id)
			dw_etiq3.retrieve(il_patid, id)
			dw_etiq4.retrieve(il_patid, id)
			dw_etiq5.retrieve(il_patid, id)
			ldt_datenaiss = dw_etiq2.getitemdate(dw_etiq2.getrow(),'patient_date_naissance')
			dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
			dw_etiq3.object.t_age1.text = calculage(ldt_datenaiss)
			dw_etiq3.object.t_age2.text = calculage(ldt_datenaiss)
			enr = dw_etiq1.rowcount()
			if enr = 0 then
				messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
			else
				cb_print.enabled = true
			end if
		CASE 'Consultation'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq2.dataobject = ls_dw2
			dw_etiq2.SetTransObject(SQLCA)
			select traitement_id into :id from traitements where patient_id = :il_patid order by traitement_id desc;
			dw_etiq1.retrieve(il_patid, id)
			dw_etiq2.retrieve(il_patid, id)
			ldt_datenaiss = dw_etiq2.getitemdate(dw_etiq2.getrow(),'patient_date_naissance')
			dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
			enr = dw_etiq1.rowcount()
			if enr = 0 then
				messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
			else
				cb_print.enabled = true
			end if
				
		CASE 'Étiquettes dossier'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq2.dataobject = ls_dw2
			dw_etiq2.SetTransObject(SQLCA)
			dw_etiq3.dataobject = ls_dw3
			dw_etiq3.SetTransObject(SQLCA)
			dw_etiq4.dataobject = ls_dw4
			dw_etiq4.SetTransObject(SQLCA)
			dw_etiq5.dataobject = ls_dw5
			dw_etiq5.SetTransObject(SQLCA)
			select (new_dossier) into :id from patient where patient_id = :il_patid;
			if isnull(id) = true then
				update patient set new_dossier = '' where patient_id = :il_patid;
				commit;
			end if
			select traitement_id into :id from traitements where patient_id = :il_patid order by traitement_id desc;
			dw_etiq1.retrieve(il_patid, id)
			dw_etiq2.retrieve(il_patid, id)
			dw_etiq3.retrieve(il_patid, id)
			dw_etiq4.retrieve(il_patid, id)
			dw_etiq5.retrieve(il_patid, id)
			ldt_datenaiss = dw_etiq2.getitemdate(dw_etiq2.getrow(),'patient_date_naissance')
			dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
			dw_etiq3.object.t_age1.text = calculage(ldt_datenaiss)
			dw_etiq3.object.t_age2.text = calculage(ldt_datenaiss)
			enr = dw_etiq1.rowcount()
			if enr = 0 then
				messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
			else
				cb_print.enabled = true
			end if
			
		CASE 'Étiquette patient'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
		//	messagebox(string(il_patid),string(message.doubleparm))
			dw_etiq1.retrieve(il_patid)
			ls_prov = dw_etiq1.getItemString(dw_etiq1.getRow(),'patient_province')
			if ls_prov = 'USA' then
				dw_etiq1.modify("patient_code_postale.EditMask.Mask = ''")
			else
				dw_etiq1.modify("patient_code_postale.EditMask.Mask = '!#! #!#'")
			end if
			enr = dw_etiq1.rowcount()
			if enr = 0 then
				messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
			else
				cb_print.enabled = true
			end if
			
		CASE 'Étiquette responsable'
			open(w_etiquettechoixresp)
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
		//	messagebox(string(il_patid),string(message.doubleparm))
			dw_etiq1.retrieve(message.doubleparm)
			cb_print.enabled = true
				
		CASE 'Étiquette référent'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			select referant_nom into :v_referents_id from patient where patient_id = :numero_patient;
			dw_etiq1.retrieve(v_referents_id)
			enr = dw_etiq1.rowcount()
			if enr = 0 then
				messagebox("Avertissement","Le patient choisi n'a pas de référent!",Information!)
			else
				cb_print.enabled = true
			end if
		
		CASE 'Pochette'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			select (new_dossier) into :id from patient where patient_id = :il_patid;
			if isnull(id) = true then
				update patient set new_dossier = '' where patient_id = :il_patid;
				commit;
			end if
			dw_etiq1.retrieve(il_patid)
			enr = dw_etiq1.rowcount()
			cb_print.enabled = true
			
		CASE 'Modèle'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			enr = dw_etiq1.rowcount()
			if enr = 0 then
				messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
			else
				cb_print.enabled = true
			end if
			
		CASE 'Panorex et ceph'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
		
		CASE 'Étiquettes dossier (1)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Etiquettes dossier (RDV)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_daterdv = dw_etiq1.getItemDate(dw_etiq1.getRow(),'daterendezvous')
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
			if isnull(ldt_daterdv) then ldt_daterdv = today()
			dw_etiq1.object.t_age.text = calculagerelatif(ldt_datenaiss,ldt_daterdv)
			cb_print.enabled = true
		
		CASE 'Panorex et ceph (1)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'date_naissance')
			dw_etiq1.object.t_age.text = calculage(ldt_datenaiss)
			cb_print.enabled = true
			
		CASE 'Patient Nom'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Patient Rec'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq2.dataobject = ls_dw2
			dw_etiq2.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			dw_etiq2.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Patient Rec (3)'	
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq2.dataobject = ls_dw2
			dw_etiq2.SetTransObject(SQLCA)
			dw_etiq3.dataobject = ls_dw3
			dw_etiq3.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			dw_etiq2.retrieve(il_patid)
			dw_etiq3.retrieve(il_patid)
			cb_print.enabled = true
		
		CASE 'Patient Final Rec'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq2.dataobject = ls_dw2
			dw_etiq2.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			dw_etiq2.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Modèle(1)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Modèle(4)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Étiquette (4)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Modèle(4 courte)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Modèle patient (4)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
			
		CASE 'Initial'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'date_naissance')
			dw_etiq1.object.t_age.text = calculage(ldt_datenaiss)
			cb_print.enabled = true
			
		CASE 'Initial (2)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq2.dataobject = ls_dw2
			dw_etiq2.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			dw_etiq2.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'date_naissance')
			dw_etiq1.object.t_age.text = calculage(ldt_datenaiss)
			dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
			cb_print.enabled = true
		CASE 'Modèle(2)'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
		CASE 'Étiq. consultation'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
			dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
			cb_print.enabled = true
		CASE 'Étiq. contrôle'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
			dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
			cb_print.enabled = true
		CASE 'Étiq. finals'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
			dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
			cb_print.enabled = true
		CASE 'Étiq. duplicata'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
			dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
			cb_print.enabled = true
		CASE 'Étiq. records'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
			dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
			cb_print.enabled = true
		CASE 'Étiq. patient petit'
			dw_etiq1.dataobject = ls_dw1
			dw_etiq1.SetTransObject(SQLCA)
			dw_etiq1.retrieve(il_patid)
			cb_print.enabled = true
		CASE ELSE
			cb_print.enabled = false
			error_type(119)
	END CHOOSE
end if
	
dw_etiq1.setRedraw(true)
dw_etiq2.setRedraw(true)
dw_etiq3.setRedraw(true)
dw_etiq4.setRedraw(true)
dw_etiq5.setRedraw(true)
end event

event constructor;if v_langue = 'an' then
	cb_preview.Text = "Preview"
end if
end event

type cb_print_etiquette from commandbutton within w_etiquettes
integer x = 736
integer y = 440
integer width = 1431
integer height = 108
integer taborder = 380
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer cette étiquette"
end type

event clicked;dw_etiquette_seule.accepttext()

gi_imp = 2
gb_datawindow = true
gb_imp = true
openwithparm(w_print_options,dw_etiquette_seule)
end event

event constructor;if v_langue = 'an' then
	cb_print_etiquette.Text = "Print this label"
end if
end event

type cb_close from commandbutton within w_etiquettes
integer y = 1896
integer width = 3621
integer height = 108
integer taborder = 400
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;
close(parent)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type dw_etiquette_seule from u_dw within w_etiquettes
integer x = 759
integer y = 100
integer width = 1376
integer height = 332
integer taborder = 10
string dataobject = "d_etiquette_seule"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
insertrow(0)
SetFocus()
end event

type rr_1 from roundrectangle within w_etiquettes
integer linethickness = 1
long fillcolor = 16777215
integer x = 2171
integer y = 8
integer width = 1467
integer height = 336
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_4 from roundrectangle within w_etiquettes
integer linethickness = 1
long fillcolor = 16777215
integer x = 2171
integer y = 1004
integer width = 1467
integer height = 336
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_5 from roundrectangle within w_etiquettes
integer linethickness = 1
long fillcolor = 16777215
integer x = 2171
integer y = 1336
integer width = 1467
integer height = 336
integer cornerheight = 40
integer cornerwidth = 46
end type

type ddlb_labelpt from dropdownlistbox within w_etiquettes
integer x = 782
integer y = 1004
integer width = 1349
integer height = 508
integer taborder = 330
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string item[] = {"Étiquette modèle records","Étiquette modèle finals records","Étiquette boîte","Étiquette dossier consult","Étiquette dossier actif","Étiquette boîte appareil"}
end type

event selectionchanged;if index > 0 then
	cb_previewpt.enabled = true
else
	cb_previewpt.enabled = false
end if
cb_printpt.enabled = false
end event

type gb_ptoutch from groupbox within w_etiquettes
integer x = 759
integer y = 888
integer width = 1390
integer height = 636
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pour imprimante modèle P-Toutch seulement"
borderstyle borderstyle = stylebox!
end type

event constructor;if v_langue = 'an' then
	this.text = 'For P-Touch model printer only'
end if
end event

type dw_etiq1 from u_dw within w_etiquettes
integer x = 2185
integer y = 16
integer width = 1445
integer height = 316
integer taborder = 390
string title = "Étiquette 1"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type dw_etiq2 from u_dw within w_etiquettes
integer x = 2185
integer y = 348
integer width = 1445
integer height = 316
integer taborder = 390
string title = "Étiquette 2"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type dw_etiq3 from u_dw within w_etiquettes
integer x = 2185
integer y = 680
integer width = 1445
integer height = 316
integer taborder = 390
string title = "Étiquette 3"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type dw_etiq4 from u_dw within w_etiquettes
integer x = 2185
integer y = 1012
integer width = 1445
integer height = 316
integer taborder = 390
string title = "Étiquette 4"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type dw_etiq5 from u_dw within w_etiquettes
integer x = 2185
integer y = 1344
integer width = 1445
integer height = 316
integer taborder = 390
string title = "Étiquette 5"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type cb_print from commandbutton within w_etiquettes
integer y = 1780
integer width = 3621
integer height = 112
integer taborder = 340
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer l~'aperçu"
end type

event clicked;int v_print, enr = 0, id, v_referents_id,li_result
string ls_Item
datawindow ldw_test
gi_imp = 2

dw_etiq1.accepttext()
dw_etiq2.accepttext()
dw_etiq3.accepttext()
dw_etiq4.accepttext()
dw_etiq5.accepttext()

ls_Item = lb_type.SelectedItem()
if dw_etiq1.dataobject = 'd_etiq1' then
	gb_datawindow = true
	gb_imp = false
	openwithparm(w_print_options,dw_etiq1)
	ldw_test = message.powerObjectParm
	if not isNull(ldw_test) then
		ldw_test.print()
	
		if not (isnull(dw_etiq2.getitemstring(1,'line5')) and isnull(dw_etiq2.getitemstring(1,'line6')) and &
			isnull(dw_etiq2.getitemstring(1,'line7')) and isnull(dw_etiq2.getitemstring(1,'line8'))) then
			dw_etiq2.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
			dw_etiq2.object.datawindow.print.Paper.Source = ldw_test.object.datawindow.print.Paper.Source
			dw_etiq2.object.datawindow.print.collate = ldw_test.object.datawindow.print.collate
			dw_etiq2.object.datawindow.print.copies = ldw_test.object.datawindow.print.copies
			dw_etiq2.object.datawindow.print.margin.top = ldw_test.object.datawindow.print.margin.top
			dw_etiq2.object.datawindow.print.margin.left = ldw_test.object.datawindow.print.margin.left
			dw_etiq2.object.datawindow.print.page.range = ldw_test.object.datawindow.print.page.range
			dw_etiq2.print()
			if not (isnull(dw_etiq3.getitemstring(1,'line9')) and isnull(dw_etiq3.getitemstring(1,'line10')) and &
				isnull(dw_etiq3.getitemstring(1,'line11')) and isnull(dw_etiq3.getitemstring(1,'line12'))) then
				dw_etiq3.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq3.object.datawindow.print.Paper.Source = ldw_test.object.datawindow.print.Paper.Source
				dw_etiq3.object.datawindow.print.collate = ldw_test.object.datawindow.print.collate
				dw_etiq3.object.datawindow.print.copies = ldw_test.object.datawindow.print.copies
				dw_etiq3.object.datawindow.print.margin.top = ldw_test.object.datawindow.print.margin.top
				dw_etiq3.object.datawindow.print.margin.left = ldw_test.object.datawindow.print.margin.left
				dw_etiq3.object.datawindow.print.page.range = ldw_test.object.datawindow.print.page.range
				dw_etiq3.print()
				if not (isnull(dw_etiq4.getitemstring(1,'line13')) and isnull(dw_etiq4.getitemstring(1,'line14')) and &
					isnull(dw_etiq4.getitemstring(1,'line15')) and isnull(dw_etiq4.getitemstring(1,'line16')))	then
					dw_etiq4.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
					dw_etiq4.object.datawindow.print.Paper.Source = ldw_test.object.datawindow.print.Paper.Source
					dw_etiq4.object.datawindow.print.collate = ldw_test.object.datawindow.print.collate
					dw_etiq4.object.datawindow.print.copies = ldw_test.object.datawindow.print.copies
					dw_etiq4.object.datawindow.print.margin.top = ldw_test.object.datawindow.print.margin.top
					dw_etiq4.object.datawindow.print.margin.left = ldw_test.object.datawindow.print.margin.left
					dw_etiq4.object.datawindow.print.page.range = ldw_test.object.datawindow.print.page.range
					dw_etiq4.print()
					if not (isnull(dw_etiq5.getitemstring(1,'line17')) and isnull(dw_etiq5.getitemstring(1,'line18')) and &
						isnull(dw_etiq5.getitemstring(1,'line19')) and isnull(dw_etiq5.getitemstring(1,'line20'))) then
						dw_etiq5.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
						dw_etiq5.object.datawindow.print.Paper.Source = ldw_test.object.datawindow.print.Paper.Source
						dw_etiq5.object.datawindow.print.collate = ldw_test.object.datawindow.print.collate
						dw_etiq5.object.datawindow.print.copies = ldw_test.object.datawindow.print.copies
						dw_etiq5.object.datawindow.print.margin.top = ldw_test.object.datawindow.print.margin.top
						dw_etiq5.object.datawindow.print.margin.left = ldw_test.object.datawindow.print.margin.left
						dw_etiq5.object.datawindow.print.page.range = ldw_test.object.datawindow.print.page.range
						dw_etiq5.print()
					end if
				end if
			end if
		end if
	end if
	// replace l'imprimante par default
	PrintSetPrinter(gs_defaultprinter)
else
	CHOOSE CASE ls_Item
		CASE 'Étiquette patient', 'Étiquette responsable', 'Étiquette responsable (1)', &
			'Étiquette responsable (2)', 'Étiquette référent', 'Modèle', 'Panorex et ceph', &
			'Étiquettes dossier (1)', 'Panorex et ceph (1)', 'Patient Nom', 'Modèle(1)', &
			'Initial', 'Modèle(2)', 'Modèle(4)', 'Étiquette (4)', 'Modèle(4 courte)', &
			'Modèle patient (4)', 'Étiq. consultation', 'Étiq. contrôle', 'Étiq. finals', &
			'Étiq. duplicata', 'Étiq. records', 'Pochette', 'Étiq. patient petit','Etiquettes dossier (RDV)'
			gb_datawindow = true
			gb_imp = true
			openwithparm(w_print_options,dw_etiq1)
		CASE 'Étiquettes dossier (#pat.)', 'Étiquettes dossier'
			gb_datawindow = true
			gb_imp = false
			openwithparm(w_print_options,dw_etiq1)
			ldw_test = message.powerObjectParm
			if not isNull(ldw_test) then
				dw_etiq1.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq1.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq1.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq1.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq1.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq1.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq1.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq2.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq2.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq2.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq2.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq2.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq2.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq2.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq3.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq3.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq3.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq3.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq3.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq3.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq3.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq4.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq4.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq4.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq4.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq4.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq4.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq4.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq5.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq5.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq5.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq5.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq5.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq5.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq5.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq1.print()
				dw_etiq2.print()
				dw_etiq3.print()
				dw_etiq4.print()
				dw_etiq5.print()
			end if
		CASE 'Consultation', 'Étiquette consultation'
			gb_datawindow = true
			gb_imp = false
			openwithparm(w_print_options,dw_etiq1)
			ldw_test = message.powerObjectParm
			if not isNull(ldw_test) then
				dw_etiq1.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq1.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq1.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq1.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq1.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq1.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq1.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq2.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq2.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq2.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq2.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq2.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq2.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq2.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq1.print()
				dw_etiq2.print()
			end if
		CASE 'Patient Rec', 'Patient Final Rec', 'Initial (2)'
			gb_datawindow = true
			gb_imp = false
			openwithparm(w_print_options,dw_etiq1)
			ldw_test = message.powerObjectParm
			if not isNull(ldw_test) then
				dw_etiq1.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq1.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq1.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq1.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq1.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq1.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq1.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq2.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq2.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq2.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq2.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq2.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq2.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq2.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				if dw_etiq1.print() <> 1 then error_type(52)
				if dw_etiq2.print() <> 1 then error_type(52)
			end if
		CASE 'Patient Rec (3)'
			gb_datawindow = true
			gb_imp = false
			openwithparm(w_print_options,dw_etiq1)
			ldw_test = message.powerObjectParm
			if not isNull(ldw_test) then
				dw_etiq1.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq1.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq1.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq1.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq1.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq1.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq1.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq2.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq2.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq2.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq2.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq2.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq2.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq2.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				dw_etiq3.object.datawindow.print.PrinterName = ldw_test.object.datawindow.print.PrinterName
				dw_etiq3.Object.Datawindow.Print.Paper.Source = ldw_test.Object.Datawindow.Print.Paper.Source
				dw_etiq3.Object.Datawindow.Print.Collate = 'yes'
				dw_etiq3.Object.Datawindow.Print.Copies = ldw_test.Object.Datawindow.Print.Copies
				dw_etiq3.Object.Datawindow.Print.Margin.Top = ldw_test.Object.Datawindow.Print.Margin.Top
				dw_etiq3.Object.Datawindow.Print.Margin.Left = ldw_test.Object.Datawindow.Print.Margin.Left
				dw_etiq3.Object.Datawindow.Print.Page.Range = ldw_test.Object.Datawindow.Print.Page.Range
				if dw_etiq1.print() <> 1 then error_type(52)
				if dw_etiq2.print() <> 1 then error_type(52)
				if dw_etiq3.print() <> 1 then error_type(52)
			end if
			
		CASE ELSE
			cb_print.visible = false
			error_type(0)
	END CHOOSE
end if

end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print preview"
end if
end event

