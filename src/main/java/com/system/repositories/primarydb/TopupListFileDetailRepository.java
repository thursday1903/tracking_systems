package com.system.repositories.primarydb;



import java.util.List;
import com.system.modals.modal.TopupListFileDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface TopupListFileDetailRepository extends JpaRepository<TopupListFileDetails, Integer>{

	@Query(value =  "select t1.* from topup_list_file_details t1 inner join topup_list_files t2 on t1.file_list_id = t2.row_id\r\n"
			+ "where file_list_id = ? and t2.identify_status = 1 and t2.approved_reject_by_admin is not null\r\n"
			+ "and t1.topup_generate_request_id is null\r\n"
			+ "and t1.topup_status is null", nativeQuery = true)
	List<TopupListFileDetails> getListPendingTopupFileDetail(int topupFileDetailId);	
	
}
