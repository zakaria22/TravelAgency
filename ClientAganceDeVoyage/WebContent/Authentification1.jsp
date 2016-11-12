<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.*"%>

<%@page import="javax.naming.NamingException"%>
<%@page import="pac.Ville"%>
<%@page import="pac.Pays"%>
<%@page import="pac.CircuitDateR"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome » GOVOYAGE</title>
<link href="themes/5/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/5/js-image-slider.js" type="text/javascript"></script>
    <link href="themes/1/generic.css" rel="stylesheet" type="text/css" />


	<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/forms.css" rel="stylesheet" type="text/css" />
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
<h2><img src="images/create_indi_usr.jpg" alt="Individual User" width="25" height="22" /> <a href="#">Accédez à votre compte</a> </h2>   
   </div>
<div id="login">
  
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
  password oublié ?  </p>
</form>


</div></div>
</div></div>

<div id="content">
  
<div id="topcategorieslink" class="clear">
  <h2>Menu</h2><ul>
    <li><a href="Authentification.jsp"> Vol  </a> </li>

    <li><a href="Authentification1.jsp"  class="highlight"> Circuit </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>

<div id="main">
<h1>Rechercher votre Vol</h1>
<div id="moredetails">
  <div id="listing_details">

<form action="SelectionnerCircuitInvite.jsp" method="post">
<%try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<Ville> V= GV.listerVill(); 
	List<Pays> pays = GV.listerP();
	Vector<Ville> villes = new Vector<Ville>();
	for(int i=0;i<V.size();i++){
		if(V.get(i).getP().getNomPays().equalsIgnoreCase("maroc")){villes.add(V.get(i));}
	}
%>
<h3>Rechercher votre circuit</h3>
<table height="174">
<tr><td width="123">Ville depart : </td>
<td width="265"><select name="nomVille"><option value="-1">--------</option>
<%for(int i=0;i<villes.size();i++){ %>
<option value="<%=villes.get(i).getNomVille() %>"><%=villes.get(i).getNomVille() %></option>
<%} %>
</select></td>
</tr>
<tr><td>Destination : </td>
<td><select name="dest">
<option value="-1">-------</option>
<%for(int k=0;k<pays.size();k++){ if(!pays.get(k).getNomPays().equalsIgnoreCase("maroc")){%>
<option value="<%=pays.get(k).getNomPays() %>"><%=pays.get(k).getNomPays() %></option>
<%}}%>
</select></td>
</tr>
<tr><td>Durée : </td>
<td><select name="duree">
<option value="-1">-------</option>
<option value="3jours">3 jours</option>
<option value="moins 1semaine">moins 1semaine</option>
<option value="plus 1semaine">plus 1semaine</option>
</select></td>
</tr>
<tr>
<td>nombre passagers : </td>
<td><select name="nbrP"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td>
</tr>
<tr><td><input type="submit" name="rechercherC" value="rechercher"></td></tr>
</table>
</form>
<%}catch(NamingException e){e.printStackTrace();} %>
<table>
<tr><td>
<div id="sliderFrame">
        <div id="ribbon"></div>
        <div id="slider">
            <a href="http://www.menucool.com/">
                <img src="img/image-slider-11.jpg" alt="Welcome to GoVoyage.com" />
            </a>
            <img src="img/image-slider-22.jpg" alt="Découvrez nos circuits" />
            <img src="img/image-slider-33.jpg" alt="réservation en ligne" />
            <img src="img/image-slider-44.jpg" alt="Bienvenue sur notre site GoVoyage" />
            <img src="img/image-slider-55.jpg"/>
            <img src="img/image-slider-11.jpg" />
            <img src="img/image-slider-22.jpg"/>
            <img src="img/image-slider-33.jpg" />
        </div>
        <div id="htmlcaption" style="display: none;">
            <em>HTML</em> caption. Back to <a href="">GoVoyage</a>.
        </div>
                
        <!--thumbnails-->
        <div id="thumbs">
            <div class="thumb"><img src="img/thumb1.jpg" /></div>
            <div class="thumb"><img src="img/thumb2.jpg" /></div>
            <div class="thumb"><img src="img/thumb3.jpg" /></div>
            <div class="thumb"><img src="img/thumb4.jpg" /></div>
            <div class="thumb"><img src="img/thumb5.jpg" /></div>
            <div class="thumb"><img src="img/thumb1.jpg" /></div>
            <div class="thumb"><img src="img/thumb2.jpg" /></div>
            <div class="thumb"><img src="img/thumb3.jpg" /></div>
        </div>
    </div>
</td><td>
<p>&nbsp;</p>
<h1>Nos meilleurs séjours</h1>
<ul class="listing">
<% 
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<CircuitDateR> lst = GV.listerReserCircuit();
	int x=0;
	for(int i=0;i<lst.size();i++){
		if(x<4){
		if(lst.get(i).getBln().equalsIgnoreCase("ouvrir")){	x++;
%>
<li>
<div class="listinfo">
<img src="images/imageholder.jpg" alt="Listing Image" class="listingimage" />
<h3><%out.print(lst.get(i).getNomVill()+"/"+lst.get(i).getCircuit().getDestination().getNomPays()+"   -  Depart le : "+lst.get(i).getDateD());%></h3>
<p>
<%out.print("Nom : "+lst.get(i).getCircuit().getNom()+"/ Duree : "+lst.get(i).getCircuit().getDuree()); %></p>
<span class="price"><%out.print("Dh. "+lst.get(i).getPrix()+",00"); %></span>
<div class="listingbtns">
<span class="listbuttons">
<a href="SelectionnerCircuitInvite.jsp?nomVille=<%=lst.get(i).getNomVill() %>&dest=<%=lst.get(i).getCircuit().getDestination().getNomPays()%>&duree=<%="3jours"%>&nbrP=<%="1" %>">Voir Details</a></span>
</div></div>
<div class="clear">&nbsp;</div>
</li>
<%}}else{break;} }%>
</ul>
<%
}catch(NamingException e){e.printStackTrace();} %>
</td>
</tr></table>
<div id="moredetails">
  <div id="listing_details">
<table cellspacing="0" cellpadding="0">
  <tr>
    <td><h3>Property Features</h3></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><ul>
    
      <li>Status:  Active-Exclusive Right</li>
      <li>County:  Clark</li>
      <li>Community Name:  Southern Highlands</li>
      <li>Year Built: 2005</li>
      <li>3 total bedroom(s)</li>
      <li>4 total bath(s)</li>
      <li>1 total full bath(s)</li>
      <li>2 total three-quarter bath(s)</li>
      <li>1 total half bath(s)</li>
      <li>Approximately 3220 sq. ft.</li>
            <li>Master bedroom is 18X15</li>
        <li>Dining room is 14X13</li>
        <li>2 fireplaces</li>
        <li>Fireplace features:  Gas, In Living/Great room, On Courtyard patio</li>
        <li>4 or more car garage</li>
    </ul>          </td>
    <td><ul>
      <li>Attached parking</li>
        <li>Heating features:  2+ units, Central, Gas</li>
        <li>Central air conditioning</li>
        <li>Roofing:  Tile like</li>
        <li>Lot is 12632 sq. ft.</li>
        <li>Approximately 0.29 acre(s)</li>
        <li>Lot size is less than 1/2 acre</li>
        <li>Elementary School:  Frias Charles &amp; Phyllis</li>
        <li>Jr. High School:  Lawrence</li>
        <li>High School:  Sierra Vista High</li>
    </ul>
    <ul>
        <li>Two story</li>
        <li>Master bedroom</li>
        <li>Dining room</li>
        <li>Bathroom(s) on main floor</li>
        <li>Bedroom(s) on main floor</li>
  
      </ul></td>
  </tr>
</table>
</div>
<div class="clear">&nbsp;</div>

</div>
<p>&nbsp;</p>
<h1>&nbsp;</h1>
  </div>
  <div class="clear">&nbsp;</div>
</div>
<div id="footer">
<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
<div id="lowerfooter"> <span class="backtotop"> <a href="#">Back To Top</a> </span>

<!-- Removing this link back to Ramblingsoul.com will be violation of the Creative Commons Attribution 3.0 Unported License, under which this template is released for download -->
<a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE
<!-- Copyright - Ramblingsoul.com -->

</div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
var ar = document.form1.type[0];
var as = document.form1.type[1];
ar.onclick = function() {
document.getElementById("retour").style.display = "block";
};
as.onclick = function() {
document.getElementById("retour").style.display = "none";
};
onload = function() { 
	document.getElementById("retour").style.display = "block"; 
};
</script>
</body>
</html>