package com.rajeshkawali.service;

import com.rajeshkawali.dao.RollingCoilDataRepository;
import com.rajeshkawali.entity.RollingCoilData;
import com.rajeshkawali.jpo.RollingCoilDataChart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RollingCoilDataService {
    @Autowired
    RollingCoilDataRepository repository;

    public List<RollingCoilData> getAllData() {
        List<RollingCoilData> dataList = repository.findAll();
        if (!dataList.isEmpty()) {
            return dataList;
        } else {
            return new ArrayList<RollingCoilData>();
        }
    }

    public List<RollingCoilDataChart> getAllDataByCoilNo(String coilNo) {
        List<RollingCoilData> dataList = repository.findByCoilNo(coilNo);
        List<RollingCoilDataChart> results = new ArrayList<RollingCoilDataChart>();
        if (!dataList.isEmpty()) {
            for (RollingCoilData data : dataList) {
                RollingCoilDataChart dataChart = new RollingCoilDataChart();
                dataChart.setCoilId(data.getCoilId());
                dataChart.setTime(data.getTime());
                dataChart.setSeq(data.getSeq());
                dataChart.setTemperature(data.getTemperature());
                dataChart.setThickness(data.getThickness());
                dataChart.setCoilNo(data.getRollingCoil().getCoilNo());
                results.add(dataChart);
            }
        }
        return results;
    }

    public List<RollingCoilDataChart> getAllDataByCoilNoOnPage(String coilNo, int page) {
        List<RollingCoilData> dataList = repository.findByCoilNoOnPage(coilNo, PageRequest.of(page, 10));
        List<RollingCoilDataChart> results = new ArrayList<RollingCoilDataChart>();
        if (!dataList.isEmpty()) {
            for (RollingCoilData data : dataList) {
                RollingCoilDataChart dataChart = new RollingCoilDataChart();
                dataChart.setCoilId(data.getCoilId());
                dataChart.setTime(data.getTime());
                dataChart.setSeq(data.getSeq());
                dataChart.setTemperature(data.getTemperature());
                dataChart.setThickness(data.getThickness());
                results.add(dataChart);
            }
        }
        return results;
    }
}
