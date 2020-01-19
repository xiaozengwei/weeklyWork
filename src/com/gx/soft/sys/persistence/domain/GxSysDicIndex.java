package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "gx_sys_dic_index", schema = "meeting", catalog = "")
public class GxSysDicIndex {
    private String rowId;
    private Timestamp createDate;
    private String createUserId;
    private String dicFunctionName;
    private String dicFunctionId;
    private String dicFunctionDec;
    private String dicFunctionType;
    private String status;
    private Timestamp updateTime;
    private Long orderNum;

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
    @Column(name = "DIC_FUNCTION_NAME")
    public String getDicFunctionName() {
        return dicFunctionName;
    }

    public void setDicFunctionName(String dicFunctionName) {
        this.dicFunctionName = dicFunctionName;
    }

    @Basic
    @Column(name = "DIC_FUNCTION_ID")
    public String getDicFunctionId() {
        return dicFunctionId;
    }

    public void setDicFunctionId(String dicFunctionId) {
        this.dicFunctionId = dicFunctionId;
    }

    @Basic
    @Column(name = "DIC_FUNCTION_DEC")
    public String getDicFunctionDec() {
        return dicFunctionDec;
    }

    public void setDicFunctionDec(String dicFunctionDec) {
        this.dicFunctionDec = dicFunctionDec;
    }

    @Basic
    @Column(name = "DIC_FUNCTION_TYPE")
    public String getDicFunctionType() {
        return dicFunctionType;
    }

    public void setDicFunctionType(String dicFunctionType) {
        this.dicFunctionType = dicFunctionType;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GxSysDicIndex that = (GxSysDicIndex) o;
        return Objects.equals(rowId, that.rowId) &&
                Objects.equals(createDate, that.createDate) &&
                Objects.equals(createUserId, that.createUserId) &&
                Objects.equals(dicFunctionName, that.dicFunctionName) &&
                Objects.equals(dicFunctionId, that.dicFunctionId) &&
                Objects.equals(dicFunctionDec, that.dicFunctionDec) &&
                Objects.equals(dicFunctionType, that.dicFunctionType) &&
                Objects.equals(status, that.status) &&
                Objects.equals(updateTime, that.updateTime) &&
                Objects.equals(orderNum, that.orderNum);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, createDate, createUserId, dicFunctionName, dicFunctionId, dicFunctionDec, dicFunctionType, status, updateTime, orderNum);
    }
}
