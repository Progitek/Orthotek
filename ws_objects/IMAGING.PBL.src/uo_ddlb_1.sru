$PBExportHeader$uo_ddlb_1.sru
forward
global type uo_ddlb_1 from dropdownlistbox
end type
end forward

global type uo_ddlb_1 from dropdownlistbox
integer width = 549
integer height = 404
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Lateral","Frontal smile","Frontal"}
borderstyle borderstyle = stylelowered!
end type
global uo_ddlb_1 uo_ddlb_1

on uo_ddlb_1.create
end on

on uo_ddlb_1.destroy
end on

event selectionchanged;string i,this_name

this_name = this.classname()
i = right(this_name, 1)
if i = 'a' then i = '-3'
if i = 'b' then i = '-2'
if i = 'c' then i = '-1'

//insertion dans la table relation
Update t_imagingconf set img = :this.text where id_imgconf = :i and ortho_id = :v_no_ortho;
commit using sqlca;

w_imaging_template.tab_1.SelectedTab = integer(i);

choose case i
	case "1"
		w_imaging_template.tab_1.tabpage_1.dw_1.trigger event constructor();
	case "2"
		w_imaging_template.tab_1.tabpage_2.dw_2.trigger event constructor();
	case "3"
		w_imaging_template.tab_1.tabpage_3.dw_3.trigger event constructor();
	case "4"
		w_imaging_template.tab_1.tabpage_4.dw_4.trigger event constructor();
	case "5"
		w_imaging_template.tab_1.tabpage_5.dw_5.trigger event constructor();
	case "6"
		w_imaging_template.tab_1.tabpage_6.dw_6.trigger event constructor();
	case "7"
		w_imaging_template.tab_1.tabpage_7.dw_7.trigger event constructor();
	case "8"
		w_imaging_template.tab_1.tabpage_8.dw_8.trigger event constructor();
	case "9"
		w_imaging_template.tab_1.tabpage_9.dw_9.trigger event constructor();
end choose

end event

event constructor;string this_name, img_type
string i, ls_query

this_name = this.classname()
i = right(this_name, 1)
if i = 'a' then i = '-3'
if i = 'b' then i = '-2'
if i = 'c' then i = '-1'
select img into :img_type from t_imagingconf where id_imgconf = :i and ortho_id = :v_no_ortho;

this.selectitem(img_type, 0)
end event

