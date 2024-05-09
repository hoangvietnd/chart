package com.rajeshkawali.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "rolling_coil_data")
@IdClass(RollingCoilDataId.class)
public class RollingCoilData {
    @ManyToOne
//    @JoinColumn(name = "coil_id", referencedColumnName = "id", insertable = false, updatable = false)
    @JoinColumn(name="coil_id", nullable=false, insertable=false, updatable=false)
    private RollingCoil rollingCoil;
    @Id
    @Column(name = "coil_id")
    private int coilId;
    @Id
    @Column(name = "time")
    private Date time;
    @Column(name = "seq")
    private int seq;
    @Column(name = "temperature")
    private int temperature;
    @Column(name = "thickness")
    private int thickness;

    public RollingCoilData() {
    }

    public RollingCoilData(RollingCoil rollingCoil, int coilId, Date time, int seq, int temperature, int thickness) {
        this.rollingCoil = rollingCoil;
        this.coilId = coilId;
        this.time = time;
        this.seq = seq;
        this.temperature = temperature;
        this.thickness = thickness;
    }

    public int getCoilId() {
        return coilId;
    }

    public void setCoilId(int coilId) {
        this.coilId = coilId;
    }

    public RollingCoil getRollingCoil() {
        return rollingCoil;
    }

    public void setRollingCoil(RollingCoil rollingCoil) {
        this.rollingCoil = rollingCoil;
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
