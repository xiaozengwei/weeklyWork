package com.gx.soft.weeklywork.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.mapper.BeanMapper;
import com.gx.core.page.Page;
import com.gx.core.util.StringUtils;
import com.gx.soft.common.util.DateUtil;
import com.gx.soft.common.util.FileUtil;
import com.gx.soft.sys.persistence.domain.GxSysRoleHasUser;
import com.gx.soft.sys.persistence.domain.VUser;
import com.gx.soft.sys.persistence.manager.GxRoleHasUserManager;
import com.gx.soft.sys.persistence.manager.SysUserManager;
import com.gx.soft.weeklywork.persistence.domain.*;
import com.gx.soft.weeklywork.persistence.manager.*;
import com.gx.soft.weeklywork.persistence.vo.DateList;
import com.gx.soft.weeklywork.persistence.vo.JsscydVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("weeklyWork")
@SessionAttributes("user_session")
public class WeeklyworkController {
    @Autowired
    private MeetingArrangementManager meetingArrangementManager;
    @Autowired
    private FileRecordManager fileRecordManager;
    @Autowired
    private CalendarIndexManager calendarIndexManager;
    @Autowired
    private MeetroomUseManager meetroomUseManager;
    @Autowired
    private GxRoleHasUserManager gxRoleHasUserManager;
    @Autowired
    private GxSysUserOrgRoleManager gxSysUserOrgRoleManager;
    @Autowired
    private DicMeetroomManager dicMeetroomManager;

    private ArrayList<String>rowIdList=new ArrayList<>();
    private BeanMapper beanMapper = new BeanMapper();

    /**
     * 显示一周安排列表
     * @param page
     * @param parameterMap
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model,@ModelAttribute("user_session") VUser user,String type){
        String hql="";
        String meetingRoomName=parameterMap.get("filter_LIKES_meetingRoomName")==null?"":parameterMap.get("filter_LIKES_meetingRoomName").toString();
        String startTime=parameterMap.get("filter_GED_startTime")==null?"":parameterMap.get("filter_GED_startTime").toString();
        String endTime=parameterMap.get("filter_LED_endTime")==null?"":parameterMap.get("filter_LED_endTime").toString();

        List<GxSysRoleHasUser> roleHasUsers=gxRoleHasUserManager.findBy("userId",user.getUserId());
        boolean flog=false;
        for(GxSysRoleHasUser gxSysRoleHasUser:roleHasUsers){
            if(gxSysRoleHasUser.getRoleId().equals("sys-manager-role")){
                flog=true;
                break;
            }
        }
        if(flog){
            page = meetingArrangementManager.pagedQuery(page,PropertyFilter.buildFromMap(parameterMap));
        }else {
            hql="from MeetingArrangement where (callLeaderId like ? or callUsersId like ? or callOrgsId like ?)";
            if(!meetingRoomName.equals("")){
                hql+="and meetingRoomName like '%"+meetingRoomName+"%'";
            }
            if(!startTime.equals("")){
                hql+="and startTime >'"+startTime+"'";
            }
            if(!endTime.equals("")){
                hql+="and endTime <'"+endTime+"'";
            }
            page = meetingArrangementManager.pagedQuery(hql,page.getPageCurrent(),page.getPageSize(),"%"+user.getUserId()+"%","%"+user.getUserId()+"%","%"+user.getOrgId()+"%");
        }
        model.addAttribute("page",page);
        if(type!=null&&type.equals("look")){
            return "weeklywork/weeklyWork-list-look";
        }
        return "weeklywork/weeklyWork-list";
    }

    /**
     * 添加一周安排
     * @param rowId
     * @param model
     * @return
     */
    @RequestMapping("weeklyWork-input")
    public String input(@RequestParam(value = "rowId", required = false) String rowId, Model model) {
        MeetingArrangement meetingArrangement;
        if (rowId != null) {
            meetingArrangement = meetingArrangementManager.get(rowId);

            String hql="from FileRecord where arrangementId=?";
            ArrayList<FileRecord> fileRecordList= (ArrayList<FileRecord>) fileRecordManager.find(hql,rowId);
            model.addAttribute("fileRecordList", fileRecordList);
        } else {
            meetingArrangement = new MeetingArrangement();
        }
        model.addAttribute("weeklyReport", meetingArrangement);
        model.addAttribute("minTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        return "weeklywork/weeklyWork-input";
    }

    /**
     * 一周安排附件
     * @param file
     * @param model
     * @param session
     * @return
     * @throws IOException
     */
    @RequestMapping("fileupload")
    @ResponseBody
    public Map<String, Object> processUpload(@RequestParam MultipartFile file,
                                             Model model, HttpSession session
    ) throws IOException {
        Map<String, Object> resMap = new HashMap<String, Object>();
        VUser user=(VUser)session.getAttribute("user_session");
        resMap.put("user", user);
        model.addAttribute("message", "File '" + file.getOriginalFilename());
//        String bol="yes";
        String fileOriginalName = file.getOriginalFilename();
        String statusCode = "200", message = "上传成功";
        FileRecord fileRecord=new FileRecord();
        try {
            if (!StringUtils.isEmpty(fileOriginalName)) {
                FileUtil fileHelper = new FileUtil();
                String decodeFileName = fileHelper.getDecodeFileName(fileOriginalName);// 文件名编码
                String mFilePath = session.getServletContext().getRealPath("") + decodeFileName; // 取得服务器路径
                mFilePath = mFilePath.substring(0, 2) + "\\njdtjsis" + "\\weeklyWork\\" + decodeFileName;
                fileHelper.createFile(mFilePath, file.getBytes());
                fileRecord.setFilePath(mFilePath);
                fileRecord.setUploadUserName(user.getUserId());
                fileRecord.setUploadUserId(user.getUserName());
                fileRecord.setFileName(fileOriginalName);
                Timestamp time = new Timestamp(System.currentTimeMillis());
                fileRecord.setUploadTime(time);
                fileRecord.setFileType(file.getContentType());
                fileRecord.setFileIdentifyName(decodeFileName);
                fileRecordManager.save(fileRecord);
                message = "请选择上传文件";
                statusCode = "300";
            }

        } catch (Exception e) {
            statusCode = "300";
            message = "上传失败";
//            bol="no";
            e.printStackTrace();
        }
        resMap.put("AttachEntity", fileRecord);
        if(fileRecord.getRowId()!=null) {
            rowIdList.add(fileRecord.getRowId());
        }
        return resMap;
    }

    /**
     * 附件删除
     * @param delids
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public Map<String, Object> delete(@RequestParam String delids){
        Map<String, Object> resMap = new HashMap<String, Object>();
        List<String> row_ides=new ArrayList<>();
        String statusCode = "200", message = "删除成功";

        try {
            if (delids != null && delids.length() > 0) {
                String[] ids = delids.split(",");
                for (String rowId : ids) {
                    if (rowId != null && rowId.length() > 0) {
                        row_ides.add(rowId);
                        String filePath=fileRecordManager.get(rowId).getFilePath();
                        FileUtil fileHelper = new FileUtil();
                        boolean isDelete = true;
                        try {
                            fileHelper.deleteFile(filePath);
                            if (!isDelete) {
                                statusCode = "300";
                                message = "删除失败";
                            }
                        } catch (Exception e) {
                            statusCode = "300";
                            e.printStackTrace();
                        }
                        fileRecordManager.removeById(rowId);
                        rowIdList.remove(rowId);
                        resMap.put("nowRowId", rowId);
                    }
                }
            }
        } catch (Exception e) {
            statusCode = "300";
            message = "删除失败";
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("row_ides",row_ides);
        return resMap;
    }

    /**
     * 附件下载
     * @param delids
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "fileDownload")
    @ResponseBody
    public   Map<String, Object> fileDownLoad( @RequestParam String delids, HttpServletRequest request,
                                               HttpServletResponse response) throws IOException {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String[] ids = delids.split(",");
        for(String id:ids){
            FileRecord fileRecord = fileRecordManager.get(id);
            if(fileRecord!=null) {
                String filePath = fileRecord.getFilePath();
                String fileName = fileRecord.getFileName();
                FileUtil fileHelper = new FileUtil();
                fileHelper.downloadFile(filePath, request, response, fileName);
                resMap.put("statusCode", "200");
                resMap.put("message", "下载成功");
            }else {
                resMap.put("statusCode", "300");
                resMap.put("message", "下载失败");
            }
        }
        return resMap;
    }

    /**
     * 一周安排保存 选择会议室 判断会议室占用情况
     * @param meetingArrangement
     * @param user
     * @return
     */
    @RequestMapping(value = "weeklyWork-save", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Map<String, Object> save(MeetingArrangement meetingArrangement, @ModelAttribute("user_session") VUser user) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "操作成功";
        Timestamp ts = DateUtil.getDate();
        String startType="";
        String endType="";
        Map<String, Object> parameterMap=new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            MeetingArrangement dest ;
            String id = meetingArrangement.getRowId();
            //更新操作
            if (id != null && id.length() > 0) {
                dest = meetingArrangementManager.get(id);
                String rowID=id;
                for (int i = 0; i < rowIdList.size(); i++) {
                    FileRecord fileRecord = fileRecordManager.get(rowIdList.get(i));
                    fileRecord.setArrangementId(rowID);
                    fileRecordManager.save(fileRecord);
                }
                if (!dest.getMeetingRoomName().equals(meetingArrangement.getMeetingRoomName()) || !dest.getStartTime().equals(meetingArrangement.getStartTime()) || !dest.getEndTime().equals(meetingArrangement.getEndTime())) {
                    //删除原来的占用（设为0）
                    useMeetroom(dest.getStartTime(),dest.getEndTime(),dest.getMeetingRoomName(),"0");
                    //添加新的占用（设为1）
                    useMeetroom(meetingArrangement.getStartTime(),meetingArrangement.getEndTime(),meetingArrangement.getMeetingRoomName(),"1");
                }
                beanMapper.copy(meetingArrangement, dest);
            } else {
                //保存操作
                meetingArrangement.setRowId(null);
                dest = meetingArrangement;
                dest.setApplyDate(ts);
                useMeetroom(dest.getStartTime(),dest.getEndTime(),dest.getMeetingRoomName(),"1");

                dest.setTitle(dest.getTitle().trim());
                dest.setCreateUserId(user.getUserId());
                dest.setCreateUserName(user.getUserName());
                dest.setCreateOrgId(user.getOrgId());
                dest.setCreateOrgName(user.getOrgName());
            }

            meetingArrangementManager.save(dest);

            String rowID=dest.getRowId();
            if(rowID!=null) {
                for (int i = 0; i < rowIdList.size(); i++) {
                    FileRecord fileRecord = fileRecordManager.get(rowIdList.get(i));
                    fileRecord.setArrangementId(rowID);
                    fileRecordManager.save(fileRecord);
                }
                rowIdList.clear();
            }
        } catch (Exception e) {
            statusCode = "300";
            message = "操作失败";
            e.printStackTrace();
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("closeCurrent", true);
        return resMap;
    }

    /**
     * 一周安排删除
     * @param delids
     * @return
     */
    @RequestMapping("remove")
    @ResponseBody
    public Map<String, Object> viewRemove(String delids,@RequestParam Map<String, Object> parameterMap) {
        delids=JSON.parseArray(parameterMap.get("json").toString()).getJSONObject(0).get("rowId").toString();
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "删除成功";
        try {
            if (delids != null && delids.length() > 0) {
                String[] ids = delids.split(",");
                for (String rowId : ids) {
                    if (rowId != null && rowId.length() > 0) {
                        // 删除会议室占用
                        MeetingArrangement meet=meetingArrangementManager.get(rowId);
                        useMeetroom(meet.getStartTime(),meet.getEndTime(),meet.getMeetingRoomName(),"0");

                        fileRecordManager.remove(fileRecordManager.findUniqueBy("arrangementId",rowId));
                        meetingArrangementManager.removeById(rowId);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            statusCode = "300";
            message = "删除失败";
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("reload", true);
        return resMap;
    }
    /**
     * 一周安排删除
     * @param rowId
     * @return
     */
    @RequestMapping("removeWeek")
    @ResponseBody
    public Map<String, Object> removeWeek(String rowId,@RequestParam Map<String, Object> parameterMap) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "删除成功";
        try {

                    if (rowId != null && rowId.length() > 0) {
                        // 删除会议室占用
                        MeetingArrangement meet=meetingArrangementManager.get(rowId);
                        useMeetroom(meet.getStartTime(),meet.getEndTime(),meet.getMeetingRoomName(),"0");

                        fileRecordManager.remove(fileRecordManager.findUniqueBy("arrangementId",rowId));
                        meetingArrangementManager.removeById(rowId);
                    }

        } catch (Exception e) {
            e.printStackTrace();
            statusCode = "300";
            message = "删除失败";
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("reload", true);
        return resMap;
    }

    /**
     * 查看详情
     * @param rowId
     * @param model
     * @return
     */
    @RequestMapping("look")
    public String edit(@RequestParam(value = "rowId", required = false) String rowId, Model model) {
        MeetingArrangement meetingArrangement;
        meetingArrangement = meetingArrangementManager.get(rowId);
        String hql="from FileRecord where arrangementId=?";
        ArrayList<FileRecord>fileRecordList= (ArrayList<FileRecord>) fileRecordManager.find(hql,rowId);
        model.addAttribute("weeklyReport", meetingArrangement);
        model.addAttribute("fileRecordList", fileRecordList);
        return "weeklywork/weeklyWork-look";
    }

    /**
     * 刷新周表数据
     * 先在数据库中添加下一年数据，定时生成隔一年的。
     * */
    @Scheduled(cron="0 0 12 25 12 ?")
    @RequestMapping("findgetCadIndex")
    public void findgetCadIndex() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date now = new Date();
        Calendar cal=Calendar.getInstance();
        cal.add(Calendar.DATE,7);
        cal.add(Calendar.YEAR,1);
        String year = sdf.format(cal.getTime());
        DateUtil cd = new DateUtil();
        for (int i=1;i<=53;i++){
            String start = cd.getStartDayOfWeekNo(Integer.parseInt(year),i);
            String end = cd.getEndDayOfWeekNo(Integer.parseInt(year),i);
            CalendarIndex calendar = new CalendarIndex();
            calendar.setaYear(year);
            calendar.setaWeek(i+"");
            calendar.setWeekStartDate(new java.sql.Date(df.parse(start).getTime()));
            calendar.setWeekEndDate(new java.sql.Date(df.parse(end).getTime()));
            if(i>50){
                Map<String, Integer> map=DateUtil.getWeekAndYear(start);
                if(map.get("week").toString().equals("1")){
                    break;
                }
            }
            calendarIndexManager.save(calendar);
        }
    }


    /**
     * 保存会议室使用表
     * @param weekDay（星期几）
     * @param dayType（上午、下午）
     * @param meetRoomName（会议室名称）
     * @param calenderIndex（周表主键）
     * @param type（会议室使用类型 1：已申请未确认、2：已确定、0：没占用）
     * @throws Exception
     */
    public void saveMeetRoomUse(int weekDay,String dayType,String meetRoomName,String calenderIndex, String type) throws Exception {
        String hql = "";
        if (dayType.equals("上午")){
            hql = "select a from MeetroomUse a where a.meetingRoomName = ? " +
                    "and a.indexId =?" +
                    "and a.morning =?";
        }else if (dayType.equals("下午")){
            hql = "select a from MeetroomUse a where a.meetingRoomName = ? " +
                    "and a.indexId =?" +
                    "and a.afternoon =?";
        }
        Object[] values = {meetRoomName, calenderIndex, "1"};
        MeetroomUse meetRoomUse = meetroomUseManager.findUnique(hql, values);
        if(meetRoomUse == null){
            meetRoomUse = new MeetroomUse();
            meetRoomUse.setRowId(null);
            meetRoomUse.setIndexId(calenderIndex);
            meetRoomUse.setMeetingRoomName(meetRoomName);
            if(dayType.equals("上午")){
                meetRoomUse.setMorning("1");
            }else if(dayType.equals("下午")){
                meetRoomUse.setAfternoon("1");
            }
        }
        if(weekDay==1){
            meetRoomUse.setMonday(type);
        }else if(weekDay==2){
            meetRoomUse.setTuesday(type);
        }else if(weekDay==3){
            meetRoomUse.setWednesday(type);
        }else if(weekDay==4){
            meetRoomUse.setThursday(type);
        }else if(weekDay==5){
            meetRoomUse.setFriday(type);
        }else if(weekDay==6){
            meetRoomUse.setSaturday(type);
        }else if(weekDay==7){
            meetRoomUse.setSunday(type);
        }
        // 保存
        meetroomUseManager.save(meetRoomUse);
    }

    /**
     * 根据时间从周表中查出关联id
     * */
    public String findCalIndex(Date st){
        Map<String, Object> parameterMap = new HashMap<>();
        SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd");
        String startStartTime=df.format(st);
        parameterMap.clear();
        parameterMap.put("filter_LED_weekStartDate",startStartTime);
        parameterMap.put("filter_GED_weekEndDate",startStartTime);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        List<CalendarIndex> calenderList = calendarIndexManager.find(propertyFilters);
        String calenderIndex ="";
        if(calenderList!=null&&calenderList.size()>0) {
            calenderIndex = calenderList.get(0).getRowId();
        }
        return calenderIndex;
    }

    /**
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @param meetRoomName 会议室
     * @param status        解除/绑定 ，1/绑定 、0/解绑
     * @throws Exception
     */
    public void useMeetroom(Timestamp startTime,Timestamp endTime,String meetRoomName,String status) throws Exception{
        String startType="";
        String endType="";
        Map<String, Object> parameterMap=new HashMap<>();
        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String meetStartTime = d.format(startTime);
        String meetEndTime = d.format(endTime);
        Date st =d.parse(meetStartTime);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(st);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        if (hour>=0&&hour<=12){
            startType="上午";
        }else{
            startType="下午";
        }
        Date en =d.parse(meetEndTime);
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(en);
        int hour1 = calendar1.get(Calendar.HOUR_OF_DAY);
        if (hour1>=0&&hour1<=12){
            endType="上午";
        }else{
            endType="下午";
        }
        SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd");
        String startStartTime=df.format(st);
        String endStartTime=df.format(en);
        /*parameterMap.clear();*/
        //start +1
        Calendar start=Calendar.getInstance();
        start.setTime(df.parse(startStartTime));
        //compare with start
        Calendar end=Calendar.getInstance();
        end.setTime(df.parse(endStartTime));

        Map<String, Integer> map=DateUtil.getWeekAndYear(df.format(start.getTime()));
        String year=map.get("year").toString();
        String week=map.get("week").toString();
        parameterMap.put("filter_EQS_aWeek",week);
        parameterMap.put("filter_EQS_aYear",year);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        String calenderIndex = calendarIndexManager.find(propertyFilters).get(0).getRowId();
        int startWeekDay = DateUtil.dayForWeek(startStartTime);
        if(startStartTime.equals(endStartTime)){
            if (startType.equals("上午") && endType.equals("上午")) {
                saveMeetRoomUse(startWeekDay, "上午", meetRoomName, calenderIndex, status);
            } else if (startType.equals("下午") && endType.equals("下午")) {
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
            } else if (startType.equals("上午") && endType.equals("下午")) {
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(startWeekDay, "上午", meetRoomName, calenderIndex, status);
            }
        }else {
            if (startType.equals("上午")) {
                saveMeetRoomUse(startWeekDay, "上午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
            } else {
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
            }
        }

        while(start.before(end)){
            if(!df.format(start.getTime()).equals(startStartTime)){
                map=DateUtil.getWeekAndYear(df.format(start.getTime()));
                year=map.get("year").toString();
                week=map.get("week").toString();
                parameterMap.put("filter_EQS_aWeek",week);
                parameterMap.put("filter_EQS_aYear",year);
                calenderIndex = calendarIndexManager.find(PropertyFilter
                        .buildFromMap(parameterMap)).get(0).getRowId();
                int weekDay = DateUtil.dayForWeek(df.format(start.getTime()));
                saveMeetRoomUse(weekDay, "上午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(weekDay, "下午", meetRoomName, calenderIndex, status);
            }
            start.add(Calendar.DATE,1);
        }

        if(!startStartTime.equals(endStartTime)){
            map=DateUtil.getWeekAndYear(df.format(end.getTime()));
            year=map.get("year").toString();
            week=map.get("week").toString();
            parameterMap.put("filter_EQS_aWeek",week);
            parameterMap.put("filter_EQS_aYear",year);
            calenderIndex = calendarIndexManager.find(PropertyFilter
                    .buildFromMap(parameterMap)).get(0).getRowId();
            int endWeekDay = DateUtil.dayForWeek(endStartTime);
            if(endType.equals("上午")){
                saveMeetRoomUse(endWeekDay, "上午", meetRoomName, calenderIndex, status);
            }else{
                saveMeetRoomUse(endWeekDay, "上午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(endWeekDay, "下午", meetRoomName, calenderIndex, status);
            }
        }
    }


    @RequestMapping(value="list-new")
    public String listNew(@ModelAttribute Page page,Model model,@ModelAttribute("user_session") VUser user,String startTime,String endTime) throws Exception{
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("filter_GED_startTime",startTime);
        parameterMap.put("filter_LED_endTime",endTime);
        parameterMap.put("filter_EQS_ext2","1");
        List<MeetingArrangement> list=meetingArrangementManager.find("startTime",false,PropertyFilter.buildFromMap(parameterMap));
        System.out.println(JSON.toJSONStringWithDateFormat(list,"yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteDateUseDateFormat));
        model.addAttribute("List", JSON.toJSONStringWithDateFormat(list,"yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteDateUseDateFormat));
        return "weeklywork/weeklyWork-list-new";
    }
    @RequestMapping(value="list-old")
    public String listOLd(@ModelAttribute Page page,Model model,@ModelAttribute("user_session") VUser user,String startTime,String endTime) throws Exception{
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("filter_GED_startTime",startTime);
        parameterMap.put("filter_LED_endTime",endTime);
        parameterMap.put("filter_EQS_ext2","1");
        List<MeetingArrangement> list=meetingArrangementManager.find("startTime",false,PropertyFilter.buildFromMap(parameterMap));
        System.out.println(JSON.toJSONStringWithDateFormat(list,"yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteDateUseDateFormat));
        model.addAttribute("List", JSON.toJSONStringWithDateFormat(list,"yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteDateUseDateFormat));
        return "weeklywork/weeklyWork-list-new-old";
    }


    @RequestMapping("form-save")
    @Transactional(rollbackFor = { Exception.class })
    public @ResponseBody
    Map<String, Object> formSave(@RequestParam Map<String, Object> parameterMap,@ModelAttribute("user_session") VUser user) throws Exception{
        Map<String, Object> resMap = new HashMap<String, Object>();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfl=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        MeetingArrangement meetingArrangement=new MeetingArrangement();
        System.out.println(parameterMap.get("json"));
        JSONArray jsonArray= JSON.parseArray(parameterMap.get("json").toString());
        if(jsonArray.size()==0){
            return resMap;
        }
        JSONObject object=(JSONObject) jsonArray.get(0);
        meetingArrangement.setRowId(object.get("rowId")==null?"":object.get("rowId").toString());
        meetingArrangement.setStartTime(Timestamp.valueOf(object.get("startTime").toString()));
        meetingArrangement.setEndTime(Timestamp.valueOf(object.get("endTime").toString()));
        meetingArrangement.setTitle(object.get("title").toString());
        meetingArrangement.setCallLeaderId(object.get("callLeaderId").toString());
        meetingArrangement.setCallLeaderName(object.get("callLeaderName").toString());
        meetingArrangement.setCallUsersId(object.get("callUsersId").toString());
        meetingArrangement.setCallUsersName(object.get("callUsersName").toString());
        meetingArrangement.setUseOrgName(object.get("useOrgName").toString());
        meetingArrangement.setUseOrgId(object.get("useOrgId").toString());
        meetingArrangement.setMeetingRoomName(object.get("meetingRoomName").toString());
//        meetingArrangement.setMeetingRoomId(object.get("meetingRoomId").toString());

        Map<String, String> result= useMeetingRoomIsOk(sdfl.format(meetingArrangement.getStartTime()),sdfl.format(meetingArrangement.getEndTime()),
                meetingArrangement.getMeetingRoomName(),meetingArrangement.getCallLeaderName(),meetingArrangement.getCallUsersName(),
                meetingArrangement.getRowId(),meetingArrangement.getMeetingRoomName());
        if(!result.get("flag").equals("1")){
            String statusCode = "300";
            resMap.put("statusCode", statusCode);
            resMap.put("message", result.get("message"));
            return resMap;
        }
        //更新操作
        if (!meetingArrangement.getRowId().equals("")) {
            MeetingArrangement dest = meetingArrangementManager.get(meetingArrangement.getRowId());
            if (!dest.getMeetingRoomName().equals(meetingArrangement.getMeetingRoomName()) || !dest.getStartTime().equals(meetingArrangement.getStartTime())
                    || !dest.getEndTime().equals(meetingArrangement.getEndTime())) {
                //删除原来的占用（设为0）
                useMeetroom(dest.getStartTime(),dest.getEndTime(),dest.getMeetingRoomName(),"0");
                //添加新的占用（设为1）
                List<DicMeetroom> list=dicMeetroomManager.findBy("mtName",meetingArrangement.getMeetingRoomName());
                if(list!=null&&list.size()>0){
                    useMeetroom(meetingArrangement.getStartTime(),meetingArrangement.getEndTime(),meetingArrangement.getMeetingRoomName(),"1");
                }

            }
            beanMapper.copy(meetingArrangement, dest);
        } else {
            //保存操作
            meetingArrangement.setRowId(null);
            Timestamp ts = DateUtil.getDate();
            meetingArrangement.setApplyDate(ts);
            useMeetroom(meetingArrangement.getStartTime(),meetingArrangement.getEndTime(),meetingArrangement.getMeetingRoomName(),"1");
            meetingArrangement.setCreateUserId(user.getUserId());
//            meetingArrangement.setCreateUserName(user.getUserName());
//            meetingArrangement.setCreateOrgId(user.getOrgId());
//            meetingArrangement.setCreateOrgName(user.getOrgName());
        }

        Map<String, Integer> map=DateUtil.getWeekAndYear(sdf.format(meetingArrangement.getStartTime()));
        meetingArrangement.setYear(map.get("year").toString());
        meetingArrangement.setWeek(map.get("week").toString());
        meetingArrangement.setDayOfWeek(String.valueOf(DateUtil.dayForWeekByCh(sdf.format(meetingArrangement.getStartTime()))));
        meetingArrangement.setExt2("1");
        meetingArrangementManager.save(meetingArrangement);

        String statusCode = "200", message = "提交成功";
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("reload", true);
        return resMap;
    }

    @RequestMapping("form-remove")
    public @ResponseBody
    Map<String, Object> meetRemove(String rowId) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "删除成功";
        try {
                meetingArrangementManager.removeById(rowId);
        } catch (Exception e) {
            statusCode = "300";
            message = "删除失败";
            e.printStackTrace();
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("reload", true);
        return resMap;
    }


    /**
     * 判断是否有占用
     * @param start
     * @param end
     * @return
     * @throws Exception
     */
    public Map<String, String> useMeetingRoomIsOk(String start, String end,String meetingRoom,String callLeaderName,String callUsersName,String rowId,String roomName) throws Exception {
        Map<String, String> result = new HashMap<>();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH");
        String flag = "0";
        String message="";
        System.out.println("会议室："+meetingRoom);
        System.out.println("开始时间："+start);
        System.out.println("结束时间："+end);

        //判断会议室是否被占用
        String hql1 = "from MeetingArrangement where meetingRoomName = ?  and rowId !=?" +
                "and (startTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                "and startTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
        Object[] values1 = {meetingRoom,rowId, start, end};
        List<MeetingArrangement> roomApplyList1 = meetingArrangementManager.find(hql1, values1);
        if(roomApplyList1!=null && roomApplyList1.size() > 0){
            //已占用
            flag="0";
            message="该时间段已有会议安排";

        }else{
            String hql2 = "from MeetingArrangement where meetingRoomName = ? and rowId !=? " +
                    "and startTime < DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')";
            Object[] values2 = {meetingRoom,rowId, start, end};
            List<MeetingArrangement> roomApplyList2 = meetingArrangementManager.find(hql2, values2);
            if(roomApplyList2 != null && roomApplyList2.size() > 0){
                //已占用
                flag="0";
                message="该时间段已有会议安排";

            }else{
                //未占用
                flag="1";
            }
        }
        if(!flag.equals("0")){
            String hql3 = "from MeetingArrangement where meetingRoomName = ? and rowId !=?" +
                    "and (endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
            Object[] values3 = {meetingRoom,rowId, start, end};
            List<MeetingArrangement> roomApplyList3 = meetingArrangementManager.find(hql3, values3);
            if(roomApplyList3 != null && roomApplyList3.size() > 0){
                //已占用
                flag="0";
                message="该时间段已有会议安排";
            }else{
                //未占用
                flag="1";
            }
        }

        //如果会议室选填不存在即不需要判断是否被占用
        List<DicMeetroom> list=dicMeetroomManager.findBy("mtName",roomName);
        if(!(list!=null&&list.size()>0)){
            flag="1";
        }

        //判断时间段内是否有领导参加其他会议
        if(flag.equals("1")){
            String userHql = "from MeetingArrangement where rowId !=? and " +
                    "(startTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and startTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
            Object[] userValues1 = {rowId,start, end};
            List<MeetingArrangement> userList1 = meetingArrangementManager.find(userHql, userValues1);
            String[] callLeaderNameList1=callLeaderName.split(",");
            String[] callLeaderNameList=new String[callLeaderNameList1.length+callUsersName.split(",").length];
            int i=0;
            for(String str:callLeaderNameList1){
                callLeaderNameList[i]=str;
                i++;
            }
            for(String str:callUsersName.split(",")){
                GxSysUserOrgRole gxSysUserOrgRole=gxSysUserOrgRoleManager.findUniqueBy("roleName",str.trim());
                if(gxSysUserOrgRole!=null&&gxSysUserOrgRole.getRoleType().equals("0")){
                    callLeaderNameList[i]=str.trim();
                }
                i++;
            }
            for(MeetingArrangement meetingArrangement:userList1){
                for(String leaderName:callLeaderNameList){
                    if(leaderName==null){
                        continue;
                    }
                    if((meetingArrangement.getCallLeaderName()!=null&&meetingArrangement.getCallLeaderName().contains(leaderName))||
                            (meetingArrangement.getCallUsersName()!=null&&meetingArrangement.getCallUsersName().contains(leaderName))){
                        flag="3";
                        message=leaderName+"在"+sdf.format(meetingArrangement.getStartTime())+"点已有会议";
                        result.put("flag",flag);
                        result.put("message",message);
                        return result;
                    }
                }
            }

            String userHql2 = "from MeetingArrangement where rowId!=? and " +
                    "startTime < DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')";
            Object[] userValues2 = {rowId,start, end};
            List<MeetingArrangement> userList2 = meetingArrangementManager.find(userHql2, userValues2);

            for(MeetingArrangement meetingArrangement:userList2){
                for(String leaderName:callLeaderNameList){
                    if(leaderName==null){
                        continue;
                    }
                    if((meetingArrangement.getCallLeaderName()!=null&&meetingArrangement.getCallLeaderName().contains(leaderName))||
                            (meetingArrangement.getCallUsersName()!=null&&meetingArrangement.getCallUsersName().contains(leaderName))){
                        flag="3";
                        message=leaderName+"在"+sdf.format(meetingArrangement.getStartTime())+"点已有会议";
                        result.put("flag",flag);
                        result.put("message",message);
                        return result;
                    }
                }
            }

            String userHql3 = "from MeetingArrangement where rowId!=? and" +
                    "(endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
            Object[] userValues3 = {rowId,start, end};
            List<MeetingArrangement> userList3 = meetingArrangementManager.find(userHql3, userValues3);
            for(MeetingArrangement meetingArrangement:userList3){
                for(String leaderName:callLeaderNameList){
                    if(leaderName==null){
                        continue;
                    }
                    if((meetingArrangement.getCallLeaderName()!=null&&meetingArrangement.getCallLeaderName().contains(leaderName))||
                            (meetingArrangement.getCallUsersName()!=null&&meetingArrangement.getCallUsersName().contains(leaderName))){
                        flag="3";
                        message=leaderName+"在"+sdf.format(meetingArrangement.getStartTime())+"点已有会议";
                        result.put("flag",flag);
                        result.put("message",message);
                        return result;
                    }
                }
            }

        }
        result.put("flag",flag);
        result.put("message",message);
        return result;
    }

    @RequestMapping("one-save")
    @Transactional(rollbackFor = { Exception.class })
    public @ResponseBody
    Map<String, Object> oneSave(JsscydVo recordListVo, @ModelAttribute("user_session") VUser user,String rowId,String startTime,String endTime,String title,
                                String callLeaderName, String callUsersName, String useOrgName, String meetingRoomName) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "提交成功";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfl = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        MeetingArrangement meetingArrangement=new MeetingArrangement();
        meetingArrangement.setStartTime(Timestamp.valueOf(startTime));
        meetingArrangement.setEndTime(Timestamp.valueOf(endTime));
        meetingArrangement.setTitle(title.replaceAll(" ",""));
        meetingArrangement.setCallLeaderName(callLeaderName.replaceAll(" ",""));
        meetingArrangement.setCallUsersName(callUsersName.replaceAll(" ",""));
        meetingArrangement.setUseOrgName(useOrgName.replaceAll(" ",""));
        meetingArrangement.setMeetingRoomName(meetingRoomName.replaceAll(" ",""));


        Map<String, String> result= useMeetingRoomIsOk(sdfl.format(meetingArrangement.getStartTime()),sdfl.format(meetingArrangement.getEndTime()),
                meetingArrangement.getMeetingRoomName(),meetingArrangement.getCallLeaderName(),meetingArrangement.getCallUsersName(),
                rowId,meetingArrangement.getMeetingRoomName());
        if(!result.get("flag").equals("1")){
            statusCode = "300";
            resMap.put("statusCode", statusCode);
            resMap.put("message", result.get("message"));
            return resMap;
        }
        if(rowId.equals("0")){
            meetingArrangement.setRowId(null);
            Timestamp ts = DateUtil.getDate();
            meetingArrangement.setApplyDate(ts);
            useMeetroom(meetingArrangement.getStartTime(),meetingArrangement.getEndTime(),meetingArrangement.getMeetingRoomName(),"1");
            meetingArrangement.setCreateUserId(user.getUserId());
        }else {
            meetingArrangement.setRowId(rowId);
            MeetingArrangement dest = meetingArrangementManager.get(rowId);
            if (!dest.getMeetingRoomName().equals(meetingArrangement.getMeetingRoomName()) || !dest.getStartTime().equals(meetingArrangement.getStartTime())
                    || !dest.getEndTime().equals(meetingArrangement.getEndTime())) {
                //删除原来的占用（设为0）
                useMeetroom(dest.getStartTime(),dest.getEndTime(),dest.getMeetingRoomName(),"0");
                //添加新的占用（设为1）
                List<DicMeetroom> list=dicMeetroomManager.findBy("mtName",meetingArrangement.getMeetingRoomName());
                if(list!=null&&list.size()>0){
                    useMeetroom(meetingArrangement.getStartTime(),meetingArrangement.getEndTime(),meetingArrangement.getMeetingRoomName(),"1");
                }
            }
            beanMapper.copy(meetingArrangement, dest);
            meetingArrangement=dest;
            }
        Map<String, Integer> map=DateUtil.getWeekAndYear(sdf.format(meetingArrangement.getStartTime()));
        meetingArrangement.setYear(map.get("year").toString());
        meetingArrangement.setWeek(map.get("week").toString());
        meetingArrangement.setDayOfWeek(String.valueOf(DateUtil.dayForWeekByCh(sdf.format(meetingArrangement.getStartTime()))));
        meetingArrangement.setExt2("1");
        meetingArrangementManager.save(meetingArrangement);

        resMap.put("statusCode", statusCode);
        resMap.put("message", result.get("message"));
        return  resMap;
    }

//    /**
//     * 可编辑表格 全部修改保存
//     * @param recordListVo
//     * @param user
//     * @param rowId
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping("test-save")
//    @Transactional(rollbackFor = { Exception.class })
//    public @ResponseBody
//    Map<String, Object> testSave(JsscydVo recordListVo, @ModelAttribute("user_session") VUser user,String rowId) throws Exception{
//        Map<String, Object> resMap = new HashMap<String, Object>();
//        String statusCode = "200", message = "提交成功";
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//        SimpleDateFormat sdfl=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//        for(int i=0;i<recordListVo.getMeetingArrangement().size();i+=2){
//            MeetingArrangement meetingArrangement=recordListVo.getMeetingArrangement().get(i);
//
//            Map<String, String> result= useMeetingRoomIsOk(sdfl.format(meetingArrangement.getStartTime()),sdfl.format(meetingArrangement.getEndTime()),
//                    meetingArrangement.getMeetingRoomName(),meetingArrangement.getCallLeaderName(),meetingArrangement.getCallUsersName(),
//                    meetingArrangement.getRowId(),meetingArrangement.getMeetingRoomName());
//
//            if(!result.get("flag").equals("1")){
//                statusCode = "300";
//                resMap.put("statusCode", statusCode);
//                resMap.put("message", result.get("message"));
//                return resMap;
//            }
//
//            //更新操作
//            if (meetingArrangement.getRowId()!=null&&!meetingArrangement.getRowId().equals("")) {
//                MeetingArrangement dest = meetingArrangementManager.get(meetingArrangement.getRowId());
//                if (!dest.getMeetingRoomName().equals(meetingArrangement.getMeetingRoomName()) || !dest.getStartTime().equals(meetingArrangement.getStartTime())
//                        || !dest.getEndTime().equals(meetingArrangement.getEndTime())) {
//                    //删除原来的占用（设为0）
//                    useMeetroom(dest.getStartTime(),dest.getEndTime(),dest.getMeetingRoomName(),"0");
//                    //添加新的占用（设为1）
//                    List<DicMeetroom> list=dicMeetroomManager.findBy("mtName",meetingArrangement.getMeetingRoomName());
//                    if(list!=null&&list.size()>0){
//                        useMeetroom(meetingArrangement.getStartTime(),meetingArrangement.getEndTime(),meetingArrangement.getMeetingRoomName(),"1");
//                    }
//
//                }
//                beanMapper.copy(meetingArrangement, dest);
//            } else {
//                //保存操作
//                meetingArrangement.setRowId(null);
//                Timestamp ts = DateUtil.getDate();
//                meetingArrangement.setApplyDate(ts);
//                useMeetroom(meetingArrangement.getStartTime(),meetingArrangement.getEndTime(),meetingArrangement.getMeetingRoomName(),"1");
//                meetingArrangement.setCreateUserId(user.getUserId());
////            meetingArrangement.setCreateUserName(user.getUserName());
////            meetingArrangement.setCreateOrgId(user.getOrgId());
////            meetingArrangement.setCreateOrgName(user.getOrgName());
//            }
//
//            Map<String, Integer> map=DateUtil.getWeekAndYear(sdf.format(meetingArrangement.getStartTime()));
//            meetingArrangement.setYear(map.get("year").toString());
//            meetingArrangement.setWeek(map.get("week").toString());
//            meetingArrangement.setDayOfWeek(String.valueOf(DateUtil.dayForWeekByCh(sdf.format(meetingArrangement.getStartTime()))));
//            meetingArrangement.setExt2("1");
//            meetingArrangementManager.save(meetingArrangement);
//        }
//
//        return resMap;
//    }

}
