package com.dar.road.core.utils;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.IORuntimeException;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Arrays;

/**
 * @Author weiwenbin
 * @Date 2020-03-31 09:53
 */
public class FileUtil {
    /**
     * 远程获取文件大小
     * @param downloadUrl
     * @return
     * @throws IOException
     */
    public static long getFileLengthByUrl(String downloadUrl) throws IOException {
        if (downloadUrl == null || "".equals(downloadUrl)) {
            return 0L;
        }
        URL url = new URL(downloadUrl);
        URLConnection conn = null;
        try {
            conn = url.openConnection();
            return conn.getContentLengthLong();
        } catch (IOException e) {
            return 0L;
        }
    }

    /**
     * 以流形式打印文件
     * @param inputStream
     * @param contentType
     * @param fileName
     * @param fileSize
     * @param response
     */
    public static void outByStream(InputStream inputStream, String contentType, String fileName, long fileSize,
                                   HttpServletResponse response) {
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType(contentType);
            //非图片下载
            if (!contentType.contains("image")) {
                response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            }

            //如果是视频或音频
            if (contentType.contains("video") || contentType.contains("audio")) {
                response.setContentType("application/octet-stream");
                response.setHeader("Pragma", "public");
                response.setHeader("Expires", "0");
                response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
                response.setHeader("Cache-Control", "public");
                response.setHeader("Content-Transfer-Encoding", "binary");
                response.addHeader("Accept-Ranges", "bytes");
                response.addHeader("Content-Length", fileSize + "");
                response.addHeader("Content-Range", "bytes " + 0 + "-" + fileSize + "/" + fileSize);
            }

            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(response.getOutputStream());
            IoUtil.copy(bufferedInputStream, bufferedOutputStream);
            response.flushBuffer();
        } catch (IORuntimeException | IOException e) {
        }
    }

    /**
     * 生成存储目录
     * @param prefix
     * @param suffix
     * @return
     */
    public static String generateSavePath(String prefix, String suffix) {
        String formatDateStr = DateUtil.format(DateUtil.date(), "yyyyMMdd");//格式日期
        String saveFileName = IdUtil.simpleUUID() + "." + suffix;//文件存储名称(带后缀)
        return prefix + formatDateStr + "/" + saveFileName;//文件存储目录
    }


    /**
     * 检查图片文件格式
     *
     * @param contentType
     * @return
     */
    public static Boolean checkAllowType(String contentType, String[] allowContentTypeArr) {
        if (ObjectUtil.isEmpty(contentType)) {
            return false;
        }
        return Arrays.asList(allowContentTypeArr).contains(contentType);
    }

    /**
     * 检查后缀
     *
     * @param suffix
     * @return
     */
    public static Boolean checkSuffix(String suffix) {
        if (ObjectUtil.isEmpty(suffix)) {
            return false;
        }
        suffix = "." + suffix;
        String[] allowSuffixArr = {".php", ".java", ".class",".js",".css"};

        return Arrays.asList(allowSuffixArr).contains(suffix);
    }
}
