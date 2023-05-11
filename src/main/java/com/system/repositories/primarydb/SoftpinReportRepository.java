package com.system.repositories.primarydb;


import java.util.Date;
import java.util.List;

import com.system.modals.customize.IDirectTopupTransaction;
import com.system.modals.customize.ISoftpinStock;
import com.system.modals.customize.interfaces.ISoftpinDetailData;
import com.system.modals.modal.TblDirectTopupTransactions;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface SoftpinReportRepository extends JpaRepository<TblDirectTopupTransactions, Integer>{

	@Query(value =  "select  "
			+ "tp.product_name as productName,"
			+ "COUNT(softpin_id) as totalAvailable,"
			+ "ts.product_id as productId,"
			+ "min(ts.softpin_expiry_datetime) as minExpireDate "
			+ "from TBL_SOFTPINS ts inner join TBL_PRODUCTS tp on ts.product_id = tp.product_id\r\n"
			+ "where softpin_status = 0\r\n"
			+ "group by ts.product_id,tp.product_name", nativeQuery = true)
	List<ISoftpinStock> getSoftpinStockReport();
	
	@Query(value =  "SELECT softpin_id as softpinId,\r\n"
			+ "softpin_serial_number as softpinSerialNumber,\r\n"
			+ "(case when softpin_status = 1 then 'Đã bán' when softpin_status = 0 then 'Chưa bán' else 'N/A' end) as softpinStatus,\r\n"
			+ "TS.import_batch_id as importBatchId,\r\n"
			+ "TIB.import_check_datetime as importCheckDatetime,\r\n"
			+ "TS.transaction_id as transactionId,\r\n"
			+ "TDT.register_datetime as registerDatetime,\r\n"
			+ "TDT.request_id as requestId,\r\n"
			+ "TDT.merchant_id as merchantId,\r\n"
			+ "TM.merchant_username as merchantUsername\r\n"
			+ "FROM TBL_SOFTPINS TS LEFT JOIN TBL_IMPORT_BATCHES TIB ON TIB.IMPORT_BATCH_ID = TS.IMPORT_BATCH_ID\r\n"
			+ "LEFT JOIN TBL_DOWNLOAD_TRANSACTIONS TDT ON TDT.transaction_id = TS.transaction_id\r\n"
			+ "LEFT JOIN TBL_MERCHANTS TM ON TDT.merchant_id = TM.merchant_id\r\n"
			+ "WHERE SOFTPIN_SERIAL_NUMBER IN :serialList", nativeQuery = true)
	Page<ISoftpinDetailData> querySoftpins(List<String> serialList,Pageable pageable);
	
	
	
	@Query(value = "select\r\n"
			+ "        count(direct_topup_transaction_id) \r\n"
			+ "    from\r\n"
			+ "        TBL_DIRECT_TOPUP_TRANSACTIONS tdtt \r\n"			
			+ "    where\r\n"
			+ "        direct_topup_transaction_date >= ?  \r\n"
			+ "        and direct_topup_transaction_date <= ?  \r\n"
			+ "        and (\r\n"
			+ "            direct_topup_transaction_result = 'A' \r\n"
			+ "            or direct_topup_transaction_result = 'P'\r\n"
			+ "        )",nativeQuery = true)
	Long getTotalDirectTransaction(Date from, Date to);
	
	
	
}
