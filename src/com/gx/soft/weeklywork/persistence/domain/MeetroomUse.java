package com.gx.soft.weeklywork.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "meetroom_use", schema = "meeting", catalog = "")
public class MeetroomUse {
    private String rowId;
    private String indexId;
    private String meetingRoomId;
    private String meetingRoomName;
    private String monday;
    private String tuesday;
    private String wednesday;
    private String thursday;
    private String friday;
    private String saturday;
    private String sunday;
    private String morning;
    private String afternoon;
    private String meetingRoomStatus;
    private String createUserId;
    private String createUserName;
    private Timestamp createTime;
    private String dataStatus;
    private String dataOrder;
    private String dataDeleted;

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
    @Column(name = "index_id")
    public String getIndexId() {
        return indexId;
    }

    public void setIndexId(String indexId) {
        this.indexId = indexId;
    }

    @Basic
    @Column(name = "meeting_room_id")
    public String getMeetingRoomId() {
        return meetingRoomId;
    }

    public void setMeetingRoomId(String meetingRoomId) {
        this.meetingRoomId = meetingRoomId;
    }

    @Basic
    @Column(name = "meeting_room_name")
    public String getMeetingRoomName() {
        return meetingRoomName;
    }

    public void setMeetingRoomName(String meetingRoomName) {
        this.meetingRoomName = meetingRoomName;
    }

    @Basic
    @Column(name = "monday")
    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    @Basic
    @Column(name = "tuesday")
    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    @Basic
    @Column(name = "wednesday")
    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

    @Basic
    @Column(name = "thursday")
    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    @Basic
    @Column(name = "friday")
    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }

    @Basic
    @Column(name = "saturday")
    public String getSaturday() {
        return saturday;
    }

    public void setSaturday(String saturday) {
        this.saturday = saturday;
    }

    @Basic
    @Column(name = "sunday")
    public String getSunday() {
        return sunday;
    }

    public void setSunday(String sunday) {
        this.sunday = sunday;
    }

    @Basic
    @Column(name = "morning")
    public String getMorning() {
        return morning;
    }

    public void setMorning(String morning) {
        this.morning = morning;
    }

    @Basic
    @Column(name = "afternoon")
    public String getAfternoon() {
        return afternoon;
    }

    public void setAfternoon(String afternoon) {
        this.afternoon = afternoon;
    }

    @Basic
    @Column(name = "meeting_room_status")
    public String getMeetingRoomStatus() {
        return meetingRoomStatus;
    }

    public void setMeetingRoomStatus(String meetingRoomStatus) {
        this.meetingRoomStatus = meetingRoomStatus;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MeetroomUse that = (MeetroomUse) o;
        return Objects.equals(rowId, that.rowId) &&
                Objects.equals(indexId, that.indexId) &&
                Objects.equals(meetingRoomId, that.meetingRoomId) &&
                Objects.equals(meetingRoomName, that.meetingRoomName) &&
                Objects.equals(monday, that.monday) &&
                Objects.equals(tuesday, that.tuesday) &&
                Objects.equals(wednesday, that.wednesday) &&
                Objects.equals(thursday, that.thursday) &&
                Objects.equals(friday, that.friday) &&
                Objects.equals(saturday, that.saturday) &&
                Objects.equals(sunday, that.sunday) &&
                Objects.equals(morning, that.morning) &&
                Objects.equals(afternoon, that.afternoon) &&
                Objects.equals(meetingRoomStatus, that.meetingRoomStatus) &&
                Objects.equals(createUserId, that.createUserId) &&
                Objects.equals(createUserName, that.createUserName) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(dataStatus, that.dataStatus) &&
                Objects.equals(dataOrder, that.dataOrder) &&
                Objects.equals(dataDeleted, that.dataDeleted);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, indexId, meetingRoomId, meetingRoomName, monday, tuesday, wednesday, thursday, friday, saturday, sunday, morning, afternoon, meetingRoomStatus, createUserId, createUserName, createTime, dataStatus, dataOrder, dataDeleted);
    }
}
