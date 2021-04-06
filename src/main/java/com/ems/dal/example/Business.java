package com.ems.dal.example;

import java.io.Serializable;
import java.util.Date;

public class Business implements Serializable {
    private Long id;

    private Long userId;

    private Integer fraction;

    private Integer businessCount;

    private Date updateTime;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getFraction() {
        return fraction;
    }

    public void setFraction(Integer fraction) {
        this.fraction = fraction;
    }

    public Integer getBusinessCount() {
        return businessCount;
    }

    public void setBusinessCount(Integer businessCount) {
        this.businessCount = businessCount;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}