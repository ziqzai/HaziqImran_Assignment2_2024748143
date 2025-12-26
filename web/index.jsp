<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Profile Form</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Student Profile</h1>
    <p class="subtitle">Fill in your details and see your profile card.</p>

    <form action="profile.jsp" method="post">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required>

        <label for="studentId">Student ID</label>
        <input type="text" id="studentId" name="studentId" required>

        <label for="program">Program</label>
        <input type="text" id="program" name="program" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="hobbies">Hobbies</label>
        <input type="text" id="hobbies" name="hobbies"
               placeholder="Whats your hobby? Gaming, Football">

        <label for="phone">No. Telefon</label>
        <input type="tel" id="phone" name="phone"
               placeholder="0123456789" required>

        <label for="about">Short Self-Introduction</label>
        <textarea id="about" name="about" rows="4"
                  placeholder="Tell us about yourself!!!"></textarea>

        <button type="submit">Generate Profile</button>
    </form>
</div>
</body>
</html>
