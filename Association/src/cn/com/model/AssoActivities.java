package cn.com.model;

import java.util.Date;

/**
 * AssoActivities entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class AssoActivities implements java.io.Serializable {

	// Fields

	private String activId;
	private String assoId;
	private String activTopic;
	private String activContent;
	private Date activDate;
	private String activAddress;
	private String noticeMatter;
	private Date sendTime;
	private String remarks;

	// Constructors

	/** default constructor */
	public AssoActivities() {
	}

	/** full constructor */
	public AssoActivities(String assoId, String activTopic,
			String activContent, Date activDate, String activAddress,
			String noticeMatter, Date sendTime, String remarks) {
		this.assoId = assoId;
		this.activTopic = activTopic;
		this.activContent = activContent;
		this.activDate = activDate;
		this.activAddress = activAddress;
		this.noticeMatter = noticeMatter;
		this.sendTime = sendTime;
		this.remarks = remarks;
	}

	// Property accessors

	public String getActivId() {
		return this.activId;
	}

	public void setActivId(String activId) {
		this.activId = activId;
	}

	public String getAssoId() {
		return this.assoId;
	}

	public void setAssoId(String assoId) {
		this.assoId = assoId;
	}

	public String getActivTopic() {
		return this.activTopic;
	}

	public void setActivTopic(String activTopic) {
		this.activTopic = activTopic;
	}

	public String getActivContent() {
		return this.activContent;
	}

	public void setActivContent(String activContent) {
		this.activContent = activContent;
	}

	public Date getActivDate() {
		return this.activDate;
	}

	public void setActivDate(Date activDate) {
		this.activDate = activDate;
	}

	public String getActivAddress() {
		return this.activAddress;
	}

	public void setActivAddress(String activAddress) {
		this.activAddress = activAddress;
	}

	public String getNoticeMatter() {
		return this.noticeMatter;
	}

	public void setNoticeMatter(String noticeMatter) {
		this.noticeMatter = noticeMatter;
	}

	public Date getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}