package com.pd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Osoba;

public interface OsobaRepository extends JpaRepository<Osoba, Integer> {
	
	@Query("SELECT o FROM Osoba o WHERE o.jmbg = :jmbg AND o.password = :password")
	public Osoba findOsobaByJmbgAndPassword(@Param("jmbg") String jmbg, @Param("password") String password);
	
	@Query("SELECT o FROM Osoba o WHERE o.ulogaBean.naziv = :role")
	public List<Osoba> findOsobeByRole(@Param("role") String role);
	
	@Query("SELECT o FROM Osoba o WHERE o.jmbg = :jmbg")
	public Osoba findOsobaByJMBG(@Param("jmbg") String jmbg);
	
}
