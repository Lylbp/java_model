package com.lylbp.college.core.interceptor;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author weiwenbin
 * @Date 2020-03-13 12:09
 */
public class ApiInterceptor implements HandlerInterceptor {
    @Autowired
    private TokenService tokenService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        //token是否有效
        Boolean tokenVerify = tokenService.verifyTokenFromHeader();
        if (!tokenVerify){
            throw new ResResultException(ResResultEnum.NO_LOGIN);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView){

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex){
    }
}
