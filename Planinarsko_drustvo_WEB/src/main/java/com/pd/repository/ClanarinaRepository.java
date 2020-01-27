package com.pd.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Clanarina;

public interface ClanarinaRepository extends JpaRepository<Clanarina, Integer> {
	
	@Query("SELECT c FROM Clanarina c WHERE c.osoba1.osobaId = :id")
	public Clanarina findClanarinaByUserId(@Param("id") Integer id);
	
}
