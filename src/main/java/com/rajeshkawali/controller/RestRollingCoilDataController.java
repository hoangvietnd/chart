package com.rajeshkawali.controller;

import com.rajeshkawali.entity.RollingCoilData;
import com.rajeshkawali.jpo.RollingCoilDataChart;
import com.rajeshkawali.service.RollingCoilDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/coil-data")
public class RestRollingCoilDataController {
    @Autowired
    public RollingCoilDataService service;

    @GetMapping("/")
    public String getAllRollingCoilData(Model model) {
        List<RollingCoilData> dataList = service.getAllData();
        model.addAttribute("data", dataList);
        return "demoIndex";
    }

    @GetMapping("/list-by-coil-no/{coilNo}")
    public List<RollingCoilDataChart> getRollingCoilByCoilId(@PathVariable(value = "coilNo") String coilNo) {
        List<RollingCoilDataChart> dataList = service.getAllDataByCoilNo(coilNo);
//        model.addAttribute("data", dataList);
        return dataList;
    }

    @GetMapping("/list-by-coil-no")
    public List<RollingCoilDataChart> getRollingCoilByCoilIdOnPage(@RequestParam("coilNo") String coilNo, @RequestParam("page") int page) {
        List<RollingCoilDataChart> dataList = service.getAllDataByCoilNoOnPage(coilNo, page);
//        model.addAttribute("data", dataList);
        return dataList;
    }
}
