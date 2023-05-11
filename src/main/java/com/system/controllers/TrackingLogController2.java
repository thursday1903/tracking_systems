package com.system.controllers;

import java.util.List;

import com.google.gson.Gson;
import com.system.interfaces.IcustomTrackingLog;
import com.system.modals.customize.CustomTrackingLog;
import com.system.modals.modal.TrackingCodeData;
import com.system.modals.modal.TrackingLogs;
import com.system.repositories.primarydb.TrackingCodeDataRepository;
import com.system.repositories.primarydb.TrackingLogRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TrackingLogController2 extends BaseController {

	@Autowired
	private TrackingLogRepository trackingLogRepository;
	@Autowired
	private TrackingCodeDataRepository trackingCodeDataRepository;

	@RequestMapping("/query/order/{orderCode}")
	public String queryOrderCode(@PathVariable(name = "orderCode") String orderCode) {
		List<TrackingLogs> lstTrackingLog = trackingLogRepository.getListTrackingOfOrder(orderCode);
		String retStr = ""; 
		try {
			retStr =new Gson().toJson(lstTrackingLog); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return retStr;
	}
	
	@RequestMapping("/query/tracking_code")
	public String queryOrderCode() {
		List<TrackingCodeData> lstTrackingLog = trackingCodeDataRepository.findAll();
		return new Gson().toJson(lstTrackingLog);
	}
}
