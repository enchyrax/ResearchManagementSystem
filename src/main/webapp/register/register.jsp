<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section>
    <form action="registerProcess.jsp" method="POST">
        아이디: <input type="text" id="id" name="id" maxlength="20" required><br><br>

        비밀번호: <input type="password" id="password" name="password" maxlength="20" required><br><br>

        비밀번호 확인: <input type="password" id="confirmPassword" name="confirmPassword" maxlength="20" required><br><br>

        별명: <input type="text" id="nickname" name="nickname" maxlength="20" required><br><br>

        전공: <input type="text" id="major" name="major" maxlength="10" required><br><br>

        재학 구분:
        <select id="enrollment" name="enrollment" required>
            <option value="학사">학사</option>
            <option value="석사">석사</option>
            <option value="박사">박사</option>
            <option value="교수">교수</option>
        </select><br><br>

        생년월일: <input type="date" id="birthdate" name="birthdate" required><br><br>

        <input type="submit" value="회원가입">
    </form>
</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
