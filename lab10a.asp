<%
Dim bgColor
bgColor = Request.QueryString("bgcolor")

If bgColor = "" Then
    bgColor = "white"
End If

Dim lastVisit, isFirstVisit
If Request.Cookies("lastVisit") <> "" Then
    lastVisit = Request.Cookies("lastVisit")
    isFirstVisit = False
Else
    isFirstVisit = True
End If

Response.Cookies("lastVisit") = Now()
Response.Cookies("lastVisit").Expires = DateAdd("d", 30, Now()) ' Cookie expires in 30 days
%>
<html>
<head>
    <title>Background Color Page</title>
</head>
<body style="background-color:<%=bgColor%>;">
    <% If isFirstVisit Then %>
        <p>Welcome! This is your first visit.</p>
    <% Else %>
        <p>Your last visit was on <%=lastVisit%>.</p>
    <% End If %>
</body>
</html>
