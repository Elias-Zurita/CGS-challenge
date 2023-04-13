<%@LANGUAGE="VBSCRIPT" LCID = 1034%>
<!-- #include virtual=/include/seguridad.asp -->
<!-- #include virtual=/include/constantes.asp -->
<!-- #include file=../include/Funciones.asp -->
<!-- #include file=../include/numeroaletras.asp -->
<%
dim vidEstado, vCliente, vDocumento
dim Rs, oMain, eureka, vDescUni, sPar


vNroCon = request("txtNroCon")


eureka = true
sPar =  "id_contrato=" & vNroCon
'response.write sPar
'response.End

Set Rs = objcon.execStoreparam("spRecordatorio_TraerUno", CStr(sPar))

%>
<html>
<head>
<title>Referente S.A.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link href="../include/estilos.css" rel="stylesheet" type="text/css">
	<STYLE>
	 H1.SaltoDePagina
	 {
	     PAGE-BREAK-AFTER: always
	 }
	</STYLE>
	<script>
		function doPrint(){
			document.all.divImp.style.display='none';	
			window.print();
			self.close();
		}			
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="document.body.oncontextmenu = new Function('return false;');">
<table width="700" border="0" valign="top" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			<div id="divImp" name="divImp" style="display:block">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr><td width="100%" height="20"></td></tr>
				</table>
				<table width="90%" border="0" cellpadding="2" cellspacing="2" class="lineabordeAzul">
				    <tr><td bgcolor="#FFFFFF" class="celdatitular">IMPRESION DE RECORDATORIO Y PAGARES</td></tr>
				    <tr>
				  		<td bgcolor="#FFFFFF" class="textazul">
				  			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="textazul">
				  				<tr>
				  					<td height="15" width="30%" align="left">&nbsp;</td>
									<td height="15" width="15%" align="right"><%if eureka then%><input type="button" id="cmdPrint" name="cmdPrint" value="Imprimir" class="Boton-aceptar" onClick="doPrint();" style="cursor:hand"><%else%><%end if%></td>
									<td height="15" width="15%" align="right"><input type="button" id="cmdClose" name="cmdClose" value="Cerrar" class="Boton-aceptar" onClick="self.close();" style="cursor:hand"></td>
								</tr> 
							</table>
						</td>
					</tr>
					</tr>
				</table>
				<br>
			</div>
		</td>
	</tr>
	<%if not eureka then%>
		<tr>
			<td align="center">
				<table width="90%" cellpadding="0" class="celdabotones" cellspacing="0" style="border:1px solid;border-color:FF5555" align="center">
					<tr><td height="10" width="100%"><font color="FF5555">No se encontraron datos para este reporte con los filtros especificados</font></td></tr>
				</table>
			</td>
		</tr>
</table>
		<%response.end%>
	<%end if%>
	
    


<table width="80%" border="0" cellpadding="2" cellspacing="2"  align="center">

			<tr>
			 <td width="45%"  colspan="2">&nbsp;
				<img  alt="logo" src="../Images/PagareLogo_Gs.png" />
			 </td>
			</tr>
			<tr>
				<td align="right" > <b>
				Fecha: <%= rs("Fecha10")%> 
				<b>
				</td>
			</tr>
			<tr>
		      <td>Recib&iacute; de <%= rs("Sociedad")%>   de la suma de pesos:
			   <%= rs("MontoLTS")%>
			  en  <%= rs("Equis")%> en concepto del cr&eacute;dito otorgado, 
			  instrumentado en la solicitud nro: <%= rs("Contrato")%> que pagar&eacute; en <%= rs("Cuotas")%> cuotas 
			  mensuales consecutivas con vencimiento el d&iacute;a <%= rs("Dia_Vto")%> de cada mes.
			  </td>
			 </tr> 
			<tr>
		      <td>  
			  Comercio: <%= rs("Comercio")%> / C&oacute;digo: <%= rs("NroCom")%>  / <%= rs("Sucursal")%> 
			  </td>
			 </tr>
			<tr>
		      <td> 
			  Son $<%=formatnumber (rs("Capital"),2)%> &nbsp;
			  <%if rs("TipoCred").value = "N" then response.write ("*orden de compra v&aacute;lida por 10 d&iacute;as") end if
			  %>
			  </td>
			 </tr>
			 <tr>
		      <td align="right" > 
			  _________________________________________________
			  </td>
			 </tr>
			 <tr>
		      <td align="right" > 
			  <b>Firma del beneficiario DNI:			 <%= rs("Documento")%> / <%= rs("Cliente")%> 	<b>
			 </td>
			 </tr> 
			 
</table>

<br /><br /><br /> <br /> 
<table width="80%" border="0" cellpadding="2" cellspacing="2"  align="center">

			<tr>
			 <td width="35%"  colspan="2">&nbsp;
				<img  alt="logo" src="../Images/PagareLogo_Gs.png" />
			 </td>
			</tr>
			<tr>
				<td align="right" > <b>
				Fecha: <%= rs("Fecha10")%> 
				<b>
				</td>
			</tr>
		    <tr>
		      <td>Recib&iacute; de <%= rs("Sociedad")%>   de la suma de pesos:
			   <%= rs("MontoLTS")%>
			  en  <%= rs("Equis")%> en concepto del cr&eacute;dito otorgado, 
			  instrumentado en la solicitud nro: <%= rs("Contrato")%> que pagar&eacute; en <%= rs("Cuotas")%> cuotas 
			  mensuales consecutivas con vencimiento el d&iacute;a <%= rs("Dia_Vto")%> de cada mes.
			  </td>
			 </tr> 
			<tr>
		      <td>  
			  Comercio: <%= rs("Comercio")%> / C&oacute;digo: <%= rs("NroCom")%>  / <%= rs("Sucursal")%> 
			  </td>
			 </tr>
			<tr>
		      <td> 
			  Son $<%=formatnumber (rs("Capital"),2)%> &nbsp;
			   <%if rs("TipoCred").value = "N" then  response.write ("*orden de compra v&aacute;lida por 10 d&iacute;as")   end if
			  %>
			  </td>
			 </tr>
			 <tr>
		      <td align="right" > 
			  _________________________________________________
			  </td>
			 </tr>
			 <tr>
		      <td align="right" > 
			 <b> Firma del beneficiario DNI:			 <%= rs("Documento")%> / <%= rs("Cliente")%> 	<b>
			 </td>
			 </tr> 
			 <tr>
		     
</table>

<br /><br /><br /><br /> <br /><br /> <br />

<table height="50%">	
<table> 
 <tr>
        <td width="45%"  colspan="2">&nbsp;
            <img  alt="logo" src="../Images/RecordatorioLogo_Gs.png" style="width: 650px"/>
        </td>
		
    </tr>
</table>	
	

<table width="80%" border="0" cellpadding="2" cellspacing="2" class="lineabordeAzul" align="center">
		    <tr>
		      <td bgcolor="#FFFFFF" class="celdatitular">Apellido y Nombre: <%= rs("Cliente")%>  </td>
			  <td bgcolor="#FFFFFF" class="celdatitular">Documento: <%= rs("Documento")%>  </td>
			  <td bgcolor="#FFFFFF" class="celdatitular"><%= rs("Sucursal")%>  </td>
		    </tr>
			 <tr>
		      <td bgcolor="#FFFFFF" class="celdatitular">Importe Credito: $<%=formatnumber (rs("Capital"),2)%>  </td>
			  <td bgcolor="#FFFFFF" class="celdatitular">Cuotas:  <%= rs("Cuotas")%>  </td>
			  <td bgcolor="#FFFFFF" class="celdatitular">Contrato: <%= rs("Contrato")%>  </td>
		    </tr>
</table>


<table width="80%" align="center" border="1">


					<tr>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 1</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 2</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 3</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 4</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 5</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 6</b></td>
					</tr>
                    <tr>
                   
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota1")%> <br> Importe $<%=formatnumber (rs("ImpCuota1"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota2")%> <br> Importe $<%=formatnumber (rs("ImpCuota2"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota3")%> <br> Importe $<%=formatnumber (rs("ImpCuota3"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota4")%> <br> Importe $<%=formatnumber (rs("ImpCuota4"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota5")%> <br> Importe $<%=formatnumber (rs("ImpCuota5"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota6")%> <br> Importe $<%=formatnumber (rs("ImpCuota6"),2)%> </td>
 
                    </tr>
					<tr>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 7</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 8</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 9</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 10</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 11</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 12</b></td>
					</tr>
					<tr>
                   
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota7")%> <br> Importe $<%=formatnumber (rs("ImpCuota7"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota8")%> <br> Importe $<%=formatnumber (rs("ImpCuota8"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota9")%> <br> Importe $<%=formatnumber (rs("ImpCuota9"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota10")%> <br> Importe $<%=formatnumber (rs("ImpCuota10"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota11")%> <br> Importe $<%=formatnumber (rs("ImpCuota11"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota12")%> <br> Importe $<%=formatnumber (rs("ImpCuota12"),2)%> </td>
 
                    </tr>
					<tr>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 13</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 14</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 15</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 16</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 17</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 18</b></td>
					</tr>
					<tr>
                   
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota13")%> <br> Importe $<%=formatnumber (rs("ImpCuota13"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota14")%> <br> Importe $<%=formatnumber (rs("ImpCuota14"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota15")%> <br> Importe $<%=formatnumber (rs("ImpCuota15"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota16")%> <br> Importe $<%=formatnumber (rs("ImpCuota16"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota17")%> <br> Importe $<%=formatnumber (rs("ImpCuota17"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota18")%> <br> Importe $<%=formatnumber (rs("ImpCuota18"),2)%> </td>
 
                    </tr>
                    <tr>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 19</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 20</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 21</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 22</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 23</b></td>
						<td class="BodyReportes" style="font-size:12px;"><b>Cuota 24</b></td>
					</tr>
					<tr>
                   
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota19")%> <br> Importe $<%=formatnumber (rs("ImpCuota19"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota20")%> <br> Importe $<%=formatnumber (rs("ImpCuota20"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota21")%> <br> Importe $<%=formatnumber (rs("ImpCuota21"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota22")%> <br> Importe $<%=formatnumber (rs("ImpCuota22"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota23")%> <br> Importe $<%=formatnumber (rs("ImpCuota23"),2)%> </td>
                        <td align="right" class="BodyReportes" style="font-size:12px;">vence el: <%= rs("cuota24")%> <br> Importe $<%=formatnumber (rs("ImpCuota24"),2)%> </td>
 
                    </tr>

</table>               
</table>

</body>
</html>