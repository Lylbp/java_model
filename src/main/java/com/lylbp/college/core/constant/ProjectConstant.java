package com.lylbp.college.core.constant;


public class ProjectConstant {

    // 项目基础包名称
    public static final String BASE_PACKAGE = "com.lylbp.college";
    // Controller所在包
    public static final String CONTROLLER_PACKAGE = BASE_PACKAGE + ".controller";

    /**
     * HTTP Request中token在header中的key值
     */
    public static final String AUTHENTICATION = "Authorization";

    /**
     * token过期时间，单位：秒
     */
    public static final int JWT_EXPIRE_TIME = 24 * 60 * 60;

    /**
     * redis过期时间
     */
    public static final int REDIS_EXPIRE_SECOND =  1 * 60 * 60;

    /**
     * redis前缀
     */
    public static final String REDIS_PREFIX= "dar_college_";

    /**
     * redis所有角色权限
     */
    public static final String REDIS_ALL_ROLE_PERMISSION =  "all_role_permission";

    /**
     * minio桶名
     */
    public static final String MINIO_RSOURCE_BUCKET_NAME = "lylbp-university";

    /**
     * minio视频与音频目录名称
     */
    public static final String MINIO_AUDIO_VIDEO_RESOURCE_PREFIX = "audioVideo/";

    /**
     * minio图片目录名称
     */
    public static final String MINIO_IMG_RESOURCE_PREFIX = "img/";

    /**
     * minio其他资源目录名称
     */
    public static final String MINIO_OTHER_RESOURCE_PREFIX = "other/";

    /**
     * miniohls资源名称
     */
    public static final String MINIO_HLS_RESOURCE_PREFIX = "hls/";

    /**
     * 资源下载api地址
     */
    public static final String GET_RESOURCE_API = "/public/upload/getResource?filePath=";
}
