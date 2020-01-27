package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the posjeta database table.
 * 
 */
@Entity
@NamedQuery(name="Posjeta.findAll", query="SELECT p FROM Posjeta p")
public class Posjeta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="posjeta_id")
	private int posjetaId;

	@Lob
	private String komentar;

	@Temporal(TemporalType.TIMESTAMP)
	private Date termin;

	//bi-directional many-to-one association to Rezervacija
	@ManyToOne
	@JoinColumn(name="rezervacija")
	private Rezervacija rezervacijaBean;

	//bi-directional many-to-one association to Znamenitost
	@ManyToOne
	@JoinColumn(name="znamenitost")
	private Znamenitost znamenitostBean;

	public Posjeta() {
	}

	public int getPosjetaId() {
		return this.posjetaId;
	}

	public void setPosjetaId(int posjetaId) {
		this.posjetaId = posjetaId;
	}

	public String getKomentar() {
		return this.komentar;
	}

	public void setKomentar(String komentar) {
		this.komentar = komentar;
	}

	public Date getTermin() {
		return this.termin;
	}

	public void setTermin(Date termin) {
		this.termin = termin;
	}

	public Rezervacija getRezervacijaBean() {
		return this.rezervacijaBean;
	}

	public void setRezervacijaBean(Rezervacija rezervacijaBean) {
		this.rezervacijaBean = rezervacijaBean;
	}

	public Znamenitost getZnamenitostBean() {
		return this.znamenitostBean;
	}

	public void setZnamenitostBean(Znamenitost znamenitostBean) {
		this.znamenitostBean = znamenitostBean;
	}

}