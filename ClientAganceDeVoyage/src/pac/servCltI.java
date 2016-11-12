package pac;

import java.io.IOException;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class servCltI
 */
public class servCltI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servCltI() {
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
			response.sendRedirect("reserverVolInvite.jsp");
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
			response.sendRedirect("reserverVolInvite.jsp");
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
