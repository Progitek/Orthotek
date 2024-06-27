$PBExportHeader$w_imgviewerfull.srw
forward
global type w_imgviewerfull from window
end type
type p_image from picture within w_imgviewerfull
end type
end forward

global type w_imgviewerfull from window
integer width = 3666
integer height = 2148
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_image p_image
end type
global w_imgviewerfull w_imgviewerfull

type variables
public long il_patid
end variables

on w_imgviewerfull.create
this.p_image=create p_image
this.Control[]={this.p_image}
end on

on w_imgviewerfull.destroy
destroy(this.p_image)
end on

event open;p_image.picturename = message.stringparm
end event

event doubleclicked;close(w_imgviewerfull)
end event

type p_image from picture within w_imgviewerfull
integer y = 4
integer width = 137
integer height = 148
boolean originalsize = true
boolean border = true
boolean focusrectangle = false
end type

