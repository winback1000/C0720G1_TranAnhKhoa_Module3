package DAO;

import models.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GetEmployeeTypeDAO implements IGetEmployeeTypeDAO {
    private static final String SELECT_ALL_POSITION = "SELECT * FROM position;";
    private static final String SELECT_ALL_EDUCATION_DEGREE = "SELECT * FROM education_degree;";
    private static final String SELECT_ALL_DIVISION = "SELECT * FROM division;";
    private static final String SELECT_ALL_USER_TYPE = "SELECT * FROM user;";

    public GetEmployeeTypeDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    protected void closeConnection() {
        try {
            getConnection().close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Position> getPositionList() {
        List<Position> positionList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION))
        {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int key = rs.getInt("position_id");
                String name = rs.getString("position_name");
                positionList.add(new Position(key, name));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return positionList;
    }

    @Override
    public List<Division> getDivisionList() {
        List<Division> divisionList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION))
        {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int key = rs.getInt("division_id");
                String name = rs.getString("division_name");
                divisionList.add(new Division(key, name));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return divisionList;
    }

    @Override
    public List<EducationDegree> getEducationDegreeList() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EDUCATION_DEGREE))
        {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int key = rs.getInt("education_degree_id");
                String name = rs.getString("education_degree_name");
                educationDegreeList.add(new EducationDegree(key, name));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return educationDegreeList;
    }

    @Override
    public List<UserType> getUserTypeList() {
        List<UserType> userTypeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER_TYPE))
        {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String userTypeName = rs.getString("username");
                String userTypePassword = rs.getString("password");
                userTypeList.add(new UserType(userTypeName, userTypePassword));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return userTypeList;
    }
}
