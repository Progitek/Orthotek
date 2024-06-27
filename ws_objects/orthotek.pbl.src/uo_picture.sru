$PBExportHeader$uo_picture.sru
forward
global type uo_picture from picture
end type
end forward

global type uo_picture from picture
integer width = 754
integer height = 572
boolean focusrectangle = false
event ue_insertpicture ( string as_filepicture )
end type
global uo_picture uo_picture

event ue_insertpicture(string as_filepicture);int job,var
blob b
ulong bwidth, bheight
OLEObject myImage
int result

if gi_photo = 1 then
	setredraw(false)
	MyImage = CREATE OLEObject
	result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
	myImage.convert( as_filepicture, "test1.bmp" )
	this.picturename = "test1.bmp"
	job = FileOpen( this.picturename, StreamMode!, Read! )
	FileRead( job, b )
	bwidth  = Long( Integer( BlobMid( b, 19, 2 ) ), Integer( BlobMid( b, 21, 2) ) )
	bheight = Long( Integer( BlobMid( b, 23, 2 ) ), Integer( BlobMid( b, 25, 2) ) )
	FileClose( job )
	var = round(bwidth/100,0)
	this.width = PixelsToUnits( bwidth/var, XPixelsToUnits! )
	this.height = PixelsToUnits( bheight/var, YPixelsToUnits! )
	setredraw(true)
else
	this.visible = false
end if
end event

event constructor;//this.insertrow(0)
//int job
//blob b
//ulong bwidth, bheight
//OLEObject myImage
//int result
//
//MyImage = CREATE OLEObject
//
//result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")
//if result = 0 then
//	myImage.convert(  "test1.jpg", "test1.bmp" )
//	
//	this.object.p_1.filename = "c:\imaging\test1.bmp"
//	
//	this.object.p_1.resizeable = 1
//	this.object.p_1.moveable = 1
//	
//	
//	job = FileOpen( this.object.p_1.filename, StreamMode!, Read! )
//	FileRead( job, b )
//	bwidth  = Long( Integer( BlobMid( b, 19, 2 ) ), Integer( BlobMid( b, 21, 2) ) )
//	bheight = Long( Integer( BlobMid( b, 23, 2 ) ), Integer( BlobMid( b, 25, 2) ) )
//	FileClose( job )
//	this.object.p_1.width = PixelsToUnits( bwidth/5, XPixelsToUnits! )
//	this.object.p_1.height = PixelsToUnits( bheight/5, YPixelsToUnits! )
//else
//	error_type(154)
//end if
//
////this.object.p_2.filename = "c:\imaging\chitine2.bmp"
////this.object.p_2.resizeable = 1
////this.object.p_2.moveable = 1
end event

on uo_picture.create
end on

on uo_picture.destroy
end on

event destructor;this.picturename = ""
FileDelete('test1.bmp')
end event

