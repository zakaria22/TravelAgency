<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="pac.*"%><html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome >>> GOVOYAGE</title>
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/1/js-image-slider.js" type="text/javascript"></script>
    <link href="themes/1/generic.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/forms.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JSs/jquery.calendar.js"></script>
</head>
<body>
<div id="wrap">
<div id="topbar"></div>
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
      <li><a href="#" class="highlight"> Infos Passagers </a> </li>
      <li><a href="#"> Assurance </a> </li>
      <li><a href="#"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>
<form action="ChoixAssuranceInvite.jsp" method="post">
<div id="main">

<h1>Informations Passagers</h1>
<div id="moredetails">
  
<% 
int ida = Integer.parseInt(request.getParameter("aller"));
session.setAttribute("idVold",ida);

if(request.getParameter("retour")!=null){
	int idr = Integer.parseInt(request.getParameter("retour"));
	session.setAttribute("idVolr",idr);
}
%>
<h2>Votre selection</h2>
<br><br>
<%Vol v = (Vol)session.getAttribute("Vol"); %>
<table border="0">
	<tr><td></td><td><h3>Compagnie</h3></td><td><h3>Ville de depart</h3></td><td><h3>Ville d'arrivee</h3></td><td><h3>Escale(s)</h3></td><td><h3>Classe</h3></td><td><h3>Numero vol</h3></td></tr>
	<tr  bgcolor="#E1E7F1">
	<td  bgcolor="#91EBE8"><h3>Votre vol aller </h3></td>
	<td><%out.print(v.getVolG().getCA().getNomA()); %></td>
	<td><%out.print(v.getVolG().getAeroportD().getVille().getNomVille()+" /"+v.getDateDepart()+"-"+v.getVolG().getHeureD()); %></td>
	<td><%out.print(v.getVolG().getAeroportA().getVille().getNomVille()+" /"+v.getDateArrivee()+"-"+v.getVolG().getHeureA()); %></td>
	
	<%if(v.getVolG().getEscale().equalsIgnoreCase("non")){%>
	<td><%out.print("Direct"); %></td>
	<%}%>
	<%if(v.getVolG().getEscale().equalsIgnoreCase("oui")){ %>
	<td><%out.print("escales"); %></td>
	<%}%>
	
	<td><%out.print((String)session.getAttribute("classe"));%></td>
	<td><%out.print(v.getIdVol()); %></td>
	</tr>
	<%if(request.getParameter("retour")!=null){
		int idr = Integer.parseInt(request.getParameter("retour"));
		try{	
			InitialContext ctxt = new InitialContext();
			GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
			List<Vol> volr = GV.listerVolO();
			for(int i=0;i<volr.size();i++){
				if(volr.get(i).getIdVol()==idr){%>
					<tr  bgcolor="#E1E7F1">
					<td  bgcolor="#91EBE8">Votre vol retour </td>
					<td><%out.print(volr.get(i).getVolG().getCA().getNomA()); %></td>
					<td><%out.print(volr.get(i).getVolG().getAeroportD().getVille().getNomVille()+" /"+volr.get(i).getDateDepart()+"-"+volr.get(i).getVolG().getHeureD()); %></td>
					<td><%out.print(volr.get(i).getVolG().getAeroportA().getVille().getNomVille()+" /"+volr.get(i).getDateArrivee()+"-"+volr.get(i).getVolG().getHeureA()); %></td>
					<%if(volr.get(i).getVolG().getEscale().equalsIgnoreCase("non")){%>
					<td><%out.print("Direct"); %></td>
					<%}%>
					<%if(volr.get(i).getVolG().getEscale().equalsIgnoreCase("oui")){ %>
					<td><%out.print("escales"); %></td>
					<%}%>
					<td><%out.print((String)session.getAttribute("classe"));%></td>
					<td><%out.print(volr.get(i).getIdVol()); %></td>
					</tr>
				<% session.setAttribute("prixVolr",Integer.parseInt(volr.get(i).getVolG().getPrix()));
				break;}
			}
		}catch(NamingException e){e.printStackTrace();}
	}%>
<%  session.removeAttribute("classe");%>	
</table>
<br><br><br>
<h2>Informations passagers : </h2><br><br>
<p><b>
Reportez un NOM de FAMILLE et un PRENOM tels qu ils figurent sur votre passeport (sans y ajouter les termes “epouse/ep.” et en supprimant tous les accents). Faites tres attention à l orthographe exacte de ces informations !
</b></p><br><br>
<%
int nbrAd = (Integer)session.getAttribute("adult");
int nbrEnf = (Integer)session.getAttribute("enfant");
%>

<%
for(int i=1;i<=nbrAd;i++){%>
	 <h5><b>Passager adulte n°:<%=i%></b></h5>
	 <table  border="0" bgcolor="#EBEEEE">
	 <tr><td><b>Titre</b></td></tr>
	 <tr><td><select><option>Mme</option><option>Mlle</option><option>M</option></select></td></tr>				
	 
	 <tr><td><b>Nom de famille</b></td><td><b>Prenom</b></td><td><b>Date de naissance</b></td></tr>
	 <tr>
	 <td><input type="text" name="nomfA<%=i%>"></td>
	 <td><input type="text" name="pnomA<%=i%>"></td>
	 <td><input type="text" name="dateNA<%=i%>"></td>
	 </tr>
	 <tr><td><b>Indiquez les donnees d'identite</b></td></tr>
	 <tr><td><b>Numero du passport</b></td><td><b>Date d expiration</b></td></tr>
	 <tr><td><input type="text" name="numpassA<%=i%>"></td><td><input type="text" name="dateExpA<%=i%>"></td></tr>
	</table>
	<hr style="width:700px; height:1px;" align="left"/> 
<%}
for(int i=1;i<=nbrEnf;i++){%>
	<h5><b>Passager enfant n°:<%=i%></b></h5>
	<table border="0"   bgcolor="#EBEEEE">
	<tr><td><b>Titre</b></td></tr>
	 <tr><td><select><option>Mlle</option><option>M</option></select></td></tr>				
	 
	 <tr><td><b>Nom de famille</b></td><td><b>Prenom</b></td><td><b>Date de naissance</b></td></tr>
	 <tr>
	 <td><input type="text" name="nomfE<%=i%>"></td>
	 <td><input type="text" name="pnomE<%=i%>"></td>
	 <td><input type="text" name="dateNE<%=i%>"></td>
	 </tr>
	 <tr><td><b>Indiquez les donnees d identite</b></td></tr>
	 <tr><td><b>Numero du passport</b></td><td><b>Date d expiration</b></td></tr>
	 <tr><td><input type="text" name="numpassE<%=i%>"></td><td><input type="text" name="dateExpE<%=i%>"></td></tr>
	 </table>
	 <hr style="width:700px; height:1px;" align="left"/> 
<%}%>
<br><br><br>
<table>
<tr bgcolor="#C4C1B5"><td>
<b><p>
<input type="checkbox" name="accepter" value="">En cochant cette case vous acceptez les conditions ci-dessous<br><br>
1-J ai bien verifie que les noms / prenoms des voyageurs sont bien orthographies et correspondent aux noms / prenoms indiques sur le passeport / carte identite qui servira de document de voyage à l’enregistrement.<br><br>

2-J ai bien verifie que l adresse e-mail sur laquelle je souhaite recevoir tous mes documents de voyages est correcte ainsi que le numero de telephone (toute erreur peut entrainer des frais supplementaires).<br><br>

3-Je suis en regle avec les autorites locales (et de transit le cas echeant) pour les formalites de police, de douane et de sante.
</p></b><br><br><br>
<input type="submit" name="ChoixAssurance" value="Continuer">
</td></tr>
</table>
<br><br><br><br><br><br>
	<div id="footer">
	<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a>
	</div>
	<div id="lowerfooter"> <span class="backtotop"> <a href="#">Vols et Circuits</a> </span><a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE
	</div>
	</div>
</form>
</div></div></div>
</body>
</html>