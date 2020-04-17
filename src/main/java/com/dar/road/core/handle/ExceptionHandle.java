package com.dar.road.core.handle;


import com.dar.road.core.exception.ResResultException;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.enums.ResResultEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
@Slf4j
public class ExceptionHandle {

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Object handle(Exception e, HttpServletRequest request) {
        log.error("request url is {}", request.getRequestURI());
        log.error("exception handle catch exception", e);
        //参数验证异常捕捉
        if (e instanceof MethodArgumentNotValidException) {
            MethodArgumentNotValidException mException = (MethodArgumentNotValidException) e;
            BindingResult result = mException.getBindingResult();
            if (result.hasErrors()) {
                FieldError fieldError = result.getFieldError();
                if (fieldError != null) {
//                    return ResResultUtil.makeRsp(ResResultEnum.PARAM_VALIDATE_FAILED.getCode(), fieldError.getDefaultMessage());
                    return ResResultUtil.makeRsp(ResResultEnum.PARAM_VALIDATE_FAILED);
                } else {
                    return ResResultUtil.makeRsp(ResResultEnum.PARAM_VALIDATE_FAILED);
                }
            }
        }

        if (e instanceof ResResultException) {
            ResResultException retResponseException = (ResResultException) e;
            return ResResultUtil.makeRsp(retResponseException.getCode(), retResponseException.getMessage());
        }


        return ResResultUtil.makeRsp(ResResultEnum.SYSTEM_ERR.getCode(), e.getMessage());
    }

}
