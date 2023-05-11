package com.system.modals.billing;

// default package
// Generated Jan 30, 2023, 2:34:39 PM by Hibernate Tools 4.3.5.Final

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * TblMerchants generated by hbm2java
 */
@Entity
@Table(name = "TBL_MERCHANTS", schema = "dbo", uniqueConstraints = @UniqueConstraint(columnNames = "merchant_username"))
public class TblMerchants implements java.io.Serializable {

	private Integer merchantId;
	private String merchantUsername;
	private String merchantPassword;
	private String merchantCode;
	private char merchantType;
	private String merchantName;
	private String merchantAddress1;
	private String merchantAddress2;
	private String merchantAddress3;
	private long merchantBalance;
	private String postalCode;
	private String defaultReceiptCompanyName;
	private String defaultReceiptOutletLocation;
	private String defaultReceiptCompanySlogan;
	private String contactTitle;
	private String contactName;
	private String contactNumber;
	private String contactExtensionNumber;
	private String contactFax;
	private String billingAddress1;
	private String billingAddress2;
	private String billingAddress3;
	private String billingPostal;
	private int registerPerson;
	private Date registerDatetime;
	private int updatePerson;
	private Date updateDatetime;
	private Character merchantStatus;
	private String remark;
	private char ownerBy;
	private Integer ownerId;
	private Integer salemanId;
	private char registerBy;
	private char updateBy;
	private Integer paymentType;
	private Integer alertAmount;
	private String email;
	private String passwordReport;
	private Integer activate;
	private String ipList;
	private Integer isCheckIp;
	private String publicKey;
	private String publicKey1;
	private String authenKey;
	private String taxCode;
	private Long merchantDebt;
	private String bcryptPassword;

	public TblMerchants() {
	}

	public TblMerchants(String merchantUsername, String merchantPassword, char merchantType,
			String merchantName, long merchantBalance, String postalCode, int registerPerson,
			Date registerDatetime, int updatePerson, Date updateDatetime, char ownerBy, char registerBy,
			char updateBy) {
		this.merchantUsername = merchantUsername;
		this.merchantPassword = merchantPassword;
		this.merchantType = merchantType;
		this.merchantName = merchantName;
		this.merchantBalance = merchantBalance;
		this.postalCode = postalCode;
		this.registerPerson = registerPerson;
		this.registerDatetime = registerDatetime;
		this.updatePerson = updatePerson;
		this.updateDatetime = updateDatetime;
		this.ownerBy = ownerBy;
		this.registerBy = registerBy;
		this.updateBy = updateBy;
	}

	public TblMerchants(String merchantUsername, String merchantPassword, String merchantCode,
			char merchantType, String merchantName, String merchantAddress1, String merchantAddress2,
			String merchantAddress3, long merchantBalance, String postalCode,
			String defaultReceiptCompanyName, String defaultReceiptOutletLocation,
			String defaultReceiptCompanySlogan, String contactTitle, String contactName,
			String contactNumber, String contactExtensionNumber, String contactFax, String billingAddress1,
			String billingAddress2, String billingAddress3, String billingPostal, int registerPerson,
			Date registerDatetime, int updatePerson, Date updateDatetime, Character merchantStatus, String remark,
			char ownerBy, Integer ownerId, Integer salemanId, char registerBy, char updateBy, Integer paymentType,
			Integer alertAmount, String email, String passwordReport, Integer activate, String ipList,
			Integer isCheckIp, String publicKey, String publicKey1, String authenKey, String taxCode, Long merchantDebt,
			String bcryptPassword) {
		this.merchantUsername = merchantUsername;
		this.merchantPassword = merchantPassword;
		this.merchantCode = merchantCode;
		this.merchantType = merchantType;
		this.merchantName = merchantName;
		this.merchantAddress1 = merchantAddress1;
		this.merchantAddress2 = merchantAddress2;
		this.merchantAddress3 = merchantAddress3;
		this.merchantBalance = merchantBalance;
		this.postalCode = postalCode;
		this.defaultReceiptCompanyName = defaultReceiptCompanyName;
		this.defaultReceiptOutletLocation = defaultReceiptOutletLocation;
		this.defaultReceiptCompanySlogan = defaultReceiptCompanySlogan;
		this.contactTitle = contactTitle;
		this.contactName = contactName;
		this.contactNumber = contactNumber;
		this.contactExtensionNumber = contactExtensionNumber;
		this.contactFax = contactFax;
		this.billingAddress1 = billingAddress1;
		this.billingAddress2 = billingAddress2;
		this.billingAddress3 = billingAddress3;
		this.billingPostal = billingPostal;
		this.registerPerson = registerPerson;
		this.registerDatetime = registerDatetime;
		this.updatePerson = updatePerson;
		this.updateDatetime = updateDatetime;
		this.merchantStatus = merchantStatus;
		this.remark = remark;
		this.ownerBy = ownerBy;
		this.ownerId = ownerId;
		this.salemanId = salemanId;
		this.registerBy = registerBy;
		this.updateBy = updateBy;
		this.paymentType = paymentType;
		this.alertAmount = alertAmount;
		this.email = email;
		this.passwordReport = passwordReport;
		this.activate = activate;
		this.ipList = ipList;
		this.isCheckIp = isCheckIp;
		this.publicKey = publicKey;
		this.publicKey1 = publicKey1;
		this.authenKey = authenKey;
		this.taxCode = taxCode;
		this.merchantDebt = merchantDebt;
		this.bcryptPassword = bcryptPassword;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "merchant_id", unique = true, nullable = false)
	public Integer getMerchantId() {
		return this.merchantId;
	}

	public void setMerchantId(Integer merchantId) {
		this.merchantId = merchantId;
	}

	@Column(name = "merchant_username", unique = true, nullable = false)
	public String getMerchantUsername() {
		return this.merchantUsername;
	}

	public void setMerchantUsername(String merchantUsername) {
		this.merchantUsername = merchantUsername;
	}

	@Column(name = "merchant_password", nullable = false)
	public String getMerchantPassword() {
		return this.merchantPassword;
	}

	public void setMerchantPassword(String merchantPassword) {
		this.merchantPassword = merchantPassword;
	}

	@Column(name = "merchant_code")
	public String getMerchantCode() {
		return this.merchantCode;
	}

	public void setMerchantCode(String merchantCode) {
		this.merchantCode = merchantCode;
	}

	@Column(name = "merchant_type", nullable = false, length = 1)
	public char getMerchantType() {
		return this.merchantType;
	}

	public void setMerchantType(char merchantType) {
		this.merchantType = merchantType;
	}

	@Column(name = "merchant_name", nullable = false)
	public String getMerchantName() {
		return this.merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	@Column(name = "merchant_address1")
	public String getMerchantAddress1() {
		return this.merchantAddress1;
	}

	public void setMerchantAddress1(String merchantAddress1) {
		this.merchantAddress1 = merchantAddress1;
	}

	@Column(name = "merchant_address2")
	public String getMerchantAddress2() {
		return this.merchantAddress2;
	}

	public void setMerchantAddress2(String merchantAddress2) {
		this.merchantAddress2 = merchantAddress2;
	}

	@Column(name = "merchant_address3")
	public String getMerchantAddress3() {
		return this.merchantAddress3;
	}

	public void setMerchantAddress3(String merchantAddress3) {
		this.merchantAddress3 = merchantAddress3;
	}

	@Column(name = "merchant_balance", nullable = false)
	public long getMerchantBalance() {
		return this.merchantBalance;
	}

	public void setMerchantBalance(long merchantBalance) {
		this.merchantBalance = merchantBalance;
	}

	@Column(name = "postal_code", nullable = false, length = 10)
	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@Column(name = "DEFAULT_RECEIPT_COMPANY_NAME")
	public String getDefaultReceiptCompanyName() {
		return this.defaultReceiptCompanyName;
	}

	public void setDefaultReceiptCompanyName(String defaultReceiptCompanyName) {
		this.defaultReceiptCompanyName = defaultReceiptCompanyName;
	}

	@Column(name = "DEFAULT_RECEIPT_OUTLET_LOCATION")
	public String getDefaultReceiptOutletLocation() {
		return this.defaultReceiptOutletLocation;
	}

	public void setDefaultReceiptOutletLocation(String defaultReceiptOutletLocation) {
		this.defaultReceiptOutletLocation = defaultReceiptOutletLocation;
	}

	@Column(name = "DEFAULT_RECEIPT_COMPANY_SLOGAN")
	public String getDefaultReceiptCompanySlogan() {
		return this.defaultReceiptCompanySlogan;
	}

	public void setDefaultReceiptCompanySlogan(String defaultReceiptCompanySlogan) {
		this.defaultReceiptCompanySlogan = defaultReceiptCompanySlogan;
	}

	@Column(name = "CONTACT_TITLE")
	public String getContactTitle() {
		return this.contactTitle;
	}

	public void setContactTitle(String contactTitle) {
		this.contactTitle = contactTitle;
	}

	@Column(name = "CONTACT_NAME")
	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	@Column(name = "CONTACT_NUMBER")
	public String getContactNumber() {
		return this.contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	@Column(name = "CONTACT_EXTENSION_NUMBER", length = 10)
	public String getContactExtensionNumber() {
		return this.contactExtensionNumber;
	}

	public void setContactExtensionNumber(String contactExtensionNumber) {
		this.contactExtensionNumber = contactExtensionNumber;
	}

	@Column(name = "CONTACT_FAX")
	public String getContactFax() {
		return this.contactFax;
	}

	public void setContactFax(String contactFax) {
		this.contactFax = contactFax;
	}

	@Column(name = "BILLING_ADDRESS1")
	public String getBillingAddress1() {
		return this.billingAddress1;
	}

	public void setBillingAddress1(String billingAddress1) {
		this.billingAddress1 = billingAddress1;
	}

	@Column(name = "BILLING_ADDRESS2")
	public String getBillingAddress2() {
		return this.billingAddress2;
	}

	public void setBillingAddress2(String billingAddress2) {
		this.billingAddress2 = billingAddress2;
	}

	@Column(name = "BILLING_ADDRESS3")
	public String getBillingAddress3() {
		return this.billingAddress3;
	}

	public void setBillingAddress3(String billingAddress3) {
		this.billingAddress3 = billingAddress3;
	}

	@Column(name = "BILLING_POSTAL")
	public String getBillingPostal() {
		return this.billingPostal;
	}

	public void setBillingPostal(String billingPostal) {
		this.billingPostal = billingPostal;
	}

	@Column(name = "register_person", nullable = false)
	public int getRegisterPerson() {
		return this.registerPerson;
	}

	public void setRegisterPerson(int registerPerson) {
		this.registerPerson = registerPerson;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "register_datetime", nullable = false, length = 23)
	public Date getRegisterDatetime() {
		return this.registerDatetime;
	}

	public void setRegisterDatetime(Date registerDatetime) {
		this.registerDatetime = registerDatetime;
	}

	@Column(name = "update_person", nullable = false)
	public int getUpdatePerson() {
		return this.updatePerson;
	}

	public void setUpdatePerson(int updatePerson) {
		this.updatePerson = updatePerson;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_datetime", nullable = false, length = 23)
	public Date getUpdateDatetime() {
		return this.updateDatetime;
	}

	public void setUpdateDatetime(Date updateDatetime) {
		this.updateDatetime = updateDatetime;
	}

	@Column(name = "merchant_status", length = 1)
	public Character getMerchantStatus() {
		return this.merchantStatus;
	}

	public void setMerchantStatus(Character merchantStatus) {
		this.merchantStatus = merchantStatus;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "owner_by", nullable = false, length = 1)
	public char getOwnerBy() {
		return this.ownerBy;
	}

	public void setOwnerBy(char ownerBy) {
		this.ownerBy = ownerBy;
	}

	@Column(name = "owner_id")
	public Integer getOwnerId() {
		return this.ownerId;
	}

	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}

	@Column(name = "saleman_id")
	public Integer getSalemanId() {
		return this.salemanId;
	}

	public void setSalemanId(Integer salemanId) {
		this.salemanId = salemanId;
	}

	@Column(name = "REGISTER_BY", nullable = false, length = 1)
	public char getRegisterBy() {
		return this.registerBy;
	}

	public void setRegisterBy(char registerBy) {
		this.registerBy = registerBy;
	}

	@Column(name = "UPDATE_BY", nullable = false, length = 1)
	public char getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(char updateBy) {
		this.updateBy = updateBy;
	}

	@Column(name = "payment_type")
	public Integer getPaymentType() {
		return this.paymentType;
	}

	public void setPaymentType(Integer paymentType) {
		this.paymentType = paymentType;
	}

	@Column(name = "alert_amount")
	public Integer getAlertAmount() {
		return this.alertAmount;
	}

	public void setAlertAmount(Integer alertAmount) {
		this.alertAmount = alertAmount;
	}

	@Column(name = "EMAIL")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "PASSWORD_REPORT")
	public String getPasswordReport() {
		return this.passwordReport;
	}

	public void setPasswordReport(String passwordReport) {
		this.passwordReport = passwordReport;
	}

	@Column(name = "ACTIVATE")
	public Integer getActivate() {
		return this.activate;
	}

	public void setActivate(Integer activate) {
		this.activate = activate;
	}

	@Column(name = "ip_list")
	public String getIpList() {
		return this.ipList;
	}

	public void setIpList(String ipList) {
		this.ipList = ipList;
	}

	@Column(name = "is_check_ip")
	public Integer getIsCheckIp() {
		return this.isCheckIp;
	}

	public void setIsCheckIp(Integer isCheckIp) {
		this.isCheckIp = isCheckIp;
	}

	@Column(name = "public_key", length = 1000)
	public String getPublicKey() {
		return this.publicKey;
	}

	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}

	@Column(name = "public_key1", length = 1000)
	public String getPublicKey1() {
		return this.publicKey1;
	}

	public void setPublicKey1(String publicKey1) {
		this.publicKey1 = publicKey1;
	}

	@Column(name = "authen_key", length = 50)
	public String getAuthenKey() {
		return this.authenKey;
	}

	public void setAuthenKey(String authenKey) {
		this.authenKey = authenKey;
	}

	@Column(name = "tax_code", length = 1000)
	public String getTaxCode() {
		return this.taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	@Column(name = "merchant_debt")
	public Long getMerchantDebt() {
		return this.merchantDebt;
	}

	public void setMerchantDebt(Long merchantDebt) {
		this.merchantDebt = merchantDebt;
	}

	@Column(name = "bcrypt_password", length = 500)
	public String getBcryptPassword() {
		return this.bcryptPassword;
	}

	public void setBcryptPassword(String bcryptPassword) {
		this.bcryptPassword = bcryptPassword;
	}

}