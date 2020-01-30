package com.pd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Iskustvo;

public interface IskustvoRepository extends JpaRepository<Iskustvo, Integer> {
	
	@Query("SELECT i FROM Iskustvo i WHERE i.rezervacijaBean.planinarskiDomBean.planinaBean.planinaId = :planinaId")
	public List<Iskustvo> findIskustvaByPlanina(@Param("planinaId") Integer planinaId);
	
	
}
