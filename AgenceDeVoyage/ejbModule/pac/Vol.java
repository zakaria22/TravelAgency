package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Vol implements Serializable{
	
	@Id
	@GeneratedValue
	int idVol;
	
	String DateDepart;
	String DateArrivee;
	String bln;
	@ManyToOne
	@JoinColumn(name="Id_VolG")
	VolGenerique VolG;
	String nbrPlace;
	
	
	public String getNbrPlace() {
		return nbrPlace;
	}
	public void setNbrPlace(String nbrPlace) {
		this.nbrPlace = nbrPlace;
	}
	public String getBln() {
		return bln;
	}
	public void setBln(String bln) {
		this.bln = bln;
	}
	@OneToMany(mappedBy="Vol")
	private Collection<Reservation> Reservations;
	
	public VolGenerique getVolG() {
		return VolG;
	}
	public void setVolG(VolGenerique volG) {
		VolG = volG;
	}
	public Collection<Reservation> getReservations() {
		return Reservations;
	}
	public void setReservations(Collection<Reservation> reservations) {
		Reservations = reservations;
	}
	public Vol(String dateDepart, String dateArrivee, VolGenerique volG) {
		super();
		DateDepart = dateDepart;
		DateArrivee = dateArrivee;
		VolG = volG;
	}
	public Vol(int idVol, String dateDepart, String dateArrivee) {
		super();
		this.idVol = idVol;
		DateDepart = dateDepart;
		DateArrivee = dateArrivee;
	}
	public Vol() {
		super();
	}
	public int getIdVol() {
		return idVol;
	}
	public void setIdVol(int idVol) {
		this.idVol = idVol;
	}
	public String getDateDepart() {
		return DateDepart;
	}
	public void setDateDepart(String dateDepart) {
		DateDepart = dateDepart;
	}
	public String getDateArrivee() {
		return DateArrivee;
	}
	public void setDateArrivee(String dateArrivee) {
		DateArrivee = dateArrivee;
	}
	public Vol(int idVol, String dateDepart, String dateArrivee, String bln,
			VolGenerique volG, String nbrPlace,
			Collection<Reservation> reservations) {
		super();
		this.idVol = idVol;
		DateDepart = dateDepart;
		DateArrivee = dateArrivee;
		this.bln = bln;
		VolG = volG;
		this.nbrPlace = nbrPlace;
		Reservations = reservations;
	}
	
	

}
