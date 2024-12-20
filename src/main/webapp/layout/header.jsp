<%@ page import="kr.enchyrax.web.rms.ErrorMessageType" %>
<!-- Import Style Sheet -->
<link href="../layout/layout.css" rel="stylesheet">

<header style="flex-direction: column;">
    <p style="font-size: 30px;">Research Management System</p>
    <%@ include file="navigation.jsp" %>
</header>

<!-- Error Handling -->
<%
    Object attribute = request.getAttribute("errorMessageType");
    ErrorMessageType errorMessageType = attribute != null ? (ErrorMessageType) attribute : ErrorMessageType.NONE;

    if (errorMessageType != ErrorMessageType.NONE) {
%>
<script>
    alert("<%= errorMessageType.getMessage() %>");
</script>
<%
    }
%>