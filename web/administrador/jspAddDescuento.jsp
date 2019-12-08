<%-- 
    Document   : jspDescuento
    Created on : 4/12/2019, 12:56:28 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="fondo-negro">
    <center >
        <div class="titulo">
            Descuento
        </div>
    </center>
</div>


<!-- CONTENIDO -->
<section class="m-content" style="min-width:600px">
    <center class="prz" style="padding-right:5px">
        <div class="texto2">

            <form method="post" action="administrador.do" id="formDesc">
                <table>
                    <tr align="center">
                        <td colspan="2" style="font-size: 22pt; background: #c9cc1b; text-shadow: none; border-radius: 50px;">
                            Crear descuento
                        </td>
                    </tr>
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
                        <td colspan="2">
                            <div id="error" style="text-align: center; color: red; font-weight: bold;"></div>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td align="right">
                            Razon: 
                        </td>
                        <td>
                            <input class="form-control" type="number" name="txtRazon" id="txtFactor" value="<% out.print((request.getAttribute("txtRazon")!=null)?request.getAttribute("txtRazon"):"");  %>" required>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Inicio:  
                        </td>
                        <td>
                            <input class="form-control" type="date" name="txtInicio" id="txtInicio" value="<% out.print((request.getAttribute("txtInicio")!=null)?request.getAttribute("txtInicio"):"");  %>" required>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Fin:  
                        </td>
                        <td>
                            <input class="form-control" type="date" name="txtFin" id="txtFin" value="<% out.print((request.getAttribute("txtFin")!=null)?request.getAttribute("txtFin"):"");  %>" required>
                        </td>
                    </tr>
                    <tr>
                        <td ></td>
                        <td align="right">
                            <input type="hidden" class="btn custom-btn" name="org" value="addDescuento" id="org">
                            <input class="btnY" type="button" name="btn_ModDescuento" value="Agregar" id="btn_Entrar" required>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </center>
</section>

<script language="javascript">
    document.getElementById("btn_Entrar").addEventListener("click", function () {
        var inicio = document.getElementById("txtInicio").value;
        var fin = document.getElementById("txtFin").value;
        var error = "";
        
        if(inicio>fin){
            error += "Error en las fechas<br>";
        }
        if (document.getElementById("txtFactor").value === "") {
            error += "No dejar campos vacios<br>";
        }
        else if(document.getElementById("txtFactor").value>10){
            error += "Introducir porcentajes<br>";
        }
        
        if(error===""){
            document.getElementById("formDesc").submit();
        }
       
        document.getElementById("error").innerHTML = error;

    });

</script>
