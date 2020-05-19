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
    NO_AUTHENTICATION(1016, "您没有权限进行此次操作,请联系管理员分配权限!"),
    NO_ROLE_EXIT(1017, "角色不存在或已被删除,请刷新页面"),
    ROLE_NAME_EXIT(1018, "角色名称已存在"),
    NO_PERMISSION_EXIT(1019, "权限不存在或已被删除,请刷新页面"),
    ROLE_PERMISSION_EXIT(1019, "该角色已添加该权限,请勿重复添加"),
    USER_ROLE_EXIT(1019, "该用户已添加该角色,请勿重复添加"),
    MENU_HAS_SON_CAN_NOT_DELETE(1019, "菜单下含有子级菜单,请先删除子级菜单"),
    PARENT_MENU_NOT_EXIT(1019, "父级菜单不存在或已被删除,请刷新页面"),
    ;

    private Integer code;

    private String msg;

    ResResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
