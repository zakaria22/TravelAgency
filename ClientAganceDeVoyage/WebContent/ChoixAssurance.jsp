<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Vector"%>
<%@page import="pac.Passager"%><html>
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
<form action="InfosClient.jsp" method="post">
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
      <li><a href="#"> Infos Passagers </a> </li>
      <li><a href="#"   class="highlight"> Assurance </a> </li>
      <li><a href="#"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>

<div class="clear">&nbsp;</div>
<div id="main">

<h1>Choix Assuraces</h1>
<div id="moredetails">
  <div id="listing_details">
<body>
<%
Vector<Passager> vect = new Vector<Passager>();
int nbrAd = (Integer)session.getAttribute("adult");
int nbrEnf = (Integer)session.getAttribute("enfant");
for(int i=1;i<=nbrAd;i++){
	String nom = request.getParameter("nomfA"+i);
	String pnom = request.getParameter("pnomA"+i);
	String dateN = request.getParameter("dateNA"+i);
	String numpassport = request.getParameter("numpassA"+i);
	String dateExpiration = request.getParameter("dateExpA"+i);
	Passager p = new Passager();
	p.setNomP(nom); p.setPnomP(pnom); p.setDateN(dateN); p.setDateExpiration(dateExpiration); p.setNumPassport(numpassport);
	vect.add(p);
}
for(int i=1;i<=nbrEnf;i++){
	String nom = request.getParameter("nomfE"+i);
	String pnom = request.getParameter("pnomE"+i);
	String dateN = request.getParameter("dateNE"+i);
	String numpassport = request.getParameter("numpassE"+i);
	String dateExpiration = request.getParameter("dateExpE"+i);
	Passager p = new Passager();
	p.setNomP(nom); p.setPnomP(pnom); p.setDateN(dateN); p.setDateExpiration(dateExpiration); p.setNumPassport(numpassport);
	vect.add(p);
}
session.setAttribute("passagers",vect);
%>
<h3>Choisissez votre assurance</h3>
<p>
Nous savons tous qu'� quelques jours de votre d�part, un impr�vu peut subitement tout interrompre et an�antir les<br>
vacances que vous attendiez tant.<br><br>
En souscrivant d�s maintenant une assurance �un cout proportionnellement bas par rapport à l'�tendue des garanties<br>
offertes, vous etes certain de partir l'��esprit serein.
</p>
<div>
<table bgcolor="#EBEEEE">
<tr><td><input type="radio" name="choix" checked="checked" value="1"><strong>Je choisis le "PACK MULTIRISQUES" (regroupant les garanties ANNULATION et ASSISTANCE)  180 DH</strong></td></tr>
<tr><td bgcolor="red">La garantie ANNULATION :</td></tr>
<tr><td><p>
<b>Vous b�n�ficiez d'une assurance UNIQUE vous permettant :</b><br>
1-d'etre indemnis� en cas d'annulation de votre part, pour tout motif justifi�, dû � un �v�nement<br>
  al�atoire.<br>
2-d'etre d�dommag� en cas de retard de vol, jusqu'� 4 heures.<br>
3-d'etre couvert dans le cas o� vous ratez votre avion. Vous pourrez alors repartir dans les 48 heures, et<br>
  l'aller de votre billet d'avion non utilis� est rembours�*.<br>
</p></td></tr>
<tr><td bgcolor="red"><b>La garantie ASSISTANCE RAPATRIEMENT :</b></td></tr>
<tr><td><p>
<b>Vous b�n�ficiez d'une couverture EXCEPTIONNELLE, vous permettant:</b><br>
1-d'etre indemnis� si vos bagages arrivent en retard � destination (250 DH d'indemnit� pour + de 24h heures de<br>
  retard) ou s'ils sont perdus (jusqu'� 850 DH de remboursement)*!<br>
2-d'etre pris en charge en cas d'accident ou de maladie grave, et d'etre rapatri� vers votre pays de<br>
  r�sidence sans limitation de frais.<br>
3-Pour les frais m�dicaux, vous etes couvert jusqu'� 10 500 DH par personne.<br>
</p></td></tr>

<tr><td><input type="radio" name="choix" value="2"><strong>Je choisis uniquement la garantie "ANNULATION"   140 DH</strong><br>
<a href="" >Voir le d�tail de l'assurance</a></td></tr>



<tr><td><input type="radio" name="choix" value="3"><strong>Je suis d�j� assur�, je ne souhaite pas etre assur�</strong><br>
<p>
J'ai pris connaissance des garanties qui m'ont �t� recommand�es et qui pourraient me pr�munir contre<br>
d'�ventuels incidents lors de mon voyage, mais je fais le choix de n'en souscrire aucune. J'assume les risques que<br>
j'encours et le fait que je ne pourrai pas recourir � la moindre indemnit� en cas de probl�me. Je<br>
pense etre suffisamment assur� � titre personnel.<br>
</p></td></tr>
</table>
<input type="submit" name="" value="Continuer">
</div>
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