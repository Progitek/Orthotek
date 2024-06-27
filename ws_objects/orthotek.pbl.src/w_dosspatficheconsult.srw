$PBExportHeader$w_dosspatficheconsult.srw
forward
global type w_dosspatficheconsult from w_child
end type
type cb_1 from commandbutton within w_dosspatficheconsult
end type
type cb_sauve from commandbutton within w_dosspatficheconsult
end type
type cb_print from commandbutton within w_dosspatficheconsult
end type
type cb_close from commandbutton within w_dosspatficheconsult
end type
type dw_dosspatficheconsult from u_dw within w_dosspatficheconsult
end type
end forward

global type w_dosspatficheconsult from w_child
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
boolean ib_isupdateable = false
cb_1 cb_1
cb_sauve cb_sauve
cb_print cb_print
cb_close cb_close
dw_dosspatficheconsult dw_dosspatficheconsult
end type
global w_dosspatficheconsult w_dosspatficheconsult

type variables
public long il_patid
end variables

forward prototypes
public subroutine save ()
end prototypes

public subroutine save ();if dw_dosspatficheconsult.update() = 1 then
	commit;
else
	rollback;
	error_type(50)
end if
end subroutine

on w_dosspatficheconsult.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_sauve=create cb_sauve
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_dosspatficheconsult=create dw_dosspatficheconsult
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_sauve
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_dosspatficheconsult
end on

on w_dosspatficheconsult.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_sauve)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_dosspatficheconsult)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

long ll_newrow
date ldt_age
il_patid = message.doubleparm  //externe parm
if dw_dosspatficheconsult.Retrieve(il_patid) = 0 then
	ll_newrow = dw_dosspatficheconsult.insertrow(0)
	dw_dosspatficheconsult.scrolltorow(ll_newrow)
	dw_dosspatficheconsult.setitem(ll_newrow,'t_consultations_patient_id',il_patid)
	save()
	dw_dosspatficheconsult.Retrieve(il_patid)
	ldt_age = dw_dosspatficheconsult.getitemdate(1,'date_naissance')
	dw_dosspatficheconsult.object.t_age.text = calculage(ldt_age)
else
	ldt_age = dw_dosspatficheconsult.getitemdate(1,'date_naissance')
	dw_dosspatficheconsult.object.t_age.text = calculage(ldt_age)
end if
end event

type cb_1 from commandbutton within w_dosspatficheconsult
integer x = 635
integer y = 1928
integer width = 1737
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_sauve from commandbutton within w_dosspatficheconsult
integer x = 2373
integer y = 1928
integer width = 626
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;save()
end event

type cb_print from commandbutton within w_dosspatficheconsult
integer x = 9
integer y = 1928
integer width = 626
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;date ldt_datenais

datastore ds_dosspatficheconsult
ds_dosspatficheconsult = create datastore
ds_dosspatficheconsult.dataobject = "d_dosspatficheconsult"
ds_dosspatficheconsult.SetTransObject(SQLCA)
ds_dosspatficheconsult.retrieve(il_patid)
gb_datawindow = false
openwithparm(w_print_options,ds_dosspatficheconsult)
destroy ds_dosspatficheconsult
end event

type cb_close from commandbutton within w_dosspatficheconsult
integer x = 2999
integer y = 1928
integer width = 635
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type dw_dosspatficheconsult from u_dw within w_dosspatficheconsult
integer width = 3630
integer height = 1928
integer taborder = 10
string title = "dosspatficheconsult"
string dataobject = "d_dosspatficheconsult"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)

if v_langue = 'an' then
	this.object.t_title.text = 'Consultation File'
end if
end event

event clicked;Choose case dwo.name
	case 't_consultations_d11'
		if getitemnumber(row,'t_consultations_e11') = 0 then
			setitem(row,'t_consultations_e11',1)
		else
			setitem(row,'t_consultations_e11',0)
		end if
	case 't_consultations_d12'
		if getitemnumber(row,'t_consultations_e12') = 0 then
			setitem(row,'t_consultations_e12',1)
		else
			setitem(row,'t_consultations_e12',0)
		end if
	case 't_consultations_d13'
		if getitemnumber(row,'t_consultations_e13') = 0 then
			setitem(row,'t_consultations_e13',1)
		else
			setitem(row,'t_consultations_e13',0)
		end if
	case 't_consultations_d14'
		if getitemnumber(row,'t_consultations_e14') = 0 then
			setitem(row,'t_consultations_e14',1)
		else
			setitem(row,'t_consultations_e14',0)
		end if
	case 't_consultations_d15'
		if getitemnumber(row,'t_consultations_e15') = 0 then
			setitem(row,'t_consultations_e15',1)
		else
			setitem(row,'t_consultations_e15',0)
		end if
	case 't_consultations_d16'
		if getitemnumber(row,'t_consultations_e16') = 0 then
			setitem(row,'t_consultations_e16',1)
		else
			setitem(row,'t_consultations_e16',0)
		end if
	case 't_consultations_d17'
		if getitemnumber(row,'t_consultations_e17') = 0 then
			setitem(row,'t_consultations_e17',1)
		else
			setitem(row,'t_consultations_e17',0)
		end if
	case 't_consultations_d18'
		if getitemnumber(row,'t_consultations_e18') = 0 then
			setitem(row,'t_consultations_e18',1)
		else
			setitem(row,'t_consultations_e18',0)
		end if
	case 't_consultations_d21'
		if getitemnumber(row,'t_consultations_e21') = 0 then
			setitem(row,'t_consultations_e21',1)
		else
			setitem(row,'t_consultations_e21',0)
		end if
	case 't_consultations_d22'
		if getitemnumber(row,'t_consultations_e22') = 0 then
			setitem(row,'t_consultations_e22',1)
		else
			setitem(row,'t_consultations_e22',0)
		end if
	case 't_consultations_d23'
		if getitemnumber(row,'t_consultations_e23') = 0 then
			setitem(row,'t_consultations_e23',1)
		else
			setitem(row,'t_consultations_e23',0)
		end if
	case 't_consultations_d24'
		if getitemnumber(row,'t_consultations_e24') = 0 then
			setitem(row,'t_consultations_e24',1)
		else
			setitem(row,'t_consultations_e24',0)
		end if
	case 't_consultations_d25'
		if getitemnumber(row,'t_consultations_e25') = 0 then
			setitem(row,'t_consultations_e25',1)
		else
			setitem(row,'t_consultations_e25',0)
		end if
	case 't_consultations_d26'
		if getitemnumber(row,'t_consultations_e26') = 0 then
			setitem(row,'t_consultations_e26',1)
		else
			setitem(row,'t_consultations_e26',0)
		end if
	case 't_consultations_d27'
		if getitemnumber(row,'t_consultations_e27') = 0 then
			setitem(row,'t_consultations_e27',1)
		else
			setitem(row,'t_consultations_e27',0)
		end if
	case 't_consultations_d28'
		if getitemnumber(row,'t_consultations_e28') = 0 then
			setitem(row,'t_consultations_e28',1)
		else
			setitem(row,'t_consultations_e28',0)
		end if
	case 't_consultations_d31'
		if getitemnumber(row,'t_consultations_e31') = 0 then
			setitem(row,'t_consultations_e31',1)
		else
			setitem(row,'t_consultations_e31',0)
		end if
	case 't_consultations_d32'
		if getitemnumber(row,'t_consultations_e32') = 0 then
			setitem(row,'t_consultations_e32',1)
		else
			setitem(row,'t_consultations_e32',0)
		end if
	case 't_consultations_d33'
		if getitemnumber(row,'t_consultations_e33') = 0 then
			setitem(row,'t_consultations_e33',1)
		else
			setitem(row,'t_consultations_e33',0)
		end if
	case 't_consultations_d34'
		if getitemnumber(row,'t_consultations_e34') = 0 then
			setitem(row,'t_consultations_e34',1)
		else
			setitem(row,'t_consultations_e34',0)
		end if
	case 't_consultations_d35'
		if getitemnumber(row,'t_consultations_e35') = 0 then
			setitem(row,'t_consultations_e35',1)
		else
			setitem(row,'t_consultations_e35',0)
		end if
	case 't_consultations_d36'
		if getitemnumber(row,'t_consultations_e36') = 0 then
			setitem(row,'t_consultations_e36',1)
		else
			setitem(row,'t_consultations_e36',0)
		end if
	case 't_consultations_d37'
		if getitemnumber(row,'t_consultations_e37') = 0 then
			setitem(row,'t_consultations_e37',1)
		else
			setitem(row,'t_consultations_e37',0)
		end if
	case 't_consultations_d38'
		if getitemnumber(row,'t_consultations_e38') = 0 then
			setitem(row,'t_consultations_e38',1)
		else
			setitem(row,'t_consultations_e38',0)
		end if
	case 't_consultations_d41'
		if getitemnumber(row,'t_consultations_e41') = 0 then
			setitem(row,'t_consultations_e41',1)
		else
			setitem(row,'t_consultations_e41',0)
		end if
	case 't_consultations_d42'
		if getitemnumber(row,'t_consultations_e42') = 0 then
			setitem(row,'t_consultations_e42',1)
		else
			setitem(row,'t_consultations_e42',0)
		end if
	case 't_consultations_d43'
		if getitemnumber(row,'t_consultations_e43') = 0 then
			setitem(row,'t_consultations_e43',1)
		else
			setitem(row,'t_consultations_e43',0)
		end if
	case 't_consultations_d44'
		if getitemnumber(row,'t_consultations_e44') = 0 then
			setitem(row,'t_consultations_e44',1)
		else
			setitem(row,'t_consultations_e44',0)
		end if
	case 't_consultations_d45'
		if getitemnumber(row,'t_consultations_e45') = 0 then
			setitem(row,'t_consultations_e45',1)
		else
			setitem(row,'t_consultations_e45',0)
		end if
	case 't_consultations_d46'
		if getitemnumber(row,'t_consultations_e46') = 0 then
			setitem(row,'t_consultations_e46',1)
		else
			setitem(row,'t_consultations_e46',0)
		end if
	case 't_consultations_d47'
		if getitemnumber(row,'t_consultations_e47') = 0 then
			setitem(row,'t_consultations_e47',1)
		else
			setitem(row,'t_consultations_e47',0)
		end if
	case 't_consultations_d48'
		if getitemnumber(row,'t_consultations_e48') = 0 then
			setitem(row,'t_consultations_e48',1)
		else
			setitem(row,'t_consultations_e48',0)
		end if
	case 't_consultations_d51'
		if getitemnumber(row,'t_consultations_e51') = 0 then
			setitem(row,'t_consultations_e51',1)
		else
			setitem(row,'t_consultations_e51',0)
		end if
	case 't_consultations_d52'
		if getitemnumber(row,'t_consultations_e52') = 0 then
			setitem(row,'t_consultations_e52',1)
		else
			setitem(row,'t_consultations_e52',0)
		end if
	case 't_consultations_d53'
		if getitemnumber(row,'t_consultations_e53') = 0 then
			setitem(row,'t_consultations_e53',1)
		else
			setitem(row,'t_consultations_e53',0)
		end if
	case 't_consultations_d54'
		if getitemnumber(row,'t_consultations_e54') = 0 then
			setitem(row,'t_consultations_e54',1)
		else
			setitem(row,'t_consultations_e54',0)
		end if
	case 't_consultations_d55'
		if getitemnumber(row,'t_consultations_e55') = 0 then
			setitem(row,'t_consultations_e55',1)
		else
			setitem(row,'t_consultations_e55',0)
		end if
	case 't_consultations_d61'
		if getitemnumber(row,'t_consultations_e61') = 0 then
			setitem(row,'t_consultations_e61',1)
		else
			setitem(row,'t_consultations_e61',0)
		end if
	case 't_consultations_d62'
		if getitemnumber(row,'t_consultations_e62') = 0 then
			setitem(row,'t_consultations_e62',1)
		else
			setitem(row,'t_consultations_e62',0)
		end if
	case 't_consultations_d63'
		if getitemnumber(row,'t_consultations_e63') = 0 then
			setitem(row,'t_consultations_e63',1)
		else
			setitem(row,'t_consultations_e63',0)
		end if
	case 't_consultations_d64'
		if getitemnumber(row,'t_consultations_e64') = 0 then
			setitem(row,'t_consultations_e64',1)
		else
			setitem(row,'t_consultations_e64',0)
		end if
	case 't_consultations_d65'
		if getitemnumber(row,'t_consultations_e65') = 0 then
			setitem(row,'t_consultations_e65',1)
		else
			setitem(row,'t_consultations_e65',0)
		end if
	case 't_consultations_d71'
		if getitemnumber(row,'t_consultations_e71') = 0 then
			setitem(row,'t_consultations_e71',1)
		else
			setitem(row,'t_consultations_e71',0)
		end if
	case 't_consultations_d72'
		if getitemnumber(row,'t_consultations_e72') = 0 then
			setitem(row,'t_consultations_e72',1)
		else
			setitem(row,'t_consultations_e72',0)
		end if
	case 't_consultations_d73'
		if getitemnumber(row,'t_consultations_e73') = 0 then
			setitem(row,'t_consultations_e73',1)
		else
			setitem(row,'t_consultations_e73',0)
		end if
	case 't_consultations_d74'
		if getitemnumber(row,'t_consultations_e74') = 0 then
			setitem(row,'t_consultations_e74',1)
		else
			setitem(row,'t_consultations_e74',0)
		end if
	case 't_consultations_d75'
		if getitemnumber(row,'t_consultations_e75') = 0 then
			setitem(row,'t_consultations_e75',1)
		else
			setitem(row,'t_consultations_e75',0)
		end if
	case 't_consultations_d81'
		if getitemnumber(row,'t_consultations_e81') = 0 then
			setitem(row,'t_consultations_e81',1)
		else
			setitem(row,'t_consultations_e81',0)
		end if
	case 't_consultations_d82'
		if getitemnumber(row,'t_consultations_e82') = 0 then
			setitem(row,'t_consultations_e82',1)
		else
			setitem(row,'t_consultations_e82',0)
		end if
	case 't_consultations_d83'
		if getitemnumber(row,'t_consultations_e83') = 0 then
			setitem(row,'t_consultations_e83',1)
		else
			setitem(row,'t_consultations_e83',0)
		end if
	case 't_consultations_d84'
		if getitemnumber(row,'t_consultations_e84') = 0 then
			setitem(row,'t_consultations_e84',1)
		else
			setitem(row,'t_consultations_e84',0)
		end if
	case 't_consultations_d85'
		if getitemnumber(row,'t_consultations_e85') = 0 then
			setitem(row,'t_consultations_e85',1)
		else
			setitem(row,'t_consultations_e85',0)
		end if
end choose
cb_sauve.setfocus()
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

