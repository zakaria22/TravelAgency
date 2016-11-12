<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.Vector"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.CircuitGn"%>
<%@page import="pac.PlaningCiruitGn"%>
<%@page import="java.util.Collection"%>
<%@page import="pac.CircuitDateR"%><html>
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

<h1>Reserver Vol</h1>
<div id="moredetails">
  <div id="listing_details">

<%
try{
	int idC = Integer.parseInt(request.getParameter("idC"));
	session.setAttribute("idCircuit",idC); 
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	CircuitGn C = GV.findCircuit(idC);
	List<PlaningCiruitGn> P = GV.listerPlaningC();
	Vector<Integer> DateR = new Vector<Integer>();
	String[] list =(String[])request.getParameterValues("VectdateR");
	String s = list[0];
	StringTokenizer stk = new StringTokenizer(s,"[], ");
	while(stk.hasMoreTokens()){
		DateR.add(Integer.parseInt(stk.nextToken()));
	}
%>
<h3>Planing du Circuit</h3>
<% //List<PlaningCiruitGn> planings = (List)C.getPlanings(); 
for(int i=0;i<P.size();i++){if(P.get(i).getC().getId()==idC){%>
<table border="0" bgcolor="#E1E7F1">
<tr><td>Jour N°: <%=i+1%></td></tr>
<tr><td><p><%=P.get(i).getDescription()%></p></td></tr>
</table>
-----------------------------------------------------------------
<%} }%>
<h3>Les dates ouvertes a la resrvation</h3>
<table  border="1" bgcolor="green">
<tr>
<td>Date Depart</td>
<td>Prix</td>
<td>Nombre place disponible</td>
<td>reservation</td>
</tr>
<%
for(int i=0;i<DateR.size();i++){
CircuitDateR dateRc =  GV.findReservationC(DateR.get(i));%>
<tr>
<td><%=dateRc.getDateD() %></td>
<td><%=dateRc.getPrix() %></td>
<td><%=dateRc.getNbrPlace() %></td>
<td><a href="infosPassagersCircuit.jsp?idDateRc=<%=dateRc.getId()%>">reserver</a></td>
</tr>
<%}%>
</table>
<%}catch(NamingException e){e.printStackTrace();} %>
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