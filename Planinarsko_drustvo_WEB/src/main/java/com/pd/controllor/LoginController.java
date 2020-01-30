package com.pd.controllor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pd.repository.OsobaRepository;
import com.pd.security.UserRole;

import model.Osoba;

@Controller
@RequestMapping(value = "/loginController")
public class LoginController {

	@Autowired
	private OsobaRepository osobaRepository;

	@RequestMapping(value = "/isLoggedOsoba")
	public String loggedOsoba(HttpServletRequest request) {
		UserRole user = (UserRole)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		if (user != null) {
			Osoba osoba = osobaRepository.findOsobaByJmbgAndPassword(user.getUsername(), user.getPassword());
			if (request.getSession().getAttribute("osoba") == null) {
				request.getSession().setAttribute("osoba", osoba);
			}
			return user.getRole().getNaziv().equals("planinar") ? "user/indexUser" : "secretary/indexSecretary";
		}
		else {
			return "login";
		}
	}

	/*@RequestMapping(value = "/logIn", method = RequestMethod.POST)//Ne treba vise
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
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(jmbg, password);
			SecurityContextHolder.getContext().setAuthentication(authRequest);
			return osoba.getUlogaBean().getNaziv().equals("planinar") ? "user/indexUser"
					: "secretary/indexSecretary";
		} else {
			return "login";
		}
	}*/

	@RequestMapping(value = "/logOut")
	public String destroySession(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("osoba") != null) {
			request.getSession().removeAttribute("osoba");
			request.getSession().invalidate();
		}
		
		try {
			SecurityContextHolder.getContext().setAuthentication(null);
		}catch(Exception ex) {
			System.out.println("Failed to logout user.");
			ex.printStackTrace();
		}
		
		return "login";
	}
}
