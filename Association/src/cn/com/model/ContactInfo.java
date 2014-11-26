package cn.com.model;

import java.util.Date;

/**
 * ContactInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ContactInfo implements java.io.Serializable {

	// Fields

	private String contactId;
	private AssociationInfo associationInfo;
	private MembersInfo membersInfo;
	private String assoDuty;
	private Date joinDate;
	private String status;
	private String approve;
	private Date exitDate;
	private String remarks;

	// Constructors

	/** default constructor */
	public ContactInfo() {
	}

	/** minimal constructor */
	public ContactInfo(AssociationInfo associationInfo, MembersInfo membersInfo) {
		this.associationInfo = associationInfo;
		this.membersInfo = membersInfo;
	}

	/** full constructor */
	public ContactInfo(AssociationInfo associationInfo,
			MembersInfo membersInfo, String assoDuty, Date joinDate,
			String status, String approve, Date exitDate, String remarks) {
		this.associationInfo = associationInfo;
		this.membersInfo = membersInfo;
		this.assoDuty = assoDuty;
		this.joinDate = joinDate;
		this.status = status;
		this.approve = approve;
		this.exitDate = exitDate;
		this.remarks = remarks;
	}

	// Property accessors

	public String getContactId() {
		return this.contactId;
	}

	public void setContactId(String contactId) {
		this.contactId = contactId;
	}

	public AssociationInfo getAssociationInfo() {
		return this.associationInfo;
	}

	public void setAssociationInfo(AssociationInfo associationInfo) {
		this.associationInfo = associationInfo;
	}

	public MembersInfo getMembersInfo() {
		return this.membersInfo;
	}

	public void setMembersInfo(MembersInfo membersInfo) {
		this.membersInfo = membersInfo;
	}

	public String getAssoDuty() {
		return this.assoDuty;
	}

	public void setAssoDuty(String assoDuty) {
		this.assoDuty = assoDuty;
	}

	public Date getJoinDate() {
		return this.joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApprove() {
		return this.approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}

	public Date getExitDate() {
		return this.exitDate;
	}

	public void setExitDate(Date exitDate) {
		this.exitDate = exitDate;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}