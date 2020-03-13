package com.nwnu.utils;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 字段校验注解
 *
 * @author IEason
 * @date 2020年3月12日
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.FIELD })
public @interface ExcelTitle {

    String title();

    String dataMap() default "";

}