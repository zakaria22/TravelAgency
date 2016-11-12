<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.Aeroport"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.CompagnieAérienne"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gestion Résérvation du vol et circuit en ligne</title>
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

<script language="javascript" type="text/javascript">
function Valider(f){
          if (typeof XMLHttpRequest != "undefined"){
          xmlHttp= new XMLHttpRequest();
          }
          else if (window.ActiveXObject){
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
          }
          if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
          } 
          var ca = f.CA.value;
          var j = f.jr.value;
          var ad = f.AD.value;
          var aa = f.AA.value;
          //var hd = f.hd;
          //var ha = f.ha;
          
          
          	      	
          var url="serv";
      
          url +="?ca=" +ca ;
          xmlHttp.onreadystatechange = stateVolg;
          xmlHttp.open("POST", "serv?ca="+ca+"&jr="+j+"&ad="+ad+"&aa="+aa, true);
          xmlHttp.send(null);
          
          }
    		
          function stateVolg(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        	  		
              document.getElementById("div1").innerHTML=xmlHttp.responseText;
              
          }   
          }

          function popupOuvrirResrv(idVolg) {
        	  width = 350;
              height = 250;
              if(window.innerWidth)
              {
                      var left = (window.innerWidth-width)/2;
                      var top = (window.innerHeight-height)/2;
              }
              else
              {
                      var left = (document.body.clientWidth-width)/2;
                      var top = (document.body.clientHeight-height)/2;
              }
                window.open('popupOuvrirResrv.jsp?idVolg='+idVolg,'myPopup','menubar=no, scrollbars=yes, top='+top+', left='+left+', location=yes ,width='+width+', height='+height+'');
    		}
</script>
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
        <li><a href="#">Vols Générique </a>
            <ul>
                <li><a href='AjouterVol.jsp'>Ajouter Vol</a></li>
                <li><a href='ListerVolG.jsp'>Lister Vols</a></li>
            </ul>
        </li>
        <li><a href="#">Circuits Générique</a>
            <ul>
                <li><a href='AjouterCircuit.jsp'>Ajouter Circuit</a></li>
                <li><a href='ListerCircuit.jsp'>Lister Circuits</a></li>
            </ul>
        </li>
        <li><a href="#">Résérvations Vols</a>
            <ul>
                <li><a href='OuvrirReservation.jsp'>Ouvrir résérvation</a></li>
                <li><a href='FermerReservation.jsp'>Fermer résérvation</a></li>
            	<li><a href='VoirReservationsVol.jsp'>Voir résérvations Vols</a></li>
            </ul>
        </li>
        <li><a href='ParametreVol.jsp'>Paramètres</a></li>
        <li><a href="#">Deconnexion</a></li>
    </ul>
	
	</div>
<form>
<div id="content">

<div class="clear">&nbsp;</div>

<div id="main">
<h1>Ouvrir résérvation Vol</h1>
<div id="moredetails">
  <div id="listing_details">
<table cellspacing="0" cellpadding="0">
<% 
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<Aeroport> AD= GV.listerA();
	List<Aeroport> AA= GV.listerA();
	List<CompagnieAérienne> CA= GV.listerCA();%>
	<tr>
	<td>Compagnie Aérienne : </td><td><select name="CA">
	<%for(int i=0;i<CA.size();i++){%>
		
			<option value="<%=CA.get(i).getIdCompA()%>"><%=CA.get(i).getNomA()%></option>
	<%}%>
	</select></td></tr>
	<tr><td>Jour : </td><td><select name="jr">
	<option value="-1">-------</option>
	<option value="lundi">lundi</option>
	<option value="mardi">mardi</option>
	<option value="mercredi">mercredi</option>
	<option value="jeudi">jeudi</option>
	<option value="vendredi">vendredi</option>
	<option value="samedi">samedi</option>
	<option value="dimanche">dimanche</option>
	</select></td></tr>
	<tr>
	<td>Aéroport Départ : </td><td><select name="AD">
	<%for(int i=0;i<AD.size();i++){%>
		
			<option value="<%=AD.get(i).getIdA()%>"><%=AD.get(i).getNomA()%></option>
	<%}%>
	</select></td>
	<td>Aéroport Arrivée : </td><td><select name="AA">
	<%for(int i=0;i<AA.size();i++){%>
		
			<option value="<%=AA.get(i).getIdA()%>"><%=AA.get(i).getNomA()%></option>
	<%}%>
	</select></td></tr>
	
	<%}catch(NamingException e){e.printStackTrace();}%>
<tr><td><input type="button" name="valider" value="RechercherVol" OnClick='Valider(this.form)'></td></tr>
</table></div>

<div id="div1"></div>
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
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<h1>Similar Items</h1>
<div id="footer">
<div id="upperfooter"> <a href="#">Home</a> | <a href="#">Search</a> | <a href="#">Register</a> | <a href="#">Pro Agent Account</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> |<a href="#"> Privacy Policy</a> <a href="#">Terms Of Use</a> | <a href="#">Advertise With Us</a> </div>
<div id="lowerfooter"> <span class="backtotop"> <a href="#">Back To Top</a> </span>

<!-- Removing this link back to Ramblingsoul.com will be violation of the Creative Commons Attribution 3.0 Unported License, under which this template is released for download -->
<a href="http://ramblingsoul.com" title="Download High Quality CSS Layouts">CSS Layout</a> by RamblingSoul.com
<!-- Copyright - Ramblingsoul.com -->

</div>
</div>
</form>
</body>
</html>