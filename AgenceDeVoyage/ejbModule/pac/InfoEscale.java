package pac;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class InfoEscale implements Serializable{

	
	@Id
	@GeneratedValue
	int idInfoEscale;
	
	@ManyToOne
	@JoinColumn(name="Id_Aeroport")
	Aeroport aeroport;
	
	@ManyToOne
	@JoinColumn(name="Id_VolG")
	VolGenerique volG;
	
	String HeureD;
	String HeureA;
	String Duree;
	
	
	public int getIdInfoEscale() {
		return idInfoEscale;
	}
	public void setIdInfoEscale(int idInfoEscale) {
		this.idInfoEscale = idInfoEscale;
	}
	public Aeroport getAeroport() {
		return aeroport;
	}
	public void setAeroport(Aeroport aeroport) {
		this.aeroport = aeroport;
	}
	public VolGenerique getVolG() {
		return volG;
	}
	public void setVolG(VolGenerique volG) {
		this.volG = volG;
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
	public String getDuree() {
		return Duree;
	}
	public void setDuree(String duree) {
		Duree = duree;
	}
	public InfoEscale(Aeroport aeroport, VolGenerique volG, String heureD,
			String heureA, String duree) {
		super();
		this.aeroport = aeroport;
		this.volG = volG;
		HeureD = heureD;
		HeureA = heureA;
		Duree = duree;
	}
	public InfoEscale() {
		super();
	}
	
}
