/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import com.mysql.jdbc.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Adaleysi
 */
public class modConexion {
    Connection cnn;

    public final Connection conexion() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/BD_VGT", "root", "3209");
            System.out.println("Se hizo la conexion a la base de datos");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto: " + e.getMessage());
        }
        return cnn;
    }
    
    public String[] iniciarSesion(String usu, String pass) throws SQLException {
        conexion();
        String consultaSql = "call STP_LOGIN('" + usu + "','" + pass + "');";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        String[] res = new String[2];
        while (rs.next()) {
            res[0] = rs.getString(1);
            res[1] = rs.getString(2);
        }
        rs.close();
        cnn.close();
        return res;
    }
}



