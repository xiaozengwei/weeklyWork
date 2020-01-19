package com.gx.soft.weeklywork.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "dic_meetroom", schema = "meeting", catalog = "")
public class DicMeetroom {
    private String rowId;
    private String mtName;
    private String mtNumber;
    private String mtOrg;
    private String dicFunctionId;
    private Date createDate;
    private String createUserName;
    private String createUserId;
    private Integer orderNum;
    private String status;
    private String deal;

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
    @Column(name = "mt_name")
    public String getMtName() {
        return mtName;
    }

    public void setMtName(String mtName) {
        this.mtName = mtName;
    }

    @Basic
    @Column(name = "mt_number")
    public String getMtNumber() {
        return mtNumber;
    }

    public void setMtNumber(String mtNumber) {
        this.mtNumber = mtNumber;
    }

    @Basic
    @Column(name = "mt_org")
    public String getMtOrg() {
        return mtOrg;
    }

    public void setMtOrg(String mtOrg) {
        this.mtOrg = mtOrg;
    }

    @Basic
    @Column(name = "dic_function_id")
    public String getDicFunctionId() {
        return dicFunctionId;
    }

    public void setDicFunctionId(String dicFunctionId) {
        this.dicFunctionId = dicFunctionId;
    }

    @Basic
    @Column(name = "create_date")
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "create_user_name")
    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
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
    @Column(name = "order_num")
    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "deal")
    public String getDeal() {
        return deal;
    }

    public void setDeal(String deal) {
        this.deal = deal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DicMeetroom that = (DicMeetroom) o;
        return Objects.equals(rowId, that.rowId) &&
                Objects.equals(mtName, that.mtName) &&
                Objects.equals(mtNumber, that.mtNumber) &&
                Objects.equals(mtOrg, that.mtOrg) &&
                Objects.equals(dicFunctionId, that.dicFunctionId) &&
                Objects.equals(createDate, that.createDate) &&
                Objects.equals(createUserName, that.createUserName) &&
                Objects.equals(createUserId, that.createUserId) &&
                Objects.equals(orderNum, that.orderNum) &&
                Objects.equals(status, that.status) &&
                Objects.equals(deal, that.deal);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, mtName, mtNumber, mtOrg, dicFunctionId, createDate, createUserName, createUserId, orderNum, status, deal);
    }
}
