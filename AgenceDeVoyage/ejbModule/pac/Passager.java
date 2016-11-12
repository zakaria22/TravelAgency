package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Passager implements Serializable{

	@Id
	@GeneratedValue
	int idPas;
	
	String nomP;
	String pnomP;
	String dateN;
	String numPassport;
	String dateExpiration;
	
	
	public Passager(int idPas, String nomP, String pnomP, String dateN,
			String numPassport, String dateExpiration,
			Reservation reservationsConcern) {
		super();
		this.idPas = idPas;
		this.nomP = nomP;
		this.pnomP = pnomP;
		this.dateN = dateN;
		this.numPassport = numPassport;
		this.dateExpiration = dateExpiration;
		ReservationsConcern = reservationsConcern;
	}

	public String getNumPassport() {
		return numPassport;
	}

	public void setNumPassport(String numPassport) {
		this.numPassport = numPassport;
	}

	public String getDateExpiration() {
		return dateExpiration;
	}

	public void setDateExpiration(String dateExpiration) {
		this.dateExpiration = dateExpiration;
	}

	public Passager() {
		super();
	}

	public Passager(String nomP, String pnomP, String dateN) {
		super();
		this.nomP = nomP;
		this.pnomP = pnomP;
		this.dateN = dateN;
	}

	public int getIdPas() {
		return idPas;
	}

	public void setIdPas(int idPas) {
		this.idPas = idPas;
	}

	public String getNomP() {
		return nomP;
	}

	public void setNomP(String nomP) {
		this.nomP = nomP;
	}

	public String getPnomP() {
		return pnomP;
	}

	public void setPnomP(String pnomP) {
		this.pnomP = pnomP;
	}

	public String getDateN() {
		return dateN;
	}

	public void setDateN(String dateN) {
		this.dateN = dateN;
	}

	

	public Reservation getReservationsConcern() {
		return ReservationsConcern;
	}

	public void setReservationsConcern(Reservation reservationsConcern) {
		ReservationsConcern = reservationsConcern;
	}

	public Passager(int idPas, String nomP, String pnomP, String dateN,
			Reservation reservationsConcern) {
		super();
		this.idPas = idPas;
		this.nomP = nomP;
		this.pnomP = pnomP;
		this.dateN = dateN;
		ReservationsConcern = reservationsConcern;
	}

	@ManyToOne
	@JoinColumn(name="Id_reservation")
	private Reservation ReservationsConcern;
	
}
