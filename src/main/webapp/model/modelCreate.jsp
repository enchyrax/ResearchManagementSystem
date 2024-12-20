<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section>
    <form action="<%= "modelCreateProcess.jsp?title=" + request.getParameter("title") %>" method="POST">
        모델 이름: <input type="text" name="name" maxlength="20" required><br><br>
        모델 설명: <textarea name="description"></textarea><br><br>

        <input type="submit" value="모델 생성">
    </form>
</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
