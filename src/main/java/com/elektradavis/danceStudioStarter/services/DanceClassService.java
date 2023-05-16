package com.elektradavis.danceStudioStarter.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.elektradavis.danceStudioStarter.models.DanceClass;
import com.elektradavis.danceStudioStarter.repositories.DanceClassRepository;

@Service
public class DanceClassService {
	
	@Autowired
	private DanceClassRepository danceClassRepo;
	
	public DanceClass findById(Long id) {
		Optional<DanceClass> result = danceClassRepo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	
	public List<DanceClass> all(){
		return danceClassRepo.findAll();
	}
	
	public DanceClass create(DanceClass danceclass) {
		return danceClassRepo.save(danceclass);
	}	
	
	public List<DanceClass> findAll(){
		return danceClassRepo.findAll();
		
	}

	public DanceClass update(DanceClass existingClass) {
		return danceClassRepo.save(existingClass);
		
	}
	
	public void delete(Long id) {
		danceClassRepo.deleteById(id);
	}	

}
