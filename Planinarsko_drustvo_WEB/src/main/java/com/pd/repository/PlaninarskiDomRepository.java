package com.pd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.PlaninarskiDom;

public interface PlaninarskiDomRepository extends JpaRepository<PlaninarskiDom, Integer> {
	
	@Query("SELECT pd FROM PlaninarskiDom pd WHERE pd.planinaBean.planinaId = :planinaId")
	public List<PlaninarskiDom> findPlaninarskiDomByPlanina(@Param("planinaId") Integer planinaId);
	
}
