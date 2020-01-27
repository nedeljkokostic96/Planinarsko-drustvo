package com.pd.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity(debug = true)
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
    @Qualifier("customUserDetailsService")
    UserDetailsService userDetailsService;
   
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	      auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());
		   
	}
////   
  @Bean
   public BCryptPasswordEncoder getPasswordEncoder() {
       BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
       return passwordEncoder;
    }
   
  
    @Override
	protected void configure(HttpSecurity http) throws Exception {
			http
				.authorizeRequests()
				.antMatchers("/loginController/**")
				.permitAll()
				.antMatchers("user/userController/**")
				.hasAnyRole("planinar")
				.antMatchers("secretary/secretaryController/**")
				.hasRole("sekretar")
				.anyRequest().authenticated()
				.and()
				.formLogin()   
				.loginPage("/loginController/login") 
				.permitAll()
				.loginProcessingUrl("/login")
				.defaultSuccessUrl("/loginController/logIn", true)
			    .and().logout()
				.logoutUrl("/perform_logout")
				.invalidateHttpSession(true) ;
		}
	
}
