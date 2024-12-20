<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearchAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Research" %>

<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String hypothesis = request.getParameter("hypothesis");
    String conclusion = request.getParameter("conclusion");
    String status = request.getParameter("status");
    String share = request.getParameter("share");

    try {

        ResearchAccessor researchAccessor = new ResearchAccessor();

        Research research = new Research();
        research.setTitle(title);
        research.setDescription(description);
        research.setHypothesis(hypothesis);
        research.setConclusion(conclusion);
        research.setStatus(status);
        research.setShare(share);

        researchAccessor.updateResearch(research);


        response.sendRedirect("../research/researchList.jsp");

    } catch (Exception exception) {
        exception.printStackTrace();
    }
%>
