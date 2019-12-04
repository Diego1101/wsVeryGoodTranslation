<%-- 
    Document   : jspABCVendedor
    Created on : 22/10/2019, 11:23:09 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



  <div class="fondo-negro">
    <center >
      <div class="titulo">
        Registro de vendedores
      </div>
    </center>
  </div>

<!--
Nombre
Apellidos
Usuario
Sexo
Telefono
Dirección
Correo

-->


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
                            <input type="text" class="form-control" name="txt_Nombre" placeholder="Nombre del empleado" id="txt_Nombre" style="min-width: 240px; width:240;" required>
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
                            <input type="text" class="form-control" name="txt_Apellidos" placeholder="Apellidos del empleado" id="txt_Apellidos" style="min-width: 240px; width:240;" required>
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
                            <input type="text" class="form-control" name="txt_Usuario" placeholder="Nombre de usuario" id="txt_Usuario" style="min-width: 240px; width:240;" required>
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
                            <input type="text" class="form-control" name="txt_Tel" placeholder="Número telefónico" id="txt_Tel" style="min-width: 240px; width:240;" required>
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
                            <input type="email" class="form-control" name="txt_Correo" placeholder="example@domain.com" id="txt_Correo" style="min-width: 240px; width:240;" required>
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
                            <input type="password" class="form-control" name="txt_Contra" placeholder="Contraseña" id="txt_Contra" style="min-width: 240px; width:240;" required>
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
                            <input type="submit" class="btn custom-btn" name="btn_Registrar" value="Registrar" id="btn_Registrar" style="min-width: 240px; width:240;" required>
                            <input type="hidden" class="btn custom-btn" name="org" value="regVen" id="org">
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