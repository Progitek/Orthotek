$PBExportHeader$w_visionnerlot.srw
forward
global type w_visionnerlot from w_child
end type
type cb_close from u_cb within w_visionnerlot
end type
type cb_print from u_cb within w_visionnerlot
end type
type dw_visionnerretourlot from u_dw within w_visionnerlot
end type
end forward

global type w_visionnerlot from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
cb_close cb_close
cb_print cb_print
dw_visionnerretourlot dw_visionnerretourlot
end type
global w_visionnerlot w_visionnerlot

forward prototypes
public function string of_coderetour (string as_code)
end prototypes

public function string of_coderetour (string as_code);String ls_description
choose case as_code
	case '00'
		ls_description = 'Transaction acceptée'
	case '06'
		ls_description = "Erreur d'édition"
	case '12'
		ls_description = 'La transaction est invalide'
	case '13'
		ls_description = 'Le montant est invalide'
	case '14'
		ls_description = 'Le numéro de la carte est invalide'
	case '19'
		ls_description = 'Reprendre la transaction'
	case '23'
		ls_description = 'Frais de transaction invalide'
	case '33'
		ls_description = 'Carte expirée'
	case '40'
		ls_description = 'Transaction non prise en charge'
	case '54'
		ls_description = 'Carte expirée'
	case 'M6'
		ls_description = 'Numéro de carte invalide'
	case 'M7'
		ls_description = 'La carte de crédit est expirée'
	case else
		ls_description = 'Erreur ' + as_code
end choose
return ls_description
end function

on w_visionnerlot.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_visionnerretourlot=create dw_visionnerretourlot
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.dw_visionnerretourlot
end on

on w_visionnerlot.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_visionnerretourlot)
end on

event open;call super::open;String ls_filename, ls_Emp_Input, ls_fileline[], ls_codedescription, ls_nom
integer li_FileNum, li_row, li_upperbound 
long ll_nofact
date ld_datecheque

ls_filename = Message.StringParm
li_FileNum = FileOpen(ls_filename, LineMode!)
 FileRead(li_FileNum, ls_Emp_Input)
do while FileRead(li_FileNum, ls_Emp_Input) >= 0
	ls_fileline = split(ls_Emp_Input,',')
	li_upperbound = upperbound(ls_fileline)
	li_row = dw_visionnerretourlot.insertrow(0)
	dw_visionnerretourlot.setitem( li_row, 'montant', dec(ls_fileline[3])/100)
	dw_visionnerretourlot.setitem( li_row, 'numerocarte', ls_fileline[4])
	dw_visionnerretourlot.setitem( li_row, 'expiration', string(ls_fileline[5],'@@/@@'))
	ls_codedescription = of_coderetour(ls_fileline[7])
	dw_visionnerretourlot.setitem( li_row, 'descode', ls_codedescription)
	ll_nofact = long(ls_fileline[6])
	select cheques_postdates.date_cheque, isnull(patient.patient_prenom,'') + ' ' + isnull(patient.patient_nom,'')
	into :ld_datecheque, :ls_nom
	from cheques_postdates inner join traitements on cheques_postdates.traitement_patient_id = traitements.traitement_id
                        inner join patient on traitements.patient_id = patient.patient_id
	where cheques_postdates.cheques_postdates_id = :ll_nofact;
	dw_visionnerretourlot.setitem( li_row, 'datecheque', ld_datecheque)
	dw_visionnerretourlot.setitem( li_row, 'nom', ls_nom)
	if li_upperbound >= 8 then
		dw_visionnerretourlot.setitem( li_row, 'transaction', ls_fileline[8])
		if li_upperbound >= 9 then
			dw_visionnerretourlot.setitem( li_row, 'autorisation', ls_fileline[9])
		end if
	end if
loop
FileClose(li_FileNum)



end event

type cb_close from u_cb within w_visionnerlot
integer x = 3054
integer y = 1900
integer width = 576
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_print from u_cb within w_visionnerlot
integer x = 9
integer y = 1900
integer width = 576
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;call super::clicked;gb_datawindow = true
openwithparm(w_print_options,dw_visionnerretourlot)
end event

type dw_visionnerretourlot from u_dw within w_visionnerlot
integer x = 9
integer y = 12
integer width = 3621
integer height = 1868
integer taborder = 10
string dataobject = "d_visionnerretourlot"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

