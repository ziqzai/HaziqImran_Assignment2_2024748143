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

    <!-- Search form -->
    <form method="get" action="viewProfiles.jsp" class="search-bar">
        <input type="text" name="keyword" id="keyword"
               placeholder="Search by Name or Student ID"
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

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Student ID</th>
            <th>Program</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Hobbies</th>
            <th>About</th>
            <th>Actions</th>
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
            <td>
            <td class="actions-cell">
                <a class="action-link edit"
                   href="editProfile.jsp?id=<%= p.getId() %>">Edit</a>
                <a class="action-link delete"
                   href="deleteProfile.jsp?id=<%= p.getId() %>"
                   onclick="return confirm('Are you sure you want to delete this profile?');">
                   Delete
                </a>
            </td>


        </tr>
        <%
            }
        %>
    </table>

    <%
        }
    %>

    <p style="margin-top: 20px;">
        <a href="index.jsp" class="back-link">Create New Profile</a>
    </p>
</div>
</body>
</html>
