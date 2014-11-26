package cn.com.model;

import java.util.Date;

/**
 * MessageInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class MessageInfo implements java.io.Serializable {

	// Fields

	private String msgId;
	private MembersInfo membersInfo;
	private String msgContent;
	private Date msgTime;

	// Constructors

	/** default constructor */
	public MessageInfo() {
	}

	/** full constructor */
	public MessageInfo(MembersInfo membersInfo, String msgContent, Date msgTime) {
		this.membersInfo = membersInfo;
		this.msgContent = msgContent;
		this.msgTime = msgTime;
	}

	// Property accessors

	public String getMsgId() {
		return this.msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	public MembersInfo getMembersInfo() {
		return this.membersInfo;
	}

	public void setMembersInfo(MembersInfo membersInfo) {
		this.membersInfo = membersInfo;
	}

	public String getMsgContent() {
		return this.msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getMsgTime() {
		return this.msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

}