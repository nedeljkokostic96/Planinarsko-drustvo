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

import com.pd.repository.PlaninaRepository;
import com.pd.repository.PlaninarskiDomRepository;
import com.pd.repository.PosjetaRepository;
import com.pd.repository.RezervacijaRepository;
import com.pd.repository.ZnamenitostRepository;

import model.Osoba;
import model.Planina;
import model.PlaninarskiDom;
import model.Posjeta;
import model.Rezervacija;
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
	private PosjetaRepository posjetaRepository;

	@Autowired
	private PlaninarskiDomRepository pdRepository;
	
	@RequestMapping(value="/trailReview")
	public String trailReview(HttpServletRequest request) {
		List<Planina> planine = planinaRepository.findAll();
		request.getSession().setAttribute("planineStaze", planine);
		return "user/trailReviewPage";
	}

	@RequestMapping(value = "/saveReservation", method = RequestMethod.POST)
	public String saveReservation(String planinarskiDomId, String reservationStart, String reservationEnd,
			String znamenitostId, String sightReservationDate, HttpServletRequest request) throws ParseException {
		Integer planDomIdInt = Integer.parseInt(planinarskiDomId);
		Integer znamIdInt = Integer.parseInt(znamenitostId);
		
		PlaninarskiDom pd = pdRepository.findById(planDomIdInt).get();
		Znamenitost zn = znamenitostRepository.findById(znamIdInt).get();
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-mm-dd");
		Date resStart = sdf.parse(reservationStart);
		Date resEnd = sdf.parse(reservationEnd);
		Date srd = sdf.parse(sightReservationDate);
		
		Rezervacija r = new Rezervacija();
		r.setOsobaBean((Osoba) request.getSession().getAttribute("osoba"));
		r.setDoDatum(resEnd);
		r.setDoDatum(resStart);
		r.setPlaninarskiDomBean(pd);
		Rezervacija res = rezervacijaRepository.save(r);
		
		Posjeta pos = new Posjeta();
		pos.setRezervacijaBean(res);
		pos.setZnamenitostBean(zn);
		pos.setTermin(srd);
		posjetaRepository.save(pos);
		
		return "user/indexUser";
		
	}

	@RequestMapping(value = "/chosePlanina", method = RequestMethod.GET)
	public String chosePlanina(String planinaId, HttpServletRequest request) {
		Integer id = Integer.parseInt(planinaId);
		List<PlaninarskiDom> domovi = pdRepository.findPlaninarskiDomByPlanina(id);
		List<Znamenitost> znamenitosti = znamenitostRepository.findZnamenitostiByPlanina(id);
		System.out.println(domovi);
		System.out.println(znamenitosti);
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

	@RequestMapping(value = "/prikaziSliku", method = RequestMethod.POST)
	public String prikaziSliku(@Param("mpf") MultipartFile mpf, HttpServletRequest request) {
		request.getSession().setAttribute("mpf", mpf);
		return "user/portal";
	}

	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	public String getImage(@Param("mpf") String mpf, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		MultipartFile mf = (MultipartFile) request.getAttribute(mpf);
		byte[] picture = mf.getBytes();
		response.setContentType(org.springframework.http.MediaType.APPLICATION_OCTET_STREAM_VALUE);
		response.getOutputStream().write(picture);
		request.getSession().setAttribute("slika", null);
		return "user/portal";
	}
}
