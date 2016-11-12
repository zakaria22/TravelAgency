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
public class Ville implements Serializable{

	@Id
	@GeneratedValue
	int idVille;
	
	String nomVille;
	
	@OneToMany(mappedBy="ville")
	private Collection<Aeroport> aeroportsDesservies;
	
	@ManyToOne
	@JoinColumn(name="Id_Pays")
	Pays p;

	public Ville(int idVille, String nomVille,
			Collection<Aeroport> aeroportsDesservies, Pays p) {
		super();
		this.idVille = idVille;
		this.nomVille = nomVille;
		this.aeroportsDesservies = aeroportsDesservies;
		this.p = p;
	}

	public int getIdVille() {
		return idVille;
	}

	public void setIdVille(int idVille) {
		this.idVille = idVille;
	}

	public String getNomVille() {
		return nomVille;
	}

	public void setNomVille(String nomVille) {
		this.nomVille = nomVille;
	}

	public Collection<Aeroport> getAeroportsDesservies() {
		return aeroportsDesservies;
	}

	public void setAeroportsDesservies(Collection<Aeroport> AeroportsDesservies) {
		aeroportsDesservies = AeroportsDesservies;
	}

	public Ville(int idVille, String nomVille,
			Collection<Aeroport> AeroportsDesservies) {
		super();
		this.idVille = idVille;
		this.nomVille = nomVille;
		aeroportsDesservies = AeroportsDesservies;
	}

	public Ville() {
		super();
	}

	public Pays getP() {
		return p;
	}

	public void setP(Pays p) {
		this.p = p;
	}
	
	
}
