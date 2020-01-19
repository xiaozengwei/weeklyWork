package com.gx.soft.weeklywork.persistence.vo;

import com.gx.soft.weeklywork.persistence.domain.MeetingArrangement;

import java.util.ArrayList;

public class JsscydVo {
    ArrayList<MeetingArrangement> meetingArrangement;
    public ArrayList<MeetingArrangement> getMeetingArrangement() {
        return meetingArrangement;
    }

    public void setMeetingArrangement(ArrayList<MeetingArrangement> meetingArrangement) {
        this.meetingArrangement = meetingArrangement;
    }

    public JsscydVo(ArrayList<MeetingArrangement> meetingArrangement) {
        this.meetingArrangement = meetingArrangement;
    }

    public JsscydVo() {
    }
}
