package pac;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.mapping.Array;

/**
 * Servlet implementation class authentification
 */
public class authentification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public authentification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		
		if(request.getParameter("connexion")!=null){
			//System.out.println("qsdfghjzertyuio");
			try{
				int bln=0;
				InitialContext ctxt = new InitialContext();
				GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
				String login = request.getParameter("log");
				String pwd = request.getParameter("pwd");
				if(login.equalsIgnoreCase("admin")&&(pwd.equalsIgnoreCase("admin"))){
					//System.out.println("coucou");
					response.sendRedirect("Admin.jsp");
				}
				else{
					List<Client> clients= GV.listerClt(); 
					for(int i=0;i<clients.size();i++){
						if(clients.get(i).getLogin().equalsIgnoreCase(login) && (clients.get(i).getPassword().equalsIgnoreCase(pwd))){
							int id = clients.get(i).getIdClt(); 
							session.setAttribute("idClient",id);
							bln=1;
							break;
						}
					}
					if(bln==1){
					response.sendRedirect("RechercherVol.jsp");
					}
					else{
						session.setAttribute("err", 1);
						response.sendRedirect("Authentification.jsp");
						
					}
				}
				
			
			}catch(NamingException e){e.printStackTrace();}
			
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if(request.getParameter("AffReservations")!=null){
		int bln=0;
		String typeV = "";
		String trouver="oui";
		Vector<Reservation> vect = new Vector<Reservation>();
		try{
			InitialContext ctxt = new InitialContext();
			GestionVol GV = (GestionVol)ctxt.lookup("GestionVolBean/remote");
			List<Reservation> Re = GV.listerReservations();
			List<Reservation> ReOuvert = new ArrayList<Reservation>();
			List<Reservation> ReFermer = new ArrayList<Reservation>();
			List<Reservation> Reservations = new ArrayList<Reservation>();
			for(int i=0;i<Re.size();i++){
				if(Re.get(i).getVol()!=null){
					if(Re.get(i).getVol().getBln().equalsIgnoreCase("ouvrir")){
						ReOuvert.add(Re.get(i));
					}
					if(Re.get(i).getVol().getBln().equalsIgnoreCase("fermer")){
						ReFermer.add(Re.get(i));
					}
				}
			}
			if(request.getParameter("typeVol").equalsIgnoreCase("o")){Reservations = ReOuvert;}
			if(request.getParameter("typeVol").equalsIgnoreCase("f")){Reservations = ReFermer;}
		//////////////////////////////////////////////////////////////////////////////
			if((request.getParameter("Comp")!=null)&&(trouver.equals("oui"))){
				for(int i=0;i<Reservations.size();i++){
					if(Reservations.get(i).getVol().getVolG().getCA().getIdCompA()==Integer.parseInt(request.getParameter("Comp"))){
						bln=1; vect.add(Reservations.get(i));
					}
				}
				if(bln==0){
					trouver="non";
				}
			}
			//////////////////////////////////////////////////////////////////////////////
			if((!request.getParameter("cin").equals(""))&&(trouver.equals("oui"))){
				if(bln==1){
					int v=0;
					while(v < vect.size()){
						if(!vect.get(v).getClt().getCodePostal().equalsIgnoreCase(request.getParameter("cin"))){vect.remove(v);}
						else{v++;}
					}
					
				}
				if(bln==0){
					for(int i=0;i<Re.size();i++){
						if(Re.get(i).getClt().getCodePostal().equalsIgnoreCase(request.getParameter("cin"))){
							bln=1; vect.add(Re.get(i));
						}
					}
					if(bln==0){
						trouver="non";
					}
				}
			}
			/////////////////////////////////////////////////////////////////////////////
			if((!request.getParameter("AD").equals("-1"))&&(trouver.equals("oui"))){
				if(bln==1){
					int v=0;
					while(v < vect.size()){
						if(vect.get(v).getVol().getVolG().getAeroportD().getIdA()!=Integer.parseInt(request.getParameter("AD"))){vect.remove(v);}
						else{v++;}
					}
					
				}
				if(bln==0){
					for(int i=0;i<Re.size();i++){
						if(Re.get(i).getVol().getVolG().getAeroportD().getIdA()==Integer.parseInt(request.getParameter("AD"))){
							bln=1; vect.add(Re.get(i));
						}
					}

					if(bln==0){
						trouver="non";
					}
				}
			}
			///////////////////////////////////////////////////////////////////////////////
			if((!request.getParameter("AA").equals("-1"))&&(trouver.equals("oui"))){
				if(bln==1){
					int v=0;
					while(v < vect.size()){
						if(vect.get(v).getVol().getVolG().getAeroportA().getIdA()!=Integer.parseInt(request.getParameter("AA"))){vect.remove(v);}
						else{v++;}
					}
				}
				if(bln==0){
					for(int i=0;i<Re.size();i++){
						if(Re.get(i).getVol().getVolG().getAeroportA().getIdA()==Integer.parseInt(request.getParameter("AA"))){
							bln=1; vect.add(Re.get(i));
						}
					}

					if(bln==0){
						trouver="non";
					}
				}
			}
			///////////////////////////////////////////////////////////////////////////////
			if((!request.getParameter("dateD").equals(""))&&(trouver.equals("oui"))){
				if(bln==1){
					int v=0;
					while(v < vect.size()){
						if(!vect.get(v).getVol().getDateDepart().equals(request.getParameter("dateD"))){vect.remove(v);}
						else{v++;}
					}
				}
				if(bln==0){
					for(int i=0;i<Re.size();i++){
						if(Re.get(i).getVol().getDateDepart().equalsIgnoreCase(request.getParameter("dateD"))){
							bln=1; vect.add(Re.get(i));
						}
					}

					if(bln==0){
						trouver="non";
					}
				}
			}
			/////////////////////////////////////
			
			
		}catch(NamingException e){e.printStackTrace();}
		session.setAttribute("reservations", vect);
		response.sendRedirect("listRePourAdmin.jsp");	
	}

	
}
}
