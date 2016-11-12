<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="pac.Vol"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.util.List"%><html>
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
<form action="ChoixAssurance.jsp" method="post">
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
  

	<div id="topcategorieslink" class="clear">
  <h2><a href="RechercherVol.jsp">Acceuil</a></h2><ul>
      <li><a href="#"> Selectionner </a> </li>
      <li><a href="#"> Reserver </a> </li>
      <li><a href="#" class="highlight"> Infos Passagers </a> </li>
      <li><a href="#"> Assurance </a> </li>
      <li><a href="#"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>

<div class="clear">&nbsp;</div>
<div id="main">

<h1>Informations Passagers</h1>
<div id="moredetails">
  <div id="listing_details">

<% 
int ida = Integer.parseInt(request.getParameter("aller"));
session.setAttribute("idVold",ida);

if(request.getParameter("retour")!=null){
	int idr = Integer.parseInt(request.getParameter("retour"));
	session.setAttribute("idVolr",idr);
}
%>
<h3>Votre selection</h3>
<%Vol v = (Vol)session.getAttribute("Vol"); %>
<table border="0">
	<tr><td></td><td>Compagnie</td><td>Ville de depart</td><td>Ville d'arrivee</td><td>Escale(s)</td><td>Classe</td><td>Numero vol</td></tr>
	<tr  bgcolor="#E1E7F1">
	<td  bgcolor="#91EBE8">Votre vol aller </td>
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
<h3>Informations passagers</h3>
<p>
Reportez un NOM de FAMILLE et un PRÉNOM tels qu’ils figurent sur votre passeport (sans y ajouter les termes<br>
“épouse/ep.” et en supprimant tous les accents). Faites très attention à l’orthographe exacte de ces informations !
</p>
<%
int nbrAd = (Integer)session.getAttribute("adult");
int nbrEnf = (Integer)session.getAttribute("enfant");
%>

<%
for(int i=1;i<=nbrAd;i++){%>
	 <h5>Passager adulte n°:<%=i%></h5>
	 <table  border="0" bgcolor="#EBEEEE">
	 <tr><td>Titre</td></tr>
	 <tr><td><select><option>Mme</option><option>Mlle</option><option>M</option></select></td></tr>				
	 
	 <tr><td>Nom de famille</td><td>Prenom</td><td>Date de naissance</td></tr>
	 <tr>
	 <td><input type="text" name="nomfA<%=i%>"></td>
	 <td><input type="text" name="pnomA<%=i%>"></td>
	 <td><input type="text" name="dateNA<%=i%>"></td>
	 </tr>
	 <tr><td>Indiquez les données d'identité</td></tr>
	 <tr><td>Numero du passport</td><td>Date d'expiration</td></tr>
	 <tr><td><input type="text" name="numpassA<%=i%>"></td><td><input type="text" name="dateExpA<%=i%>"></td></tr>
	</table>
	<hr style="width:700px; height:1px;" align="left"/> 
<%}
for(int i=1;i<=nbrEnf;i++){%>
	<h5>Passager enfant n°:<%=i%></h5>
	<table border="0"   bgcolor="#EBEEEE">
	<tr><td>Titre</td></tr>
	 <tr><td><select><option>Mlle</option><option>M</option></select></td></tr>				
	 
	 <tr><td>Nom de famille</td><td>Prenom</td><td>Date de naissance</td></tr>
	 <tr>
	 <td><input type="text" name="nomfE<%=i%>"></td>
	 <td><input type="text" name="pnomE<%=i%>"></td>
	 <td><input type="text" name="dateNE<%=i%>"></td>
	 </tr>
	 <tr><td>Indiquez les données d'identité</td></tr>
	 <tr><td>Numero du passport</td><td>Date d'expiration</td></tr>
	 <tr><td><input type="text" name="numpassE<%=i%>"></td><td><input type="text" name="dateExpE<%=i%>"></td></tr>
	 </table>
	 <hr style="width:700px; height:1px;" align="left"/> 
<%}%>
<table>
<tr bgcolor="#C4C1B5"><td>
<p>
<input type="checkbox" name="accepter" value="">En cochant cette case vous acceptez les conditions ci-dessous<br><br>
1-J’ai bien vérifié que les noms / prénoms des voyageurs sont bien orthographiés et correspondent aux noms / prénoms<br>
indiqués sur le passeport / carte identité qui servira de document de voyage à l’enregistrement.<br><br>

2-J’ai bien vérifié que l’adresse e-mail sur laquelle je souhaite recevoir tous mes documents de voyages est correcte ainsi<br>
que le numéro de téléphone (toute erreur peut entraîner des frais supplémentaires).<br><br>

3-Je suis en règle avec les autorités locales (et de transit le cas échéant) pour les formalités de police, de douane et de<br>
santé.
</p>
<input type="submit" name="ChoixAssurance" value="Continuer">
</td></tr>
</table>
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