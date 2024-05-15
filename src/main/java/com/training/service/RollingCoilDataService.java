package com.training.service;

import com.training.dao.RollingCoilDataRepository;
import com.training.entity.RollingCoilData;
import com.training.jpo.RollingCoilDataChart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class RollingCoilDataService {
    @Autowired
    RollingCoilDataRepository repository;

    public List<RollingCoilData> getAllData() {
        return repository.findAll();
    }

    public List<RollingCoilDataChart> getAllDataByCoilNo(String coilNo) {
        return convertToChart(repository.findByCoilNo(coilNo));
    }

    public List<RollingCoilDataChart> getAllDataByCoilNoOnPage(String coilNo, int page) {
        return convertToChart(repository.findByCoilNoOnPage(coilNo, PageRequest.of(page, 10)));
    }

    private List<RollingCoilDataChart> convertToChart(List<RollingCoilData> dataList) {
        return dataList.stream().map(this::constructDataChart).collect(Collectors.toList());
    }

    private RollingCoilDataChart constructDataChart(RollingCoilData data) {
        RollingCoilDataChart dataChart = new RollingCoilDataChart();
        dataChart.setCoilId(data.getCoilId());
        dataChart.setTime(data.getTime());
        dataChart.setSeq(data.getSeq());
        dataChart.setTemperature(data.getTemperature());
        dataChart.setThickness(data.getThickness());
        dataChart.setCoilNo(data.getRollingCoil().getCoilNo());
        return dataChart;
    }
}
