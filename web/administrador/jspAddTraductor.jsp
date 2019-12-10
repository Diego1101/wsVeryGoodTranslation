<%-- 
    Document   : jspAddTraductor
    Created on : Dec 10, 2019, 1:19:17 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <div class="fondo-negro">
    <center >
      <div class="titulo">
        Registro de Traductores
      </div>
    </center>
  </div>


  <section class="m-content">
    <center>
         <form method="post" action="administrador.do" id="formTrad">
             <table>
                 <%
                    if (request.getAttribute("edo") != null) {
                %>
                <tr>
                    <td>

                        <div id="error" style="text-align: center; color: #ecef01; font-weight: bold;">
                            <%=request.getAttribute("edo")%>
                        </div>

                    </td>
                </tr>
                <%
                    }
                %>
             </table>
             <table>
        <tr>
          <td align="right" class="texto-Centro">
            Nombre:
          </td>
          <td>
     <input type="text" class="form-control" name="txt_Nombre" placeholder="Nombre del traductor" id="txt_Nombre" style="min-width: 240px; width:240;"value="<% out.print((request.getAttribute("txt_Nombre")!=null)?request.getAttribute("txt_Nombre"):"");  %>">
          </td>
        </tr>
        <tr style="height:25px;">
            <td></td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Apellido:
          </td>
          <td>
              <input type="text" class="form-control" name="txt_Apellido" placeholder="Apellido" id="txt_Apellido" value="<% out.print((request.getAttribute("txt_Apellido")!=null)?request.getAttribute("txt_Apellido"):"");  %>" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr style="height:25px;">
            <td></td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Correo Electrónico:
          </td>
          <td>
              <input type="email" class="form-control" value="<% out.print((request.getAttribute("txt_CorreoElectronico")!=null)?request.getAttribute("txt_CorreoElectronico"):"");  %>"  name="txt_CorreoElectronico" placeholder="Correo" id="txt_CorreoElectronico" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr style="height:25px;">
            <td></td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Teléfono:
          </td>
          <td>
              <input type="text" class="form-control" name="txt_Telefono" value="<% out.print((request.getAttribute("txt_Tel")!=null)?request.getAttribute("txt_Tel"):"");  %>" placeholder="Teléfono" id="txt_Telefono" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr style="height:25px;">
            <td></td>
        </tr>
        <tr>
          <td align="right" class="texto-Centro">
            Dirección:
          </td>
          <td>
              <input type="text" class="form-control" name="txt_Direccion" value="<% out.print((request.getAttribute("txt_Direccion")!=null)?request.getAttribute("txt_Direccion"):"");  %>" placeholder="Dirección" id="txt_Direccion" style="min-width: 240px; width:240;">
          </td>
        </tr>
        <tr style="height:25px;">
            <td></td>
        </tr>
          <tr align="center">
            <td colspan="2">
                <input type="submit" class="btn" name="btn_Registrar" value="Registrar" id="btn_Registrar">
                <input type="hidden" name="org" value="addTraductor" id="org">
            </td>                          
          </tr>
            </table>
        </form>
    </center>
    </div>
  </section>
          