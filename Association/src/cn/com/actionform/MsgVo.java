package cn.com.actionform;

import java.util.Date;

import cn.com.model.MembersInfo;

public class MsgVo {
	
	private String msgId;
	private MembersInfo membersInfo;
	private String msgContent;
	private Date msgTime;
	private String memberId;
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public MembersInfo getMembersInfo() {
		return membersInfo;
	}
	public void setMembersInfo(MembersInfo membersInfo) {
		this.membersInfo = membersInfo;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public Date getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
