package com.dar.road.core.annotation;

import java.lang.annotation.*;


@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ExcelHead {

    /**
     * 表头的值
     *
     * @return the string
     */
    String value() default "";


    /**
     * 表示是在第几列,从0开始计数
     *
     * @return the int
     */
    int index();
}
