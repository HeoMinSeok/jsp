<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeCycle.jsp</title>
</head>
<body>
    <script>
        function requestAction(frm, met) {
            if(met == 1)
                frm.method = 'get';
            else
                frm.method = 'post';
            frm.submit();
        }
    </script>
</body>
    <h2>서블릿 주명수기(Lice Cycle) 메소드</h2>
    <form action="./LifeCycle.do">
        <input type="button" value="Get 방식 요청하기" onclick="requestAction(this.form, 1);" />
        <input type="button" value="Post 방식 요청하기" onclick="requestAction(this.form, 2);" />
    </form>
</html>
