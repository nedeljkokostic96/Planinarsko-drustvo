package com.pd.controllor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pd.repository.OsobaRepository;

import model.Osoba;

@Controller
@RequestMapping(value = "/loginController")
public class LoginController {

	@Autowired
	private OsobaRepository osobaRepository;

	@RequestMapping(value = "/isLoggedOsoba")
	public String loggedOsoba(HttpServletRequest request) {
		Osoba osoba = (Osoba) request.getSession().getAttribute("osoba");
		if (osoba == null) {
			return "login";
		} else {
			return osoba.getUlogaBean().getNaziv().equals("planinar") ? "user/indexUser" : "secretary/indexSecretary";
		}
	}

	@RequestMapping(value = "/logIn", method = RequestMethod.POST)
	public String checkOsoba(String jmbg, String password, HttpServletRequest request) {
		if (jmbg == null || password == null) {
			return "login";
		}
		// System.err.println();
		// Principal principal = request.getUserPrincipal();
		// String jmbgKorisnika = principal.getName();
		// Osoba osoba = osobaRepository.findOsobaByJMBG(jmbgKorisnika);
		Osoba osoba = osobaRepository.findOsobaByJmbgAndPassword(jmbg, password);
		if (osoba != null && osoba.getPassword().equals(password)) {
			request.getSession().setAttribute("osoba", osoba);
			return osoba.getUlogaBean().getNaziv().equals("planinar") ? "user/indexUser"
					: "secretary/indexSecretary";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/logOut")
	public String destroySession(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("osoba") != null) {
			request.getSession().removeAttribute("osoba");
			request.getSession().invalidate();
		}
		for (Cookie cookie : request.getCookies()) {
			cookie.setMaxAge(-1);
		}
		return "login";
	}

//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//    public String logout() {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		
//		if (auth != null) {
//			SecurityContextHolder.getContext().setAuthentication(null);
//		}
//		
//		return "redirect:/login";
//	}

}
