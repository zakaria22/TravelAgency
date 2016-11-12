<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.Client"%>
<%@page import="javax.naming.NamingException"%><html>
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

<h1>Reserver Vol</h1>
<div id="moredetails">
  <div id="listing_details">

<% 
int id=0;
if(request.getParameter("continuer")!=null){
	id=(Integer)session.getAttribute("idClient");
	session.setAttribute("idClt",id);	
}
if(request.getParameter("continuer1")!=null){
	String log = request.getParameter("log");
	String pwd = request.getParameter("pwd");
	try{	
		InitialContext ctxt = new InitialContext();
		GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
		List<Client> clients = GV.listerClt();
		for(int i=0;i<clients.size();i++){
			if((clients.get(i).getLogin().equalsIgnoreCase(log))&&(clients.get(i).getPassword().equalsIgnoreCase(pwd))){
				id = clients.get(i).getIdClt();
				session.setAttribute("idClt",id); break;
			}
		}
	}catch(NamingException e){e.printStackTrace();}
}
if(request.getParameter("continuer2")!=null){
	String log = request.getParameter("login");
	String pwd = request.getParameter("motdepasse");
	String nom = request.getParameter("nomf");
	String pnom = request.getParameter("pnom");
	String dateN = request.getParameter("dateN");
	String add = request.getParameter("add");
	String ville = request.getParameter("vill");
	String pays = request.getParameter("pays");
	String codP = request.getParameter("codP");
	String email = request.getParameter("email");
	try{	
		InitialContext ctxt = new InitialContext();
		GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
		Client clt = new Client(nom,pnom,log,pwd,add,email,ville,pays,codP);
		GV.ajouterClt(clt);
		List<Client> clts = GV.listerClt();
		id = clts.get(clts.size()-1).getIdClt();
		session.setAttribute("idClt",id);
	}catch(NamingException e){e.printStackTrace();}	
}
%>

<input type="submit" name="confirmerC" value="Confirmer la reservation">
</form>
</body>
</html>