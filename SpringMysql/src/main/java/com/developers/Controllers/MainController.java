package com.developers.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.developers.Models.AppUsers;
import com.developers.Models.AppUsersRepo;

@Controller
public class MainController {
	
	@Autowired
	AppUsersRepo appRepo;
	
	@RequestMapping("*")
	public 	ModelAndView doHome() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("msg", "Lista de Usuarios");
		mv.addObject("lists", appRepo.findAll());
		return mv;
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public 	ModelAndView doSave(
			@RequestParam("id") String id,
			@RequestParam("firstname") String firstName,
			@RequestParam("lastname") String lastName) {
		ModelAndView mv = new ModelAndView("redirect:/");
		AppUsers users = new AppUsers();
		
		if(!id.isEmpty()) {
			users=(AppUsers)appRepo.findOne(Integer.parseInt(id));
		}else {
			users = new AppUsers();
		}
		users.setFirstName(firstName);
		users.setLastName(lastName);
		appRepo.save(users);
		return mv;
	}
	
	@RequestMapping(value="/view/{id}", method=RequestMethod.GET)
	public 	ModelAndView doView(@PathVariable("id")int id) {
		ModelAndView mv = new ModelAndView("view");
		mv.addObject("lists", appRepo.findOne(id));
		return mv;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public 	ModelAndView doDelete(@PathVariable("id")int id) {
		ModelAndView mv = new ModelAndView("redirect:/");
		appRepo.delete(id);
		return mv;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public 	ModelAndView doEdit(@PathVariable("id")int id) {
		ModelAndView mv = new ModelAndView("edit");
		mv.addObject("lists", appRepo.findOne(id));
		return mv;
	}

}
