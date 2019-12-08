<%-- 
    Document   : jspDescuento
    Created on : 4/12/2019, 12:56:28 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="fondo-negro">
    <center >
        <div class="titulo">
            Descuento
        </div>
    </center>
</div>


<section class="m-content" style="min-width:600px">
    <center class="prz" style="padding-right:5px">
        <div class="texto2">
            <a href="index.jsp?op=jspModDescuento.jsp&id=1">Modificar descuento</a>
            <form action="administrador.do" method="post">
                <input type="hidden" class="btn custom-btn" name="org" value="goModDescuento" id="org">
                <input type="hidden" class="btn custom-btn" name="org" value="goModDescuento" id="org">
                <input class="btnY" type="submit" name="btn_ModDescuento" value="Modificar" id="btn_Entrar" required>
                
                <a href="index.jsp?op=jspAddDescuento.jsp">Agregar descuento</a>
            </form>
        </div>
    </center>
</section>
