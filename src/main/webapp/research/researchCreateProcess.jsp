<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.ErrorMessageType" %>
<%@ page import="kr.enchyrax.web.rms.dto.Research" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearchAccessor" %>
<%

    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String hypothesis = request.getParameter("hypothesis");
    String conclusion = request.getParameter("conclusion");
    String status = request.getParameter("status");
    String share = request.getParameter("share");
    String researcherId = (String) session.getAttribute("id");

    ErrorMessageType errorMessageType = ErrorMessageType.NONE;

    /**
     * Validation Check
     */
    if (title.length() > 255) {
        errorMessageType = ErrorMessageType.TITLE_OVER_MAX_LENGTH;
    }

    if (errorMessageType == ErrorMessageType.NONE) {
        try {
            ResearchAccessor researchAccessor = new ResearchAccessor();
            Research research = researchAccessor.readResearchByTitle(title);

            if (research != null) {
                errorMessageType = ErrorMessageType.TITLE_ALREADY_EXISTS;
                request.setAttribute("errorMessageType", errorMessageType);
                request.getRequestDispatcher("../research/researchCreate.jsp").forward(request, response);
            } else {
                researchAccessor.createResearch(title, researcherId, share, status, description, hypothesis, conclusion);
                request.setAttribute("research", title);
                request.getRequestDispatcher("../research/researchRead.jsp").forward(request, response);
            }
        } catch (Exception exception) {
            request.setAttribute("errorMessageType", ErrorMessageType.INTERNAL_ERROR);
            request.getRequestDispatcher("../research/researchCreate.jsp").forward(request, response);
            exception.printStackTrace();
        }
    } else {
        request.setAttribute("errorMessageType", errorMessageType);
        request.getRequestDispatcher("../research/researchCreate.jsp").forward(request, response);
    }
%>
