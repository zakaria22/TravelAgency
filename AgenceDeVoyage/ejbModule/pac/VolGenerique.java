package pac;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;
@Entity
public class VolGenerique implements Serializable{

	@Id
	@GeneratedValue
	int VolG;
	
	String jour;
	String HeureD;
	String HeureA;
	String Prix;
	String escale;
	int nbrPlace;
	
	public int getNbrPlace() {
		return nbrPlace;
	}
	public void setNbrPlace(int nbrPlace) {
		this.nbrPlace = nbrPlace;
	}
	public String getEscale() {
		return escale;
	}
	public void setEscale(String escale) {
		this.escale = escale;
	}
	public VolGenerique(int volG, String jour, String heureD, String heureA,
			 String prix, CompagnieAérienne cA,
			Aeroport aeroportD, Aeroport aeroportA, Collection<Vol> vols,
			Collection<InfoEscale> infoEscaleVolsG) {
		super();
		VolG = volG;
		this.jour = jour;
		HeureD = heureD;
		HeureA = heureA;
		Prix = prix;
		CA = cA;
		AeroportD = aeroportD;
		AeroportA = aeroportA;
		Vols = vols;
		InfoEscaleVolsG = infoEscaleVolsG;
	}
	
	public VolGenerique(String jour, String heureD, String heureA, String prix,
			String escale, int nbrPlace, CompagnieAérienne cA,
			Aeroport aeroportD, Aeroport aeroportA) {
		super();
		this.jour = jour;
		HeureD = heureD;
		HeureA = heureA;
		Prix = prix;
		this.escale = escale;
		this.nbrPlace = nbrPlace;
		CA = cA;
		AeroportD = aeroportD;
		AeroportA = aeroportA;
	}
	public VolGenerique(String jr, String heureD, String heureA,
			 String prix, CompagnieAérienne cA,
			Aeroport aeroportD, Aeroport aeroportA) {
		super();
		jour = jr;
		HeureD = heureD;
		HeureA = heureA;
		Prix = prix;
		CA = cA;
		AeroportD = aeroportD;
		AeroportA = aeroportA;
	}
	@ManyToOne
	@JoinColumn(name="Id_Compagnie")
	CompagnieAérienne CA;
	
	@ManyToOne
	@JoinColumn(name="Id_AeroportD")
	Aeroport AeroportD;
	
	@ManyToOne
	@JoinColumn(name="Id_AeroportA")
	Aeroport AeroportA;
	
	@OneToMany(mappedBy="VolG",fetch=FetchType.LAZY)
	private Collection<Vol> Vols;
	
	@OneToMany(mappedBy="volG",fetch=FetchType.EAGER)
	private Collection<InfoEscale> InfoEscaleVolsG;
	
	public VolGenerique() {
		super();
	}
	public VolGenerique(int volG, String jour, String heureD, String heureA,
			 String prix) {
		super();
		VolG = volG;
		this.jour = jour;
		HeureD = heureD;
		HeureA = heureA;
		Prix = prix;
	}
	
	public CompagnieAérienne getCA() {
		return CA;
	}
	public void setCA(CompagnieAérienne cA) {
		CA = cA;
	}
	public Aeroport getAeroportD() {
		return AeroportD;
	}
	public void setAeroportD(Aeroport aeroportD) {
		AeroportD = aeroportD;
	}
	public Aeroport getAeroportA() {
		return AeroportA;
	}
	public void setAeroportA(Aeroport aeroportA) {
		AeroportA = aeroportA;
	}
	public Collection<Vol> getVols() {
		return Vols;
	}
	public void setVols(Collection<Vol> vols) {
		Vols = vols;
	}
	
	public Collection<InfoEscale> getInfoEscaleVolsG() {
		return InfoEscaleVolsG;
	}
	public void setInfoEscaleVolsG(Collection<InfoEscale> infoEscaleVolsG) {
		InfoEscaleVolsG = infoEscaleVolsG;
	}
	public int getVolG() {
		return VolG;
	}
	public void setVolG(int volG) {
		VolG = volG;
	}
	public String getJour() {
		return jour;
	}
	public void setJour(String jour) {
		this.jour = jour;
	}
	public String getHeureD() {
		return HeureD;
	}
	public void setHeureD(String heureD) {
		HeureD = heureD;
	}
	public String getHeureA() {
		return HeureA;
	}
	public void setHeureA(String heureA) {
		HeureA = heureA;
	}
	
	public String getPrix() {
		return Prix;
	}
	public void setPrix(String prix) {
		Prix = prix;
	}
}
