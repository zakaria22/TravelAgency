package pac;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.jms.Session;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class servCircuit
 */
public class servCircuit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servCircuit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		if(request.getParameter("idPays")!=null){
			String idP = request.getParameter("idPays");
			String buffer="<table cellspacing='0' border='1'><tr><td><h3>Nom du Circuit</h3></td><td><h3>Description</h3></td><td><h3>Duree du Circuit</h3></td><td><h3>Ouvrir reservation</h3></td><td><h3>Modifier les informations du Circuit</h3></td><td><h3>Modifier le plan du Circuit</h3></td></tr>";
			if(idP.equalsIgnoreCase("destination")){
				
				try{
					InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<CircuitGn> c = GV.listerCircuit();
					for(int i=0;i<c.size();i++){	
						buffer=buffer+"<tr><td>"+c.get(i).getNom()+"</td><td>"+c.get(i).getDescription()+"</td><td>"+c.get(i).getDuree()+"</td><td><a href='servCircuit?id="+c.get(i).getId()+"'>Ouvrir Reservation</a></td><td><a href='servCircuit?idModifC="+c.get(i).getId()+"'>Modifier Circuit</a></td><td><a href='servCircuit?idModifP="+c.get(i).getId()+"'>Modifier Planing du Circuit</a></td></tr>";
					}
					buffer=buffer+"</table>";
					response.getWriter().println(buffer); 
				}catch(NamingException e){e.printStackTrace();}
			}
			else{
				int id = Integer.parseInt(request.getParameter("idPays"));
				try{
					InitialContext ctxt = new InitialContext();
					GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
					List<CircuitGn> c = GV.listerCircuit();
					for(int i=0;i<c.size();i++){
						if(c.get(i).getDestination().getIdPays()==id){
							buffer=buffer+"<tr><td>"+c.get(i).getNom()+"</td><td>"+c.get(i).getDescription()+"</td><td>"+c.get(i).getDuree()+"</td><td><a href='servCircuit?id="+c.get(i).getId()+"'>Ouvrir Reservation</a></td><td><a href='servCircuit?idModifC="+c.get(i).getId()+"'>Modifier Circuit</a></td><td><a href='servCircuit?idModifP="+c.get(i).getId()+"'>Modifier Planing du Circuit</a></td></tr>";
						}
					}
					buffer=buffer+"</table>";
					response.getWriter().println(buffer); 
				}catch(NamingException e){e.printStackTrace();}
			}
		}
		if(request.getParameter("id")!=null){
			session.setAttribute("id", Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("OuvrirReservationsC.jsp");
		}
		if(request.getParameter("idModifC")!=null){
			session.setAttribute("idModifC", Integer.parseInt(request.getParameter("idModifC")));
			response.sendRedirect("ModifierCircuit.jsp");
		}
		if(request.getParameter("idModifP")!=null){
			session.setAttribute("idModifP", Integer.parseInt(request.getParameter("idModifP")));
			response.sendRedirect("ModifierPlaningC.jsp");
		}
		if(request.getParameter("idReservC")!=null){
			int idRc = Integer.parseInt(request.getParameter("idReservC"));
			int nbrPassagers = Integer.parseInt(request.getParameter("cpt"));
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				GV.removeReservC(idRc,nbrPassagers);
			}catch(NamingException e){e.printStackTrace();}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
/////////////////////////////////CIRCUIT.//////////////////////
		HttpSession session = request.getSession(true);
		
		if(request.getParameter("AddCircuit")!=null){
			int idP = Integer.parseInt(request.getParameter("dest"));
			String nomC = request.getParameter("nomC");
			String desC = request.getParameter("desC");
			String perC = request.getParameter("perC");
			try{
			 	InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				CircuitGn C = new CircuitGn();
				C.setDescription(desC);
				C.setDuree(perC);
				C.setNom(nomC);
				C.setDestination(GV.findPays(idP));
				GV.ajouterCircuitGn(C);
			}catch(NamingException e){e.printStackTrace();}
			session.setAttribute("DureeC", Integer.parseInt(perC));
			response.sendRedirect("PlaningCircuitGn.jsp");
		}

		if(request.getParameter("ValPlaning")!=null){
			int dureeC = (Integer)session.getAttribute("DureeC");
			try{
			InitialContext ctxt = new InitialContext();
			GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
			List<CircuitGn> C = GV.listerCircuit();
			int idC = C.get(C.size()-1).getId();
			for(int i=1;i<=dureeC;i++){
			String desJour = request.getParameter(String.valueOf(i));
			PlaningCiruitGn P = new PlaningCiruitGn();
			P.setDescription(desJour);
			P.setC(GV.findCircuit(idC));
			GV.ajouterPlaningC(P);
			}
			}catch(NamingException e){e.printStackTrace();}
			response.sendRedirect("AjouterCircuit.jsp");
		}	
		if(request.getParameter("AddRD")!=null){
			try{
			InitialContext ctxt = new InitialContext();
			GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
			int idC = (Integer)session.getAttribute("id");
			String nomV = request.getParameter("vill");
			String dateD = request.getParameter("dateD");
			String prix = request.getParameter("prix");
			String nbrP = request.getParameter("nbrP");
			CircuitDateR C = new CircuitDateR();
			C.setNomVill(nomV);
			C.setDateD(dateD);
			C.setPrix(prix);
			C.setNbrPlace(nbrP);
			C.setCircuit(GV.findCircuit(idC));
			C.setBln("ouvert");
			GV.ajouterDateCircuit(C);
			}catch(NamingException e){e.printStackTrace();}
			response.sendRedirect("OuvrirReservationsC.jsp");
		}
		if(request.getParameter("modifierC")!=null){
		try{
			InitialContext ctxt = new InitialContext();
			GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
			String nomC = request.getParameter("nomC");
			String description = request.getParameter("desC");
			String duree = request.getParameter("dureeC");
			int idC = (Integer)session.getAttribute("idModifC");
			GV.ModifierrCircuit(idC, nomC, description, duree);
		}catch(NamingException e){e.printStackTrace();}
		response.sendRedirect("ListerCircuit.jsp");
			
		}
		
		if(request.getParameter("modifierP")!=null){
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				int idC = (Integer)session.getAttribute("idModifP");
				int nbrJr = (Integer)session.getAttribute("j");
				Collection<PlaningCiruitGn> planing = new ArrayList<PlaningCiruitGn>();
				//CircuitGn C = GV.findCircuit(idC);
				for(int i=1;i<=nbrJr;i++){
					PlaningCiruitGn p = new PlaningCiruitGn();
					p.setDescription(request.getParameter(String.valueOf(i)));
					planing.add(p);
				}
				GV.ModifierPlaning(idC,planing);
			}catch(NamingException e){e.printStackTrace();}
			response.sendRedirect("ListerCircuit.jsp");
				
			}
		if(request.getParameter("confirmerC")!=null){
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				int idClt = (Integer)session.getAttribute("idClt");
				List<Passager> P = (List<Passager>)session.getAttribute("passagers");
				int idDateR = (Integer)session.getAttribute("idDateR");
				CircuitDateR dateRc = GV.findReservationC(idDateR);
				
				Reservation Ra = new Reservation();
				Ra.setClt(GV.findClt(idClt));
				Ra.setDateReserv(String.valueOf(new Date()));
				Ra.setTypeReserv("circuit");
				Ra.setCircuitDateR(dateRc);
				Ra.setVol(null);
				//Ra.setPassagers(P);
				for(int i=0;i<P.size();i++){
					P.get(i).setReservationsConcern(Ra);
				}
				Ra.setPassagers(P);
				GV.ajouterReservationC(Ra,idDateR,P.size());
			}catch(NamingException e){e.printStackTrace();}
		
	}

	}
}
