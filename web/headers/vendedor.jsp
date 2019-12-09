<%-- 
    Document   : vendedor
    Created on : 22/10/2019, 10:59:25 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm navbar-light">
    <div class="container">
        <!--<a >
                                              <img src="https://verygoodtranslation.com/wp-content/uploads/2019/07/logo3-para-web.png" alt="Very Good Translation" id="logo" data-height-percentage="10" height="50"   />
                                      </a>-->
        <a class="navbar-brand" href="index.jsp"><i class='uil uil-user'></i> Vendedor</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link"><span data-hover="Clientes">Clientes</span></a>
                    <ul>
                        <li><a href="index.jsp?op=jspClientesActuales.jsp">Activos</a></li>
                        <li><a href="index.jsp?op=jspClientesProspectos.jsp">Prospectos</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="index.jsp?op=jspCotizacionesV.jsp" class="nav-link"><span data-hover="Cotizaciones">Cotizaciones</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"><span data-hover="Traducciones">Traducciones</span></a>
                    <ul>
                        <li><a href="index.jsp?op=jspGestionTraducciones.jsp">Gestión</a></li>
                        <li><a href="index.jsp?op=jspRegistrarTraduccion.jsp">Nueva traducción</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="jspCerrarSesion.jsp" class="nav-link"><span data-hover="Cerrar Sesion">Cerrar Sesion</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
