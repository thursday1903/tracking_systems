package com.system.interfaces;

import java.util.Date;

public interface IcustomTrackingLog {
	Integer getRowId();
	String getOrderCode();
	String getOrderReferenceCode();
	Date getChangeDate();
	String getTrackingCode();
	String getTrackingDesc();
	String getLogLocation();
	String getRemark();
//	log_location as logLocation, remark as remark
}
