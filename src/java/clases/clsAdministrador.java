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
public class clsAdministrador {
    
    int CveAdministrador;
    String Nombre, Apellidos, Usuario, Correo;
    
    public clsAdministrador(){
        
    }
    
    public clsAdministrador(int cve) throws SQLException{
        this.CveAdministrador=cve;
        
        clsConexion con=new clsConexion();
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
    
    void  DestclsAdministrador(){
        System.gc();
    }
    
    
}
