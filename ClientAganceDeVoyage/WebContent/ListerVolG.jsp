<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="javax.naming.InitialContext"%>
<%@page import="pac.GestionVol"%>
<%@page import="java.util.List"%>
<%@page import="pac.*"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="pac.VolGenerique"%>
<%@page import="pac.InfoEscale"%><html>
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
      var xmlHttp;  
      var xmlHttp;
      function showState(str){
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
      var url="serv";
      url +="?count=" +str;
      if(str=="tous")
    	  xmlHttp.onreadystatechange = stateChangee; 
          
      else
    	  xmlHttp.onreadystatechange = stateChange;
      	  	
      xmlHttp.open("POST", url, true);
      xmlHttp.send(null);
      
      }
		
      function stateChange(){   
      	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
    	  document.getElementById("state").innerHTML=xmlHttp.responseText
          //document.getElementById("div").innerHTML=defaultStatus    
          document.getElementById("div1").innerHTML=defaultStatus
      	}
      } 
      function stateChangee(){   
        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("div").innerHTML=xmlHttp.responseText
          document.getElementById("state").innerHTML=defaultStatus    
          document.getElementById("div1").innerHTML=defaultStatus
        }   
      }

    function showDropDownlist2(str){
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
          var url="serv";
          url +="?count1=" +str;
       // On dï¿½finit ce qu'on va faire quand on aura la rï¿½ponse
          xmlHttp.onreadystatechange = stateChangeA;
          xmlHttp.open("POST", url, true);
          xmlHttp.send(null);
      }
      function stateChangeA(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("div").innerHTML=xmlHttp.responseText
          //document.getElementById("div1").innerHTML=defaultStatus       
          }   
      }
      
      function aaaa(f){
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
          var c = f.AD.value;
          var cc = f.AA.value;	      	
          var url="serv";
      
          url +="?val1=" +c ;
          xmlHttp.onreadystatechange = stateChangeaaaa;
          xmlHttp.open("POST", "serv?val1="+c+"&val2="+cc, true);
          xmlHttp.send(null);
          
          }
    		
          function stateChangeaaaa(){   
          	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        	  document.getElementById("div1").innerHTML=xmlHttp.responseText
           	}   
          }

          function popupInfoEscale(idVolg) {
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
        		//var url="popupInfoEscale.jsp";
        		//url +="?idVolg=" +idVolg ;
                window.open('popupInfoEscale.jsp?idVolg='+idVolg,'myPopup','menubar=no, scrollbars=yes, top='+top+', left='+left+', location=yes ,width='+width+', height='+height+'');	
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

<div id="content">

<div class="clear">&nbsp;</div>

<div id="main">
<h1>Liste des Vols</h1>
<div id="moredetails">
  <div id="listing_details">
  <table cellspacing="0" cellpadding="0"> 

<tr><td>
<strong>Lister Par : </strong><select name='country'  onchange="showState(this.value)">  
       <option value="tous">tous les vols</option>  
       <option value="jour">Jour</option>
       <option value="compagnie">Compagnie Aérienne</option>
       <option value="aeroport">Aéroport</option>
</select></td>
      
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <td id='state'></td>
      </tr>	
</table>

<div id="div">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0" border="1">
<tr>
<td><h3>Compagnie</h3></td>
<td><h3>Jour</h3></td>
<td><h3>Heure Depart</h3></td>
<td><h3>Heure Arrivee</h3></td>
<td><h3>Aeroport Depart</h3></td>
<td><h3>Aeroport Arrivee</h3></td>
<td><h3>Prix</h3></td>
</tr>

<%
try{
	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<VolGenerique> vols= GV.listerVolG();
	List<InfoEscale> escales = GV.listerEscal();
	for(int i=0;i<vols.size();i++){
		int bln=0;
		for(int j=0;j<escales.size();j++){
				if(escales.get(j).getVolG().getVolG()==vols.get(i).getVolG()){
					bln=1;
					break;
				}
		}
		if(bln==1){%>																																																							
			<tr><td><%=vols.get(i).getCA().getNomA()%></td><td><%=vols.get(i).getJour()%></td><td><%=vols.get(i).getHeureD()%></td><td><%=vols.get(i).getHeureA()%></td><td><%=vols.get(i).getAeroportD().getNomA()%></td><td><%=vols.get(i).getAeroportA().getNomA()%></td><td><%=vols.get(i).getPrix()%></td><td><a href="serv?idModifVol=<%=vols.get(i).getVolG()%>">Modifier Vol</a></td><td><a href='#'OnClick='popupInfoEscale(<%=vols.get(i).getVolG()%>)'>InfoEscale</a></td></tr>
		<%}
		if(bln==0){%>
			<tr><td><%=vols.get(i).getCA().getNomA()%></td><td><%=vols.get(i).getJour()%></td><td><%=vols.get(i).getHeureD()%></td><td><%=vols.get(i).getHeureA()%></td><td><%=vols.get(i).getAeroportD().getNomA()%></td><td><%=vols.get(i).getAeroportA().getNomA()%></td><td><%=vols.get(i).getPrix()%></td><td><a href="serv?idModifVol=<%=vols.get(i).getVolG()%>">Modifier Vol</a></td></tr>				
		<%}
	}
	}catch(NamingException e){e.printStackTrace();}%>
      
</table></div>

<div id="div1"></div>
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
</html>