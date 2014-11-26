package cn.com.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AssociationInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class AssociationInfo implements java.io.Serializable {

	// Fields

	private String assoId;
	private String assoName;
	private String assoDesc;
	private String applicant;
	private Date regDate;
	private String assoStatus;
	private String approve;
	private String applicantTel;
	private String applicantEmail;
	private String applicantId;
	private String regSchool;
	private Date revokeDate;
	private String assoPhoto;
	private String remarks;
	private Set contactInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public AssociationInfo() {
	}

	/** full constructor */
	public AssociationInfo(String assoName, String assoDesc, String applicant,
			Date regDate, String assoStatus, String approve,
			String applicantTel, String applicantEmail, String applicantId,
			String regSchool, Date revokeDate, String assoPhoto,
			String remarks, Set contactInfos) {
		this.assoName = assoName;
		this.assoDesc = assoDesc;
		this.applicant = applicant;
		this.regDate = regDate;
		this.assoStatus = assoStatus;
		this.approve = approve;
		this.applicantTel = applicantTel;
		this.applicantEmail = applicantEmail;
		this.applicantId = applicantId;
		this.regSchool = regSchool;
		this.revokeDate = revokeDate;
		this.assoPhoto = assoPhoto;
		this.remarks = remarks;
		this.contactInfos = contactInfos;
	}

	// Property accessors

	public String getAssoId() {
		return this.assoId;
	}

	public void setAssoId(String assoId) {
		this.assoId = assoId;
	}

	public String getAssoName() {
		return this.assoName;
	}

	public void setAssoName(String assoName) {
		this.assoName = assoName;
	}

	public String getAssoDesc() {
		return this.assoDesc;
	}

	public void setAssoDesc(String assoDesc) {
		this.assoDesc = assoDesc;
	}

	public String getApplicant() {
		return this.applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAssoStatus() {
		return this.assoStatus;
	}

	public void setAssoStatus(String assoStatus) {
		this.assoStatus = assoStatus;
	}

	public String getApprove() {
		return this.approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}

	public String getApplicantTel() {
		return this.applicantTel;
	}

	public void setApplicantTel(String applicantTel) {
		this.applicantTel = applicantTel;
	}

	public String getApplicantEmail() {
		return this.applicantEmail;
	}

	public void setApplicantEmail(String applicantEmail) {
		this.applicantEmail = applicantEmail;
	}

	public String getApplicantId() {
		return this.applicantId;
	}

	public void setApplicantId(String applicantId) {
		this.applicantId = applicantId;
	}

	public String getRegSchool() {
		return this.regSchool;
	}

	public void setRegSchool(String regSchool) {
		this.regSchool = regSchool;
	}

	public Date getRevokeDate() {
		return this.revokeDate;
	}

	public void setRevokeDate(Date revokeDate) {
		this.revokeDate = revokeDate;
	}

	public String getAssoPhoto() {
		return this.assoPhoto;
	}

	public void setAssoPhoto(String assoPhoto) {
		this.assoPhoto = assoPhoto;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Set getContactInfos() {
		return this.contactInfos;
	}

	public void setContactInfos(Set contactInfos) {
		this.contactInfos = contactInfos;
	}

}