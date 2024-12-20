package kr.enchyrax.web.rms.dao;

import kr.enchyrax.web.rms.DBManager;
import kr.enchyrax.web.rms.dto.Researcher;

import java.sql.*;

public class ResearcherAccessor {

    /**
     * CREATE
     **/
    public void createResearcher(String id, String password, String nickname, Date birthdate, String major, String enrollment) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "INSERT INTO researcher (id, password, nickname, birthdate, major, enrollment) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.setString(2, password);
        statement.setString(3, nickname);
        statement.setDate(4, birthdate);
        statement.setString(5, major);
        statement.setString(6, enrollment);

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * READ
     **/
    public Researcher readResearcher(String id) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "SELECT password, nickname, birthdate, major, enrollment FROM researcher WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, id);

        ResultSet rs = statement.executeQuery();

        if (!rs.next()) return null;

        Researcher researcher = new Researcher();
        researcher.setId(id);
        researcher.setPassword(rs.getString("password"));
        researcher.setNickname(rs.getString("nickname"));
        researcher.setBirthdate(rs.getDate("birthdate"));
        researcher.setMajor(rs.getString("major"));
        researcher.setEnrollment(rs.getString("enrollment"));

        if (statement != null) statement.close();
        if (connection != null) connection.close();

        return researcher;
    }

    /**
     * UPDATE
     **/
    public void updateResearcher(Researcher researcher) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "UPDATE researcher SET password = ?, nickname = ?, birthdate = ?, major = ?, enrollment = ? WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, researcher.getPassword());
        statement.setString(2, researcher.getNickname());
        statement.setDate(3, researcher.getBirthdate());
        statement.setString(4, researcher.getMajor());
        statement.setString(5, researcher.getEnrollment());
        statement.setString(6, researcher.getId());

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * DELETE
     **/
    public void deleteResearcher(String id) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "DELETE FROM researcher WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
}
