<%-- 
    Document   : jspRegistrarTraduAdmin
    Created on : Dec 8, 2019, 5:58:08 PM
    Author     : migue
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<div class="fondo-negro">
    <center >
        <div class="titulo">
            Registrar Traducción
        </div>
    </center>
</div>

<section class="m-content" style="min-width:700px">
    <center class="prz">
        <div class="texto2" style="background: none;" id="div_Cliente">
            <form method="post" action="administrador.do">
                <table>
                    <tr align="center">
                        <td colspan="2" style="font-size: 20pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
                            Datos del cliente
                        </td>
                    </tr>
                    <%
                        if (request.getAttribute("edoC") != null) {
                    %>
                    <tr>
                        <td>
                            <div id="error" style="font-size: 1rem;">
                                <%=request.getAttribute("edoC")%>
                            </div>

                        </td>
                    </tr>
                    <%
                        }
                    %>

                    <tr>
                        <td  align="right">
                            Nombre:
                        </td>
                        <td>
                            <input type="text" class="form-control" name="txt_Nombre" id="txt_Nombre" value="<% out.print((request.getAttribute("txt_Nombre") != null) ? request.getAttribute("txt_Nombre") : "");  %>" required="" <% out.print((request.getAttribute("id") != null) ? "readonly=''" : "");  %>>
                        </td>
                    </tr>
                    <tr>
                        <td  align="right">
                            Apellidos:
                        </td>
                        <td>
                            <input type="text" class="form-control" name="txt_Apellido" id="txt_Apellido" value="<% out.print((request.getAttribute("txt_Apellido") != null) ? request.getAttribute("txt_Apellido") : "");  %>" required="" <% out.print((request.getAttribute("id") != null) ? "readonly=''" : "");  %>>
                        </td>
                    </tr>
                    <tr>
                        <td  align="right">
                            Teléfono:
                        </td>
                        <td>
                            <input type="text" class="form-control" name="txt_Telefono" id="txt_Telefono" value="<% out.print((request.getAttribute("txt_Telefono") != null) ? request.getAttribute("txt_Telefono") : "");  %>" required="" <% out.print((request.getAttribute("id") != null) ? "readonly=''" : "");  %>>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Correo electrónico:
                        </td>
                        <td >
                            <input type="email" class="form-control" name="txt_Email" id="txt_Email" value="<% out.print((request.getAttribute("txt_Email") != null) ? request.getAttribute("txt_Email") : "");  %>" required="" <% out.print((request.getAttribute("id") != null) ? "readonly=''" : "");  %>>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <input type="hidden" name="org" value="regCliente" id="org">
                            <input type="submit" class="btn" name="btn_Registrar" value="Registrar" id="btn_Registrar" <% out.print((request.getAttribute("id") != null) ? "disabled='true'" : "");  %>>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </center>
</section>
<hr>


<form action="multipart.do" method="post" enctype="multipart/form-data" id="frmRegTrad">
    <div id="registrarTrad" style="display: none">
        <section class="m-content" style="min-width:700px">
            <center class="prz">
                <h3>Registro traduccion</h3>
                <div class="texto2">
                    <table>
                        <tr align="center">
                            <td colspan="2" style="font-size: 19pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
                                Idioma
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <div id="men">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td  align="right">
                                Origen:
                            </td>
                            <td>
                                <select class="form-control" name="cmb_IdiomaOrigen" id="cmb_IdiomaOrigen" onchange="cambioCombo()">
                                    <%
                                        if (request.getAttribute("idiomas") != null) {

                                            List<String[]> rs = (List<String[]>) request.getAttribute("idiomas");
                                            for (String[] aux : rs) {
                                                out.print("<option value=" + aux[0] + ">" + aux[1] + "</option>");
                                            }
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td  align="right">
                                Destino:
                            </td>
                            <td>
                                <select class="form-control" name="cmb_IdiomaDestino" id="cmb_IdiomaDestino" onchange="cambioCombo()">
                                    <%
                                        if (request.getAttribute("idiomas") != null) {

                                            List<String[]> rs = (List<String[]>) request.getAttribute("idiomas");
                                            for (String[] aux : rs) {
                                                out.print("<option value=" + aux[0] + ">" + aux[1] + "</option>");
                                            }
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Traductor:
                            </td>

                            <td>
                                <div id='contTraductor' class="contTraductor">
                                    <select class="form-control"name="cmb_Traductor" id="cmb_Traductor" readonly>
                                        <option>Selecciona el traductor</option>
                                    </select>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Vendedor:
                            </td>

                            <td>
                                <select class="form-control"name="cmb_Vendedor" id="cmb_Vendedor">
                                    <%
                                        if (request.getAttribute("vendedores") != null) {

                                            List<String[]> v = (List<String[]>) request.getAttribute("vendedores");
                                            for (String[] aux : v) {
                                                out.print("<option value=" + aux[0] + ">" + aux[1] + "</option>");
                                            }
                                        }
                                    %>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Tipo Traducción:
                            </td>
                            <td>
                                <select class="form-control" name="cmb_TipoTraducion" id="cmb_TipoTraducion">
                                    <option value='1'>Estandar</option>
                                    <option value='1'>Certificada</option>
                                    <option value='2'>Premium</option>

                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </center>

            <center class="prz">
                <div class="texto2" style="background: none;">
                    <table>
                        <tr align="center">
                            <td colspan="2" style="font-size: 19pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
                                Documento
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ubicación:
                            </td>
                            <td align="center">
                                <input type="file" name="fluArchivo" id="fluArchivo"/>
                                <label for="fluArchivo">Sube un archivo</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ruta:
                            </td>
                            <td>
                                <label for="" id=lbl_Ruta> -- </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Número de palabras:
                            </td>
                            <td>
                                <input type="number" class="form-control" min="10" name="txt_CantidadPalabras" id="txt_CantidadPalabras"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Fecha de entrega:
                            </td>
                            <td>
                                <input type="date" class="form-control" name="txt_FechaEntrega" id="txt_FechaEntrega">
                            </td>
                        </tr>
                    </table>
                </div>

                <input type="hidden" name="idCli" value="<% out.print((request.getAttribute("id") != null) ? request.getAttribute("id").toString() : "");  %>" id="idCli">
                <input type="hidden" name="estado" value="0" id="estado">
                <input type="hidden" name="org" value="regTraduccion" id="org">
                <input type="button" class="btn" name="btn_RegistrarT" value="Registrar" id="btn_RegistrarT">
            </center>
        </section>
        <script type="text/javascript">

            function aparecerModulo() {
                // Primero se tienen que mandar los datos de la traduccion y si se registro bien entonces mostrara el desglose
                var div1 = document.getElementById("div_Desglose");
                if (div1.style.display === "none") {

                    div1.style.display = "block";
                }

            }
        </script>
        <hr>

        <!-- 
        <div id="div_Desglose" style="display: none;">

            <section class="m-content" style="min-width:700px;">
                <center class="trd">
                    <div  style="min-width:700px;" >
                        <table>
                            <tr>
                                <td align="right" style="font-size:16pt;">
                                    Descuento: $
                                </td>
                                <td >
                                    <input type="text" class="form-control"  name="txt_CodigoDescuento" id="txt_CodigoDescuento" style="width: 180px;" width="150px;"/>
                                </td>

                            </tr>
                            <tr>
                                <td></td>
                                <td align="center" >
                                    <input type="submit" class="btn" name="btn_AplicarDescuento" value="Aplicar" id="btn_AplicarDescuento" style="align-items: left;">
                                </td>
                            </tr>

                        </table>
                        <table style="margin:20px">
                            <tr align="center">
                                <td colspan="2" style="font-size: 19pt; background: none; font-weight: bold; text-shadow: none; border-radius: 50px;">
                                    Desglose
                                </td>
                            </tr>

                            <tr>
                                <td align="right" style="font-size:16pt;">
                                    Descuento:
                                </td>
                                <td style="background: #eee; padding: 10px 20px 10px 10px">
                                    <label id="lblDescuento" name="lblDescuento"style="line-height: 0;">--</label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="font-size:16pt;">
                                    Subtotal:
                                </td>
                                <td style="background: #eee; padding: 10px 20px 10px 10px">
                                    <label id="lblSubtotal" name="lblSubtotal"style="line-height: 0;">--</label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="font-size:16pt;">
                                    IVA:
                                </td>
                                <td style="background: #eee; padding: 10px 20px 10px 10px">
                                    <label id="lblIva" name="lblIva" style="line-height: 0;">--</label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="font-size:16pt;">
                                    Total:
                                </td>
                                <td style="background: #ccc; padding: 10px 20px 10px 10px; color:#000;">
                                    <label id="lblTotal" name="lblTotal"style="line-height: 0;">--</label>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr align="center">
                                <td colspan="2" style="background:none">
                                    <input type="submit" class="btn" name="btn_Confirmar" value="Confirmar" id="btn_Confirmar">
                                </td>
                            </tr>
                        </table>
                    </div>
                </center>
            </section>
        </div>
        -->
    </div>
</form>

<%
    if (request.getAttribute("id") != null) {
        System.out.println("Hellos");
%>

<script languaje="javascipt">
    document.getElementById("registrarTrad").style.display = "block";
    document.location.href = "#registrarTrad";
</script>

<%
    }
%>

<script language='javascript'>
    function cambioCombo() {
        var destino = document.getElementById("cmb_IdiomaDestino").value;
        var origen = document.getElementById("cmb_IdiomaOrigen").value;
        if (destino === origen) {
            document.getElementById("men").innerHTML = "Origen y destino no pueden ser iguales";
            document.getElementById("cmb_Traductor").readonly = "readonly";
            document.getElementById("estado").value = "0";

        } else {
            document.getElementById("men").innerHTML = "";
            document.getElementById("estado").value = "1";
            mostrarTraductores(origen, destino);
        }
    }

    function mostrarTraductores(origen, destino) {
        //document.getElementById("dpEspecialidad").addEventListener("change", function () {
        var self = this;
        httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = function () {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    var div = document.createElement('div');
                    div.innerHTML = (httpRequest.responseText).trim();
                    document.getElementsByClassName('contTraductor')[0].innerHTML = div.getElementsByClassName('contTraductor')[0].innerHTML;
                }
            }
        };
        httpRequest.open('GET', 'http://localhost:8080/wsVeryGoodTranslation/administrador.do?org=listTrad&orgI=' + origen + '&des=' + destino);
        httpRequest.send();
        //});

    }

    document.getElementById('fluArchivo').addEventListener("change", function () {
        var ruta = document.getElementById('fluArchivo').value.split("\\");
        document.getElementById("lbl_Ruta").innerHTML = ruta[ruta.length - 1];
    });


    document.getElementById('btn_RegistrarT').addEventListener("click", function () {
        var palabras = document.getElementById("txt_CantidadPalabras").value;
        var error = "";
        if (palabras === "")
            error += "Ingresar las palabras<br>";
        else if (!parseInt(palabras))
            error += "Ingresar las palabras<br>";

        if (document.getElementById("fluArchivo").value === "")
            error += "Seleccionar un archivo<br>";

        if (document.getElementById("txt_FechaEntrega").value === "")
            error += "Seleccionar la fecha de entrega<br>";

        if (document.getElementById("estado").value === "0")
            error += "Seleccionar idiomas<br>";

        if (error === "") {
            document.getElementById("frmRegTrad").submit();
        } else {
            document.getElementById("men").innerHTML = error;
        }
        document.location.href = "#registrarTrad";
        /*
         if (palabras !== "") {
         if (document.getElementById("estado").value === "1" && parseInt(palabras)) {
         calcularDesglose();
         //aparecerModulo();
         } else {
         document.getElementById("div_Desglose").style.display = "none";
         alert("Selecciona los idiomas y el numero de palabras");
         }
         } else {
         document.getElementById("div_Desglose").style.display = "none";
         alert("Selecciona los idiomas y el numero de palabras");
         }*/
    });

    function calcularDesglose() {

    }
</script>