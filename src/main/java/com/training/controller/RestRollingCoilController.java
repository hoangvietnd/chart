package com.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.training.entity.RollingCoil;
import com.training.service.RollingCoilService;

@RestController
@RequestMapping("api")
public class RestRollingCoilController {

	@Autowired
	RollingCoilService service;

	@GetMapping("/coil/list")
	public List<RollingCoil> showEmployee(Model model) {
		List<RollingCoil> list = service.getAllRollingCoils();
		model.addAttribute("coil", service.getAllRollingCoils());
		//model.addAttribute("employee", new Employee(47L,"Rajesh","Kawali","rajeshkawali@gmail.com"));
		return list;
	}
}
