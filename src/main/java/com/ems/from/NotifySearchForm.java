package com.ems.from;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class NotifySearchForm extends PageSearchForm implements Serializable{

	private static final long serialVersionUID = 1L;


    private Long id;

    private String title;

    private String releaseUser;

    private Integer isShow;

    private String content;
  
	/**
    *开始
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startReleaseTime;
	 
	/**
    *结束
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endReleaseTime;
  
  	/**
    *
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date releaseTime;


    private Long releaseUserId;

    public Long getReleaseUserId() {
        return releaseUserId;
    }

    public void setReleaseUserId(Long releaseUserId) {
        this.releaseUserId = releaseUserId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReleaseUser() {
        return releaseUser;
    }

    public void setReleaseUser(String releaseUser) {
        this.releaseUser = releaseUser;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getStartReleaseTime() {
        return startReleaseTime;
    }

    public void setStartReleaseTime(Date startReleaseTime) {
        this.startReleaseTime = startReleaseTime;
    }

    public Date getEndReleaseTime() {
        return endReleaseTime;
    }

    public void setEndReleaseTime(Date endReleaseTime) {
        this.endReleaseTime = endReleaseTime;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }
}
