package com.el;

public class MyElClass {
    public String getGender(String jumin) {
        String rtnStr = "";
        int bgIdx = jumin.indexOf("-") + 1;
        String genderStr = jumin.substring(bgIdx, bgIdx + 1);
        int genderInt = Integer.parseInt(genderStr);
        if(genderInt == 1 || genderInt == 3)
            rtnStr = "Male";
        else if(genderInt == 2 || genderInt == 4)
            rtnStr = "Female";
        else
            rtnStr = "Error!";

        return rtnStr;
    }
    public static boolean isNumber(String value) {
        char[] chArr = value.toCharArray();
        for(char k : chArr) {
            if(!(k >= '0' && k <= '9'))
                return false;
        }
        return true;
    }
    public static String showGugudan(int limitDan) {
        StringBuffer sb = new StringBuffer();
        try {
            sb.append("<table border='1'>");
            for (int i = 2; i <= limitDan; i++) {
                sb.append("<tr>");
                for(int j = 1; j <= 9; j++)
                    sb.append("<td>" + i + " * " + j + " = " + (i * j) + "</td>");
                sb.append("</tr>");
            }
            sb.append("</table>");
        } catch(Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
