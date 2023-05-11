package com.system.modals.modal;

// default package
// Generated Jun 27, 2022, 12:07:54 PM by Hibernate Tools 4.3.5.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TblDirectTopupTransactions generated by hbm2java
 */
@Entity
@Table(name = "TBL_DIRECT_TOPUP_TRANSACTIONS", schema = "dbo")
public class TblDirectTopupTransactions implements java.io.Serializable {

	private Integer directTopupTransactionId;
	private char channel;
	private int merchantId;
	private String mobileNumber;
	private long amount;
	private char directTopupTransactionResult;
	private char ackStatus;
	private Date directTopupTransactionDate;
	private String requestId;
	private String targetMobileNumber;
	private double commissionRate;
	private Integer terminalId;
	private String directRequestId;
	private String providerCode;
	private Date responseDate;
	private Integer telcoStatus;
	private Integer respStatus;
	private Integer providerId;
	private Character transactionStatusUpdated;
	private Date updatePendingTime;
	private Character isRefund;
	private Character oldStatus;
	private Integer checkPendingStatus;
	private Date approveTime;
	private String approveRefundInfo;
	private Integer systemVersion;
	private Integer accType;
	private String apiIp;

	public TblDirectTopupTransactions() {
	}

	public TblDirectTopupTransactions(char channel, int merchantId, long amount, char directTopupTransactionResult,
			char ackStatus, Date directTopupTransactionDate, String targetMobileNumber, double commissionRate) {
		this.channel = channel;
		this.merchantId = merchantId;
		this.amount = amount;
		this.directTopupTransactionResult = directTopupTransactionResult;
		this.ackStatus = ackStatus;
		this.directTopupTransactionDate = directTopupTransactionDate;
		this.targetMobileNumber = targetMobileNumber;
		this.commissionRate = commissionRate;
	}

	public TblDirectTopupTransactions(char channel, int merchantId, String mobileNumber, long amount,
			char directTopupTransactionResult, char ackStatus, Date directTopupTransactionDate, String requestId,
			String targetMobileNumber, double commissionRate, Integer terminalId, String directRequestId,
			String providerCode, Date responseDate, Integer telcoStatus, Integer respStatus, Integer providerId,
			Character transactionStatusUpdated, Date updatePendingTime, Character isRefund, Character oldStatus,
			Integer checkPendingStatus, Date approveTime, String approveRefundInfo, Integer systemVersion,
			Integer accType, String apiIp) {
		this.channel = channel;
		this.merchantId = merchantId;
		this.mobileNumber = mobileNumber;
		this.amount = amount;
		this.directTopupTransactionResult = directTopupTransactionResult;
		this.ackStatus = ackStatus;
		this.directTopupTransactionDate = directTopupTransactionDate;
		this.requestId = requestId;
		this.targetMobileNumber = targetMobileNumber;
		this.commissionRate = commissionRate;
		this.terminalId = terminalId;
		this.directRequestId = directRequestId;
		this.providerCode = providerCode;
		this.responseDate = responseDate;
		this.telcoStatus = telcoStatus;
		this.respStatus = respStatus;
		this.providerId = providerId;
		this.transactionStatusUpdated = transactionStatusUpdated;
		this.updatePendingTime = updatePendingTime;
		this.isRefund = isRefund;
		this.oldStatus = oldStatus;
		this.checkPendingStatus = checkPendingStatus;
		this.approveTime = approveTime;
		this.approveRefundInfo = approveRefundInfo;
		this.systemVersion = systemVersion;
		this.accType = accType;
		this.apiIp = apiIp;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "direct_topup_transaction_id", unique = true, nullable = false)
	public Integer getDirectTopupTransactionId() {
		return this.directTopupTransactionId;
	}

	public void setDirectTopupTransactionId(Integer directTopupTransactionId) {
		this.directTopupTransactionId = directTopupTransactionId;
	}

	@Column(name = "channel", nullable = false, length = 1)
	public char getChannel() {
		return this.channel;
	}

	public void setChannel(char channel) {
		this.channel = channel;
	}

	@Column(name = "merchant_id", nullable = false)
	public int getMerchantId() {
		return this.merchantId;
	}

	public void setMerchantId(int merchantId) {
		this.merchantId = merchantId;
	}

	@Column(name = "mobile_number", length = 20)
	public String getMobileNumber() {
		return this.mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@Column(name = "amount", nullable = false)
	public long getAmount() {
		return this.amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	@Column(name = "direct_topup_transaction_result", nullable = false, length = 1)
	public char getDirectTopupTransactionResult() {
		return this.directTopupTransactionResult;
	}

	public void setDirectTopupTransactionResult(char directTopupTransactionResult) {
		this.directTopupTransactionResult = directTopupTransactionResult;
	}

	@Column(name = "ack_status", nullable = false, length = 1)
	public char getAckStatus() {
		return this.ackStatus;
	}

	public void setAckStatus(char ackStatus) {
		this.ackStatus = ackStatus;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "direct_topup_transaction_date", nullable = false, length = 23)
	public Date getDirectTopupTransactionDate() {
		return this.directTopupTransactionDate;
	}

	public void setDirectTopupTransactionDate(Date directTopupTransactionDate) {
		this.directTopupTransactionDate = directTopupTransactionDate;
	}

	@Column(name = "request_id", length = 50)
	public String getRequestId() {
		return this.requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	@Column(name = "target_mobile_number", nullable = false, length = 30)
	public String getTargetMobileNumber() {
		return this.targetMobileNumber;
	}

	public void setTargetMobileNumber(String targetMobileNumber) {
		this.targetMobileNumber = targetMobileNumber;
	}

	@Column(name = "commission_rate", nullable = false, precision = 53, scale = 0)
	public double getCommissionRate() {
		return this.commissionRate;
	}

	public void setCommissionRate(double commissionRate) {
		this.commissionRate = commissionRate;
	}

	@Column(name = "terminal_id")
	public Integer getTerminalId() {
		return this.terminalId;
	}

	public void setTerminalId(Integer terminalId) {
		this.terminalId = terminalId;
	}

	@Column(name = "direct_request_id", length = 30)
	public String getDirectRequestId() {
		return this.directRequestId;
	}

	public void setDirectRequestId(String directRequestId) {
		this.directRequestId = directRequestId;
	}

	@Column(name = "provider_code", length = 30)
	public String getProviderCode() {
		return this.providerCode;
	}

	public void setProviderCode(String providerCode) {
		this.providerCode = providerCode;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "response_date", length = 23)
	public Date getResponseDate() {
		return this.responseDate;
	}

	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}

	@Column(name = "telco_status")
	public Integer getTelcoStatus() {
		return this.telcoStatus;
	}

	public void setTelcoStatus(Integer telcoStatus) {
		this.telcoStatus = telcoStatus;
	}

	@Column(name = "resp_status")
	public Integer getRespStatus() {
		return this.respStatus;
	}

	public void setRespStatus(Integer respStatus) {
		this.respStatus = respStatus;
	}

	@Column(name = "provider_id")
	public Integer getProviderId() {
		return this.providerId;
	}

	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}

	@Column(name = "transaction_status_updated", length = 1)
	public Character getTransactionStatusUpdated() {
		return this.transactionStatusUpdated;
	}

	public void setTransactionStatusUpdated(Character transactionStatusUpdated) {
		this.transactionStatusUpdated = transactionStatusUpdated;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_pending_time", length = 23)
	public Date getUpdatePendingTime() {
		return this.updatePendingTime;
	}

	public void setUpdatePendingTime(Date updatePendingTime) {
		this.updatePendingTime = updatePendingTime;
	}

	@Column(name = "is_refund", length = 1)
	public Character getIsRefund() {
		return this.isRefund;
	}

	public void setIsRefund(Character isRefund) {
		this.isRefund = isRefund;
	}

	@Column(name = "old_status", length = 1)
	public Character getOldStatus() {
		return this.oldStatus;
	}

	public void setOldStatus(Character oldStatus) {
		this.oldStatus = oldStatus;
	}

	@Column(name = "check_pending_status")
	public Integer getCheckPendingStatus() {
		return this.checkPendingStatus;
	}

	public void setCheckPendingStatus(Integer checkPendingStatus) {
		this.checkPendingStatus = checkPendingStatus;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "approve_time", length = 23)
	public Date getApproveTime() {
		return this.approveTime;
	}

	public void setApproveTime(Date approveTime) {
		this.approveTime = approveTime;
	}

	@Column(name = "approve_refund_info", length = 200)
	public String getApproveRefundInfo() {
		return this.approveRefundInfo;
	}

	public void setApproveRefundInfo(String approveRefundInfo) {
		this.approveRefundInfo = approveRefundInfo;
	}

	@Column(name = "system_version")
	public Integer getSystemVersion() {
		return this.systemVersion;
	}

	public void setSystemVersion(Integer systemVersion) {
		this.systemVersion = systemVersion;
	}

	@Column(name = "acc_type")
	public Integer getAccType() {
		return this.accType;
	}

	public void setAccType(Integer accType) {
		this.accType = accType;
	}

	@Column(name = "api_ip")
	public String getApiIp() {
		return this.apiIp;
	}

	public void setApiIp(String apiIp) {
		this.apiIp = apiIp;
	}

}
