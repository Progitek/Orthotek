$PBExportHeader$w_archivage.srw
forward
global type w_archivage from window
end type
type st_1 from statictext within w_archivage
end type
type hpb_archive from hprogressbar within w_archivage
end type
type cb_archive from commandbutton within w_archivage
end type
end forward

global type w_archivage from window
integer width = 1751
integer height = 540
boolean titlebar = true
string title = "Archivage"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
st_1 st_1
hpb_archive hpb_archive
cb_archive cb_archive
end type
global w_archivage w_archivage

on w_archivage.create
this.st_1=create st_1
this.hpb_archive=create hpb_archive
this.cb_archive=create cb_archive
this.Control[]={this.st_1,&
this.hpb_archive,&
this.cb_archive}
end on

on w_archivage.destroy
destroy(this.st_1)
destroy(this.hpb_archive)
destroy(this.cb_archive)
end on

type st_1 from statictext within w_archivage
integer x = 5
integer y = 12
integer width = 1701
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "La procédure d~'archivage peut prendre quelques minutes."
boolean focusrectangle = false
end type

type hpb_archive from hprogressbar within w_archivage
integer x = 5
integer y = 356
integer width = 1696
integer height = 68
unsignedinteger maxposition = 100
integer setstep = 1
end type

type cb_archive from commandbutton within w_archivage
integer x = 439
integer y = 232
integer width = 791
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Archiver les patients"
end type

event clicked;//long i, ll_nbrow
//date ldt_fintrait
//
//datastore ds_archiver
//ds_archiver = create datastore
//ds_archiver.dataobject = "d_archiver"
//ds_archiver.SetTransObject(SQLCA)
//ds_archiver.retrieve()
//ll_nbrow = ds_archiver.rowcount()
//hpb_archive.SetRange(1, ll_nbrow)
//for i = 1 to ll_nbrow
//	ldt_fintrait = ds_archiver.getitemdate(i,'traitements_fin_traitement')
//	if ldt_fintrait <= today() then
//		ds_archiver.setitem(i,'archivedate',today())
//	end if
//	hpb_archive.StepIt()
//next
//ds_archiver.update()
//commit;
////hpb_archive.position = 0
//destroy ds_archiver
////if isvalid(w_patient) then
////	w_patient.dw_patient_master.event retourner()
////end if
//close(parent)
end event

