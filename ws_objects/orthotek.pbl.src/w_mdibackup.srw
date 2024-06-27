$PBExportHeader$w_mdibackup.srw
forward
global type w_mdibackup from window
end type
type mdi_1 from mdiclient within w_mdibackup
end type
end forward

global type w_mdibackup from window
integer width = 3694
integer height = 2420
boolean titlebar = true
string title = "Backup"
string menuname = "m_template"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_mdibackup w_mdibackup

on w_mdibackup.create
if this.MenuName = "m_template" then this.MenuID = create m_template
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_mdibackup.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_mdibackup
long BackColor=268435456
end type

