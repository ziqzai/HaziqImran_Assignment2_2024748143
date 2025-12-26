<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.csc584.profile.ProfileBean"%>
<%@page import="com.csc584.profile.ProfileDAO"%>

<%
    request.setCharacterEncoding("UTF-8");

    String method = request.getMethod();
    String idParam = request.getParameter("id");
    ProfileBean profile = null;
    String errorMessage = null;
    String successMessage = null;

    try {
        if ("POST".equalsIgnoreCase(method)) {
            // Update profile
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);

            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            String program = request.getParameter("program");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String hobbies = request.getParameter("hobbies");
            String about = request.getParameter("about");

            profile = new ProfileBean(name, studentId, program, email, phone, hobbies, about);
            profile.setId(id);

            ProfileDAO.updateProfile(profile);
            successMessage = "Profile updated successfully.";

        } else {
            // First time load (GET) - ambil data sedia ada
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                profile = ProfileDAO.getProfileById(id);
                if (profile == null) {
                    errorMessage = "Profile not found.";
                }
            } else {
                errorMessage = "No profile ID provided.";
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
        errorMessage = "Error: " + ex.getMessage();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Edit Profile</h1>

    <%
        if (errorMessage != null) {
    %>
        <p style="color:red;"><%= errorMessage %></p>
        <p><a href="viewProfiles.jsp" class="back-link">Back to Profiles</a></p>
    <%
        } else if (profile != null) {
    %>

    <%
        if (successMessage != null) {
    %>
        <p style="color:green;"><%= successMessage %></p>
    <%
        }
    %>

    <form method="post" action="editProfile.jsp">
        <input type="hidden" name="id" value="<%= profile.getId() %>">

        <div class="form-row">
            <div>
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name"
                       value="<%= profile.getName() %>" required>
            </div>

            <div>
                <label for="studentId">Student ID</label>
                <input type="text" id="studentId" name="studentId"
                       value="<%= profile.getStudentId() %>" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="program">Program</label>
                <input type="text" id="program" name="program"
                       value="<%= profile.getProgram() %>" required>
            </div>

            <div>
                <label for="email">Email</label>
                <input type="email" id="email" name="email"
                       value="<%= profile.getEmail() %>" required>
            </div>
        </div>

        <label for="hobbies">Hobbies</label>
        <input type="text" id="hobbies" name="hobbies"
               value="<%= profile.getHobbies() %>">

        <label for="phone">No. Telefon</label>
        <input type="tel" id="phone" name="phone"
               value="<%= profile.getPhone() %>" required>

        <label for="about">Short Self-Introduction</label>
        <textarea id="about" name="about" rows="4"><%= profile.getAbout() %></textarea>

        <button type="submit">Update Profile</button>
    </form>

    <p style="margin-top: 15px;">
        <a href="viewProfiles.jsp" class="back-link">Back to Profiles</a>
    </p>

    <%
        }
    %>
</div>
</body>
</html>
