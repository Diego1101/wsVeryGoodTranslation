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
public class modTraduccion {
    int CveTrad, CveCliente, CveVendedor, CveIdiomaOrigen, CveIdiomaDestino, CveTipoTrad, CveTraductor, CveDescuento, Calificacion;
    char Status;
    String RutaDoc, RutaTrad, FechaOrden, FechaEntrega;
    float Palabras, Precio, Descuento, Subtotal, Iva, Total;

    public modTraduccion() {
    }

    public int getCveTrad() {
        return CveTrad;
    }

    public void setCveTrad(int CveTrad) {
        this.CveTrad = CveTrad;
    }

    public int getCveCliente() {
        return CveCliente;
    }

    public void setCveCliente(int CveCliente) {
        this.CveCliente = CveCliente;
    }

    public int getCveVendedor() {
        return CveVendedor;
    }

    public void setCveVendedor(int CveVendedor) {
        this.CveVendedor = CveVendedor;
    }

    public int getCveIdiomaOrigen() {
        return CveIdiomaOrigen;
    }

    public void setCveIdiomaOrigen(int CveIdiomaOrigen) {
        this.CveIdiomaOrigen = CveIdiomaOrigen;
    }

    public int getCveIdiomaDestino() {
        return CveIdiomaDestino;
    }

    public void setCveIdiomaDestino(int CveIdiomaDestino) {
        this.CveIdiomaDestino = CveIdiomaDestino;
    }

    public int getCveTipoTrad() {
        return CveTipoTrad;
    }

    public void setCveTipoTrad(int CveTipoTrad) {
        this.CveTipoTrad = CveTipoTrad;
    }

    public int getCveTraductor() {
        return CveTraductor;
    }

    public void setCveTraductor(int CveTraductor) {
        this.CveTraductor = CveTraductor;
    }

    public int getCveDescuento() {
        return CveDescuento;
    }

    public void setCveDescuento(int CveDescuento) {
        this.CveDescuento = CveDescuento;
    }

    public int getCalificacion() {
        return Calificacion;
    }

    public void setCalificacion(int Calificacion) {
        this.Calificacion = Calificacion;
    }

    public char getStatus() {
        return Status;
    }

    public void setStatus(char Status) {
        this.Status = Status;
    }

    public String getRutaDoc() {
        return RutaDoc;
    }

    public void setRutaDoc(String RutaDoc) {
        this.RutaDoc = RutaDoc;
    }

    public String getRutaTrad() {
        return RutaTrad;
    }

    public void setRutaTrad(String RutaTrad) {
        this.RutaTrad = RutaTrad;
    }

    public String getFechaOrden() {
        return FechaOrden;
    }

    public void setFechaOrden(String FechaOrden) {
        this.FechaOrden = FechaOrden;
    }

    public String getFechaEntrega() {
        return FechaEntrega;
    }

    public void setFechaEntrega(String FechaEntrega) {
        this.FechaEntrega = FechaEntrega;
    }

    public float getPalabras() {
        return Palabras;
    }

    public void setPalabras(float Palabras) {
        this.Palabras = Palabras;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float Precio) {
        this.Precio = Precio;
    }

    public float getDescuento() {
        return Descuento;
    }

    public void setDescuento(float Descuento) {
        this.Descuento = Descuento;
    }

    public float getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(float Subtotal) {
        this.Subtotal = Subtotal;
    }

    public float getIva() {
        return Iva;
    }

    public void setIva(float Iva) {
        this.Iva = Iva;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    
    
    
    
    
    public modTraduccion(int cve) throws SQLException {
        this.CveTrad = cve;
        
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_DATOSTRADUCCION("+cve+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        while (rs.next()) {
            this.CveCliente=Integer.parseInt(rs.getString(2));
            this.CveVendedor=Integer.parseInt(rs.getString(3));
            this.CveIdiomaOrigen=Integer.parseInt(rs.getString(4));
            this.CveIdiomaDestino=Integer.parseInt(rs.getString(5));
            this.CveTipoTrad=Integer.parseInt(rs.getString(6));
            this.CveTraductor=Integer.parseInt(rs.getString(7));
            this.CveDescuento=Integer.parseInt(rs.getString(8));
            this.Status=rs.getString(9).charAt(0);
            this.RutaDoc=rs.getString(10);
            this.RutaTrad=rs.getString(11);
            this.FechaOrden=rs.getString(12);
            this.FechaEntrega=rs.getString(13);
            this.Palabras=Float.parseFloat(rs.getString(14));
            this.Precio=Float.parseFloat(rs.getString(15));
            this.Descuento=Float.parseFloat(rs.getString(16));
            this.Subtotal=Float.parseFloat(rs.getString(17));
            this.Iva=Float.parseFloat(rs.getString(18));
            this.Total=Float.parseFloat(rs.getString(19));
            this.Calificacion=Integer.parseInt(rs.getString(20));
        }
        rs.close();
        cnn.close();
    }
    
    public int regTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_REGTRADUCCION("+CveCliente+","+CveVendedor+","+CveIdiomaOrigen+","+CveIdiomaDestino+","+CveTipoTrad+","+CveTraductor+","+CveDescuento+","+Status+",'"+RutaDoc+"','"+RutaTrad+"',"+Palabras+","+Precio+","+Descuento+","+Subtotal+","+Iva+","+Total+","+Calificacion+");";
        System.out.println(consultaSql);
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int modificarTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_MODTRADUCCION("+CveTrad+","+CveCliente+","+CveVendedor+","+CveIdiomaOrigen+","+CveIdiomaDestino+","+CveTipoTrad+","+CveTraductor+","+CveDescuento+","+Status+","+RutaDoc+","+RutaTrad+","+FechaEntrega+","+Palabras+","+Precio+","+Descuento+","+Subtotal+","+Iva+","+Total+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int statusTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_STSTRADUCCION("+CveTrad+","+Status+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public ResultSet listarTipoTraduccion() throws SQLException{
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_LISTARTIPOTRADUCCION();";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public int retardoTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_STSTRADUCCION("+CveTrad+","+FechaEntrega+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int asigTraductorTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_STSTRADUCCION("+CveTrad+","+CveVendedor+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int asigVendedorTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_ASIGNARVENDEDORTRAD("+CveTrad+","+CveVendedor+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int modificarDescuentoTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_MODIFICARDESCUENTOTRAD("+CveTrad+","+Descuento+","+Subtotal+","+Iva+","+Total+","+CveDescuento+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    public int calificarTraduccion() throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_CALIFICARTRAD("+CveTrad+","+Calificacion+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
    
    
     public static int modPrecioTraduccion(float e, float c, float p) throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_MODFPRECIO("+e+","+c+","+p+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);

        while (rs.next()) {
            res=Integer.parseInt(rs.getString(1));
        }
        rs.close();
        cnn.close();
        return res;
    }
     
     public ResultSet modCotizar(float impuesto) throws SQLException{
        int res=0;
        modConexion con=new modConexion();
        Connection cnn=con.conexion();
        String consultaSql = "call STP_COTIZACIONTRAD("+this.CveTrad+", "+impuesto+");";
        Statement st = (Statement) cnn.createStatement();
        ResultSet rs = st.executeQuery(consultaSql);
        return rs;
    }
}
