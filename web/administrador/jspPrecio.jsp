<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- TITULO -->

<div class="fondo-negro">
    <center >
        <div class="titulo">
            Precio
        </div>
    </center>
</div>


<!-- CONTENIDO -->
<section class="m-content" style="min-width:600px">
    <center class="prz" style="padding-right:5px">
        <div class="texto">
            <table>
                <tr align="center">
                    <td colspan="2" style="font-size: 22pt; background: #672988; text-shadow: none; border-radius: 50px;">
                        Precio actual
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td align="right">
                        Estandar:
                    </td>
                    <td>
                        <input class="form-control" type="text" name="txtPrecioE" id="txtPrecioE" value="">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Certificada:
                    </td>
                    <td>
                        <input class="form-control" type="text" name="txtPrecioC" id="txtPrecioC" value="">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Premium:
                    </td>
                    <td>
                        <input class="form-control" type="text" name="txtPrecioP" id="txtPrecioP" value="">
                    </td>
                </tr>
                <tr>
                    <td ></td>
                    <td align="right">
                        <input class="btnY" type="submit" name="btn_ModPrecio" value="Modificar" id="btn_Entrar">
                    </td>
                </tr>
            </table>
        </div>
        <div class="texto2">
            <table>
                <tr align="center">
                    <td colspan="2" style="font-size: 22pt; background: #c9cc1b; text-shadow: none; border-radius: 50px;">
                        Factor por idioma
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td align="right">
                        Idioma:
                    </td>
                    <td>
                        <select class="form-control" value="cmbIdiomas2">
                            <option value="Ingles">Inglés</option>
                            <option value="Español">Español</option>
                            <option value="Chino">Chino</option>
                            <option value="Japonés">Japonés</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Factor Idioma:
                    </td>
                    <td>
                        <input class="form-control" type="text" name="txtFactor" id="txtFactor" value="">
                    </td>
                </tr>
                <tr>
                    <td ></td>
                    <td align="right">
                        <input class="btnY" type="submit" name="btn_ModFactor" value="Modificar" id="btn_Entrar">
                    </td>
                </tr>
            </table>
        </div>
    </center>
</section>
