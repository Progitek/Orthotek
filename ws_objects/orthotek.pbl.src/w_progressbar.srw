$PBExportHeader$w_progressbar.srw
forward
global type w_progressbar from window
end type
type uo_hpb from uo_progressbar within w_progressbar
end type
end forward

global type w_progressbar from window
integer width = 1573
integer height = 408
boolean titlebar = true
long backcolor = 67108864
string pointer = "Arrow!"
boolean center = true
uo_hpb uo_hpb
end type
global w_progressbar w_progressbar

forward prototypes
public subroutine of_tache (string fs_tache)
public subroutine of_max (long f_max)
public subroutine of_position (long f_pos)
end prototypes

public subroutine of_tache (string fs_tache);uo_hpb.f_tache(fs_tache)
end subroutine

public subroutine of_max (long f_max);uo_hpb.f_max(f_max)
end subroutine

public subroutine of_position (long f_pos);uo_hpb.f_position(f_pos)
end subroutine

on w_progressbar.create
this.uo_hpb=create uo_hpb
this.Control[]={this.uo_hpb}
end on

on w_progressbar.destroy
destroy(this.uo_hpb)
end on

type uo_hpb from uo_progressbar within w_progressbar
string pointer = "Arrow!"
end type

on uo_hpb.destroy
call uo_progressbar::destroy
end on

