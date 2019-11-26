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
public class modDescuento {
    
    int CveDescuento, CveTipoDesc;
    float RazonDesc;
    String FechaInicio, FrechaFin;

    public int getCveDescuento() {
        return CveDescuento;
    }

    public void setCveDescuento(int CveDescuento) {
        this.CveDescuento = CveDescuento;
    }

    public int getCveTipoDesc() {
        return CveTipoDesc;
    }

    public void setCveTipoDesc(int CveTipoDesc) {
        this.CveTipoDesc = CveTipoDesc;
    }

    public float getRazonDesc() {
        return RazonDesc;
    }

    public void setRazonDesc(float RazonDesc) {
        this.RazonDesc = RazonDesc;
    }

    public String getFechaInicio() {
        return FechaInicio;
    }

    public void setFechaInicio(String FechaInicio) {
        this.FechaInicio = FechaInicio;
    }

    public String getFrechaFin() {
        return FrechaFin;
    }

    public void setFrechaFin(String FrechaFin) {
        this.FrechaFin = FrechaFin;
    }
    
    
    

    public modDescuento(int cve) throws SQLException {
        this.CveDescuento=cve;
        
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_DATOSDESCUENTO("+cve+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        
        while (rs.next()) {
            this.CveTipoDesc=Integer.parseInt(rs.getString(2));
            this.RazonDesc=Float.parseFloat(rs.getString(3));
            this.FechaInicio=rs.getString(4);
            this.FrechaFin=rs.getString(5);
        }
        rs.close();
        cnn.close();
    }
    
    public int regDescuento() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_REGDESCUENTO("+CveTipoDesc+","+RazonDesc+","+FechaInicio+","+FrechaFin+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int modificarDescuento() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_MODDESCUENTO("+CveDescuento+","+CveTipoDesc+","+RazonDesc+","+FechaInicio+","+FrechaFin+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
}
