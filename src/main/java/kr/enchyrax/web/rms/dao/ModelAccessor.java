package kr.enchyrax.web.rms.dao;

import kr.enchyrax.web.rms.DBManager;
import kr.enchyrax.web.rms.dto.Model;
import kr.enchyrax.web.rms.dto.Research;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ModelAccessor {

    /**
     * CREATE
     **/
    public void createModel(String researchTitle, String name, String description) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "INSERT INTO model (research_title, name, description) VALUES (?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, researchTitle);
        statement.setString(2, name);
        statement.setString(3, description);

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * READ
     **/
    public Model readModel(int id) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "SELECT research_title, name, description FROM model WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);

        ResultSet rs = statement.executeQuery();

        if (!rs.next()) return null;

        Model model = new Model();
        model.setId(id);
        model.setResearchTitle(rs.getString("research_title"));
        model.setName(rs.getString("name"));
        model.setDescription(rs.getString("description"));

        if (statement != null) statement.close();
        if (connection != null) connection.close();

        return model;
    }

    public List<Model> readModelByResearchTitle(String title) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "SELECT id, research_title, name, description FROM model WHERE research_title = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, title);

        ResultSet rs = statement.executeQuery();
        List<Model> modelList = new ArrayList<>();

        while (rs.next()) {
            Model model = new Model();
            model.setId(rs.getInt("id"));
            model.setResearchTitle(rs.getString("research_title"));
            model.setName(rs.getString("name"));
            model.setDescription(rs.getString("description"));

            modelList.add(model);
        }

        if (statement != null) statement.close();
        if (connection != null) connection.close();

        return modelList;
    }

    /**
     * UPDATE
     **/
    public void updateModel(Model model) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "UPDATE model SET research_title = ?, name = ?, description = ? WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, model.getResearchTitle());
        statement.setString(2, model.getName());
        statement.setString(3, model.getDescription());

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * DELETE
     **/
    public void deleteModel(int id) throws SQLException {
        Connection connection = DBManager.getConnection();
        String deleteModelSql = "DELETE FROM model WHERE id = ?";
        String deleteSimulationSql = "DELETE FROM simulation WHERE model_id = ?";

        try {
            PreparedStatement deleteSimulationStatement = connection.prepareStatement(deleteSimulationSql);
            deleteSimulationStatement.setInt(1, id);
            deleteSimulationStatement.executeUpdate();
            deleteSimulationStatement.close();

            PreparedStatement statement = connection.prepareStatement(deleteModelSql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } finally {
            if (connection != null) connection.close();
        }
    }


}
