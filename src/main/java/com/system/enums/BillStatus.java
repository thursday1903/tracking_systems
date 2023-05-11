package com.system.enums;

public class BillStatus {
	public enum BillRpCode {
		// 200 Thành công
		// 99 Giao dịch pending
		// 11 Giao dịch thất bại
		// 101 Lỗi trong quá trình xử lý bên IMEDIATECH
		// 102 RequestId bị trùng
		// 103 Chữ ký không chính xác
		// 110 PartnerCode không chính xác
		// 111 PartnerCode đã bị xóa khỏi hệ thống
		// 112 PartnerCode chưa được kích hoạt
		// 113 Mã Operation là bắt buộc
		// 114 Mã Operation không chính xác
		// 115 Mã ngân hàng không chính xác
		// 116 Mã chi nhánh ngân hàng không chính xác
		// 117 Số tài khoản không hợp lệ
		// 118 Tên người nhận không hợp lệ
		// 119 Mã giao dịch bên đối tác gửi lên là bắt buộc
		// 120 Mã giao dịch bên đối tác gửi lên bị trùng
		// 121 Hệ thống không tìm thấy giao dịch
		// 122 Số tiền chuyển là bắt buộc
		// 123 Số tiền chuyển không hợp lệ
		// 124 Nội dung chuyển tiền không hợp lệ
		// 129 Không đủ hạn mức chi tiền hoặc đã hết hạn bảo lãnh
		SUCCESS(200, "Success"), REQUEST_FAIL(100, "Fail"), REQUEST_PENDING(99, "Request-Pending"),
		NO_PARTNER_FOUND(101, "No-Partner-Found"), NO_BILL_PROVIDER_FOUND(102, "No-Bill-Provider-Found"),
		DUPLICATE_CLIENT_REQUEST_ID(103, "Duplicate-ClientRequestID"), NO_BILL_FOUND(104, "No-Bill-Number-Found"),
		INVALID_PAYMENT_AMOUNT(105, "Invalid-Payment-Amount"),
		INVALID_CLIENT_REQUEST_ID(106, "Invalid-Client-RequestId"),
		PARTNER_BALANCE_REACH_LIMIT(107, "Partner-Balance-Exceed"),
		NO_CLIENT_REQUEST_ID_FOUND(108, "No-ClientRequestId-Found"), PARSE_PAYLOAD_FAIL(109, "Parse-Payload-Fail"),
		TRANSACTION_FAIL_FROM_PROVIDER(110, "Provider-Return-Fail"),
		TRANSACTION_ROUTE_FAIL(111, "Provider-Canbe-Route"), INVALID_BILL_NUMBER(112, "Invalid-Bill-Number"),
		NO_PROMOTION_FOUND(113, "No-Promotion-Found"), CONTRACT_PHONE_REQUIRE(114, "Input-Contract-Phonenumber"),
		PREPAID_PAYMENT_INF_NULL(115, "Prepaid-Payment-Info-Null"),
		PREPAID_PAYMENT_PARAM_EMPTY(116, "Prepaid-Payment-Info-Empty"),
		PREPAID_BILL_IS_NOT_ACCEPT(117, "Prepaid-Bill-Is-Not-Accept"),;

		private int value;
		private String message;

		private BillRpCode(int value, String message) {
			this.value = value;
			this.message = message;

		}

		public int getValue() {
			return value;
		}

		public String getMessage() {
			return message;
		}

		public static String getEnumByString(int code) {
			for (BillRpCode e : BillRpCode.values()) {
				if (e.value == code)
					return e.getMessage();
			}
			return null;
		}
	}
	
	public enum ProviderMapping {
	
//		- PHONE: Di động trả trước/trả sau
//		- TVADS: Truyền hình/Internet
//		- HOMEPHONE: Dịch vụ Homephone
//		- STATICPHONE: Cố định
//		VT-HOME
//		VT-HOME-PR
//		VT-BILL
//		VT-POST-PD
		INTERNET("VT-HOME","TVADS"),
		PHONE("VT-POST-PD","PHONE"),
		INTERNET_TT("VT-HOME-PR","TVADS"),;

		private String systemProvider;
		private String telcoProvider;

		private ProviderMapping(String systemProvider, String telcoProvider) {
			this.systemProvider = systemProvider;
			this.telcoProvider =telcoProvider;

		}

		
		
		
		public String getSystemProvider() {
			return systemProvider;
		}




		public void setSystemProvider(String systemProvider) {
			this.systemProvider = systemProvider;
		}




		public String getTelcoProvider() {
			return telcoProvider;
		}




		public void setTelcoProvider(String telcoProvider) {
			this.telcoProvider = telcoProvider;
		}




		public static String getEnumByString(String sysProvider) {
			for (ProviderMapping e : ProviderMapping.values()) {
				if (e.systemProvider.equalsIgnoreCase(sysProvider))
					return e.getTelcoProvider();
			}
			return null;
		}
	}
}
