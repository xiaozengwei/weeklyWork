package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "v_role_user", schema = "meeting", catalog = "")
public class VRoleUser {
    private String vRoleUserKey;
    private String userKey;
    private String userName;
    private String userShowName;
    private String userEnName;
    private String userId;
    private Timestamp createTime;
    private String createUserId;
    private Timestamp modifyTime;
    private String modifyUserId;
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
    private Timestamp rModifyTime;
    private String rModifyUserId;
    private String rDataStatus;
    private Long rDataOrder;
    private String parentRoleId;
    private String parentRoleName;
    private String roleType;
    private String rlType;
    private String rhuId;

    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
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
    @Column(name = "modify_time")
    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
    }

    @Basic
    @Column(name = "modify_user_id")
    public String getModifyUserId() {
        return modifyUserId;
    }

    public void setModifyUserId(String modifyUserId) {
        this.modifyUserId = modifyUserId;
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
    @Column(name = "r_modify_time")
    public Timestamp getrModifyTime() {
        return rModifyTime;
    }

    public void setrModifyTime(Timestamp rModifyTime) {
        this.rModifyTime = rModifyTime;
    }

    @Basic
    @Column(name = "r_modify_user_id")
    public String getrModifyUserId() {
        return rModifyUserId;
    }

    public void setrModifyUserId(String rModifyUserId) {
        this.rModifyUserId = rModifyUserId;
    }

    @Basic
    @Column(name = "r_data_status")
    public String getrDataStatus() {
        return rDataStatus;
    }

    public void setrDataStatus(String rDataStatus) {
        this.rDataStatus = rDataStatus;
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
    @Column(name = "parent_role_id")
    public String getParentRoleId() {
        return parentRoleId;
    }

    public void setParentRoleId(String parentRoleId) {
        this.parentRoleId = parentRoleId;
    }

    @Basic
    @Column(name = "parent_role_name")
    public String getParentRoleName() {
        return parentRoleName;
    }

    public void setParentRoleName(String parentRoleName) {
        this.parentRoleName = parentRoleName;
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
        VRoleUser vRoleUser = (VRoleUser) o;
        return Objects.equals(vRoleUserKey, vRoleUser.vRoleUserKey) &&
                Objects.equals(userKey, vRoleUser.userKey) &&
                Objects.equals(userName, vRoleUser.userName) &&
                Objects.equals(userShowName, vRoleUser.userShowName) &&
                Objects.equals(userEnName, vRoleUser.userEnName) &&
                Objects.equals(userId, vRoleUser.userId) &&
                Objects.equals(createTime, vRoleUser.createTime) &&
                Objects.equals(createUserId, vRoleUser.createUserId) &&
                Objects.equals(modifyTime, vRoleUser.modifyTime) &&
                Objects.equals(modifyUserId, vRoleUser.modifyUserId) &&
                Objects.equals(dataStatus, vRoleUser.dataStatus) &&
                Objects.equals(dataOrder, vRoleUser.dataOrder) &&
                Objects.equals(userMobileNum, vRoleUser.userMobileNum) &&
                Objects.equals(userSex, vRoleUser.userSex) &&
                Objects.equals(userType, vRoleUser.userType) &&
                Objects.equals(roleKey, vRoleUser.roleKey) &&
                Objects.equals(roleName, vRoleUser.roleName) &&
                Objects.equals(roleId, vRoleUser.roleId) &&
                Objects.equals(roleIntro, vRoleUser.roleIntro) &&
                Objects.equals(rCreateTime, vRoleUser.rCreateTime) &&
                Objects.equals(rCreateUserId, vRoleUser.rCreateUserId) &&
                Objects.equals(rModifyTime, vRoleUser.rModifyTime) &&
                Objects.equals(rModifyUserId, vRoleUser.rModifyUserId) &&
                Objects.equals(rDataStatus, vRoleUser.rDataStatus) &&
                Objects.equals(rDataOrder, vRoleUser.rDataOrder) &&
                Objects.equals(parentRoleId, vRoleUser.parentRoleId) &&
                Objects.equals(parentRoleName, vRoleUser.parentRoleName) &&
                Objects.equals(roleType, vRoleUser.roleType) &&
                Objects.equals(rlType, vRoleUser.rlType) &&
                Objects.equals(rhuId, vRoleUser.rhuId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(vRoleUserKey, userKey, userName, userShowName, userEnName, userId, createTime, createUserId, modifyTime, modifyUserId, dataStatus, dataOrder, userMobileNum, userSex, userType, roleKey, roleName, roleId, roleIntro, rCreateTime, rCreateUserId, rModifyTime, rModifyUserId, rDataStatus, rDataOrder, parentRoleId, parentRoleName, roleType, rlType, rhuId);
    }
}
