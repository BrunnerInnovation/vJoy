REM Automate the creation of an SDK package
set SDK_PATH=SDK
set X64RELEASE_PATH=X64\Release
set X86RELEASE_PATH=Win32\Release
set INC_PATH=Inc

REM C#
signtool sign /fd SHA256 /f "I:\Work\Int\Code Signing Certificate\EntrustCertificate.crt" /t "http://timestamp.comodoca.com/authenticode" %X86RELEASE_PATH%\vJoyInterface.dll
COPY %X86RELEASE_PATH%\vJoyInterface.dll "%SDK_PATH%\c#\x86\vJoyInterface.dll"
signtool sign /fd SHA256 /f "I:\Work\Int\Code Signing Certificate\EntrustCertificate.crt" /t "http://timestamp.comodoca.com/authenticode" %X86RELEASE_PATH%\vJoyInterfaceWrap.dll
COPY %X86RELEASE_PATH%\vJoyInterfaceWrap.dll "%SDK_PATH%\c#\x86\vJoyInterfaceWrap.dll"
signtool sign /fd SHA256 /f "I:\Work\Int\Code Signing Certificate\EntrustCertificate.crt" /t "http://timestamp.comodoca.com/authenticode" %X64RELEASE_PATH%\vJoyInterface.dll
COPY %X64RELEASE_PATH%\vJoyInterface.dll "%SDK_PATH%\c#\x64\vJoyInterface.dll"
signtool sign /fd SHA256 /f "I:\Work\Int\Code Signing Certificate\EntrustCertificate.crt" /t "http://timestamp.comodoca.com/authenticode" %X64RELEASE_PATH%\vJoyInterfaceWrap.dll
COPY %X64RELEASE_PATH%\vJoyInterfaceWrap.dll "%SDK_PATH%\c#\x64\vJoyInterfaceWrap.dll"

REM Include Files
COPY %INC_PATH%\public.h "%SDK_PATH%\Inc\public.h"
COPY %INC_PATH%\gen-versioninfo.h "%SDK_PATH%\Inc\gen-versioninfo.h"
COPY apps\common\vJoyInterface\vjoyinterface.h "%SDK_PATH%\Inc\vjoyinterface.h"

REM Library Files
COPY %X86RELEASE_PATH%\vJoyInterface.dll "%SDK_PATH%\LIB\x86\vJoyInterface.dll"
COPY %X86RELEASE_PATH%\vJoyInterface.lib "%SDK_PATH%\LIB\x86\vJoyInterface.lib"
COPY %X64RELEASE_PATH%\vJoyInterface.dll "%SDK_PATH%\LIB\x64\vJoyInterface.dll"
COPY %X64RELEASE_PATH%\vJoyInterface.lib "%SDK_PATH%\LIB\x64\vJoyInterface.lib"
