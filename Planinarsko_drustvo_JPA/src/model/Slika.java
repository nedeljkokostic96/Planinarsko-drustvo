package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the slika database table.
 * 
 */
@Entity
@NamedQuery(name="Slika.findAll", query="SELECT s FROM Slika s")
public class Slika implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="slika_id")
	private int slikaId;

	@Lob
	private byte[] slika;

	//bi-directional many-to-one association to Iskustvo
	@ManyToOne
	@JoinColumn(name="iskustvo")
	private Iskustvo iskustvoBean;

	//bi-directional many-to-one association to Znamenitost
	@ManyToOne
	@JoinColumn(name="znamenitost")
	private Znamenitost znamenitostBean;

	public Slika() {
	}

	public int getSlikaId() {
		return this.slikaId;
	}

	public void setSlikaId(int slikaId) {
		this.slikaId = slikaId;
	}

	public byte[] getSlika() {
		return this.slika;
	}

	public void setSlika(byte[] slika) {
		this.slika = slika;
	}

	public Iskustvo getIskustvoBean() {
		return this.iskustvoBean;
	}

	public void setIskustvoBean(Iskustvo iskustvoBean) {
		this.iskustvoBean = iskustvoBean;
	}

	public Znamenitost getZnamenitostBean() {
		return this.znamenitostBean;
	}

	public void setZnamenitostBean(Znamenitost znamenitostBean) {
		this.znamenitostBean = znamenitostBean;
	}

}