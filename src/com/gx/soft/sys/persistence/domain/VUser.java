package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "v_user", schema = "meeting", catalog = "")
public class VUser {
    private String vUserKey;
    private String orgName;
    private String pOrgId;
    private String pOrgName;
    private String orgType;
    private String orgId;
    private String userName;
    private String userPassword;
    private String userId;
    private String userType;
    private String userMobileNum;
    private String userStatus;
    private String sysColorId;
    private String userCardId;
    private String comOrgId;
    private String comBdId;
    private Integer dataOrder;
    private String uioRowId;
    private String userRowId;
    private String clientId;

    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "v_user_key")
    public String getvUserKey() {
        return vUserKey;
    }

    public void setvUserKey(String vUserKey) {
        this.vUserKey = vUserKey;
    }

    @Basic
    @Column(name = "org_name")
    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    @Basic
    @Column(name = "p_org_id")
    public String getpOrgId() {
        return pOrgId;
    }

    public void setpOrgId(String pOrgId) {
        this.pOrgId = pOrgId;
    }

    @Basic
    @Column(name = "p_org_name")
    public String getpOrgName() {
        return pOrgName;
    }

    public void setpOrgName(String pOrgName) {
        this.pOrgName = pOrgName;
    }

    @Basic
    @Column(name = "org_type")
    public String getOrgType() {
        return orgType;
    }

    public void setOrgType(String orgType) {
        this.orgType = orgType;
    }

    @Basic
    @Column(name = "org_id")
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Basic
    @Column(name = "user_name")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "user_password")
    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Basic
    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "user_type")
    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Basic
    @Column(name = "user_mobile_num")
    public String getUserMobileNum() {
        return userMobileNum;
    }

    public void setUserMobileNum(String userMobileNum) {
        this.userMobileNum = userMobileNum;
    }

    @Basic
    @Column(name = "user_status")
    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    @Basic
    @Column(name = "sys_color_id")
    public String getSysColorId() {
        return sysColorId;
    }

    public void setSysColorId(String sysColorId) {
        this.sysColorId = sysColorId;
    }

    @Basic
    @Column(name = "user_card_id")
    public String getUserCardId() {
        return userCardId;
    }

    public void setUserCardId(String userCardId) {
        this.userCardId = userCardId;
    }

    @Basic
    @Column(name = "com_org_id")
    public String getComOrgId() {
        return comOrgId;
    }

    public void setComOrgId(String comOrgId) {
        this.comOrgId = comOrgId;
    }

    @Basic
    @Column(name = "com_bd_id")
    public String getComBdId() {
        return comBdId;
    }

    public void setComBdId(String comBdId) {
        this.comBdId = comBdId;
    }

    @Basic
    @Column(name = "data_order")
    public Integer getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(Integer dataOrder) {
        this.dataOrder = dataOrder;
    }

    @Basic
    @Column(name = "uio_row_id")
    public String getUioRowId() {
        return uioRowId;
    }

    public void setUioRowId(String uioRowId) {
        this.uioRowId = uioRowId;
    }

    @Basic
    @Column(name = "user_row_id")
    public String getUserRowId() {
        return userRowId;
    }

    public void setUserRowId(String userRowId) {
        this.userRowId = userRowId;
    }

    @Basic
    @Column(name = "client_id")
    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        VUser vUser = (VUser) o;
        return Objects.equals(vUserKey, vUser.vUserKey) &&
                Objects.equals(orgName, vUser.orgName) &&
                Objects.equals(pOrgId, vUser.pOrgId) &&
                Objects.equals(pOrgName, vUser.pOrgName) &&
                Objects.equals(orgType, vUser.orgType) &&
                Objects.equals(orgId, vUser.orgId) &&
                Objects.equals(userName, vUser.userName) &&
                Objects.equals(userPassword, vUser.userPassword) &&
                Objects.equals(userId, vUser.userId) &&
                Objects.equals(userType, vUser.userType) &&
                Objects.equals(userMobileNum, vUser.userMobileNum) &&
                Objects.equals(userStatus, vUser.userStatus) &&
                Objects.equals(sysColorId, vUser.sysColorId) &&
                Objects.equals(userCardId, vUser.userCardId) &&
                Objects.equals(comOrgId, vUser.comOrgId) &&
                Objects.equals(comBdId, vUser.comBdId) &&
                Objects.equals(dataOrder, vUser.dataOrder) &&
                Objects.equals(uioRowId, vUser.uioRowId) &&
                Objects.equals(userRowId, vUser.userRowId) &&
                Objects.equals(clientId, vUser.clientId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(vUserKey, orgName, pOrgId, pOrgName, orgType, orgId, userName, userPassword, userId, userType, userMobileNum, userStatus, sysColorId, userCardId, comOrgId, comBdId, dataOrder, uioRowId, userRowId, clientId);
    }
}
