package pac;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.arjuna.ats.arjuna.Info;

@Stateless
public class GestionVolBean implements GestionVol{

	@PersistenceContext
	EntityManager em;
	public Pays findPays(int id){
		return em.find(Pays.class, id);
	}
	public List<Pays> listerP(){
		return em.createQuery("from Pays").getResultList();
	}
	public void ajouterC(CompagnieAérienne c){
		em.persist(c);
	}
	public List<InfoEscale> listerEscal(){
		return em.createQuery("from InfoEscale").getResultList();
	}
	public List<Ville> listerVill(){
		return em.createQuery("from Ville").getResultList();
	}
	public void ajouterVol(VolGenerique v){
		em.persist(v);
	}
	public void ajouterV(Vol v){
		em.persist(v);
	}
	public void ajouterA(Aeroport a,int id){
		Ville v =  em.find(Ville.class, id);
		a.setVille(v);
		em.persist(a);
	}
	public void ajouterVille(Ville v,int idp){
		Pays p =  em.find(Pays.class, idp);
		v.setP(p);
		em.persist(v);
	}
	public void ajouterEscale(InfoEscale E){
		em.persist(E);
	}
	
	public List<CompagnieAérienne> listerCA(){
		return em.createQuery("from CompagnieAérienne").getResultList();
	}
	public List<Aeroport> listerA(){
		return em.createQuery("from Aeroport").getResultList();
	}
	
	public List<VolGenerique> listerVolG(){
		return em.createQuery("from VolGenerique").getResultList();
	}
	public Aeroport findA(int id){
		return em.find(Aeroport.class, id);
	}
	public CompagnieAérienne findCA(int id){
		return em.find(CompagnieAérienne.class, id);
	}
	public VolGenerique findVolg(int id){
		return em.find(VolGenerique.class, id);
	}
	public void ModifierVolg(int id,String ca,String jr,String hd,String ha,String ad,String aa,String pr){
		VolGenerique v = findVolg(id);
		CompagnieAérienne C = findCA(Integer.parseInt(ca));
		Aeroport AD  = findA(Integer.parseInt(ad));
		Aeroport AA  = findA(Integer.parseInt(aa));
		v.setCA(C); v.setAeroportD(AD); v.setAeroportA(AA); 
		v.setJour(jr); v.setHeureD(hd); v.setHeureA(ha); v.setPrix(pr);
		em.merge(v);
	}
	///////////////////////CIRCUIT///
	public void ajouterCircuitGn(CircuitGn C){
		em.persist(C);
	}
	public void ModifierrCircuit(int id,String nom,String desc,String duree){
		CircuitGn C = findCircuit(id);
		C.setNom(nom); C.setDescription(desc); C.setDuree(duree);
		em.merge(C);
	}
	public void ModifierPlaning(int id, Collection<PlaningCiruitGn> p){
		List<PlaningCiruitGn> P1 = new ArrayList<PlaningCiruitGn>(p);
		CircuitGn C = findCircuit(id);
		List<PlaningCiruitGn> P = new ArrayList<PlaningCiruitGn>(C.getPlanings());
		for(int i=0;i<P.size();i++){
			P.get(i).setDescription(P1.get(i).getDescription());
			em.merge(P.get(i));
		}
		
	}
	
	public List<CircuitGn> listerCircuit(){
		return em.createQuery("from CircuitGn").getResultList();
	}
	public CircuitGn findCircuit(int id){
		return em.find(CircuitGn.class, id);
	}
	public void ajouterPlaningC(PlaningCiruitGn P){
		em.persist(P);
	}
	public List<PlaningCiruitGn> listerPlaningC(){
		return em.createQuery("from PlaningCiruitGn").getResultList();
	}
	public void ajouterDateCircuit(CircuitDateR C){
		em.persist(C);
	}
	////////////////////////////////////////
	public List<Vol> listerVolO(){
		return em.createQuery("from Vol").getResultList();
	}
	public Client findClt(int idClt){
		return em.find(Client.class, idClt);
	}
	public List<Client> listerClt(){
		return em.createQuery("from Client").getResultList();
	}
	public void ajouterClt(Client clt){
		em.persist(clt);
	}
	public Vol findVol(int idVol){
		return em.find(Vol.class, idVol);
	}
	public void ajouterReservation(Reservation r,int idVold,int nbrPassagers){
		em.persist(r);
		Vol vol =  em.find(Vol.class, idVold);
		int nbrplace = Integer.parseInt(vol.getNbrPlace());
		String nbrPlaceActuel = String.valueOf(nbrplace-nbrPassagers);
		if(Integer.parseInt(nbrPlaceActuel)==0){
			vol.setBln("fermer");
		}
		
			vol.setNbrPlace(nbrPlaceActuel);
		
	}
	public void ajouterReservationC(Reservation r,int idDateR,int nbrPassagers){
		em.persist(r);
		CircuitDateR CdateR =  em.find(CircuitDateR.class, idDateR);
		int nbrplace = Integer.parseInt(CdateR.getNbrPlace());
		String nbrPlaceActuel = String.valueOf(nbrplace-nbrPassagers);
		if(Integer.parseInt(nbrPlaceActuel)==0){
			CdateR.setBln("fermer");
		}
		CdateR.setNbrPlace(nbrPlaceActuel);
	}
	public List<Passager> listerPassagers(){
		return em.createQuery("from Passager").getResultList();
	}
	public Reservation findRese(int idRe){
		return em.find(Reservation.class, idRe);
	}
	public void ModifierClient(int id,String nom,String pnom,String log,String pwd,String email,String pays,String ville,String adresse,String codePostal){
		Client clt = findClt(id);
		clt.setNomClt(nom); clt.setPnomClt(pnom); clt.setAdresse(adresse); clt.setEmail(email); 
		clt.setCodePostal(codePostal); clt.setLogin(log);clt.setPassword(pwd); clt.setPays(pays);
		clt.setVille(ville);
		em.merge(clt);
	}
	public void removeReserv(int idRe,int nbrP){
		Reservation Re = findRese(idRe);
		em.remove(Re);
		Vol vol = findVol(Re.getVol().getIdVol());
		int nbrPAcc = Integer.parseInt(vol.getNbrPlace());
		vol.setNbrPlace(String.valueOf(nbrPAcc+nbrP));
		if(vol.getBln().equalsIgnoreCase("fermer")){vol.setBln("ouvrir");}
		em.merge(vol);
	}
	public void removeReservC(int idRe,int nbrP){
		Reservation Re = findRese(idRe);
		em.remove(Re);
		CircuitDateR dateRc = findReservationC(Re.getCircuitDateR().getId());
		int nbrPAcc = Integer.parseInt(dateRc.getNbrPlace());
		dateRc.setNbrPlace(String.valueOf(nbrPAcc+nbrP));
		if(dateRc.getBln().equalsIgnoreCase("fermer")){dateRc.setBln("ouvrir");}
		em.merge(dateRc);
	}
	public List<Reservation> listerReservations(){
		return em.createQuery("from Reservation").getResultList();
	}
	public List<CircuitDateR> listerReserCircuit(){
		return em.createQuery("from CircuitDateR").getResultList();
	}
	public CircuitDateR findReservationC(int id){
		return em.find(CircuitDateR.class, id);
	}
}
