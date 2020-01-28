package com.pd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.Staza;

public interface StazaRepository extends JpaRepository<Staza, Integer> {
	
	@Query("SELECT s FROM Staza s WHERE s.planinaBean.planinaId = :planinaId")
	public List<Staza> findStazeByPlanina(Integer planinaId);
	
}
