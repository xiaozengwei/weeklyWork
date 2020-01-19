package com.gx.soft.weeklywork.web;

import com.gx.core.export.ExcelDataNormalStrategy;
import com.gx.core.export.ExcelExportUtil;
import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.mapper.BeanMapper;
import com.gx.core.page.Page;
import com.gx.ext.mail.MailConsumer;
import com.gx.soft.common.util.DateUtil;
import com.gx.soft.sys.persistence.domain.GxSysRoleHasUser;
import com.gx.soft.sys.persistence.domain.GxSysUser;
import com.gx.soft.sys.persistence.domain.VUser;
import com.gx.soft.sys.persistence.manager.GxRoleHasUserManager;
import com.gx.soft.sys.persistence.manager.SysUserManager;
import com.gx.soft.weeklywork.persistence.domain.*;
import com.gx.soft.weeklywork.persistence.manager.*;
import com.gx.soft.weeklywork.persistence.vo.DateList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("weeklyView")
@SessionAttributes("user_session")
public class weeklyViewController {
    @Autowired
    private MeetingArrangementManager meetingArrangementManager;
    @Autowired
    private DicMeetroomManager dicMeetroomManager;
    @Autowired
    private CalendarIndexManager calendarIndexManager;
    @Autowired
    private MeetroomUseManager meetroomUseManager;
    @Autowired
    private SysUserManager sysUserManager;
    @Autowired
    private static Logger logger = LoggerFactory.getLogger(MailConsumer.class);

    private ArrayList<String> rowIdList=new ArrayList<>();
    private BeanMapper beanMapper = new BeanMapper();
    /**
     * 一周安排查询列表
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("list")
    public String listNew(Model model,@ModelAttribute("user_session") VUser user,String year,String week) throws Exception{

        List<DateList> dateLists=new ArrayList<>();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Object> parameterMap =new HashMap<>();
        parameterMap.put("filter_EQS_aWeek",week);
        parameterMap.put("filter_EQS_aYear",year);
        CalendarIndex calendarIndex=calendarIndexManager.find(PropertyFilter.buildFromMap(parameterMap)).get(0);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(calendarIndex.getWeekStartDate());
        if(year==null||week==null){
            String date1 =  NoticeController.getCurrentMonday();
            calendar.setTime(sdf.parse(date1));
        }
        for(int i=0;i<7;i++){
            DateList dateList=new DateList();
            dateList.setDateName(calendar.get(Calendar.MONTH)+1+"月"+calendar.get(Calendar.DATE)+"日");
            dateList.setDate(sdf.format(calendar.getTime()));

            List<MeetingArrangement> meetingArrangements=meetingArrangementManager.find("from MeetingArrangement where ext2 = '1' and DATE_FORMAT(startTime,'%Y-%m-%d')=? and (callLeaderName like '%"+user.getUserName()+"%' or callUsersName like '%"+user.getUserName()+"%')", dateList.getDate());
            if(user.getUserName().equals("admin")){
                meetingArrangements=meetingArrangementManager.find("from MeetingArrangement where ext2 = '1' and DATE_FORMAT(startTime,'%Y-%m-%d')=?",dateList.getDate());
            }
            dateList.setCount(meetingArrangements.size()*2);
            dateList.setMeetList(meetingArrangements);
            Map<String, Integer> map= DateUtil.getWeekAndYear(sdf.format(calendar.getTime()));
            year=map.get("year").toString();
            week=map.get("week").toString();

            dateLists.add(dateList);
            calendar.add(Calendar.DATE,1);
        }

       for(int i = 0 ;i<dateLists.size();i++){
           List<MeetingArrangement> meetinglist = dateLists.get(i).getMeetList();

           for(int j = 0;j < meetinglist.size();j++){
               meetinglist.get(j).setExt3(DateUtil.getTimeArea(meetinglist.get(j).getStartTime().toString(),meetinglist.get(j).getEndTime().toString(),""));
//               Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(meetinglist.get(j).getStartTime().toString());
//               Date enddate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(meetinglist.get(j).getEndTime().toString());
//               String startString = new SimpleDateFormat("HH:mm").format(date); //开始时间（时、分）
//               String hour = new SimpleDateFormat("HH").format(date); //09:00
//               String startDay = new SimpleDateFormat("yyyyMMdd").format(date); //开始日期（年月日）
//               String endDay = new SimpleDateFormat("yyyyMMdd").format(enddate); //结束日期（年月日）
//               String endDay1 = new SimpleDateFormat("dd").format(enddate); //结束日期（天）
//               String endhour = new SimpleDateFormat("HH").format(date); //结束时间（时）
//               String endMinus = new SimpleDateFormat("HH").format(date); //结束时间（分）
//               int hh = Integer.parseInt(hour);
//               if(hh<12){
//                   String ext3 = "上午"+startString;
//                   //判断是否在同一天
//                   if(!startDay.equals(endDay)){
//                       ext3 += "(至"+endDay1+"日)";
//                   }else{
//                       int endH = Integer.parseInt(endhour);
//                       int endM = Integer.parseInt(endMinus);
//                       if(endH>17){
//                           ext3 += "（全天）";
//                       }else if(endH==17&&endM>=30){
//                           ext3 += "（全天）";
//                       }
//                   }
//
//                   meetinglist.get(j).setExt3(ext3);
//               }else{
//                   String ext3 = "下午"+startString;
//                   if(!startDay.equals(endDay)){
//                       ext3 += "(至"+endDay1+"日)";
//                   }
//                   meetinglist.get(j).setExt3(ext3);
//               }
            }
       }
        List<String> yearList=calendarIndexManager.find("select aYear from CalendarIndex group by aYear");
        model.addAttribute("yearList",yearList);
        model.addAttribute("year",year);
        model.addAttribute("week",week);
        List<String> weekList=calendarIndexManager.find("select aWeek from CalendarIndex where aYear=? order by weekStartDate asc",year);
        model.addAttribute("weekList",weekList);
        model.addAttribute("startTime", dateLists.get(0).getDate());
        model.addAttribute("endTime",dateLists.get(6).getDate());
        model.addAttribute("dateLists",dateLists);
        return "weeklyview/weekly-view-list";
    }


//    @RequestMapping("list-old")
//    public String listNew(@ModelAttribute Page page,Model model,@ModelAttribute("user_session") VUser user,String year,String week) throws Exception {
//        List<DateList> dateLists = new ArrayList<>();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Map<String, Object> parameterMap = new HashMap<>();
//        parameterMap.put("filter_EQS_aWeek", week);
//        parameterMap.put("filter_EQS_aYear", year);
//        CalendarIndex calendarIndex = calendarIndexManager.find(PropertyFilter.buildFromMap(parameterMap)).get(0);
//        Calendar calendar = Calendar.getInstance();
//        calendar.setTime(calendarIndex.getWeekStartDate());
//        if (year == null || week == null) {
//            String date1 = NoticeController.getCurrentMonday();
//            calendar.setTime(sdf.parse(date1));
//        }
//        for (int i = 0; i < 7; i++) {
//            DateList dateList = new DateList();
//            dateList.setDateName(calendar.get(Calendar.MONTH) + 1 + "月" + calendar.get(Calendar.DATE) + "日");
//            dateList.setDate(sdf.format(calendar.getTime()));
//
//            List<MeetingArrangement> meetingArrangements = meetingArrangementManager.find("from MeetingArrangement where DATE_FORMAT(startTime,'%Y-%m-%d')=?", dateList.getDate());
//            dateList.setCount(meetingArrangements.size()*2);
//            dateList.setMeetList(meetingArrangements);
//            Map<String, Integer> map = DateUtil.getWeekAndYear(sdf.format(calendar.getTime()));
//            year = map.get("year").toString();
//            week = map.get("week").toString();
//            dateList.setDayOfWeek(week);
//            dateList.setCount(meetingArrangements.size());
//            dateLists.add(dateList);
//            calendar.add(Calendar.DATE, 1);
//        }
//
//
//        List<String> yearList = calendarIndexManager.find("select aYear from CalendarIndex group by aYear");
//        model.addAttribute("yearList", yearList);
//        model.addAttribute("year", year);
//        model.addAttribute("week", week);
//        List<String> weekList = calendarIndexManager.find("select aWeek from CalendarIndex where aYear=? order by weekStartDate asc", year);
//        model.addAttribute("dateLists",dateLists);
//        return "weeklywork/weeklyWork-list-new-old";
//
//    }


    @RequestMapping("list-old")
    public String listOld(Model model,@ModelAttribute("user_session") VUser user,String year,String week) throws Exception {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Integer> map=DateUtil.getWeekAndYear(simpleDateFormat.format(new Date()));
        if(year==null||week==null){
            year=map.get("year").toString();
            week=map.get("week").toString();
        }
        String hql="from MeetingArrangement where week=? and year=? order by startTime desc";
        List<MeetingArrangement> meetingArrangements = meetingArrangementManager.find(hql,week,year);

        List<String> yearList=calendarIndexManager.find("select aYear from CalendarIndex group by aYear");
        List<String> weekList=calendarIndexManager.find("select aWeek from CalendarIndex where aYear=? order by weekStartDate asc",year);
        model.addAttribute("yearList",yearList);
        model.addAttribute("year",year);
        model.addAttribute("week",week);
        model.addAttribute("weekList",weekList);
        model.addAttribute("list",meetingArrangements);


        return "weeklywork/weeklyWork-list-new-old";

    }


    /**
     * 选择会议室（责任人、参与人员）
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("select-meetingroom")
    public String selectMeetingRoom(String startTime, String endTime,String group,
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
            page = sysUserManager.pagedQuery(page, propertyFilters);
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
        model.addAttribute("group",group);
        model.addAttribute("filter_EQS_aYear",filter_EQS_aYear);
        model.addAttribute("filter_EQS_aWeek",filter_EQS_aWeek);
        return "notice/meeting-room-lookup";
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
        int mondayPlus = getMondayPlus();
        GregorianCalendar currentDate = new GregorianCalendar();
        currentDate.add(GregorianCalendar.DATE, mondayPlus);
        java.util.Date monday = currentDate.getTime();
        DateFormat df = DateFormat.getDateInstance();
        String preMonday = df.format(monday);
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

    @RequestMapping("export")
    @ResponseBody
    public Map<String, Object> export(HttpServletResponse response,String weekExport,@ModelAttribute("user_session") VUser user) throws Exception {
        List<List<MeetingArrangement>> result=new ArrayList<>();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "导出成功";

        int index=weekExport.lastIndexOf(",");
        weekExport=weekExport.substring(index==-1?0:index+1);
        Map<String, Integer> map=DateUtil.getWeekAndYear(sdf.format(new Date()));
        String year=map.get("year").toString();

        //导出模板设置
        String[] columnNameArr = {"startTime","endTime","title","meetingRoomName","callLeaderName","callUsersName","useOrgName"};
        String[] columnComment = {"日期", "时间","会议内容","地点","召集领导","出席人员","承办部门"};
        Integer[] columnWidth = {150, 150, 250,150,150,250,150};
        String fileName = "一周工作安排";
        Map<String, Object> metaMap = new HashMap<>();
        metaMap.put("columnName", columnNameArr);
        metaMap.put("columnWidth", columnWidth);
        metaMap.put("columnComment", columnComment);

        //数据
        Map<String, Object> parameterMap =new HashMap<>();
        parameterMap.put("filter_EQS_aWeek",weekExport);
        parameterMap.put("filter_EQS_aYear",year);
        CalendarIndex calendarIndex=calendarIndexManager.find(PropertyFilter.buildFromMap(parameterMap)).get(0);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(calendarIndex.getWeekStartDate());
        for(int i=0;i<7;i++){
            List<MeetingArrangement> meetingArrangements=meetingArrangementManager.find("from MeetingArrangement where ext2 = '1' and DATE_FORMAT(startTime,'%Y-%m-%d')=? and (callLeaderName like '%"+user.getUserName()+"%' or callUsersName like '%"+user.getUserName()+"%')",sdf.format(calendar.getTime()));
            if(user.getUserName().equals("admin")){
                meetingArrangements=meetingArrangementManager.find("from MeetingArrangement where ext2 = '1' and DATE_FORMAT(startTime,'%Y-%m-%d')=?",sdf.format(calendar.getTime()));
            }
            result.add(meetingArrangements);
            calendar.add(Calendar.DATE,1);
        }


        ExcelExportUtil excelExportUtil = new ExcelExportUtil(new ExcelDataNormalStrategy());
        try {
            excelExportUtil.exportBeanMerge(response, fileName, result, columnComment,columnWidth,calendarIndex);
        } catch (Exception e) {
            statusCode = "300";
            message = "导出失败";
            e.printStackTrace();
        }
        resMap.put("statusCode",statusCode);
        resMap.put("message",message);
        return resMap;
    }
}
