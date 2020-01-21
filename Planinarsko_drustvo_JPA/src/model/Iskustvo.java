package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the iskustvo database table.
 * 
 */
@Entity
@NamedQuery(name="Iskustvo.findAll", query="SELECT i FROM Iskustvo i")
public class Iskustvo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="iskustvo_id")
	private int iskustvoId;

	@Lob
	private String iskustvo;

	//bi-directional many-to-one association to Rezervacija
	@ManyToOne
	@JoinColumn(name="rezervacija")
	private Rezervacija rezervacijaBean;

	//bi-directional many-to-one association to Slika
	@OneToMany(mappedBy="iskustvoBean")
	private List<Slika> slikas;

	public Iskustvo() {
	}

	public int getIskustvoId() {
		return this.iskustvoId;
	}

	public void setIskustvoId(int iskustvoId) {
		this.iskustvoId = iskustvoId;
	}

	public String getIskustvo() {
		return this.iskustvo;
	}

	public void setIskustvo(String iskustvo) {
		this.iskustvo = iskustvo;
	}

	public Rezervacija getRezervacijaBean() {
		return this.rezervacijaBean;
	}

	public void setRezervacijaBean(Rezervacija rezervacijaBean) {
		this.rezervacijaBean = rezervacijaBean;
	}

	public List<Slika> getSlikas() {
		return this.slikas;
	}

	public void setSlikas(List<Slika> slikas) {
		this.slikas = slikas;
	}

	public Slika addSlika(Slika slika) {
		getSlikas().add(slika);
		slika.setIskustvoBean(this);

		return slika;
	}

	public Slika removeSlika(Slika slika) {
		getSlikas().remove(slika);
		slika.setIskustvoBean(null);

		return slika;
	}

}