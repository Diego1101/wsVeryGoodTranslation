<%-- 
    Document   : jspCerrarSesion
    Created on : 22/10/2019, 12:00:05 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.getSession().setAttribute("rol",0);
    request.getSession().setAttribute("usuario","");
%>

<<script type="text/javascript">
    document.location.href="index.jsp"
</script>