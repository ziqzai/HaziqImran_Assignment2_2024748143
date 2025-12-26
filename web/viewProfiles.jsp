<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.csc584.profile.ProfileBean"%>
<%@page import="com.csc584.profile.ProfileDAO"%>

<%
    request.setCharacterEncoding("UTF-8");

    String keyword = request.getParameter("keyword");
    List<ProfileBean> profiles = null;
    String errorMessage = null;

    try {
        if (keyword != null && keyword.trim().length() > 0) {
            // UNIQUE FEATURE: search by name / student ID
            profiles = ProfileDAO.searchProfiles(keyword.trim());
        } else {
            profiles = ProfileDAO.getAllProfiles();
        }
    } catch (Exception ex) {
        ex.printStackTrace();
        errorMessage = ex.getMessage();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Student Profiles</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">

    <h1>All Student Profiles</h1>

    <!-- Search form (unique feature) -->
    <form method="get" action="viewProfiles.jsp" style="margin-bottom: 20px;">
        <label for="keyword"><strong>Search (Name / Student ID):</strong></label>
        <input type="text" id="keyword" name="keyword"
               value="<%= (keyword != null ? keyword : "") %>">
        <button type="submit">Search</button>
        <a href="viewProfiles.jsp">Reset</a>
    </form>

    <%
        if (errorMessage != null) {
    %>
        <p style="color:red;">Error: <%= errorMessage %></p>
    <%
        } else if (profiles == null || profiles.isEmpty()) {
    %>
        <p>No profiles found.</p>
    <%
        } else {
    %>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Student ID</th>
            <th>Program</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Hobbies</th>
            <th>About</th>
        </tr>

        <%
            for (ProfileBean p : profiles) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getStudentId() %></td>
            <td><%= p.getProgram() %></td>
            <td><%= p.getEmail() %></td>
            <td><%= p.getPhone() %></td>
            <td><%= p.getHobbies() %></td>
            <td><%= p.getAbout() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <%
        }
    %>

    <p style="margin-top:20px;">
        <a href="index.jsp">Create New Profile</a>
    </p>
</div>
</body>
</html>
