<%-- 
    Document   : jspCotizacionesV
    Created on : 22/10/2019, 11:28:24 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<div style="border-right: solid;border-color: #000;border-width:50px; background: rgb(236,239,001); color: #fff;  width: 100%; height: 10%;">
    <center >
        <br><br>
        <div class="titulo">
            Cotizaciones
        </div>
        <br>
    </center>
</div>


<!-- CONTENIDO -->
<center>
    <table>
        <tr align="center">
            &nbsp&nbsp  <td class="full-text">Cotización:</td>
            <td>  <label for="lblID"> ------------------</label></td>
        </tr>

        <tr>

        <br>
        <td class="full-text">
            Tipo de Cotizacion: &nbsp&nbsp
        <td>
            <select class="small-text">
                <option value="Palabra">Por palabra</option>
                <option value="clientesRegistradps">Por Página</option>
            </select>
        </td>
        <td>
            <input type="text" name="txtDescuento" id="" value="">
        </td>
        </tr>
        <br>
        <tr>
        <tr>
            <td class="full-text">
                Descuento: &nbsp&nbsp
            <td>
                <select class="small-text">
                    <option value="Palabra">Porcentaje</option>
                    <option value="clientesRegistradps">Dinero</option>
                </select>
            </td>
            <td>
                <input type="text" name="txtDescuento" id="" value="">
            </td>
        </tr>
        <tr>
            <td></td>
            <td> <div class="texto" align="center">Total</div> </td>
            <td> <input type="text" name="txtTotal" id="" value="" readonly="true"> </td>
        </tr>
        <tr>
        <p>
        <td>
            <br><br><br>
        </td>
        <td>  </td>
        <td align="right">
            <input type="submit" class="btn custom-btn " name="btn_Aceptar" value="Aceptar" id="btn_Entrar">
        </td>
        </p>
        </tr>
    </table>
</center>

