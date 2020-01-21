package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the planinarsko_drustvo database table.
 * 
 */
@Entity
@Table(name="planinarsko_drustvo")
@NamedQuery(name="PlaninarskoDrustvo.findAll", query="SELECT p FROM PlaninarskoDrustvo p")
public class PlaninarskoDrustvo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="planinarsko_drustvo_id")
	private int planinarskoDrustvoId;

	private String adresa;

	private String naziv;

	private String telefon;

	//bi-directional many-to-one association to Clanarina
	@OneToMany(mappedBy="planinarskoDrustvoBean")
	private List<Clanarina> clanarinas;

	//bi-directional many-to-one association to PlaninarskiDom
	@OneToMany(mappedBy="planinarskoDrustvoBean")
	private List<PlaninarskiDom> planinarskiDoms;

	public PlaninarskoDrustvo() {
	}

	public int getPlaninarskoDrustvoId() {
		return this.planinarskoDrustvoId;
	}

	public void setPlaninarskoDrustvoId(int planinarskoDrustvoId) {
		this.planinarskoDrustvoId = planinarskoDrustvoId;
	}

	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getTelefon() {
		return this.telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public List<Clanarina> getClanarinas() {
		return this.clanarinas;
	}

	public void setClanarinas(List<Clanarina> clanarinas) {
		this.clanarinas = clanarinas;
	}

	public Clanarina addClanarina(Clanarina clanarina) {
		getClanarinas().add(clanarina);
		clanarina.setPlaninarskoDrustvoBean(this);

		return clanarina;
	}

	public Clanarina removeClanarina(Clanarina clanarina) {
		getClanarinas().remove(clanarina);
		clanarina.setPlaninarskoDrustvoBean(null);

		return clanarina;
	}

	public List<PlaninarskiDom> getPlaninarskiDoms() {
		return this.planinarskiDoms;
	}

	public void setPlaninarskiDoms(List<PlaninarskiDom> planinarskiDoms) {
		this.planinarskiDoms = planinarskiDoms;
	}

	public PlaninarskiDom addPlaninarskiDom(PlaninarskiDom planinarskiDom) {
		getPlaninarskiDoms().add(planinarskiDom);
		planinarskiDom.setPlaninarskoDrustvoBean(this);

		return planinarskiDom;
	}

	public PlaninarskiDom removePlaninarskiDom(PlaninarskiDom planinarskiDom) {
		getPlaninarskiDoms().remove(planinarskiDom);
		planinarskiDom.setPlaninarskoDrustvoBean(null);

		return planinarskiDom;
	}

}