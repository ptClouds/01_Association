package cn.com.model;

import java.util.HashSet;
import java.util.Set;

/**
 * AdminInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class AdminInfo implements java.io.Serializable {

	// Fields

	private String adminId;
	private String adminName;
	private String adminPass;
	private String adminType;
	private String adminStatus;
	private Set siteNotices = new HashSet(0);

	// Constructors

	/** default constructor */
	public AdminInfo() {
	}

	/** full constructor */
	public AdminInfo(String adminName, String adminPass, String adminType,
			String adminStatus, Set siteNotices) {
		this.adminName = adminName;
		this.adminPass = adminPass;
		this.adminType = adminType;
		this.adminStatus = adminStatus;
		this.siteNotices = siteNotices;
	}

	// Property accessors

	public String getAdminId() {
		return this.adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPass() {
		return this.adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	public String getAdminType() {
		return this.adminType;
	}

	public void setAdminType(String adminType) {
		this.adminType = adminType;
	}

	public String getAdminStatus() {
		return this.adminStatus;
	}

	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}

	public Set getSiteNotices() {
		return this.siteNotices;
	}

	public void setSiteNotices(Set siteNotices) {
		this.siteNotices = siteNotices;
	}

}