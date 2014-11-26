package cn.com.model;

import java.util.Date;

/**
 * SiteNotice entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class SiteNotice implements java.io.Serializable {

	// Fields

	private String noticeId;
	private AdminInfo adminInfo;
	private String noticeTitle;
	private String noticeContent;
	private Date sendTime;

	// Constructors

	/** default constructor */
	public SiteNotice() {
	}

	/** full constructor */
	public SiteNotice(AdminInfo adminInfo, String noticeTitle,
			String noticeContent, Date sendTime) {
		this.adminInfo = adminInfo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.sendTime = sendTime;
	}

	// Property accessors

	public String getNoticeId() {
		return this.noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public AdminInfo getAdminInfo() {
		return this.adminInfo;
	}

	public void setAdminInfo(AdminInfo adminInfo) {
		this.adminInfo = adminInfo;
	}

	public String getNoticeTitle() {
		return this.noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return this.noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

}