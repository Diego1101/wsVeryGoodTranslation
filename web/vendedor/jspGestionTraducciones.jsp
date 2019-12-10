<%@page import="modelo.modTraduccion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<form action="traducciones.do" method="post" id="frmLoadMod" name="frmLoadMod">
    <input type="hidden" id="org" name="org" value="loadModTradV">
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
    document.getElementById("frmLoadMod").submit();
</script>
<%
    }
%>

<div class="fondo-negro">
    <center >
        <div class="titulo">
            Gestión de traducciones
        </div>
    </center>
</div>

<section style="padding: 40px">
    <center>
        <table>
            <%
                if (request.getAttribute("edo") != null) {
            %>
            <div id="error">
                <%=request.getAttribute("edo")%>
            </div>
            <%
                }
            %>
            <%
                if (request.getAttribute("sel") != null) {
            %>
            <tr>
                <td>
                    Módulo:
                </td>
                <td style="padding: 15px">
                    <select class="form-control"name="cmb_Modificacion" id="cmb_Modificacion">
                        <option selected='selected' value="Default" id="Default">Elige una opción</option>
                        <option value="MDatos" id="MDatos">Modificar Datos</option>
                        <option value="MDescuento" id="MDescuento">Modificar Descuento</option>
                        <option value="SProrroga" id="SProrroga">Solicitar prórroga</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="padding: 10px; text-align:center" colspan="2">
                    <input type="button" class="btn" name="btnOpcion" value="Cargar módulo" onclick="aparecerModulo()">
                </td>
            </tr>
            <%
                }
            %>

        </table>
        <hr>
        <!-- Dependiendo de lo que se seleccione se hará visible un div u otro -->
        <script type="text/javascript">
            function aparecerModulo() {
                var operation = document.getElementById("cmb_Modificacion").value;
                var div1 = document.getElementById("div_ModificarDatos");
                var div2 = document.getElementById("div_ModificarDescuento");
                var div3 = document.getElementById("div_SolicProrroga");
                if (operation == "MDatos") {

                    div1.style.display = "block";
                    div2.style.display = "none";
                    div3.style.display = "none";

                }
                if (operation == "MDescuento") {
                    div1.style.display = "none";
                    div2.style.display = "block";
                    div3.style.display = "none";
                }
                if (operation == "SProrroga") {
                    div1.style.display = "none";
                    div2.style.display = "none";
                    div3.style.display = "block";
                }
                if (operation == "Default") {
                    div1.style.display = "none";
                    div2.style.display = "none";
                    div3.style.display = "none";
                }

            }
        </script>
    </center>
</section>
<section class="m-content" style="padding-top: 0">
    <center class="mtr">
        <div class="rs" style="background:none;">
            <table class="tRep">
                <tr>
                    <td>
                        Cliente
                    </td>
                    <td>
                        Correo
                    </td>
                    <td>
                        Tipo traduccion
                    </td>
                    <td>
                        Estatus
                    </td>
                    <td>
                        Idioma Destino
                    </td>
                    <td>
                        Idioma Origen
                    </td>
                    <td>
                        Fecha Entrega
                    </td>
                    <td>
                        Seleccionar
                    </td>
                </tr>
                <%
                    if (request.getAttribute("trad") != null) {
                        List<String[]> trad = (List<String[]>) request.getAttribute("trad");
                        List<String[]> idiomas = (List<String[]>) request.getAttribute("idiomas");
                        for (String[] aux : trad) {
                            String claass = "";
                            if (request.getAttribute("sel") != null) {
                                if (request.getAttribute("sel").toString().equals(aux[0])) {
                                    claass = "selected";
                                }
                            }
                %>
                <tr class="<%=claass%>">
                    <td><%=aux[1]%></td>
                    <td><%=aux[2]%></td>
                    <td><%=aux[5]%></td>
                    <td><%=aux[4]%></td>
                    <td><%
                        for (String[] aux1 : idiomas) {
                            if (aux1[0].equals(aux[7])) {
                                out.println(aux1[1]);
                            }
                        }
                        %></td>
                    <td><%
                        for (String[] aux1 : idiomas) {
                            if (aux1[0].equals(aux[6])) {
                                out.println(aux1[1]);
                            }
                        }
                        %></td>
                    <td><%=aux[3].split(" ")[0]%></td>
                    <td>
                        <form method="post" action="traducciones.do">
                            <input type="hidden" name="idS" value="<%=aux[0]%>" id="idS">
                            <input type="hidden" name="org" value="modTradSelV" id="org">
                            <input type="submit" class="btn" name="button" value="+" style="width: 65px;" id="btnSeleccion">
                        </form>
                    </td>
                </tr>


                <%
                        }
                    }
                %>

            </table>
        </div>
        <br>
        <hr>

        <form method="post" action="traducciones.do">
            <div class="texto2" style="background:none; display:none; " id="div_ModificarDatos"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
                <h4> Modificar Datos</h4>
                <h5> Datos Traduccion</h5>
                <table>
                    <tr>
                        <td align="right">
                            <h4 class="texto-Centro">Idioma original:</h4>
                        </td>
                        <td>
                            <select class="form-control" style="color:#6b6b6b;"  name="cmb_IdiomaOrigen" id="cmb_IdiomaOrigen" style="width:240;">
                                <%
                                    if (request.getAttribute("idiomas") != null && request.getAttribute("tra") != null) {
                                        List<String[]> listI = (List<String[]>) request.getAttribute("idiomas");
                                        modTraduccion traduccion = (modTraduccion) request.getAttribute("tra");
                                        for (String[] aux : listI) {
                                            if (traduccion.getCveIdiomaOrigen() == Integer.parseInt(aux[0])) {
                                                out.print("<option value='" + aux[0] + "' selected>" + aux[1] + "</option>");
                                            } else {
                                                out.print("<option value='" + aux[0] + "'>" + aux[1] + "</option>");
                                            }

                                        }
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <h4  class="texto-Centro">Idioma Destino:</h4>
                        </td>
                        <td>
                            <select class="form-control" style="color:#6b6b6b;"  name="cmb_IdiomaDestino" id="cmb_IdiomaDestino" style="width:240;">
                                <%
                                    if (request.getAttribute("idiomas") != null && request.getAttribute("tra") != null) {
                                        List<String[]> listI = (List<String[]>) request.getAttribute("idiomas");
                                        modTraduccion traduccion = (modTraduccion) request.getAttribute("tra");
                                        for (String[] aux : listI) {
                                            if (traduccion.getCveIdiomaDestino() == Integer.parseInt(aux[0])) {
                                                out.print("<option value='" + aux[0] + "' selected>" + aux[1] + "</option>");
                                            } else {
                                                out.print("<option value='" + aux[0] + "'>" + aux[1] + "</option>");
                                            }

                                        }
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <h4  class="texto-Centro">Tipo de Traducción:</h4>
                        </td>
                        <td>
                            <select class="form-control" style="color:#6b6b6b;"  name="cmb_TipoTraducion" id="cmb_TipoTraducion" style="width:240;">
                                <%
                                    if (request.getAttribute("tra") != null) {
                                        modTraduccion traduccion = (modTraduccion) request.getAttribute("tra");
                                %>
                                <option value="1" <%out.print(traduccion.getCveTipoTrad() == 1 ? "selected" : "");%>>Estandar</option>
                                <option value="2" <%out.print(traduccion.getCveTipoTrad() == 2 ? "selected" : "");%>>Certificada</option>
                                <option value="3" <%out.print(traduccion.getCveTipoTrad() == 3 ? "selected" : "");%>>Premium</option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <h4  class="texto-Centro">Estatus:</h4>
                        </td>
                        <td>
                            <select class="form-control" style="color:#6b6b6b;"  name="cmb_Estatus" id="cmb_Estatus" style="width:240;">
                                <%
                                    if (request.getAttribute("tra") != null) {
                                        modTraduccion traduccion = (modTraduccion) request.getAttribute("tra");
                                %>
                                <option value="0" <%out.print(traduccion.getStatus() == 0 ? "selected" : "");%>>Pendiente</option>
                                <option value="1" <%out.print(traduccion.getStatus() == 1 ? "selected" : "");%>>Cotizacion enviada</option>
                                <option value="2" <%out.print(traduccion.getStatus() == 2 ? "selected" : "");%>>Iniciada</option>
                                <option value="3" <%out.print(traduccion.getStatus() == 3 ? "selected" : "");%>>Terminada</option>
                                <option value="4" <%out.print(traduccion.getStatus() == 4 ? "selected" : "");%>>Enviada</option>
                                <option value="5" <%out.print(traduccion.getStatus() == 5 ? "selected" : "");%>>Cancelada</option>
                                <%
                                    }
                                %>

                            </select>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr style="text-align:center">
                        <td colspan="4">
                            <input type="hidden" name="org" value="modDatosTradV" id="org">
                            <input type="hidden" name="idTrad" value="<% out.print((request.getAttribute("sel") != null) ? request.getAttribute("sel") : "");%>" id="idTrad">
                            <input type="submit" class="btn" name="btn_Modificar" value="Modificar" id="btn_Modificar" style="width: 172px">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <br>
        <div class="texto2" style="background:none;display: none;" id="div_ModificarDescuento"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
            <h4 class="texto-tabla"> Modificar Descuento</h4>
            <form method="post" action="traducciones.do">
                <table>
                    <tr>
                        <td align="center" colspan="5">
                            <h5  > Datos Actuales</h5>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="mensaje"></div>
                            <h4 class="texto-Centro">Descuento</h4>
                        </td>
                        <td>
                             
                            <input type="hidden" id="txt_Descuento" name="txt_Descuento" value="<% out.print((request.getAttribute("tra") != null) ? ((modTraduccion) request.getAttribute("tra")).getDescuento() : "");%>"
                                   <h4><label class="texto-Centro" for="" id="lbl_Descuento">$<% out.print((request.getAttribute("tra") != null) ? ((modTraduccion) request.getAttribute("tra")).getDescuento() : "");%></label></h4>
                        </td>
                        <td>
                            <h4 class="texto-Centro" style="padding-left:10px;">Descuento</h4>
                        </td>
                        <td>
                            <select class="form-control" style="color:#6b6b6b;"  name="cmd_Descuento" id="cmd_Descuento" style="width:240;">
                                <%
                                    if (request.getAttribute("descuentos") != null && request.getAttribute("tra") != null) {
                                        List<String[]> listI = (List<String[]>) request.getAttribute("descuentos");
                                        modTraduccion traduccion = (modTraduccion) request.getAttribute("tra");
                                        for (String[] aux : listI) {
                                            if (traduccion.getCveDescuento()== Integer.parseInt(aux[0])) {
                                                out.print("<option value='" + aux[0] + "' selected>" + Float.parseFloat(aux[2])*100 + "%</option>");
                                            } else {
                                                out.print("<option value='" + aux[0] + "'>" + Float.parseFloat(aux[2])*100 + "%</option>");
                                            }

                                        }
                                    }
                                %>
                            </select>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4 class="texto-Centro">Subtotal</h4>
                        </td>
                        <td>
                            <h4><label class="texto-Centro" for="" id="lbl_Subtotal">$<% out.print((request.getAttribute("tra") != null) ? ((modTraduccion) request.getAttribute("tra")).getSubtotal() : "");%></label></h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4 class="texto-Centro">Iva</h4>
                        </td>
                        <td>
                            <h4><label class="texto-Centro" for="" id="lbl_Iva">$<% out.print((request.getAttribute("tra") != null) ? ((modTraduccion) request.getAttribute("tra")).getIva() : "");%></label></h4>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <h4 class="texto-Centro">Total Traducción</h4>
                        </td>
                        <td>
                            <input type="hidden" id="txt_Total" value="<% out.print((request.getAttribute("tra") != null) ? ((modTraduccion) request.getAttribute("tra")).getTotal() : "");%>">
                            <h4><label class="texto-Centro" for="" id="lbl_Total">$<% out.print((request.getAttribute("tra") != null) ? ((modTraduccion) request.getAttribute("tra")).getTotal() : "");%></label></h4>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr align="center">
                        <td colspan="5">
                            <input type="hidden" name="idTradD" value="<% out.print((request.getAttribute("sel") != null) ? request.getAttribute("sel") : "");%>" id="idTradD">
                            <input type="hidden" name="org" value="modDescuentoTradV" id="org">
                            <input type="submit" class="btn" name="btn_Confirmar" value="Confirmar" id="btn_Confirmar">
                        </td>
                    </tr>
                </table>
            </form>
            <br>
        </div>
        <div class="texto2" style="background:none;display: none;" id="div_SolicProrroga"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
            <h4> Solicitar Prórroga</h4>
            <form action="traducciones.do" method="post">
                <table>
                    <tr>
                        <td align="right" class="texto-Centro">
                            Fecha de entrega:
                        </td>
                        <td>
                            <label for="" id="lbl_FechaEntrega"> <% out.print((request.getAttribute("tra") != null) ? ((modTraduccion) request.getAttribute("tra")).getFechaEntrega().split(" ")[0] : "");%> </label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="texto-Centro">
                            Nueva fecha de entrega:
                        </td>
                        <td>
                            <input type="date" class="form-control" name="txt_FechaEntrega" id="txt_FechaEntrega" >
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="hidden" name="idTradP" value="<% out.print((request.getAttribute("sel") != null) ? request.getAttribute("sel") : "");%>" id="idTradP">
                            <input type="hidden" name="org" value="prorrogaTradV" id="org">
                            <input type="submit" class="btn" name="btn_Modificar" value="Modificar" id="btn_Modificar">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </center>
</section>

<script language="javascript">
    document.getElementById("btn_ModificarD").addEventListener("click", function () {
        var descuento = document.getElementById("ctxt_Descuento").value;
        if (parseInt(descuento)) {
            var total = document.getElementById("txt_Total").value;

            if ((total - descuento) < 0) {
                document.getElementById("txt_Descuento").value = 0;
                document.getElementById("mensaje").value = "El descuento no puede ser mayor que el precio";
            } else {
                document.getElementById("txt_Descuento").value = descuento;
                document.getElementById("lbl_Descuento").innerHTML = "$" + descuento;
                document.getElementById("lbl_Total").innerHTML = "$" + (total - descuento);
            }
        } else {
            descuento = 0;
            var total = document.getElementById("txt_Total").value;
            document.getElementById("lbl_Descuento").innerHTML = "$" + descuento;
            document.getElementById("lbl_Total").innerHTML = "$" + (total - descuento);
        }
    });
</script>