<%-- 
    Document   : jspABCVendedor
    Created on : 22/10/2019, 11:23:09 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    int id=0;
if(request.getParameter("id")!=null){
    id=Integer.parseInt(request.getParameter("id").toString());
}
else{
    out.print("<script language='javascipt'>document.location.href='index.jsp?op=jspABCVendedor.jsp'</script>");
}
%>

<form action="administrador.do" method="post" id="ven" name="ven">
    <input type="hidden" id="org" name="org" value="detVendedor">
    <input type="hidden" id="id" name="id" value="<%=id%>">
</form>

<%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("ven").submit();
</script>

<%
    }
%>



  <div class="fondo-negro">
    <center >
      <div class="titulo">
        Modificar vendedor
      </div>
    </center>
  </div>

  <section class="m-content">
    <center>
        <form method="post" action="administrador.do">
            <table>

                <%
                    if (request.getAttribute("edo") != null) {
                %>
                <tr>
                    <td>

                        <div id="error" style="text-align: center; color: #ecef01; font-weight: bold;">
                            <%=request.getAttribute("edo")%>
                        </div>

                    </td>
                </tr>
                <%
                    }
                %>

                <tr>
                    <td style="text-align: right">
                        <div class="small">
                            <h4>Nombre:</h4>
                    </td>
                    <td>
                        <div class="col-lg-6">
                            <input type="text" value="<% out.print((request.getAttribute("txt_Nombre")!=null)?request.getAttribute("txt_Nombre"):"");  %>" class="form-control" name="txt_Nombre" placeholder="Nombre del empleado" id="txt_Nombre" style="min-width: 240px; width:240;" required>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">
                        <br>
                        <div class="small">
                            <h4>Apellidos:</h4>
                        </div>
                    </td>
                    <td>
                        <br>

                        <div class="col-lg-6">
                            <input type="text" value="<% out.print((request.getAttribute("txt_Apellidos")!=null)?request.getAttribute("txt_Apellidos"):"");  %>" class="form-control" name="txt_Apellidos" placeholder="Apellidos del empleado" id="txt_Apellidos" style="min-width: 240px; width:240;" required>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">
                        <br>
                        <div class="small">
                            <h4>Usuario:</h4>
                        </div>
                    </td>
                    <td>
                        <br>
                        <div class="col-lg-6">
                            <input type="text" value="<% out.print((request.getAttribute("txt_Usuario")!=null)?request.getAttribute("txt_Usuario"):"");  %>" class="form-control" name="txt_Usuario" placeholder="Nombre de usuario" id="txt_Usuario" style="min-width: 240px; width:240;" required readonly="">
                        </div>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">
                        <br>
                        <div class="small">
                            <h4>Teléfono:</h4>
                        </div>
                    </td>
                    <td>
                        <br>
                        <div class="col-lg-6">
                            <input type="text" value="<% out.print((request.getAttribute("txt_Tel")!=null)?request.getAttribute("txt_Tel"):"");  %>" class="form-control" name="txt_Tel" placeholder="Número telefónico" id="txt_Tel" style="min-width: 240px; width:240;" required>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">
                        <br>
                        <div class="small">
                            <h4>Correo:</h4>
                        </div>
                    </td>
                    <td>
                        <br>
                        <div class="col-lg-6">
                            <input type="email" value="<% out.print((request.getAttribute("txt_Correo")!=null)?request.getAttribute("txt_Correo"):"");  %>" class="form-control" name="txt_Correo" placeholder="example@domain.com" id="txt_Correo" style="min-width: 240px; width:240;" required>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">
                        <br>
                        <div class="small">
                            <h4>Contraseña</h4>
                    </td>
                    <td>
                        <br>
                        <div class="col-lg-6">
                            <input type="text" value="<% out.print((request.getAttribute("txt_Contra")!=null)?request.getAttribute("txt_Contra"):"");  %>" class="form-control" name="txt_Contra" placeholder="Contraseña" id="txt_Contra" style="min-width: 240px; width:240;" required>
                        </div>
                    </td>
                </tr>

                <br><br>
                <tr style="height: 15px">
                    <td>  </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="custom-btn-group mt-4">
                            <input type="submit" class="btn custom-btn" name="btn_Modificar" value="Modificar" id="btn_Registrar" style="min-width: 240px; width:240;" required>
                            <input type="hidden" class="btn custom-btn" name="admin" value="<% out.print((request.getAttribute("idAdm")!=null)?request.getAttribute("idAdm"):"");  %>" id="admin">
                            <input type="hidden" class="btn custom-btn" name="idVen" value="<% out.print((request.getAttribute("id")!=null)?request.getAttribute("id"):"");  %>" id="admin">
                            <input type="hidden" class="btn custom-btn" name="org" value="modVendedor" id="org">
                        </div>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </form>
    </center>
    <br>
    </div>
  </section>