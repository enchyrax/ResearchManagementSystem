<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ModelAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Model" %>

<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section>
    <%
        String modelIdStr = request.getParameter("modelId");
        int modelId = Integer.parseInt(modelIdStr);
        Model model = null;

        try {
            ModelAccessor modelAccessor = new ModelAccessor();
            model = modelAccessor.readModel(modelId);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    %>

    <form action="modelUpdateProcess.jsp" method="POST">
        <input type="hidden" name="id" value="<%= model.getId() %>">
        모델 이름: <input type="text" name="name" value="<%= model.getName() %>" required><br><br>
        모델 설명: <textarea name="description"><%= model.getDescription() %></textarea><br><br>

        <input type="submit" value="모델 수정">
    </form>
</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
