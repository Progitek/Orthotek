$PBExportHeader$w_statustransfert.srw
forward
global type w_statustransfert from window
end type
type dw_ortho from u_dw within w_statustransfert
end type
type st_1 from statictext within w_statustransfert
end type
type cb_2 from commandbutton within w_statustransfert
end type
type cb_1 from commandbutton within w_statustransfert
end type
end forward

global type w_statustransfert from window
integer width = 1618
integer height = 592
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_ortho dw_ortho
st_1 st_1
cb_2 cb_2
cb_1 cb_1
end type
global w_statustransfert w_statustransfert

on w_statustransfert.create
this.dw_ortho=create dw_ortho
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_ortho,&
this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_statustransfert.destroy
destroy(this.dw_ortho)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_ortho from u_dw within w_statustransfert
integer x = 18
integer y = 80
integer width = 1559
integer height = 344
integer taborder = 10
string title = "ortho"
string dataobject = "dddw_ortho"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
Retrieve()

end event

event clicked;ScrollToRow(GetClickedRow())
end event

type st_1 from statictext within w_statustransfert
integer x = 18
integer y = 4
integer width = 1527
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transférer tous les statuts vers le spécialiste suivant:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_statustransfert
integer x = 914
integer y = 436
integer width = 667
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

event clicked;Close(parent)
end event

type cb_1 from commandbutton within w_statustransfert
integer x = 18
integer y = 440
integer width = 667
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
end type

event clicked;long ll_color_id,ll_orthoid
integer li_affect,li_ordre
string ls_code,ls_desc,ls_plan
decimal ld_prixsugg

ll_orthoid = dw_ortho.getitemnumber(dw_ortho.getrow(),'ortho_id')
if ll_orthoid > 0 then
	Declare status Cursor For
	 
	 SELECT 	t_status.code,
				t_status.description,
				t_status.affect,
				t_status.prixsugg,
				t_status.plancompte,
				t_status.ordrepaie				
		 FROM t_status
		WHERE t_status.ortho_id = :v_no_ortho;
							
	OPEN status;
	Fetch status Into :ls_code,:ls_desc,:li_affect,:ld_prixsugg,:ls_plan,:li_ordre;
	Do While SQLCA.SQLCode = 0
		insert into t_status(code,description,affect,prixsugg,plancompte,ordrepaie,ortho_id) 
		values (:ls_code,:ls_desc,:li_affect,:ld_prixsugg,:ls_plan,:li_ordre,:ll_orthoid);
		if (SQLCA.sqlCode <> 0) then
			messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
		end if
		Fetch status Into :ls_code,:ls_desc,:li_affect,:ld_prixsugg,:ls_plan,:li_ordre;
	Loop
	
	CLOSE status;
end if
close(parent)
end event

