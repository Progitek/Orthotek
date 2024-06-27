$PBExportHeader$w_mail.srw
forward
global type w_mail from pro_w_mail
end type
end forward

global type w_mail from pro_w_mail
end type
global w_mail w_mail

on w_mail.create
int iCurrent
call super::create
end on

on w_mail.destroy
call super::destroy
end on

type pb_del from pro_w_mail`pb_del within w_mail
end type

type st_1 from pro_w_mail`st_1 within w_mail
end type

type sle_from from pro_w_mail`sle_from within w_mail
end type

type cbx_sendhtml from pro_w_mail`cbx_sendhtml within w_mail
end type

type cbx_receipt from pro_w_mail`cbx_receipt within w_mail
end type

type sle_to from pro_w_mail`sle_to within w_mail
end type

type uo_toolbar from pro_w_mail`uo_toolbar within w_mail
end type

type uo_toolbar2 from pro_w_mail`uo_toolbar2 within w_mail
end type

type st_attachement from pro_w_mail`st_attachement within w_mail
end type

type pb_add from pro_w_mail`pb_add within w_mail
integer width = 119
integer height = 104
end type

type mle_message from pro_w_mail`mle_message within w_mail
end type

type sle_subject from pro_w_mail`sle_subject within w_mail
end type

type st_subject from pro_w_mail`st_subject within w_mail
end type

type st_dest from pro_w_mail`st_dest within w_mail
end type

type cb_annuler from pro_w_mail`cb_annuler within w_mail
end type

type cb_envoyer from pro_w_mail`cb_envoyer within w_mail
end type

type lb_attachements from pro_w_mail`lb_attachements within w_mail
end type

