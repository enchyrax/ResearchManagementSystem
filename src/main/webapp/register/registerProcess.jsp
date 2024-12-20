<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="kr.enchyrax.web.rms.ErrorMessageType" %>
<%@ page import="kr.enchyrax.web.rms.dto.Researcher" %>
<%@ page import="kr.enchyrax.web.rms.dao.ResearcherAccessor" %>
<%

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String nickname = request.getParameter("nickname");
    String major = request.getParameter("major");
    String enrollment = request.getParameter("enrollment");
    String birthdate = request.getParameter("birthdate");

    ErrorMessageType errorMessageType = ErrorMessageType.NONE;

    /**
     * Validation Check
     */
    if (id.length() > 20) {
        errorMessageType = ErrorMessageType.ID_OVER_MAX_LENGTH;
    } else if (password.length() > 20) {
        errorMessageType = ErrorMessageType.PASSWORD_OVER_MAX_LENGTH;
    } else if (nickname.length() > 20) {
        errorMessageType = ErrorMessageType.NICKNAME_OVER_MAX_LENGTH;
    } else if (major.length() > 10) {
        errorMessageType = ErrorMessageType.MAJOR_OVER_MAX_LENGTH;
    } else if (!password.equals(confirmPassword)) {
        errorMessageType = ErrorMessageType.PASSWORD_INCORRECT;
    }

    if (errorMessageType == ErrorMessageType.NONE) {
        try {
            ResearcherAccessor researcherAccessor = new ResearcherAccessor();
            Researcher researcher = researcherAccessor.readResearcher(id);

            if (researcher != null) {
                errorMessageType = ErrorMessageType.ID_ALREADY_EXISTS;
                request.setAttribute("errorMessageType", errorMessageType);
                request.getRequestDispatcher("../register/register.jsp").forward(request, response);
            } else {
                researcherAccessor.createResearcher(id, password, nickname, Date.valueOf(birthdate), major, enrollment);
                response.sendRedirect("../login/login.jsp");
            }
        } catch (Exception exception) {
            errorMessageType = ErrorMessageType.INTERNAL_ERROR;
            request.setAttribute("errorMessageType", errorMessageType);
            request.getRequestDispatcher("../register/register.jsp").forward(request, response);
            exception.printStackTrace();
        }
    } else {
        request.setAttribute("errorMessageType", errorMessageType);
        request.getRequestDispatcher("../register/register.jsp").forward(request, response);
    }
%>
