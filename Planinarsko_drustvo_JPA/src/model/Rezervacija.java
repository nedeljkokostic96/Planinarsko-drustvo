package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the rezervacija database table.
 * 
 */
@Entity
@NamedQuery(name="Rezervacija.findAll", query="SELECT r FROM Rezervacija r")
public class Rezervacija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="rezervacija_id")
	private int rezervacijaId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="do_datum")
	private Date doDatum;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="od_datum")
	private Date odDatum;

	//bi-directional many-to-one association to Iskustvo
	@OneToMany(mappedBy="rezervacijaBean")
	private List<Iskustvo> iskustvos;

	//bi-directional many-to-one association to Posjeta
	@OneToMany(mappedBy="rezervacijaBean")
	private List<Posjeta> posjetas;

	//bi-directional many-to-one association to Osoba
	@ManyToOne
	@JoinColumn(name="osoba")
	private Osoba osobaBean;

	//bi-directional many-to-one association to PlaninarskiDom
	@ManyToOne
	@JoinColumn(name="planinarski_dom")
	private PlaninarskiDom planinarskiDomBean;

	public Rezervacija() {
	}

	public int getRezervacijaId() {
		return this.rezervacijaId;
	}

	public void setRezervacijaId(int rezervacijaId) {
		this.rezervacijaId = rezervacijaId;
	}

	public Date getDoDatum() {
		return this.doDatum;
	}

	public void setDoDatum(Date doDatum) {
		this.doDatum = doDatum;
	}

	public Date getOdDatum() {
		return this.odDatum;
	}

	public void setOdDatum(Date odDatum) {
		this.odDatum = odDatum;
	}

	public List<Iskustvo> getIskustvos() {
		return this.iskustvos;
	}

	public void setIskustvos(List<Iskustvo> iskustvos) {
		this.iskustvos = iskustvos;
	}

	public Iskustvo addIskustvo(Iskustvo iskustvo) {
		getIskustvos().add(iskustvo);
		iskustvo.setRezervacijaBean(this);

		return iskustvo;
	}

	public Iskustvo removeIskustvo(Iskustvo iskustvo) {
		getIskustvos().remove(iskustvo);
		iskustvo.setRezervacijaBean(null);

		return iskustvo;
	}

	public List<Posjeta> getPosjetas() {
		return this.posjetas;
	}

	public void setPosjetas(List<Posjeta> posjetas) {
		this.posjetas = posjetas;
	}

	public Posjeta addPosjeta(Posjeta posjeta) {
		getPosjetas().add(posjeta);
		posjeta.setRezervacijaBean(this);

		return posjeta;
	}

	public Posjeta removePosjeta(Posjeta posjeta) {
		getPosjetas().remove(posjeta);
		posjeta.setRezervacijaBean(null);

		return posjeta;
	}

	public Osoba getOsobaBean() {
		return this.osobaBean;
	}

	public void setOsobaBean(Osoba osobaBean) {
		this.osobaBean = osobaBean;
	}

	public PlaninarskiDom getPlaninarskiDomBean() {
		return this.planinarskiDomBean;
	}

	public void setPlaninarskiDomBean(PlaninarskiDom planinarskiDomBean) {
		this.planinarskiDomBean = planinarskiDomBean;
	}

}