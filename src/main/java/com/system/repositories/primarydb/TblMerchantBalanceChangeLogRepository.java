package com.system.repositories.primarydb;

import java.util.Date;
import java.util.List;
import com.system.modals.modal.TblMerchantBalanceLogs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface TblMerchantBalanceChangeLogRepository extends JpaRepository<TblMerchantBalanceLogs, Integer>{

	/**
	 * Lấy số dư biến động trong ngày
	 * @param merId
	 * @param type
	 * @return
	 */
	@Query(value =  "select * from TBL_MERCHANT_BALANCE_LOGS\r\n"
			+ "where merchant_id in :merId\r\n"
			+ "and merchant_balance_change_type = :type\r\n"
			+ "and register_datetime >= :from\r\n"
			+ "and register_datetime <= :to\r\n", nativeQuery = true)
	List<TblMerchantBalanceLogs> getMerchantBalanceLogByType(List<String> merId, Integer type, Date from, Date to);
	
	
}
