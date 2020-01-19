package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "gx_sys_dic_record", schema = "meeting", catalog = "")
public class GxSysDicRecord {
    private String rowId;
    private Timestamp createDate;
    private String createUserId;
    private String dicName;
    private String dicId;
    private String dicShowVal;
    private String dicValue;
    private String dicType;
    private String status;
    private Timestamp updateTime;
    private Long orderNum;
    private String dicFunction;
    private String tableId;
    private String parentId;
    private String parentName;
    private String flagZm;
    private String flagRq;
    private String flagNum;
    private String flagWrite;
    private String maxStatus;
    private String maxId;

    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "ROW_ID")
    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    @Basic
    @Column(name = "CREATE_DATE")
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "CREATE_USER_ID")
    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Basic
    @Column(name = "DIC_NAME")
    public String getDicName() {
        return dicName;
    }

    public void setDicName(String dicName) {
        this.dicName = dicName;
    }

    @Basic
    @Column(name = "DIC_ID")
    public String getDicId() {
        return dicId;
    }

    public void setDicId(String dicId) {
        this.dicId = dicId;
    }

    @Basic
    @Column(name = "DIC_SHOW_VAL")
    public String getDicShowVal() {
        return dicShowVal;
    }

    public void setDicShowVal(String dicShowVal) {
        this.dicShowVal = dicShowVal;
    }

    @Basic
    @Column(name = "DIC_VALUE")
    public String getDicValue() {
        return dicValue;
    }

    public void setDicValue(String dicValue) {
        this.dicValue = dicValue;
    }

    @Basic
    @Column(name = "DIC_TYPE")
    public String getDicType() {
        return dicType;
    }

    public void setDicType(String dicType) {
        this.dicType = dicType;
    }

    @Basic
    @Column(name = "STATUS")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "UPDATE_TIME")
    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "ORDER_NUM")
    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

    @Basic
    @Column(name = "DIC_FUNCTION")
    public String getDicFunction() {
        return dicFunction;
    }

    public void setDicFunction(String dicFunction) {
        this.dicFunction = dicFunction;
    }

    @Basic
    @Column(name = "TABLE_ID")
    public String getTableId() {
        return tableId;
    }

    public void setTableId(String tableId) {
        this.tableId = tableId;
    }

    @Basic
    @Column(name = "PARENT_ID")
    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    @Basic
    @Column(name = "PARENT_NAME")
    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    @Basic
    @Column(name = "FLAG_ZM")
    public String getFlagZm() {
        return flagZm;
    }

    public void setFlagZm(String flagZm) {
        this.flagZm = flagZm;
    }

    @Basic
    @Column(name = "FLAG_RQ")
    public String getFlagRq() {
        return flagRq;
    }

    public void setFlagRq(String flagRq) {
        this.flagRq = flagRq;
    }

    @Basic
    @Column(name = "FLAG_NUM")
    public String getFlagNum() {
        return flagNum;
    }

    public void setFlagNum(String flagNum) {
        this.flagNum = flagNum;
    }

    @Basic
    @Column(name = "FLAG_WRITE")
    public String getFlagWrite() {
        return flagWrite;
    }

    public void setFlagWrite(String flagWrite) {
        this.flagWrite = flagWrite;
    }

    @Basic
    @Column(name = "max_status")
    public String getMaxStatus() {
        return maxStatus;
    }

    public void setMaxStatus(String maxStatus) {
        this.maxStatus = maxStatus;
    }

    @Basic
    @Column(name = "max_id")
    public String getMaxId() {
        return maxId;
    }

    public void setMaxId(String maxId) {
        this.maxId = maxId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GxSysDicRecord that = (GxSysDicRecord) o;
        return Objects.equals(rowId, that.rowId) &&
                Objects.equals(createDate, that.createDate) &&
                Objects.equals(createUserId, that.createUserId) &&
                Objects.equals(dicName, that.dicName) &&
                Objects.equals(dicId, that.dicId) &&
                Objects.equals(dicShowVal, that.dicShowVal) &&
                Objects.equals(dicValue, that.dicValue) &&
                Objects.equals(dicType, that.dicType) &&
                Objects.equals(status, that.status) &&
                Objects.equals(updateTime, that.updateTime) &&
                Objects.equals(orderNum, that.orderNum) &&
                Objects.equals(dicFunction, that.dicFunction) &&
                Objects.equals(tableId, that.tableId) &&
                Objects.equals(parentId, that.parentId) &&
                Objects.equals(parentName, that.parentName) &&
                Objects.equals(flagZm, that.flagZm) &&
                Objects.equals(flagRq, that.flagRq) &&
                Objects.equals(flagNum, that.flagNum) &&
                Objects.equals(flagWrite, that.flagWrite) &&
                Objects.equals(maxStatus, that.maxStatus) &&
                Objects.equals(maxId, that.maxId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, createDate, createUserId, dicName, dicId, dicShowVal, dicValue, dicType, status, updateTime, orderNum, dicFunction, tableId, parentId, parentName, flagZm, flagRq, flagNum, flagWrite, maxStatus, maxId);
    }
}
