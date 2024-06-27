$PBExportHeader$w_popup_message.srw
forward
global type w_popup_message from w_child
end type
type r_1 from rectangle within w_popup_message
end type
type shl_date from u_sth within w_popup_message
end type
type pb_close from u_pb within w_popup_message
end type
type st_1 from statictext within w_popup_message
end type
type shl_de from u_sth within w_popup_message
end type
type shl_message from u_sth within w_popup_message
end type
end forward

global type w_popup_message from w_child
integer y = 200
integer width = 1518
integer height = 328
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
long backcolor = 15780518
r_1 r_1
shl_date shl_date
pb_close pb_close
st_1 st_1
shl_de shl_de
shl_message shl_message
end type
global w_popup_message w_popup_message

type prototypes
Function boolean sndPlaySoundW (String SoundName, uint Flags) library "WinMM.dll"
Function uint waveOutGetNumDevs () Library "WINMM.DLL" 

end prototypes

type variables
long		il_temps_affichage, il_id_message
string	is_nom_msg = "", is_computername = ""
end variables

forward prototypes
public subroutine of_maj_affiche ()
end prototypes

public subroutine of_maj_affiche ();//of_maj_affiche

UPDATE t_message SET statut_affiche = 'o' WHERE id_message = :il_id_message ;
COMMIT USING SQLCA;
end subroutine

on w_popup_message.create
int iCurrent
call super::create
this.r_1=create r_1
this.shl_date=create shl_date
this.pb_close=create pb_close
this.st_1=create st_1
this.shl_de=create shl_de
this.shl_message=create shl_message
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.shl_date
this.Control[iCurrent+3]=this.pb_close
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.shl_de
this.Control[iCurrent+6]=this.shl_message
end on

on w_popup_message.destroy
call super::destroy
destroy(this.r_1)
destroy(this.shl_date)
destroy(this.pb_close)
destroy(this.st_1)
destroy(this.shl_de)
destroy(this.shl_message)
end on

event timer;call super::timer;Close(THIS)
end event

event open;call super::open;string	ls_nom, ls_prenom, ls_de, ls_sujet, ls_texte, ls_son
datetime	ldt_msg
long ll_couleur
window luo_win
luo_win = gnv_app.inv_messagerie.of_getwindow()

THIS.x = (luo_win.width - THIS.width) - 25
THIS.y = (luo_win.height - THIS.height) - 205

// Produire un son

SELECT sonmessage INTO :ls_son FROM t_options where ortho_id = :v_no_ortho;
IF ls_son = "Beep!" THEN
	beep(1)
ELSE
	//Jouer le son
	IF FileExists(ls_son) THEN
		IF WaveOutGetNumDevs() > 0 THEN sndPlaySoundW(ls_son, 0)
	END IF
END IF

//Temps d'affichage
// il_temps_affichage = long(gnv_app.inv_options.of_recuperer_option("delai_popup_message"))
il_temps_affichage = gnv_app.inv_messagerie.of_gettemps()
If IsNull(il_temps_affichage) THEN il_temps_affichage = 0

is_nom_msg = gnv_app.inv_messagerie.of_getnomuser()
is_computername = gnv_app.of_obtenir_nom_ordinateur( )

//Remplir l'hypertext
select dateenvoye, message_de, sujet, message_texte, id_message, isnull(couleur,15780518) 
into :ldt_msg, :ls_de, :ls_sujet, :ls_texte, :il_id_message, :ll_couleur 
from t_message 
where (t_message.message_a like :is_nom_msg  or t_message.message_a = :is_computername) AND  
		t_message.statut <> 'd' AND
		t_message.source = 'i' AND 
		t_message.statut_affiche = 'n' 
ORDER BY dateenvoye DESC ;

// On ajuste les couleurs selon la couleur demandée
w_popup_message.backcolor = ll_couleur
shl_message.backcolor = ll_couleur
shl_de.backcolor = ll_couleur
st_1.backcolor = ll_couleur
shl_date.backcolor = ll_couleur
r_1.fillcolor = ll_couleur

THIS.of_maj_affiche( )

shl_date.text = string(ldt_msg)
shl_de.text = "De: " + ls_de
If IsNull(ls_sujet) THEN ls_sujet = ""
If IsNull(ls_texte) THEN ls_texte = ""
shl_message.text = "Sujet:  " + ls_sujet + "~r~nTexte: " + ls_texte

IF il_temps_affichage <> 0 AND IsNull(il_temps_affichage) = FALSE THEN
	Timer(il_temps_affichage)
END IF
end event

type r_1 from rectangle within w_popup_message
long linecolor = 134217730
integer linethickness = 7
long fillcolor = 15780518
integer width = 1518
integer height = 328
end type

type shl_date from u_sth within w_popup_message
integer x = 23
integer y = 104
integer width = 494
integer height = 80
integer textsize = -8
long backcolor = 15780518
string text = ""
end type

event clicked;call super::clicked;w_boite_reception lw_fen

window luo_win
luo_win = gnv_app.inv_messagerie.of_getwindow()
opensheet(lw_fen,luo_win,2,layered!)

Close(parent)
end event

type pb_close from u_pb within w_popup_message
integer x = 1376
integer y = 12
integer width = 119
integer height = 104
integer taborder = 10
string text = ""
boolean flatstyle = true
string picturename = "c:\ii4net\dentitek\images\close_bleu.bmp"
end type

event clicked;call super::clicked;Close(parent)
end event

type st_1 from statictext within w_popup_message
integer x = 18
integer y = 28
integer width = 1321
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nouveau message"
boolean focusrectangle = false
end type

type shl_de from u_sth within w_popup_message
integer x = 530
integer y = 104
integer width = 974
integer height = 76
integer textsize = -8
long backcolor = 15780518
string text = ""
end type

event clicked;call super::clicked;w_boite_reception lw_fen

window luo_win
luo_win = gnv_app.inv_messagerie.of_getwindow()
opensheet(lw_fen,luo_win,2,layered!)

Close(parent)
end event

type shl_message from u_sth within w_popup_message
integer x = 23
integer y = 176
integer width = 1463
integer height = 124
boolean bringtotop = true
integer textsize = -8
long backcolor = 15780518
string text = ""
end type

event clicked;call super::clicked;w_boite_reception lw_fen

window luo_win
luo_win = gnv_app.inv_messagerie.of_getwindow()
opensheet(lw_fen,luo_win,2,layered!)

Close(parent)
end event

