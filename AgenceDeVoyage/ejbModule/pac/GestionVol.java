package pac;

import java.util.Collection;
import java.util.List;

import javax.ejb.Remote;

import com.arjuna.ats.arjuna.Info;
@Remote
public interface GestionVol {
	public void ajouterVol(VolGenerique v);
	public void ajouterV(Vol v);
	public void ajouterC(CompagnieAérienne c);
	public void ajouterA(Aeroport a,int id);
	public void ajouterVille(Ville v,int idp);
	public void ajouterEscale(InfoEscale E);
	public List<CompagnieAérienne> listerCA();
	public List<Aeroport> listerA();
	public List<InfoEscale> listerEscal();
	public Aeroport findA(int idA);
	public CompagnieAérienne findCA(int idCA);
	public VolGenerique findVolg(int id);
	public List<VolGenerique> listerVolG();
	public List<Pays> listerP();
	public List<Ville> listerVill();
	public Pays findPays(int id);
	public void ModifierVolg(int id,String ca,String jr,String hd,String ha,String ad,String aa,String pr);
	
	////////////////////////////CIRCUIT///////////////////////////
	public void ajouterCircuitGn(CircuitGn C);
	public void ModifierrCircuit(int id,String nom,String desc,String duree);
	public List<CircuitGn> listerCircuit();
	public CircuitGn findCircuit(int id);
	public void ajouterPlaningC(PlaningCiruitGn P);
	public List<PlaningCiruitGn> listerPlaningC();
	public void ajouterDateCircuit(CircuitDateR C);
	
	public void ModifierPlaning(int id, Collection<PlaningCiruitGn> p);

////////////////////////////::
	public List<Vol> listerVolO();
	public Vol findVol(int idVol);
	public Client findClt(int idClt);
	public List<Client> listerClt();
	public void ajouterClt(Client clt);
	public void ajouterReservation(Reservation r,int idVold,int nbrPassagers);
	public void ajouterReservationC(Reservation r,int idDateR,int nbrPassagers);
	public List<Passager> listerPassagers();
	public Reservation findRese(int idRe);
	public void ModifierClient(int id,String nom,String pnom,String log,String pwd,String email,String pays,String ville,String adresse,String codePostal);
	public void removeReserv(int id,int nbrP);
	public void removeReservC(int id,int nbrP);
	public List<Reservation> listerReservations();
	public List<CircuitDateR> listerReserCircuit();
	public CircuitDateR findReservationC(int id);
}
