package com.system.modals.modal;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "tracking_logs")
public class TrackingLogs implements java.io.Serializable{
    private Long rowId;
    private String orderCode;
    private String orderReferenceCode;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date changeDate;
    private String logLocation;

    private Integer stateId;
    private String remark;

    public TrackingLogs() {
    }

    public TrackingLogs(String orderCode, String orderReferenceCode, Date changeDate,
                          String logLocation, Integer stateId, String remark) {
        this.orderCode = orderCode;
        this.orderReferenceCode = orderReferenceCode;
        this.changeDate = changeDate;
        this.logLocation = logLocation;
        this.stateId = stateId;
        this.remark = remark;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "row_id", unique = true, nullable = false)
    public Long getRowId() {
        return this.rowId;
    }

    public void setRowId(Long rowId) {
        this.rowId = rowId;
    }

    @Column(name = "order_code", length = 23)
    public String getOrderCode() {
        return this.orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    @Column(name = "order_reference_code")
    public String getOrderReferenceCode() {
        return this.orderReferenceCode;
    }

    public void setOrderReferenceCode(String orderReferenceCode) {
        this.orderReferenceCode = orderReferenceCode;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "change_date", length = 23)
    public Date getChangeDate() {
        return this.changeDate;
    }

    public void setChangeDate(Date changeDate) {
        this.changeDate = changeDate;
    }

    @Column(name = "log_location")
    public String getLogLocation() {
        return this.logLocation;
    }

    public void setLogLocation(String logLocation) {
        this.logLocation = logLocation;
    }

    @Column(name = "state_id")
    public Integer getStateId() {
        return this.stateId;
    }

    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }

    @Column(name = "remark")
    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
