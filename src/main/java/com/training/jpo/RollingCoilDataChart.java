package com.training.jpo;

import java.util.Date;

public class RollingCoilDataChart {
    private int coilId;
    private String coilNo;
    private Date time;
    private int seq;
    private int temperature;
    private int thickness;

    public RollingCoilDataChart() {
    }

    public int getCoilId() {
        return coilId;
    }

    public void setCoilId(int coilId) {
        this.coilId = coilId;
    }

    public String getCoilNo() {
        return coilNo;
    }

    public void setCoilNo(String coilNo) {
        this.coilNo = coilNo;
    }
    
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public int getTemperature() {
        return temperature;
    }

    public void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    public int getThickness() {
        return thickness;
    }

    public void setThickness(int thickness) {
        this.thickness = thickness;
    }
}
