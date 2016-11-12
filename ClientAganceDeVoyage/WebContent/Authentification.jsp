<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.VolGenerique"%>
<%@page import="java.util.*"%>
<%@page import="pac.Vol"%><html>
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
<h2><img src="images/create_indi_usr.jpg" alt="Individual User" width="25" height="22" /> <a href="#">Accédez à votre compte</a> </h2>   
   </div>
<div id="login">
  
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
  password oublié ?  </p>
</form>


</div></div>
</div></div>
<div id="content">
  
<div id="topcategorieslink" class="clear">
  <h2>Menu</h2><ul>
    <li><a href="Authentification.jsp"   class="highlight"> Vol  </a> </li>

    <li><a href="Authentification1.jsp"> Circuit </a> </li>
</ul>
  </div>
<div class="clear">&nbsp;</div>

<div id="main">
<h1>Rechercher votre Vol</h1>
<div id="moredetails">
  <div id="listing_details">


<form action="SelectionnerVolInvite.jsp" method="post" name="form1">
<table>
<tr><td>
<table border="0">
<tr><td>Type Vol : </td>
<td width="148">Aller retour
  <input type="radio" name="type" value="ar"  checked="checked"></td><td width="127">Aller simple
    <input type="radio" name="type" value="as" ></td></tr>
<tr><td>Au depart de : </td><td><input type="text" name="depart"></td></tr>
<tr><td>A destination de : </td><td><input type="text" name="dest"></td></tr>
<tr>
<td>Date de depart :</td>
			<td>
			<input type="text" maxlength="10" name="dated" 
			id="dateDebut" onFocus="view_microcal(true,dateDebut,microcal,-1,0);" 
			onBlur="view_microcal(false,dateDebut,microcal,-1,0);" 
			onKeyUp="this.style.color=testTypeDate(this.value)?'black':'red'">
			</td>
			
<td><select name=""><option>A tout moment</option><option>Matin</option><option>Apres midi</option><option>Soir</option></select></td>
</tr>
			<tr>
			      <td><div id="microcal" style="visibility:hidden;position:absolute;border:2px blue dashed;background:#ffffff;"></div></td>
			</tr>
			
<tr id="retour"><td>Date de retour : </td><td><input type="text" name="dater" maxlength="10" id="dateFin" onFocus="view_microcal(true,dateFin,microcal,-1,0);" onBlur="view_microcal(false,dateFin,microcal,-1,0);" onKeyUp="this.style.color=testTypeDate(this.value)?'black':'red'"></td><td><select name=""><option>A tout moment</option><option>Matin</option><option>Aprï¿½s midi</option><option>Soir</option></select></td></tr>
<tr>
      <td><div style="visibility:hidden;position:absolute;border:2px blue dashed;background:#ffffff;"></div></td>
</tr>
<tr>
<td>Adulte(s) : </td><td><select name="adulte"><option>1</option><option>2</option><option>3</option><option>4</option></select></td>
<td>Enfant(s)(-12ans) : </td><td width="71"><select name="enfant"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select></td>
</tr>
<tr><td>Classe : </td><td><select name="classe"><option>Affaire</option><option>Economique</option></select></td></tr>
<tr><td><input type="submit" name="SearchVol" value="Rechercher"></td></tr>
</table>
</td>
<td width="20%"></td>
<td>
<table>
  <tr><td align="left">
<div id="sliderFrame">
  <div id="slider" align="center">
            <a href="http://www.menucool.com/jquery-slider" target="_blank">
                <img src="img/image-slider-1.jpg" alt="Welcome to GOVOYAGE" />
            </a>
            <img src="img/image-slider-2.jpg" alt="" />
            <img src="img/image-slider-3.jpg" alt="Reservation simple et rapide." />
            <img src="img/image-slider-4.jpg" alt="#htmlcaption" />
            <img src="img/image-slider-5.jpg" />
        </div>
        <div id="htmlcaption" style="display: none;">
            <em>Vol et Circuit</em>
        </div>
    </div>
</td>
</tr></table></td></tr></table>
  <div class="block smsalert">
    <h3>&gt;GOVOYAGE vous garantit </h3>
    <ul>
	<li>Tous nos prix sont TTC</li>
    <li>Des prix bas garantit toute l'annee</li>
    <li>Une offre aerienne au meilleur prix</li>
	</ul>
    <p><a href="#"><img src="images/smsbutton.gif" alt="SMS Alerts" /></a></p>
  </div>
</form>

<p>&nbsp;</p>
<h1>Meilleurs Offres Vols </h1>
<table>
<tr><td width="560">
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
</td>
<td width="579">
<h2 class="sidebar_head"><span class="h2link"><a href="#">View More</a></span> Vols interieurs </h2>
<ul class="listing">
<% 
List<VolGenerique> volgInterieur = new ArrayList<VolGenerique>();
List<VolGenerique> volg =  GV.listerVolG();
for(int i=0;i<volg.size();i++){
	
	if(volg.get(i).getAeroportD().getVille().getP().getNomPays().equalsIgnoreCase("maroc")
			&& volg.get(i).getAeroportA().getVille().getP().getNomPays().equalsIgnoreCase("maroc")){volgInterieur.add(volg.get(i));	}
}
x=0;
for(int i=0;i<vols.size();i++){
	if(x<5){
		for(int j=0;j<volgInterieur.size();j++){
			if(vols.get(i).getVolG().getVolG()==volgInterieur.get(j).getVolG()
					&& vols.get(i).getBln().equalsIgnoreCase("ouvrir")){x++;%>
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
										
				<% break;
			}
		}
	}
	else
	{
		break;
	}

}
%>
</ul>
<%
}catch(NamingException e){e.printStackTrace();} %>
</td></tr></table>
    <table width="1018" cellpadding="0" cellspacing="0">
      <tr>
        <td><h3>le poid autorisé des bagages sur mon Vol ? </h3></td>
      </tr>
      <tr>
        <td><ul>
            <li>Le poids autorisé varie selon la compagnie aérienne avec laquelle vous voyagez.<br>
              Vous retrouverez tous les détails concernant le poids autorisé sur votre confirmation de vol. Voici les informations générales à  savoir :<br>
              <br>
              1/ Concernant les bagages en cabine : <br>
              Sur les vols charters et vols réguliers, le poids maximum autorisé sâélÃ¨ve à  5 kg par personne. Les dimensions de votre bagage à  main ne doivent </li>
            <li>pas excéder 55x35x25 cm<br>
              <br>
              En règle générale, les compagnies aériennes autorisent de porter un sac dâappoint supplémentaire si vous voyagez avec un bÃ©bÃ©.Â <br>
              <br>
              IMPORTANT :Â Des mesures de restriction sont rigoureusement appliquÃ©es dans les aÃ©roports sur les contenus liquides. Pour plus dâinformations, nous vous </li>
            <li>invitons Ã  consulter le site de la Direction gÃ©nÃ©rale de lâAviation civile (DGAC).Â <a href="http://www.dgac.fr/" target="_self">http://www.dgac.fr/</a><br>
              <br>
              <br>
              2/ Concernant les bagages en soute :<br>
              Vous retrouverez toutes les informations relatives au poids autorisÃ© des bagages sur vos documents de confirmation envoyÃ©s par GO Voyages.Â <br>
              Reportez-vous Ã  la franchise bagages mentionnÃ©e sur votre billet Ã©lectronique si vous voyagez en vol rÃ©gulier. Pour les vols charters, reportez-vous Ã  la franchise </li>
            <li>bagages mentionnÃ©e sur votre convocation aÃ©roport.<br>
              <br>
              Si vous souhaitez obtenir davantage dâinformations nâhÃ©sitez pas Ã  contacter nos conseillers viaÂ <a href="http://www.govoyages.com/formulaire_contact.html" target="_self">le formulaire de contact</a>.</li>
        </ul></td>
      </tr>
    </table>

<div class="clear">&nbsp;</div>

	<div id="footer">
	<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> 
	</div>
	<div id="lowerfooter"> <span class="backtotop"> <a href="#">Vols et Circuits</a> </span><a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">BIENVENUE</a> sur GOVOYAGE
	</div>
	</div>
</div></div></div></div>


</body>
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
</html>