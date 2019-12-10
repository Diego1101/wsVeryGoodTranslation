/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.clsConexion;
import clases.clsVendedor;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modAdministrador;
import modelo.modCliente;
import modelo.modIdioma;

/**
 *
 * @author diego
 */
public class vendedor extends HttpServlet {

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
                case "listarProspectos":
                    listarProspectos(request, response);
                    break;
                case "listarActivos":
                    listarActivos(request, response);
                    break;
                case "regClienteV":
                    regClienteV(request, response);
                    break;
                    
                case "addTraduccion":
                    addTraduccion(request, response);
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

    private void listarProspectos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        clsVendedor dat = new clsVendedor();
        try {
            ResultSet rs = dat.mostrarProspectos();
            rs.next();
            if (rs.getString(1).equals("0")) {
                request.setAttribute("edo", "No existen prospectos registrados.");
            } else {
                request.getSession().setAttribute("rsProsp", rs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(vendedor.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("op", "jspClientesProspectos.jsp");
        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    private void listarActivos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        clsConexion obj = new clsConexion();
        clsVendedor dat = new clsVendedor();
        try {
            obj.conexion();
            ResultSet rs = dat.mostrarActivos();
            rs.next();
            if (rs.getString(1).equals("0")) {
                request.setAttribute("edo", "No existen clientes registrados.");
            } else {
                request.getSession().setAttribute("rsClientes", rs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(vendedor.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("op", "jspClientesActuales.jsp");
        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);

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

    private void regClienteV(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
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

        request.setAttribute("idCli", id);
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
        request.setAttribute("op", "jspRegistrarTraduccion.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }
    private void addTraduccion(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("idCli"));
        
        modCliente obj = new modCliente(id);

        request.setAttribute("idCli", id);
        request.setAttribute("id", id);
        request.setAttribute("txt_Nombre", obj.getNombre());
        request.setAttribute("txt_Apellido", obj.getApellidos());
        request.setAttribute("txt_Email", obj.getCorreoE());
        request.setAttribute("txt_Telefono", obj.getTelefono());

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
        request.setAttribute("op", "jspRegistrarTraduccion.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

}
