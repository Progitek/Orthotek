$PBExportHeader$w_typetraittransfert.srw
forward
global type w_typetraittransfert from window
end type
type dw_ortho from u_dw within w_typetraittransfert
end type
type st_1 from statictext within w_typetraittransfert
end type
type cb_2 from commandbutton within w_typetraittransfert
end type
type cb_1 from commandbutton within w_typetraittransfert
end type
end forward

global type w_typetraittransfert from window
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
global w_typetraittransfert w_typetraittransfert

on w_typetraittransfert.create
this.dw_ortho=create dw_ortho
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_ortho,&
this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_typetraittransfert.destroy
destroy(this.dw_ortho)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_ortho from u_dw within w_typetraittransfert
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

type st_1 from statictext within w_typetraittransfert
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
string text = "Transférer tous les traitements vers le spécialiste suivant:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_typetraittransfert
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

type cb_1 from commandbutton within w_typetraittransfert
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

event clicked;long ll_idtrait,ll_color_id,ll_orthoid
integer li_orderapp,li_rap
string ls_nom,ls_nip,ls_duree,ls_dt1,ls_dt2,ls_dt3

ll_orthoid = dw_ortho.getitemnumber(dw_ortho.getrow(),'ortho_id')
if ll_orthoid > 0 then
	Declare typetrait Cursor For
	 
	 SELECT 	type_de_traitement.type_traitement_id,   
				type_de_traitement.nom_traitement,
				type_de_traitement.nip_traitement,
				type_de_traitement.duree,
				type_de_traitement.color_id,
				type_de_traitement.orderapp,
				type_de_traitement.doctortime1,
				type_de_traitement.doctortime2,
				type_de_traitement.doctortime3,
				type_de_traitement.rap
		 FROM type_de_traitement
		WHERE type_de_traitement.ortho_id = :v_no_ortho;
							
	OPEN typetrait;
	Fetch typetrait Into :ll_idtrait,:ls_nom,:ls_nip,:ls_duree,:ll_color_id,:li_orderapp,:ls_dt1,:ls_dt2,:ls_dt3,:li_rap;
	Do While SQLCA.SQLCode = 0
		insert into type_de_traitement(ortho_id,nom_traitement,nip_traitement,duree,color_id,orderapp,doctortime1,doctortime2,doctortime3,rap) 
		values (:ll_orthoid,:ls_nom,:ls_nip,:ls_duree,:ll_color_id,:li_orderapp,:ls_dt1,:ls_dt2,:ls_dt3,:li_rap);
		if (SQLCA.sqlCode <> 0) then
			messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
		end if
		Fetch typetrait Into :ll_idtrait,:ls_nom,:ls_nip,:ls_duree,:ll_color_id,:li_orderapp,:ls_dt1,:ls_dt2,:ls_dt3,:li_rap;
	Loop
	
	CLOSE typetrait;
end if
close(parent)
end event

