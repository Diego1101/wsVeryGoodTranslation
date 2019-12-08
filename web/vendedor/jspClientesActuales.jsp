<%-- 
    Document   : jspClientesActuales
    Created on : Dec 3, 2019, 11:35:14 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div class="fondo-negro">
      <center >
        <div class="titulo">
          Clientes Actuales
        </div>
      </center>
    </div>

<section class="m-content" style="min-width:600px">
  <center  >
    <table>
      <tr>
        <td style="font-size:14pt;">
          Estatus traducción:
        </td>
        <td style="padding: 15px; ">
          <select class="form-control"name="cmb_Modificacion" id="cmb_Modificacion">
            <option selected='selected'>Elige una opción</option>
            <option value="MDescuento" id="Sts_Proceso">En proceso</option>
            <option value="MDatos" id="Sts_Concluida">Concluida </option>      
          </select>
        </td>
        </tr>
        <tr>
        <td style="padding: 10px; text-align:center" colspan="2">
          <input type="button" class="btn" name="btn_Mostrar" value="Mostrar">
        </td>
      </tr>
    </table>
    </center>
    <br>
    <hr>
    <br>
  <center class="rs encabezadoTabla">
  <table class="tRep">
  <tr>
      <td>
        <h5>Nombre</h5>
      </td>
      <td>
        <h5>Correo</h5>
      </td><td>
        <h5>Teléfono</h5>
      </td>
      <td>
        <h5>Estatus</h5>
      </td>
      <td>
        <h5>Mostrar Detalles</h5>
      </td>
  </tr>
      <tr>
        <!-- obtener un result set con los datos de los clientes que han registrado una traduccion con este vendedor -->
        </tr>
      </table>
      </center>
</section>

