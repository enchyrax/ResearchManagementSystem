<%@ page import="kr.enchyrax.web.rms.dao.SimulationAccessor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Research Management System</title>
</head>
<body>
<%
    String modelIdStr = request.getParameter("modelId");
    int modelId = Integer.parseInt(modelIdStr);

    try {
        SimulationAccessor simulationAccessor = new SimulationAccessor();
        simulationAccessor.createSimulation(modelId);
        response.sendRedirect("../model/modelRead.jsp?modelId=" + modelId);
    } catch (Exception exception) {
        exception.printStackTrace();
    }
%>
</body>
</html>
