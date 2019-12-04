/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modAdministrador;
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
                if(ven.regVendedor()==0){
                    request.setAttribute("edo", "Ya existe el usuario");
                }else{
                                    request.setAttribute("edo", "Vendedro agregado");

                }
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

}
