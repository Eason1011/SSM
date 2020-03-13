package com.nwnu.utils;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * �ֶ�У��ע��
 *
 * @author IEason
 * @date 2020��3��12��
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.FIELD })
public @interface ExcelTitle {

    String title();

    String dataMap() default "";

}