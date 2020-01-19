package com.gx.core.export;

import com.gx.soft.common.util.DateUtil;
import com.gx.soft.weeklywork.persistence.domain.CalendarIndex;
import com.gx.soft.weeklywork.persistence.domain.MeetingArrangement;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * 导出帮助类：使用此类需要配合@ExportBean注解
 */
public class ExcelExportUtil {
    private ExcelDataStrategy excelDataStrategy;

    public ExcelExportUtil() {

    }

    public ExcelExportUtil(ExcelDataStrategy excelDataStrategy) {
        this.excelDataStrategy = excelDataStrategy;
    }


    /**
     * 导出方法
     *
     * @param response
     * @param fileName 导出的文件名
     * @param beanList 导出的数据
     * @param metaMap  元信息 clazz类对象,columnNames字段名String[],columnWidth列宽Integer[],columnComment列名String[]
     */
    public void exportBean(HttpServletResponse response, String fileName, List beanList, Map<String, Object> metaMap) throws Exception {
        try {

            Map<String, Object> objectMap = excelDataStrategy.getExcelDataMap(beanList, metaMap);

            String[] columnComments = (String[]) objectMap.get("columnComment");
            //列宽
            Integer[] excelHeaderWidth = (Integer[]) objectMap.get("columnWidth");
            //数据列
            Map<Integer, List<String>> dataMap = (Map<Integer, List<String>>) objectMap.get("data");
//            XSSFWorkbook xssfWorkbook = new XSSFWorkbook();

            // keep 100 rows in memory, exceeding rows will be flushed to disk
            SXSSFWorkbook wb = new SXSSFWorkbook(100);
            Sheet sheet = wb.createSheet();
            sheet.setDefaultRowHeight((short) 300);

            // 设置列宽度
            if (excelHeaderWidth != null && excelHeaderWidth.length > 0) {

                for (int i = 0; i < excelHeaderWidth.length; i++) {
                    sheet.setColumnWidth(i, 32 * excelHeaderWidth[i]);
                }
            } else {//默认宽度
                for (int i = 0; i < columnComments.length; i++) {
                    sheet.setColumnWidth(i, 32 * 250);
                }
            }
            // 标题
            Cell cell;
            //列名
            String[] cells = columnComments;
            Row titleRow = sheet.createRow(0);
            for (int i = 0; i <= cells.length - 1; i++) {
                cell = titleRow.createCell((short) i);
                cell.setCellValue(cells[i]);
            }

            CellStyle cellStyle = wb.createCellStyle();
            wb.createCellStyle();
            DataFormat format = wb.createDataFormat();
            cellStyle.setDataFormat(format.getFormat("@"));
            Set<Map.Entry<Integer, List<String>>> entrySet = dataMap.entrySet();
            int size = entrySet.size();

            for (int i = 1; i <= size; i++) {
                Row dataRow = sheet.createRow(i);
                List<String> dList = dataMap.get(i);
                for (int j = 0; j < dList.size(); j++) {
                    cell = dataRow.createCell(j);
                    cell.setCellStyle(cellStyle);
                    cell.setCellValue(dList.get(j));
                }
            }
            response.setContentType("application/vnd.ms-excel");
            String name = fileName + System.currentTimeMillis() + ".xlsx";
            String filename = "\"" + new String(name.getBytes(), "iso-8859-1") + "\"";
            response.addHeader("Content-Disposition", "attachment; filename=" + filename);
            wb.write(response.getOutputStream());
//            wb.dispose();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }
    }


    /**
     * 导出方法
     *
     * @param response
     * @param fileName 导出的文件名
     * @param beanList 导出的数据
     * @param metaMap  元信息 clazz类对象,columnNames字段名String[],columnWidth列宽Integer[],columnComment列名String[]
     */
    public void exportBean1(HttpServletResponse response, String fileName, List beanList, Map<String, Object> metaMap) throws Exception {
        try {

            Map<String, Object> objectMap = excelDataStrategy.getExcelDataMap(beanList, metaMap);

            String[] columnComments = (String[]) objectMap.get("columnComment");
            //列宽
            Integer[] excelHeaderWidth = (Integer[]) objectMap.get("columnWidth");
            //数据列
            Map<Integer, List<String>> dataMap = (Map<Integer, List<String>>) objectMap.get("data");
//            XSSFWorkbook xssfWorkbook = new XSSFWorkbook();

            // keep 100 rows in memory, exceeding rows will be flushed to disk
            SXSSFWorkbook wb = new SXSSFWorkbook(100);

            Sheet sheet = wb.createSheet();
            sheet.setDefaultRowHeight((short) 300);

            // 设置列宽度
            if (excelHeaderWidth != null && excelHeaderWidth.length > 0) {

                for (int i = 0; i < excelHeaderWidth.length; i++) {
                    sheet.setColumnWidth(i, 32 * excelHeaderWidth[i]);
                }
            } else {//默认宽度
                for (int i = 0; i < columnComments.length; i++) {
                    sheet.setColumnWidth(i, 32 * 250);
                }
            }
            // 标题
            Cell cell;
            //列名
            String[] cells = columnComments;
            Row titleRow = sheet.createRow(0);
            CellStyle cellStyle1 = wb.createCellStyle();
            cellStyle1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            for (int i = 0; i <= cells.length - 1; i++) {
                cell = titleRow.createCell((short) i);
                cell.setCellStyle(cellStyle1);
                cell.setCellValue(cells[i]);
            }

            CellStyle cellStyle = wb.createCellStyle();
            wb.createCellStyle();
            DataFormat format = wb.createDataFormat();
            cellStyle.setDataFormat(format.getFormat("@"));
            cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            Set<Map.Entry<Integer, List<String>>> entrySet = dataMap.entrySet();
            int size = entrySet.size();

            for (int i = 1; i <= size; i++) {
                Row dataRow = sheet.createRow(i);
                List<String> dList = dataMap.get(i);
                for (int j = 0; j < dList.size(); j++) {
                    cell = dataRow.createCell(j);
                    cell.setCellStyle(cellStyle);
                    cell.setCellValue(dList.get(j));
                    if(dList.get(j)!=null&&!dList.get(j).equals("")&&(j==3||j==2)){
                        cell.setCellValue(dList.get(j).substring(11,19));
                    }
                }
            }
            response.setContentType("application/vnd.ms-excel");
            String name = fileName + System.currentTimeMillis() + ".xlsx";
            String filename = "\"" + new String(name.getBytes(), "iso-8859-1") + "\"";
            response.addHeader("Content-Disposition", "attachment; filename=" + filename);
            wb.write(response.getOutputStream());
//            wb.dispose();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }
    }

    /**
     * 导出方法
     *
     * @param response
     * @param fileName 导出的文件名
     * @param beanList 导出的数据
     * @param
     */
    public void exportBeanMerge(HttpServletResponse response, String fileName, List<List<MeetingArrangement>> beanList, String[] columnComments, Integer[] excelHeaderWidth, CalendarIndex calendarIndex) throws Exception {
        try {

//            Map<String, Object> objectMap = excelDataStrategy.getExcelDataMap(beanList, metaMap);

//            String[] columnComments = (String[]) objectMap.get("columnComment");
            //列宽
//            Integer[] excelHeaderWidth = (Integer[]) objectMap.get("columnWidth");
            //数据列
//            Map<Integer, List<String>> dataMap = (Map<Integer, List<String>>) objectMap.get("data");
//            XSSFWorkbook xssfWorkbook = new XSSFWorkbook();

            // keep 100 rows in memory, exceeding rows will be flushed to disk
            SXSSFWorkbook wb = new SXSSFWorkbook(100);
            Sheet sheet = wb.createSheet();
            sheet.setDefaultRowHeight((short) 300);

            // 设置列宽度
            if (excelHeaderWidth != null && excelHeaderWidth.length > 0) {

                for (int i = 0; i < excelHeaderWidth.length; i++) {
                    sheet.setColumnWidth(i, 32 * excelHeaderWidth[i]);
                }
            } else {//默认宽度
                for (int i = 0; i < columnComments.length; i++) {
                    sheet.setColumnWidth(i, 32 * 250);
                }
            }
            // 第一行标题样式
            Font font = wb.createFont();
            font.setFontName("迷你简小标宋");
            font.setFontHeightInPoints((short) 20);//设置字体大小
            CellStyle cellStyle_title = wb.createCellStyle();
            cellStyle_title.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
            cellStyle_title.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
            cellStyle_title.setFont(font);
            //第二行样式
            Font font_2 = wb.createFont();
            font_2.setFontName("楷体");
            font_2.setFontHeightInPoints((short) 13);//设置字体大小
            font_2.setBoldweight(Font.BOLDWEIGHT_BOLD);
            CellStyle cellStyle_2 = wb.createCellStyle();
            cellStyle_2.setAlignment(HSSFCellStyle.ALIGN_LEFT); // 左对齐
            cellStyle_2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
            cellStyle_2.setFont(font_2);

            CellStyle cellStyle_2_1 = wb.createCellStyle();
            cellStyle_2_1.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 右对齐
            cellStyle_2_1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            cellStyle_2_1.setFont(font_2);
            //第三行样式
            Font font_3 = wb.createFont();
            font_3.setFontName("黑体");
            font_3.setFontHeightInPoints((short) 14);//设置字体大小
            CellStyle cellStyle_3 = wb.createCellStyle();
            cellStyle_3.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
            cellStyle_3.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
            cellStyle_3.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
            cellStyle_3.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
            cellStyle_3.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
            cellStyle_3.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
            cellStyle_3.setFont(font_3);

            Cell cell;
            CellRangeAddress c1 = new CellRangeAddress(0, 0, 0, 6);
            sheet.addMergedRegion(c1);
            CellRangeAddress c2 = new CellRangeAddress(1, 1, 0, 1);
            sheet.addMergedRegion(c2);
            CellRangeAddress c2_last = new CellRangeAddress(1, 1, 5, 6);
            sheet.addMergedRegion(c2_last);

            int index=3;
            for(List<MeetingArrangement> list:beanList){
                int cur_index=index;
                if(list.size()>0){
                    CellRangeAddress cellRangeAddress = new CellRangeAddress(index, index+list.size()-1, 0, 0);
                    sheet.addMergedRegion(cellRangeAddress);
                    index+=list.size();

                }

                for(MeetingArrangement meetingArrangement:list){
                    Row dataRow = sheet.createRow(cur_index);
                    Font fontArray = wb.createFont();
                    fontArray.setFontName("楷体");
                    fontArray.setFontHeightInPoints((short) 13);//设置字体大小
                    CellStyle cellStyle_array = wb.createCellStyle();
                    cellStyle_array.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平居中
                    cellStyle_array.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
                    cellStyle_array.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
                    cellStyle_array.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
                    cellStyle_array.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
                    cellStyle_array.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
                    cellStyle_array.setFont(fontArray);
                    cellStyle_array.setWrapText(true);
                    dataRow.setHeight((short)700);

                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(meetingArrangement.getStartTime());
                    cell = dataRow.createCell(0);
                    cell.setCellStyle(cellStyle_array);
                    cell.setCellValue(new HSSFRichTextString(calendar.get(Calendar.MONTH)+1+"月"+calendar.get(Calendar.DATE)+"日")+"\n"+meetingArrangement.getDayOfWeek());

                    cell = dataRow.createCell(1);
                    cell.setCellStyle(cellStyle_array);
                    cell.setCellValue(DateUtil.getTimeArea(meetingArrangement.getStartTime().toString(),meetingArrangement.getEndTime().toString(),"\r"));
                    cell = dataRow.createCell(2);
                    cell.setCellStyle(cellStyle_array);
                    cell.setCellValue(meetingArrangement.getTitle());
                    cell = dataRow.createCell(3);
                    cell.setCellStyle(cellStyle_array);
                    cell.setCellValue(meetingArrangement.getMeetingRoomName());
                    cell = dataRow.createCell(4);
                    cell.setCellStyle(cellStyle_array);
                    cell.setCellValue(meetingArrangement.getCallLeaderName());
                    cell = dataRow.createCell(5);
                    cell.setCellStyle(cellStyle_array);
                    cell.setCellValue(meetingArrangement.getCallUsersName());
                    cell = dataRow.createCell(6);
                    cell.setCellStyle(cellStyle_array);
                    cell.setCellValue(meetingArrangement.getUseOrgName());
                    cur_index+=1;
                }
            }

            //第一行
            Row titleRow = sheet.createRow(0);
            titleRow.setHeight((short) 500);
            cell=titleRow.createCell(0);
            cell.setCellValue("建设公司一周主要会议安排");
            cell.setCellStyle(cellStyle_title);

            //第二行
            Row titleRow_2 = sheet.createRow(1);
            cell=titleRow_2.createCell(0);
            cell.setCellValue(calendarIndex.getaYear()+"年 第"+calendarIndex.getaWeek()+"周");
            cell.setCellStyle(cellStyle_2);

            cell=titleRow_2.createCell(5);
            cell.setCellValue(calendarIndex.getWeekStartDate()+"至"+calendarIndex.getWeekEndDate());
            cell.setCellStyle(cellStyle_2_1);

            //第三行 列名
            String[] cells = columnComments;
            Row titleRow_3 = sheet.createRow(2);
            titleRow_3.setHeight((short) 500);
            for (int i = 0; i <= cells.length - 1; i++) {
                cell = titleRow_3.createCell((short) i);
                cell.setCellValue(cells[i]);
                cell.setCellStyle(cellStyle_3);
            }


//
//            CellStyle cellStyle = wb.createCellStyle();
//            wb.createCellStyle();
//            DataFormat format = wb.createDataFormat();
//            cellStyle.setDataFormat(format.getFormat("@"));
//            Set<Map.Entry<Integer, List<String>>> entrySet = dataMap.entrySet();
//            int size = entrySet.size();

//            for (int i = 2; i <= size+1; i++) {
//                Row dataRow = sheet.createRow(i);
//                List<String> dList = dataMap.get(i);
//                for (int j = 0; j < dList.size(); j++) {
//                    cell = dataRow.createCell(j);
//                    cell.setCellStyle(cellStyle);
//                    cell.setCellValue(dList.get(j));
//                }
//            }
            response.setContentType("application/vnd.ms-excel");
            String name = fileName + calendarIndex.getWeekStartDate()+"-"+calendarIndex.getWeekEndDate() + ".xlsx";
            String filename = "\"" + new String(name.getBytes(), "iso-8859-1") + "\"";
            response.addHeader("Content-Disposition", "attachment; filename=" + filename);
            wb.write(response.getOutputStream());

//            wb.dispose();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }
    }
}
