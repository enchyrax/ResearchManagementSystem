package kr.enchyrax.web.rms.dao;

import kr.enchyrax.web.rms.DBManager;
import kr.enchyrax.web.rms.dto.Research;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResearchAccessor {

    /**
     * CREATE
     **/
    public void createResearch(String title, String researcherId, String share, String status, String description, String hypothesis, String conclusion) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "INSERT INTO research (title, researcher_id, created, share, status, description, hypothesis, conclusion) VALUES (?, ?, NOW(), ?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, title);
        statement.setString(2, researcherId);
        statement.setString(3, share);
        statement.setString(4, status);
        statement.setString(5, description);
        statement.setString(6, hypothesis);
        statement.setString(7, conclusion);

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * READ
     **/
    public List<Research> readResearch(String researcherId) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "SELECT r.title, r.researcher_id, r.created, r.share, r.status, r.description, r.hypothesis, r.conclusion, s.nickname " +
                "FROM research r " +
                "JOIN researcher s ON r.researcher_id = s.id " +
                "WHERE r.researcher_id = ? " +
                "ORDER BY r.created DESC";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, researcherId);

        ResultSet rs = statement.executeQuery();
        List<Research> researchList = new ArrayList<>();

        while (rs.next()) {
            Research research = new Research();
            research.setTitle(rs.getString("title"));
            research.setResearcherId(rs.getString("researcher_id"));
            research.setCreated(rs.getString("created"));
            research.setShare(rs.getString("share"));
            research.setStatus(rs.getString("status"));
            research.setDescription(rs.getString("description"));
            research.setHypothesis(rs.getString("hypothesis"));
            research.setConclusion(rs.getString("conclusion"));

            researchList.add(research);
        }

        if (statement != null) statement.close();
        if (connection != null) connection.close();

        return researchList;
    }

    public List<Research> readResearch() throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "SELECT r.title, r.researcher_id, r.created, r.share, r.status, r.description, r.hypothesis, r.conclusion, s.nickname " +
                "FROM research r " +
                "JOIN researcher s ON r.researcher_id = s.id " +
                "WHERE r.share = '공개' " +
                "ORDER BY r.created DESC";


        PreparedStatement statement = connection.prepareStatement(sql);

        ResultSet rs = statement.executeQuery();
        List<Research> researchList = new ArrayList<>();

        while (rs.next()) {
            Research research = new Research();
            research.setTitle(rs.getString("title"));
            research.setResearcherId(rs.getString("researcher_id"));
            research.setCreated(rs.getString("created"));
            research.setShare(rs.getString("share"));
            research.setStatus(rs.getString("status"));
            research.setDescription(rs.getString("description"));
            research.setHypothesis(rs.getString("hypothesis"));
            research.setConclusion(rs.getString("conclusion"));

            researchList.add(research);
        }

        if (statement != null) statement.close();
        if (connection != null) connection.close();

        return researchList;
    }

    public Research readResearchByTitle(String title) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "SELECT r.title, r.researcher_id, r.created, r.share, r.status, r.description, r.hypothesis, r.conclusion, s.nickname " +
                "FROM research r " +
                "JOIN researcher s ON r.researcher_id = s.id " +
                "WHERE r.title = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, title);

        ResultSet rs = statement.executeQuery();
        Research research = null;
        if (rs.next()) {
            research = new Research();
            research.setTitle(rs.getString("title"));
            research.setResearcherId(rs.getString("researcher_id"));
            research.setCreated(rs.getString("created"));
            research.setShare(rs.getString("share"));
            research.setStatus(rs.getString("status"));
            research.setDescription(rs.getString("description"));
            research.setHypothesis(rs.getString("hypothesis"));
            research.setConclusion(rs.getString("conclusion"));

        }

        if (statement != null) statement.close();
        if (connection != null) connection.close();

        return research;
    }

    /**
     * UPDATE
     **/
    public void updateResearch(Research research) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "UPDATE research SET description = ?, hypothesis = ?, conclusion = ?, status = ?, share = ? WHERE title = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, research.getDescription());
        statement.setString(2, research.getHypothesis());
        statement.setString(3, research.getConclusion());
        statement.setString(4, research.getStatus());
        statement.setString(5, research.getShare());
        statement.setString(6, research.getTitle());

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * DELETE
     **/
    public void deleteResearch(String title) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "DELETE FROM research WHERE title = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, title);

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
}
