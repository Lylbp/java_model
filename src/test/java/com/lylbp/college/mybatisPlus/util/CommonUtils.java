package com.lylbp.college.mybatisPlus.util;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.lylbp.college.mybatisPlus.Config;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Erwin Feng
 * @since 2019-04-17 12:04
 */
public class CommonUtils {

    /**
     * 数据连接信息
     *
     * @param dbType   数据库类型
     * @param dbUrl    连接地址
     * @param username 用户名
     * @param password 密码
     * @param driver   驱动
     * @return DataSourceConfig
     */
    private static DataSourceConfig dataSourceConfig(DbType dbType, String dbUrl, String username, String password, String driver) {
        return new DataSourceConfig()
                .setDbType(dbType)
                .setUrl(dbUrl)
                .setUsername(username)
                .setPassword(password)
                .setDriverName(driver)
                ;
    }

    // 配置
    private static GlobalConfig globalConfig(String author, String outputDir) {
        return new GlobalConfig()
                .setAuthor(author)
                .setOutputDir(outputDir)
                .setFileOverride(true) // 是否覆盖已有文件
                .setOpen(false) // 是否打开输出目录
                .setDateType(DateType.TIME_PACK) // 时间采用java 8，（操作工具类：JavaLib => DateTimeUtils）
                .setActiveRecord(true)// 不需要ActiveRecord特性的请改为false
                .setEnableCache(false)// XML 二级缓存
                .setBaseResultMap(true)// XML ResultMap
                .setBaseColumnList(true)// XML columList
                .setKotlin(false) //是否生成 kotlin 代码
                // 自定义文件命名，注意 %s 会自动填充表实体属性！
                .setEntityName(Config.FILE_NAME_MODEL)
                .setMapperName(Config.FILE_NAME_DAO)
                .setXmlName(Config.FILE_NAME_XML)
                .setServiceName(Config.FILE_NAME_SERVICE)
                .setServiceImplName(Config.FILE_NAME_SERVICE_IMPL)
                .setControllerName(Config.FILE_NAME_CONTROLLER)
                .setIdType(IdType.ASSIGN_UUID) // 主键类型
                .setSwagger2(Config.SWAGGER_SUPPORT) // model swagger2
                ;
    }


    private static StrategyConfig strategyConfig(String[] tablePrefixes, String[] tableNames, String[] fieldPrefixes) {
        return new StrategyConfig()
                .setCapitalMode(true) // 全局大写命名 ORACLE 注意
                .setSkipView(false) // 是否跳过视图
                //.setDbColumnUnderline(true)
                .setTablePrefix(tablePrefixes)// 此处可以修改为您的表前缀(数组)
                .setFieldPrefix(fieldPrefixes) // 字段前缀
                .setNaming(NamingStrategy.underline_to_camel) // 表名生成策略
                .setInclude(tableNames)//修改替换成你需要的表名，多个表名传数组
                //.setExclude(new String[]{"test"}) // 排除生成的表
                .setEntityLombokModel(true) // lombok实体
                .setChainModel(false) // 【实体】是否为构建者模型（默认 false）
                .setEntityColumnConstant(false) // 【实体】是否生成字段常量（默认 false）// 可通过常量名获取数据库字段名 // 3.x支持lambda表达式
                .setLogicDeleteFieldName(Config.FIELD_LOGIC_DELETE_NAME) // 逻辑删除属性名称
                .setRestControllerStyle(true) //是否为RestController
                .setEntityTableFieldAnnotationEnable(true)
//                .setSuperControllerClass("com.baomidou.ant.common.BaseController")// 公共父类
                ;
    }

    // 包信息配置
    private static PackageConfig packageConfig(String packageName) {
        String projectPath = System.getProperty("user.dir");
        return new PackageConfig()
                .setParent(packageName)
                .setController(Config.PACKAGE_NAME_CONTROLLER)
                .setEntity(Config.PACKAGE_NAME_MODEL)
                .setMapper(Config.PACKAGE_NAME_DAO)
                .setXml(projectPath + Config.RESOURCES_PATH + Config.PACKAGE_NAME_XML)
                .setService(Config.PACKAGE_NAME_SERVICE)
                .setServiceImpl(Config.PACKAGE_NAME_SERVICE_IMPL)
                ;
    }

    /**
     *
     * @param packageConfig
     * @return
     */
    private static InjectionConfig injectionConfig(final PackageConfig packageConfig) {
        InjectionConfig injectionConfig = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };

        // 自定义输出配置
        List<FileOutConfig> fileOutConfigList = new ArrayList<FileOutConfig>();
        fileOutConfigList.add(new FileOutConfig("/templates/mapper.xml.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                String projectPath = System.getProperty("user.dir");
                if (StringUtils.isEmpty(packageConfig.getModuleName())) {
                    return projectPath + Config.RESOURCES_PATH + Config.PACKAGE_NAME_XML + "/" + tableInfo.getXmlName() + StringPool.DOT_XML;
                } else {
                    return projectPath + Config.RESOURCES_PATH + Config.PACKAGE_NAME_XML + "/" + packageConfig.getModuleName() + "/" + tableInfo.getXmlName() + StringPool.DOT_XML;
                }
            }
        });
        injectionConfig.setFileOutConfigList(fileOutConfigList);

        return injectionConfig;
    }


    public static void execute(String author, String outputDir, DbType dbType, String dbUrl, String username, String password, String driver,
                               String[] tablePrefixes, String[] tableNames, String packageName, String[] fieldPrefixes) {
        GlobalConfig globalConfig = globalConfig(author, outputDir);
        DataSourceConfig dataSourceConfig = dataSourceConfig(dbType, dbUrl, username, password, driver);

        // 策略配置
        StrategyConfig strategyConfig = strategyConfig(tablePrefixes, tableNames, fieldPrefixes);
        //包信息配置
        PackageConfig packageConfig = packageConfig(packageName);
        // 自定义配置
        InjectionConfig injectionConfig = injectionConfig(packageConfig);
        new AutoGenerator()
                .setGlobalConfig(globalConfig)
                .setDataSource(dataSourceConfig)
                .setStrategy(strategyConfig)
                .setPackageInfo(packageConfig)
                .setCfg(injectionConfig)
                .execute();
    }

}
