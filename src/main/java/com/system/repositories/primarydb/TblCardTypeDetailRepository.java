package com.system.repositories.primarydb;



import com.system.modals.modal.TblCardTypeDetails;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TblCardTypeDetailRepository extends JpaRepository<TblCardTypeDetails, Integer> {
//	List<TblCardTypeDetails> findAllByIdIn(List<Long> rowId);
	
	TblCardTypeDetails getDetailByRowId(int rowId);
}
