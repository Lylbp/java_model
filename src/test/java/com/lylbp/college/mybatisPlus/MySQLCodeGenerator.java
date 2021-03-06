package com.lylbp.college.mybatisPlus;

import com.baomidou.mybatisplus.annotation.DbType;
import com.lylbp.college.mybatisPlus.util.CommonUtils;

/**
 * MySQL 数据库代码生成类
 *
 * @author Erwin Feng
 * @since 2019-04-17 10:33
 */
public class MySQLCodeGenerator {

    public static void main(String[] args) {
        DbType dbType = DbType.MYSQL;
        String dbUrl = "jdbc:mysql://localhost:3306/java_model";
        String username = "root";
        String password = "root";
        String driver = "com.mysql.cj.jdbc.Driver";
        // 表前缀，生成的实体类，不含前缀
        String[] tablePrefixes = {"t_dar_"};
        // 表名，为空，生成所有的表
        String[] tableNames = {"area"};
        // 字段前缀
        String[] fieldPrefixes = {};
        CommonUtils.execute(dbType, dbUrl, username, password, driver, tablePrefixes, tableNames, fieldPrefixes);
    }

}
