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
    
    
}
