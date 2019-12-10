<%-- 
    Document   : jspABCTraductor
    Created on : Dec 9, 2019, 12:23:29 PM
    Author     : migue
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form action="administrador.do" method="post" id="frmLoadI" name="frmLoadI">
    <input type="hidden" id="org" name="org" value="listTradutores">
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
             Traductores
        </div>
    </center>
</div>

<section class="m-content" style="min-width:300px;min-height:80px;">
    <center> <h4 style="font-weight:lighter;"> Traductores registrados</h4>
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
        <table class="tRep" style="min-widht:100px">
            <tr>
                <td>
                    <h5 >Nombre</h5>
                </td>
                <td>
                    <h5>Correo Electrónico</h5>
                </td>
                <td>
                    <h5>Teléfono</h5>
                </td>
                <td>
                    <h5>
                        Estatus</h5>
                </td>
                <td>
                    <h5>
                        Seleccionar</h5>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <%
                if (request.getAttribute("traductores") != null) {

                    ResultSet rs = (ResultSet) request.getAttribute("traductores");

                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getString(3) + "</td>");
                        out.print("<td>" + rs.getString(4).split(" ")[0] + "</td>");
                        if (rs.getString(5).toString().equals("1")) {
                                out.print("<td>" + "Activo" + "</td>");
                            }else{
                            out.print("<td>" + "Inactivo" + "</td>");
                        }
                       out.println("<td style='text-align:center;'>" + "<input type='button' class='btn' name='button' onclick='llenarDatos(this);' value='+ ' style='width: 65px;' name='btnSeleccion' id='rs.getString(1)'>"+"</td>");
                      out.println("<input style='display: none' type='text' name='Confrimartxt' id='SeleccionarTraductor' value='"+rs.getString(1)+"'>");
                      out.print("</tr>");
                    }

                }
            %>
            </tr>
        </table>
      </center>
</section>

  <section >
    <!-- Dependiendo de lo que se seleccione se hará visible un div u otro -->
     <script type="text/javascript">
      function aparecerModulo() {
           var operation = document.getElementById("cmb_Modificacion").value;
            var div1 = document.getElementById("div_RegistrarTraductor");
            var div2 = document.getElementById("div_ModificarTraductor");
            var div3 = document.getElementById("div_BajaTraductor");
        if (operation=="RTraductor" ){
               
            div1.style.display = "block";
            div2.style.display = "none";
            div3.style.display = "none";
            
         }
         if (operation=="MTraductor" ){
            div1.style.display = "none";
            div2.style.display = "block";
            div3.style.display = "none";
        }    
     if (operation=="BTraductor" ){
            div1.style.display = "none";
            div2.style.display = "none";
            div3.style.display = "block";
    } 
    if (operation=="Default") {
             div1.style.display = "none";
            div2.style.display = "none";
            div3.style.display = "none";
}
    
}
    </script>
           
            <hr>
       <center>
    <div id="div_ClienteSeleccionar" class="texto2" style="background-color: #fff; display: none;" >
     <table style="background:#eee; overflow: hidden; ">
      <tr>
        <td colspan="2">
          Cliente Seleccionado
        </td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Nombre:
          </td>
          <td>
              <label style="line-height: 0;" name="lbl_NombreSeleccionado" id="lbl_NombreSeleccionado">---</label> 
          </td>
          <td align="right" class="texto-Centro">
            Clave:
          </td>
          <td>
              <label style="line-height: 0;" name="lbl_ClaveSeleccionado" id="lbl_ClaveSeleccionado">---</label> 
          </td>
        </tr>
      </table>
            </div>
    </center>
   
    <center>

    <div id="div_Seleccionar">
     <table>
      <tr>
        <td>
          Módulo:
        </td>
        <td style="padding: 15px">
            <select class="form-control"name="cmb_Modificacion" id="cmb_Modificacion" onchange="aparecerModulo()">
            <option selected='selected'>Elige una opción</option>
            <option value="RTraductor" id="RTraductor">Registrar Traductor</option>
            <option value="MTraductor" id="MTraductor">Modificar Traductor</option>
            <option value="BTraductor" id="BTraductor">Baja Traductor</option>
          </select>
        </td>
        </tr>
      </table>
            </div>
    </center>
  </section>


<section class="m-content" style="padding-top: 0">
  <center class="mtr">
<div class="texto2" id="div_RegistrarTraductor" style="background:none; display: none;">
    <form method="post" action="administrador.do" id="formTrad">
    <h4> Registrar Traductor</h4>
      <table>
        <tr>
          <td align="right" class="texto-Centro">
            Nombre:
          </td>
          <td>
              <input type="text" class="form-control" name="txt_Nombre" placeholder="Nombre del traductor" id="txt_Nombre" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Apellido:
          </td>
          <td>
              <input type="text" class="form-control" name="txt_Apellido" placeholder="Apellido" id="txt_Apellido" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Correo Electrónico:
          </td>
          <td>
              <input type="email" class="form-control" name="txt_CorreoElectronico" placeholder="Correo" id="txt_CorreoElectronico" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Teléfono:
          </td>
          <td>
              <input type="text" class="form-control" name="txt_Telefono" placeholder="Teléfono" id="txt_Telefono" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Dirección:
          </td>
          <td>
              <input type="text" class="form-control" name="txt_Direccion" placeholder="Dirección" id="txt_Direccion" style="min-width: 240px; width:240;">
          </td>
        </tr>
          <tr align="center">
            <td colspan="2">
                <input type="submit" class="btn" name="btn_Registrar" value="Registrar" id="btn_Registrar">
                <input type="hidden" name="org" value="addTraductor" id="org">
            </td>                          
          </tr>
      </table>
    </form>
    </div>
    <div class="texto2" id="div_ModificarTraductor" style="background:none;display: none;"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
        <h4> Modificar Traductor</h4>
          <table>
            <tr>
              <td align="right" class="texto-Centro">
                Idiomas:
              </td>
              <td>
                    <input type="submit" class="btn" name="btn_ModificarIdiomas" value="Modificar Idiomas" id="btn_ModificarIdiomas">
              </td>
            </tr>
            <tr>
              <td align="right" class="texto-Centro">
                Nombre:
              </td>
              <td>
                 <label style="line-height: 0;" name="lbl_IdiomaOrigen" id="lbl_IdiomaOrigen">---</label> <!-- Tiene que aparecer el nombre que se selecciono  -->
              </td>
            </tr>
            <tr>
              <td align="right" class="texto-Centro">
                Correo Electrónico:
              </td>
              <td>
                  <input type="email" class="form-control" name="txt_CorreoElectronico" placeholder="Correo" id="txt_CorreoElectronico" style="min-width: 240px; width:240;">
              </td>
            </tr>
            <tr>
              <td align="right" class="texto-Centro">
                Teléfono:
              </td>
              <td>
                  <input type="text" class="form-control" name="txt_Telefono" placeholder="Teléfono" id="txt_Telefono" style="min-width: 240px; width:240;">
              </td>
            </tr>
            <tr>
              <td align="right" class="texto-Centro">
                Dirección:
              </td>
              <td>
                  <input type="text" class="form-control" name="txt_Direccion" placeholder="Dirección" id="txt_Direccion" style="min-width: 240px; width:240;">
              </td>
            </tr>
                <tr align="center">
                  <td colspan="2">
                      <input type="submit" class="btn" name="btn_Modificar" value="Modificar" id="btn_Modificar">
                  </td>
                </tr>

          </table>
        </div>
        <div class="texto2" id="div_BajaTraductor" style="background:none;display: none;"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
            <h4> Baja Traductor</h4>
              <table>
                <tr>
                  <td align="center" class="texto-Centro">
                    Nombre: <label style="line-height: 0;" name="lbl_IdiomaOrigen" id="lbl_IdiomaOrigen">---</label> <!-- Tiene que aparecer el nombre que se selecciono  -->
                  </td>
                </tr>
                <tr>
                  <td align="center" class="texto-Centro">
                      Correo Electrónico: <label style="line-height: 0;" name="lbl_IdiomaOrigen" id="lbl_IdiomaOrigen">---</label> <!-- Tiene que aparecer el nombre que se selecciono  -->
                  </td>
                </tr>
                <tr>
                  <td align="center" class="texto-Centro">
                      Dirección: <label style="line-height: 0;" name="lbl_IdiomaOrigen" id="lbl_IdiomaOrigen">---</label> <!-- Tiene que aparecer el nombre que se selecciono  -->
                  </td>
                </tr>
                  </tr>
                    <tr align="center">
                      <td colspan="2">
                          <input type="submit" class="btn" name="btn_DarBaja" value="Dar de baja" id="btn_DarBaja">
                      </td>
                    </tr>

              </table>
            </div>
    </center>
    </section>
      <script type="text/javascript">
      function llenarDatos() {
        var div1 = document.getElementById("div_ClienteSeleccionar");
        if (!$('#div_ClienteSeleccionar').css('display') == 'none') {
             div1.style.display = "none";
        }else{
             div1.style.display = "block";
            }
        let id = this.id;
        var Row = document.getElementById("somerow");
        var Cells = Row.getElementsByTagName("td");
       alert(Cells[0].innerText);
        document.getElementById('lbl_NombreSeleccionado').innerText = 'adas';
                }

    </script>
    
