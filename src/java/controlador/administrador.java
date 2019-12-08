/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modAdministrador;
import modelo.modConexion;
import modelo.modDescuento;
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
        int admAsig = 0;
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
        obj.setRazonDesc(Integer.parseInt(request.getParameter("txtRazon")));
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
        
        int id=Integer.parseInt(request.getParameter("id"));
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
        obj.setRazonDesc(Integer.parseInt(request.getParameter("txtRazon")));
        obj.setFechaInicio(request.getParameter("txtInicio"));
        obj.setFrechaFin(request.getParameter("txtFin"));
        switch (obj.modificarDescuento()) {
            case 0:
                request.setAttribute("edo", "No se encontro el registro");
                break;
            case -1:
                request.setAttribute("edo", "Ya existe un descuento con estas caracteristicas");
                break;
            default:
                request.setAttribute("edo", "Descuento modificado");
                break;
        }
        request.setAttribute("txtRazon", request.getParameter("txtRazon"));
        request.setAttribute("txtInicio", request.getParameter("txtInicio"));
        request.setAttribute("txtFin", request.getParameter("txtFin"));
        request.setAttribute("op", "jspModDescuento.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void loadPrecio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "SELECT TTR_MULTCOSTPAL FROM VGT_TIPOTRADUCCION;";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        float[] p=new float[3];
        int i=0;
        while (rs.next()) {
            p[i]=Float.parseFloat(rs.getString(1));
            i++;
        }
        rs.close();
        cnn.close();
       
        request.setAttribute("txtPrecioE", p[0]);
        request.setAttribute("txtPrecioC", p[1]);
        request.setAttribute("txtPrecioP", p[2]);
        
        
        List<String[]> res=modDescuento.listarDescuento();
        
        
        request.setAttribute("desc", res);
        
        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspPrecio.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
