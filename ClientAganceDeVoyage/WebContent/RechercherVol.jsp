<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.naming.*"%>
<%@page import="pac.*"%>
<%@page import="java.util.*"%>
    
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Menu Client</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/forms.css" rel="stylesheet" type="text/css" />
<link href="css/ajaxui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JSs/jquery.calendar.js"></script>
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
<form action="SelectionnerVol.jsp" method="post" name="form1">
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
<% 
try{
 	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	int id = (Integer)session.getAttribute("idClient");
	Client clt =  GV.findClt(id);%>
	<h2><img src="images/create_agent_icon.jpg" alt="Agent Account" width="27" height="22" /> <a href="#">Bienvenue Mr.<%out.print(clt.getNomClt());%></a></h2>
	   </div>
<%}catch(NamingException e){e.printStackTrace();}%>

</div>
</div>
<div class="clear">&nbsp;</div>
<div class="clear">&nbsp;</div>
  

	<div>
  <ul class="menu" >
        <li><a href='RechercherVol.jsp' class="highlight">Rechercher Vols</a></li>
        <li><a href='RechercherCircuit.jsp'>Rechercher Circuits</a></li>
        <li><a href="#">Reservations Vols </a>
            <ul>
                <li><a href='ReservationsVol.jsp'  class="highlight">Mes Reservations Vols</a></li>
                <li><a href='AReservationsVol.jsp'>Annuler Reservations Vols</a></li>
            </ul>
        </li>
        <li><a href="#">Reservations Circuits </a>
            <ul>
                <li><a href='ReservationsCircuits.jsp'>Mes Reservations Circuits</a></li>
                <li><a href='AReservationsC.jsp'>Annuler Reservations Circuits</a></li>
            </ul>
        </li>
        
        <li><a href='ParametresClient.jsp'>Parametres Du Compte</a></li>
        <li><a href='Authentification.jsp'>Deconnexion</a></li>
    </ul>
	
	</div>

<div class="clear">&nbsp;</div>
<div id="main">

<h1>Rechercher Vols</h1>
<div id="moredetails">
  <div id="listing_details">
<table><tr><td>
<table>
<tr><td>Type Vol : </td><td>Aller retour<input type="radio" name="type" value="ar"  checked="checked"></td><td>Aller simple<input type="radio" name="type" value="as" ></td></tr>
<tr><td>Au depart de : </td><td><input type="text" name="depart"></td></tr>
<tr><td>A destination de : </td><td><input type="text" name="dest"></td></tr>
<tr>
<td>Date de depart : </td>
<td><input type="text" maxlength="10" name="dated" id="dateDebut" onFocus="view_microcal(true,dateDebut,microcal,-1,0);" onBlur="view_microcal(false,dateDebut,microcal,-1,0);" onKeyUp="this.style.color=testTypeDate(this.value)?'black':'red'"></td>
<td><select name=""><option>A tout moment</option><option>Matin</option><option>Apres midi</option><option>Soir</option></select></td>
</tr>
<tr>
      <td><div id="microcal" style="visibility:hidden;position:absolute;border:2px blue dashed;background:#ffffff;"></div></td>
</tr>
<tr id="retour"><td>Date de retour : </td><td><input type="text" name="dater" maxlength="10" id="dateFin" onFocus="view_microcal(true,dateFin,microcal,-1,0);" onBlur="view_microcal(false,dateFin,microcal,-1,0);" onKeyUp="this.style.color=testTypeDate(this.value)?'black':'red'"></td><td><select name=""><option>A tout moment</option><option>Matin</option><option>Apres midi</option><option>Soir</option></select></td></tr>
<tr>
      <td><div style="visibility:hidden;position:absolute;border:2px blue dashed;background:#ffffff;"></div></td>
</tr>
<tr>
<td>Adulte(s) : </td><td><select name="adulte"><option>1</option><option>2</option><option>3</option><option>4</option></select></td>
<td>Enfant(s)(-12ans) : </td><td><select name="enfant"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select></td>
</tr>
<tr><td>Classe : </td><td><select name="classe"><option>Affaire</option><option>Economique</option></select></td></tr>
<tr><td><input type="submit" name="SearchVol" value="Rechercher"></td></tr>
</table></td>
</form>
<td>
<h2 class="sidebar_head"><span class="h2link"><a href="#">View More</a></span> PlusTot Vols </h2>
<ul class="listing">

<%
List<VolGenerique> list = new ArrayList<VolGenerique>();
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<Vol> vols = GV.listerVolO();
	Calendar dateActuel = Calendar.getInstance();
	Calendar dateF = Calendar.getInstance();
	Calendar dateDepart = Calendar.getInstance();
	dateF.add(Calendar.DAY_OF_MONTH, 10);
	int x=0;
	for(int i=0;i<vols.size();i++){
		if(x<5){
			Date dte = new Date (vols.get(i).getDateDepart()); dateDepart.setTime(dte);
			if(dateActuel.before(dateDepart) && dateDepart.before(dateF)
					&& vols.get(i).getBln().equalsIgnoreCase("ouvrir")){ x++;
			
			%>
			<li>
				<div class="listinfo">
				<img src="images/imageholder.jpg" alt="Listing Image" class="listingimage" />
				<h3><%out.print(vols.get(i).getVolG().getAeroportD().getVille().getNomVille()+"/"+vols.get(i).getVolG().getAeroportA().getVille().getNomVille()+"   -  Depart : "+vols.get(i).getDateDepart()); %></h3>
				<p>
				<%out.print(vols.get(i).getVolG().getJour()+" | "+vols.get(i).getVolG().getHeureD()+"/"+vols.get(i).getVolG().getHeureA()); %></p>
				<span class="price"><% out.print("Dh. "+vols.get(i).getVolG().getPrix()+",00");%>
				</span></div>
				<div class="listingbtns">
				<span class="listbuttons">
				<a href="SelectionnerVolInvite.jsp?depart=<%=vols.get(i).getVolG().getAeroportD().getNomA() %>&dest=<%=vols.get(i).getVolG().getAeroportA().getNomA()%>&dated=<%=vols.get(i).getDateDepart()%>&adulte=<%="1" %>&enfant=<%="0" %>&type=<%="as" %>">Voir Details</a></span>
				<span class="listbuttons">
				<a href="#">Reserver</a></span></div>
				<div class="clear">&nbsp;</div>
			</li>
		
			<%}
		}
		else
			{
			break;
			}
	} %>
</ul>
<%
}catch(NamingException e){e.printStackTrace();} %>
</td></tr></table>
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

<script type="text/javascript">
var ar = document.form1.type[0];
var as = document.form1.type[1];
as.onclick = function() {
	document.getElementById("retour").style.display = "none";
	};
ar.onclick = function() {
document.getElementById("retour").style.display = defaultStatus;
};


</script>

</body>
</html>