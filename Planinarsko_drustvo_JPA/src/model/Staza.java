package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the staza database table.
 * 
 */
@Entity
@NamedQuery(name="Staza.findAll", query="SELECT s FROM Staza s")
public class Staza implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="staza_id")
	private int stazaId;

	@Lob
	private byte[] mapa;

	private String naziv;

	private int tezina;

	//bi-directional many-to-one association to Planina
	@ManyToOne
	@JoinColumn(name="planina")
	private Planina planinaBean;

	//bi-directional many-to-one association to Znamenitost
	@OneToMany(mappedBy="stazaBean")
	private List<Znamenitost> znamenitosts;

	public Staza() {
	}

	public int getStazaId() {
		return this.stazaId;
	}

	public void setStazaId(int stazaId) {
		this.stazaId = stazaId;
	}

	public byte[] getMapa() {
		return this.mapa;
	}

	public void setMapa(byte[] mapa) {
		this.mapa = mapa;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public int getTezina() {
		return this.tezina;
	}

	public void setTezina(int tezina) {
		this.tezina = tezina;
	}

	public Planina getPlaninaBean() {
		return this.planinaBean;
	}

	public void setPlaninaBean(Planina planinaBean) {
		this.planinaBean = planinaBean;
	}

	public List<Znamenitost> getZnamenitosts() {
		return this.znamenitosts;
	}

	public void setZnamenitosts(List<Znamenitost> znamenitosts) {
		this.znamenitosts = znamenitosts;
	}

	public Znamenitost addZnamenitost(Znamenitost znamenitost) {
		getZnamenitosts().add(znamenitost);
		znamenitost.setStazaBean(this);

		return znamenitost;
	}

	public Znamenitost removeZnamenitost(Znamenitost znamenitost) {
		getZnamenitosts().remove(znamenitost);
		znamenitost.setStazaBean(null);

		return znamenitost;
	}

}