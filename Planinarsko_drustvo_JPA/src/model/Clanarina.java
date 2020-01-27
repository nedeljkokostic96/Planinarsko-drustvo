package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the clanarina database table.
 * 
 */
@Entity
@NamedQuery(name="Clanarina.findAll", query="SELECT c FROM Clanarina c")
public class Clanarina implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="clanarina_id")
	private int clanarinaId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="do_datum")
	private Date doDatum;

	private float iznos;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="od_datum")
	private Date odDatum;

	//bi-directional many-to-one association to Osoba
	@ManyToOne
	@JoinColumn(name="planinar")
	private Osoba osoba1;

	//bi-directional many-to-one association to Osoba
	@ManyToOne
	@JoinColumn(name="sekretar")
	private Osoba osoba2;

	//bi-directional many-to-one association to PlaninarskoDrustvo
	@ManyToOne
	@JoinColumn(name="planinarsko_drustvo")
	private PlaninarskoDrustvo planinarskoDrustvoBean;

	public Clanarina() {
	}

	public int getClanarinaId() {
		return this.clanarinaId;
	}

	public void setClanarinaId(int clanarinaId) {
		this.clanarinaId = clanarinaId;
	}

	public Date getDoDatum() {
		return this.doDatum;
	}

	public void setDoDatum(Date doDatum) {
		this.doDatum = doDatum;
	}

	public float getIznos() {
		return this.iznos;
	}

	public void setIznos(float iznos) {
		this.iznos = iznos;
	}

	public Date getOdDatum() {
		return this.odDatum;
	}

	public void setOdDatum(Date odDatum) {
		this.odDatum = odDatum;
	}

	public Osoba getOsoba1() {
		return this.osoba1;
	}

	public void setOsoba1(Osoba osoba1) {
		this.osoba1 = osoba1;
	}

	public Osoba getOsoba2() {
		return this.osoba2;
	}

	public void setOsoba2(Osoba osoba2) {
		this.osoba2 = osoba2;
	}

	public PlaninarskoDrustvo getPlaninarskoDrustvoBean() {
		return this.planinarskoDrustvoBean;
	}

	public void setPlaninarskoDrustvoBean(PlaninarskoDrustvo planinarskoDrustvoBean) {
		this.planinarskoDrustvoBean = planinarskoDrustvoBean;
	}

}