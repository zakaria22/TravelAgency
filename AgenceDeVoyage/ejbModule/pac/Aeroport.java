package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Aeroport implements Serializable{
	

	@Id
	@GeneratedValue
	int idA;
	
	String nomA;
	
	public Collection<InfoEscale> getInfoEscaleAeroports() {
		return InfoEscaleAeroports;
	}

	public void setInfoEscaleAeroports(Collection<InfoEscale> infoEscaleAeroports) {
		InfoEscaleAeroports = infoEscaleAeroports;
	}

	public Ville getVille() {
		return ville;
	}

	public void setVille(Ville ville) {
		this.ville = ville;
	}

	@OneToMany(mappedBy="aeroport")
	private Collection<InfoEscale> InfoEscaleAeroports;
	
	@ManyToOne
	@JoinColumn(name="Id_Ville")
	Ville ville;
	
	@OneToMany(mappedBy="AeroportD")
	private Collection<VolGenerique> AeroportsD;
	
	@OneToMany(mappedBy="AeroportA")
	private Collection<VolGenerique> AeroportsA;

		
	public Collection<VolGenerique> getAeroportsD() {
		return AeroportsD;
	}

	public void setAeroportsD(Collection<VolGenerique> aeroportsD) {
		AeroportsD = aeroportsD;
	}

	public Collection<VolGenerique> getAeroportsA() {
		return AeroportsA;
	}

	public void setAeroportsA(Collection<VolGenerique> aeroportsA) {
		AeroportsA = aeroportsA;
	}

	public int getIdA() {
		return idA;
	}

	public void setIdA(int idA) {
		this.idA = idA;
	}

	public String getNomA() {
		return nomA;
	}

	public void setNomA(String nomA) {
		this.nomA = nomA;
	}

	public Aeroport(int idA, String nomA) {
		super();
		this.idA = idA;
		this.nomA = nomA;
	}

	public Aeroport() {
		super();
	}

	public Aeroport(int idA, String nomA,
			Collection<InfoEscale> infoEscaleAeroports, Ville ville,
			Collection<VolGenerique> aeroportsD,
			Collection<VolGenerique> aeroportsA) {
		super();
		this.idA = idA;
		this.nomA = nomA;
		InfoEscaleAeroports = infoEscaleAeroports;
		this.ville = ville;
		AeroportsD = aeroportsD;
		AeroportsA = aeroportsA;
	}
	
}
