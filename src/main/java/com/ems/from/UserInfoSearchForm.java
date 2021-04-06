package com.ems.from;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class UserInfoSearchForm extends PageSearchForm implements Serializable{

	private static final long serialVersionUID = 1L;


    private Long id;

    private Long userId;

    private Integer postType;

    private Integer loginCount;

    private String loginIp;


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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
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

    public Integer getPostType() {
        return postType;
    }

    public void setPostType(Integer postType) {
        this.postType = postType;
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
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
