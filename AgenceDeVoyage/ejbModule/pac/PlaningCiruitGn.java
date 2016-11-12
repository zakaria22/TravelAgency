package pac;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PlaningCiruitGn implements Serializable{

	@Id
	@GeneratedValue
	int id;
	String description;
	
	@ManyToOne
	@JoinColumn(name="Id_CircuitGn")
	CircuitGn C;
	
	
	public CircuitGn getC() {
		return C;
	}
	public void setC(CircuitGn c) {
		C = c;
	}
	public PlaningCiruitGn(int id, String description) {
		super();
		this.id = id;
		this.description = description;
	}
	public PlaningCiruitGn() {
		super();
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
	
}
