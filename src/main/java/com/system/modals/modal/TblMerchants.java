package com.system.modals.modal;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "tbl_merchants")
public class TblMerchants implements java.io.Serializable{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "merchant_id")
    private int merchantId;
    @Basic
    @Column(name = "merchant_username")
    private String merchantUsername;
    @Basic
    @Column(name = "merchant_password")
    private String merchantPassword;
    @Basic
    @Column(name = "merchant_code")
    private String merchantCode;
    @Basic
    @Column(name = "merchant_type")
    private String merchantType;
    @Basic
    @Column(name = "merchant_name")
    private String merchantName;
    @Basic
    @Column(name = "merchant_address1")
    private String merchantAddress1;
    @Basic
    @Column(name = "merchant_address2")
    private String merchantAddress2;
    @Basic
    @Column(name = "merchant_address3")
    private String merchantAddress3;
    @Basic
    @Column(name = "merchant_balance")
    private long merchantBalance;
    @Basic
    @Column(name = "postal_code")
    private String postalCode;
    @Basic
    @Column(name = "DEFAULT_RECEIPT_COMPANY_NAME")
    private String defaultReceiptCompanyName;
    @Basic
    @Column(name = "DEFAULT_RECEIPT_OUTLET_LOCATION")
    private String defaultReceiptOutletLocation;
    @Basic
    @Column(name = "DEFAULT_RECEIPT_COMPANY_SLOGAN")
    private String defaultReceiptCompanySlogan;
    @Basic
    @Column(name = "CONTACT_TITLE")
    private String contactTitle;
    @Basic
    @Column(name = "CONTACT_NAME")
    private String contactName;
    @Basic
    @Column(name = "CONTACT_NUMBER")
    private String contactNumber;
    @Basic
    @Column(name = "CONTACT_EXTENSION_NUMBER")
    private String contactExtensionNumber;
    @Basic
    @Column(name = "CONTACT_FAX")
    private String contactFax;
    @Basic
    @Column(name = "BILLING_ADDRESS1")
    private String billingAddress1;
    @Basic
    @Column(name = "BILLING_ADDRESS2")
    private String billingAddress2;
    @Basic
    @Column(name = "BILLING_ADDRESS3")
    private String billingAddress3;
    @Basic
    @Column(name = "BILLING_POSTAL")
    private String billingPostal;
    @Basic
    @Column(name = "register_person")
    private int registerPerson;
    @Basic
    @Column(name = "register_datetime")
    private Timestamp registerDatetime;
    @Basic
    @Column(name = "update_person")
    private int updatePerson;
    @Basic
    @Column(name = "update_datetime")
    private Timestamp updateDatetime;
    @Basic
    @Column(name = "merchant_status")
    private String merchantStatus;
    @Basic
    @Column(name = "remark")
    private String remark;
    @Basic
    @Column(name = "owner_by")
    private String ownerBy;
    @Basic
    @Column(name = "owner_id")
    private Integer ownerId;
    @Basic
    @Column(name = "saleman_id")
    private Integer salemanId;
    @Basic
    @Column(name = "REGISTER_BY")
    private String registerBy;
    @Basic
    @Column(name = "UPDATE_BY")
    private String updateBy;
    @Basic
    @Column(name = "payment_type")
    private Integer paymentType;
    @Basic
    @Column(name = "alert_amount")
    private Integer alertAmount;
    @Basic
    @Column(name = "EMAIL")
    private String email;
    @Basic
    @Column(name = "PASSWORD_REPORT")
    private String passwordReport;
    @Basic
    @Column(name = "ACTIVATE")
    private Integer activate;
    @Basic
    @Column(name = "ip_list")
    private String ipList;
    @Basic
    @Column(name = "is_check_ip")
    private Integer isCheckIp;
    @Basic
    @Column(name = "public_key")
    private String publicKey;
    @Basic
    @Column(name = "public_key1")
    private String publicKey1;
    @Basic
    @Column(name = "authen_key")
    private String authenKey;
    @Basic
    @Column(name = "tax_code")
    private String taxCode;
    @Basic
    @Column(name = "merchant_debt")
    private Long merchantDebt;
    @Basic
    @Column(name = "bcrypt_password")
    private String bcryptPassword;
    @Basic
    @Column(name = "callback_trans_url")
    private String callbackTransUrl;

    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }

    public String getMerchantUsername() {
        return merchantUsername;
    }

    public void setMerchantUsername(String merchantUsername) {
        this.merchantUsername = merchantUsername;
    }

    public String getMerchantPassword() {
        return merchantPassword;
    }

    public void setMerchantPassword(String merchantPassword) {
        this.merchantPassword = merchantPassword;
    }

    public String getMerchantCode() {
        return merchantCode;
    }

    public void setMerchantCode(String merchantCode) {
        this.merchantCode = merchantCode;
    }

    public String getMerchantType() {
        return merchantType;
    }

    public void setMerchantType(String merchantType) {
        this.merchantType = merchantType;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getMerchantAddress1() {
        return merchantAddress1;
    }

    public void setMerchantAddress1(String merchantAddress1) {
        this.merchantAddress1 = merchantAddress1;
    }

    public String getMerchantAddress2() {
        return merchantAddress2;
    }

    public void setMerchantAddress2(String merchantAddress2) {
        this.merchantAddress2 = merchantAddress2;
    }

    public String getMerchantAddress3() {
        return merchantAddress3;
    }

    public void setMerchantAddress3(String merchantAddress3) {
        this.merchantAddress3 = merchantAddress3;
    }

    public long getMerchantBalance() {
        return merchantBalance;
    }

    public void setMerchantBalance(long merchantBalance) {
        this.merchantBalance = merchantBalance;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getDefaultReceiptCompanyName() {
        return defaultReceiptCompanyName;
    }

    public void setDefaultReceiptCompanyName(String defaultReceiptCompanyName) {
        this.defaultReceiptCompanyName = defaultReceiptCompanyName;
    }

    public String getDefaultReceiptOutletLocation() {
        return defaultReceiptOutletLocation;
    }

    public void setDefaultReceiptOutletLocation(String defaultReceiptOutletLocation) {
        this.defaultReceiptOutletLocation = defaultReceiptOutletLocation;
    }

    public String getDefaultReceiptCompanySlogan() {
        return defaultReceiptCompanySlogan;
    }

    public void setDefaultReceiptCompanySlogan(String defaultReceiptCompanySlogan) {
        this.defaultReceiptCompanySlogan = defaultReceiptCompanySlogan;
    }

    public String getContactTitle() {
        return contactTitle;
    }

    public void setContactTitle(String contactTitle) {
        this.contactTitle = contactTitle;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getContactExtensionNumber() {
        return contactExtensionNumber;
    }

    public void setContactExtensionNumber(String contactExtensionNumber) {
        this.contactExtensionNumber = contactExtensionNumber;
    }

    public String getContactFax() {
        return contactFax;
    }

    public void setContactFax(String contactFax) {
        this.contactFax = contactFax;
    }

    public String getBillingAddress1() {
        return billingAddress1;
    }

    public void setBillingAddress1(String billingAddress1) {
        this.billingAddress1 = billingAddress1;
    }

    public String getBillingAddress2() {
        return billingAddress2;
    }

    public void setBillingAddress2(String billingAddress2) {
        this.billingAddress2 = billingAddress2;
    }

    public String getBillingAddress3() {
        return billingAddress3;
    }

    public void setBillingAddress3(String billingAddress3) {
        this.billingAddress3 = billingAddress3;
    }

    public String getBillingPostal() {
        return billingPostal;
    }

    public void setBillingPostal(String billingPostal) {
        this.billingPostal = billingPostal;
    }

    public int getRegisterPerson() {
        return registerPerson;
    }

    public void setRegisterPerson(int registerPerson) {
        this.registerPerson = registerPerson;
    }

    public Timestamp getRegisterDatetime() {
        return registerDatetime;
    }

    public void setRegisterDatetime(Timestamp registerDatetime) {
        this.registerDatetime = registerDatetime;
    }

    public int getUpdatePerson() {
        return updatePerson;
    }

    public void setUpdatePerson(int updatePerson) {
        this.updatePerson = updatePerson;
    }

    public Timestamp getUpdateDatetime() {
        return updateDatetime;
    }

    public void setUpdateDatetime(Timestamp updateDatetime) {
        this.updateDatetime = updateDatetime;
    }

    public String getMerchantStatus() {
        return merchantStatus;
    }

    public void setMerchantStatus(String merchantStatus) {
        this.merchantStatus = merchantStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOwnerBy() {
        return ownerBy;
    }

    public void setOwnerBy(String ownerBy) {
        this.ownerBy = ownerBy;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public Integer getSalemanId() {
        return salemanId;
    }

    public void setSalemanId(Integer salemanId) {
        this.salemanId = salemanId;
    }

    public String getRegisterBy() {
        return registerBy;
    }

    public void setRegisterBy(String registerBy) {
        this.registerBy = registerBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public Integer getAlertAmount() {
        return alertAmount;
    }

    public void setAlertAmount(Integer alertAmount) {
        this.alertAmount = alertAmount;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordReport() {
        return passwordReport;
    }

    public void setPasswordReport(String passwordReport) {
        this.passwordReport = passwordReport;
    }

    public Integer getActivate() {
        return activate;
    }

    public void setActivate(Integer activate) {
        this.activate = activate;
    }

    public String getIpList() {
        return ipList;
    }

    public void setIpList(String ipList) {
        this.ipList = ipList;
    }

    public Integer getIsCheckIp() {
        return isCheckIp;
    }

    public void setIsCheckIp(Integer isCheckIp) {
        this.isCheckIp = isCheckIp;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getPublicKey1() {
        return publicKey1;
    }

    public void setPublicKey1(String publicKey1) {
        this.publicKey1 = publicKey1;
    }

    public String getAuthenKey() {
        return authenKey;
    }

    public void setAuthenKey(String authenKey) {
        this.authenKey = authenKey;
    }

    public String getTaxCode() {
        return taxCode;
    }

    public void setTaxCode(String taxCode) {
        this.taxCode = taxCode;
    }

    public Long getMerchantDebt() {
        return merchantDebt;
    }

    public void setMerchantDebt(Long merchantDebt) {
        this.merchantDebt = merchantDebt;
    }

    public String getBcryptPassword() {
        return bcryptPassword;
    }

    public void setBcryptPassword(String bcryptPassword) {
        this.bcryptPassword = bcryptPassword;
    }

    public String getCallbackTransUrl() {
        return callbackTransUrl;
    }

    public void setCallbackTransUrl(String callbackTransUrl) {
        this.callbackTransUrl = callbackTransUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TblMerchants that = (TblMerchants) o;
        return merchantId == that.merchantId && merchantBalance == that.merchantBalance && registerPerson == that.registerPerson && updatePerson == that.updatePerson && Objects.equals(merchantUsername, that.merchantUsername) && Objects.equals(merchantPassword, that.merchantPassword) && Objects.equals(merchantCode, that.merchantCode) && Objects.equals(merchantType, that.merchantType) && Objects.equals(merchantName, that.merchantName) && Objects.equals(merchantAddress1, that.merchantAddress1) && Objects.equals(merchantAddress2, that.merchantAddress2) && Objects.equals(merchantAddress3, that.merchantAddress3) && Objects.equals(postalCode, that.postalCode) && Objects.equals(defaultReceiptCompanyName, that.defaultReceiptCompanyName) && Objects.equals(defaultReceiptOutletLocation, that.defaultReceiptOutletLocation) && Objects.equals(defaultReceiptCompanySlogan, that.defaultReceiptCompanySlogan) && Objects.equals(contactTitle, that.contactTitle) && Objects.equals(contactName, that.contactName) && Objects.equals(contactNumber, that.contactNumber) && Objects.equals(contactExtensionNumber, that.contactExtensionNumber) && Objects.equals(contactFax, that.contactFax) && Objects.equals(billingAddress1, that.billingAddress1) && Objects.equals(billingAddress2, that.billingAddress2) && Objects.equals(billingAddress3, that.billingAddress3) && Objects.equals(billingPostal, that.billingPostal) && Objects.equals(registerDatetime, that.registerDatetime) && Objects.equals(updateDatetime, that.updateDatetime) && Objects.equals(merchantStatus, that.merchantStatus) && Objects.equals(remark, that.remark) && Objects.equals(ownerBy, that.ownerBy) && Objects.equals(ownerId, that.ownerId) && Objects.equals(salemanId, that.salemanId) && Objects.equals(registerBy, that.registerBy) && Objects.equals(updateBy, that.updateBy) && Objects.equals(paymentType, that.paymentType) && Objects.equals(alertAmount, that.alertAmount) && Objects.equals(email, that.email) && Objects.equals(passwordReport, that.passwordReport) && Objects.equals(activate, that.activate) && Objects.equals(ipList, that.ipList) && Objects.equals(isCheckIp, that.isCheckIp) && Objects.equals(publicKey, that.publicKey) && Objects.equals(publicKey1, that.publicKey1) && Objects.equals(authenKey, that.authenKey) && Objects.equals(taxCode, that.taxCode) && Objects.equals(merchantDebt, that.merchantDebt) && Objects.equals(bcryptPassword, that.bcryptPassword) && Objects.equals(callbackTransUrl, that.callbackTransUrl);
    }

    @Override
    public int hashCode() {
        return Objects.hash(merchantId, merchantUsername, merchantPassword, merchantCode, merchantType, merchantName, merchantAddress1, merchantAddress2, merchantAddress3, merchantBalance, postalCode, defaultReceiptCompanyName, defaultReceiptOutletLocation, defaultReceiptCompanySlogan, contactTitle, contactName, contactNumber, contactExtensionNumber, contactFax, billingAddress1, billingAddress2, billingAddress3, billingPostal, registerPerson, registerDatetime, updatePerson, updateDatetime, merchantStatus, remark, ownerBy, ownerId, salemanId, registerBy, updateBy, paymentType, alertAmount, email, passwordReport, activate, ipList, isCheckIp, publicKey, publicKey1, authenKey, taxCode, merchantDebt, bcryptPassword, callbackTransUrl);
    }
}
