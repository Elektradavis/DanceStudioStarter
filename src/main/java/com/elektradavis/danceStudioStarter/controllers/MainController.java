package com.elektradavis.danceStudioStarter.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.elektradavis.danceStudioStarter.models.DanceClass;
import com.elektradavis.danceStudioStarter.models.User;
import com.elektradavis.danceStudioStarter.services.DanceClassService;
import com.elektradavis.danceStudioStarter.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private DanceClassService danceClasses;

	@GetMapping("/classes/create")
	public String addDanceClass(@ModelAttribute("danceClass") DanceClass danceClass, Model model, HttpSession session) {
		User user = userServ.findByID((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "createClass.jsp";
	}
	
	@PostMapping("/newclass")
	public String newShow(@Valid @ModelAttribute("danceClass") DanceClass danceClass, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "createClass.jsp";
		}
		
		User user = userServ.findByID((Long)session.getAttribute("userId"));
		danceClass.setUser(user);
		danceClasses.create(danceClass);
		
		
		return "redirect:/classes";	
	}
	
	@GetMapping("/classes/view/{id}")
	public String details(Model model, @PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		DanceClass danceClass = danceClasses.findById(id);
		model.addAttribute("danceClass", danceClass);
		model.addAttribute("user", userServ.findByID((Long)session.getAttribute("userId")));
		
		return "viewClass.jsp";
	}
	
    @GetMapping("/edit/{id}")
    public String editClass(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		DanceClass danceClass = danceClasses.findById(id);
		model.addAttribute("danceClass", danceClass);
		model.addAttribute("user", userServ.findByID((Long)session.getAttribute("userId")));
		
		return "editClass.jsp";    	
    }
    
    @PostMapping("/edit")
    public String edit(@Valid @ModelAttribute("danceClass") DanceClass updatedDanceClass, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "editClass.jsp";
        }
        
        DanceClass existingDanceClass = danceClasses.findById(updatedDanceClass.getId());
        existingDanceClass.setTitle(updatedDanceClass.getTitle());
        existingDanceClass.setAge(updatedDanceClass.getAge());
        existingDanceClass.setStyle(updatedDanceClass.getStyle());
        existingDanceClass.setTeacher(updatedDanceClass.getTeacher());
        existingDanceClass.setDay(updatedDanceClass.getDay());
        existingDanceClass.setDescription(updatedDanceClass.getDescription());
        
        danceClasses.update(existingDanceClass);
        
        return "redirect:/classes";
    }
    
	@PostMapping("/classes/{id}/delete")
	public String deleteClass(@PathVariable("id") Long id) {
		danceClasses.delete(id);
		return "redirect:/classes";
		
	}    
    
}
