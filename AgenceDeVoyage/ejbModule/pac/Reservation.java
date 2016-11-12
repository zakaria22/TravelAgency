package pac;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.FetchMode;

@Entity
public class Reservation implements Serializable{
	
	@Id
	@GeneratedValue
	int idRserv;
	
	String DateReserv;
	String TypeReserv;
	
	@ManyToOne
	@JoinColumn(name="Id_Vol")
	Vol Vol;
	
	@ManyToOne
	@JoinColumn(name="Id_DateCircuit")
	CircuitDateR CircuitDateR;
	
	public CircuitDateR getCircuitDateR() {
		return CircuitDateR;
	}
	public void setCircuitDateR(CircuitDateR circuitDateR) {
		CircuitDateR = circuitDateR;
	}

	@ManyToOne
	@JoinColumn(name="Id_Clt")
	Client Clt;
	
	public Vol getVol() {
		return Vol;
	}
	public void setVol(Vol vol) {
		Vol = vol;
	}
	public Client getClt() {
		return Clt;
	}
	public void setClt(Client clt) {
		Clt = clt;
	}
	public Collection<Passager> getPassagers() {
		return Passagers;
	}
	public void setPassagers(Collection<Passager> passagers) {
		Passagers = passagers;
	}
	
	@OneToMany(mappedBy="ReservationsConcern",cascade=CascadeType.ALL)
	private Collection<Passager> Passagers;
	
	
	public Reservation(int idRserv, String dateReserv, String typeReserv,
			Vol vol, Client clt, Collection<Passager> passagers) {
		super();
		this.idRserv = idRserv;
		DateReserv = dateReserv;
		TypeReserv = typeReserv;
		Vol = vol;
		Clt = clt;
		Passagers = passagers;
	}
	public Reservation() {
		super();
	}
	public Reservation(int idRserv, String dateReserv, String typeReserv) {
		super();
		this.idRserv = idRserv;
		DateReserv = dateReserv;
		TypeReserv = typeReserv;
	}
	public int getIdRserv() {
		return idRserv;
	}
	public void setIdRserv(int idRserv) {
		this.idRserv = idRserv;
	}
	public String getDateReserv() {
		return DateReserv;
	}
	public void setDateReserv(String dateReserv) {
		DateReserv = dateReserv;
	}
	public String getTypeReserv() {
		return TypeReserv;
	}
	public void setTypeReserv(String typeReserv) {
		TypeReserv = typeReserv;
	}

	
}
