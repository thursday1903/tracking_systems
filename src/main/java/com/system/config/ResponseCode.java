package com.system.config;

public class ResponseCode {

	public enum RpCode {
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
		SUCCESS(200, "Success", "Thành công"), 
		REQUEST_FAIL(100, "Fail", "Thất bại"), 
		REQUEST_PENDING(99, "Request-Pending","Yêu cầu đang được xử lý"),
		NO_ACCOUNT_FOUND(101, "No-Account-Found","Không tìm thấy thông tin tài khoản"), 
		REG_ACCOUNT_EXISTED(102, "Account-Existed","Tài khoản đã tồn tại"),
		DUPLICATE_CLIENT_REQUEST_ID(103, "Duplicate-ClientRequestID","Trùng client requestId"), 
		REG_INVALID_ACC_USERNAME(104, "Invalid-Acc-Username","Sai account username"),
		INVALID_PAYMENT_AMOUNT(105, "Invalid-Payment-Amount","Sai giá trị giao dịch"),
		ACCOUNT_HAVENO_PHONE(106, "Account-Have-No-Phone","Tài khoản không có số điện thoại"),
		PARTNER_BALANCE_REACH_LIMIT(107, "Partner-Balance-Exceed","Số dư tài khoản không đủ"),
		NO_CLIENT_REQUEST_ID_FOUND(108, "No-ClientRequestId-Found","Không thấy client requestId"),
		PARSE_PAYLOAD_FAIL(109, "Parse-Payload-Fail","Parse body thất bại"),
		TRANSACTION_FAIL_FROM_PROVIDER(110, "Provider-Return-Fail","Nhà cung cấp trả kết quả thất bại"),
		ACCOUNT_IS_NOT_ACCEPT_TO_GENERATE_ID(111, "Account-Is-Not-Accepted-To-Generate-Id","Account không được chấp nhận để sinh ID"),
		NEW_PASSWORD_CANBE_THE_SAMETO_OLD_PASSWORD(112, "New password canbe the same old passowrd","Mật khấu mới và cũ không được giống nhau"),
		INVALID_JWT_OR_BODY(113, "Invalid-Jwt-Body","JWT boby không hợp lệ"),
		TRANSACTION_NOT_MATCH_TO_ACCOUNT(114,"Transaction ID is not match to account","Giao dịch không khớp với tài khoản"),
		BALANCE_IS_NOT_ENOUGH(114,"Balance-Is-Not-Enough","Số dư không đủ"),
		INVALID_OTP(115,"Invalid-Otp","Sai mã OTP"),
		INVALID_USER_OR_PASSWORD(116,"Invalid-Account-Password","Tên đăng nhập hoặc mật khẩu không đúng, vui lòng kiểm tra lại"),
		INVALID_PRODUCT_SELECTED(117,"Invalid-Product-Selected","Sai sản phẩm"),
		CLIENT_REQUEST_ID_EMPTY(118,"Client-RequestID-Empty","Client Requets Id Rỗng"),
		PASSWORD_INVALID_FORMAT(119,"Pasword-Invalid-Format","Mật khẩu không đúng định dạng"),
		UPDATE_ACCOUNT_INFO_PARAM_NULL(120,"Update-Account-Info-Param-Null","Thông tin cập nhật tài khoản bị null"),
		ACCOUNT_REACH_LIMITATION_PER_DAY(121,"Account-Reach-OTP-Limitation-A-Day","Quá lượng OTP được lấy trong ngày"),
		OTP_EXPIRE_OR_NOT_EXISTD(122,"OTP-Expire-Or-Not-Existed","OTP không tồn tại hoặc đã hết hạn"),
		BALANCE_CHANGE_REQ_INVALID_TYPE(124,"Invalid-Change-Type","Sai change type"),
		BALANCE_CHANGE_REQ_INVALID_SUB_TYPE(125,"Invalid-Change-Sub-Type","Sai change sub type"),
		INVALID_BANK_ID(126,"Invalid-Bank-Id","Lựa chọn sai thông tin bank"),
		ACCOUNT_BANK_EXISTED(127,"Account-Bank-Existed","Sô tài khoản bank đã tồn tại"),
		NO_ACCOUNT_BANK_EXISTED(128,"No-Account-Bank-Existed","Số tài khoản bank không tồn tại"),
		ACCOUNT_IS_SALEMAN(129,"Account-Was-Sale","Account đã là NVKD"),
		ACCOUNT_ACTIVE_SALE_PENDING(130,"Account-Wait-For-Active-Sale","Account đang đợi duyệt làm NVKD"),
		ADMIN_NAME_EMPTY(131,"Admin-Name-Is-Empty","Tên Admin rỗng"),
		NO_RECORD_FOUND(132,"No-Record-Found","Không thấy bản ghi nào"),
		REQUEST_WAS_APPROVED_REJECT_BEFORE(133,"Request-Was-Approved-Reject-Before","Yêu cầu đã được xác nhận|từ chối trước đó"),
		NO_ADMIN_FOUND(134,"No-Admin-Found","Không tìm thấy thông tin Admin"),
		ADMIN_CREATED_AND_APPROVED_CANTBE_THE_SAME(135,"Approved-Admin-Must-Difference-From-Verify","Người duyệt phải khác với người tạo yêu cầu"),
		INVALID_WITHDRAWAL_PARAMS(136,"AccBankNo-AccBankName-Empty","Acount Bank hoặc Account name rỗng"),
		SET_ANOTHER_BANK_DEFAULT_BEFORE_REMOVE(137,"Set-Another-Default-Bank-Before-Remove","Yêu cầu Đặt một mã bank khác làm mặc định"),
		NO_PRODUCT_DETAIL_FOUND(138,"No-Product-Detail-Id-Found","Không có chi tiết sản phẩm nào được chọn"),
		INVEST_AMOUNT_NOT_MATCH_LOWER_LIMIT(145,"Invest-Amount-Mustbe-Greater-Than-Product-Mininum-Require","Số tiền đầu tư chua đạt giá trị nhỏ nhất của gói"),
		PAYMENT_WITH_THE_SAME_DATA_EXT_BEFORE(139,"Payment-With-The-Same-Data-Exist-Before","Có một giao dịch với thông tin tương tự vừa thực hiện trước đó"),
		PAYMENT_COMPLETE(140,"Payment-Complete-Cycle","Gói mua đã hoàn thành chu kỳ"),
		PAYMENT_SETTLED(141,"Payment-Settled-Complete","Gói mua đã được kết toán"),
		INVALID_VERIFY_REQUEST_STATUS(142,"Invalid-Verify-Request-Status","Trạng thái xác nhận|từ chối không đúng"),
		INVALID_MANAGE_CODE(143,"Invalid-Manager-Code","Sai mã người giới thiệu, người quản lý"),
		INVALID_INVITATION_CODE(144,"Invalid-Invitation-Code","Sai mã người giới thiệu"),
		ACCOUNT_INFO_GOT_PROBLEM(145,"Account-Data-Got-Problem-Please-Contact-To-Admin","Tài khoản có vấn đề về số dư, liên hệ Admin để được hỗ trợ"),
		PAYMENT_CYCLE_NOT_ACCEPTED_TO_RENEWAL(146,"Contract-Not-Accept-To-Update","Gói mua không được phép cập nhật"),		
		RENEWAL_FLAG_IS_INVALID(147,"Renewal-Flag-Is-Invalid","Trạng thái tái tục không hợp lệ"),
		BALANCE_CHANGE_REQUEST_MUST_HAVE_ATTACH_BILL(148,"Please-attach-bill-to-this-balance-change-request","Thêm mã chứng từ cho yêu cầu thanh toán này"),
		IP_REJECTED(149,"IP-Rejected","IP khong dc phép truy cập"),
		INVALID_DATE_FORMATyyyyMMdd(150,"Invalid date format","Sai định dạng ngày "),
		INVALID_OLD_PASSWORD(151,"Invalid Old Password","Mật khẩu cũ không đúng"),
		INVALID_FORCE_SETTLE_INTEREST(152,"Input Invalid Force Settle Interest","Lãi tất toán nhập vào không hợp lệ"),
		ACC_BANK_REACH_LIMIT_NUMBER(153,"Number of adding account bank reach limit","Số lượng bank tối đa là 5, xóa tài khoản cũ để thực thi tiếp"),
		INVALID_EMAIL_FORMAT(154,"Invalid email format","Không đúng định dạng email"),
		RENEWAL_SELECTION_IS_NOT_ACCEPT(156,"This renewal method can be select","Không thể đăng ký tái tục cho gọi đầu tư này"),
		;

		private int value;
		private String message;
		private String vi_message;
		
		private RpCode(int value, String message, String vi_message) {
			this.value = value;
			this.message = message;
			this.vi_message = vi_message;
		}

		public int getValue() {
			return value;
		}
		
		public String getMessage()
		{
			return message;
		}
		
		public String getViMessage()
		{
			return vi_message;
		}

		public static String getEnumByString(int code){
			for(RpCode e : RpCode.values()){
				if(e.value ==code) return e.getMessage();
			}
			return "N/A";
		}
		public static String getViMessage(int code){
	        for(RpCode e : RpCode.values()){
	            if(e.value ==code) return e.getViMessage();
	        }
	        return "N/A";
	    }
		
		public static void printCodeAndMessage(){
	        for(RpCode e : RpCode.values()){
	            System.out.println(e.getValue()+":"+e.getMessage());
	        }
	    }
	}
	
	public static void main(String[] args) {
		ResponseCode.RpCode.printCodeAndMessage();
	}

}
