package com.system.repositories.primarydb;



import java.util.List;

import com.system.modals.modal.TopupListFiles;
import com.system.modals.modal.TrackingCodeData;
import com.system.modals.modal.TrackingLogs;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface TrackingCodeDataRepository extends JpaRepository<TrackingCodeData, Long>{

	@Query(value =  "select * from tracking_logs order by change_date desc", nativeQuery = true)
	List<TrackingLogs> getListTrackingLogs();	
}
