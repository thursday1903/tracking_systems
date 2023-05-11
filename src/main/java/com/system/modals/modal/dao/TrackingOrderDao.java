package com.system.modals.modal.dao;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrackingOrderDao {

	private final EntityManager entityManager;
	
	@Autowired
	public TrackingOrderDao(EntityManager entityManager) {
		//TODO Auto-generated constructor stub
		this.entityManager = entityManager;
	}
	
//	public TrackingExtendData getListTracking(String orderCode) {
//        StringBuilder str = new StringBuilder("");
//        Query query = entityManager.createNativeQuery(str.toString(), "OrderDetailMapping");
//        OrderDetailDTO result = (OrderDetailDTO) query.getSingleResult();
//        return result;
//    }
}
