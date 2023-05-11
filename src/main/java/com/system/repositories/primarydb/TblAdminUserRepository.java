package com.system.repositories.primarydb;



import com.system.modals.modal.TblAdminUsers;

import org.springframework.data.jpa.repository.JpaRepository;


public interface TblAdminUserRepository extends JpaRepository<TblAdminUsers, Integer>{
	TblAdminUsers getByAdminUserName(String adminUserName);
}
