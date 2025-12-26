package com.csc584.profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {

    public static void insertProfile(ProfileBean profile)
            throws SQLException, ClassNotFoundException {

        String sql = "INSERT INTO profiles " +
                     "(name, student_id, program, email, phone, hobbies, about) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, profile.getName());
            ps.setString(2, profile.getStudentId());
            ps.setString(3, profile.getProgram());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getPhone());
            ps.setString(6, profile.getHobbies());
            ps.setString(7, profile.getAbout());

            ps.executeUpdate();

        } finally {
            if (ps != null) {
                try { ps.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException ex) { /* ignore */ }
            }
        }
    }

    public static List<ProfileBean> getAllProfiles()
            throws SQLException, ClassNotFoundException {

        List<ProfileBean> list = new ArrayList<ProfileBean>();

        String sql = "SELECT * FROM profiles ORDER BY id DESC";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

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

        } finally {
            if (rs != null) {
                try { rs.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (ps != null) {
                try { ps.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException ex) { /* ignore */ }
            }
        }

        return list;
    }

    public static List<ProfileBean> searchProfiles(String keyword)
            throws SQLException, ClassNotFoundException {

        List<ProfileBean> list = new ArrayList<ProfileBean>();

        String sql = "SELECT * FROM profiles " +
                     "WHERE name LIKE ? OR student_id LIKE ? " +
                     "ORDER BY id DESC";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);

            String like = "%" + keyword + "%";
            ps.setString(1, like); // search pada column name
            ps.setString(2, like); // search pada column student_id

            rs = ps.executeQuery();

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

        } finally {
            if (rs != null) {
                try { rs.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (ps != null) {
                try { ps.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException ex) { /* ignore */ }
            }
        }

        return list;
    }

    public static ProfileBean getProfileById(int id)
            throws SQLException, ClassNotFoundException {

        ProfileBean p = null;
        String sql = "SELECT * FROM profiles WHERE id = ?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                p = new ProfileBean();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setStudentId(rs.getString("student_id"));
                p.setProgram(rs.getString("program"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                p.setHobbies(rs.getString("hobbies"));
                p.setAbout(rs.getString("about"));
            }

        } finally {
            if (rs != null) {
                try { rs.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (ps != null) {
                try { ps.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException ex) { /* ignore */ }
            }
        }

        return p;
    }

    public static void updateProfile(ProfileBean profile)
            throws SQLException, ClassNotFoundException {

        String sql = "UPDATE profiles SET " +
                     "name = ?, student_id = ?, program = ?, " +
                     "email = ?, phone = ?, hobbies = ?, about = ? " +
                     "WHERE id = ?";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, profile.getName());
            ps.setString(2, profile.getStudentId());
            ps.setString(3, profile.getProgram());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getPhone());
            ps.setString(6, profile.getHobbies());
            ps.setString(7, profile.getAbout());
            ps.setInt(8, profile.getId());

            ps.executeUpdate();

        } finally {
            if (ps != null) {
                try { ps.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException ex) { /* ignore */ }
            }
        }
    }

    public static void deleteProfile(int id)
            throws SQLException, ClassNotFoundException {

        String sql = "DELETE FROM profiles WHERE id = ?";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } finally {
            if (ps != null) {
                try { ps.close(); } catch (SQLException ex) { /* ignore */ }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException ex) { /* ignore */ }
            }
        }
    }
}
