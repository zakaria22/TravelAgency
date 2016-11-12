<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.Aeroport"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.util.Date"%>
<%@page import="pac.Vol"%>
<%@page import="pac.InfoEscale"%>
<%@page import="pac.Ville"%><html>
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

  
<div id="topcategorieslink" class="clear">
  <h2><a href="Authentification.jsp">GoVoyage</a></h2><ul>
      <li><a href="#" class="highlight"> Selectionner </a> </li>
      <li><a href="#"> Reserver </a> </li>
      <li><a href="#"> Infos Passagers </a> </li>
      <li><a href="#"> Assurance </a> </li>
      <li><a href="#"> Detail </a> </li>
      <li><a href="#"> Confirmation </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>

<div id="main">

<h1>Selectionner Vol</h1>
<div id="moredetails">
<%	
	String existe = "non";
	String existee = "non";
	try{	
			
			InitialContext ctxt = new InitialContext();
			GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
			List<Aeroport> aerpt = GV.listerA();
			List<Ville> villes = GV.listerVill();
			int cpt=0;
			String depart = request.getParameter("depart");
			String dest = request.getParameter("dest");
			String dated = request.getParameter("dated");
			int nbrAd= Integer.parseInt(request.getParameter("adulte"));
			session.setAttribute("adult",nbrAd);
			int nbrEnf= Integer.parseInt(request.getParameter("enfant"));
			session.setAttribute("enfant",nbrEnf);
			String classe = String.valueOf(request.getParameter("classe"));
			session.setAttribute("classe",classe);
			%>
			<br>
			 <table  bgcolor="#E1E7F1">
			<%
			String aerptD="";
			for(int i=0;i<villes.size();i++){
				if(villes.get(i).getNomVille().equalsIgnoreCase(depart)){
					for(int j=0;j<aerpt.size();j++){
						if(aerpt.get(j).getVille().getNomVille().equalsIgnoreCase(depart)){
							aerptD=aerpt.get(j).getNomA();
						}
					}
				%>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><b><%out.print(villes.get(i).getNomVille()+"( "+aerptD+" )"+"--"+villes.get(i).getP().getNomPays()+"/");%>
				<%break;}
			}
			String aerptA="";
			for(int i=0;i<villes.size();i++){
				if(villes.get(i).getNomVille().equalsIgnoreCase(dest)){
					for(int j=0;j<aerpt.size();j++){
						if(aerpt.get(j).getVille().getNomVille().equalsIgnoreCase(dest)){
							aerptA=aerpt.get(j).getNomA();
						}
					}
				%>
					<%out.print(villes.get(i).getNomVille()+"( "+aerptA+" )"+"--"+villes.get(i).getP().getNomPays());%></b></td></tr>
				<%break;}
			}
			%>
			
			<%Calendar calA = Calendar.getInstance(); calA.clear(); Date dteA = new Date(dated); calA.setTime(dteA);
				int a = calA.get(Calendar.DAY_OF_WEEK); String jourA="";
				if(a==1){jourA="Ven.";}
				if(a==2){jourA="Sam.";}
				if(a==3){jourA="Dim.";}
				if(a==4){jourA="Lun.";}
				if(a==5){jourA="Mar.";}
				if(a==6){jourA="Mer.";}
				if(a==7){jourA="Jeu.";}
			%>
			
			<%if(request.getParameter("type").equalsIgnoreCase("as")){%>
				<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Depart :<%out.print(jourA+dated); %></td></tr>
			<%}%>
			
			<% 
			if(request.getParameter("type").equalsIgnoreCase("ar")){
				String dater = request.getParameter("dater");
				Calendar calR = Calendar.getInstance(); calR.clear(); Date dteR = new Date(dater); calR.setTime(dteR);
				int r = calR.get(Calendar.DAY_OF_WEEK); String jourR="";
				if(r==1){jourR="Ven.";}
				if(r==2){jourR="Sam.";}
				if(r==3){jourR="Dim.";}
				if(r==4){jourR="Lun.";}
				if(r==5){jourR="Mar.";}
				if(r==6){jourR="Mer.";}
				if(r==7){jourR="Jeu.";}%>
				<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Depart :<%out.print(jourA+dated +"/ Retour :"+jourR+dater); %></td></tr>
			<%}%>
			
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Classe<%out.print("("+classe+")"); %> : <%out.print(nbrAd+nbrEnf+" Passager(s)"); %></td></tr>
			</table>
			<blockquote>
			  <p><br>
			      <br>
		      </p>
			  <h2>&nbsp;&nbsp;Resultats de la recherche</h2>
			  <p><br>
			      <br>
			      <%
			List<Vol> v = GV.listerVolO();
			List<InfoEscale> escales = GV.listerEscal();
			
			
			
			
if(request.getParameter("type").equalsIgnoreCase("as")){%>
			    
			    
			      <%
			existee="oui";
			for(int i=0;i<v.size();i++){
				if( (v.get(i).getDateDepart().equalsIgnoreCase(dated)) && 
					(v.get(i).getVolG().getAeroportD().getNomA().equalsIgnoreCase(aerptD)) && 
						(v.get(i).getVolG().getAeroportA().getNomA().equalsIgnoreCase(aerptA)) &&
							( Integer.parseInt(v.get(i).getNbrPlace()) >= nbrAd+nbrEnf ) &&
								(v.get(i).getBln().equalsIgnoreCase("ouvrir"))){%>
			    
			    <%if(existe.equals("non")){%>
		      </p>
	  </blockquote>
			<table border="0" >
			  <tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><h3>Compagnie</h3></td>
				<td><h3>Depart</h3></td>
				<td><h3>Escale(s)</h3></td>
				<td><h3>Prix par Adulte</h3></td>
				<td><h3>Prix TOTAL</h3></td>
				<td><h3>Tout visualiser</h3></td>
			  </tr>	
			  <% existe="oui";}
						%>
			  <tr  bgcolor="#E1E7F1">
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><%=v.get(i).getVolG().getCA().getNomA()%></td>
				<td><%out.print(""+v.get(i).getVolG().getJour()+","+v.get(i).getDateDepart());%></td>
				<%
						if(v.get(i).getVolG().getEscale().equalsIgnoreCase("non")){
							%><td><%out.print("Direct");%></td><%
						}	
						else{
							for(int j=0;j<escales.size();j++){
		
								if(escales.get(j).getVolG().getVolG()==v.get(i).getVolG().getVolG()){
									cpt++;
								}
							}
							%><td><%out.print(cpt+"escale(s)"); cpt=0;%></td><%
						}
						%>
				<td><%=v.get(i).getVolG().getPrix() %></td>
				<% int prxT=0;  
					   	int prx = Integer.parseInt(v.get(i).getVolG().getPrix()); 
					   	int nbrA=nbrAd; while(nbrA!=0){prxT=prxT+prx; nbrA--;} 
					   	int nbrE=nbrEnf;while(nbrE!=0){prxT=prxT+(prx*30/100); nbrE--;}
						%>
				<td><%out.print(""+prxT); %></td>
				<td><a href="servCltI?val=<%=v.get(i).getIdVol()%>">Visualiser</a></td>
			  </tr>
			  <%}
			}%></table>
            <blockquote>
              <p>
                <%}

if(request.getParameter("type").equalsIgnoreCase("ar")){ 
		existe="oui";
		String dater = request.getParameter("dater"); %>
                  <% 
		for(int i=0;i<v.size();i++){
			int bln=0;
			ArrayList<Integer> list = new ArrayList<Integer>(); 
			if( (v.get(i).getDateDepart().equalsIgnoreCase(dated)) && 
					(v.get(i).getVolG().getAeroportD().getNomA().equalsIgnoreCase(aerptD)) && 
						(v.get(i).getVolG().getAeroportA().getNomA().equalsIgnoreCase(aerptA)) &&
							(Integer.parseInt(v.get(i).getNbrPlace())>=(nbrAd+nbrEnf))  &&
							(v.get(i).getBln().equalsIgnoreCase("ouvrir"))){
						
								for(int j=0;j<v.size();j++){
									if( (v.get(j).getDateDepart().equalsIgnoreCase(dater)) && 
											(v.get(j).getVolG().getAeroportD().getNomA().equalsIgnoreCase(aerptA)) && 
												(v.get(j).getVolG().getAeroportA().getNomA().equalsIgnoreCase(aerptD))  && 
													(v.get(j).getVolG().getCA().getNomA().equalsIgnoreCase(v.get(i).getVolG().getCA().getNomA())) &&
														(Integer.parseInt(v.get(j).getNbrPlace())>=(nbrAd+nbrEnf))  &&
														(v.get(i).getBln().equalsIgnoreCase("ouvrir"))){
													
													list.add(v.get(j).getIdVol());  
													bln=1; 
															
									}	
								}
							
							if(existee.equals("non")){%>
              </p>
            </blockquote>
            <table border="0">
			  <tr>
				<td><h3>Compagnie</h3></td>
				<td><h3>Depart</h3></td>
				<td><h3>Retour</h3></td>
				<td><h3>Escale(s)</h3></td>
				<td><h3>Prix par Adulte pour le vol aller </h3></td>
				<td><h3>Prix TOTAL</h3></td>
				<td><h3>Tout visualiser</h3></td>
			  </tr>					
			  <% existee="oui";}%>
			  <tr  bgcolor="#E1E7F1">
				<%if(bln==1){%>
				  <td><%=v.get(i).getVolG().getCA().getNomA()%></td>
				  <td><%out.print(""+v.get(i).getVolG().getJour()+","+v.get(i).getDateDepart());%></td>
				  <td><%out.print(dater);%></td>
				  <%
							if(v.get(i).getVolG().getEscale().equalsIgnoreCase("oui")){
								for(int j=0;j<escales.size();j++){
									if(escales.get(j).getVolG().getVolG()==v.get(i).getVolG().getVolG()){
										cpt++;
									}
								}
								%><td><%out.print(cpt+"escale(s)"); cpt=0;%></td><%
							}
							if(v.get(i).getVolG().getEscale().equalsIgnoreCase("non")){
								%><td><%out.print("Direct");%></td><%
							}%>	
				  <td><%=v.get(i).getVolG().getPrix() %></td>
				  <% int prxT=0;  
							   int prx = Integer.parseInt(v.get(i).getVolG().getPrix()); 
							   int nbrA=nbrAd; while(nbrA!=0){prxT=prxT+prx; nbrA--;} 
							   int nbrE=nbrEnf;while(nbrE!=0){prxT=prxT+(prx*30/100); nbrE--;}
							%>
				  <td><%out.print(""+prxT); %></td>
				  <td><a href="servClt?val1=<%=v.get(i).getIdVol()%>&Vectt=<%=list%>"> Visualiser</a></td>
							
				<%}%>
			  </tr>
						
			<%}
			
		}%></table>
	        <blockquote>
	          <p>
	            <%}
}catch(NamingException e){e.printStackTrace();}
if(existe.equals("non")){%>
                      </p>
      </blockquote>
      <table bgcolor="#E1E7F1"><tr><td>Votre Recherche ne correspend a aucun vol </td></tr></table>
            <blockquote>
              <p>
                <%}%>
                      </p>
            </blockquote>
      <br><br><br><br><br>
	  <div id="footer">
	<div id="upperfooter"> 
	  <blockquote>
	    <p><a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </p>
	    </blockquote>
	</div>
	<div id="lowerfooter"> 
	  <blockquote>
	    <p><span class="backtotop"><a href="#">Vols et Circuits</a> </span>
	          <a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE</p>
	    </blockquote>
	</div>
	</div>
</div></div></div>
</body>
</html>