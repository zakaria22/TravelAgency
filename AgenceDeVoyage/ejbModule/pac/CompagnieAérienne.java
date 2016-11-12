package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;

@Entity
public class CompagnieAérienne implements Serializable{

	@Id
	@GeneratedValue
	int idCompA;
	
	String nomA;
	String nomAvion;
	//(fetch=FetchType.EAGER,cascade={CascadeType.REMOVE},mappedBy="projet")
	
	@OneToMany(mappedBy="CA")
	Collection<VolGenerique> VolGproposee;
	
	public CompagnieAérienne() {
		super();
	}
	public CompagnieAérienne(int idCompA, String nomA, String num) {
		super();
		this.idCompA = idCompA;
		this.nomA = nomA;
		this.nomAvion = num;
	}
	
	public Collection<VolGenerique> getVolGproposee() {
		return VolGproposee;
	}
	public void setVolGproposee(Collection<VolGenerique> volGproposee) {
		VolGproposee = volGproposee;
	}
	public int getIdCompA() {
		return idCompA;
	}
	public void setIdCompA(int idCompA) {
		this.idCompA = idCompA;
	}
	public String getNomA() {
		return nomA;
	}
	public void setNomA(String nomA) {
		this.nomA = nomA;
	}
	public String getNum() {
		return nomAvion;
	}
	public void setNum(String num) {
		this.nomAvion = num;
	}
	
}
