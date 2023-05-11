package com.system.modals.customize;

import java.util.Date;

public interface IDirectTopupTransaction {
	Integer getRowId();
	String getTelco();
	String getTenDoiTac();
	String getRequestId();
	Integer getTransIdVpay();
	Date getNgayGd();
	String getKetQuaFinal();
	Integer getMenhgia();
	Float getChietkhau();
	Float getGiaMua();
	Integer getChannel();
}
