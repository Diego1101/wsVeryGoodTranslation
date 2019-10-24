<%-- 
    Document   : jspReportes
    Created on : 22/10/2019, 11:42:37 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div style="text-align: center; background: rgb(236,239,001); border-radius: 0 10px 10px 0; color: #fff;  width: 95%; height: 10%;">
    <center style="color: #000">
        <br><br>
        <h3 style="color: #000">
            Reportes
        </h3>
        <br>
    </center>
</div>


<!-- CONTENIDO -->
<center >
    <table >
        <tr>
            <td >
                Tipo de reporte: &nbsp&nbsp
            <td>
                <select class="small-text">
                    <option value="clientesRegistradps">Clientes Registrados</option>
                    <option value="Traducciones">Traducciones </option>
                    <option value="Ganancias">Ganancias</option>
                </select>
            </td>
        </tr>
        <tr>
        <p>
        <td>
            <br><br><br>
        <td align="right">
            <input type="submit" class="btn custom-btn" name="btn_seleccionar" value="Seleccionar" id="btn_seleccionar">
        </td>
        </p>
        </tr>
    </table>
</center>
<div class="reporte2">
    <!-- Encabezado del reporte -->
    <table style="texto4">
        <tr align="right">
            <td>
                &nbsp &nbsp <img src="https://verygoodtranslation.com/wp-content/uploads/2019/07/logo3-para-web.png" alt="Very Good Translation" id="logo" data-height-percentage="10" height="50" />
            </td>
            <td class="texto4" align="right" size="500px" width="300">
                &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Very Good Translation
            </td>
            <td align="right" class="texto4">
                &nbsp  &nbsp  &nbsp  &nbsp  &nbspFecha:<span id="datetime"></span>
                <script class="texto4">
                    var dt = new Date();
                    document.getElementById("datetime").innerHTML = dt.toLocaleString();
                </script>
            </td>
        </tr>
        <tr class="texto4">
            <td></td>
            <td>Tipo de reporte: <label for="TipoReporte">----------------</label></td>
        </tr>
    </table>
    <hr align="left" size="4" width="100%" color="black">
    <!-- Area del reporte -->
    <table class="texto4">
        <tr align="left">
            <td class="texto-Reporte" align="right" size="500px" width="300">
                Id de la traduccion: <label for="TraduccionID">------</label>
            </td>
            <td class="texto-Reporte" align="right" size="500px" width="300">
                &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Cantidad de palabras: <label for="">------</label>
            </td>
            <td class="texto-Reporte" align="right" size="500px" width="300">
                &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Cantidad de páginas: <label for="">------</label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>Total <label for="lblTotal">----------------</label></td>
        </tr>
    </table>
</div>

<br>
<div>
    <center>
        <table>
            <tr align="right">
                <td align="right">  <input  type="submit" href="#contact" class="btn custom-btn "name="btn_GenerarPDF"value="Generar PDF"id="btn_GenerarPDF" style="width: 172px" ></td>
            </tr>
        </table>
    </center>
</div>
