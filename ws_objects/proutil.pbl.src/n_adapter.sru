$PBExportHeader$n_adapter.sru
forward
global type n_adapter from nonvisualobject
end type
type str_ipaddrrow from structure within n_adapter
end type
type str_ipaddrtable from structure within n_adapter
end type
type str_ipnetrow from structure within n_adapter
end type
type str_ipnettable from structure within n_adapter
end type
type str_ipnettable1 from structure within n_adapter
end type
type str_mac from structure within n_adapter
end type
type str_wsadata from structure within n_adapter
end type
end forward

type str_ipaddrrow from structure
	long		addr
	long		interface
	long		m
	long		b
	long		as
	integer		u1
	integer		u2
end type

type str_ipaddrtable from structure
	long		numentries
	str_ipaddrrow		table[6]
end type

type str_ipnetrow from structure
	long		index
	long		physaddrlen
	character		bphysaddr[8]
	long		addr
	long		iptype
end type

type str_ipnettable from structure
	long		numentries
	str_ipnetrow		table[255]
end type

type str_ipnettable1 from structure
	long		numentries
	long		asd
end type

type str_mac from structure
	character		mac[8]
end type

type str_wsadata from structure
	unsignedinteger		version
	unsignedinteger		highversion
	character		description[257]
	character		systemstatus[129]
	unsignedinteger		maxsockets
	unsignedinteger		maxupddg
	string		vendorinfo
end type

global type n_adapter from nonvisualobject autoinstantiate
end type

type prototypes
Function ulong GetAdaptersInfo ( &
	Ref blob pAdapterInfo, &
	Ref ulong pOutBufLen &
	) Library "iphlpapi.dll" Alias For "GetAdaptersInfo"

Function ulong GetAdaptersAddresses ( &
	ulong Family, &
	ulong Flags, &
	ulong Reserved, &
	Ref blob AdapterAddresses, &
	Ref ulong SizePointer &
	) Library "iphlpapi.dll" Alias For "GetAdaptersAddresses"

Function ulong FormatMessage( &
	ulong dwFlags, &
	ulong lpSource, &
	ulong dwMessageId, &
	ulong dwLanguageId, &
	Ref string lpBuffer, &
	ulong nSize, &
	ulong Arguments &
	) Library "kernel32.dll" Alias For "FormatMessageW"
	
FUNCTION long GetIpAddrTable( &
	ref str_ipaddrtable llll, &
	ref long addr_len, &
	boolean ip_sort) LIBRARY "iphlpapi.dll" alias for "GetIpAddrTable;Ansi"
	
FUNCTION LONG inet_addr( ref string cp ) LIBRARY "ws2_32.dll" alias for "inet_addr;Ansi"

FUNCTION LONG GetIpNetTable( &
	ref str_ipnettable llll, &
	ref long addr_len, &
	boolean ip_sort) LIBRARY "iphlpapi.dll" alias for "GetIpNetTable;Ansi"
	
FUNCTION LONG DeleteIpNetEntry( &
	ref str_ipnetrow ip) LIBRARY "iphlpapi.dll" alias for "DeleteIpNetEntry;Ansi"
	
FUNCTION LONG FlushIpNetTable(long ip) LIBRARY "iphlpapi.dll"

FUNCTION LONG SendARP( &
	long ip, &
	long ipsur, &
	ref str_mac str, &
	ref long len) LIBRARY "iphlpapi.dll" alias for "SendARP;Ansi"

FUNCTION boolean GetComputerName ( &
	Ref string buffer, &
	Ref long buflen &
	) Library "kernel32.dll" Alias For "GetComputerNameA;Ansi"
	
FUNCTION int WSAStartup (uint UIVerionrequested, ref str_wsadata lpWSAdata) library "wsock32.DLL" alias for "WSAStartup;ansi"
FUNCTION int WSACleanup() library "wsock32.DLL"
FUNCTION int WSAGetLastError() library "wsock32.DLL"
FUNCTION int gethostname(ref string name, int namelen) library "wsock32.DLL"  alias for "gethostname;Ansi"
FUNCTION string GetHost(string lpszhost,ref blob lpszaddress) library "c:\ii4net\dentitek\pbws32.dll" alias for "GetHost;Ansi"



end prototypes

forward prototypes
public function string of_tohex (long al_num)
public function string of_hexchar (integer ai_num)
public function string of_geterrormsg (unsignedlong aul_error)
public function boolean of_getadapterinfo (ref string as_macaddress[], ref string as_description[], ref string as_adaptername[], ref string as_ipaddress[])
public function boolean of_getadapteradresses (ref string as_macaddress[], ref string as_description[], ref string as_adaptername[], ref string as_ipaddress[])
public function boolean getmi (ref string as_address)
public function string of_long2hex (long al_number, integer ai_digit)
public function string of_getmac (string as_ip)
public function string of_getip ()
public function string of_getmacaddr ()
end prototypes

public function string of_tohex (long al_num);// -----------------------------------------------------------------------------
// SCRIPT:     n_adapter.of_ToHex
//
// PURPOSE:    This function translates a long to string Hex.
//
// ARGUMENTS:  al_num	- Number to convert
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2006	RolandS		Initial coding
// -----------------------------------------------------------------------------

If al_num > 15 Then
	// recursive call to self
	Return of_ToHex(al_num / 16) + &
					of_HexChar(Mod(al_num,16))
Else
	Return of_HexChar(al_num)
End If

end function

public function string of_hexchar (integer ai_num);// -----------------------------------------------------------------------------
// SCRIPT:     n_adapter.of_HexChar
//
// PURPOSE:    This function converts a number from 0-15 to Hex character.
//
// ARGUMENTS:  ai_num	- Number to convert
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2006	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_hex

If ai_num < 10 Then
	ls_hex = String(ai_num)
Else
	ls_hex = String(Char(ai_num + 55))
End If

Return ls_hex

end function

public function string of_geterrormsg (unsignedlong aul_error);// -----------------------------------------------------------------------------
// SCRIPT:     n_adapter.of_GetErrorMsg
//
// PURPOSE:    This function returns the error message that goes
//					with the error code from GetLastError.
//
// ARGUMENTS:  aul_error - Error code from GetLastError
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2006	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant ULong FORMAT_MESSAGE_FROM_SYSTEM = 4096
Constant ULong LANG_NEUTRAL = 0
String ls_buffer
ULong lul_rtn

ls_buffer = Space(200)

lul_rtn = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, 0, &
				aul_error, LANG_NEUTRAL, ls_buffer, 200, 0)

Return Trim(ls_buffer)

end function

public function boolean of_getadapterinfo (ref string as_macaddress[], ref string as_description[], ref string as_adaptername[], ref string as_ipaddress[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_adapter.of_GetAdapterInfo
//
// PURPOSE:    This function returns information about network adapters.
//
// ARGUMENTS:  as_macaddress	- Array of MAC addresses
//					as_description	- Array of Descriptions
//					as_adaptername	- Array of Adapter names
//					as_ipaddress	- Array of IP addresses
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2006	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant ULong ERROR_BUFFER_OVERFLOW = 111
Blob lblb_AdapterInfo, lblb_data
ULong lul_rtn, lul_OutBufLen
Integer li_adaptcnt, li_adaptmax, li_addrlen
Integer li_cnt, li_max, li_pos, li_char, li_offset
String ls_errmsg

// call function to get buffer size
lul_rtn = GetAdaptersInfo(lblb_AdapterInfo, lul_OutBufLen)
If lul_rtn = ERROR_BUFFER_OVERFLOW Then
	// allocate buffer
	lblb_AdapterInfo = Blob(Space(lul_OutBufLen/2))
	// call function to get data
	lul_rtn = GetAdaptersInfo(lblb_AdapterInfo, lul_OutBufLen)
	If lul_rtn = 0 Then
		// how many adapters?
		li_adaptmax = lul_OutBufLen / 640
		For li_adaptcnt = 1 To li_adaptmax
			// calculate offset
			li_offset = (640 * (li_adaptcnt - 1))
			// get mac address length
			lblb_data = BlobMid(lblb_AdapterInfo, li_offset + 401, 1)
			li_addrlen = Asc(String(lblb_data, EncodingAnsi!))
			// get mac address
			For li_cnt = 1 To li_addrlen
				li_pos = li_offset + 404 + li_cnt
				lblb_data = BlobMid(lblb_AdapterInfo, li_pos, 1)
				li_char = Asc(Char(String(lblb_data, EncodingAnsi!)))
//				If li_char < 16 Then
//					as_macaddress[li_adaptcnt] += "0"
//				End If
				as_macaddress[li_adaptcnt] += of_long2Hex(li_char,2)
				If li_cnt < li_addrlen Then
					as_macaddress[li_adaptcnt] += "-"
				End If
			Next
			// get description
			lblb_data = BlobMid(lblb_AdapterInfo, li_offset + 269, 132)
			as_description[li_adaptcnt] = String(lblb_data, EncodingAnsi!)
			// get adaptername
			lblb_data = BlobMid(lblb_AdapterInfo, li_offset + 9, 260)
			as_adaptername[li_adaptcnt] = String(lblb_data, EncodingAnsi!)
			// get ip address
			lblb_data = BlobMid(lblb_AdapterInfo, li_offset + 433, 16)
			as_ipaddress[li_adaptcnt] = String(lblb_data, EncodingAnsi!)
		Next
	Else
//		ls_errmsg = of_GetErrorMsg(lul_rtn)
//		MessageBox("Error in of_GetAdapterInfo", &
//						ls_errmsg, StopSign!)
		Return False
	End If
Else
//	ls_errmsg = of_GetErrorMsg(lul_rtn)
//	MessageBox("Error in of_GetAdapterInfo", &
//					ls_errmsg, StopSign!)
	Return False
End If

Return True

end function

public function boolean of_getadapteradresses (ref string as_macaddress[], ref string as_description[], ref string as_adaptername[], ref string as_ipaddress[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_adapter.of_GetAdapterInfo
//
// PURPOSE:    This function returns information about network adapters.
//
// ARGUMENTS:  as_macaddress	- Array of MAC addresses
//					as_description	- Array of Descriptions
//					as_adaptername	- Array of Adapter names
//					as_ipaddress	- Array of IP addresses
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2006	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant ULong ERROR_BUFFER_OVERFLOW = 111
Blob lblb_AdapterAdr, lblb_data
ULong lul_rtn, lul_OutBufLen, ll_null
Integer li_adaptcnt, li_adaptmax, li_addrlen
Integer li_cnt, li_max, li_pos, li_char, li_offset
String ls_errmsg

setNull(ll_null)

// call function to get buffer size
lul_rtn = GetAdaptersAddresses(0, 0, ll_null, lblb_AdapterAdr, lul_OutBufLen)
If lul_rtn = ERROR_BUFFER_OVERFLOW Then
	// allocate buffer
	lblb_AdapterAdr = Blob(Space(lul_OutBufLen/2))
	// call function to get data
	lul_rtn = GetAdaptersAddresses(0, 0, ll_null, lblb_AdapterAdr, lul_OutBufLen)
	If lul_rtn = 0 Then
		integer li_file
		fileOpen("C:\test.txt", streamMode!, write!, lockreadwrite!, replace!,EncodingAnsi!)
		fileWriteEx(li_file, lblb_AdapterAdr)
		fileClose(li_file)
		
		// how many adapters?
		li_adaptmax = lul_OutBufLen / 924
		For li_adaptcnt = 1 To li_adaptmax
			// calculate offset
			li_offset = (924 * (li_adaptcnt - 1))
			// get mac address length
			lblb_data = BlobMid(lblb_AdapterAdr, li_offset + 53, 1)
			li_addrlen = Asc(String(lblb_data, EncodingAnsi!))
			// get mac address
			For li_cnt = 1 To li_addrlen
				li_pos = li_offset + 44 + li_cnt
				lblb_data = BlobMid(lblb_AdapterAdr, li_pos, 1)
				li_char = Asc(Char(String(lblb_data, EncodingAnsi!)))
			//	If li_char < 16 Then
			//		as_macaddress[li_adaptcnt] += "0"
			//	End If
				as_macaddress[li_adaptcnt] += of_long2Hex(li_char,2)
				If li_cnt < li_addrlen Then
					as_macaddress[li_adaptcnt] += "-"
				End If
			Next
			// get description
			lblb_data = BlobMid(lblb_AdapterAdr, li_offset + 269, 132)
			as_description[li_adaptcnt] = String(lblb_data, EncodingAnsi!)
			// get adaptername
			lblb_data = BlobMid(lblb_AdapterAdr, li_offset + 9, 260)
			as_adaptername[li_adaptcnt] = String(lblb_data, EncodingAnsi!)
			// get ip address
			lblb_data = BlobMid(lblb_AdapterAdr, li_offset + 433, 16)
			as_ipaddress[li_adaptcnt] = String(lblb_data, EncodingAnsi!)
		Next
	Else
//		ls_errmsg = of_GetErrorMsg(lul_rtn)
//		MessageBox("Error in of_GetAdapterInfo", &
//						ls_errmsg, StopSign!)
		Return False
	End If
Else
//	ls_errmsg = of_GetErrorMsg(lul_rtn)
//	MessageBox("Error in of_GetAdapterInfo", &
//					ls_errmsg, StopSign!)
	Return False
End If

Return True

end function

public function boolean getmi (ref string as_address);integer li_filenum
n_runandwait luo_run

luo_run.of_run("c:\ii4net\orthotek\gmi.bat",hide! )
li_filenum = FileOpen("c:\ii4net\orthotek\gmi.txt",Linemode!,Read!)
FileRead(li_filenum,as_address)
FileClose(li_filenum)
FileDelete("c:\ii4net\orthotek\gmi.txt")
as_address = mid(as_address,14)

if len(as_address) = 17 then 
	return true
else
	return false
end if
end function

public function string of_long2hex (long al_number, integer ai_digit);long ll_temp0, ll_temp1
char lc_ret

IF ai_digit > 0 THEN
   ll_temp0 = abs(al_number / (16 ^ (ai_digit - 1)))
   ll_temp1 = ll_temp0 * (16 ^ (ai_digit - 1))
   IF ll_temp0 > 9 THEN
      lc_ret = char(ll_temp0 + 55)
   ELSE
      lc_ret = char(ll_temp0 + 48)
   END IF
   RETURN lc_ret + &
          of_long2hex(al_number - ll_temp1 , ai_digit - 1)
END IF
RETURN ""
end function

public function string of_getmac (string as_ip);String ls_macaddress[], ls_description[],ls_adaptername[], ls_ipaddress[], ls_mac
Integer li_cnt, li_max, li_row

of_getadapteradresses(ls_macaddress, ls_description, &
					ls_adaptername, ls_ipaddress)

Return ls_macaddress[1]


/*/////////////////////////////////////////////
// Create by Sandy                         //
// 27 August 2007                          //
/////////////////////////////////////////////
str_ipnettable lstr_table 
str_mac 			lstr_mac
long 				ll_buffer 
boolean 			lb_type
long 				ll_len
long 				ll_type, ll_inetaddr, ll_row
string 			ls_ip, ls_mac

ls_ip = as_ip

ll_inetaddr = inet_addr(ls_ip)
lb_type = false
ll_type = GetIpNetTable(lstr_table, ll_buffer, lb_type) 
ll_type = GetIpNetTable(lstr_table, ll_buffer, lb_type)

if ll_type=0 then 
	for ll_row = 1 to lstr_table.numentries
		if lstr_table.table[ll_row].addr = ll_inetaddr then
			ll_type = DeleteIpNetEntry(lstr_table.table[ll_row])
		end if
	next
end if

ll_len  = 8
ll_type = SendARP(ll_inetaddr, 0, lstr_mac, ll_len)
messagebox("dfdf",string(ll_type))

if ll_type <> 0 then return "(Impossible d'obtenir l'adresse MAC)"

for ll_row =1 to 6
	ls_mac += this.of_long2hex( long( string(asc(lstr_mac.mac[ll_row]))) , 2) + '-'
next

Return left(ls_mac,len(ls_mac)-1)

*/


end function

public function string of_getip ();string ls_ip, ls_host
blob{4} lb_host
Integer li_version, li_rc
str_wsadata lstr_wsadata

ls_host = Space(218)
li_version = 257

if WSAStartup(li_version,lstr_wsadata) = 0 then
	if GetHostName(ls_host, len(ls_host)) > 0 then
		li_rc = WSAGetLastError()
	else
		GetHost(ls_host, lb_host)
		ls_ip = String(Asc(String(BlobMid(lb_host, 1, 1),Encodingansi!))) + "."
      ls_ip += String(Asc(String(BlobMid(lb_host, 2, 1),Encodingansi!))) + "."
      ls_ip += String(Asc(String(BlobMid(lb_host, 3, 1),Encodingansi!))) + "."
      ls_ip += String(Asc(String(BlobMid(lb_host, 4, 1),Encodingansi!)))
		li_rc = 0
	end if
else
	li_rc = WSAGetLastError()
end if

return ls_ip
end function

public function string of_getmacaddr ();integer li_FileNum, li_ret
long i = 1, j = 1
string ls_linefich, ls_lignemac[], ls_mac, ls_ligneIP[]
n_runandwait luo_run

luo_run.of_run("c:\ii4net\orthotek\getmac.bat",hide! )
li_FileNum = FileOpen("c:\ii4net\orthotek\lic.dat", LineMode!, Read!)

IF li_FileNum > 0 THEN
		
	// On va chercher dans le fichier l'adresse MAC et l'adresse IP
	
	DO WHILE li_ret <> -100
		li_ret = FileRead(li_FileNum, ls_linefich)
		if match(ls_linefich,'Physical Address') or match(ls_linefich,'Adresse physique') then
			ls_lignemac[i] = trim(mid(ls_linefich,pos(ls_linefich,':') + 1))
			i++
		end if
//		if match(ls_linefich,'IPv4 Address') or &
//			match(ls_linefich,'IP Address') or &
//			match(ls_linefich,'Adresse IP') or &
//			match(ls_linefich,'Adresse IPv4') then 
//			ls_ligneIP[j] = trim(mid(ls_linefich,pos(ls_linefich,':') + 1))
//			j++		
//		end if
	LOOP
	
	Fileclose(li_FileNum)
		
END IF

return ls_lignemac[1]

end function

on n_adapter.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_adapter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

