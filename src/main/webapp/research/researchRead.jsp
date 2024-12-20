<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearchAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dao.ModelAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Research" %>
<%@ page import="kr.enchyrax.web.rms.dto.Model" %>
<%@ page import="kr.enchyrax.web.rms.dto.Researcher" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearcherAccessor" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section style="flex-direction: column; justify-content: start">
    <%
        String title = request.getParameter("title");
        Researcher researcher = null;
        Research research = null;
        List<Model> modelList = new ArrayList<>();

        try {
            ResearcherAccessor researcherAccessor = new ResearcherAccessor();
            ResearchAccessor researchAccessor = new ResearchAccessor();
            ModelAccessor modelAccessor = new ModelAccessor();

            research = researchAccessor.readResearchByTitle(title);
            researcher = researcherAccessor.readResearcher(research.getResearcherId());
            modelList = modelAccessor.readModelByResearchTitle(title);

        } catch (Exception exception) {
            exception.printStackTrace();
        }

    %>

    <div style="margin-bottom: 10px;">
        <span style="font-weight: bold; font-size: 30px"> <%= research.getTitle() %> </span>
    </div>

    <br><br>
    <hr width="80%">
    <br><br>

    <p style="margin: 10px 10px"><strong>연구자:</strong> <%= researcher.getNickname() %>
    </p>
    <p style="margin-bottom: 10px;"><strong>연구 내용:</strong> <%= research.getDescription() %>
    </p>
    <p style="margin-bottom: 10px;"><strong>가설:</strong> <%= research.getHypothesis() %>
    </p>
    <p style="margin-bottom: 10px;"><strong>결론:</strong> <%= research.getConclusion() %>
    </p>
    <p style="margin-bottom: 10px;"><strong>상태:</strong> <%= research.getStatus() %>
    </p>
    <p style="margin-bottom: 30px;"><strong>공개 여부:</strong> <%= research.getShare() %>
    </p>


    <div style="margin-bottom: 10px;">
        <span style="font-weight: bold; font-size: 30px"> 모델 목록 </span>
        <a href="<%= "../model/modelCreate.jsp?title=" + title %>">
            <button type="button">새 모델 추가</button>
        </a>
    </div>
    <%
        if (!modelList.isEmpty()) {
    %>
    <table border="1" style="border-collapse: collapse">
        <thead>
        <tr>
            <th>이름</th>
            <th>설명</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Model model : modelList) {
        %>
        <tr>
            <td><%= model.getName() %>
            </td>
            <td><%= model.getDescription() %>
            </td>
            <td>
                <a href="../model/modelRead.jsp?modelId=<%= model.getId() %>">
                    <button>자세히 보기</button>
                </a>
            <td>
                <a href="../model/modelUpdate.jsp?modelId=<%= model.getId() %>">
                    <button>수정</button>
                </a>
            </td>
            <td>
                <a href="../model/modelDeleteProcess.jsp?modelId=<%= model.getId() %>">
                    <button style="color: red">삭제</button>
                </a>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        }
    %>

</section>

<%@ include file="../layout/footer.jsp" %>
</body>
</html>
