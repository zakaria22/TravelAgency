<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="pac.GestionVolBean"%>
<%@page import="java.util.List"%>
<%@page import="pac.CompagnieAérienne"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.Aeroport"%>
<%@page import="pac.Pays"%><html>
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

<style type="text/css">
#escale { display: none; }
</style>
<script language="javascript" type="text/javascript">  
	  var xmlHttp 
      var xmlHttp
      function showP1(id){
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
      url +="?idPays1=" +id;
      xmlHttp.onreadystatechange = PaysChange;
      xmlHttp.open("POST", url, true);
      xmlHttp.send(null);
      }
      function PaysChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
    	  document.getElementById("arpt1").innerHTML=xmlHttp.responseText
          }   
      }
      function showP2(id){
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
          url +="?idPays2=" +id;
          xmlHttp.onreadystatechange = paysChange;
          xmlHttp.open("POST", url, true);
          xmlHttp.send(null);
          }
      	  function paysChange(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
              document.getElementById("arpt2").innerHTML=xmlHttp.responseText
          }   
      }
</script>
<body>
<form action="serv" method="post" name="form1">
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
<h1>Ajouter Vol générique</h1>
<div id="moredetails">
  <div id="listing_details">
  <p>&nbsp;</p>
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0">
<tr><td width="178"><h3>Compagnie Aérienne : </h3></td>
<td width="222"> <select name="CA">
  <option value="-1"></option>
<% 
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<CompagnieAérienne> ca= GV.listerCA();
	List<Aeroport> a = GV.listerA(); 
	List<Pays> p = GV.listerP();
	for(int i=0;i<ca.size();i++){%>
	
		<option value="<%=ca.get(i).getIdCompA()%>" selected><%=ca.get(i).getNomA()%></option>
	<%
	}
	%>
	</select></td></tr>
<tr><td><h3>Jour : </h3></td><td><select name="jour">
<option value="-1"></option>
<option value="lundi">Lundi</option>
<option value="mardi">Mardi</option>
<option value="mercredi">Mercredi</option>
<option value="jeudi">Jeudi</option>
<option value="vendredi">Vendredi</option>
<option value="samedi">Samedi</option>
<option value="dimanche">Dimanche</option>
</select></td></tr>

<tr><td><h3>Pays Départ: </h3></td><td><select name="PD" onChange="showP1(this.value)"><option value="-1">-------</option>
<%for(int i=0;i<p.size();i++){%>
	
		<option value="<%=p.get(i).getIdPays() %>"><%=p.get(i).getNomPays()%></option>
<%}%>
</select></td>
<td width="140"><h3>Aéroport Départ: </h3></td><td width="83" id="arpt1"><select name="AD"><option value="-1">---------</option></select></td>
</tr>
<tr><td><h3>Pays Arrivée: </h3></td><td><select name="PA" onChange="showP2(this.value)" ><option value="-1">-------</option>
<%for(int i=0;i<p.size();i++){%>
	
		<option value="<%=p.get(i).getIdPays() %>"><%=p.get(i).getNomPays()%></option>
<%}%>
</select></td>
<td><h3>Aéroport Arrivée: </h3></td><td id="arpt2"><select name="AA"><option value="-1">--------</option></select></td>
</tr>

<tr><td><h3>Escale : </h3></td> 
<td>
Oui<input type="radio" name="escale" value="oui">
Non<input type="radio" name="escale" value="non" checked="checked">
</td></tr>
<tr><td></td><td id="escale"><h3>Nbr Escale :</h3><input type="text" name="nbrescale"  width="190"></td></tr>
<tr><td><h3>Heure Départ: </h3></td><td><input type="text" name="heured" width="190"></td></tr>
<tr><td><h3>Heure Arrivée: </h3></td><td><input type="text"" name="heurea"  width="190"></td></tr>
<tr><td><h3>Prix: </h3></td><td><input type="text" name="prix" width="190"></td></tr>
<tr><td><h3>Nombre de place : </h3></td><td><input type="text" name="nbrPlace" width="190"></td></tr>
<%}catch(NamingException e){e.printStackTrace();}%>
<p>&nbsp;</p>
<tr><td></td><td></td><td><input type="image" src="images/searchbtn.gif" alt="search" name="ajoutervol" value="Submit"></td></tr>
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

<script type="text/javascript">
var oui = document.form1.escale[0];
var non = document.form1.escale[1];
oui.onclick = function() {
document.getElementById("escale").style.display = "block";
};
non.onclick = function() {
document.getElementById("escale").style.display = "none";
};
onload = function() { 
	document.getElementById("escale").style.display = "none"; 
};
</script>
</body>

</html>
