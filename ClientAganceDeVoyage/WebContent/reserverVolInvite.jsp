<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="pac.*"%>
<html>
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
			<div id="sitename"><h1 id="logo">GoVoyage</h1></div>
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
					</div>
				</div>	
			</div>
	</div>

<div id="topcategorieslink" class="clear">
  <h2><a href="Authentification.jsp">GoVoyage</a></h2><ul>
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
			<form action="infosPassagersInvite.jsp" method="post">
				
				<%
				Vol v = (Vol)session.getAttribute("Vol");
				//session.removeAttribute("Vol");
				int prix = Integer.parseInt(v.getVolG().getPrix());
				session.setAttribute("prixVold",prix);
				%>
				
				<%if(v.getVolG().getEscale().equalsIgnoreCase("non")){%>
					<h2>&nbsp;&nbsp;&nbsp;Votre vol aller : (Direct)</h2>
					<h2>&nbsp;&nbsp;&nbsp;</h2><input type="radio" name="aller" checked="checked" value="<%=v.getIdVol() %>"><table border="0">
					<tr>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><h3>Compagnie</h3></td>
					<td><h3>Depart</h3></td>
					<td><h3>Arrivee</h3></td>
					</tr>
					<tr bgcolor="#E1E7F1">
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><%out.print(v.getVolG().getCA().getNomA());%></td>
					<td><%out.print(v.getVolG().getAeroportD().getVille().getNomVille()+"("+v.getVolG().getAeroportD().getNomA()+") "+v.getVolG().getJour()+"."+v.getDateDepart()+"-"+v.getVolG().getHeureD());%></td>
					<td><%out.print(v.getVolG().getAeroportA().getVille().getNomVille()+"("+v.getVolG().getAeroportA().getNomA()+") "+v.getVolG().getJour()+"."+v.getDateArrivee()+"-"+v.getVolG().getHeureA());%></td>
					</tr>
					<tr  bgcolor="#91EBE8"><td>&nbsp;&nbsp;&nbsp;</td><td><b>Prix Vol aller</b></td><td></td><td><%out.print(v.getVolG().getPrix()); %></td></tr>
					</table>
				<%}%>
				<%if(v.getVolG().getEscale().equalsIgnoreCase("oui")){%>
					<h3>&nbsp;&nbsp;&nbsp;Votre vol depart : (Avec escale)</h3>
					<h2>&nbsp;&nbsp;&nbsp;</h2><input type="radio" name="aller" checked="checked" value="<%=v.getIdVol() %>"><table border="0">
					<tr>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><h3>Compagnie</h3></td>
					<td><h3>Depart</h3></td>
					<td><h3>Arrivee</h3></td>
					</tr>
					<%			
					List<InfoEscale> escales = (List)v.getVolG().getInfoEscaleVolsG();
					String depart = ""+v.getVolG().getAeroportD().getVille().getNomVille()+" ("+v.getVolG().getAeroportD().getNomA()+" )--"+v.getVolG().getHeureD()+"GMT";%>
					<%for(int i=0;i<escales.size();i++){
						String arrivee = ""+escales.get(i).getAeroport().getVille().getNomVille()+" ("+escales.get(i).getAeroport().getNomA()+" )--";%>
						<tr   bgcolor="#E1E7F1">
						<td>&nbsp;&nbsp;&nbsp;</td>
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
						<tr  bgcolor="#E1E7F1"><td>&nbsp;&nbsp;&nbsp;</td><td></td><td><%out.print(depart); %></td><td><%out.print(""+v.getVolG().getAeroportA().getVille().getNomVille()+" ("+v.getVolG().getAeroportA().getNomA()+" )--"+v.getVolG().getHeureA()+"GMT");%></td></tr>
						<tr bgcolor="#91EBE8"><td>&nbsp;&nbsp;&nbsp;</td><td><b>Prix vol aller</b></td><td></td><td><%out.print(v.getVolG().getPrix()); %></td></tr>
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
												
												<h3>&nbsp;&nbsp;&nbsp;Votre vol retour : (Direct)</h3>
												<h2>&nbsp;&nbsp;&nbsp;</h2><input type="radio" name="retour" checked="checked" value="<%=vols.get(i).getIdVol() %>"><table border="0">
												<tr>
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><h3>Compagnie</h3></td>
												<td><h3>Depart</h3></td>
												<td><h3>Arrivee</h3></td>
												</tr>
												<tr bgcolor="#E1E7F1">
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><%out.print(vols.get(i).getVolG().getCA().getNomA()); %></td>
												<td><%out.print(""+vols.get(i).getVolG().getAeroportD().getVille().getNomVille()+"("+vols.get(i).getVolG().getAeroportD().getNomA()+") "+vols.get(i).getVolG().getJour()+"."+vols.get(i).getDateDepart()+"-"+vols.get(i).getVolG().getHeureD());%></td>
												<td><%out.print(""+vols.get(i).getVolG().getAeroportA().getVille().getNomVille()+"("+vols.get(i).getVolG().getAeroportA().getNomA()+") "+vols.get(i).getVolG().getJour()+"."+vols.get(i).getDateArrivee()+"-"+vols.get(i).getVolG().getHeureA());%></td>
												</tr>
												<tr  bgcolor="#91EBE8"><td>&nbsp;&nbsp;&nbsp;</td><td>Prix Vol retour</td><td></td><td><%out.print(""+vols.get(i).getVolG().getPrix());%></td></tr>
										<%}%></table>
										<%if(vols.get(i).getVolG().getEscale().equalsIgnoreCase("oui")){%>	
											<h3>&nbsp;&nbsp;&nbsp;Votre vol retour : (Avec escale)</h3>
											<h2>&nbsp;&nbsp;&nbsp;</h2><input type="radio" name="retour" value="<%=vols.get(i).getIdVol() %>"><table border="0">
											<tr>
											<td>&nbsp;&nbsp;&nbsp;</td>
											<td><h3>Compagnie</h3></td>
											<td><h3>Depart</h3></td>
											<td><h3>Arrivee</h3></td>
											</tr>
											<%			
											List<InfoEscale> escales = (List)vols.get(i).getVolG().getInfoEscaleVolsG();
											String depart = ""+vols.get(i).getVolG().getAeroportD().getVille().getNomVille()+" ("+vols.get(i).getVolG().getAeroportD().getNomA()+" )--"+vols.get(i).getVolG().getHeureD()+"GMT";%>
											
											<%for(int ii=0;ii<escales.size();ii++){
												String arrivee = ""+escales.get(ii).getAeroport().getVille().getNomVille()+" ("+escales.get(ii).getAeroport().getNomA()+" )--";%>
												<tr   bgcolor="#E1E7F1"><td>&nbsp;&nbsp;&nbsp;</td>
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
												<tr  bgcolor="#E1E7F1"><td>&nbsp;&nbsp;&nbsp;</td><td></td><td><%out.print(depart); %></td><td><%out.print(""+vols.get(i).getVolG().getAeroportA().getVille().getNomVille()+" ("+vols.get(i).getVolG().getAeroportA().getNomA()+" )--"+vols.get(i).getVolG().getHeureA()+"GMT");%></td></tr>
												<tr bgcolor="#91EBE8"><td>&nbsp;&nbsp;&nbsp;</td><td>Prix vol retour</td><td></td><td><%out.print(""+vols.get(i).getVolG().getPrix());%></td></tr>
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

		<br><br><br><br><br><br>
		<br><br><br><br><br><br>

	<div id="footer">
		<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
		<div id="lowerfooter"> <span class="backtotop"> <a href="#">Vols et Circuits</a> </span><a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE</div>
	</div>
</form>
</div></div></div>
</body>
</html>