package com.system.modals.customize;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Paging {

	Date fromDate;
	Date toDate;
	int page=0;
	int size=20;
	String requestId;
	String merchantUsername;
	String transactionStatus;
	String pinSerial;
	
	
	
	public String getPinSerial() {
		return pinSerial;
	}
	public void setPinSerial(String pinSerial) {
		this.pinSerial = pinSerial;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getRequestId() {
		return requestId;
	}
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}
	public String getMerchantUsername() {
		return merchantUsername;
	}
	public void setMerchantUsername(String merchantUsername) {
		this.merchantUsername = merchantUsername;
	}
	public String getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	
	
	
	
}
