package com.gx.soft.weeklywork.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "calendar_index", schema = "meeting", catalog = "")
public class CalendarIndex {
    private String rowId;
    private String aTitle;
    private Timestamp aDate;
    private String aYear;
    private String aWeek;
    private Date weekStartDate;
    private Date weekEndDate;
    private String createUserId;
    private String createUserName;
    private Timestamp createTime;
    private String dataType;
    private String dataStatus;
    private String dataOrder;
    private String dataDeleted;
    private String ext;
    private Date ext2;
    private Timestamp ex3;

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
    @Column(name = "a_title")
    public String getaTitle() {
        return aTitle;
    }

    public void setaTitle(String aTitle) {
        this.aTitle = aTitle;
    }

    @Basic
    @Column(name = "a_date")
    public Timestamp getaDate() {
        return aDate;
    }

    public void setaDate(Timestamp aDate) {
        this.aDate = aDate;
    }

    @Basic
    @Column(name = "a_year")
    public String getaYear() {
        return aYear;
    }

    public void setaYear(String aYear) {
        this.aYear = aYear;
    }

    @Basic
    @Column(name = "a_week")
    public String getaWeek() {
        return aWeek;
    }

    public void setaWeek(String aWeek) {
        this.aWeek = aWeek;
    }

    @Basic
    @Column(name = "week_start_date")
    public Date getWeekStartDate() {
        return weekStartDate;
    }

    public void setWeekStartDate(Date weekStartDate) {
        this.weekStartDate = weekStartDate;
    }

    @Basic
    @Column(name = "week_end_date")
    public Date getWeekEndDate() {
        return weekEndDate;
    }

    public void setWeekEndDate(Date weekEndDate) {
        this.weekEndDate = weekEndDate;
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
    @Column(name = "create_user_name")
    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
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
    @Column(name = "data_type")
    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
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
    public String getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(String dataOrder) {
        this.dataOrder = dataOrder;
    }

    @Basic
    @Column(name = "data_deleted")
    public String getDataDeleted() {
        return dataDeleted;
    }

    public void setDataDeleted(String dataDeleted) {
        this.dataDeleted = dataDeleted;
    }

    @Basic
    @Column(name = "ext")
    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    @Basic
    @Column(name = "ext2")
    public Date getExt2() {
        return ext2;
    }

    public void setExt2(Date ext2) {
        this.ext2 = ext2;
    }

    @Basic
    @Column(name = "ex3")
    public Timestamp getEx3() {
        return ex3;
    }

    public void setEx3(Timestamp ex3) {
        this.ex3 = ex3;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CalendarIndex that = (CalendarIndex) o;
        return Objects.equals(rowId, that.rowId) &&
                Objects.equals(aTitle, that.aTitle) &&
                Objects.equals(aDate, that.aDate) &&
                Objects.equals(aYear, that.aYear) &&
                Objects.equals(aWeek, that.aWeek) &&
                Objects.equals(weekStartDate, that.weekStartDate) &&
                Objects.equals(weekEndDate, that.weekEndDate) &&
                Objects.equals(createUserId, that.createUserId) &&
                Objects.equals(createUserName, that.createUserName) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(dataType, that.dataType) &&
                Objects.equals(dataStatus, that.dataStatus) &&
                Objects.equals(dataOrder, that.dataOrder) &&
                Objects.equals(dataDeleted, that.dataDeleted) &&
                Objects.equals(ext, that.ext) &&
                Objects.equals(ext2, that.ext2) &&
                Objects.equals(ex3, that.ex3);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, aTitle, aDate, aYear, aWeek, weekStartDate, weekEndDate, createUserId, createUserName, createTime, dataType, dataStatus, dataOrder, dataDeleted, ext, ext2, ex3);
    }
}
