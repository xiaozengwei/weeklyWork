package com.gx.soft.common.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtil {
	public static final long SENCODS_IN_FIVE_DAYS = 1000 * 24 * 60 * 60 * 5;// 5天换算成毫秒数


	public static String getCurrentDate() {
		String result;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			result = formatter.format(new Date());
		} catch (Exception ex) {
			result = ex.getMessage();
		}
		if (result.equalsIgnoreCase("1900-01-01")) {
			result = "";
		}
		return result;
	}


	/**
	 * 功能或作用：格式化日期时间
	 * 
	 * @param DateValue
	 *            输入日期或时间
	 * @param DateType
	 *            格式化 EEEE是星期, yyyy是年, MM是月, dd是日, HH是小时, mm是分钟, ss是秒
	 * @return 输出字符串
	 */
	public static String formatDate(String DateValue, String DateType) {
		String result;
		SimpleDateFormat formatter = new SimpleDateFormat(DateType);
		try {
			Date mDateTime = formatter.parse(DateValue);
			result = formatter.format(mDateTime);
		} catch (Exception ex) {
			result = ex.getMessage();
		}
		if (result.equalsIgnoreCase("1900-01-01")) {
			result = "";
		}
		return result;
	}

	public static String getDateTime() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String mDateTime = formatter.format(cal.getTime());
		return (mDateTime);
	}

	public static String formatDateTime(Date d) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String mDateTime = formatter.format(d);

		return (mDateTime);
	}

	public static Timestamp getDate() {
		Calendar cal = Calendar.getInstance();
		long timeMillis = cal.getTimeInMillis();
		return new Timestamp(timeMillis);
	}

	public static String formatSecond(Date d) {
		SimpleDateFormat f2 = new SimpleDateFormat("ss");
		return f2.format(d);
	}

	public static String formatDate(Date d) {
		SimpleDateFormat f2 = new SimpleDateFormat("yyyyMMddHHmm");
		return f2.format(d);
	}

	public static boolean isInSomeDays(Date date) {
		Date dateNow = new Date();
		// 获得两个时间的毫秒时间差异
		long diff = dateNow.getTime() - date.getTime();
		if (diff < 0) {
			diff = -diff;
		}
		return SENCODS_IN_FIVE_DAYS > diff;// 5天内true

	}

	/**
	 * 获得指定日期的前一天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDayBefore(String specifiedDay) {// 可以用new
																		// Date().toLocalString()传递参数
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day - 1);

		String dayBefore = new SimpleDateFormat("yyyy-MM-dd").format(c
				.getTime());
		return dayBefore;
	}

	/**
	 * 获得指定日期的后一天
	 * 
	 * @param specifiedDay
	 * @return
	 */
	public static String getSpecifiedDayAfter(String specifiedDay) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + 1);

		String dayAfter = new SimpleDateFormat("yyyy-MM-dd")
				.format(c.getTime());
		return dayAfter;
	}


	/**
	 * get start date of given week no of a year
	 * @param year
	 * @param weekNo
	 * @return
	 */
	public String getStartDayOfWeekNo(int year,int weekNo){
		Calendar cal = getCalendarFormYear(year);
		cal.set(Calendar.WEEK_OF_YEAR, weekNo);
		return cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" +
				cal.get(Calendar.DAY_OF_MONTH);
	}
	/**
	 * get the end day of given week no of a year.
	 * @param year
	 * @param weekNo
	 * @return
	 */
	public String getEndDayOfWeekNo(int year,int weekNo){
		Calendar cal = getCalendarFormYear(year);
		cal.set(Calendar.WEEK_OF_YEAR, weekNo);
		cal.add(Calendar.DAY_OF_WEEK, 6);
		return cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" +
				cal.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * get Calendar of given year
	 * @param year
	 * @return
	 */
	private Calendar getCalendarFormYear(int year){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		cal.set(Calendar.YEAR, year);
		return cal;
	}

	/**
	 * 判断当前日期是星期几
	 *
	 * @param pTime 修要判断的时间
	 * @return dayForWeek 判断结果
	 * @Exception 发生异常
	 */
	public static int dayForWeek(String pTime) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(format.parse(pTime));
		int dayForWeek = 0;
		if(c.get(Calendar.DAY_OF_WEEK) == 1){
			dayForWeek = 7;
		}else{
			dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1;
		}
		return dayForWeek;
	}
	/**
	 * 判断当前时间是上午还是下午
	 * */
	public static String timeForAMPM(String pTime) throws Exception{
		String startType= "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date st =sdf.parse(pTime);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(st);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		System.out.println("小时："+hour);
		if (hour>=0&&hour<=12){
			startType="上午";
		}else{
			startType="下午";
		}

		return startType;
	}


	/**
	 * 判断一年中第几周
	 * 判断哪一年
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Map<String, Integer> getWeekAndYear(String date) throws ParseException {
		Map<String, Integer> result = new HashMap<>();
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		int week = cal.get(Calendar.WEEK_OF_YEAR);
		int year =cal.get(Calendar.YEAR);
//		if (week == 1 && cal.get(Calendar.MONTH) == 11) {
//			cal.add(Calendar.DATE, -6);
//			week = cal.get(Calendar.WEEK_OF_YEAR) + 1;
//		}
		cal.add(Calendar.DATE,20);
		if(year!=cal.get(Calendar.WEEK_OF_YEAR)&&week==1){
			year=cal.get(Calendar.YEAR);
		}
		result.put("year", year);
		result.put("week", week);
		return result;
	}

	/**
	 * 判断当前日期是星期几中文
	 *
	 * @param pTime 修要判断的时间
	 * @return dayForWeek 判断结果
	 * @Exception 发生异常
	 */
	public static String dayForWeekByCh(String pTime) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(format.parse(pTime));
		String dayForWeek = "";
		if(c.get(Calendar.DAY_OF_WEEK) == 1){
			dayForWeek ="星期天";
		}else{
			int day = c.get(Calendar.DAY_OF_WEEK) - 1;
			if(day==1){
				dayForWeek ="星期一";
			}else if(day==2){
				dayForWeek ="星期二";
			}else if(day==3){
				dayForWeek ="星期三";
			}else if(day==4){
				dayForWeek ="星期四";
			}else if(day==5){
				dayForWeek ="星期五";
			}else if(day==6){
				dayForWeek ="星期六";
			}
		}
		return dayForWeek;
	}

	/**
	 * 获取区间段实际所属 上午下午 全天 ，至结束时间
	 * @param startTime	开始时间
	 * @param endTime 结束时间
	 * @param mark	时间与所属(上下午) 中间添加字符
	 * @return
	 * @throws Exception
	 */
	public static String getTimeArea(String startTime,String endTime,String mark)throws Exception{
		String ext3="";
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startTime);
		Date enddate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endTime);
		String startString = new SimpleDateFormat("HH:mm").format(date); //开始时间（时、分）
		String hour = new SimpleDateFormat("HH").format(date); //09:00
		String startDay = new SimpleDateFormat("yyyyMMdd").format(date); //开始日期（年月日）
		String endDay = new SimpleDateFormat("yyyyMMdd").format(enddate); //结束日期（年月日）
		String endDay1 = new SimpleDateFormat("dd").format(enddate); //结束日期（天）
		String endhour = new SimpleDateFormat("HH").format(date); //结束时间（时）
		String endMinus = new SimpleDateFormat("HH").format(date); //结束时间（分）
		int hh = Integer.parseInt(hour);
		if(hh<12){
			startString=String.valueOf(hh)+startString.substring(startString.indexOf(":"));
			ext3= "上午"+startString+mark;
			//判断是否在同一天
			if(!startDay.equals(endDay)){
				ext3 += "(至"+endDay1+"日)";
			}else{
				int endH = Integer.parseInt(endhour);
				int endM = Integer.parseInt(endMinus);
				if(endH>17){
					ext3 += "（全天）";
				}else if(endH==17&&endM>=30){
					ext3 += "（全天）";
				}
			}
		}else{
			startString=String.valueOf(hh-12)+startString.substring(startString.indexOf(":"));
			ext3 = "下午"+startString+mark;
			if(!startDay.equals(endDay)){
				ext3 += "(至"+endDay1+"日)";
			}
		}
		return ext3;
	}

	public static void main(String[] args) throws Exception{
//
//		String startTime="2019-12-27";
//		String startType="上午";
//		String endTime="2019-12-28";
//		String endType="上午";
//		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
//		Calendar start=Calendar.getInstance();
//		start.setTime(simpleDateFormat.parse(startTime));
//		Calendar end=Calendar.getInstance();
//		end.setTime(simpleDateFormat.parse(endTime));
//		while(start.before(end)){
//			System.out.print(simpleDateFormat.format(start.getTime())+"----");
//			System.out.println(getWeekAndYear(simpleDateFormat.format(start.getTime())));
//			start.add(Calendar.DATE,1);
//		}

	}



}
