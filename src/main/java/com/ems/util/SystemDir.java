package com.ems.util;

public class SystemDir {

    public static String getSystemDir(){
        String property = System.getProperty("os.name");
        if (property.toLowerCase().contains("windows")){
            return "D:/upload/image/";
        }
        return "/home/upload/image/";
    }
}
