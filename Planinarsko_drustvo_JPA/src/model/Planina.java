package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the planina database table.
 * 
 */
@Entity
@NamedQuery(name="Planina.findAll", query="SELECT p FROM Planina p")
public class Planina implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="planina_id")
	private int planinaId;

	private String drzava;

	private String naziv;

	//bi-directional many-to-one association to PlaninarskiDom
	@OneToMany(mappedBy="planinaBean")
	private List<PlaninarskiDom> planinarskiDoms;

	//bi-directional many-to-one association to Staza
	@OneToMany(mappedBy="planinaBean")
	private List<Staza> stazas;

	public Planina() {
	}

	public int getPlaninaId() {
		return this.planinaId;
	}

	public void setPlaninaId(int planinaId) {
		this.planinaId = planinaId;
	}

	public String getDrzava() {
		return this.drzava;
	}

	public void setDrzava(String drzava) {
		this.drzava = drzava;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<PlaninarskiDom> getPlaninarskiDoms() {
		return this.planinarskiDoms;
	}

	public void setPlaninarskiDoms(List<PlaninarskiDom> planinarskiDoms) {
		this.planinarskiDoms = planinarskiDoms;
	}

	public PlaninarskiDom addPlaninarskiDom(PlaninarskiDom planinarskiDom) {
		getPlaninarskiDoms().add(planinarskiDom);
		planinarskiDom.setPlaninaBean(this);

		return planinarskiDom;
	}

	public PlaninarskiDom removePlaninarskiDom(PlaninarskiDom planinarskiDom) {
		getPlaninarskiDoms().remove(planinarskiDom);
		planinarskiDom.setPlaninaBean(null);

		return planinarskiDom;
	}

	public List<Staza> getStazas() {
		return this.stazas;
	}

	public void setStazas(List<Staza> stazas) {
		this.stazas = stazas;
	}

	public Staza addStaza(Staza staza) {
		getStazas().add(staza);
		staza.setPlaninaBean(this);

		return staza;
	}

	public Staza removeStaza(Staza staza) {
		getStazas().remove(staza);
		staza.setPlaninaBean(null);

		return staza;
	}

}