package com.system.repositories.primarydb;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import com.system.interfaces.IcustomTrackingLog;
import com.system.modals.modal.TrackingLogs;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TrackingLogRepository extends JpaRepository<TrackingLogs, Long> {

	@Query(value = "select * from tracking_logs order by change_date desc", nativeQuery = true)
	List<TrackingLogs> getListTrackingLogs();
	
	@Modifying(flushAutomatically = true, clearAutomatically = true)
	@Transactional
	@Query(value = "update tracking_logs set log_location =?1, change_date =?2  where order_reference_code =?3 and state_id =?4", nativeQuery = true)
	void updateTrackingLogs(String loc, Date date, String referenceCode, int stateId);

	@Query(value = "select * from tracking_logs where row_id = ?", nativeQuery = true)
	TrackingLogs getListTrackingLogById(Long rowId);

	@Query(value = "select * from tracking_logs where order_code = ? order by change_date desc", nativeQuery = true)
	List<TrackingLogs> getListTrackingOfOrder(String orderCode);
	
	@Query(value = "select * from tracking_logs where order_reference_code = :orderCode and state_id = :stateId", nativeQuery = true)
	TrackingLogs getListTrackingByOrderCodeAndState(@Param("orderCode") String orderCode,@Param("stateId") int stateId);

	@Query(value = "select row_id as rowId,order_code as orderCode,order_reference_code as orderReferenceCode,\r\n"
			+ "change_date as changeDate, log_location as logLocation, remark,t2.tracking_code as trackingCode,t2.tracking_code_long_desc as trackingDesc\r\n"
			+ "from tracking_logs t1 inner join tracking_code_data t2 on t1.state_id = t2.state_id\r\n"
			+ "where order_code = ? order by t1.state_id desc", nativeQuery = true)
	List<IcustomTrackingLog> getListCustomTracking(String orderCode);

	@Query(value = "select row_id as rowId,order_code as orderCode,order_reference_code as orderReferenceCode,\r\n"
			+ "change_date as changeDate, log_location as logLocation, remark,t2.tracking_code as trackingCode,t2.tracking_code_long_desc as trackingDesc\r\n"
			+ "from tracking_logs t1 left join tracking_code_data t2 on t1.state_id = t2.state_id\r\n"
			+ "order by change_date desc", nativeQuery = true)
	List<IcustomTrackingLog> getListAllCustomTracking();
}
