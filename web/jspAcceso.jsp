<%-- 
    Document   : jspAcceso
    Created on : 22/10/2019, 10:57:55 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<section>
    <div class="container">
        <div class="about-text align-items-center">
            <center>
                <br><br>
                <h3>
                    <span class="mr-2" > Acceso al sistema</span>
                </h3>
                <br>
            </center>
        </div>
    </div>


    <center>
        <form action="general.do" method="post">
            <table >
                <tr>
                    <td>
                        <%
                            if (request.getAttribute("edo") != null) {
                        %>

                        <div id="error" style="text-align: center; color: red; font-weight: bold;"><%=request.getAttribute("edo")%></div>
                        <%
                            }
                        %>

                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="small" align="right">
                            <h4>&nbsp;&nbsp; Usuario</h4>
                        </div>
                    </td>
                    <td>
                        <div class="auto-style4" align="center">
                            <input type="text" class="auto-style1" name="txt_Usuario" id="miid" placeholder="Nombre Usuario" id="txt_Usuario" width="20"size="40">
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br>
                        &nbsp;&nbsp;
                        <div class="small" align="right">
                            <h4 >&nbsp;&nbsp;Contraseña</h4>

                    </td>
                    <td>
                        <br>
                        <div class="auto-style4"align="center">
                            <input type="password" class="auto-style2" name="txt_Contra" id="miid" placeholder="Contraseña" id="txt_Contra" width="20"size="40">
                        </div>
                    </td>
                </tr>
                <br>
                <tr>
                    <td>
                    </td>
                    <td >
                        <div class="custom-btn-group mt-4" align="center">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input  type="hidden" name="org"value="acceso" id="org">
                            <input  type="submit" class="btn custom-btn "name="btn_Entrar"value="Acceder"id="btn_Entrar" style="width: 172px" >
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
