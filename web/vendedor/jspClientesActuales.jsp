<%-- 
    Document   : jspClientesActuales
    Created on : Dec 3, 2019, 11:35:14 PM
    Author     : migue
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form action="vendedor.do" method="post" id="lstActivos" name="lstActivos">
    <input type="hidden" id="org" name="org" value="listarActivos">
</form>
    <%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("lstActivos").submit();
</script>
<%
    }
%>
  <div class="fondo-negro">
      <center >
        <div class="titulo">
          Clientes actuales  
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
                        if (request.getSession().getAttribute("rsClientes") != null){%>
                <tr align="center">
                    <td style="width: 15%">
                        <h4 >Clave</h4>
                    </td>
                    <td style="width: 25%">
                        <h4>Nombre</h4>
                    </td>
                    <td  style="width: 25%">
                        <h4>Correo electrónico</h4>
                    </td>
                    <td style="width: 25%">
                        <h4>Teléfono</h4>
                    </td>
                    <td style="width: 10%">
                                                <h4>Nueva</h4>

                    </td>
                    </tr>
                    <%
                            ResultSet rsPros = (ResultSet)request.getSession().getAttribute("rsClientes");
                            rsPros.beforeFirst();
                            while(rsPros.next()){
                                out.println("<tr>");
                                out.println("<td style='text-align:center;'>"+rsPros.getString(1)+"</td>");
                                out.println("<td style='text-align:center;'>"+rsPros.getString(2)+"</td>");
                                out.println("<td style='text-align:center;'>"+rsPros.getString(3)+"</td>");
                                out.println("<td style='text-align:center;'>"+rsPros.getString(4)+"</td>");
                                out.println("<td style='text-align:center;'> <form method='post' action='vendedor.do'> <input type='hidden' id='org' name='org' value='addTraduccion'><input  type='hidden' name='idCli'value='"+ rsPros.getString(1)+"' id='idCli'><input type='submit' class='btn' value='Nueva' id='btnNuevaT'></form> </td></tr>");

                            }
                        }
                    %>
            </table>
        </center>


</section>
