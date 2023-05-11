package com.system.repositories.primarydb;



import java.util.List;

import com.system.modals.modal.TopupListFiles;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface TopupListFileRepository extends JpaRepository<TopupListFiles, Long>{

	@Query(value =  "select * from topup_list_files\r\n"
			+ "where identify_status = ? and approved_reject_date is null and approved_reject_by_admin is null", nativeQuery = true)
	List<TopupListFiles> getListPendingTopupFiles(int identifyStatus);	
}
