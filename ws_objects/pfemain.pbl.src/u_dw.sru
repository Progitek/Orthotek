$PBExportHeader$u_dw.sru
$PBExportComments$Extension DataWindow class
forward
global type u_dw from pro_u_dw
end type
end forward

global type u_dw from pro_u_dw
event type integer dent_print ( integer ai_type_imprimante )
event type integer dent_printdlg ( integer ai_type_imp )
event type integer dent_preprintdlg ( ref n_cst_imp_info anv_imp_info )
end type
global u_dw u_dw

type variables
public:

// Type d'imprimante
constant integer RAPPORT = 1
constant integer ETIQUETTE = 10
constant integer P-TOUCH = 15
constant integer COUPON = 20
end variables

forward prototypes
protected function integer of_printdlg (integer ai_type_imp, boolean ab_print)
public function integer of_copier_options_imp (datawindow adw_dest)
public function integer of_copier_options_imp (datastore ads_dest)
end prototypes

event type integer dent_print(integer ai_type_imprimante);//////////////////////////////////////////////////////////////////////////////
//	Event:			dent_print
//	Arguments:		ai_Type_Imprimante
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Opens the print dialog to allow user to change print settings,
//						and then prints the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//		2009-10-19	Sébastien Tremblay - Création
//		2010-08-25	Sébastien Tremblay - Passer les paramètres par un objet
//////////////////////////////////////////////////////////////////////////////

return of_printdlg(ai_type_imprimante, true)
end event

event type integer dent_printdlg(integer ai_type_imp);//Évènement dent_printdlg
//
// Affiche la fenêtre des options d'impression
//
// Paramètres : ai_type_imp - Entier, le type d'imprimante, une des constantes de type (rapport, étiquette, etc.)
// Retourne : Entier - 1 succès
//							  0 annlé par l'utilisateur
//							  -1 échec (erreur)
//
// Création : 2009-10-19 - Sébastien Tremblay

return of_printdlg(ai_type_imp, false)
end event

event type integer dent_preprintdlg(ref n_cst_imp_info anv_imp_info);////////////////////////////////////////////////////////////////////////
// Évènement dent_preprintdlg
// 
// Arguments : anv_imp_info object n_cst_imp_info pour ajouter ou modifier des paramètres avant
//									 l'apparation de la fenêtre d'impression
//
// Retourne : Entier, 1 si succès
//							 -1 pour annulr l'affichage de la fenêtre
//
// À coder dans le descendant si on veut modifier ou ajouter des paramètres pour la fenêtre d'impression.
//
////////////////////////////////////////////////////////////////////////

return 1
end event

protected function integer of_printdlg (integer ai_type_imp, boolean ab_print);// Fonction protégée of_printdlg
// Fonction qui affiche la fenêtre d'options d'impression personnalisée de Dentitek
// Paramètres :	ai_type_imp - entier, une des constantes de type d'imprimante (rapport, étiquette, etc.)
//						ab_print - booléen, est-ce qu'on imprime ou pas
// Retourne :	Entier - 1 si on imprime
//								0 si on n'imprime pas (annulé par l'utilisateur)
//								-1 si erreur

// Création : 2009-10-19 - Sébastien Tremblay
// Modification : 2010-08-25 - Sébastien Tremblay

n_cst_imp_info lnv_imp

choose case ai_type_imp
	case RAPPORT, ETIQUETTE, P-TOUCH, COUPON
		if isNull(ab_print) then return -1 // Si l'autre argument est invalide
		// Sinon, ne rien faire : tout est beau
	case else
		// Inconnu, erreur
		return -1
end choose

lnv_imp.idw_imp = this
lnv_imp.ii_type_impression = ai_type_imp
lnv_imp.ib_imprimer = ab_print

if this.event dent_preprintdlg(lnv_imp) < 0 then return -1

gnv_app.inv_entrepotglobal.of_ajoutedonnee("Parametres impression", lnv_imp)

// Lancer la fenêtre d'options d'impression
open(w_print_options)

// Récupérer le résultat
lnv_imp = gnv_app.inv_entrepotglobal.of_retournedonnee("Parametres impression")

if isNull(lnv_imp) or not isValid(lnv_imp) then return -1

// Si l'utilisateur a annulé l'impression, le signaler en retour
if lnv_imp.ii_nb_copies < 0 then return 0

// Succès
return 1
end function

public function integer of_copier_options_imp (datawindow adw_dest);// Fonction of_copier_options_imp
// Copie les options d'impression de la datawindow courante vers la datawindow passée en paramètre
//
// Paramètres : adw_dest - Datawindow, la destination de la copie
// Retourne : Entier - 1 si succès, -1 si échec
//
// Historique
// 2009-10-19 - Sébastien Tremblay - Création

// Si aucun dataobject n'est attribué, erreur
if not IsValid(this.object.DataWindow) then return -1
if not IsValid(adw_dest.object.DataWindow) then return -1

adw_dest.object.DataWindow.Print.PrinterName = this.object.DataWindow.Print.PrinterName
adw_dest.object.DataWindow.Print.Collate = this.object.DataWindow.Print.Collate
adw_dest.object.DataWindow.Print.Copies = this.object.DataWindow.Print.Copies
adw_dest.object.DataWindow.Print.Page.Range = this.object.DataWindow.Print.Page.Range
adw_dest.object.DataWindow.Print.Page.RangeInclude = this.object.DataWindow.Print.Page.RangeInclude


return 1
end function

public function integer of_copier_options_imp (datastore ads_dest);// Fonction of_copier_options_imp
// Copie les options d'impression de la datawindow courante vers la datastore passée en paramètre
//
// Paramètres : ads_dest - Datastore, la destination de la copie
// Retourne : Entier - 1 si succès, -1 si échec
//
// Historique
// 2009-10-19 - Sébastien Tremblay - Création

// Si aucun dataobject n'est attribué, erreur
if not IsValid(this.object.DataWindow) then return -1
if not IsValid(ads_dest.object.DataWindow) then return -1

ads_dest.object.DataWindow.Print.PrinterName = this.object.DataWindow.Print.PrinterName
ads_dest.object.DataWindow.Print.Collate = this.object.DataWindow.Print.Collate
ads_dest.object.DataWindow.Print.Copies = this.object.DataWindow.Print.Copies
ads_dest.object.DataWindow.Print.Page.Range = this.object.DataWindow.Print.Page.Range
ads_dest.object.DataWindow.Print.Page.RangeInclude = this.object.DataWindow.Print.Page.RangeInclude

return 1
end function

event pfc_print;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_print
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Opens the print dialog to allow user to change print settings,
//						and then prints the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0			Initial version
//						5.0.01		Modified script to avoid 64K segment problem with 16bit machine code executables
//						5.0.04		Destroy local datastore prior to returning in error condition.
//						8.0			Return code of pfc_printdlg has changed for Cancel Action.  Changed
//							 		code to test on success rather than failure.
//						8.0			Set Printer chosen in print dialog
// 						10.0 		Use new overloaded function dw.Print(canceldlg, showPrintDlg) which could display Print Dialog.
//		2009-10-19	Sébastien Tremblay - Appelle l'évènement dent_print avec les paramètres par défaut
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2005, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//////////////////////////////////////////////////////////////////////////////

return this.event dent_print(this.RAPPORT)
end event

on u_dw.create
call super::create
end on

on u_dw.destroy
call super::destroy
end on

