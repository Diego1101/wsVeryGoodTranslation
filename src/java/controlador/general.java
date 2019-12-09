/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.clsAdministrador;
import clases.clsConexion;
import clases.clsVendedor;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modAdministrador;
import modelo.modConexion;
import modelo.modVendedor;

/**
 *
 * @author diego
 */
public class general extends HttpServlet {

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
                case "acceso":
                    validarAcceso(request, response);
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

    void validarAcceso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String usu=request.getParameter("txt_Usuario");
        String pass=request.getParameter("txt_Contra");
        modConexion obj=new modConexion();
        String[] res=obj.iniciarSesion(usu, pass);
        
        if(res[0].equals("0")){
            request.setAttribute("edo", "Datos incorrectos");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        else{
            if(res[0].equals("1")){
                //vendedor
                request.getSession().setAttribute("rol", 1);
                request.getSession().setAttribute("id", res[1]);
                request.getSession().setAttribute("usu", new modVendedor(Integer.parseInt(res[1])));
            }
            else if(res[0].equals("2")){
                //administrador
                request.getSession().setAttribute("rol", 2);
                request.getSession().setAttribute("id", res[1]);
                request.getSession().setAttribute("usu", new modAdministrador(Integer.parseInt(res[1])));
            }
        }
        
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
