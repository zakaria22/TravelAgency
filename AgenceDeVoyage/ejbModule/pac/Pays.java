package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.sun.java_cup.internal.runtime.virtual_parse_stack;

@Entity
public class Pays implements Serializable{

	@Id
	@GeneratedValue
	int IdPays;
	
	String nomPays;
	
	@OneToMany(mappedBy="p")
	private Collection<Ville> Villes;
	
	@OneToMany(mappedBy="destination")
	private Collection<CircuitGn> Circuits;
	
	public Collection<CircuitGn> getCircuits() {
		return Circuits;
	}

	public void setCircuits(Collection<CircuitGn> circuits) {
		Circuits = circuits;
	}

	public int getIdPays() {
		return IdPays;
	}

	public void setIdPays(int idPays) {
		IdPays = idPays;
	}

	public String getNomPays() {
		return nomPays;
	}

	public void setNomPays(String nomPays) {
		this.nomPays = nomPays;
	}

	public Collection<Ville> getVilles() {
		return Villes;
	}

	public void setVilles(Collection<Ville> villes) {
		Villes = villes;
	}

	public Pays(int idPays, String nomPays, Collection<Ville> villes) {
		super();
		IdPays = idPays;
		this.nomPays = nomPays;
		Villes = villes;
	}

	public Pays() {
		super();
	}
	
	
}
