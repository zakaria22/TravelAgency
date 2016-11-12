<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="pac.VolGenerique"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.CompagnieAérienne"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pac.Aeroport"%><html>
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
<body>
<form action="serv" method="post">
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

<div id="content">

<div class="clear">&nbsp;</div>

<div id="main">
<h1>Modifier Vol</h1>

<div id="moredetails">
  <div id="listing_details">
<p>&nbsp;</p>
<p>&nbsp;</p>

<%
int id = (Integer)session.getAttribute("modifVol");
try{
 	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<CompagnieAérienne> ca = GV.listerCA();
	List<Aeroport> a = GV.listerA();
	VolGenerique V = GV.findVolg(id);
	List<String> jours = new ArrayList<String>();
	jours.add("lundi");jours.add("mardi");jours.add("mercredi");jours.add("jeudi");jours.add("vendredi");jours.add("samedi");jours.add("dimanche");
	
%>
  <table cellspacing="0" cellpadding="0"> 

<tr><td><h3>Compagnie : </h3></td><td><select name="c">
<%for(int i=0;i<ca.size();i++){
	if(ca.get(i).getNomA().equalsIgnoreCase(V.getCA().getNomA())){%>
	<option value="<%=ca.get(i).getIdCompA() %>" selected="selected"><%=ca.get(i).getNomA() %></option>
	<%}
	else{%>
	<option value="<%=ca.get(i).getIdCompA() %>"><%=ca.get(i).getNomA() %></option>
	<%}
}%>
</select></td></tr>
<tr><td><h3>Jour : </h3></td><td><select name="jr">
<%for(int i=0;i<jours.size();i++){
	if(jours.get(i).equalsIgnoreCase(V.getJour())){%>
	<option value="<%=jours.get(i)%>" selected="selected"><%=jours.get(i)%></option>
	<%}
	else{%>
	<option value="<%=jours.get(i)%>"><%=jours.get(i)%></option>
	<%}
}%>
</select></td></tr>
<tr><td><h3>Heure depart : </h3></td><td><input type="text" name="hd" value="<%=V.getHeureD()%>"></td></tr>
<tr><td><h3>Heure arrivee : </h3></td><td><input type="text" name="ha" value="<%=V.getHeureA() %>"></td></tr>

<tr><td><h3>Aeroport depart: </h3></td><td><select name="ad">
<%for(int i=0;i<a.size();i++){
	if(a.get(i).getNomA().equalsIgnoreCase(V.getAeroportD().getNomA())){%>
	<option value="<%=a.get(i).getIdA()%>" selected="selected"><%=a.get(i).getNomA()%></option>
	<%}
	else{%>
	<option value="<%=a.get(i).getIdA()%>"><%=a.get(i).getNomA()%></option>
	<%}
}%>
</select></td></tr>
<tr><td><h3>Aeroport arrivee: </h3></td><td><select name="aa">
<%for(int i=0;i<a.size();i++){
	if(a.get(i).getNomA().equalsIgnoreCase(V.getAeroportA().getNomA())){%>
	<option value="<%=a.get(i).getIdA()%>" selected="selected"><%=a.get(i).getNomA()%></option>
	<%}
	else{%>
	<option value="<%=a.get(i).getIdA()%>"><%=a.get(i).getNomA()%></option>
	<%}
}%>
</select></td></tr>
<tr><td><h3>Prix : </h3></td><td><input type="text" name="pr" value="<%=V.getPrix() %>"></td></tr>
<tr>
<td><input type="submit" name="modifVol" value="Update"></td>
<td><input type="submit" name="Retour" value="Retour"></td>
</tr>
</table></div>

<div id="div1"></div>
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
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<h1>Similar Items</h1>
</div>
</div>
<div id="footer">
<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
<div id="lowerfooter"> <span class="backtotop"> <a href="#">Back To Top</a> </span>

<!-- Removing this link back to Ramblingsoul.com will be violation of the Creative Commons Attribution 3.0 Unported License, under which this template is released for download -->
<a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">CSS Layout</a> by RamblingSoul.com
<!-- Copyright - Ramblingsoul.com -->

</div>
</div>
</div>
<%}catch(NamingException e){e.printStackTrace();} %>
</form>
</body>
</html>