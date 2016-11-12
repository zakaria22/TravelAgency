package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
@Entity
public class CircuitDateR implements Serializable{

	@Id
	@GeneratedValue
	int id;
	String nomVill;
	String dateD;
	String prix;
	String bln;
	String nbrPlace;
	
	public String getNbrPlace() {
		return nbrPlace;
	}

	public void setNbrPlace(String nbrPlace) {
		this.nbrPlace = nbrPlace;
	}
	@OneToMany(mappedBy="CircuitDateR")
	private Collection<Reservation> Reservations;
	
	public Collection<Reservation> getReservations() {
		return Reservations;
	}

	public void setReservations(Collection<Reservation> reservations) {
		Reservations = reservations;
	}
	@ManyToOne
	@JoinColumn(name="Id_Circuit")
	CircuitGn Circuit;

	public CircuitDateR(int id, String nomVill, String dateD, String prix,
			String bln, CircuitGn circuit) {
		super();
		this.id = id;
		this.nomVill = nomVill;
		this.dateD = dateD;
		this.prix = prix;
		this.bln = bln;
		Circuit = circuit;
	}

	public String getBln() {
		return bln;
	}

	public void setBln(String bln) {
		this.bln = bln;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNomVill() {
		return nomVill;
	}

	public void setNomVill(String nomVill) {
		this.nomVill = nomVill;
	}

	public String getDateD() {
		return dateD;
	}

	public void setDateD(String dateD) {
		this.dateD = dateD;
	}

	public String getPrix() {
		return prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public CircuitGn getCircuit() {
		return Circuit;
	}

	public void setCircuit(CircuitGn circuit) {
		Circuit = circuit;
	}

	public CircuitDateR(int id, String nomVill, String dateD, String prix,
			CircuitGn circuit) {
		super();
		this.id = id;
		this.nomVill = nomVill;
		this.dateD = dateD;
		this.prix = prix;
		Circuit = circuit;
	}

	public CircuitDateR() {
		super();
	}
	
	
}
