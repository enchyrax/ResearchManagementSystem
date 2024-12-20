package kr.enchyrax.web.rms.dao;

import kr.enchyrax.web.rms.DBManager;
import kr.enchyrax.web.rms.dto.Simulation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SimulationAccessor {

    /**
     * CREATE
     **/
    public void createSimulation(int modelId) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "INSERT INTO simulation (model_id, accuracy) VALUES (?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, modelId);
        statement.setFloat(2, (float) (Math.random() * 100));

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * READ
     **/
    public List<Simulation> readSimulation(int modelId) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "SELECT id, accuracy FROM simulation WHERE model_id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, modelId);

        ResultSet rs = statement.executeQuery();
        List<Simulation> result = new ArrayList<>();

        while (rs.next()) {

            Simulation simulation = new Simulation();
            simulation.setId(rs.getInt("id"));
            simulation.setModelId(modelId);
            simulation.setAccuracy(rs.getFloat("accuracy"));

            result.add(simulation);
        }

        if (statement != null) statement.close();
        if (connection != null) connection.close();

        return result;
    }

    /**
     * UPDATE
     **/
    public void updateSimulation(Simulation simulation) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "UPDATE simulation SET model_id = ?, accuracy = ? WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, simulation.getModelId());
        statement.setFloat(2, simulation.getAccuracy());

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }

    /**
     * DELETE
     **/
    public void deleteSimulation(int id) throws SQLException {
        Connection connection = DBManager.getConnection();
        String sql = "DELETE FROM simulation WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);

        statement.executeUpdate();

        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
}
