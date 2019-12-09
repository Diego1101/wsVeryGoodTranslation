<%-- 
    Document   : jspError
    Created on : 4/12/2019, 02:51:53 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <h1>A ocurrido un error</h1>
        <h3>
        <%
        out.print(request.getAttribute("err"));
        %>
        </h3>
    </body>
</html>
