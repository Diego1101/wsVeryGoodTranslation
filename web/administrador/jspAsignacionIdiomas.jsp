<%-- 
    Document   : jspAsignacionIdiomas
    Created on : Dec 9, 2019, 12:46:05 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="fondo-negro">
    <center >
        <div class="titulo">
            Asignación de Idiomas
        </div>
    </center>
</div>
<center>
  <br>
  <br>
<div class="texto2" style="background:none"> <!-- este se tiene que ocultar con la propiedad dislpay none -->
    <table>
      <tr>
        <td align="center" colspan="5">
            <h5  >Traductor</h5>
        </td>
      </tr>
      <tr>
        <td align="right" class="texto-Centro" colspan="2">
          Nombre:<label style="line-height: 0;" name="lbl_IdiomaOrigen" id="lbl_IdiomaOrigen"> ---</label>
        </td>
      </tr>
      <tr>
        <td align="center" class="texto-Centro" colspan="2">
          Idiomas: <td>
             <select class="form-control" id="cmb_Idiomas" style="color:#6b6b6b" name="cmb_Idiomas">
               <option>Elige una opción</option>
             </select>
           </td>
        </td>
        <td align="right">
            <input type="button" class="btn" name="btn_Agregar" value="Agregar" id="btn_Agregar">
        </td>
      </tr>

    </table>
    <br>
  </div>
  </center>
<section class="m-content" style="min-width:300px;min-height:80px;">
<center class="rs encabezadoTabla">
    <table class="tRep" style="min-widht:100px">
        <tr>
            <td>
                <h5 >Idiomas</h5>
            </td>
        </tr>
        <tr>
          <!-- Ir mostrando los idiomas que se le van agregando al traductor -->
        </tr>
    </table>
</center>
</section>
<center>
  <input type="submit" class="btn" name="btn_Confirmar" value="Confirmar" id="btn_Confirmar">
  </center>
  <br>
