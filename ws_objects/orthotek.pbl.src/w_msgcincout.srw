$PBExportHeader$w_msgcincout.srw
forward
global type w_msgcincout from w_response
end type
type st_text from u_st within w_msgcincout
end type
end forward

global type w_msgcincout from w_response
integer width = 2007
integer height = 380
boolean center = true
st_text st_text
end type
global w_msgcincout w_msgcincout

event open;call super::open;if message.stringparm = 'A' then
	st_text.text = "Thank you. You are now registered" 
end if
timer(3)
end event

event timer;call super::timer;close(w_msgcincout)
end event

on w_msgcincout.create
int iCurrent
call super::create
this.st_text=create st_text
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_text
end on

on w_msgcincout.destroy
call super::destroy
destroy(this.st_text)
end on

type st_text from u_st within w_msgcincout
integer x = 123
integer y = 64
integer width = 1778
integer height = 124
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Merci de vous être enregistré(e)"
end type

