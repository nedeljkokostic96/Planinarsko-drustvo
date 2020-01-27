package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the planinarski_dom database table.
 * 
 */
@Entity
@Table(name="planinarski_dom")
@NamedQuery(name="PlaninarskiDom.findAll", query="SELECT p FROM PlaninarskiDom p")
public class PlaninarskiDom implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="planinarski_dom_id")
	private int planinarskiDomId;

	private String naziv;

	//bi-directional many-to-one association to Planina
	@ManyToOne
	@JoinColumn(name="planina")
	private Planina planinaBean;

	//bi-directional many-to-one association to PlaninarskoDrustvo
	@ManyToOne
	@JoinColumn(name="planinarsko_drustvo")
	private PlaninarskoDrustvo planinarskoDrustvoBean;

	//bi-directional many-to-one association to Rezervacija
	@OneToMany(mappedBy="planinarskiDomBean")
	private List<Rezervacija> rezervacijas;

	public PlaninarskiDom() {
	}

	public int getPlaninarskiDomId() {
		return this.planinarskiDomId;
	}

	public void setPlaninarskiDomId(int planinarskiDomId) {
		this.planinarskiDomId = planinarskiDomId;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public Planina getPlaninaBean() {
		return this.planinaBean;
	}

	public void setPlaninaBean(Planina planinaBean) {
		this.planinaBean = planinaBean;
	}

	public PlaninarskoDrustvo getPlaninarskoDrustvoBean() {
		return this.planinarskoDrustvoBean;
	}

	public void setPlaninarskoDrustvoBean(PlaninarskoDrustvo planinarskoDrustvoBean) {
		this.planinarskoDrustvoBean = planinarskoDrustvoBean;
	}

	public List<Rezervacija> getRezervacijas() {
		return this.rezervacijas;
	}

	public void setRezervacijas(List<Rezervacija> rezervacijas) {
		this.rezervacijas = rezervacijas;
	}

	public Rezervacija addRezervacija(Rezervacija rezervacija) {
		getRezervacijas().add(rezervacija);
		rezervacija.setPlaninarskiDomBean(this);

		return rezervacija;
	}

	public Rezervacija removeRezervacija(Rezervacija rezervacija) {
		getRezervacijas().remove(rezervacija);
		rezervacija.setPlaninarskiDomBean(null);

		return rezervacija;
	}

}