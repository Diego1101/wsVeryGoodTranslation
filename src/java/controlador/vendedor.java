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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        String org = request.getParameter("org");

        switch (org) {
            case "listarProspectos":
                listarProspectos(request, response);
                break;
            case "listarActivos":
                listarActivos(request, response);
                break;
            default:
                break;
        }
    }
    
     private void listarProspectos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                clsVendedor dat = new clsVendedor();
            try {
                ResultSet rs=dat.mostrarProspectos();
                rs.next();
                if(rs.getString(1).equals("0")){
                    request.setAttribute("edo", "No existen prospectos registrados.");
                }
                else{
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
                ResultSet rs=dat.mostrarActivos();
                rs.next();
                if(rs.getString(1).equals("0")){
                    request.setAttribute("edo", "No existen clientes registrados.");
                }
                else{
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

}
