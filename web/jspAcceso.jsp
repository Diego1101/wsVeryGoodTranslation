<%-- 
    Document   : jspAcceso
    Created on : 22/10/2019, 10:57:55 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="css/Acceso.css" rel="stylesheet" type="text/css"/>

<section>
    <div class="container">
        <div class="about-text align-items-center">
            <center>
            <div class="fondo">
            <h3>
               Acceso al sistema
            </h3>
            </div>
          </center>
        </div>
    </div>
    <center class="m-content">
        <form action="general.do" method="post">
            <table >
                <tr>
                    <td align="center" colspan="2" style="color: #e22; font-weight: bold">
                        <div>
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
                <tr><td></td></tr>
                <tr>
                    <td>
                    <h4 class="texto-Centro">Usuario:</h4>
              </td>
                    <td>
                            <input type="text" class="form-control" name="txt_Usuario" id="miid" placeholder="Nombre Usuario" id="txt_Usuario" size="40">

                    </td>
                </tr>

                <tr>
                    <td>
                        <br>
                      <div class="small" align="right">
                    <h4 class="texto-Centro" >Contraseña:</h4>


                    </td>
                    <td>
                        <br>
                        <div class="auto-style4"align="center">
                            <input type="password" class="form-control" name="txt_Contra" id="miid" placeholder="Contraseña" id="txt_Contra">
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <div class="custom-btn-group mt-4" align="center">
                            <input  type="hidden" name="org"value="acceso" id="org">
                            <input  type="submit" class="btn  "name="btn_Entrar"value="Acceder"id="btn_Entrar">
                        </div>
                    </td>
                </tr>
                
                   
            </table>
        </form>
    </center>
    </div>
</section>
