<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearchAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Research" %>

<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section style="flex-direction: column;">
    <%
        String title = request.getParameter("title");
        Research research = null;

        try {

            ResearchAccessor researchAccessor = new ResearchAccessor();
            research = researchAccessor.readResearchByTitle(title);
            researchAccessor.updateResearch(research);

        } catch (Exception exception) {
            exception.printStackTrace();
        }
    %>

    <form action="researchUpdateProcess.jsp" method="POST">
        <input type="hidden" name="title" value="<%= research.getTitle() %>"> <br><br>
        연구 제목: <input type="text" name="title" value="<%= research.getTitle() %>" disabled required> <br><br>
        연구 내용: <textarea name="description"><%= research.getDescription() %></textarea> <br><br>
        가설: <textarea name="hypothesis" required><%= research.getHypothesis() %></textarea> <br><br>
        결론: <textarea name="conclusion"><%= research.getConclusion() %></textarea> <br><br>

        연구 상태:
        <select name="status">
            <option value="진행 중" <%= research.getStatus().equals("진행 중") ? "selected" : "" %>>진행 중</option>
            <option value="완료 됨" <%= research.getStatus().equals("완료 됨") ? "selected" : "" %>>완료 됨</option>
        </select> <br><br>

        공개 여부:
        <select name="share">
            <option value="공개" <%= research.getShare().equals("공개") ? "selected" : "" %>>공개</option>
            <option value="비공개" <%= research.getShare().equals("비공개") ? "selected" : "" %>>비공개</option>
        </select> <br><br>

        <input type="submit" value="연구 수정" style="margin-bottom: 20px;"><br><br>

    </form>

</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
