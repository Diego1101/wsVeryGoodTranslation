<%-- 
    Document   : jspCotizacionesV
    Created on : Dec 3, 2019, 11:53:30 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div class="fondo-negro">
      <center >
        <div class="titulo">
          Cotizaciones
        </div>
      </center>
    </div>


    <!-- CONTENIDO -->
  <section class="m-content">
    <center class="prz">
      <div class="texto2" style="background: none;">
      <table>
        <tr>
          <td  align="right" colspan="2">
            Idioma Origen:
          </td>
          <td>
            <select class="form-control" name="cmb_IdiomaOrigen" id="cmb_IdiomaOrigen">
              <option>Elige una opción</option>
              <option value="Ingles">Inglés</option>
              <option value="Español">Español</option>
              <option value="Chino">Chino</option>
              <option value="Japonés">Japonés</option>
            </select>
          </td>
        <tr>
          <tr>
            <td  align="right" colspan="2">
              Idioma Destino:
            </td>
            <td>
              <select class="form-control" name="cmb_IdiomaDestino" id="cmb_IdiomaDestino">
                <option>Elige una opción</option>
                <option value="Ingles">Inglés</option>
                <option value="Español">Español</option>
                <option value="Chino">Chino</option>
                <option value="Japonés">Japonés</option>
              </select>
            </td>
          <tr>
        <tr>
          <td class="texto-Centro" style="width:33%">
            Tipo de Cotizacion:
          <td>
            <select class="form-control" style="width:100%" name="cmb_TipoCotizacion" id="cmb_TipoCotizacion">
              <option value="palabra">Por palabra</option>
              <option value="pagina">Por Página</option>
            </select>
          </td>
          <td >
            <input class="form-control" type="text" name="txt_Cantidad" id="txt_Cantidad" value="">
          </td>
        </tr>
        <tr>
          <tr>
            <td class="texto-Centro">
              Descuento:
            <td>
              <select class="form-control"  name="cmb_TipoDescuento" id="cmb_TipoDescuento">
                <option value="porcentaje">Porcentaje</option>
                <option value="dinero">Dinero</option>
              </select>
            </td>
            <td>
              <input class="form-control" type="text" name="txt_Descuento" id="txt_Descuento" value="">
            </td>
          </tr>

            <td></td>
            <td class="texto-Centro">
              <div align="right">Total: </div>
            </td>
            <td>
              <input type="text" class="nomod" name="txt_Total" id="txt_Total" value="" readonly="true">
            </td>
          </tr>
          <tr>
            <td></td>
            <td class="texto-Centro">
            </td>
            <td align="right">
              <input type="submit" class="btn " name="btn_Aceptar" value="Calcular" id="btn_Entrar">
            </td>
          </tr>
          <tr>
            <td class="texto-Centro" colspan="2">
              <div align="right">Correo Electrónico: </div>
            </td>
            <td>
              <input type="email" class="form-control" name="txt_Correo" id="txt_Correo" value="" >
            </td>
          </tr>
          <tr>
            <td colspan="2"></td>
            <td align="right">
              <input type="submit" class="btn  " name="btn_Aceptar" value="Enviar Cotización" id="btn_Entrar">
            </td>
        </tr>
      </table>
          </div>
    </center>
</section>