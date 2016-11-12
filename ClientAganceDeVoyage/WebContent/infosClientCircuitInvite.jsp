<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="pac.Passager"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="pac.CircuitDateR"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><html>
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
<div id="headings"> 
<h2><img src="images/create_indi_usr.jpg" alt="Individual User" width="25" height="22" /> <a href="#">Create Individual Account</a> </h2>   
<h2><img src="images/create_agent_icon.jpg" alt="Agent Account" width="27" height="22" /> <a href="#">Create Agent Accoun</a>t</h2>
   </div>
<div id="login">
  <p><strong>Already registered ?</strong> Login here to access your account</p>
<div id="loginform">

<form action="authentification" method="post">
<div class="formblock">

<label>Username</label>
<input name="log" type="text" class="textfields" />
</div>
<div class="formblock">

<label>Password</label><input name="pwd" type="text" class="textfields"/>
</div>
<div class="formblock">
  <input type="image" src="images/loginbutton.jpg" name="connexion" id="button" value="Submit" />
</div>


<div class="clear">&nbsp;</div>
<p>
  <input name="" type="checkbox" value="" /> 
  Remember me on this computer | Forgot password ?  </p>
</form>


</div></div>
</div></div>

<div id="content">
  
<div id="topcategorieslink" class="clear">
  <h2><a href="Authentification1.jsp">GoVoyage</a></h2><ul>
      <li><a href="#"> Selectionner votre Circuit</a> </li>
      <li><a href="#"> Reserver </a> </li>
      <li><a href="#"> Infos Passagers </a> </li>
      <li><a href="#" class="highlight"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>

<div id="main">



<form action="ConfirmationCircuit.jsp" method="post">
<h1>Reserver Vol</h1>
<div id="moredetails">
  <div id="listing_details">

<script type="text/javascript">
function inscription(ins){
	Ins = document.getElementById("ins");
	dIns = document.getElementById("dIns");
	if(Ins.style.visibility=="hidden"){
		// Contenu cache, le montrer
		Ins.style.visibility="Visible";
		document.getElementById("dIns").disabled = "disabled";
		Ins.style.height = "auto";			// Optionnel retablir la hauteur
		document.getElementById("lien").innerHTML="Je suis déja inscris";
	}
	else
	{
		// Contenu visible, le cacher
		Ins.style.visibility = "hidden";
		document.getElementById("dIns").disabled = "";
		Ins.style.height = "0";			// Optionnel liberer l'espace
		document.getElementById("lien").innerHTML="Sinscrire";
		
	}
}
onload = function() { 
	document.getElementById("ins").style.visibility = "hidden"; 
	document.getElementById("lien").innerHTML="S inscrire";
	document.getElementById("dIns").disabled = ""; 
};
</script>

<%
try{
	int idDateR = (Integer)session.getAttribute("idDateR");
 	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	CircuitDateR dateRc = GV.findReservationC(idDateR);

int nbrP = (Integer)session.getAttribute("nbrPassagers");
session.removeAttribute("nbrPassagers");
List<Passager> vect = new ArrayList<Passager>();
for(int i=1;i<=nbrP;i++){
	String nom = request.getParameter("nom"+i);
	String pnom = request.getParameter("pnom"+i);
	String dateN = request.getParameter("dateN"+i);
	String numpassport = request.getParameter("numP"+i);
	String dateExpiration = request.getParameter("dateE"+i);
	Passager p = new Passager();
	p.setNomP(nom); p.setPnomP(pnom); p.setDateN(dateN); p.setDateExpiration(dateExpiration); p.setNumPassport(numpassport);
	vect.add(p);
}
session.setAttribute("passagers",vect);
%>
<h3>Detail du tarif</h3><br>
<table>
<tr bgcolor="#ADB1B1"><td><b>Détail du vol aller</b></td><td><b>Quantité</b></td><td><b>Prix unitaire</b></td><td><b>Total</b></td></tr>
<tr bgcolor="#EBEEEE"><td>Personne</td><td><%out.print(nbrP);%></td><td><%out.print(dateRc.getPrix());%></td><td><%out.print(Integer.parseInt(dateRc.getPrix())*nbrP);%></td></tr>
<tr bgcolor="#EBEEEE"><td>Tarif assurance</td><td><%out.print(nbrP); %></td><td><%out.print("180"); %></td><td><%out.print(180*nbrP); %></td></tr>
<tr bgcolor="#91EBE8"><td><b>Prix Total</b></td><td></td><td></td><td><%out.print( (Integer.parseInt(dateRc.getPrix())*nbrP) +(180*nbrP)); %></td></tr>
</table>
<%if(session.getAttribute("idClient")!=null){%>
	<table>
	<tr><td><input type="submit" name="continuer" value="continuer"></td></tr>
	</table>	
<%}
else{%>
<br><br><h3>Informations Client</h3>
		<div id="dIns">
		<table  bgcolor="#EBEEEE">
		<tr><td><b>login</b></td><td><b>mot de passe</b></td></tr>
		<tr>
		<td><input type="text" name="log"></td>
		<td><input type="text" name="pwd"></td>
		</tr>
		<tr><td><input type="submit" name="continuer1" value="Connexion"></td></tr>
		</table></div>
		<table>
		<tr><td><a href='#' OnClick="inscription('ins')"  id="lien">Sinscrire</a></td></tr>
		</table><br>
		<table id="ins"   bgcolor="#EBEEEE" border="0">
			 <tr><td><b>Titre</b></td></tr>
			 <tr><td><select><option>Mme</option><option>Mlle</option><option>M</option></select></td></tr>				
			 
			 <tr><td><b>Nom de famille</b></td><td><b>Prenom</b></td><td><b>Date de naissance</b></td></tr>
			 <tr>
			 <td><input type="text" name="nomf"></td>
			 <td><input type="text" name="pnom"></td>
			 <td><input type="text" name="dateN"></td>
			 </tr>
			 <tr><td><b>Login</b></td><td><b>Mot de passe</b></td><td><b>Confirmation mot de passe</b></td></tr>
			 <tr>
			 <td><input type="text" name="login"></td>
			 <td><input type="text" name="motdepasse"></td>
			 <td><input type="text" name="Cmotdepasse"></td>
			 </tr>
			 <tr><td><b>Adresse</b></td></tr>
			 <tr><td><input type="text" name="add" ></td></tr>
			 
			 <tr><td><b>Code postal</b></td><td><b>Ville</b></td><td><b>Pays</b></td></tr>	 
			 <tr>
			 <td><input type="text" name="codP"></td>
			 <td><input type="text" name="vill"></td>
			 <td><input type="text" name="pays"></td>
			 </tr>
			 <tr><td><b>Email</b></td><td><b>Confirmation Email</b></td></tr>
			 <tr>
			 <td><input type="text" name="email"></td>
			 <td><input type="text" name="Cemail"></td>
			 </tr>
			 <tr><td><input type="submit" name="continuer2"  value="Continuer"></td></tr>
		</table>
<%}%>	

<%}catch(NamingException e){e.printStackTrace();} %>
</form>
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