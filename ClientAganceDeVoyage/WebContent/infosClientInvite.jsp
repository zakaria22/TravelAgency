<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="pac.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome >>>> GOVOYAGE</title>
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/1/js-image-slider.js" type="text/javascript"></script>
    <link href="themes/1/generic.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/forms.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JSs/jquery.calendar.js"></script>
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

<div id="topcategorieslink" class="clear">
  <h2><a href="Authentification.jsp">GoVoyage</a></h2><ul>
      <li><a href="#"> Selectionner </a> </li>
      <li><a href="#"> Reserver </a> </li>
      <li><a href="#"> Infos Passagers </a> </li>
      <li><a href="#"> Assurance </a> </li>
      <li><a href="#"  class="highlight"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>

<div id="main">
<h1>Details</h1>
<div id="moredetails">

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
int nbrAd = (Integer)session.getAttribute("adult");
int nbrEnf = (Integer)session.getAttribute("enfant");
int prixVol = (Integer)session.getAttribute("prixVold");
int a =prixVol*nbrAd;
int b = prixVol*6/10*nbrEnf; 
String ch = request.getParameter("choix");
int c=0,a1=0,b1=0,c1=0;
%>
<form action="ConfirmationVol.jsp" method="post">
<h2>Detail du tarif</h2><br><br>
<table>
<tr bgcolor="#ADB1B1"><td>Détail du vol aller</td><td><h3>Quantité</h3></td><td><h3>Prix unitaire</h3></td><td><h3>Total</h3></td></tr>
<tr bgcolor="#EBEEEE"><td>Tarif adulte</td><td><%out.print(nbrAd);%></td><td><%out.print(prixVol);%></td><td><%out.print(a);%></td></tr>
<tr bgcolor="#EBEEEE"><td>Tarif enfant</td><td><%out.print(nbrEnf);%></td><td><%out.print(prixVol*6/10);%></td><td><%out.print(b);%></td></tr>
<%if(ch.equalsIgnoreCase("1")){%>
<tr bgcolor="#EBEEEE"><td>Tarif assurance</td><td><%out.print(nbrAd+nbrEnf); %></td><td><%out.print("180"); %></td><td><% c=180*(nbrAd+nbrEnf); out.print(c); %></td></tr>
<%}%>
<%if(ch.equalsIgnoreCase("2")){%>
<tr bgcolor="#EBEEEE"><td>Tarif assurance</td><td><%out.print(nbrAd+nbrEnf); %></td><td><%out.print("140"); %></td><td><% c=140*(nbrAd+nbrEnf); out.print(c); %></td></tr>
<%}%>
<%if(ch.equalsIgnoreCase("3")){%>
<tr bgcolor="#EBEEEE"><td>Tarif assurance</td><td><%out.print("-"); %></td><td><%out.print("-"); %></td><td><% c=0; out.print("-"); %></td></tr>
<%}%>
<tr bgcolor="#EBEEEE"><td>Convocation à l'aéroport</td><td><%out.print(nbrAd+nbrEnf);%></td><td><%out.print("-"); %></td><td><%out.print("-"); %></td></tr>
<%if(session.getAttribute("prixVolr")!=null){
	int prixVolr = (Integer)session.getAttribute("prixVolr");
	a1 =prixVolr*nbrAd;
	b1 = prixVolr*6/10*nbrEnf; 
	c1=0;
	%>
	<tr bgcolor="#ADB1B1"><td><h3>Détail du vol retour</h3></td><td><h3>Quantité</h3></td><td><h3>Prix unitaire</h3></td><td><h3>Total</h3></td></tr>
	<tr bgcolor="#EBEEEE"><td><h4>Tarif adulte</h4></td><td><%out.print(nbrAd);%></td><td><%out.print(prixVolr);%></td><td><%out.print(a1);%></td></tr>
	<tr bgcolor="#EBEEEE"><td><h4>Tarif enfant</h4></td><td><%out.print(nbrEnf);%></td><td><%out.print(prixVolr*6/10);%></td><td><%out.print(b1);%></td></tr>
	<%if(ch.equalsIgnoreCase("1")){%>
	<tr bgcolor="#EBEEEE"><td><h4>Tarif assurance</h4></td><td><%out.print(nbrAd+nbrEnf); %></td><td><%out.print("180"); %></td><td><% c1=180*(nbrAd+nbrEnf); out.print(c1); %></td></tr>
	<%}%>
	<%if(ch.equalsIgnoreCase("2")){%>
	<tr bgcolor="#EBEEEE"><td><h4>Tarif assurance</h4></td><td><%out.print(nbrAd+nbrEnf); %></td><td><%out.print("140"); %></td><td><% c1=140*(nbrAd+nbrEnf); out.print(c1); %></td></tr>
	<%}%>
	<%if(ch.equalsIgnoreCase("3")){%>
	<tr bgcolor="#EBEEEE"><td><h4>Tarif assurance</h4></td><td><%out.print("-"); %></td><td><%out.print("-"); %></td><td><% c1=0; out.print("-"); %></td></tr>
	<%}%>
	<tr bgcolor="#EBEEEE"><td><h4>Convocation à l'aéroport</h4></td><td><%out.print(nbrAd+nbrEnf);%></td><td><%out.print("-"); %></td><td><%out.print("-"); %></td></tr>
<%} %>

<tr bgcolor="#91EBE8"><td><b><h4>Prix Total</h4></b></td><td></td><td></td><td><%out.print(a+b+c+a1+b1+c1); %></td></tr>
</table>
<%
session.removeAttribute("prixVolr");
//int idC=-1;
if(session.getAttribute("idClient")!=null){
    //idC = (Integer)session.getAttribute("idClient");
//}
//if(idC!=-1){
%>
	<table>
	<tr><td><input type="submit" name="continuer" value="continuer"></td></tr>
	</table><br><br>	
<%}

else{%>
			
		<br><br><h2>Informations Client</h2><br>
		<div id="dIns">
		<table  bgcolor="#EBEEEE">
		<tr><td><b>login</b></td><td><b>mot de passe</b></td></tr>
		<tr>
		<td><input type="text" name="log"></td>
		<td><input type="text" name="pwd"></td>
		</tr>
		<tr><td><input type="submit" name="continuer1" value="Connexion"></td></tr>
		</table></div>
		<br><table>
		<tr><td><a href='#' OnClick="inscription('ins')"  id="lien">Sinscrire</a></td></tr>
		</table>
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
</form>
<br><br><br><br><br><br>
	<div id="footer">
	<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
	<div id="lowerfooter"> <span class="backtotop"> <a href="#">Back To Top</a> </span>
	<a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE</div>
</div>
</div></div></div>
</body>
</html>