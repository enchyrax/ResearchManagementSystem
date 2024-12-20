<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section>
    <form action="researchCreateProcess.jsp" method="POST" style="flex-direction: column">
        연구 제목: <input type="text" name="title" maxlength="255" required> <br><br>
        연구 설명: <textarea name="description"></textarea> <br><br>
        가설: <textarea name="hypothesis" required></textarea> <br><br>
        결론: <textarea name="conclusion"></textarea> <br><br>

        연구 상태:
        <select name="status" required>
            <option value="진행 중">진행 중</option>
            <option value="완료 됨">완료 됨</option>
        </select> <br><br>


        공개 여부:
        <select name="share" required>
            <option value="공개">공개</option>
            <option value="비공개">비공개</option>
        </select> <br><br>


        <input type="submit" value="연구 생성">
    </form>
</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
