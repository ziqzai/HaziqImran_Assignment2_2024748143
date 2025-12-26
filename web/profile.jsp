<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.csc584.profile.ProfileBean"%>
<%@page import="com.csc584.profile.ProfileDAO"%>

<%
    // Pastikan encoding betul
    request.setCharacterEncoding("UTF-8");

    // Ambil data dari form
    String name = request.getParameter("name");
    String studentId = request.getParameter("studentId");
    String program = request.getParameter("program");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String hobbies = request.getParameter("hobbies");
    String about = request.getParameter("about");

    ProfileBean profile = null;
    String errorMessage = null;

    if (name != null && studentId != null) {
        // Masukkan data ke dalam JavaBean
        profile = new ProfileBean(name, studentId, program, email, phone, hobbies, about);

        try {
            // Simpan ke database
            ProfileDAO.insertProfile(profile);

        } catch (Exception ex) {   // <-- multi-catch dah tukar kepada satu catch sahaja
            ex.printStackTrace();
            errorMessage = "Error saving profile: " + ex.getMessage();
        }
    } else {
        errorMessage = "Form data is missing.";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container profile-card">

    <%
        if (errorMessage != null) {
    %>
        <h1>Error</h1>
        <p><%= errorMessage %></p>
        <a href="index.jsp" class="back-link">Back to form</a>
    <%
        } else if (profile != null) {
    %>

    <!-- Avatar huruf pertama nama -->
    <div class="avatar-circle">
        <span><%= profile.getName() != null && !profile.getName().isEmpty()
                  ? profile.getName().substring(0,1).toUpperCase() : "S" %></span>
    </div>

    <h1><%= profile.getName() %></h1>
    <p class="subtitle">Student Profile</p>

    <div class="profile-details">
        <p><strong>Student ID:</strong> <%= profile.getStudentId() %></p>
        <p><strong>Program:</strong> <%= profile.getProgram() %></p>
        <p><strong>Email:</strong> <%= profile.getEmail() %></p>
        <p><strong>No. Telefon:</strong> <%= profile.getPhone() %></p>
        <p><strong>Hobbies:</strong> <%= profile.getHobbies() %></p>
    </div>

    <h2>About Me</h2>
    <p class="about-text"><%= profile.getAbout() %></p>

    <a href="index.jsp" class="back-link">Create Another Profile</a>
    <a href="viewProfiles.jsp" class="back-link">View All Profiles</a>

    <%
        }
    %>
</div>
</body>
</html>
