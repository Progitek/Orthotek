$PBExportHeader$uo_sle_image.sru
forward
global type uo_sle_image from singlelineedit
end type
end forward

global type uo_sle_image from singlelineedit
integer width = 1184
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
event set_text ( )
end type
global uo_sle_image uo_sle_image

event set_text();string this_name, img_name
string i

this_name = this.classname()
i=right(this_name, 1)

if i = "0" then
	i = "10"
end if 

img_name = w_imaging.is_image[integer(i)]

choose case img_name
		
	case "Frontal"
		this.text = w_imaging.image_name.frontal
		
	case "Frontal smile"
		this.text = w_imaging.image_name.front_smile
		
	case "Lateral"
		this.text = w_imaging.image_name.lateral
		
	case "Anterior occlusion"
		this.text = w_imaging.image_name.anterioroccl
		
	case "Left occlusion"
		this.text = w_imaging.image_name.leftoccl

	case "Lower occlusion"
		this.text = w_imaging.image_name.loweroccl		
	
	case "Right occlusion"
		this.text = w_imaging.image_name.rightoccl
		
	case "Upper occlusion"
		this.text = w_imaging.image_name.upperoccl
		
	case "Xray 1"
		this.text = w_imaging.image_name.xray3_1

	case "Xray 2"
		this.text = w_imaging.image_name.xray3_2
		
	case "logo"
		this.text = w_imaging.image_name.logo
		
	case "imagesupp"
		this.text = w_imaging.image_name.imagesupp
		
end choose

choose case i
		
	case "1"
		w_imaging.p_1.event read_image(this.text)
		
	case "2"
		w_imaging.p_2.event read_image(this.text)
		
	case "3"
		w_imaging.p_3.event read_image(this.text)
		
	case "4"
		w_imaging.p_4.event read_image(this.text)
		
	case "5"
		w_imaging.p_5.event read_image(this.text)
		
	case "6"
		w_imaging.p_6.event read_image(this.text)
	
	case "7"
		w_imaging.p_7.event read_image(this.text)
		
	case "8"
		w_imaging.p_8.event read_image(this.text)
		
	case "9"
		w_imaging.p_9.event read_image(this.text)
		
end choose

end event

on uo_sle_image.create
end on

on uo_sle_image.destroy
end on

event rbuttondown;N_cst_filesrv myFileService
f_setFileSrv(myFileService, true)


string this_name, img_name, img_dsiplay, ls_name, ls_path
string i, ls_query, ls_prefix, ls_old_name, ls_new_name, ls_path_new, ls_path_old 

int li_return
boolean lb_result

// On va chercher le nom et le numéro du controle cliqué 

this_name = this.classname()
i = right(this_name, 1)


CHOOSE CASE this_name
	CASE 'sle_img1'
		ls_name = w_imaging.sle_img1.text
	CASE 'sle_img2'
		ls_name = w_imaging.sle_img2.text
	CASE 'sle_img3'
		ls_name = w_imaging.sle_img3.text
	CASE 'sle_img4'
		ls_name = w_imaging.sle_img4.text
	CASE 'sle_img5'
		ls_name = w_imaging.sle_img5.text
	CASE 'sle_img6'
		ls_name = w_imaging.sle_img6.text
	CASE 'sle_img7'
		ls_name = w_imaging.sle_img7.text
	CASE 'sle_img8'
		ls_name = w_imaging.sle_img8.text
	CASE 'sle_img9'
		ls_name = w_imaging.sle_img9.text
	CASE 'sle_img10'
		ls_name = w_imaging.sle_img10.text
END CHOOSE


// On regarde si on est dans le mode suppresion ou ajout d'image

if len(ls_name) <= 0 then
	
	select prefix into :ls_prefix from t_imagingconf where id_imgconf = :i and ortho_id = :v_no_ortho; 

	ls_old_name = w_imaging.lb_images.text(w_imaging.llbox_index)
	ls_new_name = string(w_imaging.il_patid) +"-"+ls_prefix+string(today())+".jpg"
	ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_old_name
	ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_new_name
	li_return = myFileService.of_fileRename( ls_path_old, ls_path_new)
	if li_return = -1 then
		li_return = filecopy(ls_path_old,ls_path_new,true )
//		li_return = myFileService.of_fileRename( ls_path_old + ".old", ls_path_new)
		FileDelete(ls_path_old)	
	end if
	ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_old_name
	ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_new_name
	li_return = myFileService.of_fileRename( ls_path_old, ls_path_new)
	if li_return = -1 then
		li_return = FileCopy(ls_path_old,ls_path_new ,true)
//		li_return = myFileService.of_fileRename( ls_path_old + ".old", ls_path_new)
		FileDelete(ls_path_old)	
	end if
else	
//	ls_old_name = w_imaging.lb_1.text(integer(i))
	LS_old_name = ls_name
	ls_new_name = "II4NET00"+string(i)+".jpg"
	ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_old_name
	ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_new_name
	li_return = myFileService.of_fileRename( ls_path_old, ls_path_new)
	if li_return = -1 then
		li_return = filecopy(ls_path_old,ls_path_new,true )
//		li_return = myFileService.of_fileRename( ls_path_old + ".old", ls_path_new)
		FileDelete(ls_path_old)	
	end if
	ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_old_name
	ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_new_name
	li_return = myFileService.of_fileRename( ls_path_old, ls_path_new)
	if li_return = -1 then
		li_return = filecopy(ls_path_old,ls_path_new,true )
//		li_return = myFileService.of_fileRename( ls_path_old + ".old", ls_path_new)
		FileDelete(ls_path_old)	
	end if
	setnull(ls_new_name)
//	if li_return = -1 then
//		ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_new_name 
//		ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_new_name + ".old"
//		myFileService.of_fileRename( ls_path_old, ls_path_new)
//		
//		ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_new_name 
//		ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_new_name + ".old"
//		myFileService.of_fileRename( ls_path_old, ls_path_new)
//		
//		ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_old_name
//		ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\" + ls_new_name
//		myFileService.of_fileRename( ls_path_old, ls_path_new)
//		ls_path_old = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_old_name
//		ls_path_new = w_imaging.is_pathphoto+"\"+string(w_imaging.il_patid)+"\"+string(w_imaging.il_progressid)+"\small\" + ls_new_name
//	
//		li_return = myFileService.of_fileRename( ls_path_old, ls_path_new)
//		
//	end if
	
	
	
//	
//	if w_imaging.ib_auto = false then
//		this.text = ls_new_name
//		w_imaging.lb_1.trigger event constructor()
//		w_imaging.lb_1.SelectItem ( ls_new_name, 0 )
//	end if
	
	
end if
img_name = w_imaging.is_image[integer(i)]
choose case img_name		
	case "Frontal"
		Update t_imagerie set frontal  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "Frontal smile"
		Update t_imagerie set front_smile  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "Lateral"
		Update t_imagerie set "lateral"  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "Anterior occlusion"
		Update t_imagerie set anterioroccl  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "Left occlusion"
		Update t_imagerie set leftoccl  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "Lower occlusion"
		Update t_imagerie set loweroccl  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;	
	case "Right occlusion"
		Update t_imagerie set rightoccl  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;	
	case "Upper occlusion"
		Update t_imagerie set upperoccl  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "Xray 1"
		Update t_imagerie set xray3_1  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "Xray 2"
		Update t_imagerie set xray3_2  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "logo"
		Update t_imagerie set logo  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
	case "imagesupp"
		Update t_imagerie set imagesupp  = :ls_new_name where patient_id = :w_imaging.il_patid and sequence = :w_imaging.il_progressid;
end choose

commit Using SQLCA;	
error_type(-1)
w_imaging.event get_image();
if w_imaging.ib_auto = false then
	this.text = ls_new_name
	w_imaging.lb_images.trigger event constructor()
	w_imaging.lb_images.SelectItem ( ls_new_name, 0)
end if


//choose case i
//		
//	case "1"
//		w_imaging.p_1.trigger event set_image(ls_new_name)
//		w_imaging.p_1.visible = true
//	case "2"
//		w_imaging.p_2.trigger event set_image(ls_new_name)
//		w_imaging.p_2.visible = true
//	case "3"
//		w_imaging.p_3.trigger event set_image(ls_new_name)
//		w_imaging.p_3.visible = true
//	case "4"
//		w_imaging.p_4.trigger event set_image(ls_new_name)
//		w_imaging.p_4.visible = true
//	case "5"
//		w_imaging.p_5.trigger event set_image(ls_new_name)
//		w_imaging.p_5.visible = true
//	case "6"
//		w_imaging.p_6.trigger event set_image(ls_new_name)
//		w_imaging.p_6.visible = true
//	case "7"
//		w_imaging.p_7.trigger event set_image(ls_new_name)
//		w_imaging.p_7.visible = true
//	case "8"
//		w_imaging.p_8.trigger event set_image(ls_new_name)
//		w_imaging.p_8.visible = true
//	case "9"
//		w_imaging.p_9.trigger event set_image(ls_new_name)
//		w_imaging.p_9.visible = true
//	case "10"
//		w_imaging.p_10.trigger event set_image(ls_new_name)
//		w_imaging.p_10.visible = true
//end choose
return 1
end event

