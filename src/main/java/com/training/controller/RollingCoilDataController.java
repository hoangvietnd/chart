package com.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.training.jpo.RollingCoilDataChart;
import com.training.service.RollingCoilDataService;

@Controller
public class RollingCoilDataController {
    @Autowired
    RollingCoilDataService service;

    @GetMapping("/list-by-coil-no/{coilNo}")
    public String showData(@PathVariable(value = "coilNo") String coilNo, Model model) {
        List<RollingCoilDataChart> list = service.getAllDataByCoilNo(coilNo);
        model.addAttribute("coilData", list);
        //model.addAttribute("employee", new Employee(47L,"Rajesh","Kawali","rajeshkawali@gmail.com"));
        return "listCoil";
    }
}
