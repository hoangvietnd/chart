package com.rajeshkawali.jpo;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.Date;

public class RollingCoilDataChart {
    private int coilId;
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
