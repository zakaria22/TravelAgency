package pac;

import java.io.IOException;
import java.util.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 * Servlet implementation class servClt
 */
public class servClt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servClt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		if(request.getParameter("val")!=null){
			int idVol = Integer.parseInt(request.getParameter("val"));
			Vol v = new Vol();
			//Vector<Vol> Vect = new Vector<Vol>();	
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				List<Vol> vols = GV.listerVolO();
				for(int i=0;i<vols.size();i++){
					if(vols.get(i).getIdVol()==idVol){
						v.setDateDepart(vols.get(i).getDateDepart());
						v.setDateArrivee(vols.get(i).getDateArrivee());
						v.setVolG(vols.get(i).getVolG());
						v.setIdVol(idVol);
						break;
					}
				}
				session.setAttribute("Vol", v);
			}catch(NamingException e){e.printStackTrace();}
			response.sendRedirect("reserverVol.jsp");
		}
		if(request.getParameter("val1")!=null){
			int idVol = Integer.parseInt(request.getParameter("val1"));
			String[] list =(String[])request.getParameterValues("Vectt");
			String s = list[0];
			Vol v = new Vol();
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				List<Vol> vols = GV.listerVolO();
				for(int i=0;i<vols.size();i++){
					if(vols.get(i).getIdVol()==idVol){
						v.setDateDepart(vols.get(i).getDateDepart());
						v.setDateArrivee(vols.get(i).getDateArrivee());
						v.setVolG(vols.get(i).getVolG());
						v.setIdVol(idVol);
						break;
					}
				}
				session.setAttribute("Vol", v);
				session.setAttribute("idVolR",s);
			}catch(NamingException e){e.printStackTrace();}
			response.sendRedirect("reserverVol.jsp");
		 }
		if(request.getParameter("idReserv")!=null){
			int idRe = Integer.parseInt(request.getParameter("idReserv"));
			int nbrPassagers = Integer.parseInt(request.getParameter("cpt"));
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				GV.removeReserv(idRe,nbrPassagers);
			}catch(NamingException e){e.printStackTrace();}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		if(request.getParameter("confirmer")!=null){
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				int idClt = (Integer)session.getAttribute("idClt");
				int idVolD = (Integer)session.getAttribute("idVold");
				List<Passager> P = (List<Passager>)session.getAttribute("passagers");
				
				Reservation Ra = new Reservation();
				Ra.setClt(GV.findClt(idClt));
				Ra.setDateReserv(String.valueOf(new Date()));
				Ra.setTypeReserv("vol");
				Ra.setVol(GV.findVol(idVolD));
				Ra.setCircuitDateR(null);
				//Ra.setPassagers(P);
				for(int i=0;i<P.size();i++){
					P.get(i).setReservationsConcern(Ra);
				}
				Ra.setPassagers(P);
				GV.ajouterReservation(Ra,idVolD,P.size());
				
				/////////////////////////////////////////////////
				if(session.getAttribute("idVolr")!=null){
					int idVolR = (Integer)session.getAttribute("idVolr");
					Reservation Rr = new Reservation();
					Rr.setClt(GV.findClt(idClt));
					Rr.setDateReserv(String.valueOf(new Date()));
					Rr.setTypeReserv("vol");
					Rr.setVol(GV.findVol(idVolR));
					Rr.setCircuitDateR(null);
					for(int i=0;i<P.size();i++){
						P.get(i).setReservationsConcern(Rr);
					}
					Rr.setPassagers(P);
					GV.ajouterReservation(Rr,idVolR,P.size());
					
				}
				
			}catch(NamingException e){e.printStackTrace();}
			session.removeAttribute("idVold");
			session.removeAttribute("idVolr");
			session.removeAttribute("idClt");
		}
		if(request.getParameter("UpdateClt")!=null){
			String nom = request.getParameter("nom");
			String pnom = request.getParameter("pnom");
			String log = request.getParameter("login");
			String pwd = request.getParameter("pwd");
			String adresse = request.getParameter("adresse");
			String email = request.getParameter("email");
			String pays = request.getParameter("pays");
			String codePostal = request.getParameter("codePos");
			String ville = request.getParameter("ville");
			try{
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				int id = (Integer)session.getAttribute("idClient");
				Client clt = GV.findClt(id);
				GV.ModifierClient(id,nom,pnom,log,pwd,email,pays,ville,adresse,codePostal);
			}catch(NamingException e){e.printStackTrace();}
		response.sendRedirect("Client.jsp");
		}
	}

}
