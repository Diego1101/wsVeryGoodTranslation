<%-- 
    Document   : jspABCIdioma
    Created on : Dec 3, 2019, 10:54:56 PM
    Author     : migue
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<form action="administrador.do" method="post" id="frmLoadI" name="frmLoadI">
    <input type="hidden" id="org" name="org" value="loadIdioma">
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
    document.getElementById("frmLoadI").submit();
</script>
<%
    }
%>



<div class="fondo-negro">
    <center >
        <div class="titulo">
            Registro de idiomas
        </div>
    </center>
</div>

<section class="m-content" style="min-width:300px;min-height:80px;">
    <center> <h4 style="font-weight:lighter;"> Idiomas registrados</h4> </center>
        <%
            if (request.getAttribute("edo") != null) {
        %>
    <h4 id="error">
        <%=request.getAttribute("edo")%>
    </h4>
    <%
        }
    %>
    <center class="rs encabezadoTabla">
        <table class="tRep">

            <tr>
                <td>
                    <h5 >Nombre</h5>
                </td>
                <td>
                    <h5>Factor de Idioma</h5>
                </td>
                <td>
                    <h5>Fecha de Registro</h5>
                </td>
                <td>
                    <h5>
                        Estatus</h5>
                </td>
            </tr>
            <%
                if (request.getAttribute("idiomas") != null) {

                    ResultSet rs = (ResultSet) request.getAttribute("idiomas");

                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getString(3) + "</td>");
                        out.print("<td>" + rs.getString(4).split(" ")[0] + "</td>");
                        out.print("<td>" + rs.getString(5) + "</td>");
                        out.print("</tr>");
                    }

                }
            %>
        </table>
    </center>
</section>
<hr>
<div id="div_ModificarIdioma">
    <section class="m-content" style="min-width:300px;min-height:120px;height:300px;">
        <center>
            <form method="post" action="administrador.do">
                <table>
                    <tr colspan="2" > <h4 style="font-weight:lighter;">Modificar Idioma</h4></tr>
                    <br>
                    <tr>
                        <td style="text-align: right">
                            <h4 class="texto-Centro">Idioma:</h4>
                        </td>
                        <td>
                            <div class="col-lg-6">
                                <select  class="form-control" id="slidioma" name="slidioma" style="width: 240px">
                                    <%
                                        if (request.getAttribute("idiomas") != null) {

                                            ResultSet rs = (ResultSet) request.getAttribute("idiomas");
                                            rs.beforeFirst();
                                            while (rs.next()) {;
                                                out.print("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <h4 class="texto-Centro">Estatus</h4>
                        </td>
                        <td>
                            <div class="col-lg-6">
                                <select  class="form-control" id="slEstatus" name="slEstatus" style="width: 240px">
                                    <option value="1">Alta</option>
                                    <option value="0">Baja</option>
                                </select>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: right">
                            <br>
                            <div class="texto-Centro">
                                <h4 class="texto-Centro">Factor de Idioma:</h4>
                            </div>
                        </td>
                        <td>
                            <br>
                            <div class="col-lg-6">
                                <input type="text" min="0" class="form-control" name="txt_FacIdioma" placeholder="Factor del idioma" id="txt_FacIdioma" style="min-width: 240px; width:240;" required="">
                            </div>
                            
                        </td>
                    <tr>
                        <td style="height:10px;">
                            
                        </td>
                    </tr>
                    </tr>
                    <tr>
                    <br>
                        <td colspan="2" style="text-align: center;">
                            <div>
                                <input type="submit"  class="btn " name="btn_Modificar" value="Modificar" id="btn_Modificar" style="min-width: 180px; width:180;">
                                <input type="hidden"  name="org" value="modIdioma" id="org">
                            </div>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:10px;">
                            
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <br>
        
        </div>
        
    </section>
</div>
<div id="div_RegistrarIdioma">
    <section class="m-content" style="min-height:120px">
        <center>
            <form method="post" action="administrador.do">

                <table>
                    <tr colspan="2" > <h4 style="font-weight:lighter;"> Registrar idioma nuevo</h4></tr>
                    <br>
                    <tr>
                        <td style="text-align: right">
                            <h4 class="texto-Centro">Idioma:</h4>
                        </td>
                        <td>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" name="txt_NIdioma" placeholder="Escribe el idioma" id="txt_NIdioma" style="min-width: 240px; width:240;" required="">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: right">
                            <br>
                            <div class="texto-Centro">
                                <h4 class="texto-Centro">Factor de Idioma:</h4>
                            </div>
                        </td>
                        <td>
                            <br>
                            <div class="col-lg-6">
                                <input type="text" min="0" class="form-control" name="txt_NFactor" placeholder="Factor del idioma" id="txt_NFactor" style="min-width: 240px; width:240;" required="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding: 50px 0 0 0">
                            <div>
                                <input type="submit" class="btn " name="btn_Registrar" value="Guardar" id="btn_Registrar" style="min-width: 180px; width:180;">
                                <input type="hidden" name="org" value="addIdioma" id="org">
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

