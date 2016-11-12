<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="pac.*"%><html>
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
      <li><a href="#"> Infos Passagers </a> </li>
      <li><a href="#" class="highlight"> Assurance </a> </li>
      <li><a href="#"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>

<div id="main">
<h1>Choix Assuraces</h1>
<div id="moredetails">
  

<form action="infosClientInvite.jsp" method="post">
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
Nous savons tous qu'� quelques jours de votre d�part, un impr�vu peut subitement tout interrompre et an�antir les vacances que vous attendiez tant.<br><br>
En souscrivant d�s maintenant une assurance �un cout proportionnellement bas par rapport à l'�tendue des garanties offertes, vous etes certain de partir l'��esprit serein.
</p>
<br><br>
<table bgcolor="#EBEEEE">
<tr><td><input type="radio" name="choix" checked="checked" value="1"><strong>Je choisis le "PACK MULTIRISQUES" (regroupant les garanties ANNULATION et ASSISTANCE)  180 DH</strong></td></tr>
<tr><td bgcolor="red">La garantie ANNULATION :</td></tr>
<tr><td><p>
<b>Vous b�n�ficiez d'une assurance UNIQUE vous permettant :<br><br>
1-d'etre indemnis� en cas d'annulation de votre part, pour tout motif justifi�, dû � un �v�nement al�atoire.<br>
2-d'etre d�dommag� en cas de retard de vol, jusqu'� 4 heures.<br>
3-d'etre couvert dans le cas o� vous ratez votre avion. Vous pourrez alors repartir dans les 48 heures, et l'aller de votre billet d'avion non utilis� est rembours�*.<br>
</b></p></td></tr><br><br>
<tr><td bgcolor="red"><b>La garantie ASSISTANCE RAPATRIEMENT :</b></td></tr>
<tr><td><p>
<b>Vous b�n�ficiez d'une couverture EXCEPTIONNELLE, vous permettant:<br><br>
1-d'etre indemnis� si vos bagages arrivent en retard � destination (250 DH d'indemnit� pour + de 24h heures de retard ou s'ils sont perdus (jusqu'� 850 DH de remboursement)*!<br>
2-d'etre pris en charge en cas d'accident ou de maladie grave, et d'etre rapatri� vers votre pays de r�sidence sans limitation de frais.<br>
3-Pour les frais m�dicaux, vous etes couvert jusqu'� 10 500 DH par personne.<br>
</b></p></td></tr>

<tr><td><input type="radio" name="choix" value="2"><strong>Je choisis uniquement la garantie "ANNULATION"   140 DH</strong><br>
<a href="" >Voir le d�tail de l'assurance</a></td></tr>



<tr><td><input type="radio" name="choix" value="3"><strong>Je suis d�j� assur�, je ne souhaite pas etre assur�</strong><br><br>
<p><b>
J'ai pris connaissance des garanties qui m'ont �t� recommand�es et qui pourraient me pr�munir contre d'�ventuels incidents lors de mon voyage, mais je fais le choix de n'en souscrire aucune. J'assume les risques que<br>
j'encours et le fait que je ne pourrai pas recourir � la moindre indemnit� en cas de probl�me. Je pense etre suffisamment assur� � titre personnel.<br>
</b></p></td></tr>
</table><br><br>
<input type="submit" name="" value="Continuer"><br><br><br><br>
<div id="footer">
		<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
		<div id="lowerfooter"> <span class="backtotop"> <a href="#">Vols et Circuits</a> </span><a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE</div>
	</div>
</form>
</div></div></div>
</body>
</html>