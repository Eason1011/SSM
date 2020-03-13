package com.nwnu.utils;

import java.util.List;

public class ParamCheck {
    private ParamCheck() {

    }

    /**
     * У������Ƿ�Ϊ��
     *
     * @param args
     * @return
     */
    public static boolean checkParamIsEmpty(Object... args) {
        for (Object param : args) {
            if (param == null) {
                return true;
            }
            if (param instanceof String && "".equals(param)) {
                return true;
            }
            if (param instanceof Integer && 0 == (int) param) {
                return true;
            }
        }
        return false;
    }

    /**
     * У������Ƿ�ȫ��Ϊ��
     *
     * @param args
     * @return
     */
    public static boolean checkParamIsAllEmpty(Object... args) {
        for (Object param : args) {
            if (param != null) {
                boolean flag = false;
                if (param instanceof String && "".equals(param)) {
                    flag = true;
                }
                if (param instanceof Integer && 0 == (int) param) {
                    flag = true;
                }
                if (!flag) {
                    return false;
                }
            }

        }
        return true;
    }

    /**
     * У���ַ����Ƿ�Ϊ��
     *
     * @param str
     * @return
     */
    public static boolean isStringEmpty(String str) {
        return str == null || "".equals(str);
    }

    /**
     * У�������Ƿ�Ϊ��
     *
     * @param str
     * @return
     */
    public static boolean isIntEmpty(Integer number) {
        return number == null || number == 0;
    }

    /**
     * У�鼯���Ƿ�Ϊ��
     *
     * @param str
     * @return
     */
    public static boolean isListEmpty(List<?> list) {
        return list == null || list.isEmpty();
    }

}

