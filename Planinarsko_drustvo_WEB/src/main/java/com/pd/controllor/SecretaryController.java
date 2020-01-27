package com.pd.controllor;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pd.repository.ClanarinaRepository;
import com.pd.repository.OsobaRepository;
import com.pd.repository.PlaninaRepository;
import com.pd.repository.PlaninarskoDrustvoRepository;
import com.pd.repository.PosjetaRepository;
import com.pd.repository.RezervacijaRepository;
import com.pd.repository.UlogaRepository;
import com.pd.repository.ZnamenitostRepository;
import com.pd.wrapper_classes.OsobaClanarina;
import com.pd.wrapper_classes.Statistics;

import model.Clanarina;
import model.Osoba;
import model.Planina;
import model.PlaninarskoDrustvo;
import model.Posjeta;
import model.Rezervacija;
import model.Uloga;
import model.Znamenitost;

@Controller
@RequestMapping(value = "/secretaryController")
public class SecretaryController {

	@Autowired
	private OsobaRepository osobaRepository;

	@Autowired
	private ClanarinaRepository clanarinaRepository;

	@Autowired
	private UlogaRepository ulogaRepository;

	@Autowired
	private PlaninarskoDrustvoRepository pdRepository;

	@Autowired
	private PlaninaRepository planinaRepository;

	@Autowired
	private RezervacijaRepository rezervacijaRepository;
	
	@Autowired
	private PosjetaRepository posjetaRepository;

	@Autowired
	private ZnamenitostRepository znamenitostRepository;

	@RequestMapping(value = "/getUsers")
	public String getAllUsers(HttpServletRequest request) {
		List<Osoba> osobe = osobaRepository.findOsobeByRole("planinar");
		List<Clanarina> clanarine = clanarinaRepository.findAll();
		List<OsobaClanarina> joinedLists = new ArrayList<>();
		for (Clanarina clanarina : clanarine) {
			for (Osoba osoba : osobe) {
				if (osoba.getOsobaId() == clanarina.getOsoba1().getOsobaId()) {
					OsobaClanarina oc = new OsobaClanarina();
					oc.setOsoba(osoba);
					oc.setClanarina(clanarina);
					joinedLists.add(oc);
				}
			}
		}
		request.getSession().setAttribute("users", joinedLists);
		return "secretary/extensionMembership";
	}

	@RequestMapping(value = "/membershipExtension", method = RequestMethod.GET)
	public String extendMembership(String osobaId, HttpServletRequest request) {
		Integer id = Integer.parseInt(osobaId);
		Osoba oosoba = osobaRepository.findById(id).get();
		Clanarina clanarina = clanarinaRepository.findClanarinaByUserId(id);
		OsobaClanarina oc = new OsobaClanarina();
		oc.setOsoba(oosoba);
		oc.setClanarina(clanarina);
		request.getSession().setAttribute("extensionUser", oc);
		return "secretary/extensionMembership";
	}

	@RequestMapping(value = "/updateMembership", method = RequestMethod.POST)
	public void updateMembership(String userId, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		Integer id = Integer.parseInt(userId);
		Clanarina clanarina = clanarinaRepository.findClanarinaByUserId(id);

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 365);
		Date futureDate = cal.getTime();
		Date nowDate = new Date();
		Osoba secretary = (Osoba) request.getSession().getAttribute("osoba");
		clanarina.setOdDatum(nowDate);
		clanarina.setDoDatum(futureDate);
		clanarina.setOsoba2(secretary);
		clanarinaRepository.flush();
		response.sendRedirect("../secretaryController/getUsers");
	}

	@RequestMapping(value = "/addNewMember", method = RequestMethod.POST)
	public void addNewMember(String name, String surname, String jmbg, String birthDate, String phone, String password,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		Osoba osoba = new Osoba();
		osoba.setIme(name);
		osoba.setPrezime(surname);
		osoba.setDatumRodjenja(new SimpleDateFormat("yyyy-mm-dd").parse(birthDate));
		osoba.setJmbg(jmbg);
		osoba.setBrojTelefona(phone);
		osoba.setPassword(password);

		Uloga uloga = ulogaRepository.findById(1).get();
		osoba.setUlogaBean(uloga);

		Osoba savedOsoba = osobaRepository.save(osoba);

		osobaRepository.flush();

		Clanarina c = new Clanarina();

		c.setOdDatum(new Date());

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 365);
		Date future = cal.getTime();
		c.setDoDatum(future);

		float price = 8400.0f;
		c.setIznos(price);

		c.setOsoba1(savedOsoba);
		Osoba sekretar = (Osoba) request.getSession().getAttribute("osoba");
		c.setOsoba2(sekretar);

		PlaninarskoDrustvo pd = pdRepository.findById(1).get();
		c.setPlaninarskoDrustvoBean(pd);
		clanarinaRepository.save(c);
		clanarinaRepository.flush();
		response.sendRedirect("../secretaryController/getUsers");
	}

	@RequestMapping(value = "/getStatistics", method = RequestMethod.GET)
	public String getStatisticsByMountain(HttpServletRequest request) {
		List<Planina> planine = planinaRepository.findAll();
		List<Statistics> stat = new ArrayList<Statistics>();
		List<Rezervacija> rezervacije = rezervacijaRepository.findAll();
		for (Planina planina : planine) {
			int nights = 0;
			for (Rezervacija rez : rezervacije) {
				if (rez.getOdDatum().compareTo(new Date()) > 0) {
					if (rez.getPlaninarskiDomBean().getPlaninaBean().getPlaninaId() == planina.getPlaninaId()) {
						long difference = rez.getDoDatum().getTime() - rez.getOdDatum().getTime();
						long daysbetween = (difference / (1000 * 60 * 60 * 24));
						nights += daysbetween;
					}
				}
			}
			Statistics s = new Statistics();
			s.setNightsReserved(nights);
			s.setPlanina(planina);
			stat.add(s);
		}
		request.getSession().setAttribute("statistics", stat);
		return "secretary/mountainStatistics";
	}

	@RequestMapping(value = "/getSights")
	public String getSights(HttpServletRequest request) {
		List<Znamenitost> sights = znamenitostRepository.findAll();
		request.getSession().setAttribute("sights", sights);
		return "secretary/sightReservated";
	}
	
	@RequestMapping(value = "/getVisitDates", method = RequestMethod.POST)
	public String getVisitDates(String sight, HttpServletRequest request) {
		Integer sightInt = Integer.parseInt(sight);
		List<Posjeta> visitDates = posjetaRepository.findPosjetaByZnamenitost(sightInt);
		request.getSession().setAttribute("visitDates", visitDates);
		return "secretary/sightReservated";
	}

}
