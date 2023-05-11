package com.system.modals.customize;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class TrackingObject {
	int index;
	Date date;
	String loc;
	String orderReferenceCode;
	
	public Boolean isValidTracking() {
		if (date == null||orderReferenceCode==null)
			return false;
		return true;
	}
}
