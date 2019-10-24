<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="container">

    <div class="about-text align-items-center">
        <center>
            <br><br>
            <h3>
                <span class="mr-2">Precio</span>
            </h3>
            <br>
        </center>

    </div>
</div>


<!-- CONTENIDO -->
<center>
    <div class="texto3">
        <table >
            <tr align="center" class="textoCentrado">
                Precio actual
            </tr>
            <tr>
                <td>
                    &nbsp&nbsp&nbsp&nbsp Precio por palabra:
                    <label for="lblPrecio">-----------</label>
                </td>
            </tr>
            <br>
        </table>
    </div>
    <div class="texto3">
        <table >
            <tr align="center" class="textoCentrado">
                Factor actual
            </tr>
            <tr>
                <td>
                    Idioma:
                </td>
                <td>
                    <select class="small-text" value="cmbIdiomas">
                        <option value="Ingles">Inglés</option>
                        <option value="Español">Español</option>
                        <option value="Chino">Chino</option>
                        <option value="Japonés">Japonés</option>
                    </select>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp Precio:
                    <label for="lblPrecio">-----------</label>
                </td>
            </tr>
            <br>
        </table>
    </div>
    <div class="texto2">
        <table>
            <tr align="center" class="textoCentrado">
                Cambio Factor
            </tr>
            <tr>
                <td>
                    Idioma:
                </td>
                <td>
                    <select class="small-text"value="cmbIdiomas2">
                        <option value="Ingles">Inglés</option>
                        <option value="Español">Español</option>
                        <option value="Chino">Chino</option>
                        <option value="Japonés">Japonés</option>
                    </select>
                </td>
                <td>
                    &nbsp&nbsp Factor Idioma:
                    <input type="text" name="txtFactor" id="txtFactor" value="">
                </td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td align="right">
                    <input type="submit" class="btn custom-btn " name="btn_ModFactor" value="Modificar" id="btn_Entrar">
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="texto2">
    <table>
        <tr align="center" class="textoCentrado">
            Cambio Precio
        </tr>
        <tr>
            <td>
                &nbsp&nbsp Valor Idioma:
                <input type="text" name="txtPrecio" id="txtPrecio" value="">
            </td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td align="right">
                <input type="submit" class="btn custom-btn " name="btn_ModValor" value="Modificar" id="btn_Entrar">
            </td>
        </tr>
    </table>
</div>
</center>
