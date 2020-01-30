package com.pd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Rezervacija;

public interface RezervacijaRepository extends JpaRepository<Rezervacija, Integer> {
	
	@Query("SELECT r FROM Rezervacija r WHERE r.osobaBean.osobaId = :osobaId")
	public List<Rezervacija> findReservationsByOsobaId(@Param("osobaId") Integer osobaId);
	
}
