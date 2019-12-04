/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import com.mysql.jdbc.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Adaleysi
 */
public class modVendedor {
    int CveVendedor, CveAdminAsig;
    String Nombre, Apellidos, Usuario, Contrasena, Correo, Telefono;
    char Status;

    public int getCveVendedor() {
        return CveVendedor;
    }

    public void setCveVendedor(int CveVendedor) {
        this.CveVendedor = CveVendedor;
    }

    public int getCveAdminAsig() {
        return CveAdminAsig;
    }

    public void setCveAdminAsig(int CveAdminAsig) {
        this.CveAdminAsig = CveAdminAsig;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public void setContrasena(String Contrasena) {
        this.Contrasena = Contrasena;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public char getStatus() {
        return Status;
    }

    public void setStatus(char Status) {
        this.Status = Status;
    }
    
    
    public modVendedor(){
        
    }
    
    

    public modVendedor(int cve) throws SQLException {
        this.CveVendedor = cve;
        modConexion con=new modConexion();
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
            this.Status=rs.getString(8).charAt(0);
        }
        rs.close();
        cnn.close();
    }
    
    public int regVendedor() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_REGVENDEDOR('"+CveAdminAsig+"','"+Nombre+"','"+Apellidos+"','"+Usuario+"','"+Contrasena+"','"+Correo+"','"+Telefono+"');";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int modificarVendedor() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_MODVENDEDOR("+CveVendedor+","+CveAdminAsig+","+Nombre+","+Apellidos+","+Contrasena+","+Correo+","+Telefono+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int statusVendedor() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_STSVENDEDOR("+CveVendedor+","+Status+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public ResultSet listarTraduccionesVendedor() throws SQLException{
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_LISTARTRADVENDEDOR("+CveVendedor+","+Status+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
}
