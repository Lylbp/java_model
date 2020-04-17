package com.dar.road.enums;

import lombok.Getter;

@Getter
public enum ResResultEnum {
    /**
     * ===========================系统相关===============================
     */
    SUCCESS(200, "success"),
    FAIL(400, "fail"),
    NOT_FOUND(404, "接口不存在"),
    SYSTEM_ERR(1001, "系统繁忙,请稍后重试"),
    ACCOUNT_ERR(1002, "当前登录账号异常"),
    AUTHENTICATION_INVALID(3, "您的登录凭证已失效"),
    ILLEGAL_REQUEST(1004, "您正在进行非法请求"),
    DATA_NOT_EXIST(1005, "对不起,您查询的数据不存在,请刷新页面"),
    DATA_HAVE_EXIST(1006, "数据已存在"),
    PARAM_ERROR(1007, "参数错误,请检查参数"),
    PARAM_VALIDATE_FAILED(1008, "参数验证失败,请检查参数"),
    UPLOAD_FAIL(1010, "上传失败"),
    UPLOAD_RESOURCE_SUFFIX_ERROR(1013, "不允许上传文件类型"),
    RESOURCE_NOT_EXIT(1014, "资源不存在"),
    NO_LOGIN(1015, "登录凭证已失效"),
    ;

    private Integer code;

    private String msg;

    ResResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
