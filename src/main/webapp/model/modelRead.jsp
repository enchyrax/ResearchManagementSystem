<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.enchyrax.web.rms.dao.ModelAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dao.SimulationAccessor" %>
<%@ page import="kr.enchyrax.web.rms.dto.Model" %>
<%@ page import="kr.enchyrax.web.rms.dto.Simulation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Research Management System</title>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<section style="flex-direction: column; justify-content: start">
    <%
        String modelIdStr = request.getParameter("modelId");
        int modelId = Integer.parseInt(modelIdStr);
        Model model = null;
        List<Simulation> simulations = new ArrayList<>();

        try {
            ModelAccessor modelAccessor = new ModelAccessor();
            SimulationAccessor simulationAccessor = new SimulationAccessor();

            model = modelAccessor.readModel(modelId);
            simulations = simulationAccessor.readSimulation(modelId);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    %>

    <h2 style="font-size: 30px; margin-bottom: 10px;"><%= model.getName() %>
    </h2>
    <p style="margin-bottom: 40px"><strong>설명:</strong> <%= model.getDescription() %>
    </p>

    <div style="margin-bottom: 20px">
        <span style="font-weight: bold; font-size: 20px"> 시뮬레이션 목록 </span>
        <a href="../model/modelSimulationProcess.jsp?modelId=<%= model.getId() %>">
            <button type="button">새 시뮬레이션 추가</button>
        </a>
    </div>

    <table border="1" style="border-collapse: collapse">
        <thead>
        <tr>
            <th>정확도</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Simulation simulation : simulations) {
        %>
        <tr>
            <td><%= simulation.getAccuracy() %>
            </td>
            <td>
                <a href="modelSimulationDeleteProcess.jsp?simulationId=<%= simulation.getId() %>&modelId=<%= simulation.getModelId() %>">
                    <button style="color: red">삭제</button>
                </a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
