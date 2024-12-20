<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ModelAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Model" %>

<%
    String modelIdStr = request.getParameter("modelId");
    int modelId = Integer.parseInt(modelIdStr);

    try {
        ModelAccessor modelAccessor = new ModelAccessor();
        Model model = modelAccessor.readModel(modelId);
        modelAccessor.deleteModel(modelId);
        response.sendRedirect("../research/researchRead.jsp?title=" + model.getResearchTitle());
    } catch (Exception exception) {
        exception.printStackTrace();
    }
%>
