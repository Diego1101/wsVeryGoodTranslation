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
public class modCliente {

    int CveCliente, CveTipoCliente;
    String Nombre, Apellidos, CorreoE, UltCont, Telefono;
    char Status;

    public modCliente() {
    }

    public int getCveCliente() {
        return CveCliente;
    }

    public void setCveCliente(int CveCliente) {
        this.CveCliente = CveCliente;
    }

    public int getCveTipoCliente() {
        return CveTipoCliente;
    }

    public void setCveTipoCliente(int CveTipoCliente) {
        this.CveTipoCliente = CveTipoCliente;
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

    public String getCorreoE() {
        return CorreoE;
    }

    public void setCorreoE(String CorreoE) {
        this.CorreoE = CorreoE;
    }

    public String getUltCont() {
        return UltCont;
    }

    public void setUltCont(String UltCont) {
        this.UltCont = UltCont;
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
    
    
    
    
    public modCliente(int cve) throws SQLException {
        this.CveCliente=cve;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_DATOSCLIENTE("+cve+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            this.CveTipoCliente=Integer.parseInt(rs.getString(2));
            this.Nombre=rs.getString(3);
            this.Apellidos=rs.getString(4);
            this.CorreoE=rs.getString(5);
            this.UltCont=rs.getString(6);
            this.Telefono=rs.getString(7);
            this.Status=rs.getString(8).charAt(0);
        }
        rs.close();
        cnn.close();
    }
    
    
    public int regCliente() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_REGCLIENTE("+CveTipoCliente+","+Nombre+","+Apellidos+","+CorreoE+","+Telefono+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int modificarCliente() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_MODCLIENTE("+CveCliente+","+CveTipoCliente+","+Nombre+","+Apellidos+","+CorreoE+","+Telefono+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int statusCliente() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_STSCLIENTE("+CveCliente+","+Status+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public ResultSet listarTipoCliente() throws SQLException{
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_LISTARTIPOCLIENTE();";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
}
