package com.lylbp.college.mybatisPlus;

import com.baomidou.mybatisplus.annotation.DbType;
import com.lylbp.college.mybatisPlus.util.CommonUtils;

/**
 * Oracle 数据库代码生成类
 *
 * @author Erwin Feng[xfsy_2015@163.com]
 * @since 2019-04-17 10:33
 */
public class OracleCodeGenerator {

    public static void main(String[] args) {
        DbType dbType = DbType.ORACLE;
        String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
        String username = "dbUsername";
        String password = "dbPassword";
        String driver = "oracle.jdbc.OracleDriver";
        // 表前缀，生成的实体类，不含前缀
        String[] tablePrefixes = {};
        // 表名，为空，生成所有的表
        String[] tableNames = {};
        // 字段前缀
        String[] fieldPrefixes = {};
//        // 基础包名
//        String packageName = "com.example.module.db";
//        //作者
//        String author = "weiwenbin";
//        //输出目录
//        String outputDir = "/Library/WebServer/java_project/java_model/src/main/java";
//        //Controller父类
//        String superControllerClass = "com.lylbp.college.controller.BaseController";
        CommonUtils.execute(dbType, dbUrl, username, password, driver, tablePrefixes, tableNames, fieldPrefixes);
    }

}
