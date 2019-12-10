/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modAdministrador;
import modelo.modIdioma;
import modelo.modTraduccion;
import modelo.modVendedor;

/**
 *
 * @author diego
 */
@WebServlet(name = "traducciones", urlPatterns = {"/traducciones.do"})
public class traducciones extends HttpServlet {

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
                case "loadModTrad":
                    loadModTrad(request, response);
                    break;

                case "modTradSel":
                    modTradSel(request, response);
                    break;

                case "modDatosTrad":
                    modDatosTrad(request, response);
                    break;

                case "modDescuentoTrad":
                    modDescuentoTrad(request, response);
                    break;

                case "prorrogaTrad":
                    prorrogaTrad(request, response);
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

    private void loadModTrad(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ResultSet rs = modTraduccion.listarTrad();

        if (request.getParameter("edo") != null) {
            request.setAttribute("edo", request.getParameter("edo"));
        }

        List<String[]> trad = new ArrayList<>();
        while (rs.next()) {
            String[] aux = new String[8];
            aux[0] = rs.getString(1);
            aux[1] = rs.getString(2);
            aux[2] = rs.getString(3);
            aux[3] = rs.getString(4);
            aux[4] = rs.getString(5);
            aux[5] = rs.getString(6);
            aux[6] = rs.getString(7);
            aux[7] = rs.getString(8);
            trad.add(aux);
        }

        modIdioma idiomas = new modIdioma();
        ResultSet rs1 = idiomas.listarIdiomas();
        List<String[]> li = new ArrayList<>();
        while (rs1.next()) {
            String[] aux = new String[2];
            aux[0] = rs1.getString(1);
            aux[1] = rs1.getString(2);
            li.add(aux);
        }
        System.out.print(trad.size());
        request.setAttribute("trad", trad);
        request.setAttribute("idiomas", li);
        request.setAttribute("ban", "1");
        request.setAttribute("op", "jspModificarTraduAdmin.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    private void modTradSel(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ResultSet rs = modTraduccion.listarTrad();

        if (request.getParameter("edo") != null) {
            request.setAttribute("edo", request.getParameter("edo"));
        }
        List<String[]> trad = new ArrayList<>();
        while (rs.next()) {
            String[] aux = new String[8];
            aux[0] = rs.getString(1);
            aux[1] = rs.getString(2);
            aux[2] = rs.getString(3);
            aux[3] = rs.getString(4);
            aux[4] = rs.getString(5);
            aux[5] = rs.getString(6);
            aux[6] = rs.getString(7);
            aux[7] = rs.getString(8);
            trad.add(aux);
        }

        modIdioma idiomas = new modIdioma();
        ResultSet rs1 = idiomas.listarIdiomas();
        List<String[]> li = new ArrayList<>();
        while (rs1.next()) {
            String[] aux = new String[2];
            aux[0] = rs1.getString(1);
            aux[1] = rs1.getString(2);
            li.add(aux);
        }

        request.setAttribute("trad", trad);
        request.setAttribute("idiomas", li);
        request.setAttribute("ban", "1");

        int id = Integer.parseInt(request.getParameter("idS"));
        modTraduccion tra = new modTraduccion(id);
        request.setAttribute("sel", id);
        request.setAttribute("tra", tra);

        int idAdm = Integer.parseInt(request.getSession().getAttribute("id").toString());
        List<String[]> res = modVendedor.listarVendedores(idAdm);

        request.setAttribute("ven", res);

        request.setAttribute("op", "jspModificarTraduAdmin.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void modDatosTrad(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
 
        int idT = Integer.parseInt(request.getParameter("idTrad"));
        modTraduccion trad = new modTraduccion(idT);

        int origen = Integer.parseInt(request.getParameter("cmb_IdiomaOrigen"));
        int destino = Integer.parseInt(request.getParameter("cmb_IdiomaDestino"));
        int tipo = Integer.parseInt(request.getParameter("cmb_TipoTraducion"));
        char estatus = request.getParameter("cmb_Estatus").charAt(0);

        trad.setCveIdiomaDestino(destino);
        trad.setCveIdiomaOrigen(origen);
        trad.setCveTipoTrad(tipo);
        trad.setStatus(estatus);

        if (trad.modificarTraduccion() == -1) {
            request.setAttribute("edo", "No se encontro el registro");
        } else if (trad.modificarTraduccion() == 0) {
            request.setAttribute("edo", "No se encontro el registro");
        } else {
            request.setAttribute("edo", "Traduccion modificada");
        }
        
        loadModTrad(request, response);
        
    }

    private void modDescuentoTrad(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        int idT = Integer.parseInt(request.getParameter("idTradD"));
        float descuento = Float.parseFloat(request.getParameter("txt_Descuento"));
        modTraduccion trad = new modTraduccion(idT);
        trad.setDescuento(descuento);

        trad.setTotal(trad.getTotal()-descuento);
        System.out.println("preioc: "+trad.getPrecio());
        if (trad.modificarTraduccion() == 0) {
            request.setAttribute("edo", "No se encontro el registro");
        } else {
            request.setAttribute("edo", "Descuento agregado");
        }
        loadModTrad(request, response);
    }

    private void prorrogaTrad(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int idT = Integer.parseInt(request.getParameter("idTradP"));
        String nuevaFecha = request.getParameter("txt_FechaEntrega");
        modTraduccion trad = new modTraduccion(idT);
        trad.setFechaEntrega(nuevaFecha);

        if (trad.modificarTraduccion()== 0) {
            request.setAttribute("edo", "No se encontro el registro");
        } else {
            request.setAttribute("edo", "Fecha modificada");
        }
        loadModTrad(request, response);
    }

}
