package com.pd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Znamenitost;

public interface ZnamenitostRepository extends JpaRepository<Znamenitost, Integer> {
	
	@Query("SELECT z FROM Znamenitost z WHERE z.stazaBean.planinaBean.planinaId = :planinaId ")
	public List<Znamenitost> findZnamenitostiByPlanina(@Param("planinaId") Integer planinaId);
	
}
