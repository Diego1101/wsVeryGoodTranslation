<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<form action="administrador.do" method="post" id="frmLoadP" name="frmLoadP">
    <input type="hidden" id="org" name="org" value="loadPrecio">
</form>

<%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("frmLoadP").submit();
</script>
<%
    }
%>



<!-- TITULO -->

<div class="fondo-negro">
    <center >
        <div class="titulo">
            Precio
        </div>
    </center>
</div>


<!-- CONTENIDO -->
<section class="m-content" style="min-width:600px">
    <center class="prz" style="padding-right:5px">
        <div class="texto">
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
                <tr align="center">
                    <td colspan="2" style="font-size: 22pt; background: #672988; text-shadow: none; border-radius: 50px;">
                        Precio actual
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td align="right">
                        Estandar:
                    </td>
                    <td>
                        <input class="form-control" type="text" name="txtPrecioE" id="txtPrecioE" value="<% out.print((request.getAttribute("txtPrecioE")!=null)?request.getAttribute("txtPrecioE"):"");  %>">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Certificada:
                    </td>
                    <td>
                        <input class="form-control" type="text" name="txtPrecioC" id="txtPrecioC" value="<% out.print((request.getAttribute("txtPrecioC")!=null)?request.getAttribute("txtPrecioC"):"");  %>">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Premium:
                    </td>
                    <td>
                        <input class="form-control" type="text" name="txtPrecioP" id="txtPrecioP" value="<% out.print((request.getAttribute("txtPrecioP")!=null)?request.getAttribute("txtPrecioP"):"");  %>">
                    </td>
                </tr>
                <tr>
                    <td ></td>
                    <td align="right">
                        <input class="btnY" type="submit" name="btn_ModPrecio" value="Modificar" id="btn_Entrar">
                    </td>
                </tr>
            </table>
        </div>
        <hr style="margin: 50px 0;">

        <div>
            <center> <h4 style="font-weight:lighter;"> Descuentos</h4> </center>
            <center> <a href="index.jsp?op=jspAddDescuento.jsp"> Agregar descuento </a>  </center>
            <center class="rs encabezadoTabla">

                <table class="tdesc">
                    <tr>
                        <td class="Dmod"></td>
                        <td>
                            <h5>Cve</h5>
                        </td>
                        <td>
                            <h5>Tipo</h5>
                        </td>
                        <td>
                            <h5>Razon</h5>
                        </td>
                        <td>
                            <h5>Inicio</h5>
                        </td>
                        <td>
                            <h5>Fin </h5>
                        </td>
                        <td>
                            <h5>Registro</h5>
                        </td>
                    </tr>
                        <%
                            if(request.getAttribute("desc")!=null){
                                List<String[]> desc=(List<String[]>)request.getAttribute("desc");
                        System.out.println("Hi: "+desc.size());
                        for(String[] f:desc){
                            %>
                            <tr>
                                <td class="Dmod"><a href="index.jsp?op=jspModDescuento.jsp&id=<%=f[0]%>"> Modificar </a></td>
                                <td><%=f[0]%></td>
                                <td><%=f[1]%></td>
                                <td><%=f[2]%></td>
                                <td><%=(f[3]).split(" ")[0]%></td>
                                <td><%=(f[4].split(" ")[0])%></td>
                                <td><%=f[5].split(" ")[0]%></td>
                                
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
