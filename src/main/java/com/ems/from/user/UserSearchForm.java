package com.ems.from.user;

import java.util.Date;
import java.io.Serializable;

import com.ems.from.PageSearchForm;
import org.springframework.format.annotation.DateTimeFormat;

public class UserSearchForm extends PageSearchForm implements Serializable{

	private static final long serialVersionUID = 1L;
	
    
    /**
    *
    */
    private Long id; 
    
    /**
    *
    */
    private String userName; 
    
    /**
    *
    */
    private String password; 
    
    /**
    *
    */
    private String mobil; 
	/**
    *开始
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startCreateTime; 
	 
	/**
    *结束
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endCreateTime; 
  
  	/**
    *
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime; 
  
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
   
	public String getUserName() {
		return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    } 
   
	public String getPassword() {
		return password;
    }

    public void setPassword(String password) {
        this.password = password;
    } 
   
	public String getMobil() {
		return mobil;
    }

    public void setMobil(String mobil) {
        this.mobil = mobil;
    } 
   
	public Date getStartCreateTime() {
		return startCreateTime;
    }

    public void setStartCreateTime(Date startCreateTime) {
        this.startCreateTime = startCreateTime;
    }
    
    public Date getCreateTime() {
		return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    } 
    
    public Date getEndCreateTime() {
		return endCreateTime;
    }

    public void setEndCreateTime(Date endCreateTime) {
        this.endCreateTime = endCreateTime;
    }
	
   
	public Date getStartUpdateTime() {
		return startUpdateTime;
    }

    public void setStartUpdateTime(Date startUpdateTime) {
        this.startUpdateTime = startUpdateTime;
    }
    
    public Date getUpdateTime() {
		return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    } 
    
    public Date getEndUpdateTime() {
		return endUpdateTime;
    }

    public void setEndUpdateTime(Date endUpdateTime) {
        this.endUpdateTime = endUpdateTime;
    }
	
   


}
