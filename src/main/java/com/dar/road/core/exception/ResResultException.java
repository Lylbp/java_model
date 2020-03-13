package com.dar.road.core.exception;

import com.dar.road.enums.ResResultEnum;
import lombok.Getter;

/**
 * @description 自定义全局异常
 * @author jianglei
 * */
@Getter
public class ResResultException extends RuntimeException {

    private final Integer code;

    public ResResultException(ResResultEnum resResultEnum) {
        super(resResultEnum.getMsg());
        this.code = resResultEnum.getCode();
    }

    public ResResultException(Integer code, String msg) {
        super(msg);
        this.code = code;
    }
}
