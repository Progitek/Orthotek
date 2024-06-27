$PBExportHeader$u_close.sru
forward
global type u_close from commandbutton
end type
end forward

global type u_close from commandbutton
int Width=535
int Height=112
int TabOrder=1
string Text="Fermer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type
global u_close u_close

event clicked;Close (this.GetParent())
end event

