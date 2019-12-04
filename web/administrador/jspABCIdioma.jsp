<%-- 
    Document   : jspABCIdioma
    Created on : Dec 3, 2019, 10:54:56 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div class="fondo-negro">
    <center >
      <div class="titulo">
        Registro de idiomas
      </div>
    </center>
  </div>

<section class="m-content" style="min-width:300px;min-height:80px;">
  <center> <h4 style="font-weight:lighter;"> Idiomas registrados</h4> </center>
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
      </td><td>
        <h5>Cambiar estatus </h5>
      </td>
  </tr>
      <tr>
        <!-- obtener un result set con los datos de los clientes prospectos  -->
        </tr>
      </table>
      </center>
</section>
<hr>
<div id="div_ModificarIdioma">
  <section class="m-content" style="min-width:300px;min-height:120px;height:300px;">
    <center>
      <table>
        <tr colspan="2" > <h4 style="font-weight:lighter;">Modificar Idioma</h4></tr>
        <br>
        <tr>
          <td style="text-align: right">
              <h4 class="texto-Centro">Idioma:</h4>
          </td>
          <td>
              <div class="col-lg-6">
                <input type="text" class="form-control" name="txt_Idioma" placeholder="Escribe el idioma" id="txt_Idioma" style="min-width: 240px; width:240;">
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
                <input type="number" min="0" class="form-control" name="txt_FacIdioma" placeholder="Factor del idioma" id="txt_FacIdioma" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>
        <tr>
          <td colspan="2" style="text-align: center; padding: 50px 0 0 0">
              <div>
                <input type="submit"  class="btn " name="btn_Modificar" value="Modificar" id="btn_Modificar" style="min-width: 180px; width:180;">
              </div>
          </td>
          <td>
          </td>
        </tr>
      </table>
    </center>
    <br>
    </div>
        <hr>
  </section>
</div>
<div id="div_RegistrarIdioma">
  <section class="m-content" style="min-height:120px">
    <center>
      <table >
        <tr colspan="2" > <h4 style="font-weight:lighter;"> Registrar idioma nuevo</h4></tr>
        <br>
        <tr>
          <td style="text-align: right">
              <h4 class="texto-Centro">Idioma:</h4>
          </td>
          <td>
              <div class="col-lg-6">
                <input type="text" class="form-control" name="txt_Idioma" placeholder="Escribe el idioma" id="txt_Idioma" style="min-width: 240px; width:240;">
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
                <input type="number" min="0" class="form-control" name="txt_RazonDesc" placeholder="Factor del idioma" id="txt_RazonDesc" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>
        <tr>
          <td colspan="2" style="text-align: center; padding: 50px 0 0 0">
              <div>
                <input type="submit" href="#contact" class="btn " name="btn_Registrar" value="Guardar" id="btn_Registrar" style="min-width: 180px; width:180;">
              </div>
          </td>
          <td>
          </td>
        </tr>


      </table>
    </center>
    <br>
    </div>
  </section>

