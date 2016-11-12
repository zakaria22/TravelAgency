<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.Pays"%>
<%@page import="pac.CircuitGn"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gestion Résérvation du vol et circuit en ligne</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/forms.css" rel="stylesheet" type="text/css" />
<link href="css/ajaxui.css" rel="stylesheet" type="text/css" />

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
<script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function showPays(id){
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
      	      	
      var url="servCircuit";
      url +="?idPays=" +id;
      
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      
      }
		
      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("div").innerHTML=xmlHttp.responseText    
      }   
      }
</script>
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
<div id="headings" align="right">    
<h2><img src="images/create_agent_icon.jpg" alt="Agent Account" width="27" height="22" /> <a href="#">Espace Admin</a></h2>
   </div>
</div>
</div>
<div class="clear">&nbsp;</div>
<div class="clear">&nbsp;</div>
  

	<div>
  <ul class="menu" >
        <li><a href='Admin.jsp'>Home</a></li>
        <li><a href="#">Vols Générique </a>
            <ul>
                <li><a href='AjouterVol.jsp'>Ajouter Vol</a></li>
                <li><a href='ListerVolG.jsp'>Lister Vols</a></li>
            </ul>
        </li>
        <li><a href="#">Circuits Générique</a>
            <ul>
                <li><a href='AjouterCircuit.jsp'>Ajouter Circuit</a></li>
                <li><a href='ListerCircuit.jsp'>Lister Circuits</a></li>
            </ul>
        </li>
        <li><a href="#">Résérvations Vols</a>
            <ul>
                <li><a href='OuvrirReservation.jsp'>Ouvrir résérvation</a></li>
                <li><a href='FermerReservation.jsp'>Fermer résérvation</a></li>
            	<li><a href='VoirReservationsVol.jsp'>Voir résérvations Vols</a></li>
            </ul>
        </li>
        <li><a href='ParametreVol.jsp'>Paramètres</a></li>
        <li><a href="#">Deconnexion</a></li>
    </ul>
	
	</div>


<div class="clear">&nbsp;</div>

<div id="main">
<h1>Liste des Circuits</h1>
<div id="moredetails">
  <div id="listing_details">

<h3>Filtrer par destination : <select name="dest" onchange="showPays(this.value)"><option value="destination">---Toutes destination---</option>
<%try{
		InitialContext ctxt = new InitialContext();
		GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
		List<Pays> p = GV.listerP();
		List<CircuitGn> c = GV.listerCircuit();
		for(int i=0;i<p.size();i++){
			for(int j=0;j<c.size();j++){
				if(p.get(i).getNomPays().equalsIgnoreCase(c.get(j).getDestination().getNomPays())){%>
					<option value="<%=p.get(i).getIdPays()%>"><%=p.get(i).getNomPays() %></option>				
				<%
				break;
				}
			}
		 }
}catch(NamingException e){e.printStackTrace();}%>
</select></h3>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="div">
<table  cellspacing="0" cellpadding="0" border="1">
<tr>
<td><h3>Nom du Circuit</h3></td>
<td><h3>Description</h3></td>
<td><h3>Durée du Circuit</h3></td>
<td><h3>Ouvrir résérvation</h3></td>
<td><h3>Modifier les informations du Circuit</h3></td>
<td><h3>Modifier le plan du Circuit</h3></td>
</tr>
<%try{
		InitialContext ctxt = new InitialContext();
		GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
		List<CircuitGn> C = GV.listerCircuit();
		for(int i=0;i<C.size();i++){%>
			<tr>
			<td><%=C.get(i).getNom()%></td>
			<td><%=C.get(i).getDescription()%><</td>
			<td><%=C.get(i).getDuree()%></td>
			<td><a href="servCircuit?id=<%=C.get(i).getId()%>">Ouvrir Reservation</a></td>
			<td><a href="servCircuit?idModifC=<%=C.get(i).getId()%>">Modifier Circuit</a></td>
			<td><a href="servCircuit?idModifP=<%=C.get(i).getId()%>">Modifier Planing du Circuit</a></td>
			</tr>
		<%}
		
}catch(NamingException e){e.printStackTrace();}%>

</table></div>
<div class="clear">&nbsp;</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h1>Similar Items</h1>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<div id="footer">
<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
<div id="lowerfooter"> <span class="backtotop"> <a href="#">Back To Top</a> </span>

<!-- Removing this link back to Ramblingsoul.com will be violation of the Creative Commons Attribution 3.0 Unported License, under which this template is released for download -->
<a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">CSS Layout</a> by RamblingSoul.com
<!-- Copyright - Ramblingsoul.com -->

</div>
</div>


</body>
</html>