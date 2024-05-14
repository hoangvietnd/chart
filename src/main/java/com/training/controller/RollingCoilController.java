package com.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.training.entity.RollingCoil;
import com.training.service.RollingCoilService;

@Controller
public class RollingCoilController {

	@Autowired
	RollingCoilService service;

	@GetMapping("/coil")
	public String getAllEmployees(Model model) {
		List<RollingCoil> list = service.getAllRollingCoils();
		model.addAttribute("name", "Rajesh Kawali");
		//model.addAttribute("listEmployees", list);
		return "index";
	}

	@GetMapping("/coil/list")
	public String showRollingCoil(Model model) {
		List<RollingCoil> list = service.getAllRollingCoils();
		model.addAttribute("coil", service.getAllRollingCoils());
		//model.addAttribute("employee", new Employee(47L,"Rajesh","Kawali","rajeshkawali@gmail.com"));
		return "listCoil";
	}
	
}
