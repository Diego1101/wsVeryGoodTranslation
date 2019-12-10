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
               HSSFWorkbook wb=new HSSFWorkbook();
               HSSFSheet sheet = wb.createSheet(); 
               
               int ban=0;
               try{
               //HSSFRow row=sheet.createRow(0);
               //row.createCell(0).setCellValue("Clave");
               //row.createCell(1).setCellValue("Especialidad");
               //row.createCell(2).setCellValue("Descripción");
               //row.createCell(3).setCellValue("Número de Médicos");
               int i=0;
               ResultSet rsFrm=(ResultSet)request.getSession().getAttribute("rsRepVen");;
               rsFrm.beforeFirst();
               while(rsFrm.next()){
                   HSSFRow row1 = sheet.createRow(i);
                   row1.createCell(0).setCellValue(rsFrm.getString(1));
                   row1.createCell(1).setCellValue(rsFrm.getString(2));
                   row1.createCell(2).setCellValue(rsFrm.getString(3));
                   row1.createCell(3).setCellValue(rsFrm.getString(4));
                   
                   i=i+1;
                   sheet.autoSizeColumn(1);
                   sheet.autoSizeColumn(1);
                   }
               }catch(Exception e){
                   out.println("Error"+e);
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
               response.setHeader("Content-Disposition", "attachment; filename=Cli_"+ new Date().getTime()+".xls" );
               System.out.println("");
               OutputStream outStream=response.getOutputStream();
               //Escribe los datos
               outStream.write(outArray);
               //Limpia los datos
               outStream.flush();
               //Lo guarda en esa ruta
               FileOutputStream archivoExcel= new FileOutputStream("C:/");
               //Crea el archivo con los datos
               wb.write(outStream);
%>





