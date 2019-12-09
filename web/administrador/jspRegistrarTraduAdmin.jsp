<%-- 
    Document   : jspRegistrarTraduAdmin
    Created on : Dec 8, 2019, 5:58:08 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div class="fondo-negro">
     <center >
       <div class="titulo">
         Registrar Traducción
       </div>
     </center>
   </div>

   <section class="m-content" style="min-width:700px">
         <center class="prz">
           <div class="texto2" style="background: none;" id="div_Cliente">
           <table>
             <tr align="center">
               <td colspan="2" style="font-size: 20pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
                 Datos del cliente
               </td>
             </tr>
             <tr>
               <td  align="right">
                 Nombre:
               </td>
               <td>
                   <input type="text" class="form-control" name="txt_Nombre" id="txt_Nombre" >
               </td>
             </tr>
             <tr>
               <td  align="right">
               Apellidos:
             </td>
             <td>
                 <input type="text" class="form-control" name="txt_Apellido" id="txt_Apellido">
             </td>
           </tr>
             <tr>
               <td  align="right">
                 Teléfono:
               </td>
               <td>
                   <input type="text" class="form-control" name="txt_Telefono" id="txt_Telefono">
               </td>
             </tr>
             <tr>
               <td  align="right">
               Tipo de cliente:
             </td>
             <td>
               <select class="form-control" id="cmb_Cliente" style="color:#6b6b6b" name="cmb_Sexo">
                 <option>Elige una opción</option>
                 <option>Masculino</option>
                 <option>Femenino</option>
                 <option>Otro</option>
               </select>
             </td>
           </tr>
             <tr>
               <td align="right">
                 Correo electrónico:
               </td>
               <td >
                 <input type="email" class="form-control" name="txt_Email" id="txt_Email">
               </td>
             </tr>
             <tr>
               <td align="center" colspan="2">
                 <input type="submit" class="btn" name="btn_Registrar" value="Registrar" id="btn_Registrar">
               </td>
             </tr>
           </table>
           </div>
         </center>
   </section>
   <hr>
   <section class="m-content" style="min-width:700px">
     <center class="prz">
     <div class="texto2" style="background: none;">
         <table>
           <tr align="center">
             <td colspan="2" style="font-size: 19pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
               Idioma
             </td>
           </tr>
           <tr>
             <td  align="right">
               Origen:
             </td>
             <td>
               <select class="form-control" name="cmb_IdiomaOrigen" id="cmb_IdiomaOrigen">
                 <option>Elige una opción</option>
                 <option value="Ingles">Inglés</option>
                 <option value="Español">Español</option>
                 <option value="Chino">Chino</option>
                 <option value="Japonés">Japonés</option>
               </select>
             </td>
           </tr>
           <tr>
             <td  align="right">
               Destino:
             </td>
             <td>
               <select class="form-control" name="cmb_IdiomaDestino" id="cmb_IdiomaDestino">
                 <option>Elige una opción</option>
                 <option value="Ingles">Inglés</option>
                 <option value="Español">Español</option>
                 <option value="Chino">Chino</option>
                 <option value="Japonés">Japonés</option>
               </select>
             </td>
           </tr>
           <tr>
             <td align="right">
               Traductor:
             </td>
             <td>
               <select class="form-control"name="cmb_Traductor" id="cmb_Traductor" >
                 <option>Elige una opción</option>
                 <!-- este se tiene que llenar de bd-->
               </select>
             </td>
           </tr>
           <tr>
             <td align="right">
               Tipo Traducción:
               </td>
             <td>
               <select class="form-control" name="cmb_TipoTraducion" id="cmb_TipoTraducion">
                 <option>Elige una opción</option>

               </select>
             </td>
           </tr>
         </table>
       </div>
       </center>

   <center class="prz">
     <div class="texto2" style="background: none;">
       <table>
         <tr align="center">
           <td colspan="2" style="font-size: 19pt; font-weight: bold; text-shadow: none; border-radius: 50px;">
             Documento
           </td>
         </tr>
         <tr>
           <td>
             Ubicación:
           </td>
           <td align="center">
               <input type="file" id="flu_Archivo"name="flu_Archivo" style="font-size: 10pt;"/>
           </td>
         </tr>
         
         <tr>
           <td>
             Número de palabras:
           </td>
           <td>
             <input type="number" class="form-control" min="10" name="txt_CantidadPalabras" id="txt_CantidadPalabras"/>
           </td>
         </tr>
           <tr>
             <td>
               Fecha de entrega:
             </td>
             <td>
               <input type="date" class="form-control" name="txt_FechaEntrega" id="txt_FechaEntrega">
             </td>
           </tr>
       </table>
     </div>
       <input type="button" class="btn" name="btn_CalcularTotal" value="Calcular Desglose" id="btn_CalcularTotal" onclick="aparecerModulo()">
 </center>
   </section>
   <script type="text/javascript">

      function aparecerModulo() {
         // Primero se tienen que mandar los datos de la traduccion y si se registro bien entonces mostrara el desglose
        var div1 = document.getElementById("div_Desglose");
        if (div1.style.display == "none" ){

            div1.style.display = "block";
         }

}
    </script>
   <hr>
   
   <section class="m-content" id="div_Desglose" style="min-width:700px;display:none;">
     <center class="trd">
       <div  style="min-width:700px;" >
         <table>
           <tr>
             <td align="right" style="font-size:16pt;">
               Descuento: $
             </td>
             <td >
              <input type="text" class="form-control"  name="txt_CodigoDescuento" id="txt_CodigoDescuento" style="width: 180px;" width="150px;"/>
             </td>
             
           </tr>
           <tr>
               <td></td>
               <td align="center" >
               <input type="submit" class="btn" name="btn_AplicarDescuento" value="Aplicar" id="btn_AplicarDescuento" style="align-items: left;">
             </td>
           </tr>
           
         </table>
         <table style="margin:20px">
           <tr align="center">
             <td colspan="2" style="font-size: 19pt; background: none; font-weight: bold; text-shadow: none; border-radius: 50px;">
               Desglose
             </td>
           </tr>

           <tr>
             <td align="right" style="font-size:16pt;">
               Descuento:
             </td>
             <td style="background: #eee; padding: 10px 20px 10px 10px">
               <label id="lblDescuento" name="lblDescuento"style="line-height: 0;">--</label>
             </td>
           </tr>
           <tr>
             <td align="right" style="font-size:16pt;">
             Subtotal:
             </td>
             <td style="background: #eee; padding: 10px 20px 10px 10px">
                 <label id="lblSubtotal" name="lblSubtotal"style="line-height: 0;">--</label>
             </td>
           </tr>
           <tr>
             <td align="right" style="font-size:16pt;">
               IVA:
             </td>
             <td style="background: #eee; padding: 10px 20px 10px 10px">
                 <label id="lblIva" name="lblIva" style="line-height: 0;">--</label>
             </td>
           </tr>
           <tr>
             <td align="right" style="font-size:16pt;">
               Total:
             </td>
             <td style="background: #ccc; padding: 10px 20px 10px 10px; color:#000;">
                 <label id="lblTotal" name="lblTotal"style="line-height: 0;">--</label>
             </td>
           </tr>
           <tr><td></td></tr>
           <tr align="center">
             <td colspan="2" style="background:none">
                 <input type="submit" class="btn" name="btn_Registrar" value="Confirmar" id="btn_Confirmar">
             </td>
           </tr>
         </table>
       </div>
     </center>
   </section>
