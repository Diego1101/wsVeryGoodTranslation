<%-- 
    Document   : jspVendedores
    Created on : 8/12/2019, 07:43:05 PM
    Author     : diego
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<form action="administrador.do" method="post" id="frmLoadV" name="frmLoadV">
    <input type="hidden" id="org" name="org" value="loadVendedores">
    <%
        if (request.getAttribute("edo") != null) {
    %>
    <input type="hidden" id="edo" name="edo" value="<%=request.getAttribute("edo")%>">
    <%
        }
    %>
</form>

<%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
   document.getElementById("frmLoadV").submit();
</script>
<%
    }
%>



<div class="fondo-negro">
    <center >
        <div class="titulo">
            Vendedores
        </div>
    </center>
</div>

<section class="m-content" style="min-width:600px">
    <center class="prz" style="padding-right:5px">
        <div>
            <center> <h4 style="font-weight:lighter;">Vendedores</h4> </center>
            <center> <a href="index.jsp?op=jspABCVendedor.jsp"> Agregar Vendedor </a>  </center>
            <center class="rs encabezadoTabla">
                <table class="tven">
                    <tr>
                        <td class="Dmod"></td>
                        <td>
                            <h5>Cve</h5>
                        </td>
                        <td>
                            <h5>Nombre</h5>
                        </td>
                        <td>
                            <h5>Apellidos</h5>
                        </td>
                        <td>
                            <h5>Usuario</h5>
                        </td>
                        <td>
                            <h5>Contraseña</h5>
                        </td>
                        <td>
                            <h5>Correo</h5>
                        </td>
                        <td>
                            <h5>Telefono</h5>
                        </td>
                        <td>
                            <h5>Estatus</h5>
                        </td>
                    </tr>
                    <%
                        if (request.getAttribute("ven") != null) {
                            List<String[]> ven = (List<String[]>) request.getAttribute("ven");
                            for (String[] f : ven) {
                    %>
                    <tr>
                        <td class="Dmod"><a href="index.jsp?op=jspModVen.jsp&id=<%=f[0]%>"> Modificar </a></td>
                        <td><%=f[0]%></td>
                        <td><%=f[1]%></td>
                        <td><%=f[2]%></td>
                        <td><%=f[3]%></td>
                        <td><%=f[4]%></td>
                        <td><%=f[5]%></td>
                        <td><%=f[6]%></td>
                        <td><%=f[7]%></td>
                    </tr>
                    <%
                            }
                        }

                    %>

                </table>
            </center>
        </div>
    </center>
</section>