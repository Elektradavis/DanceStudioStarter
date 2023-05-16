package com.elektradavis.danceStudioStarter.controllers;

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
import com.elektradavis.danceStudioStarter.models.User;
import com.elektradavis.danceStudioStarter.services.UserService;

@Controller
public class RegistrationController {
 
  @Autowired
  private UserService userServ;
  
  @GetMapping("/")
  public String index(Model model) {
	  model.addAttribute("newUser", new User());
	  model.addAttribute("newLogin", new LoginUser());
	  return "index.jsp";
  }
  
  @PostMapping("/register")
  public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) { 
	  
	  userServ.register(newUser, result);
	  
	  if(result.hasErrors()) {
		  model.addAttribute("newLogin", new LoginUser());
		  return "index.jsp";
	  }
	  
	  session.setAttribute("userId", newUser.getId());
	  
	  return "redirect:/classes";
 }
 
}
