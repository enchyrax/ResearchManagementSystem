<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearchAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Research" %>
<%@ page import="kr.enchyrax.web.rms.dto.Researcher" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearcherAccessor" %>

<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section style="flex-direction: column; justify-content: start">
    <div style="margin: 20px 0;">
        <span style="font-weight: bold; font-size: 30px"> 내 연구 목록 </span>
        <a href="researchCreate.jsp" style="">
            <button type="button">새 연구 생성</button>
        </a>
    </div>
    <div style="margin-bottom: 20px;">
        <%
            String researcherId = (String) session.getAttribute("id");
            Researcher researcher = null;
            List<Research> researchList = new ArrayList<>();
            List<Research> allResearchList = new ArrayList<>();

            try {
                ResearcherAccessor researcherAccessor = new ResearcherAccessor();
                researcher = researcherAccessor.readResearcher(researcherId);
                ResearchAccessor researchAccessor = new ResearchAccessor();
                researchList = researchAccessor.readResearch(researcherId);
                allResearchList = researchAccessor.readResearch();
            } catch (Exception exception) {
                exception.printStackTrace();
            }

        %>
        <table border="1" style="border-collapse: collapse">
            <thead>
            <tr>
                <th>공개 여부</th>
                <th>상태</th>
                <th>제목</th>
                <th>연구자</th>
                <th>생성일</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Research research : researchList) {
            %>
            <tr>
                <td><%= research.getShare() %>
                </td>
                <td><%= research.getStatus() %>
                </td>
                <td><%= research.getTitle() %>
                </td>
                <td><%= researcher.getNickname() %>
                </td>
                <td><%= research.getCreated() %>
                </td>
                <td><a href="researchRead.jsp?title=<%= research.getTitle() %>">
                    <button>자세히 보기</button>
                </a></td>
                <td><a href="researchUpdate.jsp?title=<%= research.getTitle() %>">
                    <button>수정</button>
                </a></td>
                <td><a href="researchDeleteProcess.jsp?title=<%= research.getTitle() %>">
                    <button style="color: red">삭제</button>
                </a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <hr width="80%">

    <div style="margin: 20px">
        <span style="font-weight: bold; font-size: 30px"> 모든 연구 목록 </span>
    </div>
    <div>

        <table border="1" style="border-collapse: collapse">
            <thead>
            <tr>
                <th>상태</th>
                <th>제목</th>
                <th>연구자</th>
                <th>생성일</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Research research : allResearchList) {
            %>
            <tr>
                <td><%= research.getStatus() %>
                </td>
                <td><%= research.getTitle() %>
                </td>
                <td><%= researcher.getNickname() %>
                </td>
                <td><%= research.getCreated() %>
                </td>
                <td><a href="researchRead.jsp?title=<%= research.getTitle() %>">
                    <button>자세히 보기</button>
                </a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
