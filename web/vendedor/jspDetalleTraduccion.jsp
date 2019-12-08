<%-- 
    Document   : jspDetalleTraduccion
    Created on : Dec 6, 2019, 10:47:12 AM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div class="fondo-negro">
    <center>
      <div class="titulo">
        Detalles Traducción
      </div>
    </center>
  </div>

  <section class="m-content" style="min-width:700px">
    <center class="prz">
      <div class="texto2" style="background: none;">
        <table>
          <tr align="center">
            <td colspan="4" style="font-size: 19pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
              Traducción
            </td>
          </tr>
          <tr>
            <td>
            </td>
            <td>
            </td>
            <td align="right">
              Traducción
            </td>
            <td>
              <label style="line-height: 0;" name="lbl_IdTraduccion" id="lbl_IdTraduccion">---</label>
            </td>
          </tr>
          <tr>
            <td align="right">
              Vendedor
            </td>
            <td>
              <label style="line-height: 0;" name="lbl_NombreVendedor" id="lbl_NombreVendedor">---</label>
            </td>
          </tr>
          <tr>
            <td align="right">
              Traductor
            </td>
            <td>
              <label style="line-height: 0;" name="lbl_Traductor" id="lbl_Traductor">---</label>
            </td>
          </tr>
          <tr>
            <td align="right">
              Cliente
            </td>
            <td>
              <label style="line-height: 0;" name="lbl_NombreCliente" id="lbl_NombreCliente">---</label>
            </td>
            <td align="right">
              Clave Cliente
            </td>
            <td>
              <label style="line-height: 0;" name="lbl_ClaveCliente" id="lbl_ClaveCliente">---</label>
            </td>
          </tr>
          <tr>
            <td align="right">
              Idioma Origen
            </td>
            <td>
              <label style="line-height: 0;" name="lbl_IdiomaOrigen" id="lbl_IdiomaOrigen">---</label>
            </td>
            <td align="right">
              Idioma Destino
            </td>
            <td>
              <label style="line-height: 0;" name="lbl_IdiomaDestino" id="lbl_IdiomaDestino">---</label>
            </td>
          </tr>
        </table>
      </div>
    </center>
    <center class="prz">
      <div class="texto2" style="background: none;">
        <table>
          <tr align="center">
            <td colspan="4" style="font-size: 19pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
              Documento
            </td>
          </tr>
          <tr align="left">
            <td>
              Palabras: <label style="line-height: 0;" name="lbl_CantPalabras" id="lbl_CantPalabras">---</label>
            </td>
          </tr>
          <tr>
            <td align="left">
              Ubicación: <label style="line-height: 0;" name="lbl_UbicacionOrig" id="lbl_UbicacionOrig">asdasdasdasdasdasdasd</label>
            </td>
          </tr>
          <tr>
            <td align="left">
              Ubicación  Traducido: <label style="line-height: 0;" name="lbl_UbicacionTradu" id="lbl_UbicacionTradu">NA</label>
            </td>
          </tr>
        </table>
      </div>
    </center>
    <center class="prz">
      <div class="texto2" style="background: none;">
        <table>
          <tr align="center">
            <td colspan="4" style="font-size: 19pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
              Desglose
            </td>
          </tr>
          <tr align="left">
            <td>
              Fecha de orden: <label style="line-height: 0;" name="lbl_FechaOrden" id="lbl_FechaOrden">---</label>
            </td>
          </tr>
          <tr align="left">
            <td>
              Fecha de entrega: <label style="line-height: 0;" name="lbl_FechaEntrega" id="lbl_FechaEntrega">---</label>
            </td>
          </tr>
          <tr align="left">
            <td>
              Palabras: <label style="line-height: 0;" name="lbl_Palabras" id="lbl_Palabras">---</label>
            </td>
          </tr>
          <tr>
            <td align="left">
              Precio: $ <label style="line-height: 0;" name="lbl_Precio" id="lbl_Precio">---</label>
            </td>
          </tr>
          <tr>
            <td align="left">
              Descuento: $ <label style="line-height: 0;" name="lbl_Descuento" id="lbl_Descuento">---</label>
            </td>
            <td >
            Clave:<label style="line-height: 0;" name="lbl_Clave" id="lbl_Clave">---</label>
            </td>
          </tr>
          <tr>
            <td align="left">
              Subtotal: $ <label style="line-height: 0;" name="lbl_Subtotal" id="lbl_Subtotal">---</label>
            </td>
            <td align="left">
              Iva: $ <label style="line-height: 0;" name="lbl_Iva" id="lbl_Iva">---</label>
            </td>
            <td align="left">
              Total: $ <label style="line-height: 0;" name="lbl_Total" id="lbl_Total">---</label>
            </td>
          </tr>
          <tr>
            <td align="left">
              Calificación: <label style="line-height: 0;" name="lbl_Calificación" id="lbl_Calificación">---</label>
            </td>
          </tr>
        </table>
      </div>
    </center>
      </div>
    </center>
  </section>
  <hr>
  <section style="padding: 40px">
    <div>
    <center>
    <table>
      <tr>
        <h4>
          Modificar Datos
        </h4>
      </tr>
      <tr>
        <td>
          Módulo:
        </td>
        <td style="padding: 15px">
          <select class="form-control"name="cmb_Modificacion" id="cmb_Modificacion">
            <option elected='selected' value="Default" id="Default">Elige una opción</option>
            <option value="CEstatus" id="CEstatus">Cambiar Estatus</option>
            <option value="MDescuento" id="MDescuento">Modificar Descuento</option>
              <option value="SProrroga" id="SProrroga">Solicitar Prórroga</option>
            <option value="MRuta" id="MRuta">Modificar Ruta</option>
          </select>
        </td>
        </tr>
        <tr>
         <td style="padding: 10px; text-align:center" colspan="2">
          <input type="button" class="btn" name="btnOpcion" value="Cargar módulo" onclick="aparecerModulo()">
        </td>
      </tr>
    </table>
    <hr>
    <!-- Dependiendo de lo que se seleccione se hará visible un div u otro -->
   <script type="text/javascript">
      function aparecerModulo() {
           var operation = document.getElementById("cmb_Modificacion").value;
            var div1 = document.getElementById("div_CambiarEstatus");
            var div2 = document.getElementById("div_ModificarDescuento");
            var div3 = document.getElementById("div_SolicitarProrroga");
            var div4 = document.getElementById("div_CambiarRuta");
        if (operation=="CEstatus" ){
               
            div1.style.display = "block";
            div2.style.display = "none";
            div3.style.display = "none";
            div4.style.display = "none";
            
         }
         if (operation=="MDescuento" ){
            div1.style.display = "none";
            div2.style.display = "block";
            div3.style.display = "none";
            div4.style.display = "none";
        }    
     if (operation=="SProrroga" ){
            div1.style.display = "none";
            div2.style.display = "none";
            div3.style.display = "block";
            div4.style.display = "none";
    } if (operation=="MRuta") {
             div1.style.display = "none";
            div2.style.display = "none";
            div3.style.display = "none";
            div4.style.display = "block";
}
    if (operation=="Default") {
             div1.style.display = "none";
            div2.style.display = "none";
            div3.style.display = "none";
}
    
}
    </script>
    </center>
  </div>
  </section>
<section class="m-content" style="padding-top: 0" style="min-width:100px">
  <center class="mtr">
  <div class="texto2" style="background:none; display:none;" id="div_ModificarDescuento" > <!-- este se tiene que ocultar con la propiedad dislpay none -->
    <h4 class="texto-tabla"> Modificar Descuento</h4>
      <table>
        <tr>
          <td>
          <h4 class="texto-Centro">Descuento</h4>
          </td>
          <td>
              <h4><label class="texto-Centro" for="" id="lbl_Descuento">--</label></h4>
          </td>
          <td>
            <h4 class="texto-Centro" style="padding-left:10px;">Clave Descuento</h4>
          </td>
          <td>
              <input type="text" class="form-control" name="txt_CveDescuento" id="txt_CveDescuento" style=" width:100px;">
          </td>
          <td>
            <input type="submit" style="font-size:10pt" class="btn" name="btn_Modificar" value="Modificar" id="btn_Modificar">
          </td>
        </tr>
        <tr>
          <td>
          <h4 class="texto-Centro">Subtotal</h4>
          </td>
          <td>
              <h4><label class="texto-Centro" for="" id="lbl_Subtotal">--</label></h4>
          </td>
        </tr>
        <tr>
          <td>
          <h4 class="texto-Centro">Iva</h4>
          </td>
          <td>
              <h4><label class="texto-Centro" for="" id="lbl_Iva">--</label></h4>
          </td>
        </tr>
        <tr>
          <td >
          <h4 class="texto-Centro">Total Traducción</h4>
          </td>
          <td>
              <h4><label class="texto-Centro" for="" id="lbl_TotalTraduccion">--</label></h4>
          </td>
        </tr>
            <tr align="center">
              <td colspan="5">
                  <input type="submit" class="btn" name="btn_ConfirmarDesc" value="Confirmar" id="btn_ConfirmarDesc">
              </td>
              </tr>
      </table>
      <br>

    </div>
    <div class="texto2" style="background:none; display:none;" id="div_SolicitarProrroga"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
        <h4> Solicitar Prórroga</h4>
          <table>
            <tr>
              <td align="right" class="texto-Centro">
                Fecha de entrega:
              </td>
              <td>
                  <label for="" id="lbl_FechaEntregaProrroga"> -- </label>
              </td>
            </tr>
            <tr>
              <td align="right" class="texto-Centro">
                Nueva fecha de entrega:
              </td>
              <td>
                  <input type="date" class="form-control" name="txt_FechaEntregaProrroga" id="txt_FechaEntregaProrroga" >
              </td>
            </tr>
            <tr><td></td></tr>
              <tr align="center">
                <td colspan="2">
                    <input type="submit" class="btn" name="btn_ModificarPro" value="Modificar" id="btn_ModificarPro">
                </td>
              </tr>
          </table>
        </div>
        <div class="texto2" style="background:none; display:none;" id="div_CambiarEstatus"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
            <h4>Cambiar Estatus</h4>
              <table>
                <tr>
                  <td align="right" class="texto-Centro">
                    Seleccionar Estatus
                  </td>
                  <td style="padding: 15px; ">
                    <select class="form-control"name="cmb_Modificacion" id="cmb_Modificacion">
                      <option selected='selected'>Elige una opción</option>
                      <option value="Sts_Proceso" id="Sts_Proceso">En proceso</option>
                      <option value="Sts_Concluida" id="Sts_Concluida">Concluida </option>
                    </select>
                  </td>
                </tr>
                  <tr align="center">
                    <td colspan="2">
                        <input type="submit" class="btn" name="btn_ModificarEstatus" value="Modificar" id="btn_ModificarEstatus">
                    </td>
                  </tr>
              </table>
            </div>
            <div class="texto2" style="background:none; display:none;" id="div_CambiarRuta">  <!-- este se tiene que ocultar con la propiedad dislpay none -->
                <h4>Modificar  Ruta</h4>
                  <table>
                    <tr>
                      <td align="right" class="texto-Centro">
                        Ruta Documento Original
                      </td>
                      <td align="center">
                          <input type="file" name="fluArchivoOriginal" id="file1"/>
                          <label for="file">Seleccionar</label>
                      </td>
                    </tr>
                    <tr>
                      <td align="center" class="texto-Centro">
                        Ubicación: <label style="line-height: 0;" name="lbl_RutaDocOriginal" id="lbl_RutaDocOriginal">---</label>
                      </td>
                    </tr>
                    <tr>
                      <td align="right" class="texto-Centro">
                    Ruta Documento Final
                      </td>
                      <td align="center">
                          <input type="file" name="fluArchivoFinal" id="file2"/>
                          <label for="file">Seleccionar</label>
                      </td>
                    </tr>
                    <tr>
                      <td align="center" class="texto-Centro">
                        Ubicación: <label style="line-height: 0;" name="lbl_RutaDocFinal" id="lbl_RutaDocFinal">---</label>
                      </td>
                    </tr>
                      <tr align="center">
                        <td colspan="2">
                            <input type="submit" class="btn" name="btn_ModificarUbicacion" value="Modificar" id="btn_ModificarUbicacion">
                        </td>
                      </tr>
                  </table>
                </div>
          </center>
</section>
 