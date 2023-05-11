package com.system.modals.customize;

import java.util.Date;

public class CustomTrackingLog {
	private Long rowId;
	private String orderCode;
	private String orderReferenceCode;
	private Date changeDate;
	private String trackingCode;
	private String trackingDesc;
	private String logLocation;
	private String remark;
	public CustomTrackingLog(Long rowId, String orderCode, String orderReferenceCode, Date changeDate,
			String trackingCode, String trackingDesc, String logLocation, String remark) {
		super();
		this.rowId = rowId;
		this.orderCode = orderCode;
		this.orderReferenceCode = orderReferenceCode;
		this.changeDate = changeDate;
		this.trackingCode = trackingCode;
		this.trackingDesc = trackingDesc;
		this.logLocation = logLocation;
		this.remark = remark;
	}
	public Long getRowId() {
		return rowId;
	}
	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderReferenceCode() {
		return orderReferenceCode;
	}
	public void setOrderReferenceCode(String orderReferenceCode) {
		this.orderReferenceCode = orderReferenceCode;
	}
	public Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}
	public String getTrackingCode() {
		return trackingCode;
	}
	public void setTrackingCode(String trackingCode) {
		this.trackingCode = trackingCode;
	}
	public String getTrackingDesc() {
		return trackingDesc;
	}
	public void setTrackingDesc(String trackingDesc) {
		this.trackingDesc = trackingDesc;
	}
	public String getLogLocation() {
		return logLocation;
	}
	public void setLogLocation(String logLocation) {
		this.logLocation = logLocation;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
