<%-- 
    Document   : jspClientesProspectos
    Created on : Nov 26, 2019, 9:52:17 AM
    Author     : migue
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form action="vendedor.do" method="post" id="lstProspectos" name="lstProspectos">
    <input type="hidden" id="org" name="org" value="listarProspectos">
</form>
<%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("lstProspectos").submit();
</script>
<%
    }
%>
<div class="fondo-negro">
    <center >
        <div class="titulo">
            Clientes Prospectos  
        </div>
    </center>
</div>
<section class="m-content" style="min-width:600px">
    <center class="prs">
        <table >
            <tr>
                <td align="center" colspan="4">
                    <div id="error" style="text-align: center; color: red; font-weight: bold;">
                        <%
                            if (request.getAttribute("edo") != null) {
                        %>

                        <%=request.getAttribute("edo")%>
                        <%
                            }
                        %>
                    </div>

                </td>
            </tr>
            <%
                    if (request.getSession().getAttribute("rsProsp") != null) {%>
            <tr align="center">
                <td style="width: 15%">
                    <h4 >Clave</h4>
                </td>
                <td style="width: 20%">
                    <h4>Nombre</h4>
                </td>
                <td  style="width: 25%">
                    <h4>Correo electrónico</h4>
                </td>
                <td style="width: 20%">
                    <h4>Teléfono</h4>
                </td>
                <td style="width: 20%">
                    <h4>Traducción</h4>
                </td>
            </tr>
            <%
                    ResultSet rsPros = (ResultSet) request.getSession().getAttribute("rsProsp");
                    rsPros.beforeFirst();
                    while (rsPros.next()) {
                        out.println("<tr>");
                        out.println("<td style='text-align:center;'>" + rsPros.getString(1) + "</td>");
                        out.println("<td style='text-align:center;'>" + rsPros.getString(2) + "</td>");
                        out.println("<td style='text-align:center;'>" + rsPros.getString(3) + "</td>");
                        out.println("<td style='text-align:center;'>" + rsPros.getString(4) + "</td>");
                        out.println("<td style='text-align:center;'> <form method='post' action='vendedor.do'> <input type='hidden' id='org' name='org' value='addTraduccion'><input  type='hidden' name='idCli'value='"+ rsPros.getString(1)+"' id='idCli'><input type='submit' class='btn' value='Nueva' id='btnNuevaT'></form> </td></tr>");
                    }
                }
            %>
        </table>
    </center>
</section>