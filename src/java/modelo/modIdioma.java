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

    public int getCveIdioma() {
        return CveIdioma;
    }

    public void setCveIdioma(int CveIdioma) {
        this.CveIdioma = CveIdioma;
    }

    public String getIdioma() {
        return Idioma;
    }

    public void setIdioma(String Idioma) {
        this.Idioma = Idioma;
    }

    public float getCostoPalabra() {
        return CostoPalabra;
    }

    public void setCostoPalabra(float CostoPalabra) {
        this.CostoPalabra = CostoPalabra;
    }

    public char getStatus() {
        return Status;
    }

    public void setStatus(char Status) {
        this.Status = Status;
    }

    
    
    
    
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
    
    public int regIdioma() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_REGIDIOMA("+Idioma+","+CostoPalabra+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int modificarIdioma() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_MODIDIOMA("+CveIdioma+","+Idioma+","+CostoPalabra+","+Status+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int statusIdioma() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_STSIDIOMA("+CveIdioma+","+Status+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public ResultSet listarTraductoresIdioma() throws SQLException{
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_LISTARTRADUCTORESIDIOMA("+CveIdioma+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet listarIdiomas() throws SQLException{
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_LISTARIDIOMAS();";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    
}
