<%-- 
    Document   : jspAcceso
    Created on : 22/10/2019, 10:57:55 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="css/Acceso.css" rel="stylesheet" type="text/css"/>

<section class="m-content">
    <div class="container">
        <div class="about-text align-items-center">
            <center>
                        <br>
                        <div class="fondo">
                        <h3>
                            <span class="titulo"> Acceso al sistema</span>
                        </h3>
                        </div>
                      </center>
        </div>
    </div>

    <center>
        <form action="general.do" method="post">
            <table >
                <tr>
                    <td>
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
                <tr>
                    <td>
                <div  align="right">
                    <h4 class="texto-Centro">Usuario:</h4>
              </td>
                    <td>
                        <div class="auto-style4" align="center">
                            <input type="text" class="form-control" name="txt_Usuario" id="miid" placeholder="Nombre Usuario" id="txt_Usuario" width="20"size="40">
                        </div>
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
                            <input type="password" class="form-control" name="txt_Contra" id="miid" placeholder="Contraseña" id="txt_Contra" width="20"size="40">
                        </div>
                    </td>
                </tr>
                <br>
                <tr>
                    <td>
                    </td>
                    <td >
                        <div class="custom-btn-group mt-4" align="center">
                            <input  type="hidden" name="org"value="acceso" id="org">
                            <input  type="submit" class="btn  "name="btn_Entrar"value="Acceder"id="btn_Entrar" style="width: 172px" >
                        </div>
                    </td>
                    <td>
                    </td>
                    
                </tr>
                
                   
            </table>
        </form>
    </center>
    </div>
</section>