<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.Pays"%>
<%@page import="javax.naming.NamingException"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body
	{
		background-color: #7FC6BC;
	}
</style>	
<script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function showPays(idP){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      	      	
      var url="serv";
      url +="?idpp=" +idP;
      
      xmlHttp.onreadystatechange = stateChangePays;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      
      }
		
      function stateChangePays(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
    	  		
          document.getElementById("listVill").innerHTML=xmlHttp.responseText
          //document.getElementById("divA").innerHTML=defaultStatus    
          //document.getElementById("div1").innerHTML=defaultStatus
      }   
      }     
</script>
</head>
<body>
<form action="serv" method="post">
<table> 
<tr>
<td>Liste Pays : <select name="LP" onchange="showPays(this.value)">
<option value="-1">-------</option>
<%
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");		
	
	List<Pays> P = GV.listerP();
	for(int i=0;i<P.size();i++){%>
		<option value="<%=P.get(i).getIdPays() %>"><%=P.get(i).getNomPays() %></option> 
	<%}
}catch(NamingException e){e.printStackTrace();}%>
</select></td>
<td id="listVill">Liste des villes :<select name="LV" ><option value="-1">------</option></select></td></tr>




<tr><td>Entrez un nom d'Aéroport :<input type="text" name="nomAeroport"></td><td><input type="submit" value="Add" name="AddA"></td></tr>
</table>

</form>
</body>
</html>