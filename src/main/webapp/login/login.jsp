<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section class="login">

    <form action="loginProcess.jsp" method="POST">
        아이디: <input type="text" id="id" name="id" required><br><br>
        비밀번호: <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="로그인">
        <a href="../register/register.jsp">
            <button type="button">회원가입</button>
        </a>
    </form>

</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
