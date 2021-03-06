#Region
	#AutoIt3Wrapper_UseUpx=y
#EndRegion
Global Const $str_nocasesense = 0
Global Const $str_casesense = 1
Global Const $str_nocasesensebasic = 2
Global Const $str_stripleading = 1
Global Const $str_striptrailing = 2
Global Const $str_stripspaces = 4
Global Const $str_stripall = 8
Global Const $str_chrsplit = 0
Global Const $str_entiresplit = 1
Global Const $str_nocount = 2
Global Const $str_regexpmatch = 0
Global Const $str_regexparraymatch = 1
Global Const $str_regexparrayfullmatch = 2
Global Const $str_regexparrayglobalmatch = 3
Global Const $str_regexparrayglobalfullmatch = 4
Global Const $str_endisstart = 0
Global Const $str_endnotstart = 1
Global Const $sb_ansi = 1
Global Const $sb_utf16le = 2
Global Const $sb_utf16be = 3
Global Const $sb_utf8 = 4
Global Const $se_utf16 = 0
Global Const $se_ansi = 1
Global Const $se_utf8 = 2
Global Const $str_utf16 = 0
Global Const $str_ucs2 = 1

Func _hextostring($shex)
	If NOT (StringLeft($shex, 2) == "0x") Then $shex = "0x" & $shex
	Return BinaryToString($shex, $sb_utf8)
EndFunc

Func _stringbetween($sstring, $sstart, $send, $imode = $str_endisstart, $bcase = False)
	$sstart = $sstart ? "\Q" & $sstart & "\E" : "\A"
	If $imode <> $str_endnotstart Then $imode = $str_endisstart
	If $imode = $str_endisstart Then
		$send = $send ? "(?=\Q" & $send & "\E)" : "\z"
	Else
		$send = $send ? "\Q" & $send & "\E" : "\z"
	EndIf
	If $bcase = Default Then
		$bcase = False
	EndIf
	Local $areturn = StringRegExp($sstring, "(?s" & (NOT $bcase ? "i" : "") & ")" & $sstart & "(.*?)" & $send, $str_regexparrayglobalmatch)
	If @error Then Return SetError(1, 0, 0)
	Return $areturn
EndFunc

Func _stringexplode($sstring, $sdelimiter, $ilimit = 0)
	If $ilimit = Default Then $ilimit = 0
	If $ilimit > 0 Then
		Local Const $null = Chr(0)
		$sstring = StringReplace($sstring, $sdelimiter, $null, $ilimit)
		$sdelimiter = $null
	ElseIf $ilimit < 0 Then
		Local $iindex = StringInStr($sstring, $sdelimiter, $str_nocasesensebasic, $ilimit)
		If $iindex Then
			$sstring = StringLeft($sstring, $iindex - 1)
		EndIf
	EndIf
	Return StringSplit($sstring, $sdelimiter, BitOR($str_entiresplit, $str_nocount))
EndFunc

Func _stringinsert($sstring, $sinsertion, $iposition)
	Local $ilength = StringLen($sstring)
	$iposition = Int($iposition)
	If $iposition < 0 Then $iposition = $ilength + $iposition
	If $ilength < $iposition OR $iposition < 0 Then Return SetError(1, 0, $sstring)
	Return StringLeft($sstring, $iposition) & $sinsertion & StringRight($sstring, $ilength - $iposition)
EndFunc

Func _stringproper($sstring)
	Local $bcapnext = True, $schr = "", $sreturn = ""
	For $i = 1 To StringLen($sstring)
		$schr = StringMid($sstring, $i, 1)
		Select 
			Case $bcapnext = True
				If StringRegExp($schr, "[a-zA-ZÀ-ÿšœžŸ]") Then
					$schr = StringUpper($schr)
					$bcapnext = False
				EndIf
			Case NOT StringRegExp($schr, "[a-zA-ZÀ-ÿšœžŸ]")
				$bcapnext = True
			Case Else
				$schr = StringLower($schr)
		EndSelect
		$sreturn &= $schr
	Next
	Return $sreturn
EndFunc

Func _stringrepeat($sstring, $irepeatcount)
	$irepeatcount = Int($irepeatcount)
	If $irepeatcount = 0 Then Return ""
	If StringLen($sstring) < 1 OR $irepeatcount < 0 Then Return SetError(1, 0, "")
	Local $sresult = ""
	While $irepeatcount > 1
		If BitAND($irepeatcount, 1) Then $sresult &= $sstring
		$sstring &= $sstring
		$irepeatcount = BitShift($irepeatcount, 1)
	WEnd
	Return $sstring & $sresult
EndFunc

Func _stringtitlecase($sstring)
	Local $bcapnext = True, $schr = "", $sreturn = ""
	For $i = 1 To StringLen($sstring)
		$schr = StringMid($sstring, $i, 1)
		Select 
			Case $bcapnext = True
				If StringRegExp($schr, "[a-zA-Z\xC0-\xFF0-9]") Then
					$schr = StringUpper($schr)
					$bcapnext = False
				EndIf
			Case NOT StringRegExp($schr, "[a-zA-Z\xC0-\xFF'0-9]")
				$bcapnext = True
			Case Else
				$schr = StringLower($schr)
		EndSelect
		$sreturn &= $schr
	Next
	Return $sreturn
EndFunc

Func _stringtohex($sstring)
	Return Hex(StringToBinary($sstring, $sb_utf8))
EndFunc

#OnAutoItStartRegister "AREIHNVAPWN"
Global $os

Func initBitmap($flmojocqtz, $fljzkjrgzs, $flsgxlqjno)
	Local $flfzxxyxzg[2]
	$flfzxxyxzg[0] = DllStructCreate(toStr("struct;uint bfSize;uint bfReserved;uint bfOffBits;uint biSize;int biWidth;int biHeight;ushort biPlanes;ushort biBitCount;uint biCompression;uint biSizeImage;int biXPelsPerMeter;int biYPelsPerMeter;uint biClrUsed;uint biClrImportant;endstruct;"))
	DllStructSetData($flfzxxyxzg[0], toStr("bfSize"), (3 * $flmojocqtz + Mod($flmojocqtz, 4) * Abs($fljzkjrgzs)))
	DllStructSetData($flfzxxyxzg[0], toStr("bfReserved"), 0)
	DllStructSetData($flfzxxyxzg[0], toStr("bfOffBits"), 54)
	DllStructSetData($flfzxxyxzg[0], toStr("biSize"), 40)
	DllStructSetData($flfzxxyxzg[0], toStr("biWidth"), $flmojocqtz)
	DllStructSetData($flfzxxyxzg[0], toStr("biHeight"), $fljzkjrgzs)
	DllStructSetData($flfzxxyxzg[0], toStr("biPlanes"), 1)
	DllStructSetData($flfzxxyxzg[0], toStr("biBitCount"), 24)
	DllStructSetData($flfzxxyxzg[0], toStr("biCompression"), 0)
	DllStructSetData($flfzxxyxzg[0], toStr("biSizeImage"), 0)
	DllStructSetData($flfzxxyxzg[0], toStr("biXPelsPerMeter"), 0)
	DllStructSetData($flfzxxyxzg[0], toStr("biYPelsPerMeter"), 0)
	DllStructSetData($flfzxxyxzg[0], toStr("biClrUsed"), 0)
	DllStructSetData($flfzxxyxzg[0], toStr("biClrImportant"), 0)
	$flfzxxyxzg[1] = DllStructCreate(toStr("struct;") & _stringrepeat(toStr("byte[") & DllStructGetData($flfzxxyxzg[0], toStr("biWidth")) * 3 & toStr("];"), DllStructGetData($flfzxxyxzg[0], toStr("biHeight"))) & toStr("endstruct"))
	Return $flfzxxyxzg
EndFunc

Func getRandomNum($flyoojibbo, $fltyapmigo)
	Local $fldknagjpd = toStr("")
	For $flezmzowno = 0 To Random($flyoojibbo, $fltyapmigo, 1)
		$fldknagjpd &= Chr(Random(97, 122, 1))
	Next
	Return $fldknagjpd
EndFunc

Func installRandomFileName($flslbknofv)
	Local $flxgrwiiel = getRandomNum(15, 20)
	Switch $flslbknofv
		Case 10 To 15
			$flxgrwiiel &= toStr(".bmp")
			FileInstall(".\sprite.bmp", @ScriptDir & toStr("\") & $flxgrwiiel)
		Case 25 To 30
			$flxgrwiiel &= toStr(".dll")
			FileInstall(".\qr_encoder.dll", @ScriptDir & toStr("\") & $flxgrwiiel)
	EndSwitch
	Return $flxgrwiiel
EndFunc

Func GetComputerNameAFunc()
	Local $flfnvbvvfi = -1
	Local $flfnvbvvfiraw = DllStructCreate(toStr("struct;dword;char[1024];endstruct"))
	DllStructSetData($flfnvbvvfiraw, 1, 1024)
	Local $flmyeulrox = DllCall(toStr("kernel32.dll"), toStr("int"), toStr("GetComputerNameA"), toStr("ptr"), DllStructGetPtr($flfnvbvvfiraw, 2), toStr("ptr"), DllStructGetPtr($flfnvbvvfiraw, 1))
	If $flmyeulrox[0] <> 0 Then
		$flfnvbvvfi = BinaryMid(DllStructGetData($flfnvbvvfiraw, 2), 1, DllStructGetData($flfnvbvvfiraw, 1))
	EndIf
	Return $flfnvbvvfi
EndFunc

GUICreate(toStr("CodeIt Plus!"), 300, 375, -1, -1)

Func modifyComputerNameStruct(ByRef $i_ComputerNameStruct)
	Local $bmpFileName = installRandomFileName(14)
	Local $fileHandle = CreateFileWriteFunc($bmpFileName)
	If $fileHandle <> -1 Then
		Local $bmpFileSize = GetFileSizeFunc($fileHandle)
		If $bmpFileSize <> -1 AND DllStructGetSize($i_ComputerNameStruct) < $bmpFileSize - 54 Then
			Local $fileContent = DllStructCreate(toStr("struct;byte[") & $bmpFileSize & toStr("];endstruct"))
			Local $flskuanqbg = ReadFileFunc($fileHandle, $fileContent)
			If $flskuanqbg <> -1 Then
				Local $bmpStruct = DllStructCreate(toStr("struct;byte[54];byte[") & $bmpFileSize - 54 & toStr("];endstruct"), DllStructGetPtr($fileContent))
				Local $count = 1
				Local $newComputerName = toStr("")
				For $i = 1 To DllStructGetSize($i_ComputerNameStruct)
					Local $number = Number(DllStructGetData($i_ComputerNameStruct, 1, $i))
					For $j = 6 To 0 Step -1
						$number += BitShift(BitAND(Number(DllStructGetData($bmpStruct, 2, $count)), 1), -1 * $j)
						$count += 1
					Next
					$newComputerName &= Chr(BitShift($number, 1) + BitShift(BitAND($number, 1), -7))
				Next
				DllStructSetData($i_ComputerNameStruct, 1, $newComputerName)
			EndIf
		EndIf
		CloseHandleFunc($fileHandle)
	EndIf
	DeleteFileAFunc($bmpFileName)
EndFunc

Func cryptoFunc(ByRef $i_QRStruct)
	Local $computerNameHex = GetComputerNameAFunc()
	If $computerNameHex <> -1 Then
	    ; computerNameHex = 0x657669617461722D6C61702D31
		$computerNameHex = Binary(StringLower(BinaryToString($computerNameHex))) 
		Local $computerNameStrraw = DllStructCreate(toStr("struct;byte[") & BinaryLen($computerNameHex) & toStr("];endstruct"))
		DllStructSetData($computerNameStrraw, 1, $computerNameHex)
		modifyComputerNameStruct($computerNameStrraw)
		Local $flnttmjfea = DllStructCreate(toStr("struct;ptr;ptr;dword;byte[32];endstruct"))
		DllStructSetData($flnttmjfea, 3, 32)
		; DllStructGetPtr($flnttmjfea, 1) -> handle to CSP
		; DllStructGetPtr($flnttmjfea, 3) -> size 32
		Local $fluzytjacb = DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptAcquireContextA"), toStr("ptr"), DllStructGetPtr($flnttmjfea, 1), toStr("ptr"), 0, toStr("ptr"), 0, toStr("dword"), 24, toStr("dword"), 4026531840)
		If $fluzytjacb[0] <> 0 Then
			; DllStructGetPtr($flnttmjfea, 2) -> phHash, The address to which the function copies a handle to the new hash object
			; Algo ID: CALG_SHA_256  0x0000800c, 256 bit SHA hashing algorithm
			$fluzytjacb = DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptCreateHash"), toStr("ptr"), DllStructGetData($flnttmjfea, 1), toStr("dword"), 32780, toStr("dword"), 0, toStr("dword"), 0, toStr("ptr"), DllStructGetPtr($flnttmjfea, 2))
			If $fluzytjacb[0] <> 0 Then
			; The CryptHashData function adds data to a specified hash object.
			;BOOL CryptHashData(
				  ;HCRYPTHASH hHash, ($flnttmjfea, 2)
				  ;const BYTE *pbData, $computerNameStrraw - A pointer to a buffer that contains the data to be added to the hash object
				  ;DWORD      dwDataLen,
				  ;DWORD      dwFlags
			;   );
				$fluzytjacb = DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptHashData"), toStr("ptr"), DllStructGetData($flnttmjfea, 2), toStr("struct*"), $computerNameStrraw, toStr("dword"), DllStructGetSize($computerNameStrraw), toStr("dword"), 0)
				If $fluzytjacb[0] <> 0 Then
				; CryptGetHashParam  function retrieves data that governs the operations of a hash object. The actual hash value can be retrieved by using this function.
				;BOOL CryptGetHashParam(
					  ;HCRYPTHASH hHash,  ($flnttmjfea, 2) - Handle of the hash object to be queried.
					  ;DWORD      dwParam,
					  ;BYTE       *pbData,    ($flnttmjfea, 4) - A pointer to a buffer that receives the specified value data
					  ;DWORD      *pdwDataLen, $flnttmjfea, 3)
					  ;DWORD      dwFlags
				;   );
					$fluzytjacb = DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptGetHashParam"), toStr("ptr"), DllStructGetData($flnttmjfea, 2), toStr("dword"), 2, toStr("ptr"), DllStructGetPtr($flnttmjfea, 4), toStr("ptr"), DllStructGetPtr($flnttmjfea, 3), toStr("dword"), 0)
					If $fluzytjacb[0] <> 0 Then
						Local $binKeyData = Binary(toStr("0x") & toStr("08020") & toStr("00010") & toStr("66000") & toStr("02000") & toStr("0000")) & DllStructGetData($flnttmjfea, 4)
						Local $binData = Binary(toStr("0x") & toStr("CD4B3") & toStr("2C650") & toStr("CF21B") & toStr("DA184") & toStr("D8913") & toStr("E6F92") & toStr("0A37A") & toStr("4F396") & toStr("3736C") & toStr("042C4") & toStr("59EA0") & toStr("7B79E") & toStr("A443F") & toStr("FD189") & toStr("8BAE4") & toStr("9B115") & toStr("F6CB1") & toStr("E2A7C") & toStr("1AB3C") & toStr("4C256") & toStr("12A51") & toStr("9035F") & toStr("18FB3") & toStr("B1752") & toStr("8B3AE") & toStr("CAF3D") & toStr("480E9") & toStr("8BF8A") & toStr("635DA") & toStr("F974E") & toStr("00135") & toStr("35D23") & toStr("1E4B7") & toStr("5B2C3") & toStr("8B804") & toStr("C7AE4") & toStr("D266A") & toStr("37B36") & toStr("F2C55") & toStr("5BF3A") & toStr("9EA6A") & toStr("58BC8") & toStr("F906C") & toStr("C665E") & toStr("AE2CE") & toStr("60F2C") & toStr("DE38F") & toStr("D3026") & toStr("9CC4C") & toStr("E5BB0") & toStr("90472") & toStr("FF9BD") & toStr("26F91") & toStr("19B8C") & toStr("484FE") & toStr("69EB9") & toStr("34F43") & toStr("FEEDE") & toStr("DCEBA") & toStr("79146") & toStr("0819F") & toStr("B21F1") & toStr("0F832") & toStr("B2A5D") & toStr("4D772") & toStr("DB12C") & toStr("3BED9") & toStr("47F6F") & toStr("706AE") & toStr("4411A") & toStr("52"))
						Local $fluelrpeax = DllStructCreate(toStr("struct;ptr;ptr;dword;byte[8192];byte[") & BinaryLen($binKeyData) & toStr("];dword;endstruct"))
						DllStructSetData($fluelrpeax, 3, BinaryLen($binData))
						DllStructSetData($fluelrpeax, 4, $binData)
						DllStructSetData($fluelrpeax, 5, $binKeyData)
						DllStructSetData($fluelrpeax, 6, BinaryLen($binKeyData))
						Local $fluzytjacb = DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptAcquireContextA"), toStr("ptr"), DllStructGetPtr($fluelrpeax, 1), toStr("ptr"), 0, toStr("ptr"), 0, toStr("dword"), 24, toStr("dword"), 4026531840)
						If $fluzytjacb[0] <> 0 Then
						; BOOL CryptImportKey(
							  ;HCRYPTPROV hProv,    - The handle of a CSP obtained with the
							  ;const BYTE *pbData,  - DllStructGetPtr($fluelrpeax, 5) - A BYTE array that contains a PUBLICKEYSTRUC BLOB header followed by the encrypted key.
							  ;DWORD      dwDataLen, - DllStructGetPtr($fluelrpeax, 6) 
							  ;HCRYPTKEY  hPubKey,   - 0 A handle to the cryptographic key that decrypts the key stored in pbData
							  ;DWORD      dwFlags,   - 0
							  ;HCRYPTKEY  *phKey    - DllStructGetPtr($fluelrpeax, 2) A pointer to a HCRYPTKEY value that receives the handle of the imported key
						;   );
							$fluzytjacb = DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptImportKey"), toStr("ptr"), DllStructGetData($fluelrpeax, 1), toStr("ptr"), DllStructGetPtr($fluelrpeax, 5), toStr("dword"), DllStructGetData($fluelrpeax, 6), toStr("dword"), 0, toStr("dword"), 0, toStr("ptr"), DllStructGetPtr($fluelrpeax, 2))
							If $fluzytjacb[0] <> 0 Then
							;($fluelrpeax, 2) -> key for decrypt, no hash, ($fluelrpeax, 4) -> pbData  - A pointer to a buffer that contains the data to be decrypted
			;				BOOL CryptDecrypt(
								  ;HCRYPTKEY  hKey, ($fluelrpeax, 2) - A handle to the key to use for the decryption
								  ;HCRYPTHASH hHash, 0
								  ;BOOL       Final, 1
								  ;DWORD      dwFlags, 0
								  ;BYTE       *pbData,    ($fluelrpeax, 4) - A pointer to a buffer that contains the data to be decrypted
								  ;DWORD      *pdwDataLen ($fluelrpeax, 3) - len
							;   );
								$fluzytjacb = DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptDecrypt"), toStr("ptr"), DllStructGetData($fluelrpeax, 2), toStr("dword"), 0, toStr("dword"), 1, toStr("dword"), 0, toStr("ptr"), DllStructGetPtr($fluelrpeax, 4), toStr("ptr"), DllStructGetPtr($fluelrpeax, 3))
								If $fluzytjacb[0] <> 0 Then
									Local $flsekbkmru = BinaryMid(DllStructGetData($fluelrpeax, 4), 1, DllStructGetData($fluelrpeax, 3))
									$flareBinaryString = Binary(toStr("FLARE")) ; 0x464c415245
									$flareReversedBinaryString = Binary(toStr("ERALF")) ; 0x4552414c46
									$flgggftges = BinaryMid($flsekbkmru, 1, BinaryLen($flareBinaryString)) ; 0xCD4B32C650
									$flnmiatrft = BinaryMid($flsekbkmru, BinaryLen($flsekbkmru) - BinaryLen($flareReversedBinaryString) + 1, BinaryLen($flareReversedBinaryString)) ; 0x6AE4411A52
									If $flareBinaryString = $flgggftges AND $flareReversedBinaryString = $flnmiatrft Then
										DllStructSetData($i_QRStruct, 1, BinaryMid($flsekbkmru, 6, 4))
										DllStructSetData($i_QRStruct, 2, BinaryMid($flsekbkmru, 10, 4))
										DllStructSetData($i_QRStruct, 3, BinaryMid($flsekbkmru, 14, BinaryLen($flsekbkmru) - 18))
									EndIf
								EndIf
								DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptDestroyKey"), toStr("ptr"), DllStructGetData($fluelrpeax, 2))
							EndIf
							DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptReleaseContext"), toStr("ptr"), DllStructGetData($fluelrpeax, 1), toStr("dword"), 0)
						EndIf
					EndIf
				EndIf
				DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptDestroyHash"), toStr("ptr"), DllStructGetData($flnttmjfea, 2))
			EndIf
			DllCall(toStr("advapi32.dll"), toStr("int"), toStr("CryptReleaseContext"), toStr("ptr"), DllStructGetData($flnttmjfea, 1), toStr("dword"), 0)
		EndIf
	EndIf
EndFunc

Func arepfnkwypw()
	Local $flgqbtjbmi = -1
	Local $fltpvjccvq = DllStructCreate(toStr("struct;dword;dword;dword;dword;dword;byte[128];endstruct"))
	DllStructSetData($fltpvjccvq, 1, DllStructGetSize($fltpvjccvq))
	Local $flaghdvgyv = DllCall(toStr("kernel32.dll"), toStr("int"), toStr("GetVersionExA"), toStr("struct*"), $fltpvjccvq)
	If $flaghdvgyv[0] <> 0 Then
		If DllStructGetData($fltpvjccvq, 2) = 6 Then
			If DllStructGetData($fltpvjccvq, 3) = 1 Then
				$flgqbtjbmi = 0
			EndIf
		EndIf
	EndIf
	Return $flgqbtjbmi
EndFunc

Func main()
	Local $inputCodeMsg = GUICtrlCreateInput(toStr("Enter text to encode"), -1, 5, 300)
	Local $flkhwwzgne = GUICtrlCreateButton(toStr("Can haz code?"), -1, 30, 300)
	Local $fluhtsijxf = GUICtrlCreatePic(toStr(""), -1, 55, 300, 300)
	Local $flxeuaihlc = GUICtrlCreateMenu(toStr("Help"))
	Local $flxeuaihlcitem = GUICtrlCreateMenuItem(toStr("About CodeIt Plus!"), $flxeuaihlc)
	Local $flpnltlqhh = installRandomFileName(13)
	GUICtrlSetImage($fluhtsijxf, $flpnltlqhh)
	DeleteFileAFunc($flpnltlqhh)
	GUISetState(@SW_SHOW)
	While 1
		Switch GUIGetMsg()
			Case $flkhwwzgne
				Local $inputText = GUICtrlRead($inputCodeMsg)
				If $inputText Then
					Local $qrDllFunc1 = installRandomFileName(26)
					Local $QRStruct = DllStructCreate(toStr("struct;dword;dword;byte[3918];endstruct"))
					Local $fljfojrihf = DllCall($qrDllFunc1, toStr("int:cdecl"), toStr("justGenerateQRSymbol"), toStr("struct*"), $QRStruct, toStr("str"), $inputText)
					If $fljfojrihf[0] <> 0 Then
						cryptoFunc($QRStruct)
						Local $flbvokdxkg = initBitmap((DllStructGetData($QRStruct, 1) * DllStructGetData($QRStruct, 2)), (DllStructGetData($QRStruct, 1) * DllStructGetData($QRStruct, 2)), 1024)
						$fljfojrihf = DllCall($qrDllFunc1, toStr("int:cdecl"), toStr("justConvertQRSymbolToBitmapPixels"), toStr("struct*"), $QRStruct, toStr("struct*"), $flbvokdxkg[1])
						If $fljfojrihf[0] <> 0 Then
							$flpnltlqhh = getRandomNum(25, 30) & toStr(".bmp")
							arelassehha($flbvokdxkg, $flpnltlqhh)
						EndIf
					EndIf
					DeleteFileAFunc($qrDllFunc1)
				Else
					$flpnltlqhh = installRandomFileName(11)
				EndIf
				GUICtrlSetImage($fluhtsijxf, $flpnltlqhh)
				DeleteFileAFunc($flpnltlqhh)
			Case $flxeuaihlcitem
				Local $flomtrkawp = toStr("This program generates QR codes using QR Code Generator (https://www.nayuki.io/page/qr-code-generator-library) developed by Nayuki. ")
				$flomtrkawp &= toStr("QR Code Generator is available on GitHub (https://github.com/nayuki/QR-Code-generator) and open-sourced under the following permissive MIT License (https://github.com/nayuki/QR-Code-generator#license):")
				$flomtrkawp &= @CRLF
				$flomtrkawp &= @CRLF
				$flomtrkawp &= toStr("Copyright © 2020 Project Nayuki. (MIT License)")
				$flomtrkawp &= @CRLF
				$flomtrkawp &= toStr("https://www.nayuki.io/page/qr-code-generator-library")
				$flomtrkawp &= @CRLF
				$flomtrkawp &= @CRLF
				$flomtrkawp &= toStr("Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the Software), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:")
				$flomtrkawp &= @CRLF
				$flomtrkawp &= @CRLF
				$flomtrkawp &= toStr("1. The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.")
				$flomtrkawp &= @CRLF
				$flomtrkawp &= toStr("2. The Software is provided as is, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the Software or the use or other dealings in the Software.")
				MsgBox(4096, toStr("About CodeIt Plus!"), $flomtrkawp)
			Case -3
				ExitLoop
		EndSwitch
	WEnd
EndFunc

Func arepqqkaeto($flmwacufre, $fljxaivjld)
	Local $fljiyeluhx = -1
	Local $flmwacufreheadermagic = DllStructCreate(toStr("struct;ushort;endstruct"))
	DllStructSetData($flmwacufreheadermagic, 1, 19778)
	Local $flivpiogmf = CreateFileReadFunc($fljxaivjld, False)
	If $flivpiogmf <> -1 Then
		Local $flchlkbend = WriteFileFunc($flivpiogmf, DllStructGetPtr($flmwacufreheadermagic), DllStructGetSize($flmwacufreheadermagic))
		If $flchlkbend <> -1 Then
			$flchlkbend = WriteFileFunc($flivpiogmf, DllStructGetPtr($flmwacufre[0]), DllStructGetSize($flmwacufre[0]))
			If $flchlkbend <> -1 Then
				$fljiyeluhx = 0
			EndIf
		EndIf
		CloseHandleFunc($flivpiogmf)
	EndIf
	Return $fljiyeluhx
EndFunc

main()

Func arelassehha($flbaqvujsl, $flkelsuuiy)
	Local $flefoubdxt = -1
	Local $flamtlcncx = arepqqkaeto($flbaqvujsl, $flkelsuuiy)
	If $flamtlcncx <> -1 Then
		Local $flvikmhxwu = CreateFileReadFunc($flkelsuuiy, True)
		If $flvikmhxwu <> -1 Then
			Local $flwldjlwrq = Abs(DllStructGetData($flbaqvujsl[0], toStr("biHeight")))
			Local $flumnoetuu = DllStructGetData($flbaqvujsl[0], toStr("biHeight")) > 0 ? $flwldjlwrq - 1 : 0
			Local $flqphcjgtp = DllStructCreate(toStr("struct;byte;byte;byte;endstruct"))
			For $fllrcvawmx = 0 To $flwldjlwrq - 1
				$flamtlcncx = WriteFileFunc($flvikmhxwu, DllStructGetPtr($flbaqvujsl[1], Abs($flumnoetuu - $fllrcvawmx) + 1), DllStructGetData($flbaqvujsl[0], toStr("biWidth")) * 3)
				If $flamtlcncx = -1 Then ExitLoop
				$flamtlcncx = WriteFileFunc($flvikmhxwu, DllStructGetPtr($flqphcjgtp), Mod(DllStructGetData($flbaqvujsl[0], toStr("biWidth")), 4))
				If $flamtlcncx = -1 Then ExitLoop
			Next
			If $flamtlcncx <> -1 Then
				$flefoubdxt = 0
			EndIf
			CloseHandleFunc($flvikmhxwu)
		EndIf
	EndIf
	Return $flefoubdxt
EndFunc

Func CreateFileWriteFunc($i_Filename)
	Local $flrichemye = DllCall(toStr("kernel32.dll"), toStr("ptr"), toStr("CreateFile"), toStr("str"), @ScriptDir & toStr("\") & $i_Filename, toStr("uint"), GENERIC_READ, toStr("uint"), 0, toStr("ptr"), 0, toStr("uint"), 3, toStr("uint"), 128, toStr("ptr"), 0)
	Return $flrichemye[0]
EndFunc

Func CreateFileReadFunc($flzxepiook, $isExistElseCreate = True)
	Local $flogmfcakq = DllCall(toStr("kernel32.dll"), toStr("ptr"), toStr("CreateFile"), toStr("str"), @ScriptDir & toStr("\") & $flzxepiook, toStr("uint"), GENERIC_WRITE, toStr("uint"), 0, toStr("ptr"), 0, toStr("uint"), $isExistElseCreate ? 3 : 2, toStr("uint"), 128, toStr("ptr"), 0)
	Return $flogmfcakq[0]
EndFunc

GUIDelete()

Func WriteFileFunc($fllsczdyhr, $flbfzgxbcy, $flutgabjfj)
	If $fllsczdyhr <> -1 Then
		Local $flvfnkosuf = DllCall(toStr("kernel32.dll"), toStr("uint"), toStr("SetFilePointer"), toStr("ptr"), $fllsczdyhr, toStr("long"), 0, toStr("ptr"), 0, toStr("uint"), 2)
		If $flvfnkosuf[0] <> -1 Then
			Local $flwzfbbkto = DllStructCreate(toStr("uint"))
			$flvfnkosuf = DllCall(toStr("kernel32.dll"), toStr("ptr"), toStr("WriteFile"), toStr("ptr"), $fllsczdyhr, toStr("ptr"), $flbfzgxbcy, toStr("uint"), $flutgabjfj, toStr("ptr"), DllStructGetPtr($flwzfbbkto), toStr("ptr"), 0)
			If $flvfnkosuf[0] <> 0 AND DllStructGetData($flwzfbbkto, 1) = $flutgabjfj Then
				Return 0
			EndIf
		EndIf
	EndIf
	Return -1
EndFunc

Func ReadFileFunc($i_hFile, ByRef $i_Buffer)
	Local $flqcvtzthz = DllStructCreate(toStr("struct;dword;endstruct"))
	Local $flqnsbzfsf = DllCall(toStr("kernel32.dll"), toStr("int"), toStr("ReadFile"), toStr("ptr"), $i_hFile, toStr("struct*"), $i_Buffer, toStr("dword"), DllStructGetSize($i_Buffer), toStr("struct*"), $flqcvtzthz, toStr("ptr"), 0)
	Return $flqnsbzfsf[0]
EndFunc

Func CloseHandleFunc($fldiapcptm)
	Local $flhvhgvtxm = DllCall(toStr("kernel32.dll"), toStr("int"), toStr("CloseHandle"), toStr("ptr"), $fldiapcptm)
	Return $flhvhgvtxm[0]
EndFunc

Func DeleteFileAFunc($flxljyoycl)
	Local $flaubrmoip = DllCall(toStr("kernel32.dll"), toStr("int"), toStr("DeleteFileA"), toStr("str"), $flxljyoycl)
	Return $flaubrmoip[0]
EndFunc

Func GetFileSizeFunc($flpxhqhcav)
	Local $flzmcdhzwh = -1
	Local $flztpegdeg = DllStructCreate(toStr("struct;dword;endstruct"))
	Local $flekmcmpdl = DllCall(toStr("kernel32.dll"), toStr("dword"), toStr("GetFileSize"), toStr("ptr"), $flpxhqhcav, toStr("struct*"), $flztpegdeg)
	If $flekmcmpdl <> -1 Then
		$flzmcdhzwh = $flekmcmpdl[0] + Number(DllStructGetData($flztpegdeg, 1))
	EndIf
	Return $flzmcdhzwh
EndFunc

Func areihnvapwn()
	Local $dlit = "7374727563743b75696e7420626653697a653b75696e7420626652657365727665643b75696e742062664f6666426974733b"
	$dlit &= "75696e7420626953697a653b696e7420626957696474683b696e742062694865696768743b7573686f7274206269506c616e"
	$dlit &= "65733b7573686f7274206269426974436f756e743b75696e74206269436f6d7072657373696f6e3b75696e7420626953697a"
	$dlit &= "65496d6167653b696e742062695850656c735065724d657465723b696e742062695950656c735065724d657465723b75696e"
	$dlit &= "74206269436c72557365643b75696e74206269436c72496d706f7274616e743b656e647374727563743b4FD5$626653697a6"
	$dlit &= "54FD5$626652657365727665644FD5$62664f6666426974734FD5$626953697a654FD5$626957696474684FD5$6269486569"
	$dlit &= "6768744FD5$6269506c616e65734FD5$6269426974436f756e744FD5$6269436f6d7072657373696f6e4FD5$626953697a65"
	$dlit &= "496d6167654FD5$62695850656c735065724d657465724FD5$62695950656c735065724d657465724FD5$6269436c7255736"
	$dlit &= "5644FD5$6269436c72496d706f7274616e744FD5$7374727563743b4FD5$627974655b4FD5$5d3b4FD5$656e647374727563"
	$dlit &= "744FD5$4FD5$2e626d704FD5$5c4FD5$2e646c6c4FD5$7374727563743b64776f72643b636861725b313032345d3b656e647"
	$dlit &= "374727563744FD5$6b65726e656c33322e646c6c4FD5$696e744FD5$476574436f6d70757465724e616d65414FD5$7074724"
	$dlit &= "FD5$436f6465497420506c7573214FD5$7374727563743b627974655b4FD5$5d3b656e647374727563744FD5$73747275637"
	$dlit &= "43b627974655b35345d3b627974655b4FD5$7374727563743b7074723b7074723b64776f72643b627974655b33325d3b656e"
	$dlit &= "647374727563744FD5$61647661706933322e646c6c4FD5$437279707441637175697265436f6e74657874414FD5$64776f7"
	$dlit &= "2644FD5$4372797074437265617465486173684FD5$437279707448617368446174614FD5$7374727563742a4FD5$4372797"
	$dlit &= "07447657448617368506172616d4FD5$30784FD5$30383032304FD5$30303031304FD5$36363030304FD5$30323030304FD5"
	$dlit &= "$303030304FD5$43443442334FD5$32433635304FD5$43463231424FD5$44413138344FD5$44383931334FD5$45364639324"
	$dlit &= "FD5$30413337414FD5$34463339364FD5$33373336434FD5$30343243344FD5$35394541304FD5$37423739454FD5$413434"
	$dlit &= "33464FD5$46443138394FD5$38424145344FD5$39423131354FD5$46364342314FD5$45324137434FD5$31414233434FD5$3"
	$dlit &= "4433235364FD5$31324135314FD5$39303335464FD5$31384642334FD5$42313735324FD5$38423341454FD5$43414633444"
	$dlit &= "FD5$34383045394FD5$38424638414FD5$36333544414FD5$46393734454FD5$30303133354FD5$33354432334FD5$314534"
	$dlit &= "42374FD5$35423243334FD5$38423830344FD5$43374145344FD5$44323636414FD5$33374233364FD5$46324335354FD5$3"
	$dlit &= "5424633414FD5$39454136414FD5$35384243384FD5$46393036434FD5$43363635454FD5$41453243454FD5$36304632434"
	$dlit &= "FD5$44453338464FD5$44333032364FD5$39434334434FD5$45354242304FD5$39303437324FD5$46463942444FD5$323646"
	$dlit &= "39314FD5$31394238434FD5$34383446454FD5$36394542394FD5$33344634334FD5$46454544454FD5$44434542414FD5$3"
	$dlit &= "7393134364FD5$30383139464FD5$42323146314FD5$30463833324FD5$42324135444FD5$34443737324FD5$44423132434"
	$dlit &= "FD5$33424544394FD5$34374636464FD5$37303641454FD5$34343131414FD5$35324FD5$7374727563743b7074723b70747"
	$dlit &= "23b64776f72643b627974655b383139325d3b627974655b4FD5$5d3b64776f72643b656e647374727563744FD5$437279707"
	$dlit &= "4496d706f72744b65794FD5$4372797074446563727970744FD5$464c4152454FD5$4552414c464FD5$43727970744465737"
	$dlit &= "4726f794b65794FD5$437279707452656c65617365436f6e746578744FD5$437279707444657374726f79486173684FD5$73"
	$dlit &= "74727563743b7074723b7074723b64776f72643b627974655b31365d3b656e647374727563744FD5$7374727563743b64776"
	$dlit &= "f72643b64776f72643b64776f72643b64776f72643b64776f72643b627974655b3132385d3b656e647374727563744FD5$47"
	$dlit &= "657456657273696f6e4578414FD5$456e746572207465787420746f20656e636f64654FD5$43616e2068617a20636f64653f"
	$dlit &= "4FD5$4FD5$48656c704FD5$41626f757420436f6465497420506c7573214FD5$7374727563743b64776f72643b64776f7264"
	$dlit &= "3b627974655b333931385d3b656e647374727563744FD5$696e743a636465636c4FD5$6a75737447656e6572617465515253"
	$dlit &= "796d626f6c4FD5$7374724FD5$6a757374436f6e76657274515253796d626f6c546f4269746d6170506978656c734FD5$546"
	$dlit &= "869732070726f6772616d2067656e65726174657320515220636f646573207573696e6720515220436f64652047656e65726"
	$dlit &= "1746f72202868747470733a2f2f7777772e6e6179756b692e696f2f706167652f71722d636f64652d67656e657261746f722"
	$dlit &= "d6c6962726172792920646576656c6f706564206279204e6179756b692e204FD5$515220436f64652047656e657261746f72"
	$dlit &= "20697320617661696c61626c65206f6e20476974487562202868747470733a2f2f6769746875622e636f6d2f6e6179756b69"
	$dlit &= "2f51522d436f64652d67656e657261746f722920616e64206f70656e2d736f757263656420756e6465722074686520666f6c"
	$dlit &= "6c6f77696e67207065726d697373697665204d4954204c6963656e7365202868747470733a2f2f6769746875622e636f6d2f"
	$dlit &= "6e6179756b692f51522d436f64652d67656e657261746f72236c6963656e7365293a4FD5$436f7079726967687420c2a9203"
	$dlit &= "23032302050726f6a656374204e6179756b692e20284d4954204c6963656e7365294FD5$68747470733a2f2f7777772e6e61"
	$dlit &= "79756b692e696f2f706167652f71722d636f64652d67656e657261746f722d6c6962726172794FD5$5065726d697373696f6"
	$dlit &= "e20697320686572656279206772616e7465642c2066726565206f66206368617267652c20746f20616e7920706572736f6e2"
	$dlit &= "06f627461696e696e67206120636f7079206f66207468697320736f66747761726520616e64206173736f636961746564206"
	$dlit &= "46f63756d656e746174696f6e2066696c6573202874686520536f667477617265292c20746f206465616c20696e207468652"
	$dlit &= "0536f66747761726520776974686f7574207265737472696374696f6e2c20696e636c7564696e6720776974686f7574206c6"
	$dlit &= "96d69746174696f6e207468652072696768747320746f207573652c20636f70792c206d6f646966792c206d657267652c207"
	$dlit &= "075626c6973682c20646973747269627574652c207375626c6963656e73652c20616e642f6f722073656c6c20636f7069657"
	$dlit &= "3206f662074686520536f6674776172652c20616e6420746f207065726d697420706572736f6e7320746f2077686f6d20746"
	$dlit &= "86520536f667477617265206973206675726e697368656420746f20646f20736f2c207375626a65637420746f20746865206"
	$dlit &= "66f6c6c6f77696e6720636f6e646974696f6e733a4FD5$312e205468652061626f766520636f70797269676874206e6f7469"
	$dlit &= "636520616e642074686973207065726d697373696f6e206e6f74696365207368616c6c20626520696e636c7564656420696e"
	$dlit &= "20616c6c20636f70696573206f72207375627374616e7469616c20706f7274696f6e73206f662074686520536f6674776172"
	$dlit &= "652e4FD5$322e2054686520536f6674776172652069732070726f76696465642061732069732c20776974686f75742077617"
	$dlit &= "272616e7479206f6620616e79206b696e642c2065787072657373206f7220696d706c6965642c20696e636c7564696e67206"
	$dlit &= "27574206e6f74206c696d6974656420746f207468652077617272616e74696573206f66206d65726368616e746162696c697"
	$dlit &= "4792c206669746e65737320666f72206120706172746963756c617220707572706f736520616e64206e6f6e696e6672696e6"
	$dlit &= "7656d656e742e20496e206e6f206576656e74207368616c6c2074686520617574686f7273206f7220636f707972696768742"
	$dlit &= "0686f6c64657273206265206c6961626c6520666f7220616e7920636c61696d2c2064616d61676573206f72206f746865722"
	$dlit &= "06c696162696c6974792c207768657468657220696e20616e20616374696f6e206f6620636f6e74726163742c20746f72742"
	$dlit &= "06f72206f74686572776973652c2061726973696e672066726f6d2c206f7574206f66206f7220696e20636f6e6e656374696"
	$dlit &= "f6e20776974682074686520536f667477617265206f722074686520757365206f72206f74686572206465616c696e6773206"
	$dlit &= "96e2074686520536f6674776172652e4FD5$7374727563743b7573686f72743b656e647374727563744FD5$7374727563743"
	$dlit &= "b627974653b627974653b627974653b656e647374727563744FD5$43726561746546696c654FD5$75696e744FD5$53657446"
	$dlit &= "696c65506f696e7465724FD5$6c6f6e674FD5$577269746546696c654FD5$7374727563743b64776f72643b656e647374727"
	$dlit &= "563744FD5$5265616446696c654FD5$436c6f736548616e646c654FD5$44656c65746546696c65414FD5$47657446696c655"
	$dlit &= "3697a65"
	Global $os = StringSplit($dlit, "4FD5$", 1)
EndFunc

Func toStr($someStr)
	Local $tempStr
	For $i = 1 To StringLen($someStr) Step 2
		; cut the string to 2, change to hex to decimal and than to char
		$tempStr &= Chr(Dec(StringMid($someStr, $i, 2)))
	Next
	Return $tempStr
EndFunc
