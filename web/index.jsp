<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    String pagina = "jspAcceso.jsp";
    String header = "headers/main.jsp";
    String dir = "";
    if (request.getSession().getAttribute("rol") != null) {
        header = request.getSession().getAttribute("rol").toString();
        if (header.equals("2")) {
            header = "headers/administrador.jsp";
            dir = "administrador/";
            pagina = "jspMainAdministrador.jsp";
        } else if (header.equals("1")) {
            header = "headers/vendedor.jsp";
            dir = "vendedor/";
            pagina = "jspMainVendedor.jsp";
        } else {
            header = "headers/main.jsp";
        }
    }

    if (request.getAttribute("op") != null) {
        pagina = request.getAttribute("op").toString();
    } else if (request.getParameter("op") != null) {
        pagina = request.getParameter("op").toString();
    }

%>


<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Very Good Translation</title>

          <link rel="stylesheet" href="css/bootstrap.min.css">
          <link rel="stylesheet" href="css/Estilo.css">
          

        <style type="text/css">
            .auto-style1 {
                display: block;
                width: 101%;
                height: calc(1.5em + .75rem + 2px);
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #495057;
                background-clip: padding-box;
                border-radius: .25rem;
                transition: none;
                border: 1px solid #ced4da;
                background-color: #fff;
            }
            .auto-style2 {
                display: block;
                width: 101%;
                height: calc(1.5em + .75rem + 2px);
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #495057;
                background-clip: padding-box;
                border-radius: .25rem;
                transition: none;
                border: 1px solid #ced4da;
                background-color: #fff;
            }
            .auto-style3 {
                left: 0px;
                top: 0px;
                width: 279px;
            }
            .auto-style4 {
                left: 1px;
                top: 0px;
            }
            #miid::placeholder {
                color: gray;
                text-align: center;
                padding-top: 30px;
            }

            reporte {
                background-color: #bcbcbc;
                color: white;
                margin: 20px;
                padding: 20px;
            }
            .texto {
                background-color: #ffffff;
                font-size: 60;
                color: black;
                margin: 20px;
                padding: 20px;
            }
            .texto2{
                background-color: #bcbcbc;
                color: black;
                margin: 20px;
                padding: 20px;
                font-size:15pt;
            }

            .texto3 {
                background-color: rgb(236,239,1);
                color: black;
                margin: 20px;
                padding: 20px;
                font-size:15pt;
            }

            .reporte2 {
                background-color: #efefef;
                color: white;
                margin: 20px;
                padding: 20px;
            }
            .texto4 {
                background-color:  #efefef;
                color: #000000;
                margin: 20px;
                padding: 20px;
            }

        </style>

    </head>
    <body>


        <jsp:include page="<%=header%>"/>
        <jsp:include page="<%=dir + pagina%>"/>


        <!-- FOOTER -->
        
    <footer class="footer" >
      <div class="container">
        <div class="row">

          <div class="col-lg-12 col-12" align="center">
            <p style="color:#ffffff;">Copyright &copy; Very Good Translation</p>

          </div>

        </div>
      </div>

    </footer>
        <footer id="main-footer">

            <div class="container">
                <div id="footer-widgets" class="clearfix">
                    <div class="footer-widget"><div id="custom_html-44" class="widget_text fwidget et_pb_widget widget_custom_html"><div class="textwidget custom-html-widget"><!-- Código de instalación Cliengo para http://www.verygoodtranslation.com -->
                                <script type="text/javascript">(function () {
                                        var ldk = document.createElement('script');
                                        ldk.type = 'text/javascript';
                                        ldk.async = true;
                                        ldk.src = 'https://s.cliengo.com/weboptimizer/5cd0c33fe4b0a6deb12cff1b/5cd0c340e4b0a6deb12cff1e.js';
                                        var s = document.getElementsByTagName('script')[0];
                                        s.parentNode.insertBefore(ldk, s);
                                    })();</script></div></div> <!-- end .fwidget --></div> <!-- end .footer-widget --><div class="footer-widget"></div> <!-- end .footer-widget --><div class="footer-widget"></div> <!-- end .footer-widget --><div class="footer-widget"></div> <!-- end .footer-widget -->    </div> <!-- #footer-widgets -->
            </div>    <!-- .container -->


            <div id="et-footer-nav">
                <div class="container">
                </div>
            </div> <!-- #et-footer-nav -->


            <div id="footer-bottom">
                <div class="container clearfix">
                </div>	<!-- .container -->
            </div>
        </footer> <!-- #main-footer -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/Headroom.js"></script>
        <script src="js/jQuery.headroom.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>
