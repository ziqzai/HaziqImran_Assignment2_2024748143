<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.csc584.profile.ProfileDAO"%>

<%
    request.setCharacterEncoding("UTF-8");

    String idParam = request.getParameter("id");

    if (idParam != null) {
        try {
            int id = Integer.parseInt(idParam);
            ProfileDAO.deleteProfile(id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // Lepas delete, pergi balik ke senarai profile
    response.sendRedirect("viewProfiles.jsp");
    return;
%>
