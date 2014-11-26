package cn.com.actionform;

import java.util.Date;

public class NewsVo {
	private String newsId;
	private String newsTitle;
	private String newsLink;
	private String newsStatus;
	private String newsPublisher;
	private Date publishDate;
	private String newsImgLink;
	private String newsContent;
	
	private String updateNewsId;
	private String updateNewsTitle;
	private String updateNewsContent;
	
	public String getUpdateNewsId() {
		return updateNewsId;
	}
	public void setUpdateNewsId(String updateNewsId) {
		this.updateNewsId = updateNewsId;
	}
	public String getUpdateNewsTitle() {
		return updateNewsTitle;
	}
	public void setUpdateNewsTitle(String updateNewsTitle) {
		this.updateNewsTitle = updateNewsTitle;
	}
	public String getUpdateNewsContent() {
		return updateNewsContent;
	}
	public void setUpdateNewsContent(String updateNewsContent) {
		this.updateNewsContent = updateNewsContent;
	}
	public String getNewsId() {
		return newsId;
	}
	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsLink() {
		return newsLink;
	}
	public void setNewsLink(String newsLink) {
		this.newsLink = newsLink;
	}
	public String getNewsStatus() {
		return newsStatus;
	}
	public void setNewsStatus(String newsStatus) {
		this.newsStatus = newsStatus;
	}
	public String getNewsPublisher() {
		return newsPublisher;
	}
	public void setNewsPublisher(String newsPublisher) {
		this.newsPublisher = newsPublisher;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public String getNewsImgLink() {
		return newsImgLink;
	}
	public void setNewsImgLink(String newsImgLink) {
		this.newsImgLink = newsImgLink;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	
}
