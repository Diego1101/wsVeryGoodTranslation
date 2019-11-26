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
public class modAdministrador {
    
    int CveAdministrador;
    String Nombre, Apellidos, Usuario, Contrasena, Correo;
    char Status;

    public int getCveAdministrador() {
        return CveAdministrador;
    }

    public void setCveAdministrador(int CveAdministrador) {
        this.CveAdministrador = CveAdministrador;
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

    public char getStatus() {
        return Status;
    }

    public void setStatus(char Status) {
        this.Status = Status;
    }
    
    
    
    public modAdministrador(int cve) throws SQLException {
        this.CveAdministrador=cve;
        
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_DATOSADMINISTRADOR("+cve+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        
        while (rs.next()) {
            this.Nombre=rs.getString(2);
            this.Apellidos=rs.getString(3);
            this.Usuario=rs.getString(4);
            this.Correo=rs.getString(5);
        }
        rs.close();
        cnn.close();
    }
    
}
