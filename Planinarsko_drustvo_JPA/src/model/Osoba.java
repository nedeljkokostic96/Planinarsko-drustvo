package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the osoba database table.
 * 
 */
@Entity
@NamedQuery(name="Osoba.findAll", query="SELECT o FROM Osoba o")
public class Osoba implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="osoba_id")
	private int osobaId;

	@Column(name="broj_telefona")
	private String brojTelefona;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="datum_rodjenja")
	private Date datumRodjenja;

	private String ime;

	private String jmbg;

	private String prezime;

	//bi-directional many-to-one association to Clanarina
	@OneToMany(mappedBy="osoba1")
	private List<Clanarina> clanarinas1;

	//bi-directional many-to-one association to Clanarina
	@OneToMany(mappedBy="osoba2")
	private List<Clanarina> clanarinas2;

	//bi-directional many-to-one association to Uloga
	@ManyToOne
	@JoinColumn(name="uloga")
	private Uloga ulogaBean;

	//bi-directional many-to-one association to Rezervacija
	@OneToMany(mappedBy="osobaBean")
	private List<Rezervacija> rezervacijas;

	public Osoba() {
	}

	public int getOsobaId() {
		return this.osobaId;
	}

	public void setOsobaId(int osobaId) {
		this.osobaId = osobaId;
	}

	public String getBrojTelefona() {
		return this.brojTelefona;
	}

	public void setBrojTelefona(String brojTelefona) {
		this.brojTelefona = brojTelefona;
	}

	public Date getDatumRodjenja() {
		return this.datumRodjenja;
	}

	public void setDatumRodjenja(Date datumRodjenja) {
		this.datumRodjenja = datumRodjenja;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getJmbg() {
		return this.jmbg;
	}

	public void setJmbg(String jmbg) {
		this.jmbg = jmbg;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public List<Clanarina> getClanarinas1() {
		return this.clanarinas1;
	}

	public void setClanarinas1(List<Clanarina> clanarinas1) {
		this.clanarinas1 = clanarinas1;
	}

	public Clanarina addClanarinas1(Clanarina clanarinas1) {
		getClanarinas1().add(clanarinas1);
		clanarinas1.setOsoba1(this);

		return clanarinas1;
	}

	public Clanarina removeClanarinas1(Clanarina clanarinas1) {
		getClanarinas1().remove(clanarinas1);
		clanarinas1.setOsoba1(null);

		return clanarinas1;
	}

	public List<Clanarina> getClanarinas2() {
		return this.clanarinas2;
	}

	public void setClanarinas2(List<Clanarina> clanarinas2) {
		this.clanarinas2 = clanarinas2;
	}

	public Clanarina addClanarinas2(Clanarina clanarinas2) {
		getClanarinas2().add(clanarinas2);
		clanarinas2.setOsoba2(this);

		return clanarinas2;
	}

	public Clanarina removeClanarinas2(Clanarina clanarinas2) {
		getClanarinas2().remove(clanarinas2);
		clanarinas2.setOsoba2(null);

		return clanarinas2;
	}

	public Uloga getUlogaBean() {
		return this.ulogaBean;
	}

	public void setUlogaBean(Uloga ulogaBean) {
		this.ulogaBean = ulogaBean;
	}

	public List<Rezervacija> getRezervacijas() {
		return this.rezervacijas;
	}

	public void setRezervacijas(List<Rezervacija> rezervacijas) {
		this.rezervacijas = rezervacijas;
	}

	public Rezervacija addRezervacija(Rezervacija rezervacija) {
		getRezervacijas().add(rezervacija);
		rezervacija.setOsobaBean(this);

		return rezervacija;
	}

	public Rezervacija removeRezervacija(Rezervacija rezervacija) {
		getRezervacijas().remove(rezervacija);
		rezervacija.setOsobaBean(null);

		return rezervacija;
	}

}