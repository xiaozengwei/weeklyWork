package com.gx.core.util;

import net.sf.json.JSONArray;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by adminstrator on 2019/9/19.
 */
public class ZipUtils {
    /**
     * 批量打包
     *
     * @param jsonString json格式字符串数据
     * @param fileSaveRootPath 项目根目录
     * @return zip文件保存绝对路径
     */
    public String createZipAndReturnPath(String jsonString,String fileNameList, String fileSaveRootPath) {

        //生成jsonArray列表
        JSONArray jsonArray = JSONArray.fromObject(jsonString);
        JSONArray jsonFileNameList = JSONArray.fromObject(fileNameList);

        try {
            //生成打包下载后的zip文件:Papers.zip
            String papersZipName = "Files.zip";

            //zip文件保存路径
            String zipPath = fileSaveRootPath + papersZipName;

            ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipPath));

            //遍历jsonArray列表获取所有JSONObject对象
            for (int i = 0; i < jsonArray.size(); i++) {

               /* JSONObject jsonObject = jsonArray.getJSONObject(i);*/

                //获得文件相对路径
                String relativePath = String.valueOf(jsonArray.get(i));
               /* String relativePath = jsonObject.getString("file_Path");*/

                //获得文件名
                /*String fileName = relativePath.substring(relativePath.lastIndexOf("/")+1);*/
                String fileName = String.valueOf(jsonFileNameList.get(i));

                //获得下载文件完整路径
                String downloadPath = relativePath;

                //以论文标题为每个文件命名
                FileInputStream fis = new FileInputStream(downloadPath);
                out.putNextEntry(new ZipEntry(fileName));

                //写入压缩包
                int len;
                byte[] buffer = new byte[1024];
                while ((len = fis.read(buffer)) > 0) {
                    out.write(buffer, 0, len);
                }
                out.closeEntry();
                fis.close();
            }
            out.close();
            out.flush();
            return zipPath;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
