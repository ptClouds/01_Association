package cn.com.actionform;

import java.util.Date;

import cn.com.model.AssociationInfo;
import cn.com.model.MembersInfo;

public class ContactVo {
	
	private String contactId;
	private AssociationInfo associationInfo;
	private MembersInfo membersInfo;
	private String assoDuty;
	private Date joinDate;
	private String status;
	private String approve;
	private Date exitDate;
	private String remarks;
	private String assoId;
	private String memberId;
	
	public String getContactId() {
		return contactId;
	}
	public void setContactId(String contactId) {
		this.contactId = contactId;
	}
	public AssociationInfo getAssociationInfo() {
		return associationInfo;
	}
	public void setAssociationInfo(AssociationInfo associationInfo) {
		this.associationInfo = associationInfo;
	}
	public MembersInfo getMembersInfo() {
		return membersInfo;
	}
	public void setMembersInfo(MembersInfo membersInfo) {
		this.membersInfo = membersInfo;
	}
	public String getAssoDuty() {
		return assoDuty;
	}
	public void setAssoDuty(String assoDuty) {
		this.assoDuty = assoDuty;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public Date getExitDate() {
		return exitDate;
	}
	public void setExitDate(Date exitDate) {
		this.exitDate = exitDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getAssoId() {
		return assoId;
	}
	public void setAssoId(String assoId) {
		this.assoId = assoId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
