$PBExportHeader$pro_resize.sru
forward
global type pro_resize from nonvisualobject
end type
end forward

global type pro_resize from nonvisualobject autoinstantiate
end type

type prototypes

end prototypes

forward prototypes
public subroutine uf_resizew (w_master win, long x, long y)
public subroutine uf_resizetab (w_master win, tab ao_tab)
public subroutine uf_resizeuotab (u_tabpg auo_tab, long x, long y)
public subroutine uf_resizeuotabt (u_tabpg auo_tab, tab ao_tab)
public subroutine uf_resizedw (u_dw dwo)
public subroutine uf_unresizedw (u_dw dwo)
protected subroutine of_decompargs (string as_resizetag, ref integer ai_x, ref integer ai_y, ref integer ai_w, ref integer ai_h)
end prototypes

public subroutine uf_resizew (w_master win, long x, long y);long i
integer li_x, li_y, li_w, li_h
string ls_type
n_cst_string lnv_str

win.of_setResize(TRUE)
win.inv_resize.of_SetMinSize(x, y)

for i = 1 to upperbound(win.control[])
	ls_type = lower(lnv_str.of_getKeyValue(win.control[i].tag, 'resize', '|'))
	
	if ls_type = '' then
		win.inv_resize.of_Register(win.control[i], win.inv_resize.SCALE)
	elseif ls_type <> 'n' then
		of_decompargs(ls_type, li_x, li_y, li_w, li_h)
		
		win.inv_resize.of_Register(win.control[i], li_x, li_y, li_w, li_h)
	end if
	
	if win.control[i].typeOf() = Tab! then
		uf_resizetab(win,win.control[i])
	end if
next

end subroutine

public subroutine uf_resizetab (w_master win, tab ao_tab);string ls_type
long i,j
integer li_x, li_y, li_w, li_h
n_cst_string lnv_str

for i = 1 to upperbound(ao_tab.control[])
	for j = 1 to upperbound(ao_tab.control[i].control[])
		ls_type = lower(lnv_str.of_getKeyValue(ao_tab.control[i].control[j].tag, 'resize', '|'))
		
		if ls_type = '' then
			win.inv_resize.of_Register(ao_tab.control[i].control[j], win.inv_resize.SCALE)
		elseif ls_type <> 'n' then
			of_decompargs(ls_type, li_x, li_y, li_w, li_h)
			
			win.inv_resize.of_Register(ao_tab.control[i].control[j], li_x, li_y, li_w, li_h)
		end if
		
		if ao_tab.control[i].control[j].typeOf() = Tab! then
			uf_resizetab(win,ao_tab.control[i].control[j])
		end if
	next
next
end subroutine

public subroutine uf_resizeuotab (u_tabpg auo_tab, long x, long y);long i
integer li_x, li_y, li_w, li_h
string ls_type
n_cst_string lnv_str

auo_tab.of_setResize(TRUE)

auo_tab.inv_resize.of_SetMinSize(x, y)

for i = 1 to upperbound(auo_tab.control[])
	ls_type = lower(lnv_str.of_getKeyValue(auo_tab.control[i].tag, 'resize', '|'))
	
	if ls_type = '' then
		auo_tab.inv_resize.of_Register(auo_tab.control[i], auo_tab.inv_resize.SCALE)
	elseif ls_type <> 'n' then
		of_decompargs(ls_type, li_x, li_y, li_w, li_h)
		
		auo_tab.inv_resize.of_Register(auo_tab.control[i], li_x, li_y, li_w, li_h)
	end if

//	if auo_tab.control[i].typeOf() = Tab! then
//		uf_resizeuotabt(auo_tab, auo_tab.control[i])
//	end if
next
end subroutine

public subroutine uf_resizeuotabt (u_tabpg auo_tab, tab ao_tab);long i,j
integer li_x, li_y, li_w, li_h
string ls_type
n_cst_string lnv_str

for i = 1 to upperbound(ao_tab.control[])
	for j = 1 to upperbound(ao_tab.control[i].control[])
		ls_type = lower(lnv_str.of_getKeyValue(ao_tab.control[i].control[j].tag, 'resize', '|'))
		
		if ls_type = '' then
			auo_tab.inv_resize.of_Register(ao_tab.control[i].control[j], auo_tab.inv_resize.SCALE)
		elseif ls_type <> 'n' then
			of_decompargs(ls_type, li_x, li_y, li_w, li_h)
			
			auo_tab.inv_resize.of_Register(ao_tab.control[i].control[j], li_x, li_y, li_w, li_h)
		end if

		if ao_tab.control[i].control[j].typeOf() = Tab! then
			uf_resizeuotabt(auo_tab,ao_tab.control[i].control[j])
		end if
	next
next
end subroutine

public subroutine uf_resizedw (u_dw dwo);string ls_object, ls_objname, ls_objtype, ls_coltype, ls_rstype
long ll_nbcol, i, ll_tab, ll_height, ll_y, ll_pos
double ldb_parm
integer li_x, li_y, li_w, li_h
n_cst_string lnv_str

dwo.of_setResize(TRUE)
ls_object = dwo.object.datawindow.objects
DO
	ll_pos = pos(ls_object,'~t')
	if ll_pos = 0 then
		ls_objname = ls_object
	else
		ls_objname = left(ls_object, ll_pos - 1)
		ls_object = mid(ls_object, ll_pos + 1)
	end if

	ls_rstype = lower(lnv_str.of_getKeyValue(dwo.describe(ls_objname+".tag"), 'resize', '|'))
	
	if ls_rstype = '' then
		dwo.inv_resize.of_Register(ls_objname, dwo.inv_resize.SCALE)
	elseif ls_rstype <> 'n' then
		of_decompargs(ls_rstype, li_x, li_y, li_w, li_h)
	
		dwo.inv_resize.of_Register(ls_objname, li_x, li_y, li_w, li_h)
	end if
LOOP WHILE ll_pos <> 0

//ll_nbcol = long(dwo.object.datawindow.column.count)
//
//for i = 1 to ll_nbcol
//	ll_tab = dwo.setTaborder(i,1)
//	dwo.setColumn(i)
//	ls_objname = dwo.getColumnname()
//	ls_rstype = lower(lnv_str.of_getKeyValue(dwo.describe(ls_objname+".tag"), 'resize', '|'))
//
//	if ls_rstype = '' then
//		dwo.inv_resize.of_Register(ls_objname, dwo.inv_resize.SCALE)
//	elseif ls_rstype <> 'n' then
//		of_decompargs(ls_rstype, li_x, li_y, li_w, li_h)
//	
//		dwo.inv_resize.of_Register(ls_objname, li_x, li_y, li_w, li_h)
//	end if
//	
//	dwo.setTaborder(i,ll_tab)
//next

end subroutine

public subroutine uf_unresizedw (u_dw dwo);dwo.of_setResize(FALSE)

end subroutine

protected subroutine of_decompargs (string as_resizetag, ref integer ai_x, ref integer ai_y, ref integer ai_w, ref integer ai_h);string ls_tmp
long ll_pos

as_resizetag = lower(as_resizetag)
if as_resizetag = '' then
	ai_x = 100
	ai_y = 100
	ai_w = 100
	ai_h = 100
elseif as_resizetag = 'n' then
	ai_x = 0
	ai_y = 0
	ai_w = 0
	ai_h = 0
else
	choose case true
		case pos(as_resizetag, 'fr') > 0
			ai_x = 100
		case pos(as_resizetag, 'mr') > 0
			ai_x = 200
		case pos(as_resizetag, 'dpr') > 0
			ll_pos = pos(as_resizetag, 'dpr') + 3
			ls_tmp = mid(as_resizetag, ll_pos, 1)
			if ls_tmp = 'b' then
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			end if
			ai_x = 0
			do while isNumber(ls_tmp)
				ai_x *= 10
				ai_x += integer(left(ls_tmp, 1))
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			loop
		case else
			ai_x = 0
	end choose
	choose case true
		case pos(as_resizetag, 'fb') > 0, pos(as_resizetag, 'frb') > 0
			ai_y = 100
		case pos(as_resizetag, 'mb') > 0, pos(as_resizetag, 'mrb') > 0
			ai_y = 200
		case pos(as_resizetag, 'dpb') > 0
			ll_pos = pos(as_resizetag, 'dpb') + 3
			ls_tmp = mid(as_resizetag, ll_pos, 1)
			ai_y = 0
			do while isNumber(ls_tmp)
				ai_y *= 10
				ai_y += integer(left(ls_tmp, 1))
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			loop
		case pos(as_resizetag, 'dprb') > 0
			ll_pos = pos(as_resizetag, 'dprb') + 4
			ls_tmp = mid(as_resizetag, ll_pos, 1)
			ai_y = 0
			do while isNumber(ls_tmp)
				ai_y *= 10
				ai_y += integer(left(ls_tmp, 1))
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			loop
		case else
			ai_y = 0
	end choose
	choose case true
		case pos(as_resizetag, 'sr') > 0
			ai_w = 100
		case pos(as_resizetag, 'ar') > 0
			ai_w = 200
		case pos(as_resizetag, 'tpr') > 0
			ll_pos = pos(as_resizetag, 'tpr') + 3
			ls_tmp = mid(as_resizetag, ll_pos, 1)
			if ls_tmp = 'b' then
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			end if
			ai_w = 0
			do while isNumber(ls_tmp)
				ai_w *= 10
				ai_w += integer(left(ls_tmp, 1))
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			loop
		case else
			ai_w = 0
	end choose
	choose case true
		case pos(as_resizetag, 'sb') > 0, pos(as_resizetag, 'srb') > 0
			ai_h = 100
		case pos(as_resizetag, 'ab') > 0, pos(as_resizetag, 'arb') > 0
			ai_h = 200
		case pos(as_resizetag, 'tpb') > 0
			ll_pos = pos(as_resizetag, 'tpb') + 3
			ls_tmp = mid(as_resizetag, ll_pos, 1)
			ai_h = 0
			do while isNumber(ls_tmp)
				ai_h *= 10
				ai_h += integer(left(ls_tmp, 1))
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			loop
		case pos(as_resizetag, 'tprb') > 0
			ll_pos = pos(as_resizetag, 'tprb') + 4
			ls_tmp = mid(as_resizetag, ll_pos, 1)
			ai_h = 0
			do while isNumber(ls_tmp)
				ai_h *= 10
				ai_h += integer(left(ls_tmp, 1))
				ll_pos ++
				ls_tmp = mid(as_resizetag, ll_pos, 1)
			loop
		case else
			ai_h = 0
	end choose
end if

end subroutine

on pro_resize.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pro_resize.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

