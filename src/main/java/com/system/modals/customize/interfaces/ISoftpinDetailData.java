package com.system.modals.customize.interfaces;

import java.util.Date;

public interface ISoftpinDetailData {

//	SELECT softpin_id,
//	softpin_serial_number,
//	softpin_status,
//	TS.import_batch_id,
//	TIB.import_check_datetime,
//	TS.transaction_id,
//	TDT.register_datetime,
//	TDT.request_id,
//	TDT.merchant_id,
//	TM.merchant_username
//	FROM TBL_SOFTPINS TS LEFT JOIN TBL_IMPORT_BATCHES TIB ON TIB.IMPORT_BATCH_ID = TS.IMPORT_BATCH_ID
//	LEFT JOIN TBL_DOWNLOAD_TRANSACTIONS TDT ON TDT.transaction_id = TS.transaction_id
//	LEFT JOIN TBL_MERCHANTS TM ON TDT.merchant_id = TM.merchant_id
//	WHERE SOFTPIN_SERIAL_NUMBER IN ('100000004182032')
	Integer getSoftpinId();
	String getSoftpinSerialNumber();
	String getSoftpinStatus();
	Integer getImportBatchId();
	Date getImportCheckDatetime();
	Integer getTransactionId();
	Date getRegisterDatetime();
	String getRequestId();
	Integer getMerchantId();
	String getMerchantUsername();
	
}
