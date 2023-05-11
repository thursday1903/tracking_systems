package com.system.modals.customize;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CheckPendingBillResult {
//	{"code":code,"desc":"desc","order_id":"order_id","status_trans":status_trans,"status_trans_desc":"status_trans_desc"}
	Integer code;
	String desc;
	String order_id;
	Integer status_trans;
	String status_trans_desc;
	
}
