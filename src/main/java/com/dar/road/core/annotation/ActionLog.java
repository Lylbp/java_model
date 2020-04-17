package com.dar.road.core.annotation;

import java.lang.annotation.*;


@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ActionLog {
    /**
     * 描述
     *
     * @return
     */
    String descrption() default "" ;
}
