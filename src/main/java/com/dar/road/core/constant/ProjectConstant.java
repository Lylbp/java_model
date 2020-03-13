package com.dar.road.core.constant;


public class ProjectConstant {

    // 项目基础包名称
    public static final String BASE_PACKAGE = "com.dar.road";

    // Model所在包
    public static final String MODEL_PACKAGE = BASE_PACKAGE + ".entity";

    // Mapper所在包
    public static final String MAPPER_PACKAGE = BASE_PACKAGE + ".mapper";

    // Service所在包
    public static final String SERVICE_PACKAGE = BASE_PACKAGE + ".service";

    // ServiceImpl所在包
    public static final String SERVICE_IMPL_PACKAGE = SERVICE_PACKAGE + ".impl";

    // Controller所在包
    public static final String CONTROLLER_PACKAGE = BASE_PACKAGE + ".controller";

    // Mapper插件基础接口的完全限定名
    public static final String MAPPER_INTERFACE_REFERENCE = BASE_PACKAGE + ".core.universal.Mapper";

    /**
     * HTTP Request中token在header中的key值
     */
    public static final String AUTHENTICATION = "Authorization";

    /**
     * token过期时间，单位：秒
     */
    public static final int TOKEN_EXPIRE_TIME = 24 * 60 * 60;
}
