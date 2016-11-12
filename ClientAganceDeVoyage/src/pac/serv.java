package pac;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.Size;
import org.jacorb.notification.filter.etcl.StringValue;

import com.sun.mail.iap.Response;

/**
 * Servlet implementation class serv
 */
public class serv extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		if(request.getParameter("idModifVol")!=null){
		int id = Integer.parseInt(request.getParameter("idModifVol"));
		session.setAttribute("modifVol", id);
		response.sendRedirect("ModifierVol.jsp");
		}
		
		
		if(request.getParameter("idpa")!=null){
			int idP = Integer.parseInt(request.getParameter("idpa"));
			String buffer="<table border='1'><tr><td>Liste des Villes : </td></tr>";
			try{
				 	InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Ville> V= GV.listerVill(); 
					for(int i=0;i<V.size();i++){
						if(V.get(i).getP().getIdPays()==idP){
							buffer=buffer+"<tr><td>"+V.get(i).getNomVille()+"</td></tr>";
						}
					}                                                                                    
					buffer=buffer+"</table>";
					response.getWriter().println(buffer); 
					
			}catch(NamingException e){e.printStackTrace();}
		}
		if(request.getParameter("idpays")!=null){
			int idP = Integer.parseInt(request.getParameter("idpays"));
			String buffer="<table border='1'><tr><td>Liste des Villes : </td></tr>";
			try{
				 	InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Ville> V= GV.listerVill(); 
					for(int i=0;i<V.size();i++){
						if(V.get(i).getP().getIdPays()==idP){
							buffer=buffer+"<tr><td>"+V.get(i).getNomVille()+"</td><td><a href='#' OnClick='showVill("+V.get(i).getIdVille()+")'>Voir Aeroports</a></td></tr>";
						}
					}                                                                                    
					buffer=buffer+"</table>";
					response.getWriter().println(buffer); 
					
			}catch(NamingException e){e.printStackTrace();}
		}
		if(request.getParameter("idv")!=null){
		
		String buffer="<table border='1'><tr><td>Liste des Aéroports : </td></tr>";
		try{
			 InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				List<Aeroport> A= GV.listerA(); 
				int idV = Integer.parseInt(request.getParameter("idv"));
				for(int i=0;i<A.size();i++){
					if(A.get(i).getVille().getIdVille()==idV){
						buffer=buffer+"<tr><td>"+A.get(i).getNomA()+"</td></tr>";
					}
				}
				buffer=buffer+"</table>";
				response.getWriter().println(buffer); 
				
		}catch(NamingException e){e.printStackTrace();}
		}
		if(request.getParameter("idp")!=null){
			int idP = Integer.parseInt(request.getParameter("idp"));
			
			String buffer="<table border='1'><tr><td>Liste des Aéroports : </td></tr>";
			try{
				 InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Ville> V= GV.listerVill(); 
					for(int i=0;i<V.size();i++){
						if(V.get(i).getP().getIdPays()==idP){
							buffer=buffer+"<tr><td>"+V.get(i).getNomVille()+"</td></tr>";
						}
					}
					buffer=buffer+"</table>";
					response.getWriter().println(buffer); 
					
			}catch(NamingException e){e.printStackTrace();}
			}
		if(request.getParameter("idpp")!=null){
			int idP = Integer.parseInt(request.getParameter("idpp"));
			String buffer="Liste des villes :<select name='LV' ><option value='-1'>-------</option>";
			try{
				 	InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Ville> V= GV.listerVill(); 
					for(int i=0;i<V.size();i++){
						if(V.get(i).getP().getIdPays()== idP){
							buffer=buffer+"<option value='"+V.get(i).getIdVille()+"'>"+V.get(i).getNomVille()+"</option>";
						}
					}                                                                                    
					buffer=buffer+"</select>";
					response.getWriter().println(buffer); 
					
			}catch(NamingException e){e.printStackTrace();}

			}
		}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		/////////////////////AjouterVolGénérique//////////////////////////
		if(request.getParameter("idPays1")!=null){
			int id = Integer.parseInt(request.getParameter("idPays1"));
			String buffer="<select name='AD'><option value='-1'>--------</option>";
			try{
				 	InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Aeroport> A= GV.listerA(); 
					for(int i=0;i<A.size();i++){
						if(A.get(i).getVille().getP().getIdPays()== id){
							buffer=buffer+"<option value='"+A.get(i).getIdA()+"'>"+A.get(i).getNomA()+"</option>";
						}
					}                                                                                    
					buffer=buffer+"</select>";
					response.getWriter().println(buffer); 
			}catch(NamingException e){e.printStackTrace();}
		}
		if(request.getParameter("idPays2")!=null){
			int id = Integer.parseInt(request.getParameter("idPays2"));
			String buffer="<select name='AA'><option value='-1'>--------</option>";
			try{
				 	InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Aeroport> A= GV.listerA(); 
					for(int i=0;i<A.size();i++){
						if(A.get(i).getVille().getP().getIdPays()== id){
							buffer=buffer+"<option value='"+A.get(i).getIdA()+"'>"+A.get(i).getNomA()+"</option>";
						}
					}                                                                                    
					buffer=buffer+"</select>";
					response.getWriter().println(buffer); 
			}catch(NamingException e){e.printStackTrace();}
		}
		
		if(request.getParameter("ajoutervol")!=null){
				String escale="";
				int idCA = Integer.parseInt(request.getParameter("CA"));
				int idAD = Integer.parseInt(request.getParameter("AD"));
				int idAA = Integer.parseInt(request.getParameter("AA"));
				String jr = request.getParameter("jour");
				String hd = request.getParameter("heured");
				String ha = request.getParameter("heurea");
				String prix = request.getParameter("prix");
				if(request.getParameter("escale").equalsIgnoreCase("oui")){
					escale = "oui";
				}
				else{
					escale = "non";
				}
				int nbrPlace = Integer.parseInt(request.getParameter("nbrPlace"));
				try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");		
				
				CompagnieAérienne CA = GV.findCA(idCA);
				Aeroport AD = GV.findA(idAD);
				Aeroport AA = GV.findA(idAA);
				VolGenerique Vol = new VolGenerique(jr,hd,ha,prix,escale,nbrPlace,CA,AD,AA);
				GV.ajouterVol(Vol);
				}catch(NamingException e){e.printStackTrace();}
		
				
				if(request.getParameter("escale").equals("oui"))
				{
					int nbrEscale = Integer.parseInt(request.getParameter("nbrescale"));
					session.setAttribute("nbrEscale", nbrEscale);
					response.sendRedirect("AjouterEscales.jsp");
				}
				else
				{
					response.sendRedirect("popupOuvrirResrv.jsp");
				}
		}
		/////////////////////AjouterEscalePourUnVolGénérique//////////////////////////
		if(request.getParameter("idPays")!=null){
			int id = Integer.parseInt(request.getParameter("idPays"));
			String buffer="<select name='Aescale'><option value='-1'>--------</option>";
			try{
				 	InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Aeroport> A= GV.listerA(); 
					for(int i=0;i<A.size();i++){
						if(A.get(i).getVille().getP().getIdPays()== id){
							buffer=buffer+"<option value='"+A.get(i).getIdA()+"'>"+A.get(i).getNomA()+"</option>";
						}
					}                                                                                    
					buffer=buffer+"</select>";
					response.getWriter().println(buffer); 
			}catch(NamingException e){e.printStackTrace();}
		}
		if(request.getParameter("AjoutEscale")!=null){
				try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				List<VolGenerique> volgs = GV.listerVolG();
				int id = volgs.get(volgs.size()-1).getVolG();
				VolGenerique volg = GV.findVolg(id);
				int nbrEscale = (Integer)session.getAttribute("nbrEscale"); nbrEscale--; session.setAttribute("nbrEscale", nbrEscale);
				int  idAescale = Integer.parseInt(request.getParameter("Aescale"));
				String hD = request.getParameter("hd");
				String hF = request.getParameter("hf");
				String duree = request.getParameter("d");
				Aeroport A = GV.findA(idAescale);
				InfoEscale Escale = new InfoEscale(A,volg,hD,hF,duree);
				GV.ajouterEscale(Escale);
				if(nbrEscale==0){
					response.sendRedirect("popupOuvrirResrv.jsp");
				}
				else
				{
					response.sendRedirect("AjouterEscales.jsp");
				}
				}catch(NamingException e){e.printStackTrace();}
				
		}
		/////////////////////AjouterVille//////////////////////////
		if(request.getParameter("AddVille")!=null){
				String nomV=request.getParameter("nomVille");
				int idp = Integer.parseInt(request.getParameter("LP"));
				try{
					InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					Ville v = new Ville();
					v.setNomVille(nomV);
					GV.ajouterVille(v, idp);
				}catch(NamingException e){e.printStackTrace();}
				response.sendRedirect("popupAjouterVill.jsp");
		}
		/////////////////////AjouterAéroport//////////////////////////
		if(request.getParameter("AddA")!=null){
				String nomA=request.getParameter("nomAeroport");
				int idV = Integer.parseInt(request.getParameter("LV"));
				try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				Aeroport a = new Aeroport();
				a.setNomA(nomA);
				GV.ajouterA(a, idV);
				}catch(NamingException e){e.printStackTrace();}
				response.sendRedirect("popupAjouterAeroport.jsp");
		}
		/////////////////////AjouterCompagnieAérienne//////////////////////////
		if(request.getParameter("AddC")!=null){
				String nomC=request.getParameter("nomC");
				try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				CompagnieAérienne c = new CompagnieAérienne();
				c.setNomA(nomC);
				GV.ajouterC(c);
				}catch(NamingException e){e.printStackTrace();}
				response.sendRedirect("popupAjouterCompagnie.jsp");
		}
		/////////////////////////////////////////////////////////////////////////
		if(request.getParameter("count")!=null){
			String country = request.getParameter("count");
			if(country.equals("tous")){
				String buffer="<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table cellspacing='0' cellpadding='0'border='1'><tr><td><h3>Compagnie</h3></td><td><h3>Jour</h3></td><td><h3>Heure Depart</h3></td><td><h3>Heure Arrivee</h3></td><td><h3>Aeroport Depart</h3></td><td><h3>Aeroport Arrivee</h3></td><td><h3>Prix</h3></td></tr>";
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
						if(bln==1){																																																							
							buffer=buffer+"<tr><td>"+vols.get(i).getCA().getNomA()+"</td><td>"+vols.get(i).getJour()+"</td><td>"+vols.get(i).getHeureD()+"</td><td>"+vols.get(i).getHeureA()+"</td><td>"+vols.get(i).getAeroportD().getNomA()+"</td><td>"+vols.get(i).getAeroportA().getNomA()+"</td><td>"+vols.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+vols.get(i).getVolG()+">Modifier Vol</a></td><td><a href='#'OnClick='popupInfoEscale("+vols.get(i).getVolG()+")'>InfoEscale</a></td></tr>";
						}
						if(bln==0){
							buffer=buffer+"<tr><td>"+vols.get(i).getCA().getNomA()+"</td><td>"+vols.get(i).getJour()+"</td><td>"+vols.get(i).getHeureD()+"</td><td>"+vols.get(i).getHeureA()+"</td><td>"+vols.get(i).getAeroportD().getNomA()+"</td><td>"+vols.get(i).getAeroportA().getNomA()+"</td><td>"+vols.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+vols.get(i).getVolG()+">Modifier Vol</a></td></tr>";				
						}
					}
				buffer=buffer+"</table>";
				response.getWriter().println(buffer); 
			}catch(NamingException e){e.printStackTrace();}
			}
				
			if(country.equals("compagnie")){ 
						String buffer="Compagnie Aerienne : <select name='state' onchange='showDropDownlist2(this.value)'><option value='-1'>compagnie</option>";
						String C="C";
						try{
						InitialContext ctxt = new InitialContext();
						GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
						List<CompagnieAérienne> ca= GV.listerCA(); 
						for(int i=0;i<ca.size();i++){
							buffer=buffer+"<option value='"+C+ca.get(i).getIdCompA()+"'>"+ca.get(i).getNomA()+"</option>";
							
						}
						buffer=buffer+"</select>";
						response.getWriter().println(buffer); 
						}catch(NamingException e){e.printStackTrace();}
				}
				if(country.equals("jour")){
						String buffer="Jour : <select name='state' onchange='showDropDownlist2(this.value)'><option value='-1'>Jour</option>";
						String lundi="lundi";
						String mardi="mardi";
						String mercredi="mercredi";
						String jeudi ="jeudi";
						String vendredi="vendredi";
						String samedi="samedi";
						String dimanche="dimanche";
						String j="j";
						buffer=buffer+"<option value='"+j+lundi+"'>"+lundi+"</option>";
						buffer=buffer+"<option value='"+j+mardi+"'>"+mardi+"</option>";
						buffer=buffer+"<option value='"+j+mercredi+"'>"+mercredi+"</option>";
						buffer=buffer+"<option value='"+j+jeudi+"'>"+jeudi+"</option>";
						buffer=buffer+"<option value='"+j+vendredi+"'>"+vendredi+"</option>";
						buffer=buffer+"<option value='"+j+samedi+"'>"+samedi+"</option>";
						buffer=buffer+"<option value='"+j+dimanche+"'>"+dimanche+"</option>";
						buffer=buffer+"</select>";
						response.getWriter().println(buffer); 
				}
				if(country.equals("aeroport")){
						String buffer="pays Depart : <select name='state' onchange='showDropDownlist2(this.value)'><option value='-1'>Pays</option>";
						String P="P";
						try{
						InitialContext ctxt = new InitialContext();
						GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
						List<Pays> p= GV.listerP(); 
						for(int i=0;i<p.size();i++){
							String idp = String.valueOf(p.get(i).getIdPays());
							buffer=buffer+"<option value='"+P+idp+"'>"+p.get(i).getNomPays()+"</option>";
						}
						buffer=buffer+"</select>";
						response.getWriter().println(buffer); 
						}catch(NamingException e){e.printStackTrace();}
				}
		}	
/////////////////////////////////////////////////////////////////////////////////
if(request.getParameter("count1")!=null){
				String country=request.getParameter("count1");
				if(String.valueOf(country.charAt(0)).equals("C")){
					String idCA="";
					for(int j=1;j<country.length();j++){idCA=idCA+country.charAt(j);}
					String buffer="<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table cellspacing='0' cellpadding='0'border='1'><tr><td><h3>Compagnie</h3></td><td><h3>Jour</h3></td><td><h3>Heure Depart</h3></td><td><h3>Heure Arrivee</h3></td><td><h3>Aeroport Depart</h3></td><td><h3>Aeroport Arrivee</h3></td><td><h3>Prix</h3></td></tr>";	
					int bln=0;
					try{
					InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<VolGenerique> volg= GV.listerVolG(); 
					List<InfoEscale> escales = GV.listerEscal();
					for(int i=0;i<volg.size();i++){
						if(String.valueOf(volg.get(i).getCA().getIdCompA()).equals(idCA)){	
							for(int j=0;j<escales.size();j++){
								if(escales.get(j).getVolG().getVolG()==volg.get(i).getVolG()){
									bln=1;
									break;
								}
							}
							if(bln==1)
								buffer=buffer+"<tr><td>"+volg.get(i).getCA().getNomA()+"</td><td>"+volg.get(i).getJour()+"</td><td>"+volg.get(i).getHeureD()+"</td><td>"+volg.get(i).getHeureA()+"<td>"+volg.get(i).getAeroportD().getNomA()+"</td><td>"+volg.get(i).getAeroportA().getNomA()+"</td><td>"+volg.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+volg.get(i).getVolG()+">Modifier</a></td><td><a href='#'OnClick='popupInfoEscale("+volg.get(i).getVolG()+")'>InfoEscale</a></td></tr>";
							if(bln==0)
								buffer=buffer+"<tr><td>"+volg.get(i).getCA().getNomA()+"</td><td>"+volg.get(i).getJour()+"</td><td>"+volg.get(i).getHeureD()+"</td><td>"+volg.get(i).getHeureA()+"<td>"+volg.get(i).getAeroportD().getNomA()+"</td><td>"+volg.get(i).getAeroportA().getNomA()+"</td><td>"+volg.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+volg.get(i).getVolG()+">Modifier</a></tr>";
						}
					}
					buffer=buffer+"</table>";
					response.getWriter().println(buffer); 
					}catch(NamingException e){e.printStackTrace();}
				}
				if(String.valueOf(country.charAt(0)).equals("j")){
					String jour="";
					for(int j=1;j<country.length();j++){jour=jour+country.charAt(j);}
					String buffer="<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table cellspacing='0' cellpadding='0'border='1'><tr><td><h3>Compagnie</h3></td><td><h3>Jour</h3></td><td><h3>Heure Depart</h3></td><td><h3>Heure Arrivee</h3></td><td><h3>Aeroport Depart</h3></td><td><h3>Aeroport Arrivee</h3></td><td><h3>Prix</h3></td></tr>";
					int bln=0;
					try{
					InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<InfoEscale> escales = GV.listerEscal();
					List<VolGenerique> volg= GV.listerVolG(); 
					for(int i=0;i<volg.size();i++){
						if(String.valueOf(volg.get(i).getJour()).equals(jour)){
							for(int j=0;j<escales.size();j++){
								if(escales.get(j).getVolG().getVolG()==volg.get(i).getVolG()){
									bln=1;
									break;
								}
							}
							if(bln==1)
								buffer=buffer+"<tr><td>"+volg.get(i).getCA().getNomA()+"</td><td>"+volg.get(i).getJour()+"</td><td>"+volg.get(i).getHeureD()+"</td><td>"+volg.get(i).getHeureA()+"</td><td>"+volg.get(i).getAeroportD().getNomA()+"</td><td>"+volg.get(i).getAeroportA().getNomA()+"</td><td>"+volg.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+volg.get(i).getVolG()+">Modifier</a></td><td><a href='#'OnClick='popupInfoEscale("+volg.get(i).getVolG()+")'>InfoEscale</a></td></tr>";
							if(bln==0)	
								buffer=buffer+"<tr><td>"+volg.get(i).getCA().getNomA()+"</td><td>"+volg.get(i).getJour()+"</td><td>"+volg.get(i).getHeureD()+"</td><td>"+volg.get(i).getHeureA()+"</td><td>"+volg.get(i).getAeroportD().getNomA()+"</td><td>"+volg.get(i).getAeroportA().getNomA()+"</td><td>"+volg.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+volg.get(i).getVolG()+">Modifier</a></td></tr>";
						}
					}
					buffer=buffer+"</table>";
					response.getWriter().println(buffer); 			
					}catch(NamingException e){e.printStackTrace();}
				}
				
				if(String.valueOf(country.charAt(0)).equals("P")){
					String P="";
					for(int j=1;j<country.length();j++){P=P+country.charAt(j);}int id=Integer.parseInt(P);
					String buffer="<form><p>&nbsp;</p><p>&nbsp;</p><table  border='0'><tr><td><h3>Aeroport depart : </h3><select name='AD'><option value='-1'>aeroport Depart</option>";
					try{
				 	InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<Aeroport> a= GV.listerA(); 
					for(int i=0;i<a.size();i++){
						if(a.get(i).getVille().getP().getIdPays()==id){
							buffer=buffer+"<option value='"+a.get(i).getIdA()+"'>"+a.get(i).getNomA()+"</option>";
						}
					}
					buffer=buffer+"</select></td>";
					
					buffer=buffer+"<td><h3>Aeroport Arrivee : </h3><select name='AA' ><option value='-1'>aeroport Arrivee</option>";
					for(int i=0;i<a.size();i++){
						//if(a.get(i).getVille().getP().getIdPays()==id){
							buffer=buffer+"<option value='"+a.get(i).getIdA()+"'>"+a.get(i).getNomA()+"</option>";
						//}
					}
					buffer=buffer+"</select></td><td><input type='button' name='searchVolgParA' OnClick='aaaa(this.form)' value='search'></td></tr></table></form>";
					response.getWriter().println(buffer); 
					}catch(NamingException e){e.printStackTrace();}
				}

}
		/////////////////////////////////////////////////

if(request.getParameter("modifVol")!=null){
	String ca = request.getParameter("c");
	String jr = request.getParameter("jr");
	String hd = request.getParameter("hd");
	String ha = request.getParameter("ha");
	String ad = request.getParameter("ad");
	String aa = request.getParameter("aa");
	String pr = request.getParameter("pr");
	int id = (Integer)session.getAttribute("modifVol");
	try{
	 	InitialContext ctxt = new InitialContext();
		GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
		GV.ModifierVolg(id,ca,jr,hd,ha,ad,aa,pr);
	}catch(NamingException e){e.printStackTrace();}
	response.sendRedirect("ListerVolG.jsp");
}
if(request.getParameter("Retour")!=null){
	response.sendRedirect("ListerVolG.jsp");
}
//////////////////////////////////////////////////////////////////
if(request.getParameter("val1")!=null)
{

int idAD = Integer.parseInt(request.getParameter("val1"));	
int idAA = Integer.parseInt(request.getParameter("val2"));

String buffer="<p>&nbsp;</p><p>&nbsp;</p><table border='1'><tr><td><h3>Compagnie</h3></td><td><h3>Jour</h3></td><td><h3>Heure Depart</h3></td><td><h3>Heure Arrivee</h3></td><td><h3>Aeroport Depart</h3></td><td><h3>Aeroport Arrivee</h3></td><td><h3>Prix</h3></td></tr>";
try{
 	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<InfoEscale> escales = GV.listerEscal();
	List<VolGenerique> volg= GV.listerVolG(); 
	for(int i=0;i<volg.size();i++){
		int bln=0;
		if((volg.get(i).getAeroportD().getIdA()==idAD)&&(volg.get(i).getAeroportA().getIdA()==idAA)){
			for(int j=0;j<escales.size();j++){
				if(escales.get(j).getVolG().getVolG()==volg.get(i).getVolG()){
					bln=1;
					break;
				}
			}	
			if(bln==1)																																																							
			buffer=buffer+"<tr><td>"+volg.get(i).getCA().getNomA()+"</td><td>"+volg.get(i).getJour()+"</td><td>"+volg.get(i).getHeureD()+"</td><td>"+volg.get(i).getHeureA()+"<td>"+volg.get(i).getAeroportD().getNomA()+"</td><td>"+volg.get(i).getAeroportA().getNomA()+"</td><td>"+volg.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+volg.get(i).getVolG()+">Modifier Vol</a></td><td><a href='#'OnClick='popupInfoEscale("+volg.get(i).getVolG()+")'>InfoEscale</a></td></tr>";
			if(bln==0)	
			buffer=buffer+"<tr><td>"+volg.get(i).getCA().getNomA()+"</td><td>"+volg.get(i).getJour()+"</td><td>"+volg.get(i).getHeureD()+"</td><td>"+volg.get(i).getHeureA()+"<td>"+volg.get(i).getAeroportD().getNomA()+"</td><td>"+volg.get(i).getAeroportA().getNomA()+"</td><td>"+volg.get(i).getPrix()+"</td><td><a href=serv?idModifVol="+volg.get(i).getVolG()+">Modifier Vol</a></td></tr>";				
			
		}
	}
	buffer=buffer+"</table>";
	response.getWriter().println(buffer); 
	
}catch(NamingException e){e.printStackTrace();}

}
////////////////////////
if(request.getParameter("ca")!=null)
{
String buffer="<table border='1'>";
int idCA = Integer.parseInt(request.getParameter("ca"));
String jour= request.getParameter("jr");
int idAD = Integer.parseInt(request.getParameter("ad"));
int idAA = Integer.parseInt(request.getParameter("aa"));
try{
 	InitialContext ctxt = new InitialContext();
	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
	List<VolGenerique> Volg = GV.listerVolG();
	buffer=buffer+"<h3>Liste Vol Generique:</h3>";
	buffer=buffer+"<table border='1'><tr><td><h5>Numero Vol</h5></td><td><h5>Jour</h5></td><td><h5>Aeroport depart</h5></td><td><h5>Aeroport arrivee</h5></td><td><h5>Heure depart</h5></td><td><h5>Heure arrivee</h5></td><td><h5>Ouvrir reservation</h5></td></tr>";
	for(int i=0;i<Volg.size();i++){
		if((Volg.get(i).getJour().equalsIgnoreCase(jour))&&(Volg.get(i).getCA().getIdCompA()== idCA)&&(Volg.get(i).getAeroportD().getIdA()==idAD)&&(Volg.get(i).getAeroportA().getIdA()==idAA)){
			buffer=buffer+"<tr><td>"+Volg.get(i).getVolG()+"</td><td>"+Volg.get(i).getJour()+"</td><td>"+Volg.get(i).getAeroportD().getNomA()+"</td><td>"+Volg.get(i).getAeroportA().getNomA()+"<td>"+Volg.get(i).getHeureD()+"</td><td>"+Volg.get(i).getHeureA()+"</td><td><a href='#'OnClick='popupOuvrirResrv("+Volg.get(i).getVolG()+")'>Ouvrir Reservation</a></td></tr>";
			
		}
	}
	buffer=buffer+"</table>";
	response.getWriter().println(buffer); 
}catch(NamingException e){e.printStackTrace();}

}
////////////////////////////////	
if(request.getParameter("validerOuvrirReserv")!=null)
{	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	int idVolg=(Integer)session.getAttribute("idVolg");
	int periode = Integer.parseInt(request.getParameter("p"));
	String dateD = request.getParameter("dateD");
	Calendar date = Calendar.getInstance();
    date.clear();
	Date dte = new Date(dateD); 
	/*try{
		dte = sdf.parse(dateD);
	}catch (Exception e){}
    */
    /*System.out.println(dte.getYear()); 
    System.out.println(dte.getDay()); 
    System.out.println(dte.getMonth()); //System.out.println(dte.getDate());
	date.set(Calendar.YEAR, dte.getYear());
    date.set(Calendar.MONTH, dte.getMonth());
    date.set(Calendar.DATE, dte.getDate());
    */
    date.setTime(dte);
    String Nomj="";
    int n=0;
    //System.out.println(date.get(Calendar.DAY_OF_WEEK));
    //System.out.println(sdf.format(date.getTime()));
    try{
     	InitialContext ctxt = new InitialContext();
    	GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
    	List<VolGenerique> Volg = GV.listerVolG();
    	for(int i=0;i<Volg.size();i++){
    		if(Volg.get(i).getVolG()==idVolg){
    			Nomj = Volg.get(i).getJour();
    		}
    	}

    	if(Nomj.equalsIgnoreCase("lundi")){n=2;}
    	if(Nomj.equalsIgnoreCase("mardi")){n=3;}
    	if(Nomj.equalsIgnoreCase("mercredi")){n=4;}
    	if(Nomj.equalsIgnoreCase("jeudi")){n=5;}
    	if(Nomj.equalsIgnoreCase("vendredi")){n=6;}
    	if(Nomj.equalsIgnoreCase("samedi")){n=7;}
    	if(Nomj.equalsIgnoreCase("dimanche")){n=1;}
    	//System.out.println(date.get(Calendar.DAY_OF_WEEK));
    	for(int i=1;i<8;i++){
    		if(date.get(Calendar.DAY_OF_WEEK)==n){break;}
    		else { 
    			date.add(Calendar.DATE, 1); 
    		}
    	}
    	Calendar calendarf=Calendar.getInstance();
    	calendarf.clear();
    	calendarf.setTime(date.getTime());
    	calendarf.add(Calendar.MONTH, periode);
    	while(date.before(calendarf)){
    		Vol v = new Vol(); v.setBln("ouvrir"); v.setDateDepart(sdf.format(date.getTime()));v.setDateArrivee(sdf.format(date.getTime()));
        	v.setVolG(GV.findVolg(idVolg));
        	v.setNbrPlace(String.valueOf(GV.findVolg(idVolg).getNbrPlace()));
        	GV.ajouterV(v);
        	date.add(Calendar.DATE, 7);
    	}
    	
    }catch(NamingException e){e.printStackTrace();}
response.sendRedirect("AjouterVol.jsp");
}
	
	
}}