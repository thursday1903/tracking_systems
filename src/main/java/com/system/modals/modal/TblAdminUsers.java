package com.system.modals.modal;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "tbl_admin_users")
public class TblAdminUsers implements java.io.Serializable{
    public TblAdminUsers() {
    }

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "admin_user_id")
    private int adminUserId;
    @Basic
    @Column(name = "admin_user_name")
    private String adminUserName;
    @Basic
    @Column(name = "admin_user_password")
    private String adminUserPassword;
    @Basic
    @Column(name = "admin_user_email")
    private String adminUserEmail;
    @Basic
    @Column(name = "admin_user_fullname")
    private String adminUserFullname;
    @Basic
    @Column(name = "admin_user_status")
    private String adminUserStatus;
    @Basic
    @Column(name = "bcrypt_password")
    private String bcryptPassword;

    public int getAdminUserId() {
        return adminUserId;
    }

    public void setAdminUserId(int adminUserId) {
        this.adminUserId = adminUserId;
    }

    public String getAdminUserName() {
        return adminUserName;
    }

    public void setAdminUserName(String adminUserName) {
        this.adminUserName = adminUserName;
    }

    public String getAdminUserPassword() {
        return adminUserPassword;
    }

    public void setAdminUserPassword(String adminUserPassword) {
        this.adminUserPassword = adminUserPassword;
    }

    public String getAdminUserEmail() {
        return adminUserEmail;
    }

    public void setAdminUserEmail(String adminUserEmail) {
        this.adminUserEmail = adminUserEmail;
    }

    public String getAdminUserFullname() {
        return adminUserFullname;
    }

    public void setAdminUserFullname(String adminUserFullname) {
        this.adminUserFullname = adminUserFullname;
    }

    public String getAdminUserStatus() {
        return adminUserStatus;
    }

    public void setAdminUserStatus(String adminUserStatus) {
        this.adminUserStatus = adminUserStatus;
    }

    public String getBcryptPassword() {
        return bcryptPassword;
    }

    public void setBcryptPassword(String bcryptPassword) {
        this.bcryptPassword = bcryptPassword;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TblAdminUsers that = (TblAdminUsers) o;
        return adminUserId == that.adminUserId && Objects.equals(adminUserName, that.adminUserName) && Objects.equals(adminUserPassword, that.adminUserPassword) && Objects.equals(adminUserEmail, that.adminUserEmail) && Objects.equals(adminUserFullname, that.adminUserFullname) && Objects.equals(adminUserStatus, that.adminUserStatus) && Objects.equals(bcryptPassword, that.bcryptPassword);
    }

    @Override
    public int hashCode() {
        return Objects.hash(adminUserId, adminUserName, adminUserPassword, adminUserEmail, adminUserFullname, adminUserStatus, bcryptPassword);
    }
}
