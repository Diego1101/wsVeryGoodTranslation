<%-- 
    Document   : jspReportes
    Created on : 22/10/2019, 11:42:37 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


  <!-- TITULO -->

  <div class="fondo-negro">
    <center >
      <div class="titulo">
        Reportes
      </div>
    </center>
  </div>


  <!-- CONTENIDO -->
  <section class="m-content">
  <center class="rp" style="background: none;">
    <table>
      <tr>
        <td>
          Tipo de reporte:
        <td>
          <select class="form-control">
            <option value="clientesRegistradps">Clientes Registrados</option>
            <option value="Traducciones">Traducciones Efectuadas </option>
            <option value="Ganancias">Ganancias</option>
          </select>
        </td>
      </tr>
      <tr>
        <td >
          Tiempo:
        <td>
          <select class="form-control">
            <option value="clientesRegistradps">Mes actual</option>
            <option value="Traducciones">Año</option>
          </select>
        </td>
      </tr>
      <tr>
          <td>
          <td align="right">
            <input type="submit" class="btn custom-btn" name="btn_seleccionar" value="Seleccionar" id="btn_seleccionar">
          </td>
      </tr>
    </table>
  </center>

  <center>
  <div class="reporte">
    <!-- Encabezado del reporte -->
    <table class="tRep">
      <tr>
        <td align="left" style="width:30%">
          <img src="https://verygoodtranslation.com/wp-content/uploads/2019/07/logo3-para-web.png" alt="Very Good Translation" id="logo" data-height-percentage="10" height="50" />
        </td>
        <td  align="right" style="font-size:12pt; width: 30%">
            Fecha: <span id="datetime"></span>
          <script>
            var dt = new Date();
            document.getElementById("datetime").innerHTML = dt.toLocaleString();
          </script>
        </td>
      </tr>
      <tr><td style="height:20px" colspan="3"></td></tr>
      <tr>
        <td colspan="3">Tipo de reporte: <label for="TipoReporte"> -- </label></td>
      </tr>
    </table>
    <hr align="left" width="100%" color="black"> </hr>
        <!-- Area del reporte -->
        <table class="tRep">
          <tr align="center">
            <td>
              Clave
            </td>
            <td >
              Palabras
            </td>
            <td >
              Páginas
            </td>
          </tr>
          <tr align="center">
            <td>
              <label for=""> -- </label>
            </td>
            <td>
              <label for=""> -- </label>
            </td>
            <td>
              <label for=""> -- </label>
            </td>
          </tr>
          <tr>
            <td></td>
            <td align="center">Total: </td>
            <td align="center"> -- </td>
          </tr>
        </table>
      </div>
    </center>
      <center>
            <input  type="submit" class="btn custom-btn "name="btn_GenerarPDF"value="Generar PDF"id="btn_GenerarPDF" >
      </center>
  </section>

