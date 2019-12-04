<%-- 
    Document   : jspABCVendedor
    Created on : 22/10/2019, 11:23:09 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



  <div class="fondo-negro">
    <center >
      <div class="titulo">
        Registro de vendedores
      </div>
    </center>
  </div>

<!--
Nombre
Apellidos
Usuario
Sexo
Telefono
Dirección
Correo

-->


  <section class="m-content">
    <center>
      <table>
        <tr>
          <td style="text-align: right">
              <h4 class="texto-Centro">Nombre:</h4>
          </td>
          <td>
              <div class="col-lg-6">
                <input type="text" class="form-control" name="txt_Nombre" placeholder="Nombre del empleado" id="txt_Nombre" style="min-width: 240px; width:240;">
              </div>
          </td>
        </tr>

        <tr>
          <td style="text-align: right">
            <br>
            <div class="texto-Centro">
              <h4 class="texto-Centro">Apellidos:</h4>
            </div>
          </td>
          <td>
            <br>
              <div class="col-lg-6">
                <input type="text" class="form-control" name="txt_Apellidos" placeholder="Apellidos del empleado" id="txt_Apellidos" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>

        <tr>
          <td style="text-align: right">
            <br>
            <div >
              <h4 class="texto-Centro">Usuario:</h4>
              </div>
          </td>
          <td>
            <br>
              <div class="col-lg-6">
                <input type="text" class="form-control" name="txt_Usuario" placeholder="Nombre de usuario" id="txt_Usuario" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>

        <tr>
          <td style="text-align: right">
            <br>
            <div >
              <h4 class="texto-Centro">Sexo:</h4>
              </div>
          </td>
          <td>
            <br>
            <form action="" method="get" class="small">
              <div class="col-lg-6" style="min-width: 270px; width:270;">
                <select class="form-control" style="color:#6b6b6b" name="cmbSexo" style="min-width: 240px; width:240 !important;">
                  <option>Elige una opción</option>
                  <option>Masculino</option>
                  <option>Femenino</option>
                  <option>Otro</option>
                </select>
                </div>
          </td>
        </tr>

        <tr>
          <td style="text-align: right">
            <br>
            <div >
              <h4 class="texto-Centro">Teléfono:</h4>
              </div>
          </td>
          <td>
            <br>
              <div class="col-lg-6">
                <input type="text" class="form-control" name="txt_Tel" placeholder="Número telefónico" id="txt_Tel" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>

        <tr>
          <td style="text-align: right">
            <br>
            <div >
              <h4 class="texto-Centro">Correo:</h4>
              </div>
          </td>
          <td>
            <br>
            <form action="" method="get" class="small">
              <div class="col-lg-6">
                <input type="email" class="form-control" name="txt_Correo" placeholder="example@domain.com" id="txt_Correo" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>

        <tr>
          <td style="text-align: right">
            <br>
            <div class="small">
              <h4 class="texto-Centro">Dirección:</h4>
              </div>
          </td>
          <td>
            <br>
              <div class="col-lg-6">
                <input type="text" class="form-control" name="txt_Dir" placeholder="Dirección" id="txt_Dir" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>

        <tr>
          <td style="text-align: right;">
            <br>
            <div >
              <h4 class="texto-Centro">Fecha de Nacimiento:</h4>
              </div>
          </td>
          <td>
            <br>
            <form action="" method="get" class="small">
              <div class="col-lg-6">
                <input type="date" class="form-control" name="txt_Fecha" id="txt_Fecha" style="min-width: 240px; width:240;">
                </div>
          </td>
        </tr>
        <tr>
          <td colspan="2" style="text-align: center; padding: 50px 0 0 0">
              <div>
                <input type="submit" href="#contact" class="btn " name="btn_Registrar" value="Registrar" id="btn_Registrar" style="min-width: 240px; width:240;">
              </div>
          </td>
          <td>
          </td>
        </tr>


      </table>
    </center>
    <br>
    </div>
  </section>