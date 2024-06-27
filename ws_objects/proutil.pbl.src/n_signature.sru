$PBExportHeader$n_signature.sru
forward
global type n_signature from n_base
end type
end forward

global type n_signature from n_base autoinstantiate
end type

forward prototypes
public function integer of_setsignature (string as_path, long ai_type, long al_idforeignkey)
public subroutine of_affichesign (datawindow dw, long al_type, long al_foreignkey)
public subroutine of_affichesign (datastore dw, long al_type, long al_foreignkey)
end prototypes

public function integer of_setsignature (string as_path, long ai_type, long al_idforeignkey);blob lblob_contenu
long ll_cnt
integer li_filenum, result
string ls_message
boolean lb_ajout = false, lb_change = false

// Conversion de l'image

li_filenum = FileOpen(as_path, StreamMode!)

IF li_filenum = - 1 THEN
	Messagebox("Attention", "Le fichier est invalide.")
	RETURN 0
ELSE
	
	FileReadEx(li_filenum, lblob_contenu)
	select count(1) into :ll_cnt from t_signature where typesignature = :ai_type and id_foreignkey = :al_idforeignkey;
	if ll_cnt = 0 then
	
			insert into t_signature(typesignature,id_foreignkey) 
			values(:ai_type,:al_idforeignkey);
			if gf_sqlerr() then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if	
			lb_ajout = true
			lb_change = true
	
	else
		
		if gnv_app.of_getlangue( ) = 'an' then
			ls_message = "Are you sure that you want to modify patient's signature?"
		else
			ls_message = "Êtes-vous sûr de vouloir modifier la signature de ce patient?"
		end if
		if messagebox("Question!",ls_message,Question!,YesNo!,2) = 1 then
			lb_change = true
		else
			lb_change = false
		end if
		
	end if
	
	if lb_ajout = false and lb_change = true then
		if gnv_app.of_getlangue( ) = 'an' then
			ls_message = "Those changes cannot be reversed. Are you sure that you want continue?"
		else
			ls_message = "Ces changements sont irreversibles. Êtes-vous sûr de voouloir continuer?"
		end if
		
		if messagebox("Question!",ls_message,Question!,YesNo!,2) = 1 then
			lb_change = true
		else
			lb_change = false
		end if
		
	end if
	
	if lb_change then
		updateblob t_signature set signature = :lblob_contenu where typesignature = :ai_type AND id_foreignkey = :al_idforeignkey;
		if gf_sqlerr() then
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
	end if
END IF

FileClose(li_filenum)
end function

public subroutine of_affichesign (datawindow dw, long al_type, long al_foreignkey);blob lblob_sign
int li_FileNum, li_ret, ll_bloblen,ll_count

select count(*) into :ll_count from t_signature where typesignature = :al_type AND id_foreignkey = :al_foreignkey;
if ll_count > 0 then
	selectblob signature into :lblob_sign from t_signature where typesignature = :al_type AND id_foreignkey = :al_foreignkey;
else
	setnull(lblob_sign)
end if

li_FileNum = FileOpen("c:\ii4net\orthotek\signature.jpg", StreamMode!, Write!, Shared!, Replace!)
li_ret = FileWriteEx(li_FileNum, lblob_sign)
ll_bloblen = len(lblob_sign)
FileClose(li_FileNum)

sleep(1)	

dw.object.p_sign.filename = "c:\ii4net\orthotek\signature.jpg"

end subroutine

public subroutine of_affichesign (datastore dw, long al_type, long al_foreignkey);blob lblob_sign
int li_FileNum

selectblob signature into :lblob_sign from t_signature where typesignature = :al_type AND id_foreignkey = :al_foreignkey;
li_FileNum = FileOpen("c:\ii4net\orthotek\signature.jpg", StreamMode!, Write!, Shared!, Replace!)

FileWriteEx(li_FileNum, lblob_sign)
FileClose(li_FileNum)

sleep(1)	

dw.object.p_sign.filename = "c:\ii4net\orthotek\signature.jpg"
end subroutine

on n_signature.create
call super::create
end on

on n_signature.destroy
call super::destroy
end on

