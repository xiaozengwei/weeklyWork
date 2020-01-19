package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "gx_sys_role_has_user", schema = "meeting", catalog = "")
public class GxSysRoleHasUser {
    private String rowId;
    private String userId;
    private String roleId;
    private Timestamp createTime;
    private String createUserId;
    private String dataStatus;
    private Long dataOrder;
    private String rlType;

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
    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
    public Long getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(Long dataOrder) {
        this.dataOrder = dataOrder;
    }

    @Basic
    @Column(name = "rl_type")
    public String getRlType() {
        return rlType;
    }

    public void setRlType(String rlType) {
        this.rlType = rlType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GxSysRoleHasUser that = (GxSysRoleHasUser) o;
        return Objects.equals(rowId, that.rowId) &&
                Objects.equals(userId, that.userId) &&
                Objects.equals(roleId, that.roleId) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(createUserId, that.createUserId) &&
                Objects.equals(dataStatus, that.dataStatus) &&
                Objects.equals(dataOrder, that.dataOrder) &&
                Objects.equals(rlType, that.rlType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, userId, roleId, createTime, createUserId, dataStatus, dataOrder, rlType);
    }
}
