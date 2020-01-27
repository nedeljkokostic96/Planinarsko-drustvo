package com.pd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Posjeta;

public interface PosjetaRepository extends JpaRepository<Posjeta, Integer> {
	
	@Query("SELECT p FROM Posjeta p WHERE p.znamenitostBean.znamenitostId = :znamenitostId")
	public List<Posjeta> findPosjetaByZnamenitost(@Param("znamenitostId") Integer id);
	
}
