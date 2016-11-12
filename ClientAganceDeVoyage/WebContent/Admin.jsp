<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gestion Résérvation du vol et circuit en ligne</title>
<link href="themes/5/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/5/js-image-slider.js" type="text/javascript"></script>
    <link href="themes/1/generic.css" rel="stylesheet" type="text/css" />
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
<body>
<div id="wrap">
<div id="topbar">
  </div>
<div id="header">
<div id="sitename">
<h1 id="logo">RealOne</h1>
</div>
<div id="shoutout"><img src="images/joinnow_shoutout.jpg" alt="Join Now! It's Free" width="168" height="126" /></div>
<div id="useractions">
<div id="headings"align="right">    
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
        <li><a href='Authentification.jsp'>Deconnexion</a></li>
    </ul>
	
	</div>

<div class="clear">&nbsp;</div>
<div id="main">

<h1>Acceuil</h1>
<div id="moredetails">
  <div id="listing_details">
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="sliderFrame">
        <div id="ribbon"></div>
        <div id="slider">
            <a href="">
                <img src="img/image-slider-11.jpg" />
            </a>
            <img src="img/image-slider-22.jpg" />
            <img src="img/image-slider-33.jpg"  />
            <img src="img/image-slider-44.jpg"  />
            <img src="img/image-slider-55.jpg" />
            <img src="img/image-slider-11.jpg" />
            <img src="img/image-slider-22.jpg" />
            <img src="img/image-slider-33.jpg" />
        </div>
        <div id="htmlcaption" style="display: none;">
            <em>HTML</em> caption. Back to <a href="">GoVoyage</a>.
        </div>
                
        <!--thumbnails-->
        <div id="thumbs">
            <div class="thumb"><img src="img/thumb1.jpg" /></div>
            <div class="thumb"><img src="img/thumb2.jpg" /></div>
            <div class="thumb"><img src="img/thumb3.jpg" /></div>
            <div class="thumb"><img src="img/thumb4.jpg" /></div>
            <div class="thumb"><img src="img/thumb5.jpg" /></div>
            <div class="thumb"><img src="img/thumb1.jpg" /></div>
            <div class="thumb"><img src="img/thumb2.jpg" /></div>
            <div class="thumb"><img src="img/thumb3.jpg" /></div>
        </div>
    </div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

</div>
</body>
</html>