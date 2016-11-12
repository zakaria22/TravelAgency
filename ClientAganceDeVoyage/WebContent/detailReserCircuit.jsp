<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="pac.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="pac.Passager"%>
<%@page import="java.util.Vector"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Menu Client</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/forms.css" rel="stylesheet" type="text/css" />
<link href="css/ajaxui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/jquery.calendar.js"></script>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jqsimplemenu.js"></script>
    <link rel="stylesheet" href="css/jqsimplemenu.css" type="text/css" media="screen" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.menu').jqsimplemenu();
        });
    </script>
    <style type="text/css">
        body
        {
            font-size: 12px;
            font-family: Arial;
        }
    </style>
</head>

<body>
<form action="servCircuit" method="post">
<div id="wrap">
<div id="topbar">
  </div>
<div id="header">
<div id="sitename">
<h1 id="logo">GoVoyage</h1>
</div>
<div id="shoutout"><img src="images/joinnow_shoutout.jpg" alt="Join Now! It's Free" width="168" height="126" /></div>
<div id="useractions">
<div id="headings"align="right">    
<h2><img src="images/create_agent_icon.jpg" alt="Agent Account" width="27" height="22" /> <a href="#">Espace Client</a></h2>
   </div>
</div>
</div>
<div class="clear">&nbsp;</div>
<div class="clear">&nbsp;</div>
  

	<div>
  <ul class="menu" >
        <li><a href='RechercherVol.jsp'>Rechercher Vols</a></li>
        <li><a href='RechercherCircuit.jsp'>Rechercher Circuits</a></li>
        <li><a href="#">Reservations Vols </a>
            <ul>
                <li><a href='ReservationsVol.jsp'>Mes Reservations Vols</a></li>
                <li><a href='AReservationsVol.jsp'>Annuler Reservations Vols</a></li>
            </ul>
        </li>
        <li><a href="#">Reservations Circuits </a>
            <ul>
                <li><a href='ReservationsCircuits.jsp'>Mes Reservations Circuits</a></li>
                <li><a href='AReservationsC.jsp'>Annuler Reservations Circuits</a></li>
            </ul>
        </li>
        
        <li><a href='ParametresClient.jsp'>Parametres Du Compte</a></li>
        <li><a href='Authentification.jsp'>Deconnexion</a></li>
    </ul>
	
	</div>

<div class="clear">&nbsp;</div>
<div id="main">

<h1>Detail</h1>
<div id="moredetails">
  <div id="listing_details">
<h3>Informations Circuit</h3>
<table border="1">
<%
int idRe = Integer.parseInt(request.getParameter("id")); 
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	Reservation R = GV.findRese(idRe);
	List<Passager> passagers = GV.listerPassagers();
	Vector<Passager> vect = new Vector<Passager>();
	for(int j=0;j<passagers.size();j++){
		if(passagers.get(j).getReservationsConcern().getIdRserv()==R.getIdRserv()){
			vect.add(passagers.get(j));
		}
	}
%>
<tr><td bgcolor="#ADB1B1">Depart du </td><td bgcolor="#91EBE8"><%out.print("Morroco("+R.getCircuitDateR().getNomVill()+")"); %></td></tr>
<tr><td bgcolor="#ADB1B1">Date depart</td><td bgcolor="#91EBE8"><%out.print(R.getCircuitDateR().getDateD()); %></td></tr>
<tr><td bgcolor="#ADB1B1">Destinataire au</td><td bgcolor="#91EBE8"><%out.print(R.getCircuitDateR().getCircuit().getDestination().getNomPays()); %></td></tr>
<tr><td bgcolor="#ADB1B1">Duree</td><td bgcolor="#91EBE8"><%out.print(R.getCircuitDateR().getCircuit().getDuree()); %></td></tr>
<tr><td bgcolor="#ADB1B1">Nombre passagers</td><td bgcolor="#91EBE8"><%out.print(vect.size()); %></td></tr>
</table>
<h3>Informations Passagers</h3>
<table>
<tr bgcolor="#ADB1B1">
<td>Nom de famille</td>
<td>Prenom</td>
<td>Date naissance</td>
<td>Numero du passport</td>
<td>Date d'expiration</td>
</tr>
<%for(int i=0;i<vect.size();i++){%>
	<tr bgcolor="#91EBE8">
	<td><%out.print(vect.get(i).getNomP()); %></td>
	<td><%out.print(vect.get(i).getPnomP()); %></td>
	<td><%out.print(vect.get(i).getDateN()); %></td>
	<td><%out.print(vect.get(i).getNumPassport()); %></td>
	<td><%out.print(vect.get(i).getDateExpiration()); %></td>
	</tr>
<%}
}catch(NamingException e){e.printStackTrace();}  %>
</table>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<div id="footer">
<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
<div id="lowerfooter"> <span class="backtotop"> <a href="#">Back To Top</a> </span>

<!-- Removing this link back to Ramblingsoul.com will be violation of the Creative Commons Attribution 3.0 Unported License, under which this template is released for download -->
<a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE
<!-- Copyright - Ramblingsoul.com -->

</div>
</div>

</body>
</html>