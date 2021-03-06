package com.lylbp.college.core.utils;

import com.lylbp.college.core.entity.PageResResult;
import com.lylbp.college.core.entity.ResResult;
import com.github.pagehelper.PageInfo;
import com.lylbp.college.core.enums.ResResultEnum;
import java.util.List;

public class ResResultUtil {
    private ResResultUtil() {}

    public static <T> ResResult<T> makeRsp(int code, String msg) {
        return new ResResult<T>().setCode(code).setMsg(msg);
    }

    public static <T> ResResult<T> makeRsp(int code, String msg, T data) {
        return new ResResult<T>().setCode(code).setMsg(msg).setData(data);
    }


    public static <T> ResResult<T> makeRsp(ResResultEnum responseEnum) {
        return new ResResult<T>().setCode(responseEnum.getCode()).setMsg(responseEnum.getMsg());
    }

    public static <T> ResResult<T> makeRsp(ResResultEnum responseEnum, T data) {
        return new ResResult<T>().setCode(responseEnum.getCode()).setMsg(responseEnum.getMsg()).setData(data);
    }


    public static <T> ResResult<T> success() {
        return new ResResult<T>().setCode(ResResultEnum.SUCCESS.getCode()).setMsg(ResResultEnum.SUCCESS.getMsg());
    }

    public static <T> ResResult<T> success(T data) {
        return new ResResult<T>().setCode(ResResultEnum.SUCCESS.getCode()).setMsg(ResResultEnum.SUCCESS.getMsg()).setData(data);
    }


    public static <T> ResResult<T> error() {
        return new ResResult<T>().setCode(ResResultEnum.SYSTEM_ERR.getCode()).setMsg(ResResultEnum.SYSTEM_ERR.getMsg());
    }

    public static <T> ResResult<T> error(ResResultEnum responseEnum) {
        return new ResResult<T>().setCode(responseEnum.getCode()).setMsg(responseEnum.getMsg());
    }

    public static <T> ResResult<T> error(T data) {
        return new ResResult<T>().setCode(ResResultEnum.SYSTEM_ERR.getCode()).setMsg(ResResultEnum.SYSTEM_ERR.getMsg()).setData(data);
    }


    public static <T> ResResult<PageResResult<T>> makePageRsp(List<T> list) {
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        PageResResult<T> pageResult = new PageResResult<T>(pageInfo);

        return new ResResult<PageResResult<T>>().setCode(ResResultEnum.SUCCESS.getCode()).setMsg(ResResultEnum.SUCCESS.getMsg()).setData(pageResult);
    }
}
