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
<div id="headings"align="right">    
<h2><img src="images/create_agent_icon.jpg" alt="Agent Account" width="27" height="22" /> <a href="#">Espace Client</a></h2>
   </div>
</div>
</div>
<div class="clear">&nbsp;</div>
<div class="clear">&nbsp;</div>
  

	<div>
  <ul class="menu" >
        <li><a href='RechercherVol.jsp'>Rechercher Vols</a></li>
        <li><a href='RechercherCircuit.jsp'>Rechercher Circuits</a></li>
        <li><a href="#">Reservations Vols </a>
            <ul>
                <li><a href='ReservationsVol.jsp'>Mes Reservations Vols</a></li>
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
	<h3>Votre choix selon votre critères de recherche</h3>
	<table bgcolor="#E1E7F1">
	<tr><td>Ville Depart : <%=NomV %></td><td>Destnation : <%=Dest %></td></tr>
	<tr><td>Duree : <%=duree %></td></tr>
	<tr><td>Nombre de passagers : <%=nbrP %></td></tr>
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
			<h3>Merci de Choisir le circuit qui vous plait</h3>
			<table border="1">
			<tr bgcolor="#91EBE8">
			<td>Nom Circuit</td>
			<td>Description</td>
			<td>Duree</td>
			<td>Prochaine date</td>
			<td>Voir touts Dates ouvertes à la reservation</td>
			</tr>
			<%trouv=1;}%>
			<tr>
			<td><%=C.get(i).getNom() %></td>
			<td><%=C.get(i).getDescription() %></td>
			<td><%=C.get(i).getDuree()%></td>
			<td><%=dateR.get(0).getDateD() %></td>
			<td><a href="reserverC.jsp?idC=<%=C.get(i).getId()%>&VectdateR=<%=Vectdate%>">Details Circuit</a></td>
			</tr>
				
		<%}
	}
}%>
</table>
<%}catch(NamingException e){e.printStackTrace();} %>
</body>
</html>