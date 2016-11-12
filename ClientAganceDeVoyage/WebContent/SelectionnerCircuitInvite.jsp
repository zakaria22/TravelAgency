<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.List"%>
<%@page import="pac.*"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>

<%@page import="java.util.Vector"%>
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
      <li><a href="#" class="highlight"> Selectionner votre Circuit</a> </li>
      <li><a href="#"> Reserver </a> </li>
      <li><a href="#"> Infos Passagers </a> </li>
      <li><a href="#"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>

<div id="main">


<h1>Selectionner Vol</h1>
<div id="moredetails">
  <div id="listing_details">
<body>
<%
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<CircuitGn> C = GV.listerCircuit();
	List<CircuitDateR> dateR = GV.listerReserCircuit();
	String NomV = request.getParameter("nomVille");
	String Dest = request.getParameter("dest");
	String duree = request.getParameter("duree");
	int DureeMin=0; int DureeMax=0;
	if(duree.equalsIgnoreCase("3jours")){DureeMin=0; DureeMax=3;}
	if(duree.equalsIgnoreCase("moins 1semaine")){DureeMin=4; DureeMax=8;}
	if(duree.equalsIgnoreCase("plus 1semaine")){DureeMin=9; DureeMax=16;}
	int nbrP = Integer.parseInt(request.getParameter("nbrP"));
	session.setAttribute("nbrPassagers",nbrP);
	%>
	<h3>Votre choix selon votre critères de recherche</h3><br>
	<table bgcolor="#E1E7F1">
	<tr><td><b>Ville Depart : <%=NomV %></b></td><td><b>Destnation : <%=Dest %></b></td></tr>
	<tr><td><b>Duree : <%=duree %></b></td></tr>
	<tr><td><b>Nombre de passagers : <%=nbrP %></b></td></tr>
	</table>
	<%
	//Vector<CircuitDateR> Vectdate = new Vector<CircuitDateR>();
	
	int trouv=0;
for(int i=0;i<C.size();i++){
	int bln=0;
	if( C.get(i).getDestination().getNomPays().equalsIgnoreCase(Dest) && 
						DureeMin <= Integer.parseInt(C.get(i).getDuree()) &&	
							Integer.parseInt(C.get(i).getDuree()) <= DureeMax){
		//PROBLEME REPETITIF FREQUEMMENT /////////List<CircuitDateR> dateR = (List)C.get(i).getCircuitsDatesR();
		Vector<Integer> Vectdate = new Vector<Integer>();
		for(int j=0;j<dateR.size();j++){
			if(dateR.get(j).getCircuit().getId()==C.get(i).getId() && dateR.get(j).getNomVill().equalsIgnoreCase(NomV) && 
					dateR.get(j).getBln().equalsIgnoreCase("ouvrir")){
						Vectdate.add(dateR.get(j).getId()); bln=1; 	
			}
		}
		if(bln==1){%>
			<%if(trouv==0){%>
			<br><br><h3>Merci de Choisir le circuit qui vous plait</h3><br>
			<table border="1">
			<tr bgcolor="#91EBE8">
			<td><h4>Nom Circuit</h4></td>
			<td><h4>Description</h4></td>
			<td><h4>Duree</h4></td>
			<td><h4>Prochaine date</h4></td>
			<td><h4>Voir touts Dates ouvertes à la reservation</h4></td>
			</tr>
			<%trouv=1;}%>
			<tr>
			<td><%=C.get(i).getNom() %></td>
			<td><%=C.get(i).getDescription() %></td>
			<td><%=C.get(i).getDuree()%></td>
			<td><%=dateR.get(0).getDateD() %></td>
			<td><a href="reserverCInvite.jsp?idC=<%=C.get(i).getId()%>&VectdateR=<%=Vectdate%>">Details Circuit</a></td>
			</tr>
				
		<%}
	}
}%>
</table>
<%}catch(NamingException e){e.printStackTrace();} %>
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