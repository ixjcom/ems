package com.ems.from;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class BusinessSearchForm extends PageSearchForm implements Serializable{

	private static final long serialVersionUID = 1L;


    private Long id;

    private Long userId;

    private BigDecimal fraction;

    private Integer businessCount;

	/**
    *开始
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startUpdateTime; 
	 
	/**
    *结束
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endUpdateTime; 
  
  	/**
    *
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

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

    public BigDecimal getFraction() {
        return fraction;
    }

    public void setFraction(BigDecimal fraction) {
        this.fraction = fraction;
    }

    public Integer getBusinessCount() {
        return businessCount;
    }

    public void setBusinessCount(Integer businessCount) {
        this.businessCount = businessCount;
    }

    public Date getStartUpdateTime() {
        return startUpdateTime;
    }

    public void setStartUpdateTime(Date startUpdateTime) {
        this.startUpdateTime = startUpdateTime;
    }

    public Date getEndUpdateTime() {
        return endUpdateTime;
    }

    public void setEndUpdateTime(Date endUpdateTime) {
        this.endUpdateTime = endUpdateTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
