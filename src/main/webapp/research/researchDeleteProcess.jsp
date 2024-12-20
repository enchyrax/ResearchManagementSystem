<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.ErrorMessageType" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearchAccessor" %>
<%

    String title = request.getParameter("title");
    ErrorMessageType errorMessageType;

    try {
        ResearchAccessor researchAccessor = new ResearchAccessor();
        researchAccessor.deleteResearch(title);
        response.sendRedirect("../research/researchList.jsp");
    } catch (Exception exception) {
        errorMessageType = ErrorMessageType.INTERNAL_ERROR;
        request.setAttribute("errorMessageType", errorMessageType);
        request.getRequestDispatcher("../research/researchList.jsp?title=" + title).forward(request, response);
        exception.printStackTrace();
    }
%>
