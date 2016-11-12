<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="pac.Vol"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.util.List"%>
<%@page import="pac.InfoEscale"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%><html>
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
<form action="infosPassagers.jsp" method="post">
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
      <li><a href="#" class="highlight"> Reserver </a> </li>
      <li><a href="#"> Infos Passagers </a> </li>
      <li><a href="#"> Assurance </a> </li>
      <li><a href="#"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>

<div class="clear">&nbsp;</div>
<div id="main">

<h1>Reserver Vol</h1>
<div id="moredetails">
  <div id="listing_details">

<%
Vol v = (Vol)session.getAttribute("Vol");
//session.removeAttribute("Vol");
int prix = Integer.parseInt(v.getVolG().getPrix());
session.setAttribute("prixVold",prix);
%>

<%if(v.getVolG().getEscale().equalsIgnoreCase("non")){%>
	<h3>Votre vol aller : (Direct)</h3>
	<input type="radio" name="aller" checked="checked" value="<%=v.getIdVol() %>"><table border="0">
	<tr>
	<td>Compagnie</td>
	<td>Départ</td>
	<td>Arrivée</td>
	</tr>
	<tr bgcolor="#E1E7F1">
	<td><%out.print(v.getVolG().getCA().getNomA());%></td>
	<td><%out.print(v.getVolG().getAeroportD().getVille().getNomVille()+"("+v.getVolG().getAeroportD().getNomA()+") "+v.getVolG().getJour()+"."+v.getDateDepart()+"-"+v.getVolG().getHeureD());%></td>
	<td><%out.print(v.getVolG().getAeroportA().getVille().getNomVille()+"("+v.getVolG().getAeroportA().getNomA()+") "+v.getVolG().getJour()+"."+v.getDateArrivee()+"-"+v.getVolG().getHeureA());%></td>
	</tr>
	<tr  bgcolor="#91EBE8"><td>Prix Vol aller</td><td></td><td><%out.print(v.getVolG().getPrix()); %></td></tr>
	</table>
<%}%>
<%if(v.getVolG().getEscale().equalsIgnoreCase("oui")){%>
	<h3>Votre vol depart : (Avec escale)</h3>
	<input type="radio" name="aller" checked="checked" value="<%=v.getIdVol() %>"><table border="0">
	<tr>
	<td>Compagnie</td>
	<td>Départ</td>
	<td>Arrivée</td>
	</tr>
	<%			
	List<InfoEscale> escales = (List)v.getVolG().getInfoEscaleVolsG();
	String depart = ""+v.getVolG().getAeroportD().getVille().getNomVille()+" ("+v.getVolG().getAeroportD().getNomA()+" )--"+v.getVolG().getHeureD()+"GMT";%>
	<%for(int i=0;i<escales.size();i++){
		String arrivee = ""+escales.get(i).getAeroport().getVille().getNomVille()+" ("+escales.get(i).getAeroport().getNomA()+" )--";%>
		<tr   bgcolor="#E1E7F1">
		<%if(i==0){%>
		<td><%out.print(v.getVolG().getCA().getNomA());%></td>
		<%}%>
		<%if(i!=0){%>
		<td></td>
		<%}%>
		<td><%out.print(depart); %></td>
		<td><%out.print(arrivee+escales.get(i).getHeureD()+"GMT"); %></td>	
		</tr>
		<%
		depart=arrivee+escales.get(i).getHeureA(); 
	}%>
		<tr  bgcolor="#E1E7F1"><td></td><td><%out.print(depart); %></td><td><%out.print(""+v.getVolG().getAeroportA().getVille().getNomVille()+" ("+v.getVolG().getAeroportA().getNomA()+" )--"+v.getVolG().getHeureA()+"GMT");%></td></tr>
		<tr bgcolor="#91EBE8"><td>Prix vol aller</td><td></td><td><%out.print(v.getVolG().getPrix()); %></td></tr>
	</table>	
<%}%>
<hr style="width:700px; height:10px;" align="left" color="#E1E7F1"/>	
<%if(session.getAttribute("idVolR")!=null){
	
	Vector<Integer> vect = new Vector<Integer> ();
	String s =(String)session.getAttribute("idVolR");
	StringTokenizer stk = new StringTokenizer(s,"[], ");
	while(stk.hasMoreTokens()){
		vect.add(Integer.parseInt(stk.nextToken()));
	}
	try{
		InitialContext ctxt = new InitialContext();
		GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
		List<Vol> vols = GV.listerVolO();
		for(int j=0;j<vect.size();j++){
			for(int i=0;i<vols.size();i++){
			 	  if(vols.get(i).getIdVol()==vect.get(j)){
						if(vols.get(i).getVolG().getEscale().equalsIgnoreCase("non")){%>
								
								<h3>Votre vol retour : (Direct)</h3>
								<input type="radio" name="retour" checked="checked" value="<%=vols.get(i).getIdVol() %>"><table border="0">
								<tr>
								<td>Compagnie</td>
								<td>Départ</td>
								<td>Arrivée</td>
								</tr>
								<tr bgcolor="#E1E7F1">
								<td><%out.print(vols.get(i).getVolG().getCA().getNomA()); %></td>
								<td><%out.print(""+vols.get(i).getVolG().getAeroportD().getVille().getNomVille()+"("+vols.get(i).getVolG().getAeroportD().getNomA()+") "+vols.get(i).getVolG().getJour()+"."+vols.get(i).getDateDepart()+"-"+vols.get(i).getVolG().getHeureD());%></td>
								<td><%out.print(""+vols.get(i).getVolG().getAeroportA().getVille().getNomVille()+"("+vols.get(i).getVolG().getAeroportA().getNomA()+") "+vols.get(i).getVolG().getJour()+"."+vols.get(i).getDateArrivee()+"-"+vols.get(i).getVolG().getHeureA());%></td>
								</tr>
								<tr  bgcolor="#91EBE8"><td>Prix Vol retour</td><td></td><td><%out.print(""+vols.get(i).getVolG().getPrix());%></td></tr>
						<%}%></table>
						<%if(vols.get(i).getVolG().getEscale().equalsIgnoreCase("oui")){%>	
							<h3>Votre vol retour : (Avec escale)</h3>
							<input type="radio" name="retour" value="<%=vols.get(i).getIdVol() %>"><table border="0">
							<tr>
							<td>Compagnie</td>
							<td>Départ</td>
							<td>Arrivée</td>
							</tr>
							<%			
							List<InfoEscale> escales = (List)vols.get(i).getVolG().getInfoEscaleVolsG();
							String depart = ""+vols.get(i).getVolG().getAeroportD().getVille().getNomVille()+" ("+vols.get(i).getVolG().getAeroportD().getNomA()+" )--"+vols.get(i).getVolG().getHeureD()+"GMT";%>
							
							<%for(int ii=0;ii<escales.size();ii++){
								String arrivee = ""+escales.get(ii).getAeroport().getVille().getNomVille()+" ("+escales.get(ii).getAeroport().getNomA()+" )--";%>
								<tr   bgcolor="#E1E7F1">
								<%if(ii==0){%>
								<td><%out.print(vols.get(i).getVolG().getCA().getNomA());%></td>
								<%}%>
								<%if(ii!=0){%>
								<td></td>
								<%}%>
								<td><%out.print(depart); %></td>
								<td><%out.print(arrivee+escales.get(ii).getHeureD()+"GMT"); %></td>
								</tr>
								<%
								depart=arrivee+escales.get(ii).getHeureA(); 
							}%>
								<tr  bgcolor="#E1E7F1"><td></td><td><%out.print(depart); %></td><td><%out.print(""+vols.get(i).getVolG().getAeroportA().getVille().getNomVille()+" ("+vols.get(i).getVolG().getAeroportA().getNomA()+" )--"+vols.get(i).getVolG().getHeureA()+"GMT");%></td></tr>
								<tr bgcolor="#91EBE8"><td>Prix vol retour</td><td></td><td><%out.print(""+vols.get(i).getVolG().getPrix());%></td></tr>
						<%}%>
							</table><hr style="width:700px; height:1px;" align="left"/>			
						<%
						break;
					}
			 }
				  
		}
		
	
	}catch(NamingException e){e.printStackTrace();}
	session.removeAttribute("idVolR");
}%>
<input type="submit" name="reserver" value="Reserver">
</form>
</body>
</html>