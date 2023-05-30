package com.system.modals.modal;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "tracking_code_data")
public class TrackingCodeData implements java.io.Serializable{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "state_id")
    private int stateId;
    @Basic
    @Column(name = "tracking_code")
    private String trackingCode;
    @Basic
    @Column(name = "tracking_code_long_desc")
    private String trackingCodeLongDesc;
    @Basic
    @Column(name = "created_date")
    private Timestamp createdDate;

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getTrackingCode() {
        return trackingCode;
    }

    public void setTrackingCode(String trackingCode) {
        this.trackingCode = trackingCode;
    }

    public String getTrackingCodeLongDesc() {
        return trackingCodeLongDesc;
    }

    public void setTrackingCodeLongDesc(String trackingCodeLongDesc) {
        this.trackingCodeLongDesc = trackingCodeLongDesc;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TrackingCodeData that = (TrackingCodeData) o;
        return stateId == that.stateId && Objects.equals(trackingCode, that.trackingCode) && Objects.equals(trackingCodeLongDesc, that.trackingCodeLongDesc) && Objects.equals(createdDate, that.createdDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(stateId, trackingCode, trackingCodeLongDesc, createdDate);
    }
}
