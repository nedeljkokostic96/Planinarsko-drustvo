package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the znamenitost database table.
 * 
 */
@Entity
@NamedQuery(name="Znamenitost.findAll", query="SELECT z FROM Znamenitost z")
public class Znamenitost implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="znamenitost_id")
	private int znamenitostId;

	private String naziv;

	@Lob
	private String opis;

	//bi-directional many-to-one association to Posjeta
	@OneToMany(mappedBy="znamenitostBean")
	private List<Posjeta> posjetas;

	//bi-directional many-to-one association to Slika
	@OneToMany(mappedBy="znamenitostBean")
	private List<Slika> slikas;

	//bi-directional many-to-one association to Staza
	@ManyToOne
	@JoinColumn(name="staza")
	private Staza stazaBean;

	public Znamenitost() {
	}

	public int getZnamenitostId() {
		return this.znamenitostId;
	}

	public void setZnamenitostId(int znamenitostId) {
		this.znamenitostId = znamenitostId;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public List<Posjeta> getPosjetas() {
		return this.posjetas;
	}

	public void setPosjetas(List<Posjeta> posjetas) {
		this.posjetas = posjetas;
	}

	public Posjeta addPosjeta(Posjeta posjeta) {
		getPosjetas().add(posjeta);
		posjeta.setZnamenitostBean(this);

		return posjeta;
	}

	public Posjeta removePosjeta(Posjeta posjeta) {
		getPosjetas().remove(posjeta);
		posjeta.setZnamenitostBean(null);

		return posjeta;
	}

	public List<Slika> getSlikas() {
		return this.slikas;
	}

	public void setSlikas(List<Slika> slikas) {
		this.slikas = slikas;
	}

	public Slika addSlika(Slika slika) {
		getSlikas().add(slika);
		slika.setZnamenitostBean(this);

		return slika;
	}

	public Slika removeSlika(Slika slika) {
		getSlikas().remove(slika);
		slika.setZnamenitostBean(null);

		return slika;
	}

	public Staza getStazaBean() {
		return this.stazaBean;
	}

	public void setStazaBean(Staza stazaBean) {
		this.stazaBean = stazaBean;
	}

}