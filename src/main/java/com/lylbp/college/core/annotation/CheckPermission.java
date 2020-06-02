package com.lylbp.college.core.annotation;

import java.lang.annotation.*;


@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CheckPermission {
    /**
     * 描述
     *
     * @return
     */
    String descrption() default "" ;
}
