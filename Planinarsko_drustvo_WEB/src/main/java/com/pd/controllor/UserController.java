package com.pd.controllor;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.pd.repository.IskustvoRepository;
import com.pd.repository.PlaninaRepository;
import com.pd.repository.PlaninarskiDomRepository;
import com.pd.repository.PosjetaRepository;
import com.pd.repository.RezervacijaRepository;
import com.pd.repository.SlikaRepository;
import com.pd.repository.StazaRepository;
import com.pd.repository.ZnamenitostRepository;
import com.pd.wrapper_classes.MountainExperiences;

import model.Iskustvo;
import model.Osoba;
import model.Planina;
import model.PlaninarskiDom;
import model.Posjeta;
import model.Rezervacija;
import model.Slika;
import model.Staza;
import model.Znamenitost;

@Controller
@RequestMapping(value = "/userController")
public class UserController {

	@Autowired
	private PlaninaRepository planinaRepository;

	@Autowired
	private ZnamenitostRepository znamenitostRepository;
	
	@Autowired
	private RezervacijaRepository rezervacijaRepository;
	
	@Autowired 
	private IskustvoRepository iskustvoRepository;
	
	@Autowired
	private SlikaRepository slikaRepository;
	
	@Autowired
	private PosjetaRepository posjetaRepository;

	@Autowired
	private PlaninarskiDomRepository pdRepository;
	
	@Autowired
	private StazaRepository stazaRepository;
	
	@RequestMapping(value = "/trailDetails")
	public String trailDetails(String stazaId, HttpServletRequest request) {
		try{
			Integer stint = Integer.parseInt(stazaId);
			Staza s = stazaRepository.findById(stint).get();
			request.getSession().setAttribute("trailDetail", s);
			Osoba o = (Osoba)request.getSession().getAttribute("osoba");
			System.out.println("JMBG" + o.getJmbg());
			return "user/showTrailDetails";
		}catch (Exception e) {
			return "user/trailReviewPage";
		}
	}
	
	@RequestMapping("/getAllMountains")
	public String getAllMountains(HttpServletRequest request) {
		List<Planina> planine = planinaRepository.findAll();
		request.getSession().setAttribute("mountains", planine);
		return "user/experiences";
	}
	
	@RequestMapping(value = "/getMyReservations")
	public String getMyReservations(HttpServletRequest request) {
		Osoba osoba = (Osoba) request.getSession().getAttribute("osoba");
		if (osoba != null) {
			List<Rezervacija> reservations = rezervacijaRepository.findReservationsByOsobaId(osoba.getOsobaId());
			request.getSession().setAttribute("reservations", reservations);
		}
		return "user/experiences";
	}
	
	@RequestMapping(value = "/saveComment", method = RequestMethod.POST)
	public void saveComment(String posjetaId, String comment, HttpServletResponse response) throws IOException {
		for (int i = 0; i < 20; i++) {
			System.err.println("*******************************************************");
		}
		try {
			Integer posjetaIdInt = Integer.parseInt(posjetaId);
			Posjeta pos = posjetaRepository.findById(posjetaIdInt).get();
			if (pos != null) {
				pos.setKomentar(comment);
				posjetaRepository.flush();
			}
		} catch (Exception e) {
		}
		response.sendRedirect("../user/showTrailDetails.jsp");
	}
	
	@RequestMapping(value = "/checkComment", method = RequestMethod.GET)
	public String checkAllowedComm(String znamenitostId, HttpServletRequest request) {
		Integer znamIdInt = Integer.parseInt(znamenitostId);
		Osoba osoba = (Osoba) request.getSession().getAttribute("osoba");
		if (osoba != null) {
			Posjeta pos = posjetaRepository.findPosjetaByZnamenitostAndOsoba(znamIdInt, osoba.getOsobaId());
			request.setAttribute("commentAllowed", pos);
		}
		return "user/trailReviewPage";
	}
	
	@RequestMapping(value = "/getTrails")
	public String getTrails(String planinaId, HttpServletRequest request) {
		Integer planinaIdInt = Integer.parseInt(planinaId);
		List<Staza> trails = stazaRepository.findStazeByPlanina(planinaIdInt);
		request.getSession().setAttribute("trails", trails);
		return "user/trailReviewPage";
	}

	@RequestMapping(value = "/showTrail")
	public void showTrail(String stazaId, HttpServletRequest request, HttpServletResponse response) {
		Integer ids = Integer.parseInt(stazaId);
		Staza staza = stazaRepository.findById(ids).get();
		byte[] picture = staza.getMapa();
		response.setContentType(org.springframework.http.MediaType.APPLICATION_OCTET_STREAM_VALUE);
		try {
			response.getOutputStream().write(picture);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/trailReview")
	public String trailReview(HttpServletRequest request) {
		List<Planina> planine = planinaRepository.findAll();
		request.getSession().setAttribute("planineStaze", planine);
		return "user/trailReviewPage";
	}

	@RequestMapping(value = "/saveReservation", method = RequestMethod.POST)
	public String saveReservation(String planinarskiDomId, String reservationStart, String reservationEnd,
			String znamenitostId, String sightReservationDate, HttpServletRequest request) throws ParseException {
		if(planinarskiDomId == null && reservationStart == null && reservationEnd == null || znamenitostId == null || sightReservationDate == null) {
			return "user/reservation";
		}
		
		try {
			Integer planDomIdInt = Integer.parseInt(planinarskiDomId);
			Integer znamIdInt = Integer.parseInt(znamenitostId);
			
			PlaninarskiDom pd = pdRepository.findById(planDomIdInt).get();
			Znamenitost zn = znamenitostRepository.findById(znamIdInt).get();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			Date resStart = sdf.parse(reservationStart);
			Date resEnd = new Date(sdf.parse(reservationEnd).getTime());
			Date srd = new Date(sdf.parse(sightReservationDate).getTime());
			
			Rezervacija r = new Rezervacija();
			r.setOsobaBean((Osoba) request.getSession().getAttribute("osoba"));
			r.setOdDatum(resEnd);
			r.setDoDatum(resStart);
			r.setPlaninarskiDomBean(pd);
			Rezervacija res = rezervacijaRepository.save(r);
			
			Posjeta pos = new Posjeta();
			pos.setRezervacijaBean(res);
			pos.setZnamenitostBean(zn);
			pos.setTermin(srd);
			posjetaRepository.save(pos);
			return "user/indexUser";
		}catch (Exception e) {
			return "user/indexUser";
		}
	}

	@RequestMapping(value = "/chosePlanina", method = RequestMethod.GET)
	public String chosePlanina(String planinaId, HttpServletRequest request) {
		Integer id = Integer.parseInt(planinaId);
		List<PlaninarskiDom> domovi = pdRepository.findPlaninarskiDomByPlanina(id);
		List<Znamenitost> znamenitosti = znamenitostRepository.findZnamenitostiByPlanina(id);
		request.getSession().setAttribute("domovi", domovi);
		request.getSession().setAttribute("znamenitosti", znamenitosti);
		return "user/reservation";
	}

	@RequestMapping(value = "/getPlanine")
	public String getPlanine(HttpServletRequest request) {
		List<Planina> planine = planinaRepository.findAll();
		request.setAttribute("planine", planine);
		return "user/reservation";
	}
	
	@RequestMapping(value = "/getExperiences")
	public String getExperiencesAndMonutains(String planinaId, HttpServletRequest request) {
		Integer plid = Integer.parseInt(planinaId);
		Planina planina = planinaRepository.findById(plid).get();
		MountainExperiences me = new MountainExperiences();
		me.setPlanina(planina);
		me.setIskustva(iskustvoRepository.findIskustvaByPlanina(plid));
		request.getSession().setAttribute("experiences", me);
		return "user/experiences";
	}
	
	@RequestMapping(value = "/saveExperience", method = RequestMethod.POST)
	public void saveExperience(@Param("mpf") MultipartFile mpf, String reservation, String experienceText, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (mpf != null && experienceText != null) {
			Integer resInt = Integer.parseInt(reservation);
			Rezervacija rezervacija = rezervacijaRepository.findById(resInt).get();
			Iskustvo is = new Iskustvo();
			is.setIskustvo(experienceText);
			is.setRezervacijaBean(rezervacija);
			Iskustvo sacuvano = iskustvoRepository.save(is);
			Slika slika = new Slika();
			slika.setIskustvoBean(sacuvano);
			slika.setSlika(mpf.getBytes());
			slikaRepository.save(slika);
		}
		response.sendRedirect("../user/experiences.jsp");
	}

	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	public void getImage(@Param("slikaId") String slikaId, HttpServletRequest request, HttpServletResponse response){
		Integer ids = Integer.parseInt(slikaId);
		Slika slika = slikaRepository.findById(ids).get();
		byte[] picture = slika.getSlika();
		response.setContentType(org.springframework.http.MediaType.APPLICATION_OCTET_STREAM_VALUE);
		try {
			response.getOutputStream().write(picture);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
