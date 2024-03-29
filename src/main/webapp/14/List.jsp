<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>지호의 일기장</title>
    <style>{text-decoration: none}</style>
</head>
<body>
    <h2>지호의 일기장 - 목록 보기(List)</h2>

    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord">
                    <input type="submit" value="검색하기">
                </td>
            </tr>
        </table>
    </form>

    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제목</th>
            <th> 이미지 </th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="8%">첨부</th>
        </tr>
        <c:choose>
            <c:when test="${ empty boardLists }">
                <tr>
                    <td colspan="6" align="center">
                        등록된 게시물이 없습니다^^*
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ boardLists }" var="row" varStatus="loop">
                    <tr align="center">
                        <td>
                            ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
                        </td>
                        <td align="left">
                            <a href="../mvcboard/view.do?idx=${ row.idx }">${ row.title }</a>
                        </td>
                        <td><img class="container_img" src="../Uploads/${ row.sfile }" style="width: 100%"></td>
                        <td>${ row.name }</td>
                        <td>${ row.visitcount }</td>
                        <td>${ row.postdate }</td>
                        <td>
                            <c:if test="${ not empty row.ofile }">
                                <a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>

    <table border="1" width="90%">
        <tr align="center">
            <td>
                ${ map.pagingImg }
            </td>
            <td width="100"><button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button> </td>
        </tr>
    </table>
</body>
</html>
