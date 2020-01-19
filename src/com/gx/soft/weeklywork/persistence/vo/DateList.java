package com.gx.soft.weeklywork.persistence.vo;

import com.gx.soft.weeklywork.persistence.domain.MeetingArrangement;

import java.util.List;

public class DateList {
    private String date;
    private String dayOfWeek;
    private int count;
    private String dateName;
    private List<MeetingArrangement> meetList;

    public List<MeetingArrangement> getMeetList() {
        return meetList;
    }

    public void setMeetList(List<MeetingArrangement> meetList) {
        this.meetList = meetList;
    }

    public String getDateName() {
        return dateName;
    }

    public void setDateName(String dateName) {
        this.dateName = dateName;
    }


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
