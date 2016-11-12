package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
@Entity
public class CircuitGn implements Serializable{

	@Id
	@GeneratedValue
	int id;
	String nom;
	String description;
	String Duree;
	
	public CircuitGn(int id, String nom, String description, String duree,
			Collection<PlaningCiruitGn> planings,
			Collection<CircuitDateR> circuitsDatesR, Pays destination) {
		super();
		this.id = id;
		this.nom = nom;
		this.description = description;
		Duree = duree;
		Planings = planings;
		CircuitsDatesR = circuitsDatesR;
		this.destination = destination;
	}
	@OneToMany(mappedBy="C")
	private Collection<PlaningCiruitGn> Planings;
	
	@OneToMany(mappedBy="Circuit",fetch=FetchType.EAGER)
	private Collection<CircuitDateR> CircuitsDatesR;
	
	public Collection<CircuitDateR> getCircuitsDatesR() {
		return CircuitsDatesR;
	}
	public void setCircuitsDatesR(Collection<CircuitDateR> circuitsDatesR) {
		CircuitsDatesR = circuitsDatesR;
	}
	@ManyToOne
	@JoinColumn(name="Id_Destination")
	Pays destination;
	
	public Pays getDestination() {
		return destination;
	}
	public void setDestination(Pays destination) {
		this.destination = destination;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public Collection<PlaningCiruitGn> getPlanings() {
		return Planings;
	}
	public void setPlanings(Collection<PlaningCiruitGn> planings) {
		Planings = planings;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDuree() {
		return Duree;
	}
	public void setDuree(String duree) {
		Duree = duree;
	}
	public CircuitGn(int id, String description, String duree) {
		super();
		this.id = id;
		this.description = description;
		Duree = duree;
	}
	public CircuitGn() {
		super();
	}
	
	
}
