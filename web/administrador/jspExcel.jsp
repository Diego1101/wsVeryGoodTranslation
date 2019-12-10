<%-- 
    Document   : jspExcel
    Created on : 10/12/2019, 12:52:21 PM
    Author     : diego
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    //crear un nuevo documento
    HSSFWorkbook wb = new HSSFWorkbook();
    HSSFSheet sheet = wb.createSheet();

    int ban = 0;
    try {
        HSSFRow row = sheet.createRow(0);
        int i = 0;
        ResultSet rsFrm = null;

        if (request.getSession().getAttribute("rsRepVen") != null) {
            rsFrm = (ResultSet) request.getSession().getAttribute("rsRepVen");
            row.createCell(0).setCellValue("Clave");
            row.createCell(1).setCellValue("Especialidad");
            row.createCell(2).setCellValue("Descripción");
            row.createCell(3).setCellValue("Número de Médicos");
            request.getSession().setAttribute("rsRepVen", null);
            
        } else if (request.getSession().getAttribute("rsRepVenT") != null) {
            rsFrm = (ResultSet) request.getSession().getAttribute("rsRepVenT");
            row.createCell(0).setCellValue("Canrtidad de ventas");
            row.createCell(1).setCellValue("Preio");
            row.createCell(2).setCellValue("Descuentos");
            row.createCell(3).setCellValue("Impuesto");
            row.createCell(3).setCellValue("Monto cobrado");
            request.getSession().setAttribute("rsRepVenT", null);
            
        } else if (request.getSession().getAttribute("rsRepMasVen") != null) {
            rsFrm = (ResultSet) request.getSession().getAttribute("rsRepMasVen");
            row.createCell(0).setCellValue("Clave");
            row.createCell(1).setCellValue("Nombre vendedor");
            row.createCell(2).setCellValue("Ganancias generadas");
            request.getSession().setAttribute("rsRepMasVen", null);
            
        } else if (request.getSession().getAttribute("rsRepVenC") != null) {
            rsFrm = (ResultSet) request.getSession().getAttribute("rsRepVenC");
            row.createCell(0).setCellValue("Clave");
            row.createCell(1).setCellValue("Nombre");
            row.createCell(2).setCellValue("Correo");
            row.createCell(3).setCellValue("Fecha");
            row.createCell(3).setCellValue("Tipo traducción");
            request.getSession().setAttribute("rsRepVenC", null);
            
        } else if (request.getSession().getAttribute("rsRepVentasVen") != null) {
            rsFrm = (ResultSet) request.getSession().getAttribute("rsRepVentasVen");
            row.createCell(0).setCellValue("Clave");
            row.createCell(1).setCellValue("Nombre vendedor");
            row.createCell(2).setCellValue("Numero de ventas");
            request.getSession().setAttribute("rsRepVentasVen", null);
        }

        rsFrm.beforeFirst();
        while (rsFrm.next()) {
            HSSFRow row1 = sheet.createRow(i);
            row1.createCell(0).setCellValue(rsFrm.getString(1));
            row1.createCell(1).setCellValue(rsFrm.getString(2));
            row1.createCell(2).setCellValue(rsFrm.getString(3));
            row1.createCell(3).setCellValue(rsFrm.getString(4));

            i = i + 1;
            sheet.autoSizeColumn(1);
            sheet.autoSizeColumn(1);
        }
    } catch (Exception e) {
        out.println("Error" + e);
    }
    //Prepara la generación de archivo
    ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
    //Escribe los datos a exportar
    wb.write(outByteStream);
    byte[] outArray = outByteStream.toByteArray();
    //configura el archivo
    response.setContentType("application/vnd.ms-excel");
    response.setContentLength(outArray.length);
    response.setHeader("Expires:", "0");//se elimina del browser
    response.setHeader("Content-Disposition", "attachment; filename=REP_" + new Date().getTime() + ".xls");
    System.out.println("");
    OutputStream outStream = response.getOutputStream();
    //Escribe los datos
    outStream.write(outArray);
    //Limpia los datos
    outStream.flush();
    //Lo guarda en esa ruta
    FileOutputStream archivoExcel = new FileOutputStream("C:/");
    //Crea el archivo con los datos
    wb.write(outStream);
%>





