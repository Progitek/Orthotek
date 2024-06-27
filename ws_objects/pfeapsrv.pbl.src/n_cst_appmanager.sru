$PBExportHeader$n_cst_appmanager.sru
$PBExportComments$Extension Application Manager service
forward
global type n_cst_appmanager from pro_n_cst_appmanager
end type
end forward

global type n_cst_appmanager from pro_n_cst_appmanager
end type
global n_cst_appmanager n_cst_appmanager

on n_cst_appmanager.create
call super::create
end on

on n_cst_appmanager.destroy
call super::destroy
end on

event pfc_logon;call super::pfc_logon;long ll_count
string ls_nom, ls_fichier, ls_ip1, ls_ip2
int li_fich, li_rc

select count(*) into :ll_count from security_users where name = :as_userid;
if ll_count > 0 then
	select count(*) into :ll_count from security_users where name = :as_userid and password = :as_password;
	if ll_count > 0 then
		select central into :ll_count from security_apps;
		if isNull(ll_count) then ll_count = 0
		
		if ll_count = 0 then
			return 1
		else
			select description, ip1, ip2 into :ls_nom, :ls_ip1, :ls_ip2 from security_users where name = :as_userid and password = :as_password;
		
			if isNull(ls_ip1) then return -3
			if isNull(ls_ip2) then ls_ip2 = '0'
			if ls_ip1 = '0.0.0.0' then return 1
			ls_nom = trim(lower(gf_enleveraccents(rep(ls_nom, ' ', ''))))
			
			li_fich = fileOpen("C:\etb\clientip\" + ls_nom + ".txt", lineMode!, Read!)
			
			fileRead(li_fich, ls_fichier)
			
			fileClose(li_fich)

			if ls_fichier = ls_ip1 or ls_fichier = ls_ip2 then li_rc = 1 else li_rc = -3
			
			return li_rc
		end if
	else
		return -2
	end if
else
	return -1
end if

end event

event pfc_preabout;call super::pfc_preabout;anv_aboutattrib.is_application = "VIS@bio II"

end event

