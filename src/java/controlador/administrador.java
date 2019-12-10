/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.clsAdministrador;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modAdministrador;
import modelo.modCliente;
import modelo.modConexion;
import modelo.modDescuento;
import modelo.modIdioma;
import modelo.modTraduccion;
import modelo.modTraductor;
import modelo.modVendedor;

/**
 *
 * @author diego
 */
public class administrador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String org = request.getParameter("org");
            switch (org) {
                case "regVen":
                    registrarVendedor(request, response);
                    break;

                case "addDescuento":
                    registrarDescuento(request, response);
                    break;

                case "detDescuento":
                    detDescuento(request, response);
                    break;

                case "modDescuento":
                    modDescuento(request, response);
                    break;

                case "loadPrecio":
                    loadPrecio(request, response);
                    break;
                case "loadIdioma":
                    loadIdioma(request, response);
                    break;

                case "modIdioma":
                    modiIdioma(request, response);
                    break;

                case "addIdioma":
                    addIdioma(request, response);
                    break;
                 case "addTraductor":
                    registrarTraductor(request, response);
                    break;            
                case "modPrecio":
                    modifcarPrecio(request, response);
                    break;

                case "detVendedor":
                    detVendedor(request, response);
                    break;

                case "modVendedor":
                    modificarVendedor(request, response);
                    break;

                case "loadVendedores":
                    loadVendedores(request, response);
                    break;

                case "regCliente":
                    regCliente(request, response);
                    break;

                case "listTrad":
                    listTraductores(request, response);
                    break;

                case "errepeVentas":
                    repVentas(request, response);
                    break;
                case "errepeVentasT":
                    repVentasT(request, response);
                    break;
                case "errepeMasVentas":
                    repMasVentas(request, response);
                    break;
                case "errepeVentasVendedores":
                    repVentasVendedor(request, response);
                    break;
                case "errepeCitasCanceladas":
                    repVentasC(request, response);
                    break;

                case "listTradutores":
                    loadTraductores(request, response);
                    break;
                case "SeleccionarTraductor":
                    seleccionarTraductor(request, response);
                    break;

                default:
                    request.setAttribute("err", "Pagina no encontrada");
                    request.getRequestDispatcher("jspError.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            request.setAttribute("err", ex.getMessage());
            request.getRequestDispatcher("jspError.jsp").forward(request, response);
        }
    }

    void registrarVendedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        //int admAsig=((modAdministrador)request.getSession().getAttribute("usu")).getCveAdministrador();
        int admAsig = Integer.parseInt(request.getSession().getAttribute("id").toString());;
        if (request.getParameter("txt_Nombre") != null || request.getParameter("txt_Apellidos") != null || request.getParameter("txt_Usuario") != null || request.getParameter("txt_Contra") != null || request.getParameter("txt_Correo") != null || request.getParameter("txt_Tel") != null) {
            if ("".equals(request.getParameter("txt_Nombre")) || "".equals(request.getParameter("txt_Apellidos")) || "".equals(request.getParameter("txt_Usuario")) || "".equals(request.getParameter("txt_Contra")) || "".equals(request.getParameter("txt_Correo")) || "".equals(request.getParameter("txt_Tel"))) {
                request.setAttribute("edo", "Llenar todos los campos");
                request.setAttribute("op", "jspABCVendedor.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else {
                System.out.println("HI: " + request.getParameter("txt_Nombre"));
                modVendedor ven = new modVendedor();
                ven.setCveAdminAsig(admAsig);
                ven.setNombre(request.getParameter("txt_Nombre"));
                ven.setApellidos(request.getParameter("txt_Apellidos"));
                ven.setUsuario(request.getParameter("txt_Usuario"));
                ven.setContrasena(request.getParameter("txt_Contra"));
                ven.setTelefono(request.getParameter("txt_Tel"));
                ven.setCorreo(request.getParameter("txt_Correo"));
                if (ven.regVendedor() == 0) {
                    request.setAttribute("edo", "Ya existe el usuario");
                } else {
                    request.setAttribute("edo", "Vendedro agregado");

                }
                request.setAttribute("txt_Nombre", request.getParameter("txt_Nombre"));
                request.setAttribute("txt_Apellidos", request.getParameter("txt_Apellidos"));
                request.setAttribute("txt_Usuario", request.getParameter("txt_Usuario"));
                request.setAttribute("txt_Contra", request.getParameter("txt_Contra"));
                request.setAttribute("txt_Tel", request.getParameter("txt_Tel"));
                request.setAttribute("txt_Correo", request.getParameter("txt_Correo"));
                request.setAttribute("op", "jspABCVendedor.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            }

        } else {
            request.setAttribute("edo", "Error");
            request.setAttribute("op", "jspABCVendedor.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void registrarDescuento(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        modDescuento obj = new modDescuento();
        obj.setCveDescuento(0);
        obj.setRazonDesc(Float.parseFloat(request.getParameter("txtRazon"))/100);
        obj.setFechaInicio(request.getParameter("txtInicio"));
        obj.setFrechaFin(request.getParameter("txtFin"));
        if (obj.regDescuento() == 0) {
            request.setAttribute("edo", "Ya existe el descuento");
        } else {
            request.setAttribute("edo", "Descuento agregado");
        }
        request.setAttribute("txtRazon", request.getParameter("txtRazon"));
        request.setAttribute("txtInicio", request.getParameter("txtInicio"));
        request.setAttribute("txtFin", request.getParameter("txtFin"));
        request.setAttribute("op", "jspAddDescuento.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    private void detDescuento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
        modDescuento obj = new modDescuento(id);

        request.setAttribute("id", obj.getCveDescuento());
        request.setAttribute("txtRazon", obj.getRazonDesc());
        request.setAttribute("txtInicio", obj.getFechaInicio().split(" ")[0]);
        request.setAttribute("txtFin", obj.getFrechaFin().split(" ")[0]);
        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspModDescuento.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void modDescuento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        modDescuento obj = new modDescuento();
        obj.setCveDescuento(Integer.parseInt(request.getParameter("id")));
        obj.setRazonDesc(Float.parseFloat(request.getParameter("txtRazon"))/100);
        obj.setFechaInicio(request.getParameter("txtInicio"));
        obj.setFrechaFin(request.getParameter("txtFin"));
        switch (obj.modificarDescuento()) {
            case 0:
                request.setAttribute("edo", "No se encontró el registro");
                break;
            case -1:
                request.setAttribute("edo", "Ya existe un descuento con estas características");
                break;
            case -2:
                request.setAttribute("edo", "No se han realizado modificaciones");
                break;
            default:
                request.setAttribute("edo", "Descuento modificado");
                break;
        }
        request.setAttribute("txtRazon", request.getParameter("txtRazon"));
        request.setAttribute("txtInicio", request.getParameter("txtInicio"));
        request.setAttribute("txtFin", request.getParameter("txtFin"));
        request.setAttribute("op", "jspPrecio.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void loadPrecio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        modConexion con = new modConexion();
        Connection cnn = con.conexion();
        String consultaSql = "SELECT TTR_MULTCOSTPAL FROM VGT_TIPOTRADUCCION;";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        float[] p = new float[3];
        int i = 0;
        while (rs.next()) {
            p[i] = Float.parseFloat(rs.getString(1));
            i++;
        }
        rs.close();
        cnn.close();

        request.setAttribute("txtPrecioE", p[0]);
        request.setAttribute("txtPrecioC", p[1]);
        request.setAttribute("txtPrecioP", p[2]);

        List<String[]> res = modDescuento.listarDescuento();

        request.setAttribute("desc", res);

        request.setAttribute("edo", request.getParameter("edo"));

        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspPrecio.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void loadIdioma(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        modConexion con = new modConexion();
        Connection cnn = con.conexion();
        String consultaSql = "SELECT * FROM VGT_IDIOMA;";
        Statement st = (Statement) cnn.createStatement();
        ResultSet detIdiomas = st.executeQuery(consultaSql);

        if (request.getParameter("edo") != null) {
            request.setAttribute("edo", request.getParameter("edo"));
        }

        request.setAttribute("idiomas", detIdiomas);
        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspABCIdioma.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    private void modiIdioma(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        try {

            int id = Integer.parseInt(request.getParameter("slidioma"));
            modIdioma idioma = new modIdioma(id);
            idioma.setCostoPalabra(Float.parseFloat(request.getParameter("txt_FacIdioma")));
            idioma.setStatus(request.getParameter("slEstatus").charAt(0));
            if (idioma.modificarIdioma() == 0) {
                request.setAttribute("edo", "No se econctro el registro");
            } else {
                request.setAttribute("edo", "Idioma actualizado");

            }
            request.setAttribute("op", "jspABCIdioma.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (NumberFormatException ex) {
            request.setAttribute("edo", "Solo introducir numeros");
            request.setAttribute("op", "jspABCIdioma.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void addIdioma(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        try {

            modIdioma idioma = new modIdioma();
            idioma.setCostoPalabra(Float.parseFloat(request.getParameter("txt_NFactor")));
            idioma.setIdioma(request.getParameter("txt_NIdioma"));
            if (idioma.regIdioma() == 0) {
                request.setAttribute("edo", "Ya existe el idioma");
            } else {
                request.setAttribute("edo", "Idioma agregado");

            }
            request.setAttribute("op", "jspABCIdioma.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (NumberFormatException ex) {
            request.setAttribute("edo", "Solo introducir numeros");
            request.setAttribute("op", "jspABCIdioma.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void modifcarPrecio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        try {

            float estandar = Float.parseFloat(request.getParameter("txtPrecioE"));
            float certificada = Float.parseFloat(request.getParameter("txtPrecioC"));
            float premium = Float.parseFloat(request.getParameter("txtPrecioP"));

           
            if (modTraduccion.modPrecioTraduccion(estandar, certificada, premium) == 0) {
                request.setAttribute("edo", "No se han realizado modificaciones");
            } else {
                request.setAttribute("edo", "Modificacion realizada");

            }
        } catch (NumberFormatException ex) {
            request.setAttribute("edo", "Solo introducir numeros");

        }

        request.setAttribute("op", "jspPrecio.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void detVendedor(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        modVendedor obj = new modVendedor(id);

        request.setAttribute("id", obj.getCveVendedor());
        request.setAttribute("idAdm", obj.getCveAdminAsig());
        request.setAttribute("txt_Nombre", obj.getNombre());
        request.setAttribute("txt_Apellidos", obj.getApellidos());
        request.setAttribute("txt_Usuario", obj.getUsuario());
        request.setAttribute("txt_Tel", obj.getTelefono());
        request.setAttribute("txt_Correo", obj.getCorreo());
        request.setAttribute("txt_Contra", obj.getContrasena());

        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspModVen.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void modificarVendedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        if (request.getParameter("txt_Nombre") != null || request.getParameter("txt_Apellidos") != null || request.getParameter("txt_Usuario") != null || request.getParameter("txt_Contra") != null || request.getParameter("txt_Correo") != null || request.getParameter("txt_Tel") != null) {
            if ("".equals(request.getParameter("txt_Nombre")) || "".equals(request.getParameter("txt_Apellidos")) || "".equals(request.getParameter("txt_Usuario")) || "".equals(request.getParameter("txt_Contra")) || "".equals(request.getParameter("txt_Correo")) || "".equals(request.getParameter("txt_Tel"))) {
                request.setAttribute("edo", "Llenar todos los campos");
                request.setAttribute("op", "jspABCVendedor.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else {
                int id = Integer.parseInt(request.getParameter("idVen"));
                modVendedor ven = new modVendedor(id);
                ven.setCveAdminAsig(Integer.parseInt(request.getParameter("admin")));
                ven.setNombre(request.getParameter("txt_Nombre"));
                ven.setApellidos(request.getParameter("txt_Apellidos"));
                ven.setUsuario(request.getParameter("txt_Usuario"));
                ven.setContrasena(request.getParameter("txt_Contra"));
                ven.setTelefono(request.getParameter("txt_Tel"));
                ven.setCorreo(request.getParameter("txt_Correo"));
                if (ven.modificarVendedor() == 0) {
                    request.setAttribute("edo", "No se encontro el vendor");
                } else {
                    request.setAttribute("edo", "Vendedor modificado");

                }
                request.setAttribute("ban", "1");
                request.setAttribute("txt_Nombre", request.getParameter("txt_Nombre"));
                request.setAttribute("txt_Apellidos", request.getParameter("txt_Apellidos"));
                request.setAttribute("txt_Usuario", request.getParameter("txt_Usuario"));
                request.setAttribute("txt_Contra", request.getParameter("txt_Contra"));
                request.setAttribute("txt_Tel", request.getParameter("txt_Tel"));
                request.setAttribute("txt_Correo", request.getParameter("txt_Correo"));
                request.setAttribute("op", "jspModVen.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            }

        } else {
            request.setAttribute("edo", "Error");
            request.setAttribute("op", "jspModVen.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void loadVendedores(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        int idAdm = Integer.parseInt(request.getSession().getAttribute("id").toString());
        List<String[]> res = modVendedor.listarVendedores(idAdm);

        request.setAttribute("ven", res);
        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspVendedores.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void regCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        modCliente obj = new modCliente();
        obj.setCveTipoCliente(0);
        obj.setNombre(request.getParameter("txt_Nombre"));
        obj.setApellidos(request.getParameter("txt_Apellido"));
        obj.setCorreoE(request.getParameter("txt_Email"));
        obj.setTelefono(request.getParameter("txt_Telefono"));

        int id = obj.regCliente();
        if (id == 0) {

            request.setAttribute("edoC", "El correo ya existe");
        } else {

            request.setAttribute("id", id);
            request.setAttribute("edoC", "Cliente agregado");

        }

        request.setAttribute("txt_Nombre", request.getParameter("txt_Nombre"));
        request.setAttribute("txt_Apellido", request.getParameter("txt_Apellido"));
        request.setAttribute("txt_Email", request.getParameter("txt_Email"));
        request.setAttribute("txt_Telefono", request.getParameter("txt_Telefono"));

        modIdioma idiomas = new modIdioma();
        ResultSet rs = idiomas.listarIdiomas();
        List<String[]> li = new ArrayList<>();
        while (rs.next()) {
            String[] aux = new String[2];
            aux[0] = rs.getString(1);
            aux[1] = rs.getString(2);
            li.add(aux);
        }

        modAdministrador adm = new modAdministrador();
        adm.setCveAdministrador(Integer.parseInt(request.getSession().getAttribute("id").toString()));
        ResultSet a = adm.listarTraductoresAdmin();
        List<String[]> ven = new ArrayList<>();
        while (a.next()) {
            if (!"0".equals(a.getString(1))) {
                String[] aux = new String[2];
                aux[0] = a.getString(1);
                aux[1] = a.getString(2);
                ven.add(aux);
            }
        }

        request.setAttribute("vendedores", ven);
        request.setAttribute("idiomas", li);
        request.setAttribute("op", "jspRegistrarTraduAdmin.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    private void listTraductores(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int orgI = Integer.parseInt(request.getParameter("orgI"));
            int des = Integer.parseInt(request.getParameter("des"));
            System.out.print(request.getParameter("orgI"));
            modIdioma tr = new modIdioma();
            ResultSet rs = tr.listarTraductoresIdioma(orgI, des);

            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<div class='contTraductor'>");
                out.println("<select class='form-control' id='cmb_Traductor' name='cmb_Traductor'>");
                while (rs.next()) {
                    out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                }
                out.println("</select>");
                out.println("</div>");
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
    }
    
    private void repVentas(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            modAdministrador adm = new modAdministrador();
            ResultSet rs = adm.reporteVentas();
            rs.next();
                if(rs.getString(2).equals("0")){
                    request.setAttribute("edo", "No existen ventas registradas.");
                }
                else{
                    request.getSession().setAttribute("rsRepVen", rs);
                }
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
        request.setAttribute("op", "jspRepVentas.jsp");
        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    private void repVentasT(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            modAdministrador adm = new modAdministrador();
            ResultSet rs = adm.reporteVentasTotales();
            rs.next();
                if(rs.getString(2).equals("0")){
                    request.setAttribute("edo", "No existen ventas registradas");
                }
                else{
                    request.getSession().setAttribute("rsRepVenT", rs);
                }
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
        request.setAttribute("op", "jspRepVentasTotales.jsp");
        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    private void repVentasVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            modAdministrador adm = new modAdministrador();
            ResultSet rs = adm.reporteVendedorVentas();
            rs.next();
                if(rs.getString(2).equals("0")){
                    request.setAttribute("edo", "No existen ventas registradas.");
                }
                else{
                    request.getSession().setAttribute("rsRepVentasVen", rs);
                }
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
        request.setAttribute("op", "jspVentasVendedores.jsp");
        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    private void repMasVentas(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            modAdministrador adm = new modAdministrador();
            ResultSet rs = adm.reporteVendedorTVentas();
            rs.next();
                if(rs.getString(2).equals("0")){
                    request.setAttribute("edo", "No existen ventas registradas.");
                }
                else{
                    request.getSession().setAttribute("rsRepMasVen", rs);
                }
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
        request.setAttribute("op", "jspRepMasVentas.jsp");
        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    private void repVentasC(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            modAdministrador adm = new modAdministrador();
            ResultSet rs = adm.reporteVentasC();
            rs.next();
                if(rs.getString(2).equals("0")){
                    request.setAttribute("edo", "No se canceló ninguna venta.");
                }
                else{
                    request.getSession().setAttribute("rsRepVenC", rs);
                }
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
        request.setAttribute("op", "jspVentasCanceladas.jsp");
        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    private void loadTraductores(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        modConexion con = new modConexion();
        Connection cnn = con.conexion();
        modAdministrador tr = new modAdministrador();
        Statement st = (Statement) cnn.createStatement();
        ResultSet detTraductores = tr.listarTraductores();

        if (request.getParameter("edo") != null) {
            request.setAttribute("edo", request.getParameter("edo"));
        }

        request.setAttribute("traductores", detTraductores);
        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspABCTraductor.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void seleccionarTraductor(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String valor = request.getParameter("Confrimartxt");
        int busq = Integer.parseInt(valor);
        modConexion con = new modConexion();
        Connection cnn = con.conexion();
        ResultSet rsFrm4;

        //To change body of generated methods, choose Tools | Templates.
    }
     private void registrarTraductor(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        modTraductor obj = new modTraductor();
         if ("".equals(request.getParameter("txt_Nombre")) || "".equals(request.getParameter("txt_Apellidos")) || "".equals(request.getParameter("txt_Usuario")) || "".equals(request.getParameter("txt_Contra")) || "".equals(request.getParameter("txt_Correo")) || "".equals(request.getParameter("txt_Tel"))) {
              request.setAttribute("edo", "Asegurate de introducir todos los datos");
                request.setAttribute("op", "jspABCTraductor.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);
         }else{
             obj.setNombre(request.getParameter("txt_Nombre"));
        obj.setApellidos(request.getParameter("txt_Apellido"));
        obj.setCorreoE(request.getParameter("txt_CorreoElectronico"));
        obj.setTelefono(request.getParameter("txt_Telefono"));
        obj.setDireccion(request.getParameter("txt_Direccion"));
        if (obj.regTraductor()== 0) {
            request.setAttribute("edo", "Ya existe el Traductor que se intenta ingresar");
        } else {
            request.setAttribute("edo", "Traductor agregado");
        }
        request.setAttribute("op", "jspABCTraductor.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
         }
        

    }

}
