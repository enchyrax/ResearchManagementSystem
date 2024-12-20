<%@ page import="kr.enchyrax.web.rms.dao.SimulationAccessor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Research Management System</title>
</head>
<body>
<%
    int modelId = Integer.parseInt(request.getParameter("modelId"));
    int simulationId = Integer.parseInt(request.getParameter("simulationId"));

    try {
        SimulationAccessor simulationAccessor = new SimulationAccessor();
        simulationAccessor.deleteSimulation(simulationId);
        response.sendRedirect("../model/modelRead.jsp?modelId=" + modelId);
    } catch (Exception exception) {
        exception.printStackTrace();
    }
%>
</body>
</html>
