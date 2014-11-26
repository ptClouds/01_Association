package cn.com.actionform;

import java.util.Date;

import cn.com.model.AdminInfo;

public class NoticeVo {
	
	private String noticeId;
	private AdminInfo adminInfo;
	private String noticeTitle;
	private String noticeContent;
	private Date sendTime;
	private String updateNoticId;
	private String updateContent;
	private String adminId;

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public AdminInfo getAdminInfo() {
		return adminInfo;
	}

	public void setAdminInfo(AdminInfo adminInfo) {
		this.adminInfo = adminInfo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getUpdateNoticId() {
		return updateNoticId;
	}

	public void setUpdateNoticId(String updateNoticId) {
		this.updateNoticId = updateNoticId;
	}

	public String getUpdateContent() {
		return updateContent;
	}

	public void setUpdateContent(String updateContent) {
		this.updateContent = updateContent;
	}
	
}
