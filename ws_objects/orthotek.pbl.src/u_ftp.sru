$PBExportHeader$u_ftp.sru
forward
global type u_ftp from nonvisualobject
end type
end forward

global type u_ftp from nonvisualobject
end type
global u_ftp u_ftp

type prototypes
FUNCTION ULong InternetGetConnectedState(REF ULong lpdwFlags, ULong dwReserved) LIBRARY "wininet"
FUNCTION ULong InternetOpen(String lpszAgent, ULong dwAccessType, String lpszProxyName, String lpszProxyBypass, ULong dwFlags) LIBRARY "wininet" ALIAS FOR "InternetOpenA;Ansi"
FUNCTION ULong InternetCloseHandle(ULong hEnumHandle) LIBRARY "wininet"
FUNCTION ULong InternetConnect(ULong hInternet, String lpszServerName, ULong nServerPort, String lpszUserName, String lpszPassword, ULong dwService, ULong dwFlags, ULong dwContext) LIBRARY "wininet" ALIAS FOR "InternetConnectA;Ansi"
FUNCTION ULong FtpFindFirstFile(ULong hConnect, String lpszSearchFile, REF WIN32_FIND_DATA lpFindFileData, ULong dwFlags, ULong dwContext) LIBRARY "wininet" ALIAS FOR "FtpFindFirstFileA;Ansi"
FUNCTION ULong InternetFindNextFile(ULong hFind, REF WIN32_FIND_DATA lpFindFileData) LIBRARY "wininet" ALIAS FOR "InternetFindNextFileA;Ansi"
FUNCTION ULong InternetSetStatusCallback(ULong hInternet, ULong lpfnInternetCallback) LIBRARY "wininet"
FUNCTION ULong InternetGetLastResponseInfo(REF ULong lpdwError, REF String lpszBuffer, REF ULong lpdwBufferLength) LIBRARY "wininet" ALIAS FOR "InternetGetLastResponseInfoA;Ansi"
FUNCTION ULong FtpGetCurrentDirectory(ULong hConnect, REF String lpszCurrentDirectory, REF ULong lpdwCurrentDirectory) LIBRARY "wininet" ALIAS FOR "FtpGetCurrentDirectoryA;Ansi"
FUNCTION ULong FtpSetCurrentDirectory(ULong hConnect, String lpszDirectory) LIBRARY "wininet" ALIAS FOR "FtpSetCurrentDirectoryA;Ansi"
FUNCTION ULong FtpCreateDirectory(ULong hConnect, String lpszDirectory) LIBRARY "wininet" ALIAS FOR "FtpCreateDirectoryA;Ansi"
FUNCTION ULong FtpGetFileSize(ULong hConnect, REF ULong lpdwFileSizeHigh) LIBRARY "wininet"
FUNCTION ULong FtpOpenFile(ULong hConnect, String lpszFileName, ULong dwAccess, ULong dwFlags, ULong dwContext) LIBRARY "wininet" ALIAS FOR "FtpOpenFileA;Ansi"
FUNCTION ULong FtpGetFile(ULong hConnect, String lpszRemoteFile, String lpszNewFile, ULong fFailIfExists, ULong dwFlagsAndAttributes, ULong dwFlags, ULong dwContext) LIBRARY "wininet" ALIAS FOR "FtpGetFileA;Ansi"
FUNCTION ULong FtpPutFile(ULong hConnect, String lpszLocalFile, String lpszNewRemoteFile, ULong dwFlags, ULong dwContext) LIBRARY "wininet" ALIAS FOR "FtpPutFileA;Ansi"
FUNCTION ULong FtpDeleteFile(ULong hConnect, String lpszFileName) LIBRARY "wininet" ALIAS FOR "FtpDeleteFileA;Ansi"
FUNCTION ULong SendMessage(ULong hwnd, ULong wMsg, ULong wParam, Any lParam) LIBRARY "user32" ALIAS FOR "SendMessageA"
SUBROUTINE MoveMemory(Any pTo, Any pFrom, ULong lSize) LIBRARY "kernel32" ALIAS FOR "RtlMoveMemory"
FUNCTION ULong StrFormatByteSizeW(ULong qdwlow, ULong qdwhigh, REF String pwszBuf, ULong cchBuf) LIBRARY "shlwapi.dll" alias for "StrFormatByteSizeW;Ansi"
FUNCTION ULong FileTimeToSystemTime(FILETIME lpFileTime, REF SYSTEMTIME LPSYSTEMTIME) LIBRARY "kernel32" alias for "FileTimeToSystemTime;Ansi"
FUNCTION ULong SystemTimeToTzSpecificLocalTime(TIME_ZONE_INFORMATION lpTimeZone, SYSTEMTIME lpUniversalTime, REF SYSTEMTIME lpLocalTime) LIBRARY "kernel32" alias for "SystemTimeToTzSpecificLocalTime;Ansi"
FUNCTION ULong GetTimeZoneInformation(REF TIME_ZONE_INFORMATION lpTimeZoneInformation) LIBRARY "kernel32" alias for "GetTimeZoneInformation;Ansi"
FUNCTION ULong GetProcAddress(ULong hModule, String lpProcName) LIBRARY "kernel32" alias for "GetProcAddress;Ansi"
FUNCTION ULong GetLastError() LIBRARY "kernel32"

end prototypes

type variables
//pfc for bitwise operations
Private pfc_n_cst_numerical num

//pfc for file attributes
Private pfc_n_cst_filesrvwin32 files

//persistent handle to the internet
Public ULong hSession

//persistent handle internet connection
Public ULong hConnection

//persistent handle internet callback: used to
//determine if necessary to remove before closing
Public ULong hCallback 

//string to hold error set in GetECode
//on connection, deletion or upload failure
Public String FtpErrorMessage

//flag used to show/suppress the listing of
//the FTP callback messages in List2
Public Boolean bFtpShowMessages

//default FTP login data
Public String is_servername    = "ns2.ii4net.net"
Public String is_ftpusername   = "autoupdate"
Public String is_ftppassword   = "ii4net"
Public ULong il_ftpport			 = 21

//default local folder for downloads
Public String sLocalDownloadPath // = "c:\ii4net\dentitek\AutoUpdate\"

//default local folder for uploads
Public String sRemoteUploadPath // = "c:\ii4net\dentitek\AutoUpdate\"

//constants are more efficient than literals
//when used in several places
Public Constant String sRootDots = ".."
Public Constant String sSlash = "/"

//variables for callback
Public Double dwCurrentFileSize  //file size of download
Public Double pub_BytesSent      //tracks bytes send
Public Double pub_BytesRecieved  //tracks bytes received

//misc constants required
Private Constant ULong MAX_PATH = 260
Private Constant Double MAXDWORD = (2 ^ 32) - 1
Private Constant ULong FILE_ATTRIBUTE_READONLY = 1
Private Constant ULong FILE_ATTRIBUTE_HIDDEN = 2
Private Constant ULong FILE_ATTRIBUTE_SYSTEM = 4
Private Constant ULong FILE_ATTRIBUTE_DIRECTORY = 16
Private Constant ULong FILE_ATTRIBUTE_ARCHIVE = 32
Private Constant ULong FILE_ATTRIBUTE_NORMAL = 128
Private Constant ULong FILE_ATTRIBUTE_TEMPORARY = 256
Private Constant ULong FILE_ATTRIBUTE_COMPRESSED = 2048
Private Constant ULong WM_SETREDRAW = 11
Private Constant ULong GENERIC_READ = 2147483648
Private Constant ULong INTERNET_SUCCESS = 1

//connection state constants
//Public Constant ULong INTERNET_CONNECTION_CONFIGURED = 
//Public Constant ULong INTERNET_CONNECTION_LAN =
//Public Constant ULong INTERNET_CONNECTION_MODEM =
//Public Constant ULong INTERNET_CONNECTION_MODEM_BUSY =
//Public Constant ULong INTERNET_CONNECTION_OFFLINE =
//Public Constant ULong INTERNET_CONNECTION_PROXY =
//Public Constant ULong INTERNET_RAS_INSTALLED =

//use registry configuration
Public Constant ULong INTERNET_OPEN_TYPE_PRECONFIG = 0
//direct to net
Public Constant ULong INTERNET_OPEN_TYPE_DIRECT = 1
//via named proxy
Public Constant ULong INTERNET_OPEN_TYPE_PROXY = 3
//prevent using java/script/INS
Public Constant ULong INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY = 4
//used for FTP connections
Public Constant ULong INTERNET_FLAG_PASSIVE = 134217728
Public Constant ULong INTERNET_FLAG_RELOAD = 2147483648

//Additional cache flags
//don't write this item to the cache
Public Constant ULong INTERNET_FLAG_NO_CACHE_WRITE = 67108864
Public Constant ULong INTERNET_FLAG_DONT_CACHE = INTERNET_FLAG_NO_CACHE_WRITE
//make this item persistent in cache
Public Constant ULong INTERNET_FLAG_MAKE_PERSISTENT = 33554432
Public Constant ULong INTERNET_FLAG_FROM_CACHE = 16777216
//use offline semantics
Public Constant ULong INTERNET_FLAG_OFFLINE = INTERNET_FLAG_FROM_CACHE

//Additional flags
//send raw data
Public Constant ULONG INTERNET_FLAG_RAW_DATA = 1073741824
//use PCT/SSL if applicable (HTTP)
Public Constant ULong INTERNET_FLAG_SECURE = 8388608
//use keep-alive semantics
Public Constant ULong INTERNET_FLAG_KEEP_CONNECTION = 4194304
//don't handle redirections automatically
Public Constant ULong INTERNET_FLAG_NO_AUTO_REDIRECT = 2097152
//do background read prefetch
Public Constant ULong INTERNET_FLAG_READ_PREFETCH = 1048576
//no automatic cookie handling
Public Constant ULong INTERNET_FLAG_NO_COOKIES = 524288
//no automatic authentication handling
Public Constant ULong INTERNET_FLAG_NO_AUTH = 262144
//return cache file if net request fails
Public Constant ULong INTERNET_FLAG_CACHE_IF_NET_FAIL = 65536
//default for FTP servers
Public Constant ULong INTERNET_DEFAULT_FTP_PORT = 21
//   "     "  gopher "
Public Constant ULong INTERNET_DEFAULT_GOPHER_PORT = 70
//   "     "  HTTP   "
Public Constant ULong INTERNET_DEFAULT_HTTP_PORT = 80
//   "     "  HTTPS  "
Public Constant ULong INTERNET_DEFAULT_HTTPS_PORT = 443
//default for SOCKS firewall servers.
Public Constant ULong INTERNET_DEFAULT_SOCKS_PORT = 1080

//FTP: use existing InternetConnect handle for server if possible
Public Constant ULong INTERNET_FLAG_EXISTING_CONNECT = 536870912
Public Constant ULong INTERNET_SERVICE_FTP = 1
Public Constant ULong INTERNET_SERVICE_GOPHER = 2
Public Constant ULong INTERNET_SERVICE_HTTP = 3

//connected state (mutually exclusive with disconnected)
Public Constant ULong INTERNET_STATE_CONNECTED = 1
//disconnected from network
Public Constant ULong INTERNET_STATE_DISCONNECTED = 2
//disconnected by user request
Public Constant ULong INTERNET_STATE_DISCONNECTED_BY_USER = 16
//no network requests being made (by Wininet)
Public Constant ULong INTERNET_STATE_IDLE = 256
//network requests being made (by Wininet)
Public Constant ULong INTERNET_STATE_BUSY = 512

//transfer flags
Private Constant ULong FTP_TRANSFER_TYPE_UNKNOWN = 0
Private Constant ULong FTP_TRANSFER_TYPE_ASCII = 1
Private Constant ULong FTP_TRANSFER_TYPE_BINARY = 2
Private Constant ULong INTERNET_FLAG_TRANSFER_ASCII = FTP_TRANSFER_TYPE_ASCII
Private Constant ULong INTERNET_FLAG_TRANSFER_BINARY = FTP_TRANSFER_TYPE_BINARY
Private Constant ULong FTP_TRANSFER_TYPE_MASK = FTP_TRANSFER_TYPE_ASCII + FTP_TRANSFER_TYPE_BINARY

//internet callback messages
Public Constant Long INTERNET_INVALID_STATUS_CALLBACK       = -1
Private Constant Long INTERNET_STATUS_RESOLVING_NAME        = 0
Private Constant Long INTERNET_STATUS_NAME_RESOLVED         = 1
Private Constant Long INTERNET_STATUS_CONNECTING_TO_SERVER  = 20
Private Constant Long INTERNET_STATUS_CONNECTED_TO_SERVER   = 21
Private Constant Long INTERNET_STATUS_SENDING_REQUEST       = 30
Private Constant Long INTERNET_STATUS_REQUEST_SENT          = 31
Private Constant Long INTERNET_STATUS_RECEIVING_RESPONSE    = 40
Private Constant Long INTERNET_STATUS_RESPONSE_RECEIVED     = 41
Private Constant Long INTERNET_STATUS_CTL_RESPONSE_RECEIVED = 42
Private Constant Long INTERNET_STATUS_PREFETCH              = 43
Private Constant Long INTERNET_STATUS_CLOSING_CONNECTION    = 50
Private Constant Long INTERNET_STATUS_CONNECTION_CLOSED     = 51
Private Constant Long INTERNET_STATUS_HANDLE_CREATED        = 60
Private Constant Long INTERNET_STATUS_HANDLE_CLOSING        = 70
Private Constant Long INTERNET_STATUS_DETECTING_PROXY       = 80
Private Constant Long INTERNET_STATUS_REQUEST_COMPLETE      = 0
Private Constant Long INTERNET_STATUS_REDIRECT              = 10
Private Constant Long INTERNET_STATUS_INTERMEDIATE_RESPONSE = 20
Private Constant Long INTERNET_STATUS_USER_INPUT_REQUIRED   = 40
Private Constant Long INTERNET_STATUS_STATE_CHANGE          = 200

//internet error flags
Private Constant ULong INTERNET_ERROR_BASE = 12000
Private Constant ULong ERROR_INTERNET_OUT_OF_HANDLES = (INTERNET_ERROR_BASE + 1)
Private Constant ULong ERROR_INTERNET_TIMEOUT = (INTERNET_ERROR_BASE + 2)
Private Constant ULong ERROR_INTERNET_EXTENDED_ERROR = (INTERNET_ERROR_BASE + 3)
Private Constant ULong ERROR_INTERNET_INTERNAL_ERROR = (INTERNET_ERROR_BASE + 4)
Private Constant ULong ERROR_INTERNET_INVALID_URL = (INTERNET_ERROR_BASE + 5)
Private Constant ULong ERROR_INTERNET_UNRECOGNIZED_SCHEME = (INTERNET_ERROR_BASE + 6)
Private Constant ULong ERROR_INTERNET_NAME_NOT_RESOLVED = (INTERNET_ERROR_BASE + 7)
Private Constant ULong ERROR_INTERNET_PROTOCOL_NOT_FOUND = (INTERNET_ERROR_BASE + 8)
Private Constant ULong ERROR_INTERNET_INVALID_OPTION = (INTERNET_ERROR_BASE + 9)
Private Constant ULong ERROR_INTERNET_BAD_OPTION_LENGTH = (INTERNET_ERROR_BASE + 10)
Private Constant ULong ERROR_INTERNET_OPTION_NOT_SETTABLE = (INTERNET_ERROR_BASE + 11)
Private Constant ULong ERROR_INTERNET_SHUTDOWN = (INTERNET_ERROR_BASE + 12)
Private Constant ULong ERROR_INTERNET_INCORRECT_USER_NAME = (INTERNET_ERROR_BASE + 13)
Private Constant ULong ERROR_INTERNET_INCORRECT_PASSWORD = (INTERNET_ERROR_BASE + 14)
Private Constant ULong ERROR_INTERNET_LOGIN_FAILURE = (INTERNET_ERROR_BASE + 15)
Private Constant ULong ERROR_INTERNET_INVALID_OPERATION = (INTERNET_ERROR_BASE + 16)
Private Constant ULong ERROR_INTERNET_OPERATION_CANCELLED = (INTERNET_ERROR_BASE + 17)
Private Constant ULong ERROR_INTERNET_INCORRECT_HANDLE_TYPE = (INTERNET_ERROR_BASE + 18)
Private Constant ULong ERROR_INTERNET_INCORRECT_HANDLE_STATE = (INTERNET_ERROR_BASE + 19)
Private Constant ULong ERROR_INTERNET_NOT_PROXY_REQUEST = (INTERNET_ERROR_BASE + 20)
Private Constant ULong ERROR_INTERNET_REGISTRY_VALUE_NOT_FOUND = (INTERNET_ERROR_BASE + 21)
Private Constant ULong ERROR_INTERNET_BAD_REGISTRY_PARAMETER = (INTERNET_ERROR_BASE + 22)
Private Constant ULong ERROR_INTERNET_NO_DIRECT_ACCESS = (INTERNET_ERROR_BASE + 23)
Private Constant ULong ERROR_INTERNET_NO_CONTEXT = (INTERNET_ERROR_BASE + 24)
Private Constant ULong ERROR_INTERNET_NO_CALLBACK = (INTERNET_ERROR_BASE + 25)
Private Constant ULong ERROR_INTERNET_REQUEST_PENDING = (INTERNET_ERROR_BASE + 26)
Private Constant ULong ERROR_INTERNET_INCORRECT_FORMAT = (INTERNET_ERROR_BASE + 27)
Private Constant ULong ERROR_INTERNET_ITEM_NOT_FOUND = (INTERNET_ERROR_BASE + 28)
Private Constant ULong ERROR_INTERNET_CANNOT_CONNECT = (INTERNET_ERROR_BASE + 29)
Private Constant ULong ERROR_INTERNET_CONNECTION_ABORTED = (INTERNET_ERROR_BASE + 30)
Private Constant ULong ERROR_INTERNET_CONNECTION_RESET = (INTERNET_ERROR_BASE + 31)
Private Constant ULong ERROR_INTERNET_FORCE_RETRY = (INTERNET_ERROR_BASE + 32)
Private Constant ULong ERROR_INTERNET_INVALID_PROXY_REQUEST = (INTERNET_ERROR_BASE + 33)
Private Constant ULong ERROR_INTERNET_NEED_UI = (INTERNET_ERROR_BASE + 34)
Private Constant ULong ERROR_INTERNET_HANDLE_EXISTS = (INTERNET_ERROR_BASE + 36)
Private Constant ULong ERROR_INTERNET_SEC_CERT_DATE_INVALID = (INTERNET_ERROR_BASE + 37)
Private Constant ULong ERROR_INTERNET_SEC_CERT_CN_INVALID = (INTERNET_ERROR_BASE + 38)
Private Constant ULong ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR = (INTERNET_ERROR_BASE + 39)
Private Constant ULong ERROR_INTERNET_HTTPS_TO_HTTP_ON_REDIR = (INTERNET_ERROR_BASE + 40)
Private Constant ULong ERROR_INTERNET_MIXED_SECURITY = (INTERNET_ERROR_BASE + 41)
Private Constant ULong ERROR_INTERNET_CHG_POST_IS_NON_SECURE = (INTERNET_ERROR_BASE + 42)
Private Constant ULong ERROR_INTERNET_POST_IS_NON_SECURE = (INTERNET_ERROR_BASE + 43)
Private Constant ULong ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED = (INTERNET_ERROR_BASE + 44)
Private Constant ULong ERROR_INTERNET_INVALID_CA = (INTERNET_ERROR_BASE + 45)
Private Constant ULong ERROR_INTERNET_CLIENT_AUTH_NOT_SETUP = (INTERNET_ERROR_BASE + 46)
Private Constant ULong ERROR_INTERNET_ASYNC_THREAD_FAILED = (INTERNET_ERROR_BASE + 47)
Private Constant ULong ERROR_INTERNET_REDIRECT_SCHEME_CHANGE = (INTERNET_ERROR_BASE + 48)
Private Constant ULong ERROR_INTERNET_DIALOG_PENDING = (INTERNET_ERROR_BASE + 49)
Private Constant ULong ERROR_INTERNET_RETRY_DIALOG = (INTERNET_ERROR_BASE + 50)
Private Constant ULong ERROR_INTERNET_HTTPS_HTTP_SUBMIT_REDIR = (INTERNET_ERROR_BASE + 52)
Private Constant ULong ERROR_INTERNET_INSERT_CDROM = (INTERNET_ERROR_BASE + 53)
Private Constant ULong ERROR_INTERNET_FORTEZZA_LOGIN_NEEDED = (INTERNET_ERROR_BASE + 54)
Private Constant ULong ERROR_INTERNET_SEC_CERT_ERRORS = (INTERNET_ERROR_BASE + 55)
Private Constant ULong ERROR_INTERNET_SEC_CERT_NO_REV = (INTERNET_ERROR_BASE + 56)
Private Constant ULong ERROR_INTERNET_SEC_CERT_REV_FAILED = (INTERNET_ERROR_BASE + 57)

//FTP API errors
Private Constant ULong ERROR_FTP_TRANSFER_IN_PROGRESS = (INTERNET_ERROR_BASE + 110)
Private Constant ULong ERROR_FTP_DROPPED = (INTERNET_ERROR_BASE + 111)
Private Constant ULong ERROR_FTP_NO_PASSIVE_MODE = (INTERNET_ERROR_BASE + 112)

//gopher API errors
Private Constant ULong ERROR_GOPHER_PROTOCOL_ERROR = (INTERNET_ERROR_BASE + 130)
Private Constant ULong ERROR_GOPHER_NOT_FILE = (INTERNET_ERROR_BASE + 131)
Private Constant ULong ERROR_GOPHER_DATA_ERROR = (INTERNET_ERROR_BASE + 132)
Private Constant ULong ERROR_GOPHER_END_OF_DATA = (INTERNET_ERROR_BASE + 133)
Private Constant ULong ERROR_GOPHER_INVALID_LOCATOR = (INTERNET_ERROR_BASE + 134)
Private Constant ULong ERROR_GOPHER_INCORRECT_LOCATOR_TYPE = (INTERNET_ERROR_BASE + 135)
Private Constant ULong ERROR_GOPHER_NOT_GOPHER_PLUS = (INTERNET_ERROR_BASE + 136)
Private Constant ULong ERROR_GOPHER_ATTRIBUTE_NOT_FOUND = (INTERNET_ERROR_BASE + 137)
Private Constant ULong ERROR_GOPHER_UNKNOWN_LOCATOR = (INTERNET_ERROR_BASE + 138)

//HTTP API errors
Private Constant ULong ERROR_HTTP_HEADER_NOT_FOUND = (INTERNET_ERROR_BASE + 150)
Private Constant ULong ERROR_HTTP_DOWNLEVEL_SERVER = (INTERNET_ERROR_BASE + 151)
Private Constant ULong ERROR_HTTP_INVALID_SERVER_RESPONSE = (INTERNET_ERROR_BASE + 152)
Private Constant ULong ERROR_HTTP_INVALID_HEADER = (INTERNET_ERROR_BASE + 153)
Private Constant ULong ERROR_HTTP_INVALID_QUERY_REQUEST = (INTERNET_ERROR_BASE + 154)
Private Constant ULong ERROR_HTTP_HEADER_ALREADY_EXISTS = (INTERNET_ERROR_BASE + 155)
Private Constant ULong ERROR_HTTP_REDIRECT_FAILED = (INTERNET_ERROR_BASE + 156)
Private Constant ULong ERROR_HTTP_NOT_REDIRECTED = (INTERNET_ERROR_BASE + 160)
Private Constant ULong ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION = (INTERNET_ERROR_BASE + 161)
Private Constant ULong ERROR_HTTP_COOKIE_DECLINED = (INTERNET_ERROR_BASE + 162)
Private Constant ULong ERROR_HTTP_REDIRECT_NEEDS_CONFIRMATION = (INTERNET_ERROR_BASE + 168)

//additional Internet API error codes
Private Constant ULong ERROR_INTERNET_SECURITY_CHANNEL_ERROR = (INTERNET_ERROR_BASE + 157)
Private Constant ULong ERROR_INTERNET_UNABLE_TO_CACHE_FILE = (INTERNET_ERROR_BASE + 158)
Private Constant ULong ERROR_INTERNET_TCPIP_NOT_INSTALLED = (INTERNET_ERROR_BASE + 159)
Private Constant ULong ERROR_INTERNET_DISCONNECTED = (INTERNET_ERROR_BASE + 163)
Private Constant ULong ERROR_INTERNET_SERVER_UNREACHABLE = (INTERNET_ERROR_BASE + 164)
Private Constant ULong ERROR_INTERNET_PROXY_SERVER_UNREACHABLE = (INTERNET_ERROR_BASE + 165)
Private Constant ULong ERROR_INTERNET_BAD_AUTO_PROXY_SCRIPT = (INTERNET_ERROR_BASE + 166)
Private Constant ULong ERROR_INTERNET_UNABLE_TO_DOWNLOAD_SCRIPT = (INTERNET_ERROR_BASE + 167)
Private Constant ULong ERROR_INTERNET_SEC_INVALID_CERT = (INTERNET_ERROR_BASE + 169)
Private Constant ULong ERROR_INTERNET_SEC_CERT_REVOKED = (INTERNET_ERROR_BASE + 170)

//InternetAutodial specific errors
Private Constant ULong ERROR_INTERNET_FAILED_DUETOSECURITYCHECK = (INTERNET_ERROR_BASE + 171)
Private Constant ULong ERROR_INTERNET_NOT_INITIALIZED = (INTERNET_ERROR_BASE + 172)
Private Constant ULong ERROR_INTERNET_NEED_MSN_SSPI_PKG = (INTERNET_ERROR_BASE + 173)
Private Constant ULong ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY = (INTERNET_ERROR_BASE + 174)
Private Constant ULong INTERNET_ERROR_LAST = ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY

//required callback enum & var
//Private ULong FTP_STATES
Private Constant ULong FTP_WAIT = 0
Private Constant ULong FTP_ENUM = 1
Private Constant ULong FTP_DOWNLOAD = 2
Private Constant ULong FTP_DOWNLOADING = 3
Private Constant ULong FTP_UPLOAD = 4
Private Constant ULong FTP_UPLOADING = 5
Private Constant ULong FTP_CREATINGDIR = 6
Private Constant ULong FTP_CREATEDIR = 7
Private Constant ULong FTP_REMOVINGDIR = 8
Private Constant ULong FTP_REMOVEDIR = 9
Private Constant ULong FTP_DELETINGFILE = 10
Private Constant ULong FTP_DELETEFILE = 11
Private Constant ULong FTP_RENAMINGFILE = 12
Private Constant ULong FTP_RENAMEFILE = 13
Private Constant ULong FTP_ENUMFILES = 14

Private ULong CurrentState

end variables

forward prototypes
public function double ftpfilegetfilesize (win32_find_data wfd)
public function string ftpfilegetfilesizestr (win32_find_data wfd)
public function string stripnull (string item)
public function string qualifyurl (string spath)
public function string qualifypath (string spath)
public function string addnull (string item)
public subroutine getftpdirectorycontents ()
public function boolean ftpfileupload (string slocalfile, string snewremotefile)
public subroutine readsettings ()
public subroutine dl (string liste[])
public function string formatfilesize (longlong filesize)
public subroutine ul (string liste[])
public subroutine dldossier (string dossier)
public subroutine uldossier (string dossier)
public function double totalsize (string sremotelist[], string slocallist[])
public function double sizeremotefile (string file)
public function double sizeremotedir (string dir)
public function double sizelocalfile (string file)
public function double sizelocaldir (string dir)
public function string getecode (unsignedlong lerrorcode)
public function string getftpdirectory (unsignedlong hconn)
public function boolean createftpdirectory (unsignedlong hconn, string snewdirname)
public function character comparedate (datetime localdate, filetime remotedate)
public function boolean of_updaterequired ()
public function unsignedlong of_connect (string as_remoteulpath)
public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath)
public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password)
public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password, string as_userid)
public subroutine of_disconnect ()
public function unsignedlong of_connect ()
public subroutine ftpcallbackstatus (unsignedlong hinet, unsignedlong dwcontext, unsignedlong dwinternetstatus, unsignedlong lpvstatusinfo, unsignedlong dwstatusinfolength)
public function boolean ftpfiledownload (string sremotefile, string snewlocalfile, win32_find_data wfd, unsignedlong bfailifexists)
public function unsignedlong getinternetconnecthandle ()
public function boolean ulfichier (string fichier)
public function boolean dlfichier (string fichier)
public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password, string as_userid, string as_servername, unsignedlong al_port)
public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password, string as_userid, string as_servername)
public subroutine ftpfiledelete ()
public function boolean ftpfiledelete (string sfilename)
public subroutine ftpfilegetdirectorycontents (string snewlocalfile, ref string is_filename[])
end prototypes

public function double ftpfilegetfilesize (win32_find_data wfd);Return (WFD.nFileSizeHigh * (MAXDWORD + 1)) + WFD.nFileSizeLow

end function

public function string ftpfilegetfilesizestr (win32_find_data wfd);String sSize

sSize = Space(64)
StrFormatByteSizeW(WFD.nFileSizeLow, &
						 WFD.nFileSizeHigh * (MAXDWORD + 1), &
						 sSize, 64)

Return sSize

end function

public function string stripnull (string item);//Return a string without the char(0) terminator.
Long ll_pos

ll_pos = Pos(item, Char(0))

If ll_pos <> 0 Then
	Return Left(item, ll_pos - 1)
Else
	Return item
End If

end function

public function string qualifyurl (string spath);//assures that a passed path ends in a slash
If Right(sPath, 1) <> "/" Then
	Return sPath + "/"
Else
	Return sPath
End If

end function

public function string qualifypath (string spath);//assures that a passed path ends in a slash
If Right(sPath, 1) <> "\" Then
	Return sPath + "\"
Else
	Return sPath
End If

end function

public function string addnull (string item);//Return a string with a char(0) terminator.
Long ll_pos

ll_pos = Pos(item, Char(0))

If ll_pos <> 0 Then
	Return item
Else
	Return item + Char(0)
End If

end function

public subroutine getftpdirectorycontents ();Long hFind, hFindConnect
String sPath, sPathOnly
WIN32_FIND_DATA WFD

//Show the wait cursor
SetPointer(Hourglass!)
w_ftpupdate.lb_1.Reset()

//Obtain the current FTP path
sPathOnly = GetFtpDirectory(hConnection)

//The search parameters .. here we'll list
//all file types. Since GetFTPDirectory takes
//care of qualifying the path, no terminating
//slash is required.
sPath = sPathOnly + "*.*"
	
//Connection handles used by the FtpFindFirstFile
//API go out of scope once the all files are
//listed, therefore it can not be reused.
//This restriction is handled by obtaining
//a fresh connection handle each time a call
//to FtpFindFirstFile is required, and releasing
//it once finished.
hFindConnect = GetInternetConnectHandle()

//If a good connection handle ...
If hFindConnect <> 0 Then

	//..obtain the handle to the files with
	//the FtpFindFirstFile API. Obtaining the
	//directory contents is essentially similar
	//to using the Win32 file system APIs
	//FindFirstFile and FindNextFile, with the
	//sole exception that there is no FtpFindNextFile
	//API. Instead, successive calls are made
	//to InternetFindNextFile. The data returned
	//is in the familiar WIN32_FIND_DATA structure.
	hFind = FtpFindFirstFile(hFindConnect, &
									 sPath, WFD, &
									 INTERNET_FLAG_RELOAD + &
									 INTERNET_FLAG_NO_CACHE_WRITE, &
									 0)

	//If a valid find handle returned,
	//loop through the directory listing
	//the contents. If the attributes of
	//the returned string indicate a folder,
	//append a slash to make it both visually
	//stand out in the list, and identifiable
	//in the list double-click routine for
	//navigation.
	//
	//hFile will be 0 if the navigated-to
	//folder is empty.
	If hFind <> 0 Then
	
		//suspend redraw on the file list
		w_ftpupdate.lb_1.SetRedraw(False)

		Do

			//if a folder
			If num.of_bitwiseand(WFD.dwFileAttributes, FILE_ATTRIBUTE_DIRECTORY) <> 0 Then
				
				If WFD.cFileName <> "." And WFD.cFileName <> sRootDots Then
					//append a slash and add to list
					w_ftpupdate.lb_1.AddItem(QualifyUrl(WFD.cFileName))
				End If
			Else

				//add the item and its file size
				w_ftpupdate.lb_1.AddItem(WFD.cFileName + &
												 "~t" + &
												 FormatFileSize(FtpFileGetFileSize(WFD)))
				
			End If  //If WFD.dwFileAttributes

		//continue while valid
		Loop While InternetFindNextFile(hFind, WFD) <> 0
		
		w_ftpupdate.lb_1.SetRedraw(True)

	End If //If hFind

End If  //If hFindConnect

//clean up by closing the handles used in this routine
InternetCloseHandle(hFind)
InternetCloseHandle(hFindConnect)

SetPointer(Arrow!)

end subroutine

public function boolean ftpfileupload (string slocalfile, string snewremotefile);//Show the wait cursor
SetPointer(Hourglass!)

//Only if a valid connection...
If hConnection <> 0 Then
 
  //dwCurrentFileSize is used in the
  //callback and progress routine
	dwCurrentFileSize = files.of_getFileSize(sLocalFile)
	
  //create the progress window passing the
  //upload file size, and a message to display
//	w_ftpupdate.FloodDisplay(dwCurrentFileSize, &
//									 "Uploading " + sLocalFile + &
//									 " to " + sNewRemoteFile)
	
  //this is the key ... set the current
  //FTP state to uploading
	CurrentState = FTP_UPLOADING
	
  //download the file
	If FtpPutFile(hConnection, &
					  sLocalFile, &
					  sNewRemoteFile, &
					  FTP_TRANSFER_TYPE_UNKNOWN, &
					  1) <> 0 Then
		
	  //show the success message
		Return True
						  
	Else
	
	  //set the error message and return
		FtpErrorMessage = GetECode(GetLastError())
		Return False
	
	End If  //If FtpPutFile
End If //If hConnect


CurrentState = 0
SetPointer(Arrow!)

end function

public subroutine readsettings ();String strLine
Integer fch
Integer p
String sDlList[]
String sUlList[]
Char fDU

If FileExists(GetCurrentDirectory() + "\settings.ini") Then

	fch = FileOpen("settings.ini")
	
	fDU = ''
	
	Do While FileRead(fch,strLine) >= 0
		If strLine <> "" Then
			p = Pos(strLine, "=")
			If p <> 0 Then
				Choose Case Trim(Lower(Left(strLine, p - 1)))
					Case "host"
						is_servername = Trim(Mid(strLine, p + 1))
					Case "uid"
						is_ftpusername = Trim(Mid(strLine, p + 1))
					Case "pwd"
						is_ftppassword = Trim(Mid(strLine, p + 1))
					Case "dfld"
						sLocalDownloadPath = qualifyPath(Trim(Rep(Mid(strLine, p + 1), "/", "\")))
					Case "ufld"
						sRemoteUploadPath = qualifyURL(Trim(Rep(Mid(strLine, p + 1), "\", "/")))
				End Choose
			Else
				If Trim(Lower(strLine)) = "[download]" Then
					fDU = 'd'
				ElseIf Trim(Lower(strLine)) = "[upload]" Then
					fDU = 'u'
				ElseIf fDU = 'd' Then
					sDlList[UpperBound(sDlList) + 1] = strLine
				ElseIf fDU = 'u' Then
					sUlList[UpperBound(sUlList) + 1] = strLine
				End If
			End If //If pos
		End If //If strLine
	Loop

	//if the server name, the user id and the password are present, try to connect
	If is_servername <> "" And is_ftpusername <> "" And is_ftppassword <> "" Then

		of_connect()
		
//		w_ftpupdate.totalDisplay(totalSize(sDlList, sUlList))
	 
		If sLocalDownloadPath <> "" And UpperBound(sDlList) > 0 Then
			dl(sDlList)
		End If //If path defined and at least one download to make
		
		If sRemoteUploadPath <> "" And UpperBound(sUlList) > 0 Then
			ul(sUlList)
		End If //If path defined and at least one upload to make
	 
		//clean up
//		w_ftpupdate.FloodHide()
		of_disconnect()

//		w_ftpupdate.st_status.Text = ""
//		w_ftpupdate.lb_1.Reset()
				
	End If //If Server name, UID and PWD exist
	
//	w_ftpupdate.cb_1.Enabled = True
	
Else
	MessageBox('Erreur', GetCurrentDirectory() + "\settings.ini introuvable")
//	w_ftpupdate.cb_close.setFocus()
End If

end subroutine

public subroutine dl (string liste[]);Integer i

//Show the wait cursor
SetPointer(Hourglass!)
	
//if the connection handle is valid
If hConnection <> 0 Then
	 
	//if the folder doesn't exist, create it
	If Not DirectoryExists(sLocalDownloadPath) Then
		CreateDirectory(sLocalDownloadPath)
	End If
		 
	//this just resets the list, labels and error message
//	w_ftpupdate.ResetStuff()
	 
	For i = 1 To UpperBound(liste)
		
		If Right(liste[i], 1) = sSlash Then
			dlDossier(liste[i])
		Else
			dlFichier(liste[i])
		End If
	Next
	 
Else
	 
  //show the error
//	w_ftpupdate.st_status.Text = GetECode(GetLastError())
		
End If  //If hConnect

SetPointer(Arrow!)

end subroutine

public function string formatfilesize (longlong filesize);Choose Case fileSize
	Case Is < 1024
		Return String(fileSize) + " octets"
	Case 1024 To 1024 ^ 2 - 1
		Return String(Round(fileSize / 1024, 2)) + " Ko"
	Case 1024 ^ 2 To 1024 ^ 3 - 1
		Return String(Round(fileSize / 1024 ^ 2, 2)) + " Mo"
	Case 1024 ^ 3 To 1024 ^ 4 - 1
		Return String(Round(fileSize / 1024 ^ 3, 2)) + " Go"
	Case 1024 ^ 4 To 1024 ^ 5 - 1
		Return String(Round(fileSize / 1024 ^ 4, 2)) + " To"
	Case Else
		Return String(Round(fileSize / 1024 ^ 5, 2)) + " Po"
End Choose

end function

public subroutine ul (string liste[]);Integer i
ULong hFind, hFindConnect
WIN32_FIND_DATA WFD

//Show the wait cursor
SetPointer(Hourglass!)

//if the connection handle is valid
If hConnection <> 0 Then

	//Connection handles used by the FtpFindFirstFile
	//API go out of scope once the all files are
	//listed, therefore it can not be reused.
	//This restriction is handled by obtaining
	//a fresh connection handle each time a call
	//to FtpFindFirstFile is required, and releasing
	//it once finished.
	hFindConnect = GetInternetConnectHandle()
	
	//If a good connection handle ...
	If hFindConnect <> 0 Then
	
		//..obtain the handle to the files with
		//the FtpFindFirstFile API. Obtaining the
		//directory contents is essentially similar
		//to using the Win32 file system APIs
		//FindFirstFile and FindNextFile, with the
		//sole exception that there is no FtpFindNextFile
		//API. Instead, successive calls are made
		//to InternetFindNextFile. The data returned
		//is in the familiar WIN32_FIND_DATA structure.
		hFind = FtpFindFirstFile(hFindConnect, &
										 sRemoteUploadPath, WFD, &
										 num.of_bitwiseor(INTERNET_FLAG_RELOAD, &
										 INTERNET_FLAG_NO_CACHE_WRITE), &
										 0)
		
		//If a valid find handle returned,
		//loop through the directory listing
		//the contents. If the attributes of
		//the returned string indicate a folder,
		//append a slash to make it both visually
		//stand out in the list, and identifiable
		//in the list double-click routine for
		//navigation.
		//
		//hFile will be 0 if the navigated-to
		//folder is empty.
		If hFind = 0 Then
			CreateFtpDirectory(hConnection, sRemoteUploadPath)
//			w_ftpupdate.st_status.Text = GetECode(GetLastError())
		End If //If hFind
	
	End If //If hFindConnect
	
	//this just resets the list, labels and error message
//	w_ftpupdate.ResetStuff()
	
	For i = 1 To UpperBound(liste)
	
		If Right(liste[i], 1) = "\" Then
			ulDossier(liste[i])
		Else
			ulFichier(liste[i])
		End If
	Next 
	
Else
	
	//show the error
//	w_ftpupdate.st_status.Text = GetECode(GetLastError())
	
	//clean up
	InternetCloseHandle(hFind)
	InternetCloseHandle(hFindConnect)

End If  //If hConnect

SetPointer(Arrow!)

end subroutine

public subroutine dldossier (string dossier);ULong hFind, hFindConnect
String sFich
WIN32_FIND_DATA WFD

//Show the wait cursor
SetPointer(Hourglass!)

//Connection handles used by the FtpFindFirstFile
//API go out of scope once the all files are
//listed, therefore it can not be reused.
//This restriction is handled by obtaining
//a fresh connection handle each time a call
//to FtpFindFirstFile is required, and releasing
//it once finished.
hFindConnect = GetInternetConnectHandle()

//If a good connection handle ...
If hFindConnect <> 0 Then

	//..obtain the handle to the files with
	//the FtpFindFirstFile API. Obtaining the
	//directory contents is essentially similar
	//to using the Win32 file system APIs
	//FindFirstFile and FindNextFile, with the
	//sole exception that there is no FtpFindNextFile
	//API. Instead, successive calls are made
	//to InternetFindNextFile. The data returned
	//is in the familiar WIN32_FIND_DATA structure.
	hFind = FtpFindFirstFile(hFindConnect, &
									 dossier, WFD, &
									 num.of_bitwiseor(INTERNET_FLAG_RELOAD, &
									 INTERNET_FLAG_NO_CACHE_WRITE), &
									 0)
	
	//If a valid find handle returned,
	//loop through the directory listing
	//the contents. If the attributes of
	//the returned string indicate a folder,
	//append a slash to make it both visually
	//stand out in the list, and identifiable
	//in the list double-click routine for
	//navigation.
	//
	//hFile will be 0 if the navigated-to
	//folder is empty.
	If hFind <> 0 Then
		Do
			//get the name of the file
			sFich = StripNull(WFD.cFileName)
			
			//If it's not the current or parent folder
			If sFich <> "." And sFich <> sRootDots Then
				//if a folder
				If num.of_bitwiseand(WFD.dwFileAttributes, FILE_ATTRIBUTE_DIRECTORY) <> 0 Then
					//append a slash and call this function recursively
					dlDossier(QualifyUrl(dossier + sFich))
						  
				Else
					//download the file
					dlFichier(dossier + sFich)
				End If //If WFD.dwFileAttributes
			End If
			
			//continue while valid
		Loop While InternetFindNextFile(hFind, WFD) <> 0
	End If //If hFind
End If //If hFindConnect

//clean up by closing the handles used in this routine
InternetCloseHandle(hFind)
InternetCloseHandle(hFindConnect)

SetPointer(Arrow!)

end subroutine

public subroutine uldossier (string dossier);Integer i
ListBox lb_dir

//Show the wait cursor
SetPointer(Hourglass!)

//If the folder exists
If DirectoryExists(dossier) Then

	//For each folder in this one
	lb_dir.Reset()
	lb_dir.dirList(dossier + "*", 32784)
	For i = 1 To lb_dir.TotalItems()
		//recursively call this function
		ulDossier(qualifyPath(dossier + lb_dir.Text(i)))
	Next
	
	//For each file in the folder
	lb_dir.Reset()
	lb_dir.dirList(dossier + "*", 37)
	For i = 1 To lb_dir.TotalItems()
		//upload the file
		ulFichier(dossier + lb_dir.Text(i))
	Next
End If  //If fs.FolderExists

SetPointer(Arrow!)

end subroutine

public function double totalsize (string sremotelist[], string slocallist[]);Integer i
Double dTSize = 0

SetPointer(Hourglass!)

If hConnection <> 0 Then
	If sLocalDownloadPath <> "" And UpperBound(sRemoteList) > 0 Then

		For i = 1 To UpperBound(sRemoteList)
			If Right(sRemoteList[i], 1) = sSlash Then
				dTSize += sizeRemoteDir(sRemoteList[i])
			Else
				dTSize += sizeRemoteFile(sRemoteList[i])
			End If
		Next
	End If //If path defined and at least one download to make

	If sRemoteUploadPath <> "" And UpperBound(sLocalList) > 0 Then
	
		For i = 1 To UpperBound(sLocalList)
			If Right(sLocalList[i], 1) = sSlash Then
				dTSize += sizeLocalDir(sLocalList[i])
			Else
				dTSize += sizeLocalFile(sLocalList[i])
			End If
		Next
	End If //If path defined and at least one upload to make
	
Else

	//show the error
//	w_ftpupdate.st_status.Text = GetECode(GetLastError())
End If  //If hConnection

SetPointer(Arrow!)

Return dTSize
end function

public function double sizeremotefile (string file);String sNewLocalFile
Double dSize = 0
ULong hFind, hFindConnect
WIN32_FIND_DATA WFD

//build the necessary string.
If Left(file, 1) = "/" Then
	sNewLocalFile = sLocalDownloadPath + Rep(Mid(file, 2), "/", "\")
Else
	sNewLocalFile = sLocalDownloadPath + Rep(file, "/", "\")
End If

//assure the file is on the server and retrieving
//its info into a WIN32_FIND_DATA structure
hFindConnect = GetInternetConnectHandle()
If hFindConnect <> 0 Then
	hFind = FtpFindFirstFile(hFindConnect, &
									 AddNull(file), &
									 WFD, 0, 0)
//	w_ftpupdate.st_status.Text = GetECode(GetLastError())
	
	//if the FtpFindFirstFile call located
	//the file then get its size
	If hFind <> 0 Then
	
		//if the file already exists, compare its size
		dSize = FtpFileGetFileSize(WFD)
	
		//clean up
		InternetCloseHandle(hFind)
	End If //If hFind

	InternetCloseHandle(hFindConnect)
End If //If hFindConnect

If FileExists(sNewLocalFile) Then
	If files.of_getFileSize(sNewLocalFile) = dSize Then
		Return 0
	End If
End If //If FileExists

return dSize
end function

public function double sizeremotedir (string dir);Double dSize = 0
ULong hFind, hFindConnect
String sFich
WIN32_FIND_DATA WFD

//Connection handles used by the FtpFindFirstFile
//API go out of scope once the all files are
//listed, therefore it can not be reused.
//This restriction is handled by obtaining
//a fresh connection handle each time a call
//to FtpFindFirstFile is required, and releasing
//it once finished.
hFindConnect = GetInternetConnectHandle()

//If a good connection handle ...
If hFindConnect <> 0 Then

	//..obtain the handle to the files with
	//the FtpFindFirstFile API. Obtaining the
	//directory contents is essentially similar
	//to using the Win32 file system APIs
	//FindFirstFile and FindNextFile, with the
	//sole exception that there is no FtpFindNextFile
	//API. Instead, successive calls are made
	//to InternetFindNextFile. The data returned
	//is in the familiar WIN32_FIND_DATA structure.
	hFind = FtpFindFirstFile(hFindConnect, &
									 dir, WFD, &
									 INTERNET_FLAG_RELOAD + &
									 INTERNET_FLAG_NO_CACHE_WRITE, &
									 0)
	
	//If a valid find handle returned,
	//loop through the directory listing
	//the contents. If the attributes of
	//the returned string indicate a folder,
	//append a slash to make it both visually
	//stand out in the list, and identifiable
	//in the list double-click routine for
	//navigation.
	//
	//hFile will be 0 if the navigated-to
	//folder is empty.
	If hFind <> 0 Then
		Do
			//get the name of the file
			sFich = StripNull(WFD.cFileName)
			
			//If it's not the current or parent folder
			If sFich <> "." And sFich <> sRootDots Then
				//if a folder
				If num.of_bitwiseand(WFD.dwFileAttributes, FILE_ATTRIBUTE_DIRECTORY) <> 0 Then
					//append a slash and call recursively this function
					dSize += sizeRemoteDir(QualifyUrl(dir + sFich))
				Else
					//get the file size
					dSize += sizeRemoteFile(dir + sFich)
				End If //If WFD.dwFileAttributes
			End If
			
			//continue while valid
		Loop While InternetFindNextFile(hFind, WFD) <> 0
	End If //If hFind
End If //If hFindConnect

//clean up by closing the handles used in this routine
InternetCloseHandle(hFind)
InternetCloseHandle(hFindConnect)

return dSize
end function

public function double sizelocalfile (string file);Double dSize = 0
String sNewRemoteFile
ULong hFind, hFindConnect
WIN32_FIND_DATA WFD
Boolean succes, fReadOnly, fHidden, fSystem, fSubDir, fArchive

//build the necessary string.
sNewRemoteFile = sRemoteUploadPath + Rep(Mid(file, 4), "\", sSlash)

//assure the file is on the local machine
If FileExists(file) Then

	//if the file doesn't exist already
	hFindConnect = GetInternetConnectHandle()
	If hFindConnect <> 0 Then
		
		hFind = FtpFindFirstFile(hFindConnect, &
										 AddNull(sNewRemoteFile), &
										 WFD, 0, 0)
//		w_ftpupdate.st_status.Text = GetECode(GetLastError())
		
		//if the FtpFindFirstFile call located the file
		//get its size
		If hFind <> 0 Then
			dSize = FtpFileGetFileSize(WFD)
			//clean up
			InternetCloseHandle(hFind)
		End If //If hFind

		//clean up
		InternetCloseHandle(hFindConnect)
	End If //If hFindConnect
	
	//if the file isn't valid, return size of 0
	If files.of_getFileSize(file) = dSize Then
		Return 0
	End If

	files.of_getFileAttributes(file, fReadOnly, fHidden, fSystem, fSubDir, fArchive)

	If fHidden Then
		Return 0
	End If

	Return files.of_getFileSize(file)
Else
	Return 0
End If //If fs.FileExists

end function

public function double sizelocaldir (string dir);Double dSize = 0
Integer i
ListBox lb_dir

//If the folder exists
If DirectoryExists(dir) Then

	//For each folder in this one
	lb_dir.Reset()
	lb_dir.dirList(dir + "*", 16)
	For i = 1 To lb_dir.TotalItems()
		//recursively call this function
		dSize += sizeLocalDir(qualifyPath(dir + lb_dir.Text(i)))
	Next
	
	//For each file in the folder
	lb_dir.Reset()
	lb_dir.dirList(dir + "*", 37)
	For i = 1 To lb_dir.TotalItems()
		//get the file size
		dSize += sizeLocalFile(dir + lb_dir.Text(i))
	Next
End If  //If fs.FolderExists

Return dSize


end function

public function string getecode (unsignedlong lerrorcode);//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
// From       : MSDN
// Name       : GetECode
// Purpose    : Provides message corresponding to DLL error codes
// Parameters : The DLL error code
// Return val : String containing message
// Algorithm  : Selects the appropriate string
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

String sBuffer
ULong nBuffer

Choose Case lErrorCode
	Case 12001
		Return "No more handles could be generated at this time"
	Case 12002
		Return "The request has timed out."
	Case 12003
		//extended error. Retrieve the details using
		//the InternetGetLastResponseInfo API.
		
		sBuffer = Space(256)
		nBuffer = Len(sBuffer)
		
		If InternetGetLastResponseInfo(lErrorCode, sBuffer, nBuffer) <> 0 Then
			Return StripNull(sBuffer)
		Else
			Return "Extended error returned from server."
		End If
		
	Case 12004
		Return "An internal error has occurred."
	Case 12005
		Return "URL is invalid."
	Case 12006
		Return "URL scheme could not be recognized, " + &
				 "or is not supported."
	Case 12007
		Return "Server name could not be resolved."
	Case 12008
		Return "Requested protocol could not be located."
	Case 12009
		Return "A request to InternetQueryOption or " + &
				 "InternetSetOption specified an invalid option value."
	Case 12010
		Return "Length of an option supplied to InternetQueryOption " + &
				 "or InternetSetOption is incorrect for the type " + &
				 "of option specified."
	Case 12011
		Return "The request option can not be set, only queried. "
	Case 12012
		Return "The Win32 Internet support is being shutdown or unloaded."
	Case 12013
		Return "Request to connect and login to an FTP server could not" + &
				 "be completed because the supplied user name is incorrect."
	Case 12014
		Return "Request to connect and login to an FTP server could not " + &
				 "be completed because the supplied password is incorrect. "
	Case 12015
		Return "Request to connect to and login to an FTP server failed."
	Case 12016
		Return "Requested operation is invalid. "
	Case 12017
		Return "Operation was cancelled, usually because the handle on " + &
				 "which the request was operating was closed before the " + &
				 "operation completed."
	Case 12018
		Return "Type of handle supplied is incorrect for this operation."
	Case 12019
		Return "Requested operation can not be carried out because the " + &
				 "handle supplied is not in the correct state."
	Case 12020
		Return "Request can not be made via a proxy."
	Case 12021
		Return "A required registry value could not be located. "
	Case 12022
		Return "A required registry value was located but is an " + &
				 "incorrect type or has an invalid value."
	Case 12023
		Return "Direct network access cannot be made at this time. "
	Case 12024
		Return "An asynchronous request could not be made because " + &
				 "a zero context value was supplied."
	Case 12025
		Return "An asynchronous request could not be made because " + &
				 "a callback function has not been set."
	Case 12026
		Return "The required operation could not be completed " + &
				 "because one or more requests are pending."
	Case 12027
		Return "The format of the request is invalid."
	Case 12028
		Return "The requested item could not be located."
	Case 12029
		Return "The attempt to connect to the server failed."
	Case 12030
		Return "The connection with the server has been terminated."
	Case 12031
		Return "The connection with the server has been reset."
	Case 12036
		Return "The request failed because the handle already exists."
	Case Else
		Return "FTP Session in progress."
End Choose

end function

public function string getftpdirectory (unsignedlong hconn);ULong nCurrDir
String sCurrDir

//FtpGetCurrentDirectory retrieves the current
//directory for the connection. Using this API
//means it is not necessary to track the directory
//hierarchy for navigation.

//pad the requisite buffers
sCurrDir = Space(256)
nCurrDir = Len(sCurrDir)
	
//FtpGetCurrentDirectory returns 1 if successful
If FtpGetCurrentDirectory(hConn, sCurrDir, nCurrDir) = 1 Then
	
  //return a properly qualified path
	Return QualifyUrl(StripNull(sCurrDir))
Else
	Return ""
End If

end function

public function boolean createftpdirectory (unsignedlong hconn, string snewdirname);//FtpCreateDirectory creates a new directory
//for the connection. Directory names can be absolute
//or relative.

//FtpCreateDirectory returns 1 if successful
If FtpCreateDirectory(hConn, AddNull(sNewDirName)) = 1 Then
	
  //show the success message
	Return True
Else
  //set the error message and return
	FtpErrorMessage = GetECode(GetLastError())
	Return False
	
End If

end function

public function character comparedate (datetime localdate, filetime remotedate);Char lc_result
SYSTEMTIME dtSysRmDate
SYSTEMTIME dtSysUnTime
TIME_ZONE_INFORMATION tmZnInfo

If FileTimeToSystemTime(remoteDate, dtSysUnTime) <> 0 Then
// If GetTimeZoneInformation(tmZnInfo) <> -1 Then
  If SystemTimeToTzSpecificLocalTime(tmZnInfo, dtSysUnTime, dtSysRmDate) <> 0 Then
 
   If Year(Date(localDate)) < dtSysRmDate.wYear Then
    Return '<'
   ElseIf Year(Date(localDate)) > dtSysRmDate.wYear Then
    Return '>'
   ElseIf Month(Date(localDate)) < dtSysRmDate.wMonth Then
    Return '<'
   ElseIf Month(Date(localDate)) > dtSysRmDate.wMonth Then
    Return '>'
   ElseIf Day(Date(localDate)) < dtSysRmDate.wDay Then
    Return '<'
   ElseIf Day(Date(localDate)) > dtSysRmDate.wDay Then
    Return '>'
   ElseIf Hour(Time(localDate)) < dtSysRmDate.wHour Then
    Return '<'
   ElseIf Hour(Time(localDate)) > dtSysRmDate.wHour Then
    Return '>'
   ElseIf Minute(Time(localDate)) < dtSysRmDate.wMinute Then
    Return '<'
   ElseIf Minute(Time(localDate)) > dtSysRmDate.wMinute Then
    Return '>'
   ElseIf Second(Time(localDate)) < dtSysRmDate.wSecond Then
    Return '<'
   ElseIf Second(Time(localDate)) > dtSysRmDate.wSecond Then
    Return '>'
   Else
    Return '='
   End If
  End If
// End If
End If
 
SetNull(lc_result)
 
Return lc_result

end function

public function boolean of_updaterequired ();String ls_null, ls_verslocal[], ls_versftp[]
Char lc_comp
Date ldt_date,ldt_tryupd
Time ldt_time
DateTime ldt_dateLocal
ULong hFindConnect, hFind, flags
WIN32_FIND_DATA WFD
Boolean succes = False
Integer li_file, i

select ftpservername, ftpusername, ftppassword, datetryupd
into :is_serverName, :is_ftpusername, :is_ftppassword, :ldt_tryupd
from t_backup;

ls_verslocal = split(gnv_app.of_getVersion(), '.')
If InternetGetConnectedState(flags, 0) <> 0 Then
	// Connect to the Internet
	if hConnection = 0 then of_connect()
	
	ldt_dateLocal = DateTime(ldt_date, ldt_time)
	
	setNull(ls_null)
	
	hSession = InternetOpen("FTP Transfer", &
									INTERNET_OPEN_TYPE_DIRECT, &
									ls_null, &
									ls_null, &
									0)


	//If a handle was obtained, the next step is
	//to obtain a connection handle that will be
	//used for all operations except the FTP
	//directory navigation. The MSDN states that
	//the handle used by FtpFindFirstFile and subsequent
	//file calls can not be reused for additional
	//navigation or other operations.
	If hSession <> 0 Then

		//Connection handles used by the FtpFindFirstFile
		//API go out of scope once the all files are
		//listed, therefore it can not be reused.
		//This restriction is handled by obtaining
		//a fresh connection handle each time a call
		//to FtpFindFirstFile is required, and releasing
		//it once finished.
		hFindConnect = GetInternetConnectHandle()
		
		//If a good connection handle ...
		If hFindConnect <> 0 Then
			FtpSetCurrentDirectory(hFindConnect, "/")
			
			//..obtain the handle to the files with
			//the FtpFindFirstFile API. Obtaining the
			//directory contents is essentially similar
			//to using the Win32 file system APIs
			//FindFirstFile and FindNextFile, with the
			//sole exception that there is no FtpFindNextFile
			//API. Instead, successive calls are made
			//to InternetFindNextFile. The data returned
			//is in the familiar WIN32_FIND_DATA structure.
			hFind = FtpFindFirstFile(hFindConnect, &
											 "/orthotek/update/version.txt", WFD, &
											 INTERNET_FLAG_RELOAD + &
											 INTERNET_FLAG_NO_CACHE_WRITE, &
											 0)
			
			//If a valid find handle returned,
			//download it
			//
			//hFile will be 0 if the navigated-to
			//folder is empty.
			If hFind <> 0 Then
				if not directoryExists("C:\ii4net\orthotek\update") then
					createDirectory("C:\ii4net\orthotek\update")
				end if
				
				// Download the version text file
				succes = FtpFileDownload("/orthotek/update/version.txt", &
												 "C:\ii4net\orthotek\update\version.txt", &
												 WFD, &
												 0)
				
				If succes Then
					li_file = fileOpen("C:\ii4net\orthotek\update\version.txt")
					fileRead(li_file, gs_verdispo)
					fileClose(li_file)
					
					ls_versftp = split(gs_verdispo, '.')
				End If
				
				InternetCloseHandle(hFind)
			End If //If hFind
			InternetCloseHandle(hFindConnect)
		
		End If  //If hFindConnect
		
		//clean up by closing the handles used in this routine
		InternetCloseHandle(hSession)
		
		hSession = 0
	End If //If InternetGetConnectedState
	
	of_disconnect()
End If  //If hSession

If upperbound(ls_versftp) = 4 Then
	if ls_verslocal[1] < ls_versftp[1] then
		return true
	elseif ls_verslocal[1] = ls_versftp[1] and ls_verslocal[2] < ls_versftp[2] then
		return true
	else
		return false
	end if
end if

//	for i = 1 to 4
//		If long(ls_verslocal[i]) < long(ls_versftp[i]) Then
//			Return True
//			Exit
//		ElseIf long(ls_verslocal[i]) > long(ls_versftp[i]) Then
//			Return False
//			Exit
//		End If
//	Next
 	
//If upperbound(ls_versftp) = 4 Then
//	for i = 1 to 4
//		If ls_verslocal[i] < ls_versftp[i] Then
//			Return True
//			Exit
//		ElseIf ls_verslocal[i] > ls_versftp[i] Then
//			Return False
//			Exit
//		End If
//	Next
//End If
	
Return False
end function

public function unsignedlong of_connect (string as_remoteulpath);Return of_connect(as_remoteulpath, sLocalDownloadPath, is_ftppassword, is_ftpusername, is_servername, il_ftpport)

end function

public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath);Return of_connect(as_remoteulpath, as_localdlpath, is_ftppassword, is_ftpusername, is_servername, il_ftpport)

end function

public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password);Return of_connect(as_remoteulpath, as_localdlpath, as_password, is_ftpusername, is_servername, il_ftpport)

end function

public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password, string as_userid);Return of_connect(as_remoteulpath, as_localdlpath, as_password, as_userid, is_servername, il_ftpport)

end function

public subroutine of_disconnect ();If hConnection <> 0 Then InternetCloseHandle(hConnection)
If hSession <> 0 Then InternetCloseHandle(hSession)

hConnection = 0
hSession = 0

end subroutine

public function unsignedlong of_connect ();Return of_connect(sRemoteUploadPath, sLocalDownloadPath, is_ftppassword, is_ftpusername, is_servername, il_ftpport)

end function

public subroutine ftpcallbackstatus (unsignedlong hinet, unsignedlong dwcontext, unsignedlong dwinternetstatus, unsignedlong lpvstatusinfo, unsignedlong dwstatusinfolength);String sMsg, cBuffer
ULong dwRead

cBuffer = Space(dwStatusInfoLength)

Choose Case dwInternetStatus
	Case INTERNET_STATUS_RESOLVING_NAME
		MoveMemory(cBuffer, lpvStatusInfo, dwStatusInfoLength)
		sMsg = "Looking up the IP address for " + StripNull(cBuffer)
		w_ftpupdate.FloodShowConnectAction(sMsg)

	Case INTERNET_STATUS_NAME_RESOLVED
		MoveMemory(cBuffer, lpvStatusInfo, dwStatusInfoLength)
		sMsg = "Name resolved " + StripNull(cBuffer)
		w_ftpupdate.FloodShowConnectAction(sMsg)

	Case INTERNET_STATUS_CONNECTING_TO_SERVER
		MoveMemory(cBuffer, lpvStatusInfo, dwStatusInfoLength)
		sMsg = "Connecting to server..." + StripNull(cBuffer)
		w_ftpupdate.FloodShowConnectAction(sMsg)

	Case INTERNET_STATUS_CONNECTED_TO_SERVER
		sMsg = "Connected to server."
		MoveMemory(cBuffer, lpvStatusInfo, dwStatusInfoLength)
		sMsg = "Connected to " + StripNull(cBuffer)
		w_ftpupdate.FloodShowConnectAction(sMsg)

	Case INTERNET_STATUS_SENDING_REQUEST
	
		MoveMemory(dwRead, lpvStatusInfo, dwStatusInfoLength)
		
		pub_BytesSent += dwRead

		If CurrentState = FTP_UPLOADING Or CurrentState = FTP_DOWNLOADING Then
			
			  //show the percent complete
				w_ftpupdate.FloodUpdateTextPC(dwCurrentFileSize, &
														pub_BytesSent)

		End If
		
	Case INTERNET_STATUS_REQUEST_SENT
		MoveMemory(dwRead, lpvStatusInfo, dwStatusInfoLength)
		sMsg = "Request sent: " + String(dwRead) + " bytes"
		pub_BytesSent += dwRead
	
	Case INTERNET_STATUS_RESPONSE_RECEIVED
		MoveMemory(dwRead, lpvStatusInfo, dwStatusInfoLength)
		pub_BytesRecieved += Real(dwRead)
		
		If CurrentState = FTP_DOWNLOADING Then

			  //show the percent complete
				w_ftpupdate.FloodUpdateTextPC(dwCurrentFileSize, &
														pub_BytesRecieved)

		End If
		
	Case INTERNET_STATUS_RECEIVING_RESPONSE
	Case INTERNET_STATUS_CTL_RESPONSE_RECEIVED
	Case INTERNET_STATUS_PREFETCH
	Case INTERNET_STATUS_CLOSING_CONNECTION
		sMsg = "Closing connection"
		w_ftpupdate.FloodShowConnectAction(sMsg)
	
	Case INTERNET_STATUS_CONNECTION_CLOSED
		sMsg = "Connection closed"
		w_ftpupdate.FloodShowConnectAction(sMsg)
		
	Case INTERNET_STATUS_HANDLE_CREATED
		MoveMemory(dwRead, lpvStatusInfo, dwStatusInfoLength)
		sMsg = "Handle created: " + String(dwRead)
		w_ftpupdate.FloodShowConnectAction(sMsg)

	Case INTERNET_STATUS_HANDLE_CLOSING
		sMsg = "Handle closed"
		
		If CurrentState = FTP_DOWNLOADING Then
			sMsg = "Download complete. " + sMsg
			CurrentState = FTP_WAIT
		End If
		
		If CurrentState = FTP_UPLOADING Then
			sMsg = "Upload complete. " + sMsg
			CurrentState = FTP_WAIT
		End If
		
	Case INTERNET_STATUS_DETECTING_PROXY
		sMsg = "Detecting proxy"
		w_ftpupdate.FloodShowConnectAction(sMsg)
		
	Case INTERNET_STATUS_REQUEST_COMPLETE
		sMsg = "Request completed"
		w_ftpupdate.FloodShowConnectAction(sMsg)

	Case INTERNET_STATUS_REDIRECT
		MoveMemory(cBuffer, lpvStatusInfo, dwStatusInfoLength)
		sMsg = "HTTP request redirected to " + StripNull(cBuffer)
		w_ftpupdate.FloodShowConnectAction(sMsg)

	Case INTERNET_STATUS_INTERMEDIATE_RESPONSE
		sMsg = "Received intermediate status message from the server."
		w_ftpupdate.st_status.Text = sMsg

	Case INTERNET_STATUS_STATE_CHANGE
	  //Moved between a secure and a non-secure site.
		MoveMemory(dwRead, lpvStatusInfo, dwStatusInfoLength)
	
		Choose Case dwRead
			Case INTERNET_STATE_CONNECTED
				sMsg = "Connected state moved between secure and nonsecure site"
			
			Case INTERNET_STATE_DISCONNECTED
				sMsg = "Disconnected from network."
				w_ftpupdate.FloodShowConnectAction(sMsg)
			
			Case INTERNET_STATE_DISCONNECTED_BY_USER
				sMsg = "Disconnected by user request."
				w_ftpupdate.FloodShowConnectAction(sMsg)
	
			Case INTERNET_STATE_IDLE
				sMsg = "No network requests are being made (by Wininet)."
			
			Case INTERNET_STATE_BUSY
				sMsg = "Network requests are being made (by Wininet)."
							
			Case INTERNET_STATUS_USER_INPUT_REQUIRED
				sMsg = "The request requires user input to complete."
				
		End Choose
		
		w_ftpupdate.st_status.Text = sMsg

End Choose

  //upload and download messages are set
  //above as required. This handles the other cases.
//   If CurrentState <> FTP_UPLOADING And &
//      CurrentState <> FTP_DOWNLOADING Then
//      UpdateList(sMsg)
//   End If

end subroutine

public function boolean ftpfiledownload (string sremotefile, string snewlocalfile, win32_find_data wfd, unsignedlong bfailifexists);//Show the wait cursor
SetPointer(Hourglass!)

//Only if a valid connection...
If hConnection <> 0 Then

	//dwCurrentFileSize is used in the
	//callback and progress routine
	dwCurrentFileSize = FtpFileGetFileSize(WFD)
	
	//create the progress window passing the
	//upload file size, and a message to display
//	w_ftpupdate.FloodDisplay(dwCurrentFileSize, &
//									 "Downloading " + sRemoteFile + &
//									 " to " + sNewLocalFile)
	
	//this is the key ... set the current
	//FTP state to downloading
	CurrentState = FTP_DOWNLOADING
	
	//download the file
	If FtpGetFile(hConnection, &
					  sRemoteFile, &
					  sNewLocalFile, &
					  bFailIfExists, &
					  FILE_ATTRIBUTE_ARCHIVE, &
					  FTP_TRANSFER_TYPE_UNKNOWN, &
					  1) <> 0 Then
		
		//show the success message
		Return True

	Else
	
		//set the error message and return
		FtpErrorMessage = GetECode(GetLastError())
		Return False
	
	End If  //If FtpGetFile
End If //If hConnect


CurrentState = 0
SetPointer(Arrow!)

end function

public function unsignedlong getinternetconnecthandle ();//GetInternetConnectHandle obtains a new
//handle expressly for use with the
//FtpFindFirstFile and APIs.
//
//Care must be taken to close only the handle
//returned by this function once the listing
//of the directory has been obtained.
//
//A temporary variable is used here
//to reduce line length
If hSession <> 0 Then

  //Pass the same server as with other
  //calls, along with the requisite username
  //and password. The Microsoft FTP site
  //allows anonymous login, so the username
  //is 'anonymous' and the password is the
  //user's email address.

  //return the connection handle
	Return InternetConnect(hSession, &
								  is_servername, &
								  INTERNET_DEFAULT_FTP_PORT, &
								  is_ftpusername, &
								  is_ftppassword, &
								  INTERNET_SERVICE_FTP, &
								  INTERNET_FLAG_EXISTING_CONNECT, &
								  0)
								 
Else
	Return 0
End If

end function

public function boolean ulfichier (string fichier);String sNewRemoteFile, sRemoteFolder, sFolderArray[]
Integer i
ULong hFind, hFindConnect
WIN32_FIND_DATA WFD
Boolean succes = False, fReadOnly, fHidden, fSystem, fSubDir, fArchive

//change directory on server
FtpSetCurrentDirectory(hConnection, Left(fichier, LastPos(fichier, "\") - 1))

//build the necessary string.
sNewRemoteFile = sRemoteUploadPath + Rep(Mid(fichier, 4), "\", sSlash)

//sets the folders
sFolderArray = Split(Left(sNewRemoteFile, LastPos(sNewRemoteFile, sSlash) - 1), sSlash)

//assure the file is on the local machine
If FileExists(fichier) Then

	//add the item to the list
//	w_ftpupdate.lb_1.AddItem(Mid(fichier, LastPos(fichier, "\")) + "~t" + FormatFileSize(files.of_getFileSize(fichier)))
	//select it
//	w_ftpupdate.lb_1.SelectItem(w_ftpupdate.lb_1.TotalItems())

	//if the file doesn't exist already
	hFindConnect = GetInternetConnectHandle()
	hFind = FtpFindFirstFile(hFindConnect, &
									 AddNull(sNewRemoteFile), &
									 WFD, 0, 0)
//	w_ftpupdate.st_status.Text = GetECode(GetLastError())
	
	//if the FtpFindFirstFile call didn't locate the file
	//or if the file is different then upload
	If hFind <> 0 Then
		If files.of_getFileSize(fichier) = FtpFileGetFileSize(WFD) Then
			//clean up
			InternetCloseHandle(hFind)
			InternetCloseHandle(hFindConnect)
			Return True
		End If
	End If //If hFind
	
	//if the file isn't valid, don't upload it
	files.of_getFileAttributes(fichier, fReadOnly, fHidden, fSystem, fSubDir, fArchive)

	If files.of_getFileSize(fichier) = 0 Or fHidden Or fSystem Then
		//clean up
		InternetCloseHandle(hFind)
		InternetCloseHandle(hFindConnect)
		Return True
	End If

	//create the folder
	sRemoteFolder = ""
	For i = 1 To UpperBound(sFolderArray)
		sRemoteFolder += sSlash + sFolderArray[i]
		CreateFtpDirectory(hConnection, sRemoteFolder)
	Next
		
//	w_ftpupdate.st_status.Text = GetECode(GetLastError())

	succes = FtpFileUpload(fichier, sNewRemoteFile)

//	w_ftpupdate.FloodShowTransferResult(succes, sNewRemoteFile, files.of_getFileSize(fichier))

	//clean up
	InternetCloseHandle(hFind)
	InternetCloseHandle(hFindConnect)
End If //If fs.FileExists

Return succes

end function

public function boolean dlfichier (string fichier);String sNewLocalFile, sLocalFolder, sFolderArray[]
Integer i
ULong hFind, hFindConnect
WIN32_FIND_DATA WFD
Boolean succes = False

//change directory on server
FtpSetCurrentDirectory(hConnection, Left(fichier, LastPos(fichier, sSlash) - 1))

//get the directory contents
GetFtpDirectoryContents()

For i = 1 To w_ftpupdate.lb_1.TotalItems()
	If Pos(w_ftpupdate.lb_1.Text(i), Mid(fichier, LastPos(fichier, sSlash) + 1)) <> 0 Then
		//select the ith element in the list
		w_ftpupdate.lb_1.SelectItem(i)
	End If
Next

//build the necessary string.
If Left(fichier, 1) = "/" Then
	sNewLocalFile = sLocalDownloadPath + Rep(Mid(fichier, 2), "/", "\")
Else
	sNewLocalFile = sLocalDownloadPath + Rep(fichier, "/", "\")
End If

//sets the folders
sFolderArray = Split(Left(sNewLocalFile, LastPos(sNewLocalFile, "\") - 1), "\")

//assure the file is on the server and retrieving
//its info into a WIN32_FIND_DATA structure
hFindConnect = GetInternetConnectHandle()
hFind = FtpFindFirstFile(hFindConnect, &
								 AddNull(fichier), &
								 WFD, 0, 0)
w_ftpupdate.st_status.Text = GetECode(GetLastError())

//if the FtpFindFirstFile call located
//the file then download
If hFind <> 0 Then

	//if the file doesn't exist already or is different
	If FileExists(sNewLocalFile) Then
		If files.of_getFileSize(sNewLocalFile) = FtpFileGetFileSize(WFD) Then
			//clean up
			InternetCloseHandle(hFind)
			InternetCloseHandle(hFindConnect)
			Return True
		End If
	End If //If FileExists

	//create the folder
	sLocalFolder = sFolderArray[1]
	For i = 2 To UpperBound(sFolderArray)
		sLocalFolder = sLocalFolder + "\" + sFolderArray[i]
			
		If Not DirectoryExists(sLocalFolder) Then
			CreateDirectory(sLocalFolder)
		End If
	Next
	
	succes = FtpFileDownload(fichier, &
									 sNewLocalFile, &
									 WFD, &
									 0)

	w_ftpupdate.FloodShowTransferResult(succes, sNewLocalFile, files.of_getFileSize(sNewLocalFile))
End If //If hFind

//clean up
InternetCloseHandle(hFind)
InternetCloseHandle(hFindConnect)

Return succes

end function

public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password, string as_userid, string as_servername, unsignedlong al_port);String ls_null
ULong flags

If as_servername <> is_servername Then
	is_servername = as_servername
	InternetCloseHandle(hConnection)
	hConnection = 0
End If

If as_userid <> is_ftpusername Then
	is_ftpusername = as_userid
	InternetCloseHandle(hConnection)
	hConnection = 0
End If

If as_password <> is_ftppassword Then
	is_ftppassword = as_password
	InternetCloseHandle(hConnection)
	hConnection = 0
End If

If al_port <> il_ftpport Then
	il_ftpport = al_port
	InternetCloseHandle(hConnection)
	hConnection = 0
End If

sLocalDownloadPath = as_localdlpath
sRemoteUploadPath = as_remoteulpath

If hSession = 0 Then
	If InternetGetConnectedState(flags, 0) <> 0 Then
		setNull(ls_null)
		
		//Begin the FTP process by obtaining a
		//handle to an internet session. This
		//handle will be used in subsequent calls,
		//so its declared as a form-wide variable.
		hSession = InternetOpen("FTP Transfer", &
										 INTERNET_OPEN_TYPE_DIRECT, &
										 ls_null, &
										 ls_null, &
										 0)
	End If //If InternetGetConnectedState
End If //If hSession = 0
	
//If a handle was obtained, the next step is
//to obtain a connection handle that will be
//used for all operations except the FTP
//directory navigation. The MSDN states that
//the handle used by FtpFindFirstFile and subsequent
//file calls can not be reused for additional
//navigation or other operations.
If hSession <> 0 And hConnection = 0 Then

		//get a connection handle
		hConnection = InternetConnect(hSession, &
												is_servername, &
												il_ftpport, &
												is_ftpusername, &
												is_ftppassword, &
												INTERNET_SERVICE_FTP, &
												INTERNET_FLAG_EXISTING_CONNECT, &
												0)
End if //If hConnection = 0

Return hConnection
end function

public function unsignedlong of_connect (string as_remoteulpath, string as_localdlpath, string as_password, string as_userid, string as_servername);Return of_connect(as_remoteulpath, as_localdlpath, as_password, as_userid, as_servername, il_ftpport)

end function

public subroutine ftpfiledelete ();
end subroutine

public function boolean ftpfiledelete (string sfilename);//Show the wait cursor
SetPointer(Hourglass!)

//Only if a valid connection...
If hConnection <> 0 Then

	//this is the key ... set the current
	//FTP state to downloading
	CurrentState = FTP_DELETINGFILE
	
	//delete the file
	If FtpDeleteFile(hConnection, sFileName) <> 0 Then
		
		//show the success message
		Return True

	Else
	
		//set the error message and return
		FtpErrorMessage = GetECode(GetLastError())
		Return False
	
	End If  //If FtpGetFile
End If //If hConnect


CurrentState = 0
SetPointer(Arrow!)
end function

public subroutine ftpfilegetdirectorycontents (string snewlocalfile, ref string is_filename[]);Long hFind, hFindConnect, li_pos = 0
String sPath, sPathOnly, sFileName
WIN32_FIND_DATA WFD

//Show the wait cursor
SetPointer(Hourglass!)

//Obtain the current FTP path
sPathOnly = GetFtpDirectory(hConnection)

//The search parameters .. here we'll list
//all file types. Since GetFTPDirectory takes
//care of qualifying the path, no terminating
//slash is required.
sPath = sPathOnly + "*.*"
	
//Connection handles used by the FtpFindFirstFile
//API go out of scope once the all files are
//listed, therefore it can not be reused.
//This restriction is handled by obtaining
//a fresh connection handle each time a call
//to FtpFindFirstFile is required, and releasing
//it once finished.
hFindConnect = GetInternetConnectHandle()

//If a good connection handle ...
If hFindConnect <> 0 Then

	//..obtain the handle to the files with
	//the FtpFindFirstFile API. Obtaining the
	//directory contents is essentially similar
	//to using the Win32 file system APIs
	//FindFirstFile and FindNextFile, with the
	//sole exception that there is no FtpFindNextFile
	//API. Instead, successive calls are made
	//to InternetFindNextFile. The data returned
	//is in the familiar WIN32_FIND_DATA structure.
	hFind = FtpFindFirstFile(hFindConnect, &
									 sPath, WFD, &
									 INTERNET_FLAG_RELOAD + &
									 INTERNET_FLAG_NO_CACHE_WRITE, &
									 0)

	//If a valid find handle returned,
	//loop through the directory listing
	//the contents. If the attributes of
	//the returned string indicate a folder,
	//append a slash to make it both visually
	//stand out in the list, and identifiable
	//in the list double-click routine for
	//navigation.
	//
	//hFile will be 0 if the navigated-to
	//folder is empty.
	If hFind <> 0 Then

		Do
			//if a folder
			If num.of_bitwiseand(WFD.dwFileAttributes, FILE_ATTRIBUTE_DIRECTORY) <> 0 Then
			
			Else
				
				sFileName = WFD.cfilename
	//			if Right( sFileName, 4 ) = '.enc' or Right( sFileName, 4 ) = '.err' then
					li_pos++
					is_filename[li_pos] = sFileName
					ftpfiledownload(sPathOnly + sFileName,snewlocalfile + sFileName,WFD,0)
	//			end if
			End If  //If WFD.dwFileAttributes

		//continue while valid
		Loop While InternetFindNextFile(hFind, WFD) <> 0

	End If //If hFind

End If  //If hFindConnect

//clean up by closing the handles used in this routine
InternetCloseHandle(hFind)
InternetCloseHandle(hFindConnect)

SetPointer(Arrow!)

end subroutine

on u_ftp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_ftp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;files = create pfc_n_cst_filesrvwin32
end event

event destructor;destroy files
end event

