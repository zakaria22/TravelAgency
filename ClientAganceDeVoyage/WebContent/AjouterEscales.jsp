<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.Aeroport"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.Pays"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gestion R�s�rvation du vol et circuit en ligne</title>
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
      function showP(id){
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
      url +="?idPays=" +id;
      xmlHttp.onreadystatechange = PaysChange;
      xmlHttp.open("POST", url, true);
      xmlHttp.send(null);
      }
      function PaysChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
    	  document.getElementById("arprt").innerHTML=xmlHttp.responseText;
          }   
      }
</script>      
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
        <li><a href="#">Vols G�n�rique </a>
            <ul>
                <li><a href='AjouterVol.jsp'>Ajouter Vol</a></li>
                <li><a href='ListerVolG.jsp'>Lister Vols</a></li>
            </ul>
        </li>
        <li><a href="#">Circuits G�n�rique</a>
            <ul>
                <li><a href='AjouterCircuit.jsp'>Ajouter Circuit</a></li>
                <li><a href='ListerCircuit.jsp'>Lister Circuits</a></li>
            </ul>
        </li>
        <li><a href="#">R�s�rvations Vols</a>
            <ul>
                <li><a href='OuvrirReservation.jsp'>Ouvrir r�s�rvation</a></li>
                <li><a href='FermerReservation.jsp'>Fermer r�s�rvation</a></li>
            	<li><a href='VoirReservationsVol.jsp'>Voir r�s�rvations Vols</a></li>
            </ul>
        </li>
        <li><a href='ParametreVol.jsp'>Param�tres</a></li>
        <li><a href="#">Deconnexion</a></li>
    </ul>
	
	</div>

<div id="content">

<div class="clear">&nbsp;</div>

<div id="main">
<h1>Ajouter Escale</h1>
<div id="moredetails">
  <div id="listing_details">
<p>&nbsp;</p>
<p>&nbsp;</p>

<table  cellspacing="0" cellpadding="0">

<% 
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<Pays> P= GV.listerP();
	int nbrEscal = (Integer)session.getAttribute("nbrEscale");%>
	
	<tr>
	<td>Pays Escale : </td><td><select onchange="showP(this.value)"><option value="-1"></option>
	<%for(int j=0;j<P.size();j++){%>
		<option value="<%=P.get(j).getIdPays()%>"><%=P.get(j).getNomPays()%></option>
	<%}%>
	</select></td>
	<td>A�roport Escale : </td><td id="arprt"><select name="Aescale"><option value="-1">----------</option>
	</select></td>
	</tr>
	<tr><td>heure D�but :</td><td><input type="text" name="hd"></td></tr>
	<tr><td>heure Fin :</td><td><input type="text" name="hf"></td></tr>
	<tr><td>duree :</td><td><input type="text" name="d"></td></tr>
<tr><td><input type="submit" name="AjoutEscale" value="Valider"></td></tr>
</table>
</div>
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

<%}catch(NamingException e){e.printStackTrace();}%>
</form>
</body>
</html>