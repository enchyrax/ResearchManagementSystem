<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kr.enchyrax.web.rms.ErrorMessageType" %>
<%@ page import="kr.enchyrax.web.rms.dto.Researcher" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearcherAccessor" %>
<%

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    try {
        ResearcherAccessor researcherAccessor = new ResearcherAccessor();
        Researcher researcher = researcherAccessor.readResearcher(id);

        if (researcher == null || !password.equals(researcher.getPassword())) {
            request.setAttribute("errorMessageType", ErrorMessageType.LOGIN_FAILED);
            request.getRequestDispatcher("../login/login.jsp").forward(request, response);
        } else {
            session.setAttribute("id", id);
            response.sendRedirect("../research/researchList.jsp");
        }

    } catch (Exception exception) {
        request.setAttribute("errorMessageType", ErrorMessageType.INTERNAL_ERROR);
        request.getRequestDispatcher("../login/login.jsp").forward(request, response);
        exception.printStackTrace();
    }
%>
