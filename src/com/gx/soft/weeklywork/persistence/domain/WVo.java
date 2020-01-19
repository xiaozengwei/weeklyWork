package com.gx.soft.weeklywork.persistence.domain;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "w_vo", schema = "meeting", catalog = "")
public class WVo {
    private String rowId;
    private Timestamp startTime;
    private Timestamp applyDate;
    private String callLeaderName;
    private String callOrgsName;
    private Timestamp endTime;
    private String fileName;
    private String meetingRoomName;
    private String callUsersName;
    private String title;

    @Id
    @Column(name = "row_id")
    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    @Basic
    @Column(name = "start_time")
    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    @Basic
    @Column(name = "apply_date")
    public Timestamp getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Timestamp applyDate) {
        this.applyDate = applyDate;
    }

    @Basic
    @Column(name = "call_leader_name")
    public String getCallLeaderName() {
        return callLeaderName;
    }

    public void setCallLeaderName(String callLeaderName) {
        this.callLeaderName = callLeaderName;
    }

    @Basic
    @Column(name = "call_orgs_name")
    public String getCallOrgsName() {
        return callOrgsName;
    }

    public void setCallOrgsName(String callOrgsName) {
        this.callOrgsName = callOrgsName;
    }

    @Basic
    @Column(name = "end_time")
    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    @Basic
    @Column(name = "file_name")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
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
    @Column(name = "call_users_name")
    public String getCallUsersName() {
        return callUsersName;
    }

    public void setCallUsersName(String callUsersName) {
        this.callUsersName = callUsersName;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        WVo wVo = (WVo) o;

        if (rowId != null ? !rowId.equals(wVo.rowId) : wVo.rowId != null) return false;
        if (startTime != null ? !startTime.equals(wVo.startTime) : wVo.startTime != null) return false;
        if (applyDate != null ? !applyDate.equals(wVo.applyDate) : wVo.applyDate != null) return false;
        if (callLeaderName != null ? !callLeaderName.equals(wVo.callLeaderName) : wVo.callLeaderName != null)
            return false;
        if (callOrgsName != null ? !callOrgsName.equals(wVo.callOrgsName) : wVo.callOrgsName != null) return false;
        if (endTime != null ? !endTime.equals(wVo.endTime) : wVo.endTime != null) return false;
        if (fileName != null ? !fileName.equals(wVo.fileName) : wVo.fileName != null) return false;
        if (meetingRoomName != null ? !meetingRoomName.equals(wVo.meetingRoomName) : wVo.meetingRoomName != null)
            return false;
        if (callUsersName != null ? !callUsersName.equals(wVo.callUsersName) : wVo.callUsersName != null) return false;
        if (title != null ? !title.equals(wVo.title) : wVo.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rowId != null ? rowId.hashCode() : 0;
        result = 31 * result + (startTime != null ? startTime.hashCode() : 0);
        result = 31 * result + (applyDate != null ? applyDate.hashCode() : 0);
        result = 31 * result + (callLeaderName != null ? callLeaderName.hashCode() : 0);
        result = 31 * result + (callOrgsName != null ? callOrgsName.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
        result = 31 * result + (meetingRoomName != null ? meetingRoomName.hashCode() : 0);
        result = 31 * result + (callUsersName != null ? callUsersName.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        return result;
    }
}
