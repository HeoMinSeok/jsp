package com.util;

public class BoardPage {
    public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
        String pagingStr = "";

        int totalPage = (int)Math.ceil((double) totalCount/pageSize);

        int pageTemp = (((pageNum -1) / blockPage) * blockPage) + 1;
        if(pageTemp != 1) {
            pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
            pagingStr += "&nbsp;";
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
                        + "'>[이전 블록]</a>";
        }

//        int blockCount = 1;
//        while(blockCount <= blockPage && pageTemp <= totalPage) {
//            if(pageTemp == pageNum) {
//                pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
//            }
//            else {
//                pagingStr += "&nbsp;<a href='" + reqUrl +"?pageNum=" + pageTemp +
//                        "'>" + pageTemp + "</a>&nbsp;";
//            }
//            pageTemp++;
//            blockCount++;
//        }
        for (int blockCount = 1; blockCount <= blockPage && pageTemp <= totalPage; blockCount++, pageTemp++) {
            if (pageTemp == pageNum) {
                pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
            } else {
                pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp +
                        "'>" + pageTemp + "</a>&nbsp;";
            }
        }

        if(pageTemp <= totalPage) {
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
            pagingStr += "&nbsp;";
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPage + "'>[마지막 페이지]</a>";
        }

        return pagingStr;
    }
}
