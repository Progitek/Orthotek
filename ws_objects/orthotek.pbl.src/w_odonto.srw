$PBExportHeader$w_odonto.srw
forward
global type w_odonto from window
end type
type ddlb_typeodontogramme from u_ddlb within w_odonto
end type
type st_typeodontogramme from u_st within w_odonto
end type
type cb_paste from commandbutton within w_odonto
end type
type dw_odonto from u_dw within w_odonto
end type
type st_1 from statictext within w_odonto
end type
end forward

global type w_odonto from window
integer width = 2601
integer height = 976
boolean titlebar = true
string title = "Odontogramme"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ddlb_typeodontogramme ddlb_typeodontogramme
st_typeodontogramme st_typeodontogramme
cb_paste cb_paste
dw_odonto dw_odonto
st_1 st_1
end type
global w_odonto w_odonto

type variables
private long il_patid

end variables

forward prototypes
public function string odontoprim ()
public subroutine of_retodontodw ()
end prototypes

public function string odontoprim ();string ls_odonto1, ls_odonto2, ls_odonto3, ls_odonto
long row
int i

row = dw_odonto.getRow()
if dw_odonto.getitemnumber(row,'t_consultations_e55') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "55"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e54') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "54"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e53') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "53"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e52') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "52"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e51') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "51"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
//ls_odonto1 += remplir_string(1,"")
//ls_odonto1 += "|"
//ls_odonto1 += remplir_string(1,"")
if dw_odonto.getitemnumber(row,'t_consultations_e61') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "61"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e62') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "62"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e63') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "63"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e64') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "64"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e65') = 1 then
	ls_odonto1 += remplir_string(1,"")
	ls_odonto1 += "65"
	ls_odonto1 += remplir_string(1,"")
else
	ls_odonto1 += remplir_string(4,"")
end if
ls_odonto1 += "~r~n"
//for i = 1 to 18
//	ls_odonto2 += "-"
//next
//ls_odonto2 += remplir_string(1,"")
//ls_odonto2 += "|"
//ls_odonto2 += remplir_string(1,"")
for i = 1 to 39
	ls_odonto2 += "-"
next 
ls_odonto2 += "~r~n"
if dw_odonto.getitemnumber(row,'t_consultations_e85') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "85"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e84') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "84"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e83') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "83"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e82') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "82"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e81') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "81"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
//ls_odonto3 += remplir_string(1,"")
//ls_odonto3 += "|"
//ls_odonto3 += remplir_string(1,"")
if dw_odonto.getitemnumber(row,'t_consultations_e71') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "71"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e72') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "72"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e73') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "73"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e34') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "74"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
if dw_odonto.getitemnumber(row,'t_consultations_e75') = 1 then
	ls_odonto3 += remplir_string(1,"")
	ls_odonto3 += "75"
	ls_odonto3 += remplir_string(1,"")
else
	ls_odonto3 += remplir_string(4,"")
end if
ls_odonto = remplir_string(12,"") + ls_odonto1 + remplir_string(12,"") + ls_odonto2 + remplir_string(12,"") + ls_odonto3
return ls_odonto
end function

public subroutine of_retodontodw ();Long ll_idtypeodontogramme, ll_dent, ll_row, ll_row_ds
datastore ds_typeodontogramme

dw_odonto.setredraw( false)

ds_typeodontogramme = create datastore
ds_typeodontogramme.dataobject = "d_typeodontogramme"
ds_typeodontogramme.SetTransObject(SQLCA)

ll_idtypeodontogramme = long(ddlb_typeodontogramme.of_getselecteddata())

ds_typeodontogramme.retrieve()
ds_typeodontogramme.setfilter("id_typeodontogramme="+string(ll_idtypeodontogramme))
ds_typeodontogramme.filter()

ll_row = dw_odonto.getrow( )

for ll_dent = 1 to 8
	dw_odonto.setitem( ll_row, "t_consultations_e1"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d1"+string(ll_dent)))
	dw_odonto.setitem( ll_row, "t_consultations_e2"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d2"+string(ll_dent)))
	dw_odonto.setitem( ll_row, "t_consultations_e3"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d3"+string(ll_dent)))
	dw_odonto.setitem( ll_row, "t_consultations_e4"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d4"+string(ll_dent)))
	if ll_dent < 6 then
		dw_odonto.setitem( ll_row, "t_consultations_e5"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d5"+string(ll_dent)))
		dw_odonto.setitem( ll_row, "t_consultations_e6"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d6"+string(ll_dent)))
		dw_odonto.setitem( ll_row, "t_consultations_e7"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d7"+string(ll_dent)))
		dw_odonto.setitem( ll_row, "t_consultations_e8"+string(ll_dent), ds_typeodontogramme.getitemnumber(1, "d8"+string(ll_dent)))
	end if
next

destroy ds_typeodontogramme

dw_odonto.setredraw( true)
end subroutine

on w_odonto.create
this.ddlb_typeodontogramme=create ddlb_typeodontogramme
this.st_typeodontogramme=create st_typeodontogramme
this.cb_paste=create cb_paste
this.dw_odonto=create dw_odonto
this.st_1=create st_1
this.Control[]={this.ddlb_typeodontogramme,&
this.st_typeodontogramme,&
this.cb_paste,&
this.dw_odonto,&
this.st_1}
end on

on w_odonto.destroy
destroy(this.ddlb_typeodontogramme)
destroy(this.st_typeodontogramme)
destroy(this.cb_paste)
destroy(this.dw_odonto)
destroy(this.st_1)
end on

event open;string ls_dwo
long ll_row

il_patid = message.doubleparm
if dw_odonto.retrieve(il_patid) = 0 then
	ll_row = dw_odonto.insertRow(0)
	dw_odonto.scrollToRow(ll_row)
	dw_odonto.setItem(ll_row,'patient_id',il_patid)
end if
of_retodontodw( )


end event

type ddlb_typeodontogramme from u_ddlb within w_odonto
integer x = 1216
integer y = 8
integer width = 859
integer height = 328
integer taborder = 10
end type

event constructor;call super::constructor;string ls_nom, ls_idtypeodontogramme

DECLARE listtypeodon CURSOR FOR
	select id_typeodontogramme, isnull(nom,'') from t_typeodontogramme order by nom;
	
OPEN listtypeodon;

FETCH listtypeodon INTO :ls_idtypeodontogramme, :ls_nom;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_nom,Long(ls_idtypeodontogramme))
	
	FETCH listtypeodon INTO :ls_idtypeodontogramme, :ls_nom;
	
LOOP

CLOSE listtypeodon;

of_selectItem(1)
end event

event selectionchanged;call super::selectionchanged;of_retodontodw()
end event

type st_typeodontogramme from u_st within w_odonto
integer x = 704
integer y = 16
integer width = 517
string text = "Type d~'odontogramme :"
end type

type cb_paste from commandbutton within w_odonto
integer x = 2021
integer y = 768
integer width = 530
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copier"
end type

event clicked;long row
string ls_odonto
row = dw_odonto.getrow()

ls_odonto += "<<"

if dw_odonto.getitemnumber(row,'t_consultations_e18') = 1 then
	ls_odonto += '18 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e17') = 1 then
	ls_odonto += '17 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e16') = 1 then
	ls_odonto += '16 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e15') = 1 then
	ls_odonto += '15 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e14') = 1 then
	ls_odonto += '14 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e13') = 1 then
	ls_odonto += '13 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e12') = 1 then
	ls_odonto += '12 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e11') = 1 then
	ls_odonto += '11 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e21') = 1 then
	ls_odonto += '21 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e22') = 1 then
	ls_odonto += '22 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e23') = 1 then
	ls_odonto += '23 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e24') = 1 then
	ls_odonto += '24 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e25') = 1 then
	ls_odonto += '25 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e26') = 1 then
	ls_odonto += '26 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e27') = 1 then
	ls_odonto += '27 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e28') = 1 then
	ls_odonto += '28 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e48') = 1 then
	ls_odonto += '48 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e47') = 1 then
	ls_odonto += '47 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e46') = 1 then
	ls_odonto += '46 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e45') = 1 then
	ls_odonto += '45 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e44') = 1 then
	ls_odonto += '44 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e43') = 1 then
	ls_odonto += '43 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e42') = 1 then
	ls_odonto += '42 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e41') = 1 then
	ls_odonto += '41 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e31') = 1 then
	ls_odonto += '31 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e32') = 1 then
	ls_odonto += '32 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e33') = 1 then
	ls_odonto += '33 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e34') = 1 then
	ls_odonto += '34 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e35') = 1 then
	ls_odonto += '35 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e36') = 1 then
	ls_odonto += '36 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e37') = 1 then
	ls_odonto += '37 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e38') = 1 then
	ls_odonto += '38 '
end if
//
if dw_odonto.getitemnumber(row,'t_consultations_e55') = 1 then
	ls_odonto += '55 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e54') = 1 then
	ls_odonto += '54 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e53') = 1 then
	ls_odonto += '53 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e52') = 1 then
	ls_odonto += '52 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e51') = 1 then
	ls_odonto += '51 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e61') = 1 then
	ls_odonto += '61 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e62') = 1 then
	ls_odonto += '62 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e63') = 1 then
	ls_odonto += '63 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e64') = 1 then
	ls_odonto += '64 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e65') = 1 then
	ls_odonto += '65 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e75') = 1 then
	ls_odonto += '75 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e74') = 1 then
	ls_odonto += '74 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e73') = 1 then
	ls_odonto += '73 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e72') = 1 then
	ls_odonto += '72 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e71') = 1 then
	ls_odonto += '71 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e81') = 1 then
	ls_odonto += '81 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e82') = 1 then
	ls_odonto += '82 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e83') = 1 then
	ls_odonto += '83 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e84') = 1 then
	ls_odonto += '84 '
end if
if dw_odonto.getitemnumber(row,'t_consultations_e85') = 1 then
	ls_odonto += '85 '
end if
ls_odonto += ">>"
closewithreturn(parent,ls_odonto)
end event

type dw_odonto from u_dw within w_odonto
integer y = 104
integer width = 2514
integer height = 644
integer taborder = 10
string title = "none"
string dataobject = "d_odontomixte"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;dw_odonto.setredraw( false)
Choose case dwo.name
		case 't_consultations_d11'
			if getitemnumber(row,'t_consultations_e11') = 0 or isnull(getitemnumber(row,'t_consultations_e11')) then
				setitem(row,'t_consultations_e11',1)
			else
				setitem(row,'t_consultations_e11',0)
			end if
		case 't_consultations_d12'
			if getitemnumber(row,'t_consultations_e12') = 0 or isnull(getitemnumber(row,'t_consultations_e12')) then
				setitem(row,'t_consultations_e12',1)
			else
				setitem(row,'t_consultations_e12',0)
			end if
		case 't_consultations_d13'
			if getitemnumber(row,'t_consultations_e13') = 0 or isnull(getitemnumber(row,'t_consultations_e13')) then
				setitem(row,'t_consultations_e13',1)
			else
				setitem(row,'t_consultations_e13',0)
			end if
		case 't_consultations_d14'
			if getitemnumber(row,'t_consultations_e14') = 0 or isnull(getitemnumber(row,'t_consultations_e14')) then
				setitem(row,'t_consultations_e14',1)
			else
				setitem(row,'t_consultations_e14',0)
			end if
		case 't_consultations_d15'
			if getitemnumber(row,'t_consultations_e15') = 0 or isnull(getitemnumber(row,'t_consultations_e15')) then
				setitem(row,'t_consultations_e15',1)
			else
				setitem(row,'t_consultations_e15',0)
			end if
		case 't_consultations_d16'
			if getitemnumber(row,'t_consultations_e16') = 0 or isnull(getitemnumber(row,'t_consultations_e16')) then
				setitem(row,'t_consultations_e16',1)
			else
				setitem(row,'t_consultations_e16',0)
			end if
		case 't_consultations_d17'
			if getitemnumber(row,'t_consultations_e17') = 0 or isnull(getitemnumber(row,'t_consultations_e17')) then
				setitem(row,'t_consultations_e17',1)
			else
				setitem(row,'t_consultations_e17',0)
			end if
		case 't_consultations_d18'
			if getitemnumber(row,'t_consultations_e18') = 0 or isnull(getitemnumber(row,'t_consultations_e18')) then
				setitem(row,'t_consultations_e18',1)
			else
				setitem(row,'t_consultations_e18',0)
			end if
		case 't_consultations_d21'
			if getitemnumber(row,'t_consultations_e21') = 0 or isnull(getitemnumber(row,'t_consultations_e21')) then
				setitem(row,'t_consultations_e21',1)
			else
				setitem(row,'t_consultations_e21',0)
			end if
		case 't_consultations_d22'
			if getitemnumber(row,'t_consultations_e22') = 0 or isnull(getitemnumber(row,'t_consultations_e22')) then
				setitem(row,'t_consultations_e22',1)
			else
				setitem(row,'t_consultations_e22',0)
			end if
		case 't_consultations_d23'
			if getitemnumber(row,'t_consultations_e23') = 0 or isnull(getitemnumber(row,'t_consultations_e23')) then
				setitem(row,'t_consultations_e23',1)
			else
				setitem(row,'t_consultations_e23',0)
			end if
		case 't_consultations_d24'
			if getitemnumber(row,'t_consultations_e24') = 0 or isnull(getitemnumber(row,'t_consultations_e24')) then
				setitem(row,'t_consultations_e24',1)
			else
				setitem(row,'t_consultations_e24',0)
			end if
		case 't_consultations_d25'
			if getitemnumber(row,'t_consultations_e25') = 0 or isnull(getitemnumber(row,'t_consultations_e25')) then
				setitem(row,'t_consultations_e25',1)
			else
				setitem(row,'t_consultations_e25',0)
			end if
		case 't_consultations_d26'
			if getitemnumber(row,'t_consultations_e26') = 0 or isnull(getitemnumber(row,'t_consultations_e26')) then
				setitem(row,'t_consultations_e26',1)
			else
				setitem(row,'t_consultations_e26',0)
			end if
		case 't_consultations_d27'
			if getitemnumber(row,'t_consultations_e27') = 0 or isnull(getitemnumber(row,'t_consultations_e27')) then
				setitem(row,'t_consultations_e27',1)
			else
				setitem(row,'t_consultations_e27',0)
			end if
		case 't_consultations_d28'
			if getitemnumber(row,'t_consultations_e28') = 0 or isnull(getitemnumber(row,'t_consultations_e28')) then
				setitem(row,'t_consultations_e28',1)
			else
				setitem(row,'t_consultations_e28',0)
			end if
		case 't_consultations_d31'
			if getitemnumber(row,'t_consultations_e31') = 0 or isnull(getitemnumber(row,'t_consultations_e31')) then
				setitem(row,'t_consultations_e31',1)
			else
				setitem(row,'t_consultations_e31',0)
			end if
		case 't_consultations_d32'
			if getitemnumber(row,'t_consultations_e32') = 0 or isnull(getitemnumber(row,'t_consultations_e32')) then
				setitem(row,'t_consultations_e32',1)
			else
				setitem(row,'t_consultations_e32',0)
			end if
		case 't_consultations_d33'
			if getitemnumber(row,'t_consultations_e33') = 0 or isnull(getitemnumber(row,'t_consultations_e33')) then
				setitem(row,'t_consultations_e33',1)
			else
				setitem(row,'t_consultations_e33',0)
			end if
		case 't_consultations_d34'
			if getitemnumber(row,'t_consultations_e34') = 0 or isnull(getitemnumber(row,'t_consultations_e34')) then
				setitem(row,'t_consultations_e34',1)
			else
				setitem(row,'t_consultations_e34',0)
			end if
		case 't_consultations_d35'
			if getitemnumber(row,'t_consultations_e35') = 0 or isnull(getitemnumber(row,'t_consultations_e35')) then
				setitem(row,'t_consultations_e35',1)
			else
				setitem(row,'t_consultations_e35',0)
			end if
		case 't_consultations_d36'
			if getitemnumber(row,'t_consultations_e36') = 0 or isnull(getitemnumber(row,'t_consultations_e36')) then
				setitem(row,'t_consultations_e36',1)
			else
				setitem(row,'t_consultations_e36',0)
			end if
		case 't_consultations_d37'
			if getitemnumber(row,'t_consultations_e37') = 0 or isnull(getitemnumber(row,'t_consultations_e37')) then
				setitem(row,'t_consultations_e37',1)
			else
				setitem(row,'t_consultations_e37',0)
			end if
		case 't_consultations_d38'
			if getitemnumber(row,'t_consultations_e38') = 0 or isnull(getitemnumber(row,'t_consultations_e38')) then
				setitem(row,'t_consultations_e38',1)
			else
				setitem(row,'t_consultations_e38',0)
			end if
		case 't_consultations_d41'
			if getitemnumber(row,'t_consultations_e41') = 0 or isnull(getitemnumber(row,'t_consultations_e41')) then
				setitem(row,'t_consultations_e41',1)
			else
				setitem(row,'t_consultations_e41',0)
			end if
		case 't_consultations_d42'
			if getitemnumber(row,'t_consultations_e42') = 0 or isnull(getitemnumber(row,'t_consultations_e42')) then
				setitem(row,'t_consultations_e42',1)
			else
				setitem(row,'t_consultations_e42',0)
			end if
		case 't_consultations_d43'
			if getitemnumber(row,'t_consultations_e43') = 0 or isnull(getitemnumber(row,'t_consultations_e43')) then
				setitem(row,'t_consultations_e43',1)
			else
				setitem(row,'t_consultations_e43',0)
			end if
		case 't_consultations_d44'
			if getitemnumber(row,'t_consultations_e44') = 0 or isnull(getitemnumber(row,'t_consultations_e44')) then
				setitem(row,'t_consultations_e44',1)
			else
				setitem(row,'t_consultations_e44',0)
			end if
		case 't_consultations_d45'
			if getitemnumber(row,'t_consultations_e45') = 0 or isnull(getitemnumber(row,'t_consultations_e45')) then
				setitem(row,'t_consultations_e45',1)
			else
				setitem(row,'t_consultations_e45',0)
			end if
		case 't_consultations_d46'
			if getitemnumber(row,'t_consultations_e46') = 0 or isnull(getitemnumber(row,'t_consultations_e46')) then
				setitem(row,'t_consultations_e46',1)
			else
				setitem(row,'t_consultations_e46',0)
			end if
		case 't_consultations_d47'
			if getitemnumber(row,'t_consultations_e47') = 0 or isnull(getitemnumber(row,'t_consultations_e47')) then
				setitem(row,'t_consultations_e47',1)
			else
				setitem(row,'t_consultations_e47',0)
			end if
		case 't_consultations_d48'
			if getitemnumber(row,'t_consultations_e48') = 0 or isnull(getitemnumber(row,'t_consultations_e48')) then
				setitem(row,'t_consultations_e48',1)
			else
				setitem(row,'t_consultations_e48',0)
			end if
		case 't_consultations_d51'
			if getitemnumber(row,'t_consultations_e51') = 0 or isnull(getitemnumber(row,'t_consultations_e51')) then
				setitem(row,'t_consultations_e51',1)
			else
				setitem(row,'t_consultations_e51',0)
			end if
		case 't_consultations_d52'
			if getitemnumber(row,'t_consultations_e52') = 0 or isnull(getitemnumber(row,'t_consultations_e52')) then
				setitem(row,'t_consultations_e52',1)
			else
				setitem(row,'t_consultations_e52',0)
			end if
		case 't_consultations_d53'
			if getitemnumber(row,'t_consultations_e53') = 0 or isnull(getitemnumber(row,'t_consultations_e53')) then
				setitem(row,'t_consultations_e53',1)
			else
				setitem(row,'t_consultations_e53',0)
			end if
		case 't_consultations_d54'
			if getitemnumber(row,'t_consultations_e54') = 0 or isnull(getitemnumber(row,'t_consultations_e54')) then
				setitem(row,'t_consultations_e54',1)
			else
				setitem(row,'t_consultations_e54',0)
			end if
		case 't_consultations_d55'
			if getitemnumber(row,'t_consultations_e55') = 0 or isnull(getitemnumber(row,'t_consultations_e55')) then
				setitem(row,'t_consultations_e55',1)
			else
				setitem(row,'t_consultations_e55',0)
			end if
		case 't_consultations_d61'
			if getitemnumber(row,'t_consultations_e61') = 0 or isnull(getitemnumber(row,'t_consultations_e61')) then
				setitem(row,'t_consultations_e61',1)
			else
				setitem(row,'t_consultations_e61',0)
			end if
		case 't_consultations_d62'
			if getitemnumber(row,'t_consultations_e62') = 0 or isnull(getitemnumber(row,'t_consultations_e62')) then
				setitem(row,'t_consultations_e62',1)
			else
				setitem(row,'t_consultations_e62',0)
			end if
		case 't_consultations_d63'
			if getitemnumber(row,'t_consultations_e63') = 0 or isnull(getitemnumber(row,'t_consultations_e63')) then
				setitem(row,'t_consultations_e63',1)
			else
				setitem(row,'t_consultations_e63',0)
			end if
		case 't_consultations_d64'
			if getitemnumber(row,'t_consultations_e64') = 0 or isnull(getitemnumber(row,'t_consultations_e64')) then
				setitem(row,'t_consultations_e64',1)
			else
				setitem(row,'t_consultations_e64',0)
			end if
		case 't_consultations_d65'
			if getitemnumber(row,'t_consultations_e65') = 0 or isnull(getitemnumber(row,'t_consultations_e65')) then
				setitem(row,'t_consultations_e65',1)
			else
				setitem(row,'t_consultations_e65',0)
			end if
		case 't_consultations_d71'
			if getitemnumber(row,'t_consultations_e71') = 0 or isnull(getitemnumber(row,'t_consultations_e71')) then
				setitem(row,'t_consultations_e71',1)
			else
				setitem(row,'t_consultations_e71',0)
			end if
		case 't_consultations_d72'
			if getitemnumber(row,'t_consultations_e72') = 0 or isnull(getitemnumber(row,'t_consultations_e72')) then
				setitem(row,'t_consultations_e72',1)
			else
				setitem(row,'t_consultations_e72',0)
			end if
		case 't_consultations_d73'
			if getitemnumber(row,'t_consultations_e73') = 0 or isnull(getitemnumber(row,'t_consultations_e73')) then
				setitem(row,'t_consultations_e73',1)
			else
				setitem(row,'t_consultations_e73',0)
			end if
		case 't_consultations_d74'
			if getitemnumber(row,'t_consultations_e74') = 0 or isnull(getitemnumber(row,'t_consultations_e74')) then
				setitem(row,'t_consultations_e74',1)
			else
				setitem(row,'t_consultations_e74',0)
			end if
		case 't_consultations_d75'
			if getitemnumber(row,'t_consultations_e75') = 0 or isnull(getitemnumber(row,'t_consultations_e75')) then
				setitem(row,'t_consultations_e75',1)
			else
				setitem(row,'t_consultations_e75',0)
			end if
		case 't_consultations_d81'
			if getitemnumber(row,'t_consultations_e81') = 0 or isnull(getitemnumber(row,'t_consultations_e81')) then
				setitem(row,'t_consultations_e81',1)
			else
				setitem(row,'t_consultations_e81',0)
			end if
		case 't_consultations_d82'
			if getitemnumber(row,'t_consultations_e82') = 0 or isnull(getitemnumber(row,'t_consultations_e82')) then
				setitem(row,'t_consultations_e82',1)
			else
				setitem(row,'t_consultations_e82',0)
			end if
		case 't_consultations_d83'
			if getitemnumber(row,'t_consultations_e83') = 0 or isnull(getitemnumber(row,'t_consultations_e83')) then
				setitem(row,'t_consultations_e83',1)
			else
				setitem(row,'t_consultations_e83',0)
			end if
		case 't_consultations_d84'
			if getitemnumber(row,'t_consultations_e84') = 0 or isnull(getitemnumber(row,'t_consultations_e84')) then
				setitem(row,'t_consultations_e84',1)
			else
				setitem(row,'t_consultations_e84',0)
			end if
		case 't_consultations_d85'
			if getitemnumber(row,'t_consultations_e85') = 0 or isnull(getitemnumber(row,'t_consultations_e85')) then
				setitem(row,'t_consultations_e85',1)
			else
				setitem(row,'t_consultations_e85',0)
			end if
	END CHOOSE
	dw_odonto.setredraw(true)
end event

event constructor;setTransObject(SQLCA)
end event

type st_1 from statictext within w_odonto
integer x = 5
integer y = 8
integer width = 722
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Odontogramme"
boolean focusrectangle = false
end type

