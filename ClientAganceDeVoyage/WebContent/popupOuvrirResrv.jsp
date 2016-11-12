<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="pac.VolGenerique"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.util.List"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ouvrir reservation Vol</title>
<style type="text/css">
	body
	{
		background-color: #7FC6BC;
	}
</style>	
</head>
<script type="text/javascript" src="JSs/jquery.calendar.js"></script>
<body>
<form action="serv" method="post">
<% 
if(request.getParameter("idVolg")!=null){
int id = Integer.parseInt(request.getParameter("idVolg"));
session.setAttribute("idVolg",id);
}
else{
	try{
		InitialContext ctxt = new InitialContext();
		GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");		
		List<VolGenerique> vg = GV.listerVolG();
		int id =vg.get(vg.size()-1).getVolG();
		session.setAttribute("idVolg",id);
	}catch(NamingException e){e.printStackTrace();}
	
}
%>


<table  cellspacing="0" cellpadding="0">
<tr>
<td>Date Début : </td>
<td><input type="text" maxlength="10" name="dateD" id="dateDebut" onFocus="view_microcal(true,dateDebut,microcal,-1,0);" onBlur="view_microcal(false,dateDebut,microcal,-1,0);" onKeyUp="this.style.color=testTypeDate(this.value)?'black':'red'"></td></tr>

<tr>
      <td><div id="microcal" style="visibility:hidden;position:absolute;border:2px blue dashed;background:#ffffff;"></div></td>
</tr>

<tr><td>Priode Validité/mois : </td><td><input type="text" name="p"></td></tr>
<tr><td><input type="submit" name="validerOuvrirReserv" value="Valider"></td></tr>
</table>
</form>
</body>
</html>