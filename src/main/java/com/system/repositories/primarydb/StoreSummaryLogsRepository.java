package com.system.repositories.primarydb;


import java.util.Date;
import java.util.List;

import com.system.modals.customize.IDirectTopupTransaction;
import com.system.modals.customize.ISoftpinStock;
import com.system.modals.customize.interfaces.ISoftpinDetailData;
import com.system.modals.modal.StoreSummaryLogs;
import com.system.modals.modal.TblDirectTopupTransactions;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface StoreSummaryLogsRepository extends JpaRepository<StoreSummaryLogs, Integer>{

	@Query(value =  "select * from store_summary_logs\r\n"
			+ "where snapshot_date >= ?\r\n"
			+ "and snapshot_date <= ? order by product_id asc", nativeQuery = true)
	List<StoreSummaryLogs> getSoftpinStockReport(Date from, Date to);
	
	
	
}
