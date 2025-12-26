package com.csc584.profile;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {

    public static void insertProfile(ProfileBean profile) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO profiles (name, student_id, program, email, phone, hobbies, about) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, profile.getName());
            ps.setString(2, profile.getStudentId());
            ps.setString(3, profile.getProgram());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getPhone());
            ps.setString(6, profile.getHobbies());
            ps.setString(7, profile.getAbout());

            ps.executeUpdate();
        }
    }

    public static List<ProfileBean> getAllProfiles() throws SQLException, ClassNotFoundException {
        List<ProfileBean> list = new ArrayList<>();
        String sql = "SELECT * FROM profiles ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProfileBean p = new ProfileBean();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setStudentId(rs.getString("student_id"));
                p.setProgram(rs.getString("program"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                p.setHobbies(rs.getString("hobbies"));
                p.setAbout(rs.getString("about"));
                list.add(p);
            }
        }
        return list;
    }

    public static List<ProfileBean> searchProfiles(String keyword) throws SQLException, ClassNotFoundException {
        List<ProfileBean> list = new ArrayList<>();
        String sql = "SELECT * FROM profiles " +
                     "WHERE name LIKE ? OR student_id LIKE ? " +
                     "ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String like = "%" + keyword + "%";
            ps.setString(1, like);
            ps.setString(2, like);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProfileBean p = new ProfileBean();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setStudentId(rs.getString("student_id"));
                    p.setProgram(rs.getString("program"));
                    p.setEmail(rs.getString("email"));
                    p.setPhone(rs.getString("phone"));
                    p.setHobbies(rs.getString("hobbies"));
                    p.setAbout(rs.getString("about"));
                    list.add(p);
                }
            }
        }
        return list;
    }
}
