$PBExportHeader$uo_p_thumb.sru
forward
global type uo_p_thumb from picture
end type
end forward

global type uo_p_thumb from picture
integer height = 144
boolean originalsize = true
boolean focusrectangle = false
event read_image ( string thumb )
event set_image ( string thumb,  integer ai_type,  integer ai_adddel )
end type
global uo_p_thumb uo_p_thumb

type variables

end variables

event read_image(string thumb);N_cst_filesrv myFileService
f_setFileSrv(myFileService, true)
long ret
blob image
string ls_read

ulong lul_width, lul_height, lul_width1, lul_height2

if w_imaging.is_imgtype = 'v' then
	// vistadent
	ls_read = w_imaging.is_pathphoto +"\"+ w_imaging.is_imgfolder +"\" + thumb
	ret = myFileService.of_fileread(ls_read, image)
else
	// orthotek
	ls_read = w_imaging.is_pathphoto +"\"+ w_imaging.is_imgfolder +"\"+ string(w_imaging.il_progressid)+"\small\"+ thumb
	ret = myFileService.of_fileread(ls_read, image)
end if
if thumb = "" then
	this.visible = false
else	
	this.picturename = ls_read
   this.originalsize = true
	lul_width  = UnitsToPixels(this.width, XUnitsToPixels!)
	lul_height = UnitsToPixels(this.height, YUnitsToPixels!)
	
	
	if isvalid(w_imaging) then
		choose case rep(this.classname(),'p','r')
			case 'r_1'
				this.width  = (w_imaging.r_1.height * this.width) / this.height
				this.height = w_imaging.r_1.height
			case 'r_2'
				this.width  = (w_imaging.r_2.height * this.width) / this.height
				this.height = w_imaging.r_2.height
			case 'r_3'
				this.width  = (w_imaging.r_3.height * this.width) / this.height
				this.height = w_imaging.r_3.height
			case 'r_4'
				this.width  = (w_imaging.r_4.height * this.width) / this.height
				this.height = w_imaging.r_4.height
			case 'r_5'
				this.width  = (w_imaging.r_5.height * this.width) / this.height
				this.height = w_imaging.r_5.height
			case 'r_6'
				this.width  = (w_imaging.r_6.height * this.width) / this.height
				this.height = w_imaging.r_6.height
			case 'r_7'
				this.width  = (w_imaging.r_7.height * this.width) / this.height
				this.height = w_imaging.r_7.height
			case 'r_8'
				this.width  = (w_imaging.r_8.height * this.width) / this.height
				this.height = w_imaging.r_8.height
			case 'r_9'
				this.width  = (w_imaging.r_9.height * this.width) / this.height
				this.height = w_imaging.r_9.height
			case 'r_10'
				this.width  = (w_imaging.r_10.height * this.width) / this.height
				this.height = w_imaging.r_10.height
		end choose 
	else
		if lul_height >= 200 then
			this.width  = (509 * this.width) / this.height
			this.height = 509
		end if
		
		if lul_width >= 200 then
			this.width  = 700
		end if
	end if

	this.originalsize = false
	
	this.setpicture(image)
	this.visible = true
end if

if ret = -1 then
	this.visible = false
end if
end event

event set_image(string thumb, integer ai_type, integer ai_adddel);N_cst_filesrv myFileService
f_setFileSrv(myFileService, true)

OLEObject myImage
int result, ret
blob image
string this_name, ls_query
string i, rotate, ls_fichier
int fliph, flipv

this_name = this.classname()
i=right(this_name, 1)

SetPointer(HourGlass!)

MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

select rotate, fliph, flipv into :rotate,:fliph,:flipv from t_imagingconf where id_imgconf = :ai_type and ortho_id = :v_no_ortho;

if flipv <> 0 then
	ls_fichier = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(w_imaging.il_progressid)+"\" + thumb
	IF FileExists(ls_fichier) THEN
		myImage.mogrify( "-flip",  ls_fichier)
	END IF
	
	ls_fichier = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(w_imaging.il_progressid)+"\small\" + thumb
	IF FileExists(ls_fichier) THEN
		myImage.mogrify( "-flip",  ls_fichier)
	END IF
end if

if fliph <> 0 then
	ls_fichier = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(w_imaging.il_progressid)+"\" + thumb
	IF FileExists(ls_fichier) THEN
		myImage.mogrify( "-flop",  ls_fichier)
	END IF

	ls_fichier = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(w_imaging.il_progressid)+"\small\" + thumb
	IF FileExists(ls_fichier) THEN
		myImage.mogrify( "-flop",  ls_fichier)
	END IF

end if

if rotate <> "0.00" then
	if ai_adddel = 2 then 
		rotate = string(dec(rotate) * -1)
	end if
	ls_fichier = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(w_imaging.il_progressid)+"\" + thumb
	IF FileExists(ls_fichier) THEN
		myImage.mogrify( "-rotate", rotate, ls_fichier )
	END IF

	ls_fichier = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(w_imaging.il_progressid)+"\small\" + thumb
	IF FileExists(ls_fichier) THEN
		myImage.mogrify( "-rotate", rotate, ls_fichier )
	END IF

end if

ls_fichier = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(w_imaging.il_progressid)+"\small\"+ thumb
IF FileExists(ls_fichier) THEN
	ret = myFileService.of_fileread(ls_fichier, image)
END IF

if ai_adddel = 2 then
	this.visible = false
elseif ai_adddel = 1 then
	this.setpicture(image)
	this.visible = true
end if
myImage.DisconnectObject()

end event

on uo_p_thumb.create
end on

on uo_p_thumb.destroy
end on

