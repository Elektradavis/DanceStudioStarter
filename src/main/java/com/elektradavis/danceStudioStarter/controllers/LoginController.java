package com.elektradavis.danceStudioStarter.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.elektradavis.danceStudioStarter.models.LoginUser;
import com.elektradavis.danceStudioStarter.models.DanceClass;
import com.elektradavis.danceStudioStarter.models.User;
import com.elektradavis.danceStudioStarter.services.DanceClassService;
import com.elektradavis.danceStudioStarter.services.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired DanceClassService danceclass;
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		
		User user = userServ.login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		
		session.setAttribute("userId", user.getId());
		
		return "redirect:/classes";
	 }
	
	@GetMapping("/classes")
	public String shows(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");		
		if(userId==null) {
			return "redirect:/";
		}		
		User user = userServ.findByID(userId);
		model.addAttribute("user", user);
		
		List<DanceClass> danceClassList = danceclass.findAll();
		model.addAttribute("danceClassList", danceClassList);	
		
		return "dashboard.jsp";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
		return "redirect:/";
	 }	
}


