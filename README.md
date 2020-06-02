### 组织结构
``` lua
mall
├── controller -- 展示层
├── core -- 项目核心
    ├── annotation -- 自定义注解
        ├── ActionLog -- 操作日志注解
        ├── CheckPermission -- 操作权限注解
        ├── ExcelHead -- Excel表头注解
    ├── aspect -- AOP编程
        ├── ActionLogAspect -- 操作日志
        ├── LogAspect -- 控制台打印日志
    ├── configure -- 项目配置
        ├── CorsConfig -- 跨域配置
        ├── MinioConfig -- minio配置
        ├── MyBatisConfigurer -- myBatis配置
        ├── ProjectWebMvcConfigurer -- 项目核心配置
        ├── SwaggerConfigurer -- Swagger配置
    ├── constant -- 常量
        ├── ProjectConstant -- 项目常量
    ├── entity -- 自定义实体(非数据库模型)
        ├── ActionLog -- 操作日志对象
        ├── PageResResult -- 页面结果集
        ├── ResResult -- 结果集
        ├── Tuple     -- 元组
    ├── exception -- 自定义异常
        ├── ResResultException -- 结果集异常
        ├── ServiceException -- 服务异常
    ├── filter -- 自定义过滤器
        ├── ApiFilter -- Api过滤器
    ├── handle -- 自定义处理器
        ├── ExceptionHandle -- 自定义异常处理器
    ├── interceptor -- 自定义拦截器
        ├── ApiInterceptor -- Api拦截器
    ├── task -- 自定义定时任务
    ├── universal -- 自定义基类
    ├── utils -- 自定义工具类
├── DTO -- 数据传输对象
├── entity -- 数据库模型
├── enums -- 枚举
├── mapper -- 数据访问层
└── security -- spring security相关配置
└── sevice -- 业务逻辑层
└── VO -- 视图对象 用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。
```

### 项目初始化
``` lua
进入src/main/resources根据你项目所用的数据库类型选择application-mysql.yml／application-oracle.yml
下面以mysql为例
    进入 src/main/resources/application.yml修改active为mysql
    cp application-mysql.yml.ref application-mysql.yml
注意application-mysql.yml不会提交到git中,请将文件中的配置项修改成自己的参数
```

### 后端RBAC接口权限管理几点注意
``` lua
1.现在所有接口都需要配置访问权限 若希望特定的接口不被拦截，则需要在application-mysql.yml中配置security-allow-api
    注意:不配置代表这里所有的接口都会被拦截, 现在存在情况如下王伟的接口通通不需要拦截，那么一定要完成下面的2，3，4，5,6点。然后在security-allow-api
    中配置所有/user/**不过滤（示例:security-allow-api: /public/**, /bg/auth/login, /user/**）
2.com.dar.college.controller目录介绍下如下
    ├── controller -- 展示层
        ├── bg(放置后端管理平台api 也就是徐菲他们的接口)
        ├── user(放置app的api 也就是王伟的接口)
        ├── pub(放置项目公共接口,如文件上传接口)
3. bg目录下所有的接口访问前缀以/bg/开头
4. user目录下所有的接口访问前缀以/user/开头
5. pub目录下所有的接口访问前缀以/public/开头
6. com.dar.college.controller.bg中所有的需要访问权限的接口需要加CheckPermission注解
```