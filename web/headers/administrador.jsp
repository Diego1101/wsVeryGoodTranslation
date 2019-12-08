<%-- 
    Document   : administrador
    Created on : 22/10/2019, 10:59:40 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- MENU -->
<nav class="navbar navbar-expand-sm navbar-light">
    <div class="container">
        <!--  <a >
                                                <img src="https://verygoodtranslation.com/wp-content/uploads/2019/07/logo3-para-web.png" alt="Very Good Translation" id="logo" data-height-percentage="10" height="50"   />
                                        </a> -->
        <a class="navbar-brand" href="index.html"><i class='uil uil-user'></i> Administrador</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a href="index.jsp?op=jspABCVendedor.jsp" class="nav-link"><span data-hover="Vendedores">Vendedores</span></a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp?op=jspPrecio.jsp" class="nav-link"><span data-hover="Precio">Precios</span></a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp?op=jspABCIdioma.jsp" class="nav-link"><span data-hover="Idioma">Idiomas</span></a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp?op=jspCotizacionesA.jsp" class="nav-link"><span data-hover="Cotizaciones">Cotizaciones</span></a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp?op=jspReportes.jsp" class="nav-link"><span data-hover="Reportes">Reportes</span></a>
                </li>
                <li class="nav-item">
                    <a href="jspCerrarSesion.jsp" class="nav-link"><span data-hover="Cerrar Sesion">Cerrar Sesion</span></a>
                </li>
            </ul>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>