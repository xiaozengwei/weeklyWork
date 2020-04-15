package com.gx.soft.weeklywork.persistence.domain;

import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "meeting_arrangement", schema = "meeting", catalog = "")
public class MeetingArrangement {
    private String rowId;
    private String title;
    private Timestamp applyDate;
    private Integer period;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Timestamp startTime;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Timestamp endTime;
    private String meetingRoomId;
    private String meetingRoomName;
    private String remark;
    private String useOrgId;
    private String useOrgName;
    private String isSend;
    private String isBack;
    private String callLeaderId;
    private String callLeaderName;
    private String callUsersId;
    private String callUsersName;
    private String callOrgsId;
    private String callOrgsName;
    private String createUserId;
    private String createUserName;
    private String createOrgId;
    private String createOrgName;
    private String year;
    private String dayOfWeek;
    private String week;
    private Date ext;
    private String ext2;
    private String ext3;
    private String auditorName;
    private String auditorId;

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
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    @Column(name = "period")
    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
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
    @Column(name = "end_time")
    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
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
    @Column(name = "remark")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Basic
    @Column(name = "use_org_id")
    public String getUseOrgId() {
        return useOrgId;
    }

    public void setUseOrgId(String useOrgId) {
        this.useOrgId = useOrgId;
    }

    @Basic
    @Column(name = "use_org_name")
    public String getUseOrgName() {
        return useOrgName;
    }

    public void setUseOrgName(String useOrgName) {
        this.useOrgName = useOrgName;
    }

    @Basic
    @Column(name = "is_send")
    public String getIsSend() {
        return isSend;
    }

    public void setIsSend(String isSend) {
        this.isSend = isSend;
    }

    @Basic
    @Column(name = "is_back")
    public String getIsBack() {
        return isBack;
    }

    public void setIsBack(String isBack) {
        this.isBack = isBack;
    }

    @Basic
    @Column(name = "call_leader_id")
    public String getCallLeaderId() {
        return callLeaderId;
    }

    public void setCallLeaderId(String callLeaderId) {
        this.callLeaderId = callLeaderId;
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
    @Column(name = "call_users_id")
    public String getCallUsersId() {
        return callUsersId;
    }

    public void setCallUsersId(String callUsersId) {
        this.callUsersId = callUsersId;
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
    @Column(name = "call_orgs_id")
    public String getCallOrgsId() {
        return callOrgsId;
    }

    public void setCallOrgsId(String callOrgsId) {
        this.callOrgsId = callOrgsId;
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
    @Column(name = "create_org_id")
    public String getCreateOrgId() {
        return createOrgId;
    }

    public void setCreateOrgId(String createOrgId) {
        this.createOrgId = createOrgId;
    }

    @Basic
    @Column(name = "create_org_name")
    public String getCreateOrgName() {
        return createOrgName;
    }

    public void setCreateOrgName(String createOrgName) {
        this.createOrgName = createOrgName;
    }

    @Basic
    @Column(name = "year")
    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    @Basic
    @Column(name = "day_of_week")
    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    @Basic
    @Column(name = "week")
    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    @Basic
    @Column(name = "ext")
    public Date getExt() {
        return ext;
    }

    public void setExt(Date ext) {
        this.ext = ext;
    }

    @Basic
    @Column(name = "ext2")
    public String getExt2() {
        return ext2;
    }

    public void setExt2(String ext2) {
        this.ext2 = ext2;
    }

    @Basic
    @Column(name = "ext3")
    public String getExt3() {
        return ext3;
    }

    public void setExt3(String ext3) {
        this.ext3 = ext3;
    }

    @Basic
    @Column(name = "auditor_name")
    public String getAuditorName() {
        return auditorName;
    }

    public void setAuditorName(String auditorName) {
        this.auditorName = auditorName;
    }

    @Basic
    @Column(name = "auditor_id")
    public String getAuditorId() {
        return auditorId;
    }

    public void setAuditorId(String auditorId) {
        this.auditorId = auditorId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MeetingArrangement that = (MeetingArrangement) o;

        if (rowId != null ? !rowId.equals(that.rowId) : that.rowId != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (applyDate != null ? !applyDate.equals(that.applyDate) : that.applyDate != null) return false;
        if (period != null ? !period.equals(that.period) : that.period != null) return false;
        if (startTime != null ? !startTime.equals(that.startTime) : that.startTime != null) return false;
        if (endTime != null ? !endTime.equals(that.endTime) : that.endTime != null) return false;
        if (meetingRoomId != null ? !meetingRoomId.equals(that.meetingRoomId) : that.meetingRoomId != null)
            return false;
        if (meetingRoomName != null ? !meetingRoomName.equals(that.meetingRoomName) : that.meetingRoomName != null)
            return false;
        if (remark != null ? !remark.equals(that.remark) : that.remark != null) return false;
        if (useOrgId != null ? !useOrgId.equals(that.useOrgId) : that.useOrgId != null) return false;
        if (useOrgName != null ? !useOrgName.equals(that.useOrgName) : that.useOrgName != null) return false;
        if (isSend != null ? !isSend.equals(that.isSend) : that.isSend != null) return false;
        if (isBack != null ? !isBack.equals(that.isBack) : that.isBack != null) return false;
        if (callLeaderId != null ? !callLeaderId.equals(that.callLeaderId) : that.callLeaderId != null) return false;
        if (callLeaderName != null ? !callLeaderName.equals(that.callLeaderName) : that.callLeaderName != null)
            return false;
        if (callUsersId != null ? !callUsersId.equals(that.callUsersId) : that.callUsersId != null) return false;
        if (callUsersName != null ? !callUsersName.equals(that.callUsersName) : that.callUsersName != null)
            return false;
        if (callOrgsId != null ? !callOrgsId.equals(that.callOrgsId) : that.callOrgsId != null) return false;
        if (callOrgsName != null ? !callOrgsName.equals(that.callOrgsName) : that.callOrgsName != null) return false;
        if (createUserId != null ? !createUserId.equals(that.createUserId) : that.createUserId != null) return false;
        if (createUserName != null ? !createUserName.equals(that.createUserName) : that.createUserName != null)
            return false;
        if (createOrgId != null ? !createOrgId.equals(that.createOrgId) : that.createOrgId != null) return false;
        if (createOrgName != null ? !createOrgName.equals(that.createOrgName) : that.createOrgName != null)
            return false;
        if (year != null ? !year.equals(that.year) : that.year != null) return false;
        if (dayOfWeek != null ? !dayOfWeek.equals(that.dayOfWeek) : that.dayOfWeek != null) return false;
        if (week != null ? !week.equals(that.week) : that.week != null) return false;
        if (ext != null ? !ext.equals(that.ext) : that.ext != null) return false;
        if (ext2 != null ? !ext2.equals(that.ext2) : that.ext2 != null) return false;
        if (ext3 != null ? !ext3.equals(that.ext3) : that.ext3 != null) return false;
        if (auditorName != null ? !auditorName.equals(that.auditorName) : that.auditorName != null) return false;
        if (auditorId != null ? !auditorId.equals(that.auditorId) : that.auditorId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rowId != null ? rowId.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (applyDate != null ? applyDate.hashCode() : 0);
        result = 31 * result + (period != null ? period.hashCode() : 0);
        result = 31 * result + (startTime != null ? startTime.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        result = 31 * result + (meetingRoomId != null ? meetingRoomId.hashCode() : 0);
        result = 31 * result + (meetingRoomName != null ? meetingRoomName.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (useOrgId != null ? useOrgId.hashCode() : 0);
        result = 31 * result + (useOrgName != null ? useOrgName.hashCode() : 0);
        result = 31 * result + (isSend != null ? isSend.hashCode() : 0);
        result = 31 * result + (isBack != null ? isBack.hashCode() : 0);
        result = 31 * result + (callLeaderId != null ? callLeaderId.hashCode() : 0);
        result = 31 * result + (callLeaderName != null ? callLeaderName.hashCode() : 0);
        result = 31 * result + (callUsersId != null ? callUsersId.hashCode() : 0);
        result = 31 * result + (callUsersName != null ? callUsersName.hashCode() : 0);
        result = 31 * result + (callOrgsId != null ? callOrgsId.hashCode() : 0);
        result = 31 * result + (callOrgsName != null ? callOrgsName.hashCode() : 0);
        result = 31 * result + (createUserId != null ? createUserId.hashCode() : 0);
        result = 31 * result + (createUserName != null ? createUserName.hashCode() : 0);
        result = 31 * result + (createOrgId != null ? createOrgId.hashCode() : 0);
        result = 31 * result + (createOrgName != null ? createOrgName.hashCode() : 0);
        result = 31 * result + (year != null ? year.hashCode() : 0);
        result = 31 * result + (dayOfWeek != null ? dayOfWeek.hashCode() : 0);
        result = 31 * result + (week != null ? week.hashCode() : 0);
        result = 31 * result + (ext != null ? ext.hashCode() : 0);
        result = 31 * result + (ext2 != null ? ext2.hashCode() : 0);
        result = 31 * result + (ext3 != null ? ext3.hashCode() : 0);
        result = 31 * result + (auditorName != null ? auditorName.hashCode() : 0);
        result = 31 * result + (auditorId != null ? auditorId.hashCode() : 0);
        return result;
    }
}
