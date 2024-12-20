<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ModelAccessor" %>
<%@ page import="kr.enchyrax.web.rms.ErrorMessageType" %>

<%
    String researchTitle = request.getParameter("title");
    String name = request.getParameter("name");
    String description = request.getParameter("description");

    ErrorMessageType errorMessageType = ErrorMessageType.NONE;

    /**
     * Validation Check
     */
    if (name.length() > 20) {
        errorMessageType = ErrorMessageType.MODEL_NAME_OVER_MAX_LENGTH;
    }

    if (errorMessageType == ErrorMessageType.NONE) {
        try {
            ModelAccessor modelAccessor = new ModelAccessor();

            modelAccessor.createModel(researchTitle, name, description);

            request.getRequestDispatcher("../research/researchRead.jsp").forward(request, response);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    } else {
        request.setAttribute("errorMessageType", errorMessageType);
        request.getRequestDispatcher("../model/modelCreate.jsp").forward(request, response);
    }
%>
