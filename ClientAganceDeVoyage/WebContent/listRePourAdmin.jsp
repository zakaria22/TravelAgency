<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.List"%>
<%@page import="pac.Reservation"%>
<%@page import="java.util.Vector"%>
<%@page import="pac.Passager"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%><html>
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
<script type="text/javascript">
function afficher(id){
	Id = document.getElementById(id);
	//location.reload(true);
	Id.style.display = "";
}
function masquer(id){
	Id = document.getElementById(id);
	//location.reload(true);
	Id.style.display = "none";
}
</script>
<body>
<form>
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
<h1>Liste des R�s�rvations Vol</h1>
<div id="moredetails">
  <div id="listing_details">

<% 
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<Passager> P = GV.listerPassagers();
Vector<Reservation> vect= (Vector<Reservation>)session.getAttribute("reservations");
////////////////////////////////////////////////////////////////////////////////////
Reservation Re = new Reservation();
for(int i=0;i<vect.size();i++){
	for(int j=i+1;j<vect.size();j++){
		if(vect.get(j).getVol().getIdVol()<vect.get(i).getVol().getIdVol()){
			Re = vect.get(j);
			vect.set(j,vect.get(i));
			vect.set(i,Re);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////
int id=0;
for(int i=0;i<vect.size();i++){%>
	<%if(vect.get(i).getVol().getIdVol()!=id){%>
		<%if(i!=0){%>
			</table>
			-----------------------------------------------------------------------------------------------	
		<%}%>
		<table cellspacing="0" cellpadding="0">
		<tr><td><h3>Vol N� : <%=vect.get(i).getVol().getIdVol()%> || Compagnie : <%=vect.get(i).getVol().getVolG().getCA().getNomA()%></h3></td></tr>
		<tr><td><h3>DEPART : <%=vect.get(i).getVol().getVolG().getAeroportD().getVille().getP().getNomPays()%> - <%=vect.get(i).getVol().getVolG().getAeroportD().getVille().getNomVille()%> (<%=vect.get(i).getVol().getVolG().getAeroportD().getNomA()%>)   ||   <%=vect.get(i).getVol().getVolG().getJour()%> . <%=vect.get(i).getVol().getDateDepart()%> - <%=vect.get(i).getVol().getVolG().getHeureD()%></h3></td></tr>
		<tr><td><h3>ARRIVEE : <%=vect.get(i).getVol().getVolG().getAeroportA().getVille().getP().getNomPays()%> - <%=vect.get(i).getVol().getVolG().getAeroportA().getVille().getNomVille()%> (<%=vect.get(i).getVol().getVolG().getAeroportA().getNomA()%>)   ||   <%=vect.get(i).getVol().getVolG().getJour()%> . <%=vect.get(i).getVol().getDateArrivee()%> - <%=vect.get(i).getVol().getVolG().getHeureA()%></h3></td></tr>
		<tr><td><a href="#" OnClick="masquer('<%=vect.get(i).getVol().getIdVol() %>')">Masquer reservations</a> || <a href="#" OnClick="afficher('<%=vect.get(i).getVol().getIdVol() %>')">Afficher reservations</a></td></tr>
		</table>
		<%id=vect.get(i).getVol().getIdVol();%>
		<table border="1"  id="<%=vect.get(i).getVol().getIdVol()  %>" style="display:none;">
		<tr>
		<td><h3>N� de reservation</h3></td>
		<td><h3>date reservation</h3></td>
		<td><h3>Nom du client</h3></td>
		<td><h3>N� CIN</h3></td>
		<td><h3>Nombre de passagers</h3></td>
		</tr>
	<%}%>
<tr>
<td><%out.print(vect.get(i).getIdRserv()); %></td>
<td><%out.print(vect.get(i).getDateReserv()); %></td>
<td><%out.print(vect.get(i).getClt().getNomClt()); %></td>
<td><%out.print(vect.get(i).getClt().getCodePostal()); %></td>
<td>
<%int nbrP = 0; for(int j=0;j<P.size();j++) 
{if(P.get(j).getReservationsConcern().getIdRserv()==vect.get(i).getIdRserv()){nbrP++;}}%>
<%out.print(nbrP); %></td>
<td><a href="authentification?idR=<%=vect.get(i).getIdRserv()%>" >Informations Passagers</a></td>
</tr>
		
<%}
}catch(NamingException e){e.printStackTrace();}%>
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
</form>
</body>
</html>