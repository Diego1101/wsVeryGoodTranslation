/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modTraduccion;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author diego
 */
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)

public class multipart extends HttpServlet {

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
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            List items = upload.parseRequest(request);
            String op = "";
            for (Object item : items) {
                FileItem uploaded = (FileItem) item;
                if (uploaded.isFormField()) {
                    if ("org".equals(uploaded.getFieldName())) {
                        op = uploaded.getString();
                    }
                }
            }
            switch (op) {
                case "regTraduccion":
                    regTraduccionn(request, response, items);
                    break;
                case "regTraduccionV":
                    regTraduccionV(request, response, items);
                    break;
                case "a":
                    throw new SQLException();

                default:
                    request.setAttribute("err", "Pagina no encontrada");
                    request.getRequestDispatcher("jspError.jsp").forward(request, response);
                    break;

            }
        } catch (FileUploadException | SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
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

    private void regTraduccionn(HttpServletRequest request, HttpServletResponse response, List items) throws IOException, SQLException, ServletException {

        InputStream in = null;
        String nombreA = "";
        int idCli = 0;
        int origen = 0;
        int destino = 0;
        int traductor = 0;
        int vendedor = 0;
        int tipo = 0;
        int cantidad = 0;
        String fechaEntrega = "";

        //Información:   cmb_IdiomaOrigen
//Información:   3
//Información:   cmb_IdiomaDestino
//Información:   1
//Información:   cmb_Traductor
//Información:   1
//Información:   cmb_Vendedor
//Información:   2
//Información:   cmb_TipoTraducion
//Información:   1
//Información:   txt_CantidadPalabras
//Información:   23
//Información:   txt_FechaEntrega
//Información:   2019-12-11
//Información:   estado
//Información:   1
//Información:   org
//Información:   regTraduccion
//Información:   txt_CodigoDescuento
//Información:   estado
//Información:   0
//Información:   org
//Información:   regTraduccion
        //CALL STP_REGTRADUCCION(1,1,1,2,1,1,0,'1','docs/doc1.txt','trad/trad.txt',2000000,0,0,0,0,0,0);
        for (Object item : items) {
            FileItem uploaded = (FileItem) item;
            if (uploaded.isFormField()) {
                switch (uploaded.getFieldName()) {
                    case "cmb_IdiomaOrigen":
                        origen = Integer.parseInt(uploaded.getString());
                        break;
                    case "cmb_IdiomaDestino":
                        destino = Integer.parseInt(uploaded.getString());
                        break;
                    case "cmb_Traductor":
                        traductor = Integer.parseInt(uploaded.getString());
                        break;

                    case "cmb_Vendedor":
                        vendedor = Integer.parseInt(uploaded.getString());
                        break;

                    case "cmb_TipoTraducion":
                        tipo = Integer.parseInt(uploaded.getString());
                        break;

                    case "txt_CantidadPalabras":
                        cantidad = Integer.parseInt(uploaded.getString());
                        break;

                    case "txt_FechaEntrega":
                        fechaEntrega = uploaded.getString();
                        break;

                    case "idCli":
                        idCli = Integer.parseInt(uploaded.getString());
                        break;

                    default:
                        break;
                }
            } else {
                if (uploaded.getFieldName().equals("fluArchivo")) {
                    in = uploaded.getInputStream();
                    nombreA = uploaded.getName();
                }
            }
        }

        File f = new File("docs/" + nombreA);
        System.out.println(f.getAbsolutePath());
        OutputStream salida = new FileOutputStream(f);
        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) > 0) {
            salida.write(buf, 0, len);
        }
        salida.close();
        in.close();

        modTraduccion trad = new modTraduccion();
        trad.setCveIdiomaDestino(destino);
        trad.setCveIdiomaOrigen(origen);
        trad.setCveTipoTrad(tipo);
        trad.setCveCliente(idCli);
        trad.setCveTraductor(traductor);
        trad.setCveVendedor(vendedor);
        trad.setPalabras(cantidad);
        trad.setFechaEntrega(fechaEntrega);
        trad.setRutaDoc("doc/"+nombreA);
        trad.setStatus('0');
        int idTrad=trad.regTraduccion();
        if (idTrad != 0) {
            request.setAttribute("edo", "Traduccion agegada");

        } else {
            request.setAttribute("edo", "ERROR");
        }
        trad.setCveTrad(idTrad);
        trad.modCotizar((float)0.16);
        
        request.setAttribute("op", "jspModificarTraduAdmin.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }
    
    private void regTraduccionV(HttpServletRequest request, HttpServletResponse response, List items) throws IOException, SQLException, ServletException {

        InputStream in = null;
        String nombreA = "";
        int idCli = 0;
        int origen = 0;
        int destino = 0;
        int traductor = Integer.parseInt(request.getSession().getAttribute("id").toString());
        int vendedor = 0;
        int tipo = 0;
        int cantidad = 0;
        String fechaEntrega = "";

        //Información:   cmb_IdiomaOrigen
//Información:   3
//Información:   cmb_IdiomaDestino
//Información:   1
//Información:   cmb_Traductor
//Información:   1
//Información:   cmb_Vendedor
//Información:   2
//Información:   cmb_TipoTraducion
//Información:   1
//Información:   txt_CantidadPalabras
//Información:   23
//Información:   txt_FechaEntrega
//Información:   2019-12-11
//Información:   estado
//Información:   1
//Información:   org
//Información:   regTraduccion
//Información:   txt_CodigoDescuento
//Información:   estado
//Información:   0
//Información:   org
//Información:   regTraduccion
        //CALL STP_REGTRADUCCION(1,1,1,2,1,1,0,'1','docs/doc1.txt','trad/trad.txt',2000000,0,0,0,0,0,0);
        for (Object item : items) {
            FileItem uploaded = (FileItem) item;
            if (uploaded.isFormField()) {
                switch (uploaded.getFieldName()) {
                    case "cmb_IdiomaOrigen":
                        origen = Integer.parseInt(uploaded.getString());
                        break;
                    case "cmb_IdiomaDestino":
                        destino = Integer.parseInt(uploaded.getString());
                        break;
                    case "cmb_Traductor":
                        traductor = Integer.parseInt(uploaded.getString());
                        break;

                    case "cmb_TipoTraducion":
                        tipo = Integer.parseInt(uploaded.getString());
                        break;

                    case "txt_CantidadPalabras":
                        cantidad = Integer.parseInt(uploaded.getString());
                        break;

                    case "txt_FechaEntrega":
                        fechaEntrega = uploaded.getString();
                        break;

                    case "idCli":
                        idCli = Integer.parseInt(uploaded.getString());
                        break;

                    default:
                        break;
                }
            } else {
                if (uploaded.getFieldName().equals("fluArchivo")) {
                    in = uploaded.getInputStream();
                    nombreA = uploaded.getName();
                }
            }
        }

        File f = new File("docs/" + nombreA);
        System.out.println(f.getAbsolutePath());
        OutputStream salida = new FileOutputStream(f);
        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) > 0) {
            salida.write(buf, 0, len);
        }
        salida.close();
        in.close();

        modTraduccion trad = new modTraduccion();
        trad.setCveIdiomaDestino(destino);
        trad.setCveIdiomaOrigen(origen);
        trad.setCveTipoTrad(tipo);
        trad.setCveCliente(idCli);
        trad.setCveTraductor(traductor);
        trad.setCveVendedor(vendedor);
        trad.setPalabras(cantidad);
        trad.setFechaEntrega(fechaEntrega);
        trad.setRutaDoc("doc/"+nombreA);
        trad.setStatus('0');
        int idTrad=trad.regTraduccion();
        if (idTrad != 0) {
            request.setAttribute("edo", "Traduccion agegada");

        } else {
            request.setAttribute("edo", "ERROR");
        }
        trad.setCveTrad(idTrad);
        trad.modCotizar((float)0.16);
        
        request.setAttribute("op", "jspGestionTraducciones.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

}