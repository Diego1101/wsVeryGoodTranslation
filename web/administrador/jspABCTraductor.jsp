<%-- 
    Document   : jspABCTraductor
    Created on : Dec 9, 2019, 12:23:29 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div class="fondo-negro">
    <center >
        <div class="titulo">
            Registro de Traductores
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
    <table>
      <tr>
        <td>
          Módulo:
        </td>
        <td style="padding: 15px">
          <select class="form-control"name="cmb_Modificacion" id="cmb_Modificacion">
            <option selected='selected'>Elige una opción</option>
            <option value="MDatos" id="MDatos">Registrar Traductor</option>
            <option value="MDescuento" id="MDescuento">Modificar Traductor</option>
            <option value="SProrroga" id="SProrroga">Baja Traductor</option>
          </select>
        </td>
        </tr>
        <tr>
        <td style="padding: 10px; text-align:center" colspan="2">
          <input type="button" class="btn" name="btnOpcion" value="Cargar módulo">
        </td>
      </tr>
      </table>
            <br>
      </center>
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
            </tr>
        </table>
    </center>
</section>

  <section >
    <!-- Dependiendo de lo que se seleccione se hará visible un div u otro -->
    <script type="text/javascript">
      $("#cmb_Modificacion").change(function() {
        var id = $(this).find("option:selected").attr("id");
        switch (id) {
          case "MDatos": // Modificar Datos
            alert('Opcion Modificar Datos');
            break;
          case "MDescuento": //Modificar Descuentos
            alert('Opcion Modificar Descuentos');
            break;
          case "SProrroga": //Solicitar Prroroga
          alert('Opcion Solicitar Prroroga');
            break;
        }
      });
    </script>
    </center>
  </section>
<hr>

<section class="m-content" style="padding-top: 0">
  <center class="mtr">
<div class="texto2" id="div_RegistrarTraduccion" style="background:none"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
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
            </td>
          </tr>
      </table>
    </div>
    <div class="texto2" id="div_ModificarTraduccion" style="background:none"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
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
        <div class="texto2" id="div_ModificarTraduccion" style="background:none"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
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
