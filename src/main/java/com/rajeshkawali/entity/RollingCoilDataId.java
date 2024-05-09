package com.rajeshkawali.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;


public class RollingCoilDataId implements Serializable {
    private static final long serialVersionUID = 1L;
    private Date time;
    private int coilId;

    public RollingCoilDataId() {
    }

    public RollingCoilDataId(Date time, int coilId) {
        this.time = time;
        this.coilId = coilId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getCoilId() {
        return coilId;
    }

    public void setCoilId(int coilId) {
        this.coilId = coilId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RollingCoilDataId that = (RollingCoilDataId) o;
        return coilId == that.coilId && Objects.equals(time, that.time);
    }

    @Override
    public int hashCode() {
        return Objects.hash(time, coilId);
    }
}
