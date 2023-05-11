package com.system.modals.customize;

import java.util.Date;

public interface ISoftpinStock {
	String getProductName();
	Long getTotalAvailable();
	Integer getProductId();
	Date getMinExpireDate();
}
