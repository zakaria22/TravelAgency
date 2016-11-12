<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.VolGenerique"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.InfoEscale"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Escale</title>
<style type="text/css">
	body
	{
		background-color: #7FC6BC;
	}
</style>	
</head>
<body>
<h3>Info Escale :</h3>
<table border='1'>
<tr><td>Escales</td><td>Aéroport Escale</td><td>Heure début</td><td>Heure Fin</td></tr>
<% 
int idVolg = Integer.parseInt(request.getParameter("idVolg"));
int nu =0;
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");		
	List<InfoEscale> LinfoEscales = GV.listerEscal();
	for(int i=0;i<LinfoEscales.size();i++){
		if(LinfoEscales.get(i).getVolG().getVolG()==idVolg)
		{nu++;%>
		<tr><td>Escale N:<%out.print(nu);%></td><td><%=LinfoEscales.get(i).getAeroport().getNomA() %></td><td><%=LinfoEscales.get(i).getHeureD() %></td><td><%=LinfoEscales.get(i).getHeureD() %></td></tr>
	
	<%}}
}catch(NamingException e){e.printStackTrace();}%>
</table>
</body>
</html>