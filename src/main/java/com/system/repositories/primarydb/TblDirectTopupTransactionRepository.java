package com.system.repositories.primarydb;


import java.util.Date;
import java.util.List;

import com.system.modals.customize.IDirectTopupSummary;
import com.system.modals.customize.IDirectTopupTransaction;
import com.system.modals.modal.TblDirectTopupTransactions;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface TblDirectTopupTransactionRepository extends JpaRepository<TblDirectTopupTransactions, Integer>{

	@Query(value =  "select \r\n"
			+ " ROW_NUMBER() OVER (ORDER BY direct_topup_transaction_date desc) AS rowId,\r\n"
			+ "tdtt.provider_code as telco,\r\n"
			+ "tm.merchant_name as tenDoiTac,\r\n"
			+ "request_id as requestId,\r\n"
			+ "direct_topup_transaction_id as transIdVpay,\r\n"
			+ "direct_topup_transaction_date as ngayGd,\r\n"
			+ "direct_topup_transaction_result as ketQuaFinal,\r\n"
			+ "amount as menhgia,\r\n"
			+ "commission_rate as chietkhau,\r\n"
			+ "amount*(1-commission_rate) as giaMua\r\n"
			+ " from TBL_DIRECT_TOPUP_TRANSACTIONS tdtt inner join TBL_MERCHANTS tm on tdtt.merchant_id = tm.merchant_id\r\n"
			+ "where \r\n"
			+ "direct_topup_transaction_date >= ?\r\n"
			+ "and direct_topup_transaction_date <= ?\r\n"
			+ "and (direct_topup_transaction_result = 'A' or direct_topup_transaction_result = 'P')", nativeQuery = true)
	List<IDirectTopupTransaction> getDirectTopupTransactionDetailReport(Date from, Date to);
	
	@Query(value =  "select provider_code as providerCode, count(direct_topup_transaction_id) as quantity, sum(amount) as totalAmount\r\n"
			+ "from TBL_DIRECT_TOPUP_TRANSACTIONS\r\n"
			+ "where\r\n"
			+ "direct_topup_transaction_date >= convert(datetime, ?,120)\r\n"
			+ "and direct_topup_transaction_date <= convert(datetime, ?,120)\r\n"
			+ "and direct_topup_transaction_result = ?\r\n"
			+ "group by provider_code", nativeQuery = true)
	List<IDirectTopupSummary> getDirectTopupSummary(String from, String to, String transactionResult);
	
//	@Query(value = "select COUNT(direct_topup_transaction_id) as total,provider_code,resp_status,sum(amount) total_real,sum(amount*commission_rate) total_after_comms\r\n"
//			+ "from TBL_DIRECT_TOPUP_TRANSACTIONS where \r\n"
//			+ "direct_topup_transaction_date >= convert(datetime, ?+' 00:00:00.000',120) and \r\n"
//			+ "direct_topup_transaction_date <= convert(datetime, ?+' 23:59:59.999',120) group by\r\n"
//			+ "provider_code,resp_status",nativeQuery = true)
//	List<IDirectTopupStatistic> getDirectTopupStatistic(String from, String to);
	
	@Query(value =  "select \r\n"
			+ " ROW_NUMBER() OVER (ORDER BY direct_topup_transaction_date desc) AS rowId,\r\n"
			+ "tdtt.provider_code as telco,\r\n"
			+ "tm.merchant_name as tenDoiTac,\r\n"
			+ "request_id as requestId,\r\n"
			+ "direct_topup_transaction_id as transIdVpay,\r\n"
			+ "direct_topup_transaction_date as ngayGd,\r\n"
			+ "direct_topup_transaction_result as ketQuaFinal,\r\n"
			+ "amount as menhgia,\r\n"
			+ "commission_rate as chietkhau,\r\n"
			+ "amount*(1-commission_rate) as giaMua\r\n"
			+ " from TBL_DIRECT_TOPUP_TRANSACTIONS tdtt inner join TBL_MERCHANTS tm on tdtt.merchant_id = tm.merchant_id\r\n"
			+ "where \r\n"
			+ "direct_topup_transaction_date >= ?\r\n"
			+ "and direct_topup_transaction_date <= ?\r\n"
			+ "and (direct_topup_transaction_result = 'A' or direct_topup_transaction_result = 'P') order by\r\n"
			+ "tdtt.direct_topup_transaction_date desc offset ? rows fetch next ? rows only", nativeQuery = true)
	List<IDirectTopupTransaction> getDirectTopupTransactionInputSize(Date from, Date to, int offset, int next);
	
	@Query(value =  "select \r\n"
			+ " ROW_NUMBER() OVER (ORDER BY direct_topup_transaction_date desc) AS rowId,\r\n"
			+ "tdtt.provider_code as telco,\r\n"
			+ "tm.merchant_name as tenDoiTac,\r\n"
			+ "request_id as requestId,\r\n"
			+ "direct_topup_transaction_id as transIdVpay,\r\n"
			+ "direct_topup_transaction_date as ngayGd,\r\n"
			+ "direct_topup_transaction_result as ketQuaFinal,\r\n"
			+ "amount as menhgia,\r\n"
			+ "commission_rate as chietkhau,\r\n"
			+ "amount*(1-commission_rate) as giaMua,\r\n"
			+ "route_to as channel\r\n"
			+ " from TBL_DIRECT_TOPUP_TRANSACTIONS tdtt inner join TBL_MERCHANTS tm on tdtt.merchant_id = tm.merchant_id\r\n"
			+ "where request_id in :lstRequestId\r\n"			
			+ "\r\n"			
			,nativeQuery = true)
	Page<IDirectTopupTransaction> getDirectTopupTransactionDetailByRequestId(List<String> lstRequestId, Pageable pageable);
	
	@Query(value =  "select \r\n"
			+ " ROW_NUMBER() OVER (ORDER BY direct_topup_transaction_date desc) AS rowId,\r\n"
			+ "tdtt.provider_code as telco,\r\n"
			+ "tm.merchant_name as tenDoiTac,\r\n"
			+ "request_id as requestId,\r\n"
			+ "direct_topup_transaction_id as transIdVpay,\r\n"
			+ "direct_topup_transaction_date as ngayGd,\r\n"
			+ "direct_topup_transaction_result as ketQuaFinal,\r\n"
			+ "amount as menhgia,\r\n"
			+ "commission_rate as chietkhau,\r\n"
			+ "amount*(1-commission_rate) as giaMua,\r\n"
			+ "route_to as channel\r\n"
			+ " from TBL_DIRECT_TOPUP_TRANSACTIONS tdtt inner join TBL_MERCHANTS tm on tdtt.merchant_id = tm.merchant_id\r\n"
			+ "where \r\n"
			+ "direct_topup_transaction_date >= ?\r\n"
			+ "and direct_topup_transaction_date <= ?\r\n"
			+ "and (direct_topup_transaction_result = 'A' or direct_topup_transaction_result = 'P')\r\n"
			,
			countQuery = "select\r\n"
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
	Page<IDirectTopupTransaction> getDirectTopupTransactionDetailReportPaging(Date from, Date to, Pageable pageable);
	
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
