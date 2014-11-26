package cn.com.model;

import java.util.Date;

/**
 * NewsInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class NewsInfo implements java.io.Serializable {

	// Fields

	private String newsId;
	private String newsTitle;
	private String newsLink;
	private String newsStatus;
	private String newsPublisher;
	private Date publishDate;
	private String newsImgLink;
	private String newsContent;

	// Constructors

	/** default constructor */
	public NewsInfo() {
	}

	/** full constructor */
	public NewsInfo(String newsTitle, String newsLink, String newsStatus,
			String newsPublisher, Date publishDate, String newsImgLink,
			String newsContent) {
		this.newsTitle = newsTitle;
		this.newsLink = newsLink;
		this.newsStatus = newsStatus;
		this.newsPublisher = newsPublisher;
		this.publishDate = publishDate;
		this.newsImgLink = newsImgLink;
		this.newsContent = newsContent;
	}

	// Property accessors

	public String getNewsId() {
		return this.newsId;
	}

	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}

	public String getNewsTitle() {
		return this.newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsLink() {
		return this.newsLink;
	}

	public void setNewsLink(String newsLink) {
		this.newsLink = newsLink;
	}

	public String getNewsStatus() {
		return this.newsStatus;
	}

	public void setNewsStatus(String newsStatus) {
		this.newsStatus = newsStatus;
	}

	public String getNewsPublisher() {
		return this.newsPublisher;
	}

	public void setNewsPublisher(String newsPublisher) {
		this.newsPublisher = newsPublisher;
	}

	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getNewsImgLink() {
		return this.newsImgLink;
	}

	public void setNewsImgLink(String newsImgLink) {
		this.newsImgLink = newsImgLink;
	}

	public String getNewsContent() {
		return this.newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

}