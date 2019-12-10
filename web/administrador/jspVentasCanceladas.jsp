<%-- 
    Document   : jspVentasCanceladas
    Created on : 09-dic-2019, 19:37:36
    Author     : volal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form action="administrador.do" method="post" id="rpVentasC" name="rpVentasC">
    <input type="hidden" id="org" name="org" value="errepeCitasCanceladas">
</form>

    <%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("rpVentasC").submit();
</script>
<%
    }
%>

  <div class="fondo-negro">
    <center >
      <div class="titulo">
        Reporte de ventas
      </div>
    </center>
  </div>

  <!-- CONTENIDO -->
  <section class="m-content" style="min-width:600px">
  <center>
  <div class="reporte">
    <!-- Encabezado del reporte -->
    <table class="tRep">
        <tr>
            <td align="center" colspan="5">
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
                        if (request.getSession().getAttribute("rsRepVenC") != null){%>
      <tr>
          <td align="left" style="width:60%" colspan="3">
          <img src="https://verygoodtranslation.com/wp-content/uploads/2019/07/logo3-para-web.png" alt="Very Good Translation" id="logo" data-height-percentage="10" height="50" />
        </td>
        <td  align="right" style="font-size:12pt; width: 40%" colspan="2">
            Fecha: <span id="datetime"></span>
          <script>
            var dt = new Date();
            document.getElementById("datetime").innerHTML = dt.toLocaleString();
          </script>
        </td>
      </tr>
      <tr><td style="height:20px" colspan="5"></td></tr>
      <tr>
        <td colspan="3">Tipo de reporte: Ventas canceladas del mes</td>
      </tr>
    </table>
    <hr align="center"color="black"> 
        <!-- Area del reporte -->
                 
        <table class="tRep">
          <tr align="center">
              <td style="width: 20%">
                  Clave de traducción
              </td>
              <td style="width: 20%">
                  Nombre del cliente
              </td>
              <td style="width: 20%">
                  Correo
              </td>
              <td style="width: 20%">
                  Fecha
              </td>
              <td style="width: 20%">
                  Tipo de traducción
              </td>
          </tr>

                    <%
                            ResultSet rsVen = (ResultSet)request.getSession().getAttribute("rsRepVenC");
                            rsVen.beforeFirst();
                            while(rsVen.next()){
                                out.println("<tr>");
                                out.println("<td style='text-align:center;'>"+rsVen.getString(1)+"</td>");
                                out.println("<td style='text-align:center;'>"+rsVen.getString(2)+"</td>");
                                out.println("<td style='text-align:center;'>"+rsVen.getString(3)+"</td>");
                                out.println("<td style='text-align:center;'>"+rsVen.getString(4)+"</td>");
                                out.println("<td style='text-align:center;'>"+rsVen.getString(6)+"</td></tr>");
                            }
                    %>
                    <tr align="center"><td colspan="5"> <br> Exportar</td></tr>
                    <tr><td style="height: 10px"></td></tr>
                    <% }
                    %>
        </table>
      </div>
    </center>
      <center>
            
      </center>
  </section>