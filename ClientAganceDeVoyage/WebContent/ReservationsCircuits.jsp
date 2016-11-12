<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="pac.Client"%>
<%@page import="java.util.List"%>
<%@page import="pac.Reservation"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.Passager"%><html>
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
                <li><a href='ReservationsCircuits.jsp'  class="highlight">Mes Reservations Circuits</a></li>
                <li><a href='AReservationsC.jsp'>Annuler Reservations Circuits</a></li>
            </ul>
        </li>
        
        <li><a href='ParametresClient.jsp'>Parametres Du Compte</a></li>
        <li><a href='Authentification.jsp'>Deconnexion</a></li>
    </ul>
	
	</div>

<div class="clear">&nbsp;</div>
<div id="main">

<h1>Mes Reservation Circuit</h1>
<div id="moredetails">
  <div id="listing_details">
<body>
<table border="1">
<tr bgcolor="#ADB1B1">
<td>Date de reservation</td>
<td>Ville depart</td>
<td>Date depart</td>
<td>Pays destination</td>
<td>Nombre passagers</td>
<td>Voir detail</td>
</tr>
<% 
try{
 	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	int id = (Integer)session.getAttribute("idClient");
	Client clt =  GV.findClt(id);
	List<Reservation> reservations = (List)clt.getReservations();
	for(int i=0;i<reservations.size();i++){int cp = 0;if(reservations.get(i).getTypeReserv().equalsIgnoreCase("circuit")){%>
	<tr bgcolor="#EBEEEE">
	<td><%out.print(reservations.get(i).getDateReserv());%></td>
	<td><%out.print(reservations.get(i).getCircuitDateR().getNomVill()); %></td>
	<td><%out.print(reservations.get(i).getCircuitDateR().getDateD()); %></td>
	<td><%out.print(reservations.get(i).getCircuitDateR().getCircuit().getDestination().getNomPays()); %></td>
	<%
	List<Passager> P = GV.listerPassagers();
	for(int j=0;j<P.size();j++){
		if(P.get(j).getReservationsConcern().getIdRserv()==reservations.get(i).getIdRserv()){
			 cp++;	
		}
	}
	%>
	<td><%out.print(cp);%></td>
	<td><a href="detailReserCircuit.jsp?id=<%=reservations.get(i).getIdRserv() %>" >Detail</a></td>
	</tr>	
	<%}}
}catch(NamingException e){e.printStackTrace();}


%>
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