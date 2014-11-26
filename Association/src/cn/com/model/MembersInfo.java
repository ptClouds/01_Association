package cn.com.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * MembersInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class MembersInfo implements java.io.Serializable {

	// Fields

	private String memberId;
	private String memberName;
	private String memberTel;
	private String memberEmail;
	private String memberPass;
	private Date birthday;
	private String school;
	private String class_;
	private String grade;
	private String magor;
	private String hobby;
	private String specialty;
	private String hometown;
	private String status;
	private String memberPhoto;
	private String remarks;
	private Set contactInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public MembersInfo() {
	}

	/** full constructor */
	public MembersInfo(String memberName, String memberTel, String memberEmail,
			String memberPass, Date birthday, String school, String class_,
			String grade, String magor, String hobby, String specialty,
			String hometown, String status, String memberPhoto, String remarks,
			Set contactInfos) {
		this.memberName = memberName;
		this.memberTel = memberTel;
		this.memberEmail = memberEmail;
		this.memberPass = memberPass;
		this.birthday = birthday;
		this.school = school;
		this.class_ = class_;
		this.grade = grade;
		this.magor = magor;
		this.hobby = hobby;
		this.specialty = specialty;
		this.hometown = hometown;
		this.status = status;
		this.memberPhoto = memberPhoto;
		this.remarks = remarks;
		this.contactInfos = contactInfos;
	}

	// Property accessors

	public String getMemberId() {
		return this.memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return this.memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberTel() {
		return this.memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberEmail() {
		return this.memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPass() {
		return this.memberPass;
	}

	public void setMemberPass(String memberPass) {
		this.memberPass = memberPass;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getClass_() {
		return this.class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMagor() {
		return this.magor;
	}

	public void setMagor(String magor) {
		this.magor = magor;
	}

	public String getHobby() {
		return this.hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getSpecialty() {
		return this.specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getHometown() {
		return this.hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberPhoto() {
		return this.memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
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