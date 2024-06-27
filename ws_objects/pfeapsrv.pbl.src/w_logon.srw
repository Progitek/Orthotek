$PBExportHeader$w_logon.srw
$PBExportComments$Extension Logon window
forward
global type w_logon from pro_w_logon
end type
end forward

global type w_logon from pro_w_logon
integer width = 2478
integer height = 1080
end type
global w_logon w_logon

on w_logon.create
call super::create
end on

on w_logon.destroy
call super::destroy
end on

event pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:  Peform logon
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Enhanced to support multiple logon attempts.
//
//////////////////////////////////////////////////////////////////////////////
//
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
//
//////////////////////////////////////////////////////////////////////////////

integer	li_rc

//////////////////////////////////////////////////////////////////////////////
// Check required fields
//////////////////////////////////////////////////////////////////////////////
if Len (sle_userid.text) = 0 then
	of_MessageBox ("pfc_logon_enterid", inv_logonattrib.is_appname, &
		"Veuillez entrer un nom d'utilisateur pour vous connecter.", exclamation!, OK!, 1)
	sle_userid.SetFocus()
	return
end if
if Len (sle_password.text) = 0 then
	of_MessageBox ("pfc_logon_enterpassword", inv_logonattrib.is_appname, &
		"Veuillez entrer un mot de passe pour vous connecter.", exclamation!, OK!, 1)
	sle_password.SetFocus()
	return
end if
if Isnull(inv_logonattrib.ipo_source) or Not IsValid (inv_logonattrib.ipo_source) then
	this.event pfc_cancel()
	return
End If

//////////////////////////////////////////////////////////////////////////////
// Attempt to logon
//////////////////////////////////////////////////////////////////////////////
ii_logonattempts --
li_rc = inv_logonattrib.ipo_source.dynamic event pfc_logon &
	(sle_userid.text, sle_password.text)
if IsNull (li_rc) then 
	this.event pfc_cancel()
	return
ElseIf li_rc <= 0 Then
	If ii_logonattempts > 0 Then
		// There are still have more attempts for a succesful login.
		Choose Case li_rc
			Case -1
				of_MessageBox ("pfc_logon_incorrectpassword", "Login", &
					"Ce nom d'utilisateur n'est pas reconnu.", StopSign!, Ok!, 1)
			Case -2
				of_MessageBox ("pfc_logon_incorrectpassword", "Login", &
					"Ce mot de passe est incorrect.", StopSign!, Ok!, 1)
			Case -3
				of_MessageBox ("pfc_logon_incorrectpassword", "Login", &
					"Cette adresse IP n'est pas correcte.", StopSign!, Ok!, 1)
		End Choose
		sle_password.SetFocus()
		Return
	Else
		// Failure return code
		inv_logonattrib.ii_rc = li_rc	
		CloseWithReturn (this, inv_logonattrib)
	End If
Else
	// Successful return code
	inv_logonattrib.ii_rc = 1
	inv_logonattrib.is_userid = sle_userid.text
	inv_logonattrib.is_password = sle_password.text	
	CloseWithReturn (this, inv_logonattrib)	
End if

Return
end event

type p_logo from pro_w_logon`p_logo within w_logon
integer x = 608
integer y = 12
integer width = 1307
integer height = 336
boolean originalsize = false
end type

type st_help from pro_w_logon`st_help within w_logon
integer x = 114
integer y = 480
integer height = 140
integer textsize = -10
string text = "Veuillez entrer un nom d~'utilisateur et mot de passe pour vous connecter à "
end type

type cb_ok from pro_w_logon`cb_ok within w_logon
integer x = 2062
integer y = 652
integer weight = 700
end type

type cb_cancel from pro_w_logon`cb_cancel within w_logon
integer x = 2062
integer y = 800
integer weight = 700
end type

type sle_userid from pro_w_logon`sle_userid within w_logon
integer y = 676
end type

type sle_password from pro_w_logon`sle_password within w_logon
integer y = 780
end type

type st_2 from pro_w_logon`st_2 within w_logon
integer y = 684
integer textsize = -10
end type

type st_3 from pro_w_logon`st_3 within w_logon
integer y = 784
integer textsize = -10
end type

