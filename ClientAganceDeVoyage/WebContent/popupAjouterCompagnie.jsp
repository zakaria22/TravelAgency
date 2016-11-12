<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.CompagnieAérienne"%>
<%@page import="javax.naming.NamingException"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajouter Compagnie</title>
<style type="text/css">
	body
	{
		background-color: #7FC6BC;
	}
</style>	
</head>
<body>
<form action="serv" method="post">
<table> 
<tr>
<td>Liste Compagnies Aériennes : <select name="LC">
<option value="-1">-------</option>
<%
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");		
	List<CompagnieAérienne> ca = GV.listerCA();
	for(int i=0;i<ca.size();i++){%>
		<option><%=ca.get(i).getNomA() %></option> 
	<%}
}catch(NamingException e){e.printStackTrace();}%>
</select></td></tr>
<tr><td>Entrez un nom d'acompagnie aérienne :<input type="text" name="nomC"></td><td><input type="submit" value="Add" name="AddC"></td></tr>
</table>
</form>
</body>
</html>