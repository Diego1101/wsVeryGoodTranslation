/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import com.mysql.jdbc.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author diego
 */
public class clsVendedor {
    
    int CveVendedor, CveAdminAsig;
    String Nombre, Apellidos, Usuario, Correo, Telefono;
    
    public clsVendedor(){
        
    }
    
    public clsVendedor(int cve) throws SQLException{
        this.CveVendedor=cve;
        clsConexion con=new clsConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_DATOSVENDEDOR("+cve+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            this.CveAdminAsig=Integer.parseInt(rs.getString(2));
            this.Nombre=rs.getString(3);
            this.Apellidos=rs.getString(4);
            this.Usuario=rs.getString(5);
            this.Correo=rs.getString(6);
            this.Telefono=rs.getString(7);
        }
        
        rs.close();
        cnn.close();
        
    }
    
    public ResultSet mostrarProspectos() throws SQLException{
        clsConexion con=new clsConexion();
        Connection cnn=con.conexion();
        String consultaSql = "CALL STP_LISTARCLIENTESPROSP(0,1);";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet mostrarActivos() throws SQLException{
        clsConexion con=new clsConexion();
        Connection cnn=con.conexion();
        String consultaSql = "CALL STP_LISTARCLIENTESPROSP(2,1);";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet listarIdiomas() throws SQLException{
        clsConexion con=new clsConexion();
        Connection cnn=con.conexion();
        String consultaSql = "CALL STP_LISTARIDIOMAS();";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet listarDescuentos() throws SQLException{
        clsConexion con=new clsConexion();
        Connection cnn=con.conexion();
        String consultaSql = "CALL STP_LISTARDESCUENTOSVIG();";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet listarTiposTraduccion() throws SQLException{
        clsConexion con=new clsConexion();
        Connection cnn=con.conexion();
        String consultaSql = "CALL STP_LISTARTIPOTRADUCCION();";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet registrarTraduccion(int cveCliente, int cveVen, int cveIOrigen, int cveIDestino, int cveTipoTrad, int cveTraductor, int cveDescuento, char estatusTrad, String rutaOriginal, String rutaTraduccion, float cantPalabras, float precio, float descuento, float subtotal, float impuesto, int calificacion) throws SQLException{
        clsConexion con=new clsConexion();
        Connection cnn=con.conexion();
        float total = subtotal + impuesto;
        String consultaSql = "CALL STP_REGTRADUCCION("+ cveCliente +","+cveVen+","+cveIOrigen+","+cveIDestino+","+cveTipoTrad+","+cveTraductor+","+cveDescuento+",'"+estatusTrad+"','"+rutaOriginal+"','"+rutaTraduccion+"',"+cantPalabras+","+ precio+","+ descuento+","+ subtotal+","+ impuesto+","+ total +","+ calificacion+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
}
