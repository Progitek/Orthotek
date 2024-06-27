$PBExportHeader$w_imgviewer.srw
forward
global type w_imgviewer from window
end type
type lb_file from listbox within w_imgviewer
end type
type dw_imgviewer from u_dw within w_imgviewer
end type
type cb_1 from commandbutton within w_imgviewer
end type
end forward

global type w_imgviewer from window
integer width = 3666
integer height = 2148
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
lb_file lb_file
dw_imgviewer dw_imgviewer
cb_1 cb_1
end type
global w_imgviewer w_imgviewer

type variables
public long il_patid
end variables

on w_imgviewer.create
this.lb_file=create lb_file
this.dw_imgviewer=create dw_imgviewer
this.cb_1=create cb_1
this.Control[]={this.lb_file,&
this.dw_imgviewer,&
this.cb_1}
end on

on w_imgviewer.destroy
destroy(this.lb_file)
destroy(this.dw_imgviewer)
destroy(this.cb_1)
end on

event open;il_patid = message.doubleparm
dw_imgviewer.event ue_retrieve()
end event

type lb_file from listbox within w_imgviewer
boolean visible = false
integer x = 1518
integer y = 1924
integer width = 978
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type dw_imgviewer from u_dw within w_imgviewer
event ue_retrieve ( )
integer y = 8
integer width = 3616
integer height = 1900
integer taborder = 10
string dataobject = "d_imgviewer"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_row, i, ll_patno, j
string ls_dossimg, ls_typemask, ls_patno, ls_temp

select chemphoto, maskdoss1 into :ls_dossimg, :ls_typemask from t_options where ortho_id = :v_no_ortho;
select no_dossier into :ll_patno from patient where patient_id = :il_patid;

if ls_typemask = 'mask1' then 
	ls_temp = mid(string(ll_patno),len(string(ll_patno)) -3,1)
	ls_temp += '-'
	ls_patno = ReplaceA (string(ll_patno), len(string(ll_patno)) - 3 , 1, ls_temp)
else
	ls_patno = string(ll_patno)
end if
lb_file.DirList(ls_dossimg + "\" + ls_patno + "\*.JPG", 0)
j = 1

for i = 1 to lb_file.totalitems()
	if j = 1 then ll_row = insertRow(0)
	lb_file.selectItem(i)
	setItem(ll_row,'nomphoto'+string(j),ls_dossimg + "\" + ls_patno + "\" + lb_file.selectedItem())
	if j = 4 then j = 0
	j++
next
end event

event clicked;call super::clicked;CHOOSE CASE dwo.name
	CASE 'nomphoto1'
		openwithparm(w_imgviewerfull,dw_imgviewer.getItemString(row,'nomphoto1'))
	CASE 'nomphoto2'
		openwithparm(w_imgviewerfull,dw_imgviewer.getItemString(row,'nomphoto2'))
	CASE 'nomphoto3'
		openwithparm(w_imgviewerfull,dw_imgviewer.getItemString(row,'nomphoto3'))
	CASE 'nomphoto4'
		openwithparm(w_imgviewerfull,dw_imgviewer.getItemString(row,'nomphoto4'))
END CHOOSE
end event

type cb_1 from commandbutton within w_imgviewer
integer x = 3218
integer y = 1916
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

event clicked;close(parent)
end event

