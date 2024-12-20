<nav style="margin-top: 20px">
    <%
        if (session.getAttribute("id") != null) {
    %>
    <a href="../research/researchList.jsp" style="color: white">Research List</a>
    <%
        }
    %>
</nav>