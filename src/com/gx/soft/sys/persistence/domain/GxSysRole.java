package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "gx_sys_role", schema = "meeting", catalog = "")
public class GxSysRole {
    private String rowId;
    private String roleName;
    private String roleId;
    private String roleIntro;
    private Timestamp createTime;
    private String createUserId;
    private Timestamp modifyTime;
    private String modifyUserId;
    private String dataStatus;
    private Long dataOrder;
    private String parentRoleId;
    private String parentRoleName;
    private String roleType;

    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "row_id")
    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
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
    public Long getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(Long dataOrder) {
        this.dataOrder = dataOrder;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GxSysRole gxSysRole = (GxSysRole) o;
        return Objects.equals(rowId, gxSysRole.rowId) &&
                Objects.equals(roleName, gxSysRole.roleName) &&
                Objects.equals(roleId, gxSysRole.roleId) &&
                Objects.equals(roleIntro, gxSysRole.roleIntro) &&
                Objects.equals(createTime, gxSysRole.createTime) &&
                Objects.equals(createUserId, gxSysRole.createUserId) &&
                Objects.equals(modifyTime, gxSysRole.modifyTime) &&
                Objects.equals(modifyUserId, gxSysRole.modifyUserId) &&
                Objects.equals(dataStatus, gxSysRole.dataStatus) &&
                Objects.equals(dataOrder, gxSysRole.dataOrder) &&
                Objects.equals(parentRoleId, gxSysRole.parentRoleId) &&
                Objects.equals(parentRoleName, gxSysRole.parentRoleName) &&
                Objects.equals(roleType, gxSysRole.roleType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, roleName, roleId, roleIntro, createTime, createUserId, modifyTime, modifyUserId, dataStatus, dataOrder, parentRoleId, parentRoleName, roleType);
    }
}
