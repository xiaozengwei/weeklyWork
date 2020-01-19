package com.gx.soft.common.util;

import com.gx.core.util.StringUtils;
import net.coobird.thumbnailator.Thumbnails;

import java.io.File;
import java.io.IOException;

/**
 * Created by adminstrator on 2019/8/21.
 */
public class PicUtil {
    public static String commpressPicForScaleSize(String srcPath, String desPath,
                                                  long desFileSize, double accuracy) {
        if (StringUtils.isEmpty(srcPath) || StringUtils.isEmpty(srcPath)) {
            return null;
        }
        if (!new File(srcPath).exists()) {
            return null;
        }
        try {
            File srcFile = new File(srcPath);
            long srcFileSize = srcFile.length();
            System.out.println("源图片：" + srcPath + "，大小：" + srcFileSize / 1024
                    + "kb");

            // 1、先转换成jpg
            Thumbnails.of(srcPath).scale(1f).toFile(desPath);
            //按照比例进行缩放
            imgScaleSize(desPath, desFileSize, accuracy);

            File desFile = new File(desPath);
            System.out.println("目标图片：" + desPath + "，大小" + desFile.length()
                    / 1024 + "kb");
            System.out.println("图片压缩完成！");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return desPath;
    }
    /**
     * 图片尺寸不变，压缩文件大小
     */
    private static void imgScaleSize(String desPath, long desFileSize,
                                     double accuracy) throws IOException{
        File fileName=new File(desPath);
        long fileNameSize=fileName.length();
        //判断大小，如果小于指定大小，不压缩；如果大于等于指定大小，压缩
        if(fileNameSize<=desFileSize*1024){
            return;
        }
        //图片尺寸不变，压缩图片文件大小
        //图片尺寸不变，压缩图片文件大小outputQuality实现,参数1为最高质量
        Thumbnails.of(desPath).scale(1f).outputQuality(accuracy).toFile(desPath);
        System.out.println("图片尺寸不变，压缩文件大小");
        imgScaleSize(desPath, desFileSize, accuracy);
    }
//    public  static void main(String [] args ){
//        PicUtil.commpressPicForScaleSize("D:\\小程序\\公民科学家小程序图片\\公民科学家图片方型2018.13\\公民科学家鸟\\4.普通翠鸟.jpg",
//                "D:\\img\\a.jpg", 1000,0.25);
//
//    }
}
