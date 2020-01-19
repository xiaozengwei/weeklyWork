package com.gx.soft.weeklywork.web;

import com.alibaba.fastjson.JSON;
import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.page.Page;
import com.gx.ext.mail.MailConsumer;
import com.gx.soft.common.util.DateUtil;
import com.gx.soft.sys.persistence.domain.GxSysUser;
import com.gx.soft.sys.persistence.manager.SysUserManager;
import com.gx.soft.weeklywork.persistence.domain.*;
import com.gx.soft.weeklywork.persistence.manager.CalendarIndexManager;
import com.gx.soft.weeklywork.persistence.manager.DicMeetroomManager;
import com.gx.soft.weeklywork.persistence.manager.MeetingArrangementManager;
import com.gx.soft.weeklywork.persistence.manager.MeetroomUseManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 一周工作安排控制器
 */
@Controller
@RequestMapping("notice")
@SessionAttributes("user_session")
public class NoticeController {
    @Autowired
    private CalendarIndexManager calendarIndexManager;
    @Autowired
    private DicMeetroomManager dicMeetroomManager;
    @Autowired
    private MeetroomUseManager meetroomUseManager;
    @Autowired
    private MeetingArrangementManager meetingArrangementManager;
    @Autowired
    private SysUserManager gxUserManager;
    private static Logger logger = LoggerFactory.getLogger(MailConsumer.class);

    /**
     * 选择会议室（责任人、参与人员）
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("select-meetingroom")
    public String selectMeetingRoom(String startTime, String endTime,
                                    @ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) throws Exception {
//        startTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Timestamp.valueOf(startTime));
//        endTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Timestamp.valueOf(endTime));
        System.out.println(startTime+"---"+endTime);
        model.addAttribute("sTime", startTime);
        model.addAttribute("eTime", endTime);
        String filter_EQS_aYear = "";
        String filter_EQS_aWeek = "";

        if(parameterMap.get("filter_EQS_aYear")!=null){
            if(parameterMap.get("filter_EQS_aWeek")!=null){
                filter_EQS_aYear = (String)parameterMap.get("filter_EQS_aYear");
                filter_EQS_aWeek = (String)parameterMap.get("filter_EQS_aWeek");
                List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                List<CalendarIndex> calendar = calendarIndexManager.find(propertyFilters);
                if(calendar!=null&&calendar.size()>0){
                    ArrayList<String> dateList = new ArrayList<String>();
                    String day = "";
                    CalendarIndex ca = calendar.get(0);
                    java.util.Date start = ca.getWeekStartDate();
                    dateList.add(start+"</br>星期一");
                    for(int i = 1;i<7;i++){
                        java.util.Date weekDate = addAndSubtractDaysByCalendar(start,i);
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String wd = sdf.format(weekDate);
                        if(i==1){
                            day="二";
                        }else if(i==2){
                            day="三";
                        }else if(i==3){
                            day="四";
                        }else if(i==4){
                            day="五";
                        }else if(i==5){
                            day="六";
                        }else if(i==6){
                            day="日";
                        }
                        dateList.add(wd+"</br>星期"+day);
                    }
                    parameterMap.clear();
                    propertyFilters.clear();
                    String indexId=ca.getRowId();
                    parameterMap.clear();
                    propertyFilters.clear();
                    parameterMap.put("filter_EQS_dicFunctionId", "xzbg-meetroom");
                    parameterMap.put("filter_EQS_status", "开放");
                    propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                    List<DicMeetroom> meetroomList = dicMeetroomManager.find(propertyFilters);
                    List<MeetRoomBean> meetroomAll = new ArrayList<MeetRoomBean>();
                    for (DicMeetroom meetroom:meetroomList) {
                        MeetRoomBean mb = new MeetRoomBean();
                        mb.setMeetingRoomName(meetroom.getMtName());
                        parameterMap.clear();
                        propertyFilters.clear();
                        parameterMap.put("filter_EQS_meetingRoomName", meetroom.getMtName());
                        logger.info("会议室名称："+meetroom.getMtName());
                        parameterMap.put("filter_EQS_indexId",indexId);
                        parameterMap.put("filter_EQS_morning","1");
                        propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                        List<MeetroomUse> meetroomMorningList = meetroomUseManager.find(propertyFilters);
                        if(meetroomMorningList!=null&&meetroomMorningList.size()>0) {
                            MeetroomUse morningU = meetroomMorningList.get(0);
                            mb.setMorningId(morningU.getRowId());
                            mb.setIndexId(morningU.getIndexId());
                            mb.setMMonday(morningU.getMonday());
                            mb.setMTuesday(morningU.getTuesday());
                            mb.setMWednesday(morningU.getWednesday());
                            mb.setMThursday(morningU.getThursday());
                            mb.setMFriday(morningU.getFriday());
                            mb.setMSaturday(morningU.getSaturday());
                            mb.setMSunday(morningU.getSunday());
                        }
                        parameterMap.clear();
                        propertyFilters.clear();
                        parameterMap.put("filter_EQS_meetingRoomName", meetroom.getMtName());
                        parameterMap.put("filter_EQS_indexId",indexId);
                        parameterMap.put("filter_EQS_afternoon","1");
                        propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                        List<MeetroomUse> meetroomAfterList = meetroomUseManager.find(propertyFilters);
                        if(meetroomAfterList!=null&&meetroomAfterList.size()>0) {
                            MeetroomUse afterU = meetroomAfterList.get(0);
                            mb.setAfterId(afterU.getRowId());
                            mb.setAMonday(afterU.getMonday());
                            mb.setATuesday(afterU.getTuesday());
                            mb.setAWednesday(afterU.getWednesday());
                            mb.setAThursday(afterU.getThursday());
                            mb.setAFriday(afterU.getFriday());
                            mb.setASaturday(afterU.getSaturday());
                            mb.setASunday(afterU.getSunday());
                        }
                        meetroomAll.add(mb);
                    }
                    model.addAttribute("meetList",meetroomAll);

                    model.addAttribute("dateList",dateList);
                }
            }
        }else if(startTime!=null&&startTime.length()>0&&endTime.length()>0&&endTime!=null){

            parameterMap.put("filter_LED_weekStartDate", startTime);
            parameterMap.put("filter_GED_weekEndDate", startTime);
            List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
            List<CalendarIndex> calendar = calendarIndexManager.find(propertyFilters);
            model.addAttribute("wk",calendar.get(0).getaWeek());
            if(calendar!=null&&calendar.size()>0){
                ArrayList<String> dateList = new ArrayList<String>();
                String day = "";
                CalendarIndex ca = calendar.get(0);
                java.util.Date start = ca.getWeekStartDate();
                dateList.add(start+"</br>星期一");
                for(int i = 1;i<7;i++){
                    java.util.Date weekDate = addAndSubtractDaysByCalendar(start,i);
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String wd = sdf.format(weekDate);
                    if(i==1){
                        day="二";
                    }else if(i==2){
                        day="三";
                    }else if(i==3){
                        day="四";
                    }else if(i==4){
                        day="五";
                    }else if(i==5){
                        day="六";
                    }else if(i==6){
                        day="日";
                    }
                    dateList.add(wd+"</br>星期"+day);
                }
                parameterMap.clear();
                propertyFilters.clear();
                String indexId=ca.getRowId();
                parameterMap.clear();
                propertyFilters.clear();
                parameterMap.put("filter_EQS_dicFunctionId", "xzbg-meetroom");
                parameterMap.put("filter_EQS_status", "开放");
                propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                List<DicMeetroom> meetroomList = dicMeetroomManager.find(propertyFilters);
                List<MeetRoomBean> meetroomAll = new ArrayList<MeetRoomBean>();
                for (DicMeetroom meetroom:meetroomList) {
                    MeetRoomBean mb = new MeetRoomBean();
                    mb.setMeetingRoomName(meetroom.getMtName());
                    parameterMap.clear();
                    propertyFilters.clear();
                    parameterMap.put("filter_EQS_meetingRoomName", meetroom.getMtName());
                    logger.info("会议室名称："+meetroom.getMtName());
                    parameterMap.put("filter_EQS_indexId",indexId);
                    parameterMap.put("filter_EQS_morning","1");
                    propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                    List<MeetroomUse> meetroomMorningList = meetroomUseManager.find(propertyFilters);
                    if(meetroomMorningList!=null&&meetroomMorningList.size()>0) {
                        MeetroomUse morningU = meetroomMorningList.get(0);
                        mb.setMorningId(morningU.getRowId());
                        mb.setIndexId(morningU.getIndexId());
                        mb.setMMonday(morningU.getMonday());
                        mb.setMTuesday(morningU.getTuesday());
                        mb.setMWednesday(morningU.getWednesday());
                        mb.setMThursday(morningU.getThursday());
                        mb.setMFriday(morningU.getFriday());
                        mb.setMSaturday(morningU.getSaturday());
                        mb.setMSunday(morningU.getSunday());
                    }
                    parameterMap.clear();
                    propertyFilters.clear();
                    parameterMap.put("filter_EQS_meetingRoomName", meetroom.getMtName());
                    parameterMap.put("filter_EQS_indexId",indexId);
                    parameterMap.put("filter_EQS_afternoon","1");
                    propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                    List<MeetroomUse> meetroomAfterList = meetroomUseManager.find(propertyFilters);
                    if(meetroomAfterList!=null&&meetroomAfterList.size()>0) {
                        MeetroomUse afterU = meetroomAfterList.get(0);
                        mb.setAfterId(afterU.getRowId());
                        mb.setAMonday(afterU.getMonday());
                        mb.setATuesday(afterU.getTuesday());
                        mb.setAWednesday(afterU.getWednesday());
                        mb.setAThursday(afterU.getThursday());
                        mb.setAFriday(afterU.getFriday());
                        mb.setASaturday(afterU.getSaturday());
                        mb.setASunday(afterU.getSunday());
                    }
                    meetroomAll.add(mb);
                }
                model.addAttribute("meetList",meetroomAll);
                model.addAttribute("dateList",dateList);
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String da = df.format(System.currentTimeMillis());
                Map<String, Integer> map=DateUtil.getWeekAndYear(da);
                filter_EQS_aYear=map.get("year").toString();
                filter_EQS_aWeek=map.get("week").toString();
            }
        }else{
            System.out.println("未传值查询当前日期的一星期");
            List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
            page = gxUserManager.pagedQuery(page, propertyFilters);
            List<GxSysUser> userList = (List<GxSysUser>) page.getResult();
            page.setResult(userList);
            ArrayList<String> dateList = new ArrayList<String>();
            String date1 =  getCurrentMonday();
            dateList.add(date1+"</br>星期一");
            for (int i = 1;i<7;i++){
                String day = "";
                String datei = getPreviousSunday(i);
                if(i==1){
                    day="二";
                }else if(i==2){
                    day="三";
                }else if(i==3){
                    day="四";
                }else if(i==4){
                    day="五";
                }else if(i==5){
                    day="六";
                }else if(i==6){
                    day="日";
                }
                dateList.add(datei+"</br>星期"+day);
            }
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String da = df.format(System.currentTimeMillis());
            logger.info("当前系统时间："+da);
            parameterMap.clear();
            propertyFilters.clear();
            parameterMap.put("filter_LED_weekStartDate", da);
            parameterMap.put("filter_GED_weekEndDate", da);
            propertyFilters = PropertyFilter.buildFromMap(parameterMap);
            String indexId = "";
            List<CalendarIndex> now = calendarIndexManager.find(propertyFilters);
            if (now!=null&&now.size()>0){
                filter_EQS_aYear = now.get(0).getaYear();
                filter_EQS_aWeek = now.get(0).getaWeek();
                indexId=now.get(0).getRowId();
                parameterMap.clear();
                propertyFilters.clear();
                parameterMap.put("filter_EQS_dicFunctionId", "xzbg-meetroom");
                parameterMap.put("filter_EQS_status", "开放");
                propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                List<DicMeetroom> meetroomList = dicMeetroomManager.find(propertyFilters);
                List<MeetRoomBean> meetroomAll = new ArrayList<MeetRoomBean>();
                for (DicMeetroom meetroom:meetroomList) {
                    MeetRoomBean mb = new MeetRoomBean();
                    mb.setMeetingRoomName(meetroom.getMtName());
                    parameterMap.clear();
                    propertyFilters.clear();
                    parameterMap.put("filter_EQS_meetingRoomName", meetroom.getMtName());
                    logger.info("会议室名称："+meetroom.getMtName());
                    parameterMap.put("filter_EQS_indexId",indexId);
                    parameterMap.put("filter_EQS_morning","1");
                    propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                    List<MeetroomUse> meetroomMorningList = meetroomUseManager.find(propertyFilters);
                    if(meetroomMorningList!=null&&meetroomMorningList.size()>0) {
                        MeetroomUse morningU = meetroomMorningList.get(0);
                        mb.setMorningId(morningU.getRowId());
                        mb.setIndexId(morningU.getIndexId());
                        mb.setMMonday(morningU.getMonday());
                        mb.setMTuesday(morningU.getTuesday());
                        mb.setMWednesday(morningU.getWednesday());
                        mb.setMThursday(morningU.getThursday());
                        mb.setMFriday(morningU.getFriday());
                        mb.setMSaturday(morningU.getSaturday());
                        mb.setMSunday(morningU.getSunday());
                    }
                    parameterMap.clear();
                    propertyFilters.clear();
                    parameterMap.put("filter_EQS_meetingRoomName", meetroom.getMtName());
                    parameterMap.put("filter_EQS_indexId",indexId);
                    parameterMap.put("filter_EQS_afternoon","1");
                    propertyFilters = PropertyFilter.buildFromMap(parameterMap);
                    List<MeetroomUse> meetroomAfterList = meetroomUseManager.find(propertyFilters);
                    if(meetroomAfterList!=null&&meetroomAfterList.size()>0) {
                        MeetroomUse afterU = meetroomAfterList.get(0);
                        mb.setAfterId(afterU.getRowId());
                        mb.setAMonday(afterU.getMonday());
                        mb.setATuesday(afterU.getTuesday());
                        mb.setAWednesday(afterU.getWednesday());
                        mb.setAThursday(afterU.getThursday());
                        mb.setAFriday(afterU.getFriday());
                        mb.setASaturday(afterU.getSaturday());
                        mb.setASunday(afterU.getSunday());
                    }
                    meetroomAll.add(mb);
                }
                model.addAttribute("meetList",meetroomAll);
            }
            model.addAttribute("page", page);
            model.addAttribute("dateList",dateList);
        }
        List<String> weekList = new ArrayList<String>();
        for (int i=1;i<=53;i++){
            weekList.add(i+"");
        }

        List<String> yearList=calendarIndexManager.find("select aYear from CalendarIndex group by aYear");
        model.addAttribute("weekList",weekList);
        model.addAttribute("yearList",yearList);
        model.addAttribute("filter_EQS_aYear",filter_EQS_aYear);
        model.addAttribute("filter_EQS_aWeek",filter_EQS_aWeek);
        return "notice/meetingroom-lookup";
    }

    @ResponseBody
    @RequestMapping(value = "find-used-meet", method = RequestMethod.POST)
    public String showInTrayUsedForm(String start, String end, HttpServletRequest request) throws Exception {
        System.out.println("进入方法+++++++++++==");
        String flag = "0";
        String result = request.getParameter("meetName");
//        result = result.substring(18,result.length()-2);
//        String sst = start+":00";
//        String est = end+":59";
        String sst = start;
        String est = end;
        System.out.println("会议室："+result);
        System.out.println("开始时间："+sst);
        System.out.println("结束时间："+est);
        String hql1 = "from MeetingArrangement where meetingRoomName = ? " +
                "and (startTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                "and startTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
        Object[] values1 = {result, sst, est};
        List<MeetingArrangement> roomApplyList1 = meetingArrangementManager.find(hql1, values1);
        if(roomApplyList1!=null && roomApplyList1.size() > 0){
            System.out.println("-------第一种情况--------");
            flag="0";
            System.out.println("----已占用-----1----");
        }else{
            System.out.println("-------第二种情况--------");
            String hql2 = "from MeetingArrangement where meetingRoomName = ? " +
                    "and startTime < DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')";
            Object[] values2 = {result, sst, sst};
            List<MeetingArrangement> roomApplyList2 = meetingArrangementManager.find(hql2, values2);
            if(roomApplyList2 != null && roomApplyList2.size() > 0){
                flag="0";
                System.out.println("----已占用-----2----");
            }else{
                flag="1";
                System.out.println("-------未占用--------");
            }
        }
        String str = "{flag:'"+flag+"'}";
        return JSON.parse(str).toString();
    }

    /**
     * 查询会议室上午详情ajax方法
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "meet-main", method = RequestMethod.POST)
    public String showInTrayForm(String dateType,HttpServletRequest request,String dataTime) throws UnsupportedEncodingException {
        String result= request.getParameter("meetName");
        System.out.println(result+"decode之后的会议室名称");
        String startTime="";
        String endTime="";
        System.out.println("时间："+dataTime);
        System.out.println("时间段："+dateType);
        if (dateType.equals("m")){
            startTime = dataTime+" 00:00:00";
            endTime = dataTime+" 11:59:59";
        }else if(dateType.equals("a")){
            startTime = dataTime+" 12:00:00";
            endTime = dataTime+" 23:59:59";
        }
        String title = "";
        String userName = "";
        String dept = "";
        String s = "";
        String e = "";
        // hql查询
        String hql1 = "select a from MeetingArrangement a where a.meetingRoomName = ? " +
                "and startTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')" +
                "and startTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')";
        Object[] values1 = {result, startTime, endTime};
        MeetingArrangement bdMeetingRoomApply = meetingArrangementManager.findUnique(hql1, values1);

        if(bdMeetingRoomApply != null){
            System.out.println("不为空："+bdMeetingRoomApply.getTitle());
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
            System.out.println(bdMeetingRoomApply.getStartTime()+"-=-=-=-=-==-=--"+sdf.format(bdMeetingRoomApply.getStartTime()));
            s = sdf.format(bdMeetingRoomApply.getStartTime());
            e = sdf.format(bdMeetingRoomApply.getEndTime());
            System.out.println("开始时间："+bdMeetingRoomApply.getStartTime());
            title = bdMeetingRoomApply.getTitle();
            dept = bdMeetingRoomApply.getCreateOrgName();
            userName = bdMeetingRoomApply.getCreateUserName()+"("+dept+")";

        }else{
            // hql查询
            String hql2 = "select a from MeetingArrangement a where a.meetingRoomName = ? " +
                    "and endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')";
            Object[] values2 = {result, startTime, endTime};
            bdMeetingRoomApply = meetingArrangementManager.findUnique(hql2, values2);
            if(bdMeetingRoomApply != null){
                System.out.println("不为空："+bdMeetingRoomApply.getTitle());
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                System.out.println(bdMeetingRoomApply.getStartTime()+"-=-=-=-=-==-=--"+sdf.format(bdMeetingRoomApply.getStartTime()));
                s = sdf.format(bdMeetingRoomApply.getStartTime());
                e = sdf.format(bdMeetingRoomApply.getEndTime());
                System.out.println("开始时间："+bdMeetingRoomApply.getStartTime());
                title = bdMeetingRoomApply.getTitle();
                dept = bdMeetingRoomApply.getCreateOrgName();
                userName = bdMeetingRoomApply.getCreateUserName()+"("+dept+")";
            }
        }
        String str = "{title:'"+title+"',user:'"+userName+"',start:'"+s+"',end:'"+e+"'}";
        System.out.println(JSON.parse(str).toString());
        return JSON.parse(str).toString();
    }


    public static java.util.Date addAndSubtractDaysByCalendar(java.util.Date dateTime/*待处理的日期*/,int n/*加减天数*/){

        //日期格式
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        java.util.Calendar calstart = java.util.Calendar.getInstance();
        calstart.setTime(dateTime);

        calstart.add(java.util.Calendar.DAY_OF_WEEK, n);

        System.out.println(df.format(calstart.getTime()));
        //System.out.println(dd.format(calstart.getTime()));
        return calstart.getTime();
    }
    /**
     * 获取当前星期星期一日期
     * */
    public static  String getCurrentMonday() {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        int mondayPlus = getMondayPlus();
        GregorianCalendar currentDate = new GregorianCalendar();
        currentDate.add(GregorianCalendar.DATE, mondayPlus);
        java.util.Date monday = currentDate.getTime();
        DateFormat df = DateFormat.getDateInstance();
        String preMonday = simpleDateFormat.format(monday);
        return preMonday;
    }

    /***
     * 获取该星期任意日期
     */
    public static String getPreviousSunday(int num) {
        int mondayPlus = getMondayPlus();
        GregorianCalendar currentDate = new GregorianCalendar();
        currentDate.add(GregorianCalendar.DATE, mondayPlus +num);
        java.util.Date monday = currentDate.getTime();
        DateFormat df = DateFormat.getDateInstance();
        String preMonday = df.format(monday);
        return preMonday;
    }

    // 获得本周一与当前日期相差的天数
    public static  int getMondayPlus() {
        Calendar cd = Calendar.getInstance();
        logger.info(cd+"cd");
        int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK);
        logger.info(dayOfWeek+"dayofweek");
        if (dayOfWeek == 1) {
            return -6;
        } else {
            return 2 - dayOfWeek;
        }
    }
}
