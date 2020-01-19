package com.gx.soft.weeklywork.persistence.domain;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "v_org_role_user", schema = "meeting", catalog = "")
public class VOrgRoleUser {
    private String vRoleUserKey;
    private String userKey;
    private String userName;
    private String userShowName;
    private String userEnName;
    private String userId;
    private Timestamp createTime;
    private String createUserId;
    private String dataStatus;
    private Integer dataOrder;
    private String userMobileNum;
    private String userSex;
    private String userType;
    private String roleKey;
    private String roleName;
    private String roleId;
    private String roleIntro;
    private Timestamp rCreateTime;
    private String rCreateUserId;
    private Long rDataOrder;
    private String roleType;
    private String rlType;
    private String rhuId;

    @Id
    @Column(name = "v_role_user_key")
    public String getvRoleUserKey() {
        return vRoleUserKey;
    }

    public void setvRoleUserKey(String vRoleUserKey) {
        this.vRoleUserKey = vRoleUserKey;
    }

    @Basic
    @Column(name = "user_key")
    public String getUserKey() {
        return userKey;
    }

    public void setUserKey(String userKey) {
        this.userKey = userKey;
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
    @Column(name = "user_show_name")
    public String getUserShowName() {
        return userShowName;
    }

    public void setUserShowName(String userShowName) {
        this.userShowName = userShowName;
    }

    @Basic
    @Column(name = "user_en_name")
    public String getUserEnName() {
        return userEnName;
    }

    public void setUserEnName(String userEnName) {
        this.userEnName = userEnName;
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
    @Column(name = "create_time")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "create_user_id")
    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Basic
    @Column(name = "data_status")
    public String getDataStatus() {
        return dataStatus;
    }

    public void setDataStatus(String dataStatus) {
        this.dataStatus = dataStatus;
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
    @Column(name = "user_mobile_num")
    public String getUserMobileNum() {
        return userMobileNum;
    }

    public void setUserMobileNum(String userMobileNum) {
        this.userMobileNum = userMobileNum;
    }

    @Basic
    @Column(name = "user_sex")
    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
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
    @Column(name = "role_key")
    public String getRoleKey() {
        return roleKey;
    }

    public void setRoleKey(String roleKey) {
        this.roleKey = roleKey;
    }

    @Basic
    @Column(name = "role_name")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Basic
    @Column(name = "role_id")
    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Basic
    @Column(name = "role_intro")
    public String getRoleIntro() {
        return roleIntro;
    }

    public void setRoleIntro(String roleIntro) {
        this.roleIntro = roleIntro;
    }

    @Basic
    @Column(name = "r_create_time")
    public Timestamp getrCreateTime() {
        return rCreateTime;
    }

    public void setrCreateTime(Timestamp rCreateTime) {
        this.rCreateTime = rCreateTime;
    }

    @Basic
    @Column(name = "r_create_user_id")
    public String getrCreateUserId() {
        return rCreateUserId;
    }

    public void setrCreateUserId(String rCreateUserId) {
        this.rCreateUserId = rCreateUserId;
    }

    @Basic
    @Column(name = "r_data_order")
    public Long getrDataOrder() {
        return rDataOrder;
    }

    public void setrDataOrder(Long rDataOrder) {
        this.rDataOrder = rDataOrder;
    }

    @Basic
    @Column(name = "role_type")
    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    @Basic
    @Column(name = "rl_type")
    public String getRlType() {
        return rlType;
    }

    public void setRlType(String rlType) {
        this.rlType = rlType;
    }

    @Basic
    @Column(name = "rhu_id")
    public String getRhuId() {
        return rhuId;
    }

    public void setRhuId(String rhuId) {
        this.rhuId = rhuId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VOrgRoleUser that = (VOrgRoleUser) o;

        if (vRoleUserKey != null ? !vRoleUserKey.equals(that.vRoleUserKey) : that.vRoleUserKey != null) return false;
        if (userKey != null ? !userKey.equals(that.userKey) : that.userKey != null) return false;
        if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;
        if (userShowName != null ? !userShowName.equals(that.userShowName) : that.userShowName != null) return false;
        if (userEnName != null ? !userEnName.equals(that.userEnName) : that.userEnName != null) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (createUserId != null ? !createUserId.equals(that.createUserId) : that.createUserId != null) return false;
        if (dataStatus != null ? !dataStatus.equals(that.dataStatus) : that.dataStatus != null) return false;
        if (dataOrder != null ? !dataOrder.equals(that.dataOrder) : that.dataOrder != null) return false;
        if (userMobileNum != null ? !userMobileNum.equals(that.userMobileNum) : that.userMobileNum != null)
            return false;
        if (userSex != null ? !userSex.equals(that.userSex) : that.userSex != null) return false;
        if (userType != null ? !userType.equals(that.userType) : that.userType != null) return false;
        if (roleKey != null ? !roleKey.equals(that.roleKey) : that.roleKey != null) return false;
        if (roleName != null ? !roleName.equals(that.roleName) : that.roleName != null) return false;
        if (roleId != null ? !roleId.equals(that.roleId) : that.roleId != null) return false;
        if (roleIntro != null ? !roleIntro.equals(that.roleIntro) : that.roleIntro != null) return false;
        if (rCreateTime != null ? !rCreateTime.equals(that.rCreateTime) : that.rCreateTime != null) return false;
        if (rCreateUserId != null ? !rCreateUserId.equals(that.rCreateUserId) : that.rCreateUserId != null)
            return false;
        if (rDataOrder != null ? !rDataOrder.equals(that.rDataOrder) : that.rDataOrder != null) return false;
        if (roleType != null ? !roleType.equals(that.roleType) : that.roleType != null) return false;
        if (rlType != null ? !rlType.equals(that.rlType) : that.rlType != null) return false;
        if (rhuId != null ? !rhuId.equals(that.rhuId) : that.rhuId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = vRoleUserKey != null ? vRoleUserKey.hashCode() : 0;
        result = 31 * result + (userKey != null ? userKey.hashCode() : 0);
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userShowName != null ? userShowName.hashCode() : 0);
        result = 31 * result + (userEnName != null ? userEnName.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (createUserId != null ? createUserId.hashCode() : 0);
        result = 31 * result + (dataStatus != null ? dataStatus.hashCode() : 0);
        result = 31 * result + (dataOrder != null ? dataOrder.hashCode() : 0);
        result = 31 * result + (userMobileNum != null ? userMobileNum.hashCode() : 0);
        result = 31 * result + (userSex != null ? userSex.hashCode() : 0);
        result = 31 * result + (userType != null ? userType.hashCode() : 0);
        result = 31 * result + (roleKey != null ? roleKey.hashCode() : 0);
        result = 31 * result + (roleName != null ? roleName.hashCode() : 0);
        result = 31 * result + (roleId != null ? roleId.hashCode() : 0);
        result = 31 * result + (roleIntro != null ? roleIntro.hashCode() : 0);
        result = 31 * result + (rCreateTime != null ? rCreateTime.hashCode() : 0);
        result = 31 * result + (rCreateUserId != null ? rCreateUserId.hashCode() : 0);
        result = 31 * result + (rDataOrder != null ? rDataOrder.hashCode() : 0);
        result = 31 * result + (roleType != null ? roleType.hashCode() : 0);
        result = 31 * result + (rlType != null ? rlType.hashCode() : 0);
        result = 31 * result + (rhuId != null ? rhuId.hashCode() : 0);
        return result;
    }
}
