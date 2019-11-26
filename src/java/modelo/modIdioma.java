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
public class modIdioma {
    int CveIdioma;
    String Idioma;
    float CostoPalabra;
    char Status;

    public modIdioma(int cve) throws SQLException {
        this.CveIdioma = cve;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_DATOSIDIOMA("+cve+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        
        while (rs.next()) {
            this.Idioma=rs.getString(2);
            this.CostoPalabra=Float.parseFloat(rs.getString(3));
            this.Status=rs.getString(4).charAt(0);
        }
        rs.close();
        cnn.close();
    }
    
    
}
