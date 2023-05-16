package com.elektradavis.danceStudioStarter.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.elektradavis.danceStudioStarter.models.DanceClass;

@Repository
public interface DanceClassRepository extends CrudRepository<DanceClass, Long> {
	List<DanceClass> findAll();

}