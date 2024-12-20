<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ModelAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Model" %>

<%
    String modelIdStr = request.getParameter("id");
    int modelId = Integer.parseInt(modelIdStr);
    String name = request.getParameter("name");
    String description = request.getParameter("description");

    try {
        ModelAccessor modelAccessor = new ModelAccessor();

        Model model = new Model();
        model.setId(modelId);
        model.setName(name);
        model.setDescription(description);
        modelAccessor.updateModel(model);

        response.sendRedirect("../model/modelRead.jsp?id=" + modelId);
    } catch (Exception exception) {
        exception.printStackTrace();
    }
%>
