<%-- 
    Document   : jspModificarTraduAdmin
    Created on : Dec 8, 2019, 6:12:21 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    </table>
    <hr>
    <!-- Dependiendo de lo que se seleccione se hará visible un div u otro -->
    <script type="text/javascript">
      function aparecerModulo() {
           var operation = document.getElementById("cmb_Modificacion").value;
            var div1 = document.getElementById("div_ModificarDatos");
            var div2 = document.getElementById("div_ModificarDescuento");
            var div3 = document.getElementById("div_SolicProrroga");
        if (operation=="MDatos" ){
               
            div1.style.display = "block";
            div2.style.display = "none";
            div3.style.display = "none";
            
         }
         if (operation=="MDescuento" ){
            div1.style.display = "none";
            div2.style.display = "block";
            div3.style.display = "none";
        }    
     if (operation=="SProrroga" ){
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
              Traductor
            </td>
            <td>
              Tipo traduccion
            </td>
            <td>
              Idioma Origen
            </td>
            <td>
              Idioma Destino
            </td>
            <td>
              Entrega
            </td>
            <td>
              Seleccionar
            </td>
          </tr>

            <!-- obtener un result set con los datos de las traducciones que no se encuentren conlcuidas de un vendedor  -->

        </table>
      </div>
      <br>
      <hr>
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
                      <option>Elige una opción</option>
                      <!-- este se tiene que llenar de bd-->
                    </select>
                  </td>
                  </tr>
                  <tr>
                  <td align="right">
                    <h4  class="texto-Centro">Idioma Destino:</h4>
                  </td>
                  <td>
                    <select class="form-control" style="color:#6b6b6b;"  name="cmb_IdiomaDestino" id="cmb_IdiomaDestino" style="width:240;">
                      <option>Elige una opción</option>
                      <!-- este se tiene que llenar de bd-->
                    </select>
                  </td>
                </tr>
                <tr>
                  <td align="right">
                    <h4  class="texto-Centro">Traductor:</h4>
                  </td>
                  <td>
                    <select class="form-control" style="color:#6b6b6b;"  name="cmb_Traductor" id="cmb_Traductor" style="width:240;">
                      <option>Elige una opción</option>
                      <!-- este se tiene que llenar de bd-->
                    </select>
                  </td>
                </tr>
                <tr>
                  <td align="right">
                    <h4  class="texto-Centro">Tipo de Traducción:</h4>
                  </td>
                  <td>
                    <select class="form-control" style="color:#6b6b6b;"  name="cmb_TipoTraducion" id="cmb_TipoTraducion" style="width:240;">
                      <option>Elige una opción</option>
                      <!-- este se tiene que llenar de bd-->
                    </select>
                  </td>
                </tr>
                <tr><td></td></tr>
                <tr style="text-align:center">
                  <td colspan="4">
                      <input type="submit" class="btn" name="btn_Modificar" value="Modificar" id="btn_Modificar" style="width: 172px">
                  </td>
                </tr>
              </table>
            </div>
            <br>
            <div class="texto2" style="background:none;display: none;" id="div_ModificarDescuento"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
              <h4 class="texto-tabla"> Modificar Descuento</h4>
                <table>
                  <tr>
                    <td align="center" colspan="5">
                        <h5  > Datos Actuales</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                    <h4 class="texto-Centro">Descuento</h4>
                    </td>
                    <td>
                        <h4><label class="texto-Centro" for="" id="lbl_Subtotal">20%</label></h4>
                    </td>
                    <td>
                      <h4 class="texto-Centro" style="padding-left:10px;">Descuento</h4>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="txt_Descuento" id="txt_Descuento" style=" width:100px;">
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
                        <h4><label class="texto-Centro" for="" id="lbl_Subtotal">$30</label></h4>
                    </td>
                  </tr>
                  <tr>
                    <td>
                    <h4 class="texto-Centro">Iva</h4>
                    </td>
                    <td>
                        <h4><label class="texto-Centro" for="" id="lbl_Subtotal">$30</label></h4>
                    </td>
                  </tr>
                  <tr>
                    <td >
                    <h4 class="texto-Centro">Total Traducción</h4>
                    </td>
                    <td>
                        <h4><label class="texto-Centro" for="" id="lbl_Subtotal">$30</label></h4>
                    </td>
                  </tr>
                  <tr><td></td></tr>
                      <tr align="center">
                        <td colspan="5">
                            <input type="submit" class="btn" name="btn_Confirmar" value="Confirmar" id="btn_Confirmar">
                        </td>
                        </tr>
                </table>
                <br>
              </div>
          <div class="texto2" style="background:none;display: none;" id="div_SolicProrroga"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
              <h4> Solicitar Prórroga</h4>
                <table>
                  <tr>
                    <td align="right" class="texto-Centro">
                      Fecha de entrega:
                    </td>
                    <td>
                        <label for="" id="lbl_FechaEntrega"> -- </label>
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
                          <input type="submit" class="btn" name="btn_Modificar" value="Modificar" id="btn_Modificar">
                      </td>
                    </tr>
                </table>
              </div>
    </center>
    </section>
