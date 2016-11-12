package pac;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;

@Entity
public class Client implements Serializable{
	
	@Id
	@GeneratedValue
	int idClt;
	
	String nomClt;
	String pnomClt;
	String login;
	String password;
	String adresse;
	String email;
	String ville;
	String pays;
	String codePostal;
	
	public Client(String nomClt, String pnomClt, String login, String password,
			String adresse, String email, String ville, String pays,
			String codePostal) {
		super();
		this.nomClt = nomClt;
		this.pnomClt = pnomClt;
		this.login = login;
		this.password = password;
		this.adresse = adresse;
		this.email = email;
		this.ville = ville;
		this.pays = pays;
		this.codePostal = codePostal;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	public String getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
	@OneToMany(mappedBy="Clt",fetch=FetchType.EAGER)
	private Collection<Reservation> Reservations;
	
	public Client(int idClt, String nomClt, String pnomClt, String login,
			String password, String adresse, String email,
			Collection<Reservation> reservations) {
		super();
		this.idClt = idClt;
		this.nomClt = nomClt;
		this.pnomClt = pnomClt;
		this.login = login;
		this.password = password;
		this.adresse = adresse;
		this.email = email;
		Reservations = reservations;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public Collection<Reservation> getReservations() {
		return Reservations;
	}
	public void setReservations(Collection<Reservation> reservations) {
		Reservations = reservations;
	}
	public Client(int idClt, String nomClt, String pnomClt, String email) {
		super();
		this.idClt = idClt;
		this.nomClt = nomClt;
		this.pnomClt = pnomClt;
		this.email = email;
	}
	public Client() {
		super();
	}
	public int getIdClt() {
		return idClt;
	}
	public void setIdClt(int idClt) {
		this.idClt = idClt;
	}
	public String getNomClt() {
		return nomClt;
	}
	public void setNomClt(String nomClt) {
		this.nomClt = nomClt;
	}
	public String getPnomClt() {
		return pnomClt;
	}
	public void setPnomClt(String pnomClt) {
		this.pnomClt = pnomClt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
