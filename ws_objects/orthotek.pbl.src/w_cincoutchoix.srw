$PBExportHeader$w_cincoutchoix.srw
forward
global type w_cincoutchoix from window
end type
type st_10 from statictext within w_cincoutchoix
end type
type st_c10 from statictext within w_cincoutchoix
end type
type st_c9 from statictext within w_cincoutchoix
end type
type st_9 from statictext within w_cincoutchoix
end type
type pb_pret1 from u_pb within w_cincoutchoix
end type
type pb_cancel from u_pb within w_cincoutchoix
end type
type pb_pret from u_pb within w_cincoutchoix
end type
type st_c8 from statictext within w_cincoutchoix
end type
type st_c7 from statictext within w_cincoutchoix
end type
type st_c6 from statictext within w_cincoutchoix
end type
type st_c5 from statictext within w_cincoutchoix
end type
type st_c4 from statictext within w_cincoutchoix
end type
type st_c3 from statictext within w_cincoutchoix
end type
type st_c2 from statictext within w_cincoutchoix
end type
type st_1 from statictext within w_cincoutchoix
end type
type st_8 from statictext within w_cincoutchoix
end type
type st_7 from statictext within w_cincoutchoix
end type
type st_6 from statictext within w_cincoutchoix
end type
type st_4 from statictext within w_cincoutchoix
end type
type st_5 from statictext within w_cincoutchoix
end type
type st_3 from statictext within w_cincoutchoix
end type
type st_2 from statictext within w_cincoutchoix
end type
type st_c1 from statictext within w_cincoutchoix
end type
end forward

global type w_cincoutchoix from window
integer width = 1088
integer height = 1432
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_10 st_10
st_c10 st_c10
st_c9 st_c9
st_9 st_9
pb_pret1 pb_pret1
pb_cancel pb_cancel
pb_pret pb_pret
st_c8 st_c8
st_c7 st_c7
st_c6 st_c6
st_c5 st_c5
st_c4 st_c4
st_c3 st_c3
st_c2 st_c2
st_1 st_1
st_8 st_8
st_7 st_7
st_6 st_6
st_4 st_4
st_5 st_5
st_3 st_3
st_2 st_2
st_c1 st_c1
end type
global w_cincoutchoix w_cincoutchoix

type variables
private:
long il_color1, il_color2, il_color3, il_color4
long il_color5, il_color6, il_color7, il_color8, il_color9, il_color10
integer ii_act1, ii_act2, ii_act3, ii_act4
integer ii_act5, ii_act6, ii_act7, ii_act8, ii_act9, ii_act10
end variables

on w_cincoutchoix.create
this.st_10=create st_10
this.st_c10=create st_c10
this.st_c9=create st_c9
this.st_9=create st_9
this.pb_pret1=create pb_pret1
this.pb_cancel=create pb_cancel
this.pb_pret=create pb_pret
this.st_c8=create st_c8
this.st_c7=create st_c7
this.st_c6=create st_c6
this.st_c5=create st_c5
this.st_c4=create st_c4
this.st_c3=create st_c3
this.st_c2=create st_c2
this.st_1=create st_1
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_4=create st_4
this.st_5=create st_5
this.st_3=create st_3
this.st_2=create st_2
this.st_c1=create st_c1
this.Control[]={this.st_10,&
this.st_c10,&
this.st_c9,&
this.st_9,&
this.pb_pret1,&
this.pb_cancel,&
this.pb_pret,&
this.st_c8,&
this.st_c7,&
this.st_c6,&
this.st_c5,&
this.st_c4,&
this.st_c3,&
this.st_c2,&
this.st_1,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_4,&
this.st_5,&
this.st_3,&
this.st_2,&
this.st_c1}
end on

on w_cincoutchoix.destroy
destroy(this.st_10)
destroy(this.st_c10)
destroy(this.st_c9)
destroy(this.st_9)
destroy(this.pb_pret1)
destroy(this.pb_cancel)
destroy(this.pb_pret)
destroy(this.st_c8)
destroy(this.st_c7)
destroy(this.st_c6)
destroy(this.st_c5)
destroy(this.st_c4)
destroy(this.st_c3)
destroy(this.st_c2)
destroy(this.st_1)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_c1)
end on

event open;string ls_color1,ls_color2,ls_color3,ls_color4,ls_color5,ls_color6,ls_color7,ls_color8
string ls_color9, ls_color10

select cincoutchoixt1,
		 cincoutchoixt2,
		 cincoutchoixt3,
		 cincoutchoixt4,
		 cincoutchoixt5,
		 cincoutchoixt6,
		 cincoutchoixt7,
		 cincoutchoixt8,
		 cincoutchoixt9,
		 cincoutchoixt10,
		 cincoutchoixc1,
		 cincoutchoixc2,
		 cincoutchoixc3,
		 cincoutchoixc4,
		 cincoutchoixc5,
		 cincoutchoixc6,
		 cincoutchoixc7,
		 cincoutchoixc8,
		 cincoutchoixc9,
		 cincoutchoixc10,
		 isnull(pret1, 0),
		 isnull(pret2, 0),
		 isnull(pret3, 0),
		 isnull(pret4, 0),
		 isnull(pret5, 0),
		 isnull(pret6, 0),
		 isnull(pret7, 0),
		 isnull(pret8, 0),
		 isnull(pret9, 0),
		 isnull(pret10, 0)
into 	 :ls_color1,
	  	 :ls_color2,
	  	 :ls_color3,
	  	 :ls_color4,
	  	 :ls_color5,
	  	 :ls_color6,
	  	 :ls_color7,
	  	 :ls_color8,
		 :ls_color9,
		 :ls_color10,
	  	 :il_color1,
	  	 :il_color2,
	  	 :il_color3,
	  	 :il_color4,
	  	 :il_color5,
	  	 :il_color6,
	  	 :il_color7,
	  	 :il_color8,
		 :il_color9,
		 :il_color10,
		 :ii_act1,
		 :ii_act2,
		 :ii_act3,
		 :ii_act4,
		 :ii_act5,
		 :ii_act6,
		 :ii_act7,
		 :ii_act8,
		 :ii_act9,
		 :ii_act10
from t_options where ortho_id = :v_no_ortho;

st_1.text = ls_color1
st_2.text = ls_color2
st_3.text = ls_color3
st_4.text = ls_color4
st_5.text = ls_color5
st_6.text = ls_color6
st_7.text = ls_color7
st_8.text = ls_color8
st_9.text = ls_color9
st_10.text = ls_color10
st_c1.backcolor = il_color1
st_c2.backcolor = il_color2
st_c3.backcolor = il_color3
st_c4.backcolor = il_color4
st_c5.backcolor = il_color5
st_c6.backcolor = il_color6
st_c7.backcolor = il_color7
st_c8.backcolor = il_color8
st_c9.backcolor = il_color9
st_c10.backcolor = il_color10
end event

type st_10 from statictext within w_cincoutchoix
integer x = 224
integer y = 1096
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_c10 from statictext within w_cincoutchoix
integer x = 64
integer y = 1080
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color10
lstr_cc.i_action = ii_act10
closewithreturn(parent,lstr_cc)

end event

type st_c9 from statictext within w_cincoutchoix
integer x = 64
integer y = 964
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color9
lstr_cc.i_action = ii_act9
closewithreturn(parent,lstr_cc)

end event

type st_9 from statictext within w_cincoutchoix
integer x = 224
integer y = 980
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_pret1 from u_pb within w_cincoutchoix
integer x = 494
integer y = 1208
integer width = 549
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "En traitement"
end type

event clicked;call super::clicked;s_cnslcoul lstr_cc

lstr_cc.i_action = -2
closewithreturn(parent,lstr_cc)
end event

event constructor;call super::constructor;if v_langue = 'an' then
	pb_pret.text = "Being treated"
end if
end event

type pb_cancel from u_pb within w_cincoutchoix
integer x = 46
integer y = 1316
integer width = 997
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;call super::clicked;s_cnslcoul lstr_cc

lstr_cc.i_action = -3
closewithreturn(parent,lstr_cc)
end event

event constructor;call super::constructor;if v_langue = 'an' then
	pb_cancel.text = "Cancel"
end if
end event

type pb_pret from u_pb within w_cincoutchoix
integer x = 46
integer y = 1208
integer width = 448
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Prêt"
end type

event clicked;call super::clicked;s_cnslcoul lstr_cc

lstr_cc.i_action = -1
closewithreturn(parent,lstr_cc)
end event

event constructor;call super::constructor;if v_langue = 'an' then
	pb_pret.text = "Ready"
end if
end event

type st_c8 from statictext within w_cincoutchoix
integer x = 64
integer y = 848
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color8
lstr_cc.i_action = ii_act8
closewithreturn(parent,lstr_cc)

end event

type st_c7 from statictext within w_cincoutchoix
integer x = 64
integer y = 732
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color7
lstr_cc.i_action = ii_act7
closewithreturn(parent,lstr_cc)

end event

type st_c6 from statictext within w_cincoutchoix
integer x = 64
integer y = 616
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color6
lstr_cc.i_action = ii_act6
closewithreturn(parent,lstr_cc)

end event

type st_c5 from statictext within w_cincoutchoix
integer x = 64
integer y = 500
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color5
lstr_cc.i_action = ii_act5
closewithreturn(parent,lstr_cc)

end event

type st_c4 from statictext within w_cincoutchoix
integer x = 64
integer y = 384
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color4
lstr_cc.i_action = ii_act4
closewithreturn(parent,lstr_cc)

end event

type st_c3 from statictext within w_cincoutchoix
integer x = 64
integer y = 268
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color3
lstr_cc.i_action = ii_act3
closewithreturn(parent,lstr_cc)

end event

type st_c2 from statictext within w_cincoutchoix
integer x = 64
integer y = 152
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color2
lstr_cc.i_action = ii_act2
closewithreturn(parent,lstr_cc)

end event

type st_1 from statictext within w_cincoutchoix
integer x = 224
integer y = 52
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event constructor;string ls_color1

select cincoutchoixt1 into :ls_color1 from t_options where ortho_id = :v_no_ortho;
st_1.text = ls_color1
end event

type st_8 from statictext within w_cincoutchoix
integer x = 224
integer y = 864
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_7 from statictext within w_cincoutchoix
integer x = 224
integer y = 752
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_6 from statictext within w_cincoutchoix
integer x = 224
integer y = 632
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_4 from statictext within w_cincoutchoix
integer x = 224
integer y = 404
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_5 from statictext within w_cincoutchoix
integer x = 224
integer y = 516
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_3 from statictext within w_cincoutchoix
integer x = 224
integer y = 280
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_2 from statictext within w_cincoutchoix
integer x = 224
integer y = 160
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_c1 from statictext within w_cincoutchoix
integer x = 64
integer y = 36
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;s_cnslcoul lstr_cc

lstr_cc.l_couleur = il_color1
lstr_cc.i_action = ii_act1
closewithreturn(parent,lstr_cc)

end event

